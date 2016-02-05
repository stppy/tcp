package py.gov.stp.objetosV2;
import java.sql.Date;

public class Avance {
	protected int id;
	protected String justificacion;
	protected double cantidad;
	protected Date fechaEntrega;
	protected int cantidadBeneficiarios;
	protected int actividadId;
	protected int version;
	protected boolean borrado;
	

	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public String getJustificacion() {
		return justificacion;
	}


	public void setJustificacion(String justificacion) {
		this.justificacion = justificacion;
	}


	public double getCantidad() {
		return cantidad;
	}


	public void setCantidad(double cantidad) {
		this.cantidad = cantidad;
	}


	public Date getFechaEntrega() {
		return fechaEntrega;
	}


	public void setFechaEntrega(Date fechaEntrega) {
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


	public void changeBorrado(boolean borrado) {
		this.borrado = !borrado;
	}

}
