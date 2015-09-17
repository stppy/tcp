package py.gov.stp.objetosV2;

public class Evidencia {
	protected int id;
	protected String nombre;
	protected String descripcion;
	protected int wsId;
	protected boolean borrado;
	
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
	public int getWsId() {
		return wsId;
	}
	public void setWsId(int wsId) {
		this.wsId = wsId;
	}
	public boolean isBorrado() {
		return borrado;
	}
	public void setBorrado(boolean borrado) {
		this.borrado = borrado;
	}
	
	

}
