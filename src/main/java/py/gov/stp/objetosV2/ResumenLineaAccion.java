package py.gov.stp.objetosV2;

import java.math.BigDecimal;
import java.math.BigInteger;
/**
@author          DGTIC - STP
@email			 dgtic@stp.gov.py
*/
public class ResumenLineaAccion {

	protected int 	  	  institucionId;
    protected String  	  institucionSigla;
    protected int 	  	  insOrden;
    protected int     	  lineaAccionId;
    protected String  	  lineaAccionNombre;
    protected int 	  	  lineaAccionTipoId;
    protected int 	  	  lineaAccionEstratagiaId;
    protected int 	  	  lineaAccionUnidadMedidaId;
    protected String  	  lineaAccionUnidadMedidaNombre;
    protected int 	  	  lineaAccionOrden;
    protected boolean 	  lineaAccionAcu;
    protected int 	  	  insLineaAccionId;
    protected int 	  	  insLineaAccionPeriodoId;
    protected double  	  insLineaAccionMeta;
    protected double  	  cantidadProgramada;
    protected double  	  cantDest;
    protected BigDecimal  cantDestinatarioReal;
    protected double  	  inversionEstimada;
    protected double  	  costoAc; 
    protected int 	  	  periodo;
    protected double  	  meta;
    protected int  	 	  departamentoId;
    protected int  	 	  distritoId;
    protected int 		  tipoCronogramaId;
    protected int		  tipoCronogramaRealId;

    
	public int getInstitucionId() {
		return institucionId;
	}
	public void setInstitucionId(int institucionId) {
		this.institucionId = institucionId;
	}
	public String getInstitucionSigla() {
		return institucionSigla;
	}
	public void setInstitucionSigla(String institucionSigla) {
		this.institucionSigla = institucionSigla;
	}
	public int getLineaAccionId() {
		return lineaAccionId;
	}
	public void setLineaAccionId(int lineaAccionId) {
		this.lineaAccionId = lineaAccionId;
	}
	public String getLineaAccionNombre() {
		return lineaAccionNombre;
	}
	public void setLineaAccionNombre(String lineaAccionNombre) {
		this.lineaAccionNombre = lineaAccionNombre;
	}
	public int getLineaAccionTipoId() {
		return lineaAccionTipoId;
	}
	public void setLineaAccionTipoId(int lineaAccionTipoId) {
		this.lineaAccionTipoId = lineaAccionTipoId;
	}
	public int getLineaAccionEstratagiaId() {
		return lineaAccionEstratagiaId;
	}
	public void setLineaAccionEstratagiaId(int lineaAccionEstratagiaId) {
		this.lineaAccionEstratagiaId = lineaAccionEstratagiaId;
	}
	public int getLineaAccionUnidadMedidaId() {
		return lineaAccionUnidadMedidaId;
	}
	public void setLineaAccionUnidadMedidaId(int lineaAccionUnidadMedidaId) {
		this.lineaAccionUnidadMedidaId = lineaAccionUnidadMedidaId;
	}
	public String getLineaAccionUnidadMedidaNombre() {
		return lineaAccionUnidadMedidaNombre;
	}
	public void setLineaAccionUnidadMedidaNombre(
			String lineaAccionUnidadMedidaNombre) {
		this.lineaAccionUnidadMedidaNombre = lineaAccionUnidadMedidaNombre;
	}
	public int getInsLineaAccionId() {
		return insLineaAccionId;
	}
	public void setInsLineaAccionId(int insLineaAccionId) {
		this.insLineaAccionId = insLineaAccionId;
	}
	public int getInsLineaAccionPeriodoId() {
		return insLineaAccionPeriodoId;
	}
	public void setInsLineaAccionPeriodoId(int insLineaAccionPeriodoId) {
		this.insLineaAccionPeriodoId = insLineaAccionPeriodoId;
	}
	public double getInsLineaAccionMeta() {
		return insLineaAccionMeta;
	}
	public void setInsLineaAccionMeta(double insLineaAccionMeta) {
		this.insLineaAccionMeta = insLineaAccionMeta;
	}
	public double getCantidadProgramada() {
		return cantidadProgramada;
	}
	public void setCantidadProgramada(double cantidadProgramada) {
		this.cantidadProgramada = cantidadProgramada;
	}
	public int getInsOrden() {
		return insOrden;
	}
	public void setInsOrden(int insOrden) {
		this.insOrden = insOrden;
	}
	public int getLineaAccionOrden() {
		return lineaAccionOrden;
	}
	public void setLineaAccionOrden(int lineaAccionOrden) {
		this.lineaAccionOrden = lineaAccionOrden;
	}
	public double getCantDest() {
		return cantDest;
	}
	public void setCantDest(double cantDest) {
		this.cantDest = cantDest;
	}
	public double getCostoAc() {
		return costoAc;
	}
	public void setCostoAc(double costoAc) {
		this.costoAc = costoAc;
	}
	public boolean isLineaAccionAcu() {
		return lineaAccionAcu;
	}
	public void setLineaAccionAcu(boolean lineaAccionAcu) {
		this.lineaAccionAcu = lineaAccionAcu;
	}
	public int getPeriodo() {
		return periodo;
	}
	public void setPeriodo(int periodo) {
		this.periodo = periodo;
	}
	public double getMeta() {
		return meta;
	}
	public void setMeta(double meta) {
		this.meta = meta;
	}
	public BigDecimal getCantDestinatarioReal() {
		return cantDestinatarioReal;
	}
	public void setCantDestinatarioReal(BigDecimal cantDestinatarioReal) {
		this.cantDestinatarioReal = cantDestinatarioReal;
	}
	public double getInversionEstimada() {
		return inversionEstimada;
	}
	public void setInversionEstimada(double inversionEstimada) {
		this.inversionEstimada = inversionEstimada;
	}
	public int getDepartamentoId() {
		return departamentoId;
	}
	public void setDepartamentoId(int departamentoId) {
		this.departamentoId = departamentoId;
	}
	public int getDistritoId() {
		return distritoId;
	}
	public void setDistritoId(int distritoId) {
		this.distritoId = distritoId;
	}
	public int getTipoCronogramaId() {
		return tipoCronogramaId;
	}
	public void setTipoCronogramaId(int tipoCronogramaId) {
		this.tipoCronogramaId = tipoCronogramaId;
	}
	public int getTipoCronogramaRealId() {
		return tipoCronogramaRealId;
	}
	public void setTipoCronogramaRealId(int tipoCronogramaRealId) {
		this.tipoCronogramaRealId = tipoCronogramaRealId;
	}
    
	
    

}
