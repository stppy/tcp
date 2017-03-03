package py.gov.stp.objetosV2;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class CronogramaGA {
	private String color = "e62e00";
	private String nombre;
	private String titulo;
	private List<Object> responsables = new ArrayList<Object>();
	private Date fecha_inicio;
	private Date fecha_fin;
	private Date fecha = new Date();
	private String estado;
	private String fuente_de_verificacion;
	private List<EvidenciaGA> anexos = new ArrayList <EvidenciaGA>();
	private String contacto;
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public String getTitulo() {
		return titulo;
	}
	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}
	public List<Object> getResponsables() {
		return responsables;
	}
	public void setResponsables(List<Object> responsables) {
		this.responsables = responsables;
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
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	
	
}
