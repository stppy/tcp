package py.gov.stp.objetosV2;
/**
@author          DGTIC - STP
@email			 dgtic@stp.gov.py
*/
public class InstitucionGA {
	protected int accionId;
	protected int institucionId;
	protected int version;
	protected Boolean borrado;
	public int getAccionId() {
		return accionId;
	}
	public void setAccionId(int accionId) {
		this.accionId = accionId;
	}
	public int getInstitucionId() {
		return institucionId;
	}
	public void setInstitucionId(int institucionId) {
		this.institucionId = institucionId;
	}
	public int getVersion() {
		return version;
	}
	public void setVersion(int version) {
		this.version = version;
	}
	public Boolean getBorrado() {
		return borrado;
	}
	public void setBorrado(Boolean borrado) {
		this.borrado = borrado;
	}
}
