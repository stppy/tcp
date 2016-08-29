package py.gov.stp.objetosV2;
import java.sql.Date;

public class Programacion {
	protected int id;
	protected double cantidad;
	protected String fechaEntrega;
	protected int actividad;
	protected int version;
	protected boolean borrado;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public double getCantidad() {
		return cantidad;
	}
	public void setCantidad(double cantidad) {
		this.cantidad = cantidad;
	}
	public String getFechaEntrega() {
		return fechaEntrega;
	}
	public void setFechaEntrega(String fechaEntrega) {
		this.fechaEntrega = fechaEntrega;
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
	public void changeBorrado(){
		this.borrado=!borrado;
	}

}
