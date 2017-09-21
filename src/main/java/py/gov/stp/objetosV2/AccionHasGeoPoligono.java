package py.gov.stp.objetosV2;

import java.sql.Date;
/**
@author          DGTIC - STP
@email			 dgtic@stp.gov.py
*/
public class AccionHasGeoPoligono {
	protected int accionId;
	protected int geoPoligonoId;
	protected int geoPoligonoGeoPoligonoId;
	protected int proporcion;
	protected Date fechaInsercion;
	protected Date fechaActualizacion;	
    protected String usuarioResponsable;
	protected boolean borrado = false;	
	protected int version;
	
	public int getAccionId() {
		return accionId;
	}
	public void setAccionId(int accionId) {
		this.accionId = accionId;
	}
	public int getGeoPoligonoId() {
		return geoPoligonoId;
	}
	public void setGeoPoligonoId(int geoPoligonoId) {
		this.geoPoligonoId = geoPoligonoId;
	}
	public int getGeoPoligonoGeoPoligonoId() {
		return geoPoligonoGeoPoligonoId;
	}
	public void setGeoPoligonoGeoPoligonoId(int geoPoligonoGeoPoligonoId) {
		this.geoPoligonoGeoPoligonoId = geoPoligonoGeoPoligonoId;
	}
	public int getProporcion() {
		return proporcion;
	}
	public void setProporcion(int proporcion) {
		this.proporcion = proporcion;
	}	
	public int getVersion() {
		return version;
	}
	public void setVersion(int version) {
		this.version = version;
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
