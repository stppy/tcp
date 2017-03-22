package py.gov.stp.objetosV2;

import java.util.ArrayList;
import java.util.List;

public class AreasAgaGA {
	protected String name;
	protected String colour = "#39ac39";
	protected List<LineaAccionGA> children = new ArrayList<LineaAccionGA>();
	
	public String getNombre() {
		return name;
	}
	public void setNombre(String name) {
		this.name = name;
	}
	public List<LineaAccionGA> getLineaAccion() {
		return children;
	}
	public void setLineaAccion(List<LineaAccionGA> children) {
		this.children = children;
	}
	
}
