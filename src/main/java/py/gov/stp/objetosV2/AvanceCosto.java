package py.gov.stp.objetosV2;

public class AvanceCosto {
	
protected int id;
protected double monto;
protected int codigoContratacional;
protected int objetoGasto;
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


public int getCodigoContratacional() {
	return codigoContratacional;
}


public void setCodigoContratacional(int codigoContratacional) {
	this.codigoContratacional = codigoContratacional;
}


public int getObjetoGasto() {
	return objetoGasto;
}


public void setObjetoGasto(int objetoGasto) {
	this.objetoGasto = objetoGasto;
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
