package py.gov.stp.tools;

/**
 * 	@author DGTIC-STP
 *  @email  dgtic@stp.gov.py 
 */
public class LineaAccionAcumuladoMesDistrito {
	protected int linea_accion_id;
	protected String linea_accion;
	protected int institucion_id;
	protected String institucion;
	protected String accion_unidad_medida;
	protected String mes;
	protected double cantidad_programada;
	protected double cantidad_ejecutda;
	protected double max_cant_prog_no_acum;
	protected double max_cant_ejec_no_acum;
	protected int distrito_id;
	protected int departamento_id;
	protected String departamento;
	protected String distrito;
	
	
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
	public String getAccion_unidad_medida() {
		return accion_unidad_medida;
	}
	public void setAccion_unidad_medida(String accion_unidad_medida) {
		this.accion_unidad_medida = accion_unidad_medida;
	}
	public String getMes() {
		return mes;
	}
	public void setMes(String mes) {
		this.mes = mes;
	}
	public double getCantidad_programada() {
		return cantidad_programada;
	}
	public void setCantidad_programada(double cantidad_programada) {
		this.cantidad_programada = cantidad_programada;
	}
	public double getCantidad_ejecutda() {
		return cantidad_ejecutda;
	}
	public void setCantidad_ejecutda(double cantidad_ejecutda) {
		this.cantidad_ejecutda = cantidad_ejecutda;
	}
	public int getDistrito_id() {
		return distrito_id;
	}
	public void setDistrito_id(int distrito_id) {
		this.distrito_id = distrito_id;
	}
	public String getDepartamento() {
		return departamento;
	}
	public void setDepartamento(String departamento) {
		this.departamento = departamento;
	}
	public String getDistrito() {
		return distrito;
	}
	public void setDistrito(String distrito) {
		this.distrito = distrito;
	}
	public int getDepartamento_id() {
		return departamento_id;
	}
	public void setDepartamento_id(int departamento_id) {
		this.departamento_id = departamento_id;
	}
	public double getMax_cant_prog_no_acum() {
		return max_cant_prog_no_acum;
	}
	public void setMax_cant_prog_no_acum(double max_cant_prog_no_acum) {
		this.max_cant_prog_no_acum = max_cant_prog_no_acum;
	}
	public double getMax_cant_ejec_no_acum() {
		return max_cant_ejec_no_acum;
	}
	public void setMax_cant_ejec_no_acum(double max_cant_ejec_no_acum) {
		this.max_cant_ejec_no_acum = max_cant_ejec_no_acum;
	}	

}
