package py.gov.stp.objetosV2;

import java.sql.Date;

public class AccionDestinatario {
	protected int  id;
	protected  int cantidad;
	protected String descripcion;
	protected int version=3;
	protected boolean borrado=false;
	protected int beneficiarioTipoId;
	protected int accionId;
	protected int beneficiarioGrupoId;
	protected Date fechaInsercion;
	protected Date fechaActualizacion;	
    protected String usuarioResponsable;

    
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
	public void changeBorrado(){
		this.borrado=!borrado;
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
	public int getBeneficiarioGrupoId() {
		return beneficiarioGrupoId;
	}
	public void setBeneficiarioGrupoId(int beneficiarioGrupoId) {
		this.beneficiarioGrupoId = beneficiarioGrupoId;
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
