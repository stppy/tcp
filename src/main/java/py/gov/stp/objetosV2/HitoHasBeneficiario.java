package py.gov.stp.objetosV2;

public class HitoHasBeneficiario {
	protected int hitoId;
	protected int hitoAccionId;
	protected int beneficiarioId;
	protected boolean borrado = false;
	protected int version;
	
	public int getHitoId() {
		return hitoId;
	}
	public void setHitoId(int hitoId) {
		this.hitoId = hitoId;
	}
	public int getHitoAccionId() {
		return hitoAccionId;
	}
	public void setHitoAccionId(int hitoAccionId) {
		this.hitoAccionId = hitoAccionId;
	}
	public int getBeneficiarioId() {
		return beneficiarioId;
	}
	public void setBeneficiarioId(int beneficiarioId) {
		this.beneficiarioId = beneficiarioId;
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
	
	
	

}
