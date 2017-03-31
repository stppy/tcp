package py.gov.stp.objetosV2;

import java.sql.Date;

public class AccionHasProducto {
	protected int id;
	protected int proporcion;
	protected int accionId;
	protected int sprProductoId;
	protected int nivel;
	protected int entidad;
	protected int tipoPrograma;
	protected int programa;
	protected int subPrograma;
	protected int proyecto;
	protected int anho;
	protected int version;
	protected String unidadMedida;
	protected Double cantidadFisica;
	protected String clase;
	protected Double cantidadFinanciera;
	protected Double totalAsignacion;
	protected Date fechaInsercion;
	protected Date fechaActualizacion;	
    protected String usuarioResponsable;
    protected String prodConcat;
	protected boolean borrado;
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getProporcion() {
		return proporcion;
	}
	public void setProporcion(int proporcion) {
		this.proporcion = proporcion;
	}
	public int getAccionId() {
		return accionId;
	}
	public void setAccionId(int accionId) {
		this.accionId = accionId;
	}
	public int getSprProductoId() {
		return sprProductoId;
	}
	public void setSprProductoId(int sprProductoId) {
		this.sprProductoId = sprProductoId;
	}
	public int getNivel() {
		return nivel;
	}
	public void setNivel(int nivel) {
		this.nivel = nivel;
	}
	public int getEntidad() {
		return entidad;
	}
	public void setEntidad(int entidad) {
		this.entidad = entidad;
	}
	public int getTipoPrograma() {
		return tipoPrograma;
	}
	public void setTipoPrograma(int tipoPrograma) {
		this.tipoPrograma = tipoPrograma;
	}
	public int getPrograma() {
		return programa;
	}
	public void setPrograma(int programa) {
		this.programa = programa;
	}
	public int getSubPrograma() {
		return subPrograma;
	}
	public void setSubPrograma(int subPrograma) {
		this.subPrograma = subPrograma;
	}
	public int getProyecto() {
		return proyecto;
	}
	public void setProyecto(int proyecto) {
		this.proyecto = proyecto;
	}
	public int getAnho() {
		return anho;
	}
	public void setAnho(int anho) {
		this.anho = anho;
	}
	public int getVersion() {
		return version;
	}
	public void setVersion(int version) {
		this.version = version;
	}
	public String getUnidadMedida() {
		return unidadMedida;
	}
	public void setUnidadMedida(String unidadMedida) {
		this.unidadMedida = unidadMedida;
	}
	public Double getCantidadFisica() {
		return cantidadFisica;
	}
	public void setCantidadFisica(Double cantidadFisica) {
		this.cantidadFisica = cantidadFisica;
	}
	public String getClase() {
		return clase;
	}
	public void setClase(String clase) {
		this.clase = clase;
	}
	public Double getCantidadFinanciera() {
		return cantidadFinanciera;
	}
	public void setCantidadFinanciera(Double cantidadFinanciera) {
		this.cantidadFinanciera = cantidadFinanciera;
	}
	public Double getTotalAsignacion() {
		return totalAsignacion;
	}
	public void setTotalAsignacion(Double totalAsignacion) {
		this.totalAsignacion = totalAsignacion;
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
	public String getProdConcat() {
		return prodConcat;
	}
	public void setProdConcat(String prodConcat) {
		this.prodConcat = prodConcat;
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
