package py.gov.stp.objetosV2;

public class BeneficiarioDetalle {
	protected int id;
	protected String valor;
	protected int beneficiarioDetalleClavesId;
	protected int beneficiarioId;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getValor() {
		return valor;
	}
	public void setValor(String valor) {
		this.valor = valor;
	}
	public int getBeneficiarioDetalleClavesId() {
		return beneficiarioDetalleClavesId;
	}
	public void setBeneficiarioDetalleClavesId(int beneficiarioDetalleClaves) {
		this.beneficiarioDetalleClavesId = beneficiarioDetalleClaves;
	}
	public int getBeneficiarioId() {
		return beneficiarioId;
	}
	public void setBeneficiarioId(int beneficiarioId) {
		this.beneficiarioId = beneficiarioId;
	}
	

}
