package py.gov.stp.objetosV2;
/**
@author          DGTIC - STP
@email			 dgtic@stp.gov.py
*/
public class ProductoObjetoGasto {
	
	protected int id;
	protected int accionId;
	protected int nivelId;
	protected int entidadId;
    protected int tiprogramaId;
    protected int programaId;
    protected int subprogramaId;
    protected int proyectoId;
    protected int productoId;
    protected String productoConcat;
    protected boolean borrado=false;
    protected int version;
    protected int codigoObjetoGasto;
    protected int departamento;
    protected int FuenteFinanciamiento;
	protected int OrganismoFinanciador;	    
	protected int pais;
	protected String observacion;
	protected int anho;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getAccionId() {
		return accionId;
	}
	public void setAccionId(int accionId) {
		this.accionId = accionId;
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
	public int getTiprogramaId() {
		return tiprogramaId;
	}
	public void setTiprogramaId(int tiprogramaId) {
		this.tiprogramaId = tiprogramaId;
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
	public int getProductoId() {
		return productoId;
	}
	public void setProductoId(int productoId) {
		this.productoId = productoId;
	}
	public String getProductoConcat() {
		return productoConcat;
	}
	public void setProductoConcat(String productoConcat) {
		this.productoConcat = productoConcat;
	}
	public boolean isBorrado() {
		return borrado;
	}
	public void setBorrado(boolean borrado) {
		this.borrado = borrado;
	}
	public int getVersion() {
		return version;
	}
	public void setVersion(int version) {
		this.version = version;
	}
	public int getCodigoObjetoGasto() {
		return codigoObjetoGasto;
	}
	public void setCodigoObjetoGasto(int codigoObjetoGasto) {
		this.codigoObjetoGasto = codigoObjetoGasto;
	}
	public int getDepartamento() {
		return departamento;
	}
	public void setDepartamento(int departamento) {
		this.departamento = departamento;
	}
	public int getFuenteFinanciamiento() {
		return FuenteFinanciamiento;
	}
	public void setFuenteFinanciamiento(int fuenteFinanciamiento) {
		FuenteFinanciamiento = fuenteFinanciamiento;
	}
	public int getOrganismoFinanciador() {
		return OrganismoFinanciador;
	}
	public void setOrganismoFinanciador(int organismoFinanciador) {
		OrganismoFinanciador = organismoFinanciador;
	}
	public int getPais() {
		return pais;
	}
	public void setPais(int pais) {
		this.pais = pais;
	}
	public String getObservacion() {
		return observacion;
	}
	public void setObservacion(String observacion) {
		this.observacion = observacion;
	}
	public int getAnho() {
		return anho;
	}
	public void setAnho(int anho) {
		this.anho = anho;
	}

}
