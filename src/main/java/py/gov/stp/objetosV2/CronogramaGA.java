package py.gov.stp.objetosV2;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

public class CronogramaGA {
	private String nombre;
	private String titulo;
	private List<String> responsables = new ArrayList<String>();
	private Date fecha_inicio;
	private Date fecha_fin;
	private Date fecha;
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
	public List<String> getResponsables() {
		return responsables;
	}
	public void setResponsables(List<String> responsables) {
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
	
	
}
