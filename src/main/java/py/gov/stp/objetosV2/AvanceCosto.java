package py.gov.stp.objetosV2;

public class AvanceCosto {
	
protected int id;
protected double monto;
protected String codigoContratacion;
protected int objetoGasto;
protected String productoConcat;
protected int avanceId;
protected boolean borrado;


public int getId() {
	return id;
}




public void setId(int id) {
	this.id = id;
}




public double getMonto() {
	return monto;
}




public void setMonto(double monto) {
	this.monto = monto;
}




public String getCodigoContratacion() {
	return codigoContratacion;
}




public void setCodigoContratacion(String codigoContratacion) {
	this.codigoContratacion = codigoContratacion;
}




public int getObjetoGasto() {
	return objetoGasto;
}




public void setObjetoGasto(int objetoGasto) {
	this.objetoGasto = objetoGasto;
}




public String getProductoConcat() {
	return productoConcat;
}




public void setProductoConcat(String productoConcat) {
	this.productoConcat = productoConcat;
}




public int getAvanceId() {
	return avanceId;
}




public void setAvanceId(int avanceId) {
	this.avanceId = avanceId;
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
