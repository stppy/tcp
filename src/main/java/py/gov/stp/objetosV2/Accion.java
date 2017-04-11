package py.gov.stp.objetosV2;
import java.sql.Date;

public class Accion {
	protected int id;
	protected double costo;
	protected double peso;
	protected String fechaInicio;
	protected String fechaFin;
	protected int version;
	protected double meta1;
	protected double meta2;
	protected double meta3;
	protected double meta4;
	protected int insLineaAccionId;
	protected int departamentoId;
	protected int distritoId;
	protected int accionCatalogoId;	
	protected Date fechaInsercion;
	protected Date fechaActualizacion;	
    protected String usuarioResponsable;
    protected boolean borrado;
	
	
    public int getId() {
		return id;
	}



	public void setId(int id) {
		this.id = id;
	}



	public double getCosto() {
		return costo;
	}



	public void setCosto(double costo) {
		this.costo = costo;
	}


	public double getPeso() {
		return peso;
	}



	public void setPeso(double peso) {
		this.peso = peso;
	}



	public String getFechaInicio() {
		return fechaInicio;
	}



	public void setFechaInicio(String fechaInicio) {
		this.fechaInicio = fechaInicio;
	}



	public String getFechaFin() {
		return fechaFin;
	}



	public void setFechaFin(String fechaFin) {
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



	public int getDepartamentoId() {
		return departamentoId;
	}



	public void setDepartamentoId(int departamentoId) {
		this.departamentoId = departamentoId;
	}



	public int getDistritoId() {
		return distritoId;
	}



	public void setDistritoId(int distritoId) {
		this.distritoId = distritoId;
	}



	public int getAccionCatalogoId() {
		return accionCatalogoId;
	}



	public void setAccionCatalogoId(int accionCatalogoId) {
		this.accionCatalogoId = accionCatalogoId;
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
