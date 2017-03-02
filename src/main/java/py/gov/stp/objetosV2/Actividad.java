package py.gov.stp.objetosV2;

public class Actividad {
	private int id;
	private int version;
	private int accionId;
	private int unidadMedidaId;
	private int hitoTipoId;
	private String nombre;
	private String descripcion;
	private Double proporcion;
	private Double peso;
	private Boolean borrado;
	private Boolean acumulable;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getVersion() {
		return version;
	}
	public void setVersion(int version) {
		this.version = version;
	}
	public int getAccionId() {
		return accionId;
	}
	public void setAccionId(int accionId) {
		this.accionId = accionId;
	}
	public int getUnidadMedidaId() {
		return unidadMedidaId;
	}
	public void setUnidadMedidaId(int unidadMedidaId) {
		this.unidadMedidaId = unidadMedidaId;
	}
	public int getHitoTipoId() {
		return hitoTipoId;
	}
	public void setHitoTipoId(int hitoTipoId) {
		this.hitoTipoId = hitoTipoId;
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
	public Double getProporcion() {
		return proporcion;
	}
	public void setProporcion(Double proporcion) {
		this.proporcion = proporcion;
	}
	public Double getPeso() {
		return peso;
	}
	public void setPeso(Double peso) {
		this.peso = peso;
	}
	public Boolean getBorrado() {
		return borrado;
	}
	public void setBorrado(Boolean borrado) {
		this.borrado = borrado;
	}
	public Boolean getAcumulable() {
		return acumulable;
	}
	public void setAcumulable(Boolean acumulable) {
		this.acumulable = acumulable;
	}
		
}
