package py.gov.stp.objetosV2;

import java.sql.Date;
/**
@author          DGTIC - STP
@email			 dgtic@stp.gov.py
*/
public class EvidenciaHasDocumento {
	protected int evidenciaId;
	protected int documentoId;
	protected Date fechaInsercion;
	protected Date fechaActualizacion;	
    protected String usuarioResponsable;
	
	public int getEvidenciaId() {
		return evidenciaId;
	}
	public void setEvidenciaId(int evidenciaId) {
		this.evidenciaId = evidenciaId;
	}
	public int getDocumentoId() {
		return documentoId;
	}
	public void setDocumentoId(int documentoId) {
		this.documentoId = documentoId;
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
