package py.gov.stp.objetosV2;
import java.sql.Date;

public class Accion {
	protected int id;
	protected String nombre;
	protected String descripcion;
	protected double costo;
	protected int peso;
	protected Date fechaInicio;
	protected Date fechaFin;
	protected int version;
	protected double meta1;
	protected double meta2;
	protected double meta3;
	protected double meta4;
	protected int insLineaAccionId;
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
	public double getCosto() {
		return costo;
	}
	public void setCosto(double costo) {
		this.costo = costo;
	}
	public int getPeso() {
		return peso;
	}
	public void setPeso(int peso) {
		this.peso = peso;
	}
	public Date getFechaInicio() {
		return fechaInicio;
	}
	public void setFechaInicio(Date fechaInicio) {
		this.fechaInicio = fechaInicio;
	}
	public Date getFechaFin() {
		return fechaFin;
	}
	public void setFechaFin(Date fechaFin) {
		this.fechaFin = fechaFin;
	}
	public int getVersion() {
		return version;
	}
	public void setVersion(int version) {
		this.version = version;
	}
	public double getMeta1() {
		return meta1;
	}
	public void setMeta1(double meta1) {
		this.meta1 = meta1;
	}
	public double getMeta2() {
		return meta2;
	}
	public void setMeta2(double meta2) {
		this.meta2 = meta2;
	}
	public double getMeta3() {
		return meta3;
	}
	public void setMeta3(double meta3) {
		this.meta3 = meta3;
	}
	public double getMeta4() {
		return meta4;
	}
	public void setMeta4(double meta4) {
		this.meta4 = meta4;
	}
	
	public int getInsLineaAccionId() {
		return insLineaAccionId;
	}
	public void setInsLineaAccionId(int insLineaAccionId) {
		this.insLineaAccionId = insLineaAccionId;
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
