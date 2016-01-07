package py.gov.stp.objetosV2;

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
	protected int producto;
	protected int anho;
	protected int version;
	protected boolean borrado=false;
	
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
	public int getProducto() {
		return producto;
	}
	public void setProducto(int producto) {
		this.producto = producto;
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
