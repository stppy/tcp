package py.gov.stp.objetosV2;

public class Evidencia {
	protected int id;
	protected String nombre;
	protected String descripcion;
	protected String url;
	protected int wsId;
	protected int version;
	protected boolean borrado;
	protected int avanceId;
	protected String urlDocumento;

	
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
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public int getWsId() {
		return wsId;
	}
	public void setWsId(int wsId) {
		this.wsId = wsId;
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
	public int getAvanceId() {
		return avanceId;
	}
	public void setAvanceId(int avanceId) {
		this.avanceId = avanceId;
	}
	public void changeBorrado(){
		this.borrado=!borrado;
	}
	public String getUrlDocumento() {
		return urlDocumento;
	}
	public void setUrlDocumento(String urlDocumento) {
		this.urlDocumento = urlDocumento;
	}	
}
