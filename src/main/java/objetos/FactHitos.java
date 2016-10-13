package objetos;

import java.sql.Date;

public class FactHitos {
	
	protected int linea_estrategica_id;
	protected String linea_estrategica ;
	protected int linea_accion_tipo_id ;
	protected String linea_accion_tipo;
	protected int linea_accion_id;
	protected String linea_accion;
	protected int institucion_id;
	protected String institucion;
	protected int accion_id;
	protected String accion;
	protected double cantidad ;
	protected String accion_unidad_edida;
	protected double accion_costo ;
	protected int accion_departamento_id;
	protected String accion_departamento;
	protected int accion_distrito_id;
	protected String accion_distrito ;
	protected Date accion_fecha_inicio;
	protected Date accion_fecha_entrega;
	protected char accion_status_fin;
	protected double accion_avance_programado;
	protected double accion_avance_ejecutado;
	protected double accion_cantidad_hito;
	protected int hito_id;
	protected String hito;
	protected Date hito_fecha_entrega ;
	protected int hito_porcentaje_programado;
	protected int hito_porcentaje_ejecutado;
	protected double hito_cantidad_programado;
	protected double hito_cantidad_ejecutado;
	protected double hito_costo_programado;
	protected double hito_costo_ejecutado;
	protected String hito_comentario_aprob;
	protected char hito_status;
	protected int hito_total_doc;
	
	public int getLinea_estrategica_id() {
		return linea_estrategica_id;
	}
	public void setLinea_estrategica_id(int linea_estrategica_id) {
		this.linea_estrategica_id = linea_estrategica_id;
	}
	public String getLinea_estrategica() {
		return linea_estrategica;
	}
	public void setLinea_estrategica(String linea_estrategica) {
		this.linea_estrategica = linea_estrategica;
	}
	public int getLinea_accion_tipo_id() {
		return linea_accion_tipo_id;
	}
	public void setLinea_accion_tipo_id(int linea_accion_tipo_id) {
		this.linea_accion_tipo_id = linea_accion_tipo_id;
	}
	public String getLinea_accion_tipo() {
		return linea_accion_tipo;
	}
	public void setLinea_accion_tipo(String linea_accion_tipo) {
		this.linea_accion_tipo = linea_accion_tipo;
	}
	public int getLinea_accion_id() {
		return linea_accion_id;
	}
	public void setLinea_accion_id(int linea_accion_id) {
		this.linea_accion_id = linea_accion_id;
	}
	public String getLinea_accion() {
		return linea_accion;
	}
	public void setLinea_accion(String linea_accion) {
		this.linea_accion = linea_accion;
	}
	public int getInstitucion_id() {
		return institucion_id;
	}
	public void setInstitucion_id(int institucion_id) {
		this.institucion_id = institucion_id;
	}
	public String getInstitucion() {
		return institucion;
	}
	public void setInstitucion(String institucion) {
		this.institucion = institucion;
	}
	public int getAccion_id() {
		return accion_id;
	}
	public void setAccion_id(int accion_id) {
		this.accion_id = accion_id;
	}
	public String getAccion() {
		return accion;
	}
	public void setAccion(String accion) {
		this.accion = accion;
	}
	public double getCantidad() {
		return cantidad;
	}
	public void setCantidad(double cantidad) {
		this.cantidad = cantidad;
	}
	public String getAccion_unidad_edida() {
		return accion_unidad_edida;
	}
	public void setAccion_unidad_edida(String accion_unidad_edida) {
		this.accion_unidad_edida = accion_unidad_edida;
	}
	public double getAccion_costo() {
		return accion_costo;
	}
	public void setAccion_costo(double accion_costo) {
		this.accion_costo = accion_costo;
	}
	public int getAccion_departamento_id() {
		return accion_departamento_id;
	}
	public void setAccion_departamento_id(int accion_departamento_id) {
		this.accion_departamento_id = accion_departamento_id;
	}
	public String getAccion_departamento() {
		return accion_departamento;
	}
	public void setAccion_departamento(String accion_departamento) {
		this.accion_departamento = accion_departamento;
	}
	public int getAccion_distrito_id() {
		return accion_distrito_id;
	}
	public void setAccion_distrito_id(int accion_distrito_id) {
		this.accion_distrito_id = accion_distrito_id;
	}
	public String getAccion_distrito() {
		return accion_distrito;
	}
	public void setAccion_distrito(String accion_distrito) {
		this.accion_distrito = accion_distrito;
	}
	public Date getAccion_fecha_inicio() {
		return accion_fecha_inicio;
	}
	public void setAccion_fecha_inicio(Date accion_fecha_inicio) {
		this.accion_fecha_inicio = accion_fecha_inicio;
	}
	public Date getAccion_fecha_entrega() {
		return accion_fecha_entrega;
	}
	public void setAccion_fecha_entrega(Date accion_fecha_entrega) {
		this.accion_fecha_entrega = accion_fecha_entrega;
	}
	public char getAccion_status_fin() {
		return accion_status_fin;
	}
	public void setAccion_status_fin(char accion_status_fin) {
		this.accion_status_fin = accion_status_fin;
	}
	public double getAccion_avance_programado() {
		return accion_avance_programado;
	}
	public void setAccion_avance_programado(double accion_avance_programado) {
		this.accion_avance_programado = accion_avance_programado;
	}
	public double getAccion_avance_ejecutado() {
		return accion_avance_ejecutado;
	}
	public void setAccion_avance_ejecutado(double accion_avance_ejecutado) {
		this.accion_avance_ejecutado = accion_avance_ejecutado;
	}
	public double getAccion_cantidad_hito() {
		return accion_cantidad_hito;
	}
	public void setAccion_cantidad_hito(double accion_cantidad_hito) {
		this.accion_cantidad_hito = accion_cantidad_hito;
	}
	public int getHito_id() {
		return hito_id;
	}
	public void setHito_id(int hito_id) {
		this.hito_id = hito_id;
	}
	public String getHito() {
		return hito;
	}
	public void setHito(String hito) {
		this.hito = hito;
	}
	public Date getHito_fecha_entrega() {
		return hito_fecha_entrega;
	}
	public void setHito_fecha_entrega(Date hito_fecha_entrega) {
		this.hito_fecha_entrega = hito_fecha_entrega;
	}
	public int getHito_porcentaje_programado() {
		return hito_porcentaje_programado;
	}
	public void setHito_porcentaje_programado(int hito_porcentaje_programado) {
		this.hito_porcentaje_programado = hito_porcentaje_programado;
	}
	public int getHito_porcentaje_ejecutado() {
		return hito_porcentaje_ejecutado;
	}
	public void setHito_porcentaje_ejecutado(int hito_porcentaje_ejecutado) {
		this.hito_porcentaje_ejecutado = hito_porcentaje_ejecutado;
	}
	public double getHito_cantidad_programado() {
		return hito_cantidad_programado;
	}
	public void setHito_cantidad_programado(double hito_cantidad_programado) {
		this.hito_cantidad_programado = hito_cantidad_programado;
	}
	public double getHito_cantidad_ejecutado() {
		return hito_cantidad_ejecutado;
	}
	public void setHito_cantidad_ejecutado(double hito_cantidad_ejecutado) {
		this.hito_cantidad_ejecutado = hito_cantidad_ejecutado;
	}
	public double getHito_costo_programado() {
		return hito_costo_programado;
	}
	public void setHito_costo_programado(double hito_costo_programado) {
		this.hito_costo_programado = hito_costo_programado;
	}
	public double getHito_costo_ejecutado() {
		return hito_costo_ejecutado;
	}
	public void setHito_costo_ejecutado(double hito_costo_ejecutado) {
		this.hito_costo_ejecutado = hito_costo_ejecutado;
	}
	public String getHito_comentario_aprob() {
		return hito_comentario_aprob;
	}
	public void setHito_comentario_aprob(String hito_comentario_aprob) {
		this.hito_comentario_aprob = hito_comentario_aprob;
	}
	public char getHito_status() {
		return hito_status;
	}
	public void setHito_status(char hito_status) {
		this.hito_status = hito_status;
	}
	public int getHito_total_doc() {
		return hito_total_doc;
	}
	public void setHito_total_doc(int hito_total_doc) {
		this.hito_total_doc = hito_total_doc;
	}
	

	
	

}
