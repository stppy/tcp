package py.gov.stp.objetosV2;

public class AvanceCualitativo {
	protected int id;
	protected int accionCatalogoId;
	protected int insLineaAccionId;
	protected int trimestreId;
	protected String gestionesRealizadas;
	protected String principalesLogrosAlcanzados;
	protected String dificultadesLeccionesAprendidas;
	protected String objetivosTrimestre;
	protected boolean borrado;
	
	public void setId(int id) {
		this.id = id;
	}
	public int getAccionCatalogoId() {
		return accionCatalogoId;
	}
	public void setAccionCatalogoId(int accionCatalogoId) {
		this.accionCatalogoId = accionCatalogoId;
	}
	public int getInsLineaAccionId() {
		return insLineaAccionId;
	}
	public void setInsLineaAccionId(int insLineaAccionId) {
		this.insLineaAccionId = insLineaAccionId;
	}
	public int getTrimestreId() {
		return trimestreId;
	}
	public void setTrimestreId(int trimestreId) {
		this.trimestreId = trimestreId;
	}
	public String getGestionesRealizadas() {
		return gestionesRealizadas;
	}
	public void setGestionesRealizadas(String gestionesRealizadas) {
		this.gestionesRealizadas = gestionesRealizadas;
	}
	public String getPrincipalesLogrosAlcanzados() {
		return principalesLogrosAlcanzados;
	}
	public void setPrincipalesLogrosAlcanzados(String principalesLogrosAlcanzados) {
		this.principalesLogrosAlcanzados = principalesLogrosAlcanzados;
	}
	public String getDificultadesLeccionesAprendidas() {
		return dificultadesLeccionesAprendidas;
	}
	public void setDificultadesLeccionesAprendidas(
			String dificultadesLeccionesAprendidas) {
		this.dificultadesLeccionesAprendidas = dificultadesLeccionesAprendidas;
	}
	public String getObjetivosTrimestre() {
		return objetivosTrimestre;
	}
	public void setObjetivosTrimestre(String objetivosTrimestre) {
		this.objetivosTrimestre = objetivosTrimestre;
	}
	public boolean isBorrado() {
		return borrado;
	}
	public void setBorrado(boolean borrado) {
		this.borrado = borrado;
	}
	public int getId() {
		return id;
	}
	public void changeBorrado(){
		this.borrado=!borrado;
	}	

}
