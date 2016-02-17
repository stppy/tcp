package py.gov.stp.objetosV2;

public class Beneficiario {
	protected int id;
	protected String nombre;
	protected String descripcion;
	protected int tipoId;
	protected int version;
	protected boolean borrado;
	protected int cantidad;
	protected int avanceId;
	protected int grupoId;
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
	public int getTipoId() {
		return tipoId;
	}
	public void setTipoId(int tipoId) {
		this.tipoId = tipoId;
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
	public int getCantidad() {
		return cantidad;
	}
	public void setCantidad(int cantidad) {
		this.cantidad = cantidad;
	}
	public int getAvanceId() {
		return avanceId;
	}
	public void setAvanceId(int avanceId) {
		this.avanceId = avanceId;
	}
	public int getGrupoId() {
		return grupoId;
	}
	public void setGrupoId(int grupoId) {
		this.grupoId = grupoId;
	}
	public void changeBorrado(){
		this.borrado=!borrado;
	}
	

}
