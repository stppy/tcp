package py.gov.stp.objetosV2;
/**
@author          DGTIC - STP
@email			 dgtic@stp.gov.py
*/
public class Producto {
	protected int id=0;
	protected String nombre="";
	protected String descripcion="";
	protected String clase="";
	protected int unidad_medida_id=0;

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
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
	public String getClase() {
		return clase;
	}
	public void setClase(String clase) {
		this.clase = clase;
	}
	public int getUnidad_medida_id() {
		return unidad_medida_id;
	}
	public void setUnidad_medida_id(int unidad_medida_id) {
		this.unidad_medida_id = unidad_medida_id;
	}
	
}
