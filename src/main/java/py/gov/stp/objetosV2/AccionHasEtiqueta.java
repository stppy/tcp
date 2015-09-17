package py.gov.stp.objetosV2;

public class AccionHasEtiqueta {
	protected int accionId;
	protected int etiquetaId;
	protected int proporcion;
	protected boolean borrado;
	
	public int getAccionId() {
		return accionId;
	}
	public void setAccionId(int accionId) {
		this.accionId = accionId;
	}
	public int getEtiquetaId() {
		return etiquetaId;
	}
	public void setEtiquetaId(int etiquetaId) {
		this.etiquetaId = etiquetaId;
	}
	public int getProporcion() {
		return proporcion;
	}
	public void setProporcion(int proporcion) {
		this.proporcion = proporcion;
	}
	public boolean isBorrado() {
		return borrado;
	}
	public void setBorrado(boolean borrado) {
		this.borrado = borrado;
	}
	
	

}
