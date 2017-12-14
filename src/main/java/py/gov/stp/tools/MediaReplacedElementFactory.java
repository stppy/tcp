package py.gov.stp.tools;

import java.io.FileInputStream;
import java.io.InputStream;
import java.util.Properties;

import org.apache.commons.io.IOUtils;
import org.w3c.dom.Element;
import org.xhtmlrenderer.extend.FSImage;
import org.xhtmlrenderer.extend.ReplacedElement;
import org.xhtmlrenderer.extend.ReplacedElementFactory;
import org.xhtmlrenderer.extend.UserAgentCallback;
import org.xhtmlrenderer.layout.LayoutContext;
import org.xhtmlrenderer.pdf.ITextFSImage;
import org.xhtmlrenderer.pdf.ITextImageElement;
import org.xhtmlrenderer.render.BlockBox;
import org.xhtmlrenderer.simple.extend.FormSubmissionListener;

import com.lowagie.text.Image;

/**
 * Replaced element para reemplazar elementos con 
 * <tt>&lt;div class="media" data-src="image.png" /></tt> con contenido
 * multimedia real.
 * @author DGTIC-STP
 * @email  dgtic@stp.gov.py 
 */
public class MediaReplacedElementFactory implements ReplacedElementFactory {
    private final ReplacedElementFactory superFactory;
    public static final String TABLERO_PROPERTIES = "global.properties";       
    
    public MediaReplacedElementFactory(ReplacedElementFactory superFactory) {
        this.superFactory = superFactory;
    }
    
    public ReplacedElement createReplacedElement(LayoutContext layoutContext, BlockBox blockBox, UserAgentCallback userAgentCallback, int cssWidth, int cssHeight) {
    	Element element = blockBox.getElement();
        if (element == null) {
            return null;
        }
        String nodeName = element.getNodeName();
        //String className = element.getAttribute("class");
        if ("img".equals(nodeName)) {
            if (!element.hasAttribute("src")) {
                throw new RuntimeException("Un elemento <img> no posee el atributo `src` que indica el path del archivo multimedia.");
            }
            InputStream input = null;
            try {
            	Properties properties = TableroUtils.getProperties(TABLERO_PROPERTIES);
                input = new FileInputStream(properties.getProperty("url_base") + element.getAttribute("src"));
                final byte[] bytes = IOUtils.toByteArray(input);
                final Image image = Image.getInstance(bytes);
                final FSImage fsImage = new ITextFSImage(image);
                if (fsImage != null) {
                    if ((cssWidth != -1) || (cssHeight != -1)) {
                        fsImage.scale(cssWidth, cssHeight);
                    }
                    return new ITextImageElement(fsImage);
                }
            } catch (Exception e) {
            	e.printStackTrace();
                throw new RuntimeException("Hubo un problema tratando de leer un grafico embebido.", e);
            } finally {
                IOUtils.closeQuietly(input);
            }
        }
        return this.superFactory.createReplacedElement(layoutContext, blockBox, userAgentCallback, cssWidth, cssHeight);
    }

    public void reset() {
        this.superFactory.reset();
    }

    public void remove(Element e) {
        this.superFactory.remove(e);
    }

    public void setFormSubmissionListener(FormSubmissionListener listener) {
        this.superFactory.setFormSubmissionListener(listener);
    }
	
}