package py.gov.stp.objetosV2;

import java.util.ArrayList;
import java.util.List;

public class LineaAccionGA {
	private int id;
	private String nombre;
	private String color;
	protected List<Accion> acciones = new ArrayList<Accion>();
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}
	public List<Accion> getAcciones() {
		return acciones;
	}
	public void setAcciones(List<Accion> acciones) {
		this.acciones = acciones;
	}
}
