package py.gov.stp.objetosV2;

import java.util.ArrayList;
import java.util.List;

public class LineaAccionGA {
	protected String color = "#ffcc00";
	protected String nombre;
	protected String descripcion;
	protected String otros_ejes = "";
	protected String pnd = "";
	protected String ods = "";
	protected List<AccionGA> acciones = new ArrayList<AccionGA>();
	
	
	public String getColor() {
		return color;
	}
	
	public void setColor(String color) {
		this.color = color;
	}
	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
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
	public String getPnd() {
		return pnd;
	}
	public void setPnd(String pnd) {
		this.pnd = pnd;
	}
	public String getOds() {
		return ods;
	}
	public void setOds(String ods) {
		this.ods = ods;
	}
	public List<AccionGA> getAcciones() {
		return acciones;
	}
	public void setAcciones(List<AccionGA> acciones) {
		this.acciones = acciones;
	}
}
