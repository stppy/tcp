package py.gov.stp.objetosV2;

public class Institucion {
	protected String nombre;
	protected String descripcion;
	protected String sigla;
	protected int nivelId;
	protected int entidadId;
	protected int unidadJerarquicaId;
	protected int unidadResponsableId;
	protected int orden;
	protected boolean borrado;
	
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
	

}
