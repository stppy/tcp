package py.gov.stp.objetosV2;

import java.util.ArrayList;
import java.util.List;

public class LineaAccionGA {
	protected String colour = "#ffcc00";
	protected String name;
	protected String descripcion;
	protected String otros_ejes = "";
	protected List<PndGA> pnd = new ArrayList<PndGA>();
	protected List<OdsGA> ods = new ArrayList<OdsGA>();
	protected List<AccionGA> children = new ArrayList<AccionGA>();
	
	public String getColour() {
		return colour;
	}
	public void setColour(String colour) {
		this.colour = colour;
	}
	public String getNombre() {
		return name;
	}
	public void setNombre(String name) {
		this.name = name;
	}
	public String getDescripcion() {
		return descripcion;
	}
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	public String getOtros_ejes() {
		return otros_ejes;
	}
	public void setOtros_ejes(String otros_ejes) {
		this.otros_ejes = otros_ejes;
	}
	public List<PndGA> getPnd() {
		return pnd;
	}
	public void setPnd(List<PndGA> pnd) {
		this.pnd = pnd;
	}
	public List<OdsGA> getOds() {
		return ods;
	}
	public void setOds(List<OdsGA> ods) {
		this.ods = ods;
	}
	public List<AccionGA> getAcciones() {
		return children;
	}
	public void setAcciones(List<AccionGA> children) {
		this.children = children;
	}
}
