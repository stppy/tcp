package objetos;
/**
@author          DGTIC - STP
@email			 dgtic@stp.gov.py
*/

public class Entidad {
	protected int institucion_id;
	protected String institucion;
	public int getInstitucion_id() {
		return institucion_id;
	}
	public void setInstitucion_id(int institucion_id) {
		this.institucion_id = institucion_id;
	}
	public String getInstitucion() {
		return institucion;
	}
	public void setInstitucion(String institucion) {
		this.institucion = institucion;
	}

}