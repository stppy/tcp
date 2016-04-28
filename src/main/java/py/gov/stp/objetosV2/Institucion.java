package py.gov.stp.objetosV2;

import java.util.Date;

public class Institucion {
	protected int id;
	protected String nombre;
	protected String descripcion;
	protected String sigla;
	protected int orden;
	protected int nivelId;
	protected int entidadId;
	protected int unidadJerarquicaId;
	protected int unidadResponsableId;
	protected int version;
	protected boolean borrado=false;
	protected String abrev;
	protected String baseLegal;
	protected String mision;
	protected String vision;
	protected String diagnostico;
	protected String ruc;
	protected int anho;
	protected Date fechaCreacion;
	protected String politica;
	
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
	public String getSigla() {
		return sigla;
	}
	public void setSigla(String sigla) {
		this.sigla = sigla;
	}
	public int getNivelId() {
		return nivelId;
	}
	public void setNivelId(int nivelId) {
		this.nivelId = nivelId;
	}
	public int getEntidadId() {
		return entidadId;
	}
	public void setEntidadId(int entidadId) {
		this.entidadId = entidadId;
	}
	public int getUnidadJerarquicaId() {
		return unidadJerarquicaId;
	}
	public void setUnidadJerarquicaId(int unidadJerarquicaId) {
		this.unidadJerarquicaId = unidadJerarquicaId;
	}
	public int getUnidadResponsableId() {
		return unidadResponsableId;
	}
	public void setUnidadResponsableId(int unidadResponsableId) {
		this.unidadResponsableId = unidadResponsableId;
	}
	public int getOrden() {
		return orden;
	}
	public void setOrden(int orden) {
		this.orden = orden;
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
	public int getVersion() {
		return version;
	}
	public void setVersion(int version) {
		this.version = version;
	}
	public String getAbrev() {
		return abrev;
	}
	public void setAbrev(String abrev) {
		this.abrev = abrev;
	}
	public String getBaseLegal() {
		return baseLegal;
	}
	public void setBaseLegal(String baseLegal) {
		this.baseLegal = baseLegal;
	}
	public String getMision() {
		return mision;
	}
	public void setMision(String mision) {
		this.mision = mision;
	}
	public String getVision() {
		return vision;
	}
	public void setVision(String vision) {
		this.vision = vision;
	}
	public String getDiagnostico() {
		return diagnostico;
	}
	public void setDiagnostico(String diagnostico) {
		this.diagnostico = diagnostico;
	}
	public String getRuc() {
		return ruc;
	}
	public void setRuc(String ruc) {
		this.ruc = ruc;
	}
	public int getAnho() {
		return anho;
	}
	public void setAnho(int anho) {
		this.anho = anho;
	}
	public Date getFechaCreacion() {
		return fechaCreacion;
	}
	public void setFechaCreacion(Date fechaCreacion) {
		this.fechaCreacion = fechaCreacion;
	}
	public String getPolitica() {
		return politica;
	}
	public void setPolitica(String politica) {
		this.politica = politica;
	}	
	
}
