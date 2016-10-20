package py.gov.stp.objetosV2;

import java.sql.Date;
import java.sql.Timestamp;


public class RespuestasViviendas {

	protected int nroFicha;
	protected Date fechaRealizacion;
	protected int viviendaNro;
	protected int preguntaId;
	protected int respuestaObtenidaId;
	protected String respuesta;
	protected boolean respuestaBoleana;
	protected Timestamp fechaActualizacion;
	protected Timestamp fechaInsercion;
	protected String usuarioResponsable;
	protected boolean borrado;
	
	public int getNroFicha() {
		return nroFicha;
	}
	public void setNroFicha(int nroFicha) {
		this.nroFicha = nroFicha;
	}
	public Date getFechaRealizacion() {
		return fechaRealizacion;
	}
	public void setFechaRealizacion(Date fechaRealizacion) {
		this.fechaRealizacion = fechaRealizacion;
	}
	public int getViviendaNro() {
		return viviendaNro;
	}
	public void setViviendaNro(int viviendaNro) {
		this.viviendaNro = viviendaNro;
	}
	public int getPreguntaId() {
		return preguntaId;
	}
	public void setPreguntaId(int preguntaId) {
		this.preguntaId = preguntaId;
	}
	public int getRespuestaObtenidaId() {
		return respuestaObtenidaId;
	}
	public void setRespuestaObtenidaId(int respuestaObtenidaId) {
		this.respuestaObtenidaId = respuestaObtenidaId;
	}
	public String getRespuesta() {
		return respuesta;
	}
	public void setRespuesta(String respuesta) {
		this.respuesta = respuesta;
	}
	public boolean isRespuestaBoleana() {
		return respuestaBoleana;
	}
	public void setRespuestaBoleana(boolean respuestaBoleana) {
		this.respuestaBoleana = respuestaBoleana;
	}
	public Timestamp getFechaActualizacion() {
		return fechaActualizacion;
	}
	public void setFechaActualizacion(Timestamp fechaActualizacion) {
		this.fechaActualizacion = fechaActualizacion;
	}
	public Timestamp getFechaInsercion() {
		return fechaInsercion;
	}
	public void setFechaInsercion(Timestamp fechaInsercion) {
		this.fechaInsercion = fechaInsercion;
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
	
	
}
