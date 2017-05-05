package py.gov.stp.objetosV2;
/**
@author          DGTIC - STP
@email			 dgtic@stp.gov.py
*/
public class Documentos {
	protected int id;
	protected String nombre;
	protected String url;
	protected boolean borrado;
	protected String fecha;
	protected int tipoId;
	protected String usuarioResponsable;
	protected String descripcion;
	
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
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public boolean isBorrado() {
		return borrado;
	}
	public void setBorrado(boolean borrado) {
		this.borrado = borrado;
	}
	
	public String getFecha() {
		return fecha;
	}
	public void setFecha(String fecha) {
		this.fecha = fecha;
	}
	public int getTipoId() {
		return tipoId;
	}
	public void setTipoId(int tipoId) {
		this.tipoId = tipoId;
	}
	public String getUsuarioResponsable() {
		return usuarioResponsable;
	}
	public void setUsuarioResponsable(String usuarioResponsable) {
		this.usuarioResponsable = usuarioResponsable;
	}
	public String getDescripcion() {
		return descripcion;
	}
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	public void changeBorrado(){
		this.borrado=!borrado;
	}	
}
