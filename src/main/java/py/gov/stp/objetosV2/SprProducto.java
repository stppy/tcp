package py.gov.stp.objetosV2;

public class SprProducto {
	protected int id;
	protected int nivelId;
	protected int entidadId;
	protected int tipoId;
	protected int programaId;
	protected int subprogramaId;
	protected int proyectoId;
	protected int funcionalId;
	protected int unidadResponsableId;
	protected int productoId;
	protected boolean borrado=false;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
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
	public int getTipoId() {
		return tipoId;
	}
	public void setTipoId(int tipoId) {
		this.tipoId = tipoId;
	}
	public int getProgramaId() {
		return programaId;
	}
	public void setProgramaId(int programaId) {
		this.programaId = programaId;
	}
	public int getSubprogramaId() {
		return subprogramaId;
	}
	public void setSubprogramaId(int subprogramaId) {
		this.subprogramaId = subprogramaId;
	}
	public int getProyectoId() {
		return proyectoId;
	}
	public void setProyectoId(int proyectoId) {
		this.proyectoId = proyectoId;
	}
	public int getFuncionalId() {
		return funcionalId;
	}
	public void setFuncionalId(int funcionalId) {
		this.funcionalId = funcionalId;
	}
	public int getUnidadResponsableId() {
		return unidadResponsableId;
	}
	public void setUnidadResponsableId(int unidadResponsableId) {
		this.unidadResponsableId = unidadResponsableId;
	}
	public int getProductoId() {
		return productoId;
	}
	public void setProductoId(int productoId) {
		this.productoId = productoId;
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
