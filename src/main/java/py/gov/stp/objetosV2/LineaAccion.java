package py.gov.stp.objetosV2;

public class LineaAccion {
	protected int id;
	protected String nombre;
	protected String descripcion;
	protected int orden;
	protected int peso;
	protected boolean acumular;
	protected int tipoAccionId;
	protected int estrategiaId;
	protected int unidadMedidaId;
	protected boolean borrado=false;
	
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
	public int getOrden() {
		return orden;
	}
	public void setOrden(int orden) {
		this.orden = orden;
	}
	public int getPeso() {
		return peso;
	}
	public void setPeso(int peso) {
		this.peso = peso;
	}
	public boolean isAcumular() {
		return acumular;
	}
	public void setAcumular(boolean acumular) {
		this.acumular = acumular;
	}
	public int getTipoAccionId() {
		return tipoAccionId;
	}
	public void setTipoAccionId(int tipoAccionId) {
		this.tipoAccionId = tipoAccionId;
	}
	public int getEstrategiaId() {
		return estrategiaId;
	}
	public void setEstrategiaId(int estrategiaId) {
		this.estrategiaId = estrategiaId;
	}
	public int getUnidadMedidaId() {
		return unidadMedidaId;
	}
	public void setUnidadMedidaId(int unidadMedidaId) {
		this.unidadMedidaId = unidadMedidaId;
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
