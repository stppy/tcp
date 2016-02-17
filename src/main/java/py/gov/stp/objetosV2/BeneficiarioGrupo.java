package py.gov.stp.objetosV2;

public class BeneficiarioGrupo {
	protected int id;
	protected int beneficiarioTipoId;
	protected String nombre;
	protected String descripcion;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getBeneficiarioTipoId() {
		return beneficiarioTipoId;
	}
	public void setBeneficiarioTipoId(int beneficiarioTipoId) {
		this.beneficiarioTipoId = beneficiarioTipoId;
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
	

}
