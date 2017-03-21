package py.gov.stp.objetosV2;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

public class LineaAccion {
	protected int id;
	protected String nombre;
	protected String descripcion;
	protected int orden;
	protected int peso;
	protected boolean acumular;
	protected int tipoAccionId;
	protected int estrategiaId;
	protected int unidadMedidaId;
	protected Date fechaInsercion;
	protected Date fechaActualizacion;	
    protected String usuarioResponsable;
	protected boolean borrado=false;
	protected List<Accion> acciones = new ArrayList<Accion>();
	
		
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
	public int getOrden() {
		return orden;
	}
	public void setOrden(int orden) {
		this.orden = orden;
	}
	public int getPeso() {
		return peso;
	}
	public void setPeso(int peso) {
		this.peso = peso;
	}
	public boolean isAcumular() {
		return acumular;
	}
	public void setAcumular(boolean acumular) {
		this.acumular = acumular;
	}
	public int getTipoAccionId() {
		return tipoAccionId;
	}
	public void setTipoAccionId(int tipoAccionId) {
		this.tipoAccionId = tipoAccionId;
	}
	public int getEstrategiaId() {
		return estrategiaId;
	}
	public void setEstrategiaId(int estrategiaId) {
		this.estrategiaId = estrategiaId;
	}
	public int getUnidadMedidaId() {
		return unidadMedidaId;
	}
	public void setUnidadMedidaId(int unidadMedidaId) {
		this.unidadMedidaId = unidadMedidaId;
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
	public List<Accion> getAcciones() {
		return acciones;
	}
	public void setAcciones(List<Accion> acciones) {
		this.acciones = acciones;
	}
	public List<Accion> getAcciones() {
		return acciones;
	}
	public void setAcciones(List<Accion> acciones) {
		this.acciones = acciones;
	}
	
}
