package py.gov.stp.objetosV2;

public class GeoPoligono {
	protected int id;
	protected String nombre;
	protected String descripcion;
	protected String geo;
	protected int geoPoligonoId;
	protected int geoPoligonoTipoId;
	protected boolean borrado = false;
	
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
	public String getGeo() {
		return geo;
	}
	public void setGeo(String geo) {
		this.geo = geo;
	}
	public int getGeoPoligonoId() {
		return geoPoligonoId;
	}
	public void setGeoPoligonoId(int geoPoligonoId) {
		this.geoPoligonoId = geoPoligonoId;
	}
	public int getGeoPoligonoTipoId() {
		return geoPoligonoTipoId;
	}
	public void setGeoPoligonoTipoId(int geoPoligonoTipoId) {
		this.geoPoligonoTipoId = geoPoligonoTipoId;
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
