package py.gov.stp.objetosV2;

public class AccionDestinatario {
	protected int  id;
	protected  int cantidad;
	protected String descripcion;
	protected int version=3;
	protected boolean borrado=false;
	protected int beneficiarioTipoId;
	protected int accionId;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getCantidad() {
		return cantidad;
	}
	public void setCantidad(int cantidad) {
		this.cantidad = cantidad;
	}
	public String getDescripcion() {
		return descripcion;
	}
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	public int getVersion() {
		return version;
	}
	public void setVersion(int version) {
		this.version = version;
	}
	public boolean isBorrado() {
		return borrado;
	}
	public void setBorrado(boolean borrado) {
		this.borrado = borrado;
	}
	public int getBeneficiarioTipoId() {
		return beneficiarioTipoId;
	}
	public void setBeneficiarioTipoId(int beneficiarioTipoId) {
		this.beneficiarioTipoId = beneficiarioTipoId;
	}
	public int getAccionId() {
		return accionId;
	}
	public void setAccionId(int accionId) {
		this.accionId = accionId;
	}


}
