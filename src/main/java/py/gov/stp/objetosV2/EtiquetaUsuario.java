package py.gov.stp.objetosV2;
/**
@author          DGTIC - STP
@email			 dgtic@stp.gov.py
*/
public class EtiquetaUsuario {
	protected int id;
	protected String usuarioCorreo;
	protected int etiquetaId;
	protected String fechaActualizacion;
	protected String fechaInsercion;
	protected String usuarioResponsable;
	protected boolean borrado;

	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUsuarioCorreo() {
		return usuarioCorreo;
	}
	public void setUsuarioCorreo(String usuarioCorreo) {
		this.usuarioCorreo = usuarioCorreo;
	}
	public int getEtiquetaId() {
		return etiquetaId;
	}
	public void setEtiquetaId(int etiquetaId) {
		this.etiquetaId = etiquetaId;
	}
	public String getFechaActualizacion() {
		return fechaActualizacion;
	}
	public void setFechaActualizacion(String fechaActualizacion) {
		this.fechaActualizacion = fechaActualizacion;
	}
	public String getFechaInsercion() {
		return fechaInsercion;
	}
	public void setFechaInsercion(String fechaInsercion) {
		this.fechaInsercion = fechaInsercion;
	}
	public String getUsuarioResponsable() {
		return usuarioResponsable;
	}
	public void setUsuarioResponsable(String usuarioResponsable) {
		this.usuarioResponsable = usuarioResponsable;
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
