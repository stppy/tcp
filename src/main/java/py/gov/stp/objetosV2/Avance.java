package py.gov.stp.objetosV2;
import java.sql.Date;

public class Avance {
	protected int id;
	protected int departamentoId;
	protected int distritoAvance;
	protected String justificacion;
	protected Double cantidad;
	protected String fechaEntrega;
	protected int cantidadBeneficiarios;
	protected int actividadId;
	protected int version;
	protected Date fechaInsercion;
	protected Date fechaActualizacion;	
    protected String usuarioResponsable;
	protected boolean borrado;
	

	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public int getDepartamentoId() {
		return departamentoId;
	}


	public void setDepartamentoId(int departamentoId) {
		this.departamentoId = departamentoId;
	}


	public int getDistritoAvance() {
		return distritoAvance;
	}


	public void setDistritoAvance(int distritoAvance) {
		this.distritoAvance = distritoAvance;
	}


	public String getJustificacion() {
		return justificacion;
	}


	public void setJustificacion(String justificacion) {
		this.justificacion = justificacion;
	}


	public Double getCantidad() {
		return cantidad;
	}


	public void setCantidad(Double cantidad) {
		this.cantidad = cantidad;
	}


	public String getFechaEntrega() {
		return fechaEntrega;
	}


	public void setFechaEntrega(String fechaEntrega) {
		this.fechaEntrega = fechaEntrega;
	}


	public int getCantidadBeneficiarios() {
		return cantidadBeneficiarios;
	}


	public void setCantidadBeneficiarios(int cantidadBeneficiarios) {
		this.cantidadBeneficiarios = cantidadBeneficiarios;
	}


	public int getActividadId() {
		return actividadId;
	}


	public void setActividadId(int actividadId) {
		this.actividadId = actividadId;
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
