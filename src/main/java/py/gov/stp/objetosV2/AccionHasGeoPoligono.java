package py.gov.stp.objetosV2;

public class AccionHasGeoPoligono {
	protected int accionId;
	protected int geoPoligonoId;
	protected int geoPoligonoGeoPoligonoId;
	protected int proporcion;
	protected boolean borrado = false;
	
	public int getAccionId() {
		return accionId;
	}
	public void setAccionId(int accionId) {
		this.accionId = accionId;
	}
	public int getGeoPoligonoId() {
		return geoPoligonoId;
	}
	public void setGeoPoligonoId(int geoPoligonoId) {
		this.geoPoligonoId = geoPoligonoId;
	}
	public int getGeoPoligonoGeoPoligonoId() {
		return geoPoligonoGeoPoligonoId;
	}
	public void setGeoPoligonoGeoPoligonoId(int geoPoligonoGeoPoligonoId) {
		this.geoPoligonoGeoPoligonoId = geoPoligonoGeoPoligonoId;
	}
	public int getProporcion() {
		return proporcion;
	}
	public void setProporcion(int proporcion) {
		this.proporcion = proporcion;
	}
	public boolean isBorrado() {
		return borrado;
	}
	public void setBorrado(boolean borrado) {
		this.borrado = borrado;
	}
	
	

}
