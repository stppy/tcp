package py.gov.stp.objetosV2;
import java.sql.Date;

public class Avance {
	protected int id;
	protected String justificacion;
	protected double cantidad;
	protected Date fechaEntrega;
	protected int objetoGasto;
	protected String codigoContratacion;
	protected double monto;
	protected int actividad;
	protected int version;
	protected boolean borrado=false;
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
	public int getObjetoGasto() {
		return objetoGasto;
	}
	public void setObjetoGasto(int objetoGasto) {
		this.objetoGasto = objetoGasto;
	}
	public String getCodigoContratacion() {
		return codigoContratacion;
	}
	public void setCodigoContratacion(String codigoContratacion) {
		this.codigoContratacion = codigoContratacion;
	}
	public double getMonto() {
		return monto;
	}
	public void setMonto(double monto) {
		this.monto = monto;
	}
	public int getActividad() {
		return actividad;
	}
	public void setActividad(int actividad) {
		this.actividad = actividad;
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

}
