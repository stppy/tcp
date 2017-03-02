package py.gov.stp.objetosV2;

import java.util.ArrayList;
import java.util.List;

public class AccionGA {
	protected int id;
	protected String descripcion;
	protected String nombre;
	protected List<CronogramaGA> cronogramasGA = new ArrayList<CronogramaGA>();
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getDescripcion() {
		return descripcion;
	}
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public List<CronogramaGA> getCronogramasGA() {
		return cronogramasGA;
	}
	public void setCronogramasGA(List<CronogramaGA> cronogramasGA) {
		this.cronogramasGA = cronogramasGA;
	}
	
}
