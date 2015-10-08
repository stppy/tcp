package py.gov.stp.objetosV2;

public class AccionHasProducto {
	protected int id;
	protected int proporcion;
	protected int accionId;
	protected int sprProductoId;
	protected boolean borrado=false;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getProporcion() {
		return proporcion;
	}
	public void setProporcion(int proporcion) {
		this.proporcion = proporcion;
	}
	public int getAccionId() {
		return accionId;
	}
	public void setAccionId(int accionId) {
		this.accionId = accionId;
	}
	public int getSprProductoId() {
		return sprProductoId;
	}
	public void setSprProductoId(int sprProductoId) {
		this.sprProductoId = sprProductoId;
	}
	public boolean isBorrado() {
		return borrado;
	}
	public void setBorrado(boolean borrado) {
		this.borrado = borrado;
	}
	public void changeBorrado(){
		this.borrado=!borrado;
	}	
	
}
