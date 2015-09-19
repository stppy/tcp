package py.gov.stp.objetosV2;

public class Beneficiario {
	protected int id;
	protected String nombre;
	protected String descripcion;
	protected int beneficiarioTipoId;
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
	public int getBeneficiarioTipoId() {
		return beneficiarioTipoId;
	}
	public void setBeneficiarioTipoId(int beneficiarioTipoId) {
		this.beneficiarioTipoId = beneficiarioTipoId;
	}
	public boolean isBorrado() {
		return borrado;
	}
	public void setBorrado(boolean borrado) {
		this.borrado = borrado;
	}
	
	

}
