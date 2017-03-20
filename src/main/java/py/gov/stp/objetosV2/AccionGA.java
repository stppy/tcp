package py.gov.stp.objetosV2;

import java.util.ArrayList;
import java.util.List;

public class AccionGA {
	//protected int id;
	protected String color = "#4d9900";
	protected String nombre;
	protected String descripcion;

	protected List<CronogramaGA> cronogramas = new ArrayList<CronogramaGA>();
	
	/*public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}*/
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
	
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public List<CronogramaGA> getCronogramasGA() {
		return cronogramas;
	}
	public void setCronogramasGA(List<CronogramaGA> cronogramasGA) {
		this.cronogramas = cronogramasGA;
	}
	
	public List<CronogramaGA> getCronogramas() {
		return cronogramas;
	}
	public void setCronogramas(List<CronogramaGA> cronogramas) {
		this.cronogramas = cronogramas;
	}
	
	
}
