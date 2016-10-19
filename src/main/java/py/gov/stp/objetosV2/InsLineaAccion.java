package py.gov.stp.objetosV2;

import java.sql.Date;

public class InsLineaAccion {
	protected int id;
	protected int lineaAccionId;
	protected int institucionId;
	protected int periodoId;
	protected double meta;
	protected int version;
	protected Date fechaInsercion;
	protected Date fechaActualizacion;	
    protected String usuarioResponsable;
	protected boolean borrado=false;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getLineaAccionId() {
		return lineaAccionId;
	}
	public void setLineaAccionId(int lineaAccionId) {
		this.lineaAccionId = lineaAccionId;
	}
	public int getInstitucionId() {
		return institucionId;
	}
	public void setInstitucionId(int institucionId) {
		this.institucionId = institucionId;
	}
	public int getPeriodoId() {
		return periodoId;
	}
	public void setPeriodoId(int periodoId) {
		this.periodoId = periodoId;
	}
	public double getMeta() {
		return meta;
	}
	public void setMeta(double meta) {
		this.meta = meta;
	}
	public boolean isBorrado() {
		return borrado;
	}
	public void setBorrado(boolean borrado) {
		this.borrado = borrado;
	}
	public int getVersion() {
		return version;
	}
	public void setVersion(int version) {
		this.version = version;
	}
	public void changeBorrado(){
		this.borrado=!borrado;
	}
	public Date getFechaInsercion() {
		return fechaInsercion;
	}
	public void setFechaInsercion(Date fechaInsercion) {
		this.fechaInsercion = fechaInsercion;
	}
	public Date getFechaActualizacion() {
		return fechaActualizacion;
	}
	public void setFechaActualizacion(Date fechaActualizacion) {
		this.fechaActualizacion = fechaActualizacion;
	}
	public String getUsuarioResponsable() {
		return usuarioResponsable;
	}
	public void setUsuarioResponsable(String usuarioResponsable) {
		this.usuarioResponsable = usuarioResponsable;
	}	

}
