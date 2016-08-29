package py.gov.stp.tools;
import java.io.IOException;
import java.io.InputStream;
import java.util.*;

public class TableroUtils {

	private static Properties prop = null;
	
	public static Properties getProperties(String propFileName) throws IOException{
		if(prop == null){
			prop = new Properties();
			InputStream bif =  Thread.currentThread().getContextClassLoader().getResourceAsStream(propFileName);
			prop.load(bif);
			bif.close();
		}
        return prop;
	}
}