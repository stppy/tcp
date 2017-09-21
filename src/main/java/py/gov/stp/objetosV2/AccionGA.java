package py.gov.stp.objetosV2;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
/**
@author          DGTIC - STP
@email			 dgtic@stp.gov.py
*/
public class AccionGA {
	protected String colour = "#4d9900";
	protected String name;
	protected String titulo;
	protected List<Object> responsable = new ArrayList<Object>();
	protected Date fecha_inicio;
	protected Date fecha_fin;
	protected Date fecha = new Date();
	private String estado = "";
	private String fuente_de_verificacion = "";
	private List<EvidenciaGA> anexos = new ArrayList <EvidenciaGA>();
	private String contacto = "";
	
	public String getNombre() {
		return name;
	}
	public void setNombre(String name) {
		this.name = name;
	}
	public String getDescripcion() {
		return titulo;
	}
	public void setDescripcion(String titulo) {
		this.titulo = titulo;
	}
	
	public String getColor() {
		return colour;
	}
	public void setColor(String colour) {
		this.colour = colour;
	}
	public List<Object> getResponsables() {
		return responsable;
	}
	public void setResponsables(List<Object> responsable) {
		this.responsable = responsable;
	}
	public Date getFecha_inicio() {
		return fecha_inicio;
	}
	public void setFecha_inicio(Date fecha_inicio) {
		this.fecha_inicio = fecha_inicio;
	}
	public Date getFecha_fin() {
		return fecha_fin;
	}
	public void setFecha_fin(Date fecha_fin) {
		this.fecha_fin = fecha_fin;
	}
	public Date getFecha() {
		return fecha;
	}
	public void setFecha(Date fecha) {
		this.fecha = fecha;
	}
	public String getEstado() {
		return estado;
	}
	public void setEstado(String estado) {
		this.estado = estado;
	}
	public String getFuente_de_verificacion() {
		return fuente_de_verificacion;
	}
	public void setFuente_de_verificacion(String fuente_de_verificacion) {
		this.fuente_de_verificacion = fuente_de_verificacion;
	}
	public List<EvidenciaGA> getAnexos() {
		return anexos;
	}
	public void setAnexos(List<EvidenciaGA> anexos) {
		this.anexos = anexos;
	}
	public String getContacto() {
		return contacto;
	}
	public void setContacto(String contacto) {
		this.contacto = contacto;
	}
}
