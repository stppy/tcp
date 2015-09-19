package py.gov.stp.objetosV2;

public class LineaAccion {
	protected String nombre;
	protected String descripcion;
	protected int orden;
	protected String peso;
	protected boolean acumulador;
	protected int tipoAccionId;
	protected int estrategiaId;
	protected int UnidadMedidaId;
	protected boolean borrado;
	
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
	public String getPeso() {
		return peso;
	}
	public void setPeso(String peso) {
		this.peso = peso;
	}
	public boolean isAcumulador() {
		return acumulador;
	}
	public void setAcumulador(boolean acumulador) {
		this.acumulador = acumulador;
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
		return UnidadMedidaId;
	}
	public void setUnidadMedidaId(int unidadMedidaId) {
		UnidadMedidaId = unidadMedidaId;
	}
	public boolean isBorrado() {
		return borrado;
	}
	public void setBorrado(boolean borrado) {
		this.borrado = borrado;
	}
	
	
	

}
