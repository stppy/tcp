package py.gov.stp.objetosV2;

public class TipoDocumento {
	protected int id;
	protected String nombre;
	protected boolean borrado;
	protected String usuarioResponsable;
	protected String fechaActualizacion;
	protected String fechaInsercion;
	
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
	public boolean isBorrado() {
		return borrado;
	}
	public void setBorrado(boolean borrado) {
		this.borrado = borrado;
	}	
	public void changeBorrado(){
		this.borrado=!borrado;
	}
	public String getUsuarioResponsable() {
		return usuarioResponsable;
	}
	public void setUsuarioResponsable(String usuarioResponsable) {
		this.usuarioResponsable = usuarioResponsable;
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
}
