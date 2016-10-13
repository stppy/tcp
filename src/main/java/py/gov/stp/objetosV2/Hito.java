package py.gov.stp.objetosV2;
import java.sql.Date;

public class Hito {
	protected int id;
	protected String nombre;
	protected String descripcion;
	protected double cantidad;
	protected Date fechaEntrega;
	protected int hitoTipoId;
	protected int accionId;
	protected int evidenciaId;
	protected int unidadMedidaId;
	protected int peso;
	protected boolean borrado=false;
	
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
	public int getHitoTipoId() {
		return hitoTipoId;
	}
	public void setHitoTipoId(int hitoTipoId) {
		this.hitoTipoId = hitoTipoId;
	}
	public int getAccionId() {
		return accionId;
	}
	public void setAccionId(int accionId) {
		this.accionId = accionId;
	}
	public int getEvidenciaId() {
		return evidenciaId;
	}
	public void setEvidenciaId(int evidenciaId) {
		this.evidenciaId = evidenciaId;
	}
	public int getUnidadMedidaId() {
		return unidadMedidaId;
	}
	public void setUnidadMedidaId(int unidadMedidaId) {
		this.unidadMedidaId = unidadMedidaId;
	}
	public int getPeso() {
		return peso;
	}
	public void setPeso(int peso) {
		this.peso = peso;
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
