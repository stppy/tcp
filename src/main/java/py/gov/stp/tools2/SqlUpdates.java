package py.gov.stp.tools2;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;

import py.gov.stp.objetosV2.*;


public class SqlUpdates {

	
	
	public static boolean updateTipoAccion(TipoAccion objeto){
			try {
					Connection conect=ConnectionConfiguration.conectar();
		   			String query = "update tipo_accion set ";
					PreparedStatement update = null;
	
					 
					if(objeto.getNombre()!=null)			    query+= "nombre= ?";
					if(objeto.getDescripcion()!=null)			query+= ", descripcion= ?";
					
	
					query+=" where id = ?";

					int cantCampos =0;
					update = conect.prepareStatement(query);
					if (objeto.getNombre()!=null)  				{    cantCampos++;update.setString (cantCampos, objeto.getNombre());}
					if (objeto.getDescripcion()!=null)			{    cantCampos++;update.setString (cantCampos, objeto.getDescripcion());}
						
			            cantCampos++;
			            update.setInt    (cantCampos , objeto.getId());

			            update.execute();
				    conect.close();
				    return true;
				} catch (SQLException e) {e.printStackTrace(); return false;}
	}
	public static boolean borradoTipoAccion(boolean flagBorrado){
	  	 Connection conect=ConnectionConfiguration.conectar();
	  	 Statement statement = null;
			 String query = "update tipo_accion set borrado=\""+flagBorrado+"\"";	
			 try {
				statement=conect.createStatement();
				statement.execute(query);
			    conect.close();
			    return true;
			} catch (SQLException e) {e.printStackTrace(); return false;}
	}
	
	
	public static boolean updateUnidadMedida(UnidadMedida objeto){
	  	try {
	  	 Connection conect=ConnectionConfiguration.conectar();
	   	 String query = "update unidad_medida set ";
	  	 PreparedStatement update = null;

															
					 if(objeto.getNombre()!=null)			    query+= "nombre= ?";
					 if(objeto.getDescripcion()!=null)			query+= ", descripcion= ?";
					 if(objeto.getSigla()!=null)			 	query+= ", sigla= ?";	
					

					query+=" where id = ?";

					int cantCampos =0;
					update = conect.prepareStatement(query);
					if (objeto.getNombre()!=null)  				{    cantCampos++;update.setString (cantCampos, objeto.getNombre());}
					if (objeto.getDescripcion()!=null)			{    cantCampos++;update.setString (cantCampos, objeto.getDescripcion());}
					if (objeto.getSigla()!=null)					{    cantCampos++;update.setString (cantCampos, objeto.getSigla());}
						
			            cantCampos++;
			            update.setInt    (cantCampos , objeto.getId());

			            update.execute();
					    conect.close();
					    return true;
					} catch (SQLException e) {e.printStackTrace(); return false;}

		}
	public static boolean borradoUnidadMedida(UnidadMedida objeto){
	  	 Connection conect=ConnectionConfiguration.conectar();
	  	 Statement statement = null;
		 objeto.changeBorrado();
			 	  	 
			 String query = "update unidad_medida set borrado='"+objeto.isBorrado()+"'";	
			 
			 query+=" where id ="+objeto.getId(); 
			 try {
				statement=conect.createStatement();
				statement.execute(query);
			    conect.close();
			    return true;
			} catch (SQLException e) {e.printStackTrace(); return false;}
	}	
	
	public static boolean updateLineaEstrategica(LineaEstrategica objeto){
	  	try {             
					Connection conect=ConnectionConfiguration.conectar();
					String	query = "update linea_estrategica set ";
					PreparedStatement update =null;

					if(objeto.getNombre()!=null)      			query+= "nombre= ?";
					if(objeto.getDescripcion()!=null)			query+= ", descripcion= ?";
					if(objeto.getOrden()!=0)					query+= ", orden= ?";
					
					query+=" where id = ?";

					int cantCampos =0;
					update = conect.prepareStatement(query);
					if (objeto.getNombre()!=null)  				{    cantCampos++;update.setString (cantCampos, objeto.getNombre());}
					if (objeto.getDescripcion()!=null)			{    cantCampos++;update.setString (cantCampos, objeto.getDescripcion());}
					if (objeto.getOrden()!=0)					{    cantCampos++;update.setInt (cantCampos, objeto.getOrden());}
						
			            cantCampos++;
			            update.setInt    (cantCampos , objeto.getId());

			            update.execute();
					    conect.close();
					    return true;
			} catch (SQLException e) {e.printStackTrace(); return false;}
		}	
	public static boolean borradoLineaEstrategica(LineaEstrategica objeto){
	  	 Connection conect=ConnectionConfiguration.conectar();
	  	 Statement statement = null;
	  	 	objeto.changeBorrado();
	  	 	
			 String query = "update linea_estrategica set borrado='"+objeto.isBorrado()+"'";
			 
			 query+=" where id ="+objeto.getId(); 
			 try {
				statement=conect.createStatement();
				statement.execute(query);
			    conect.close();
			    return true;
			} catch (SQLException e) {e.printStackTrace(); return false;}
	}	
	
	public static boolean updateLineaAccion(LineaAccion objeto){
		  	try {             
					Connection conect=ConnectionConfiguration.conectar();
					String	query = "update linea_accion set ";
					PreparedStatement update =null;

					if(objeto.getNombre()!=null)      			query+= "nombre= ?";
					if(objeto.getDescripcion()!=null)			query+= ", descripcion= ?";
					if(objeto.getOrden()!=0)					query+= ", orden= ?";
					if(objeto.getPeso()!=0)						query+= ", peso= ?";
					if(objeto.isAcumular()!=false || objeto.isAcumular()!=true)	      		query+= ", acumular= ?";
					if(objeto.getTipoAccionId()!=0)				query+= ", tipo_accion_id= ?";
					if(objeto.getEstrategiaId()!=0)				query+= ", estrategia_id= ?";
					if(objeto.getUnidadMedidaId()!=0)	    	query+= ", unidad_medida_id= ?";
					
					query+=" where id = ?";

					int cantCampos =0;
					update = conect.prepareStatement(query);
					if (objeto.getNombre()!=null)  				{    cantCampos++;update.setString (cantCampos, objeto.getNombre());}
					if (objeto.getDescripcion()!=null)			{    cantCampos++;update.setString (cantCampos, objeto.getDescripcion());}
					if (objeto.getOrden()!=0)					{    cantCampos++;update.setInt (cantCampos, objeto.getOrden());}
					if (objeto.getPeso()!=0)					{    cantCampos++;update.setInt (cantCampos, objeto.getPeso());}
					if (objeto.isAcumular()!=false || objeto.isAcumular()!=true)  			{    cantCampos++;update.setBoolean (cantCampos, objeto.isAcumular());}
					if (objeto.getTipoAccionId()!=0)			{    cantCampos++;update.setInt (cantCampos, objeto.getTipoAccionId());}
					if (objeto.getEstrategiaId()!=0)			{    cantCampos++;update.setInt (cantCampos, objeto.getEstrategiaId());}
					if (objeto.getUnidadMedidaId()!=0)  		{    cantCampos++;update.setInt (cantCampos, objeto.getUnidadMedidaId());}
						
			            cantCampos++;
			            update.setInt    (cantCampos , objeto.getId());

			            update.execute();
					    conect.close();
					    return true;
			} catch (SQLException e) {e.printStackTrace(); return false;}			
		}	
	
	public static boolean borradoLineaAccion(LineaAccion objeto){
	  	 Connection conect=ConnectionConfiguration.conectar();
	  	 Statement statement = null;
		  	objeto.changeBorrado();
	  	 
			 String query = "update linea_accion set borrado='"+objeto.isBorrado()+"'";	
			 
			 query+=" where id ="+objeto.getId(); 
			 try {
				statement=conect.createStatement();
				statement.execute(query);
			    conect.close();
			    return true;
			} catch (SQLException e) {e.printStackTrace(); return false;}
	}		
	
	public static boolean updateInsLineaAccion(InsLineaAccion objeto){
	  	try {             
				Connection conect=ConnectionConfiguration.conectar();
				String	query = "update ins_linea_accion set ";
				PreparedStatement update =null;

				if(objeto.getLineaAccionId()!=0)      	query+= "linea_accion_id= ?";
				if(objeto.getInstitucionId()!=0)		query+= ", institucion_id= ?";
				if(objeto.getPeriodoId()!=0)			query+= ", periodo_id= ?";
				if(objeto.getMeta()!=0)					query+= ", meta= ?";
				if(objeto.getVersion()!=0)	      		query+= ", version= ?";
				
				query+=" where id = ?";

				int cantCampos =0;
				update = conect.prepareStatement(query);
				if (objeto.getLineaAccionId()!=0)  		{    cantCampos++;update.setInt (cantCampos, objeto.getLineaAccionId());}
				if (objeto.getInstitucionId()!=0)		{    cantCampos++;update.setInt (cantCampos, objeto.getInstitucionId());}
				if (objeto.getPeriodoId()!=0)			{    cantCampos++;update.setInt (cantCampos, objeto.getPeriodoId());}
				if (objeto.getMeta()!=0)				{    cantCampos++;update.setDouble (cantCampos, objeto.getMeta());}
				if (objeto.getVersion()!=0)  			{    cantCampos++;update.setInt (cantCampos, objeto.getVersion());}
					
		            cantCampos++;
		            update.setInt    (cantCampos , objeto.getId());

		            update.execute();
				    conect.close();
				    return true;
			} catch (SQLException e) {e.printStackTrace(); return false;}
		}
	public static boolean borradoInsLineaAccion(InsLineaAccion objeto){
	  	 Connection conect=ConnectionConfiguration.conectar();
	  	 Statement statement = null;
		  	objeto.changeBorrado();
	  	 
			 String query = "update ins_linea_accion set borrado='"+objeto.isBorrado()+"'";
			 
			 query+=" where id ="+objeto.getId();
			 try {
				statement=conect.createStatement();
				statement.execute(query);
			    conect.close();
			    return true;
			} catch (SQLException e) {e.printStackTrace(); return false;}
	}		


	public static boolean updateInstitucion(Institucion objeto){
	  	try {             
				Connection conect=ConnectionConfiguration.conectar();
				String	query = "update institucion set ";
				PreparedStatement update =null;

				if(objeto.getNombre()!=null)	      	query+= "nombre= ?";
				if(objeto.getDescripcion()!=null)		query+= ", descripcion= ?";
				if(objeto.getSigla()!=null)				query+= ", sigla= ?";
				if(objeto.getNivelId()!=0)				query+= ", nivel_id= ?";
				if(objeto.getEntidadId()!=0)	      	query+= ", entidad_id= ?";
				if(objeto.getUnidadJerarquicaId()!=0)	query+= ", unidad_jerarquica_id= ?";
				if(objeto.getUnidadResponsableId()!=0)	query+= ", unidad_responsable_id= ?";
				if(objeto.getOrden()!=0)				query+= ", orden= ?";

				query+=" where id = ?";

				int cantCampos =0;
				update = conect.prepareStatement(query);
				if (objeto.getNombre()!=null)  			{    cantCampos++;update.setString (cantCampos, objeto.getNombre());}
				if (objeto.getDescripcion()!=null)		{    cantCampos++;update.setString (cantCampos, objeto.getDescripcion());}
				if (objeto.getSigla()!=null)			{    cantCampos++;update.setString (cantCampos, objeto.getSigla());}
				if (objeto.getNivelId()!=0)				{    cantCampos++;update.setInt (cantCampos, objeto.getNivelId());}
				if (objeto.getEntidadId()!=0)  			{    cantCampos++;update.setInt (cantCampos, objeto.getEntidadId());}
				if (objeto.getUnidadJerarquicaId()!=0)	{    cantCampos++;update.setInt (cantCampos, objeto.getUnidadJerarquicaId());}
				if (objeto.getUnidadResponsableId()!=0)	{    cantCampos++;update.setInt (cantCampos, objeto.getUnidadResponsableId());}
				if (objeto.getOrden()!=0)				{    cantCampos++;update.setInt (cantCampos, objeto.getOrden());}
					
		            cantCampos++;
		            update.setInt    (cantCampos , objeto.getId());

		            update.execute();
				    conect.close();
				    return true;
			} catch (SQLException e) {e.printStackTrace(); return false;}
		}
	public static boolean borradoInstitucion(Institucion objeto){
	  	 Connection conect=ConnectionConfiguration.conectar();
	  	 Statement statement = null;
	  	 objeto.changeBorrado();
		  	 
		 String query = "update institucion set borrado='"+objeto.isBorrado()+"'";	
		 
		 query+=" where id ="+objeto.getId(); 
		 
		 try {
			statement=conect.createStatement();
			statement.execute(query);
		    conect.close();
		    return true;
		 } catch (SQLException e) {e.printStackTrace(); return false;}
	}		
	

	public static boolean updatePeriodo(Periodo objeto) throws ParseException{
	  	try {             
				Connection conect=ConnectionConfiguration.conectar();
				String	query = "update periodo set ";
				PreparedStatement update =null;

				String startDate = objeto.getFechaInicio();
				SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
				java.util.Date date1 = sdf1.parse(startDate);
				java.sql.Date sqlStartDate = new java.sql.Date(date1.getTime());
				String endDate = objeto.getFechaFin();
				SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd");
				java.util.Date date2 = sdf2.parse(endDate);
				java.sql.Date sqlEndDate = new java.sql.Date(date2.getTime());
				
				if(objeto.getNombre()!=null)	      		query+= "nombre= ?";
				if(objeto.getDescripcion()!=null)			query+= ", descripcion= ?";
				if(objeto.getFechaInicio()!=null)			query+= ", fecha_inicio= ?";
				if(objeto.getFechaFin()!=null)				query+= ", fecha_fin= ?";
					
				query+=" where id = ?";

				int cantCampos =0;
				update = conect.prepareStatement(query);
				if (objeto.getNombre()!=null)  				{    cantCampos++;update.setString (cantCampos, objeto.getNombre());}
				if (objeto.getDescripcion()!=null)			{    cantCampos++;update.setString (cantCampos, objeto.getDescripcion());}
				if (objeto.getFechaInicio()!=null)			{    cantCampos++;update.setDate (cantCampos, sqlStartDate);}
				if (objeto.getFechaFin()!=null)				{    cantCampos++;update.setDate (cantCampos, sqlEndDate);}
					
		            cantCampos++;
		            update.setInt    (cantCampos , objeto.getId());

		            update.execute();
				    conect.close();
				    return true;
			} catch (SQLException e) {e.printStackTrace(); return false;}
		}	
	public static boolean borradoPeriodo(Periodo objeto){
		Connection conect=ConnectionConfiguration.conectar();
	  	 Statement statement = null;
		  	objeto.changeBorrado();
	  	 
			 String query = "update periodo set borrado='"+objeto.isBorrado()+"'";
			 
			 query+=" where id ="+objeto.getId();
			 try {
				statement=conect.createStatement();
				statement.execute(query);
			    conect.close();
			    return true;
			} catch (SQLException e) {e.printStackTrace(); return false;}
	}	
	
	
	
	public static boolean updateHitoTipo(HitoTipo objeto){
	  	try {             
				Connection conect=ConnectionConfiguration.conectar();
				String	query = "update hito_tipo set ";
				PreparedStatement update =null;

				if(objeto.getNombre()!=null)	      		query+= "nombre= ?";
				if(objeto.getDescripcion()!=null)			query+= ", descripcion= ?";
					
				query+=" where id = ?";

				int cantCampos =0;
				update = conect.prepareStatement(query);
				if (objeto.getNombre()!=null)  				{    cantCampos++;update.setString (cantCampos, objeto.getNombre());}
				if (objeto.getDescripcion()!=null)			{    cantCampos++;update.setString (cantCampos, objeto.getDescripcion());}
					
		            cantCampos++;
		            update.setInt    (cantCampos , objeto.getId());

		            update.execute();
				    conect.close();
				    return true;
			} catch (SQLException e) {e.printStackTrace(); return false;}	
		}
	
	public static boolean borradoHitoTipo(HitoTipo objeto){
	  	 Connection conect=ConnectionConfiguration.conectar();
	  	 Statement statement = null;
	  	 objeto.changeBorrado();
	  	
			 String query = "update hito_tipo set borrado='"+objeto.isBorrado()+"'";	
			 
			 query+=" where id ="+objeto.getId(); 
			 try {
				statement=conect.createStatement();
				statement.execute(query);
			    conect.close();
			    return true;
			} catch (SQLException e) {e.printStackTrace(); return false;}
	}			
	
	public static boolean updateHito(Hito objeto) throws ParseException{
	  	try {             
				Connection conect=ConnectionConfiguration.conectar();
				String	query = "update hito set ";
				PreparedStatement update =null;

				String startDate = objeto.getFechaEntrega();
				SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
				java.util.Date date = sdf1.parse(startDate);
				java.sql.Date sqlStartDate = new java.sql.Date(date.getTime());
				
				if(objeto.getNombre()!=null)	      		query+= "nombre= ?";
				if(objeto.getDescripcion()!=null)	    	query+= ", descripcion= ?";
				if(objeto.getCantidad()!=0)					query+= ", cantidad= ?";
				if(objeto.getFechaEntrega()!=null)			query+= ", fecha_entrega= ?";
				if(objeto.getHitoTipoId()!=0)				query+= ", hito_tipo_id= ?";
				if(objeto.getAccionId()!=0)					query+= ", accion_id= ?";
				if(objeto.getEvidenciaId()!=0)				query+= ", evidencia_id= ?";
				if(objeto.getUnidadMedidaId()!=0)			query+= ", unidad_medida_id= ?";
				if(objeto.getPeso()!=0)						query+= ", peso= ?";
					
				query+=" where id = ?";

				int cantCampos =0;
				update = conect.prepareStatement(query);
				if (objeto.getNombre()!=null)  				{    cantCampos++;update.setString (cantCampos, objeto.getNombre());}
				if (objeto.getDescripcion()!=null)	   		{    cantCampos++;update.setString (cantCampos, objeto.getDescripcion());}
				if (objeto.getCantidad()!=0)				{    cantCampos++;update.setDouble (cantCampos, objeto.getCantidad());}
				if (objeto.getFechaEntrega()!=null)			{    cantCampos++;update.setDate(cantCampos, sqlStartDate);}
				if (objeto.getHitoTipoId()!=0)				{    cantCampos++;update.setInt (cantCampos, objeto.getHitoTipoId());}
				if (objeto.getAccionId()!=0)				{    cantCampos++;update.setInt (cantCampos, objeto.getAccionId());}
				if (objeto.getEvidenciaId()!=0)				{    cantCampos++;update.setInt (cantCampos, objeto.getEvidenciaId());}
				if (objeto.getUnidadMedidaId()!=0)			{    cantCampos++;update.setInt (cantCampos, objeto.getUnidadMedidaId());}
				if (objeto.getPeso()!=0)					{    cantCampos++;update.setInt (cantCampos, objeto.getPeso());}
					
		            cantCampos++;
		            update.setInt    (cantCampos , objeto.getId());

		            update.execute();
				    conect.close();
				    return true;
			} catch (SQLException e) {e.printStackTrace(); return false;}	
		}
	
public static boolean borradoHito(Hito objeto){
  	 Connection conect=ConnectionConfiguration.conectar();
  	 Statement statement = null;
  	 objeto.changeBorrado();
  	 
  	 String query = "update hito set borrado='"+objeto.isBorrado()+"'";	
			 
	 query+=" where id ="+objeto.getId()+" AND accion_id ="+objeto.getAccionId(); 
	 try {
		statement=conect.createStatement();
		statement.execute(query);
	    conect.close();
	    return true;
	  } catch (SQLException e) {e.printStackTrace(); return false;}
}		


	public static boolean updateAccion(Accion objeto) throws ParseException{
		try {             
			Connection conect=ConnectionConfiguration.conectar();
			String	query = "update accion set ";
			PreparedStatement update =null;
			
			String startDate = objeto.getFechaInicio();
			SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
			java.util.Date date1 = sdf1.parse(startDate);
			java.sql.Date sqlStartDate = new java.sql.Date(date1.getTime());
			String endDate = objeto.getFechaFin();
			SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd");
			java.util.Date date2 = sdf2.parse(endDate);
			java.sql.Date sqlEndDate = new java.sql.Date(date2.getTime());

			if(objeto.getCosto() != 0)      			query+= "costo= ?";
			if(objeto.getPeso() != 0)	    			query+= ", peso= ?";
			if(objeto.getFechaInicio() != null)		 	query+= ", fecha_inicio= ?";
			if(objeto.getFechaFin() != null)    		query+= ", fecha_fin= ?";
			if(objeto.getVersion() != 0)				query+= ", version= ?";
			if(objeto.getMeta1() !=0)					query+= ", meta1= ?";
			if(objeto.getMeta2() !=0)					query+= ", meta2= ?";
			if(objeto.getMeta3() !=0)					query+= ", meta3= ?";
			if(objeto.getMeta4() !=0)					query+= ", meta4= ?";
			if(objeto.getInsLineaAccionId() != 0)		query+= ", ins_linea_accion_id= ?";
			if(objeto.getDepartamentoId() != 0)	   	 	query+= ", depto_id= ?";
			if(objeto.getDistritoId() != 0)				query+= ", dist_id= ?";
			if(objeto.getAccionCatalogoId() != 0)		query+= ", id_accion_catalogo= ?";
			
			query+=" where id = ?";

			int cantCampos =0;
			update = conect.prepareStatement(query);
			if (objeto.getCosto() != 0)  				{    cantCampos++;update.setDouble (cantCampos, objeto.getCosto());}
			if (objeto.getPeso() != 0)	   				{    cantCampos++;update.setInt (cantCampos, objeto.getPeso());}
			if (objeto.getFechaInicio() != null)		{    cantCampos++;update.setDate (cantCampos, sqlStartDate);}
			if (objeto.getFechaFin() != null)	    	{    cantCampos++;update.setDate (cantCampos, sqlEndDate);}
			if (objeto.getVersion() != 0)	    		{    cantCampos++;update.setInt (cantCampos, objeto.getVersion());}
			if (objeto.getMeta1() != 0)	    			{    cantCampos++;update.setDouble (cantCampos, objeto.getMeta1());}
			if (objeto.getMeta2() != 0)	    			{    cantCampos++;update.setDouble (cantCampos, objeto.getMeta2());}
			if (objeto.getMeta3() != 0)	    			{    cantCampos++;update.setDouble (cantCampos, objeto.getMeta3());}
			if (objeto.getMeta4() != 0)	    			{    cantCampos++;update.setDouble (cantCampos, objeto.getMeta4());}
			if (objeto.getInsLineaAccionId() != 0)		{    cantCampos++;update.setInt (cantCampos, objeto.getInsLineaAccionId());}
			if (objeto.getDepartamentoId() != 0)		{    cantCampos++;update.setInt (cantCampos, objeto.getDepartamentoId());}
			if (objeto.getDistritoId() != 0)			{    cantCampos++;update.setInt (cantCampos, objeto.getDistritoId());}
			if (objeto.getAccionCatalogoId() != 0)		{    cantCampos++;update.setInt (cantCampos, objeto.getAccionCatalogoId());}
			
	            cantCampos++;
	            update.setInt    (cantCampos , objeto.getId());

	            update.execute();
			    conect.close();
			    return true;
			} catch (SQLException e) {e.printStackTrace(); return false;}
	}
		
/*		Connection conect=ConnectionConfiguration.conectar();
	   	
	  	 Statement statement = null;
					 String										query = "update accion set ";
					 if(objeto.getCosto() != 0)					query+= "costo="+objeto.getCosto()+"";
					 if(objeto.getPeso() != 0)					query+= ", peso="+objeto.getPeso()+"";
					 if(objeto.getFechaInicio() != null)		query+= ", fecha_inicio='"+objeto.getFechaInicio()+"'";
					 if(objeto.getFechaFin() != null)			query+= ", fecha_fin='"+objeto.getFechaFin()+"'";
					 if(objeto.getVersion() != 0)				query+= ", version="+objeto.getVersion()+"";*/
					 /*if(objeto.getMeta1() != 0)*/					//query+= ", meta1="+objeto.getMeta1()+"";
					 /*if(objeto.getMeta2() != 0)	*/				//query+= ", meta2="+objeto.getMeta2()+"";
					 /*if(objeto.getMeta3() != 0)		*/			//query+= ", meta3="+objeto.getMeta3()+"";
					 /*if(objeto.getMeta4() != 0)	*/				//query+= ", meta4="+objeto.getMeta4()+"";
/*					 if(objeto.getInsLineaAccionId() != 0)		query+= ", ins_linea_accion_id="+objeto.getInsLineaAccionId()+"";
					 if(objeto.getDepartamentoId() != 0)		query+= ", depto_id="+objeto.getDepartamentoId()+"";
					 if(objeto.getDistritoId() != 0)			query+= ", dist_id="+objeto.getDistritoId()+"";
					 if(objeto.getAccionCatalogoId() != 0)		query+= ", id_accion_catalogo="+objeto.getAccionCatalogoId()+"";
					 

					 query+=" where id ="+objeto.getId();

					 try {
						statement=conect.createStatement();
						statement.execute(query);
					    conect.close();
					    return true;
					} catch (SQLException e) {e.printStackTrace(); return false;}*/

//		}
	public static boolean borradoAccion(Accion objeto){
	  	 Connection conect=ConnectionConfiguration.conectar();
	  	 Statement statement = null;
	  	 objeto.changeBorrado();
	  	 
		 String query = "update accion set borrado='"+objeto.isBorrado()+"'";	
		 
		 query+=" where id ="+objeto.getId(); 	
		 try {
			statement=conect.createStatement();
			statement.execute(query);
		    conect.close();
		    return true;
		 }catch (SQLException e) {e.printStackTrace(); return false;}
	}		
	
	public static boolean updateAccionHasProducto(AccionHasProducto objeto){
		  	try {             
				Connection conect=ConnectionConfiguration.conectar();
				String	query = "update accion_has_producto set ";
				PreparedStatement update =null;

				if(objeto.getProporcion()!=0)	      		query+= "proporcion= ?";
				if(objeto.getAccionId()!=0)	    			query+= ", accion_id= ?";
				if(objeto.getSprProductoId()!=0)			query+= ", spr_producto_id= ?";
				
				query+=" where id = ?";

				int cantCampos =0;
				update = conect.prepareStatement(query);
				if (objeto.getProporcion()!=0)  			{    cantCampos++;update.setInt (cantCampos, objeto.getProporcion());}
				if (objeto.getAccionId()!=0)	   			{    cantCampos++;update.setInt (cantCampos, objeto.getAccionId());}
				if (objeto.getSprProductoId()!=0)			{    cantCampos++;update.setInt (cantCampos, objeto.getSprProductoId());}
				
		            cantCampos++;
		            update.setInt    (cantCampos , objeto.getId());

		            update.execute();
				    conect.close();
				    return true;
			} catch (SQLException e) {e.printStackTrace(); return false;}
		}	
	public static boolean borradoAccionHasProducto(AccionHasProducto objeto){
	  	 Connection conect=ConnectionConfiguration.conectar();
	  	 Statement statement = null;
		  	objeto.changeBorrado();
	  	 
			 String query = "update accion_has_producto set borrado='"+objeto.isBorrado()+"'";
			 
			 query+=" where id ="+objeto.getId();
			 try {
				statement=conect.createStatement();
				statement.execute(query);
			    conect.close();
			    return true;
			} catch (SQLException e) {e.printStackTrace(); return false;}
	}
	
	
	public static boolean updateSprProducto(SprProducto objeto){
		try {             
			Connection conect=ConnectionConfiguration.conectar();
			String	query = "update spr_producto set ";
			PreparedStatement update =null;

			if(objeto.getNivelId()!=0)	      		query+= "nivel_id= ?";
			if(objeto.getEntidadId()!=0)	    	query+= ", entidad_id= ?";
			if(objeto.getTipoId()!=0)		   		query+= ", tipo_id= ?";
			if(objeto.getProgramaId()!=0)    		query+= ", progama_id= ?";
			if(objeto.getSubprogramaId()!=0)		query+= ", subprograma_id= ?";
			if(objeto.getProyectoId()!=0)		  	query+= ", proyecto_id= ?";
			if(objeto.getFuncionalId()!=0)	   	 	query+= ", funcional_id= ?";
			if(objeto.getUnidadResponsableId()!=0)	query+= ", unidad_responsable_id= ?";
			if(objeto.getProductoId()!=0)	   		query+= ", producto_id= ?";
			
			query+=" where id = ?";

			int cantCampos =0;
			update = conect.prepareStatement(query);
			if (objeto.getNivelId()!=0)  			{    cantCampos++;update.setInt (cantCampos, objeto.getNivelId());}
			if (objeto.getEntidadId()!=0)	   		{    cantCampos++;update.setInt (cantCampos, objeto.getEntidadId());}
			if (objeto.getTipoId()!=0)		    	{    cantCampos++;update.setInt (cantCampos, objeto.getTipoId());}
			if (objeto.getProgramaId()!=0)	    	{    cantCampos++;update.setInt (cantCampos, objeto.getProgramaId());}
			if (objeto.getSubprogramaId()!=0)	    {    cantCampos++;update.setInt (cantCampos, objeto.getSubprogramaId());}
			if (objeto.getProyectoId()!=0)	    	{    cantCampos++;update.setInt (cantCampos, objeto.getProyectoId());}
			if (objeto.getFuncionalId()!=0)	    	{    cantCampos++;update.setInt (cantCampos, objeto.getFuncionalId());}
			if (objeto.getUnidadResponsableId()!=0)	{    cantCampos++;update.setInt (cantCampos, objeto.getUnidadResponsableId());}
			if (objeto.getProductoId()!=0)	    	{    cantCampos++;update.setInt (cantCampos, objeto.getProductoId());}
			
	            cantCampos++;
	            update.setInt    (cantCampos , objeto.getId());

	            update.execute();
			    conect.close();
			    return true;
			} catch (SQLException e) {e.printStackTrace(); return false;}
		}
	
	public static boolean borradoSprProducto(SprProducto objeto){
	  	 Connection conect=ConnectionConfiguration.conectar();
	  	 Statement statement = null;
	  	 objeto.changeBorrado();
	  	 
		 String query = "update spr_producto set borrado='"+objeto.isBorrado()+"'";	
		 
		 query+=" where id ="+objeto.getId(); 	
		 try {
			statement=conect.createStatement();
			statement.execute(query);
		    conect.close();
		    return true;
		 }catch (SQLException e) {e.printStackTrace(); return false;}
	}	
	
	public static boolean updateWs(Ws objeto){
		try {             
			Connection conect=ConnectionConfiguration.conectar();
			String	query = "update ws set ";
			PreparedStatement update =null;

			if(objeto.getNombre()!=null)	      	query+= "nombre= ?";
			if(objeto.getDescripcion()!=null)	    query+= ", descripcion= ?";
			if(objeto.getUrl()!=null)	   			query+= ", url= ?";
			if(objeto.getMetodo()!=null)    		query+= ", metodo= ?";
			if(objeto.getUsuario()!=null)			query+= ", usuario= ?";
			if(objeto.getPass()!=null)		    	query+= ", pass= ?";
			if(objeto.getIdClave()!=null)	   	 	query+= ", id_clave= ?";
			if(objeto.getIdValor()!=null)	    	query+= ", id_valor= ?";
			if(objeto.getWsTipoId()!=0)	    		query+= ", ws_tipo_id= ?";
			
			query+=" where id = ?";

			int cantCampos =0;
			update = conect.prepareStatement(query);
			if (objeto.getNombre()!=null)   		{    cantCampos++;update.setString (cantCampos, objeto.getNombre());}
			if (objeto.getDescripcion()!=null)	    {    cantCampos++;update.setString (cantCampos, objeto.getDescripcion());}
			if (objeto.getUrl()!=null)	    		{    cantCampos++;update.setString (cantCampos, objeto.getUrl());}
			if (objeto.getMetodo()!=null)	    	{    cantCampos++;update.setString (cantCampos, objeto.getMetodo());}
			if (objeto.getUsuario()!=null)	    	{    cantCampos++;update.setString (cantCampos, objeto.getUsuario());}
			if (objeto.getPass()!=null)	    		{    cantCampos++;update.setString (cantCampos, objeto.getPass());}
			if (objeto.getIdClave()!=null)	    	{    cantCampos++;update.setString (cantCampos, objeto.getIdClave());}
			if (objeto.getIdValor()!=null)	    	{    cantCampos++;update.setString (cantCampos, objeto.getIdValor());}
			if (objeto.getWsTipoId()!=0)	    	{    cantCampos++;update.setInt (cantCampos, objeto.getWsTipoId());}
			
	            cantCampos++;
	            update.setInt    (cantCampos , objeto.getId());

	            update.execute();
			    conect.close();
			    return true;
			} catch (SQLException e) {e.printStackTrace(); return false;}
		}	
	public static boolean borradoWs(Ws objeto){
	  	 Connection conect=ConnectionConfiguration.conectar();
	  	 Statement statement = null;
	  	 objeto.changeBorrado();
	  	 
	  	 String query = "update ws set borrado='"+objeto.isBorrado()+"'";	
				 
		 query+=" where id ="+objeto.getId();	
			 try {
				statement=conect.createStatement();
				statement.execute(query);
			    conect.close();
			    return true;
			} catch (SQLException e) {e.printStackTrace(); return false;}
	}		



	public static boolean updateEvidencia(Evidencia objeto){
		try {             
			Connection conect=ConnectionConfiguration.conectar();
			String	query = "update evidencia set ";
			PreparedStatement update =null;

			if(objeto.getNombre()!=null)	      	query+= "nombre= ?";
			if(objeto.getDescripcion()!=null)	    query+= ", descripcion= ?";
			if(objeto.getWsId()!=0)	    			query+= ", ws_id= ?";
			if(objeto.getUrl()!=null)	   			query+= ", url= ?";
			if(objeto.getUrlDocumento()!=null)		query+= ", url_documento= ?";
			if(objeto.getLatitud()!=0.0)	    	query+= ", latitud= ?";
			if(objeto.getLongitud()!=0.0)	   	 	query+= ", longitud= ?";
			if(objeto.getVersion()!=0l)	    		query+= ", version= ?";
			
			query+=" where id = ?";

			int cantCampos =0;
			update = conect.prepareStatement(query);
			if (objeto.getNombre()!=null)   		{    cantCampos++;update.setString (cantCampos, objeto.getNombre());}
			if (objeto.getDescripcion()!=null)	    {    cantCampos++;update.setString (cantCampos, objeto.getDescripcion());}
			if (objeto.getWsId()!=0)	    		{    cantCampos++;update.setInt (cantCampos, objeto.getWsId());}
			if (objeto.getUrl()!=null)	    		{    cantCampos++;update.setString (cantCampos, objeto.getUrl());}
			if (objeto.getUrlDocumento()!=null)	    {    cantCampos++;update.setString (cantCampos, objeto.getUrlDocumento());}
			if (objeto.getLatitud()!=0.0)	    	{    cantCampos++;update.setDouble (cantCampos, objeto.getLatitud());}
			if (objeto.getLongitud()!=0.0)	    	{    cantCampos++;update.setDouble (cantCampos, objeto.getLongitud());}
			if (objeto.getVersion()!=0l)	    	{    cantCampos++;update.setInt (cantCampos, objeto.getVersion());}
			
	            cantCampos++;
	            update.setInt    (cantCampos , objeto.getId());

	            update.execute();
			    conect.close();
			    return true;
			} catch (SQLException e) {e.printStackTrace(); return false;}
		}
	public static boolean borradoEvidencia(Evidencia objeto){
	  	 Connection conect=ConnectionConfiguration.conectar();
	  	 Statement statement = null;
	  	 objeto.changeBorrado();
	  	 
		 String query = "update evidencia set borrado='"+objeto.isBorrado()+"'";	
		 
		 query+=" where id ="+objeto.getId(); 	
		 try {
			statement=conect.createStatement();
			statement.execute(query);
		    conect.close();
		    return true;
		 }catch (SQLException e) {e.printStackTrace(); return false;}
	}
	
	
	public static boolean updateWsTipo(WsTipo objeto){
		try {             
			Connection conect=ConnectionConfiguration.conectar();
			String	query = "update ws_tipo set ";
			PreparedStatement update =null;

			if(objeto.getNombre()!=null)	      	query+= "nombre= ?";
			if(objeto.getDescripcion()!=null)	    query+= ", descripcion= ?";
			
			query+=" where id = ?";

			int cantCampos =0;
			update = conect.prepareStatement(query);
			if (objeto.getNombre()!=null)   		{    cantCampos++;update.setString (cantCampos, objeto.getNombre());}
			if (objeto.getDescripcion()!=null)	    {    cantCampos++;update.setString (cantCampos, objeto.getDescripcion());}
			
	            cantCampos++;
	            update.setInt    (cantCampos , objeto.getId());

	            update.execute();
			    conect.close();
			    return true;
			} catch (SQLException e) {e.printStackTrace(); return false;} 	
		}
	public static boolean borradoWsTipo(WsTipo objeto){
	  	 Connection conect=ConnectionConfiguration.conectar();
	  	 Statement statement = null;
		 objeto.changeBorrado();
		 	  	 
			 String query = "update ws_tipo set borrado='"+objeto.isBorrado()+"'";
			 
			 query+=" where id ="+objeto.getId(); 
			 try {
				statement=conect.createStatement();
				statement.execute(query);
			    conect.close();
			    return true;
			} catch (SQLException e) {e.printStackTrace(); return false;}
	}		
	
	
	public static boolean updateHitoHasBeneficiario(HitoHasBeneficiario objeto){
		try {             
			Connection conect=ConnectionConfiguration.conectar();
			String	query = "update hito_has_beneficiario set ";
			PreparedStatement update =null;

			if(objeto.getHitoId()!=0)	      			query+= "hito_id= ?";
			if(objeto.getHitoAccionId()!=0)         	query+= ", hito_accion_id= ?";
			if(objeto.getBeneficiarioId()!=0)         	query+= ", beneficiario_id= ?";
			
			query+=" where id = ?";

			int cantCampos =0;
			update = conect.prepareStatement(query);
			if (objeto.getHitoId()!=0)    				{    cantCampos++;update.setInt (cantCampos, objeto.getHitoId());}
			if (objeto.getHitoAccionId()!=0)    		{    cantCampos++;update.setInt (cantCampos, objeto.getHitoAccionId());}
			if (objeto.getBeneficiarioId()!=0)    		{    cantCampos++;update.setInt (cantCampos, objeto.getBeneficiarioId());}
			
	            cantCampos++;
	            update.setInt    (cantCampos , objeto.getHitoId());

	            update.execute();
			    conect.close();
			    return true;
			} catch (SQLException e) {e.printStackTrace(); return false;} 		 
		}
	public static boolean borradoHitoHasBeneficiario(HitoHasBeneficiario objeto){
	  	 Connection conect=ConnectionConfiguration.conectar();
	  	 Statement statement = null;
		  	objeto.changeBorrado();
	  	 
			 String query = "update hito_has_beneficiario set borrado='"+objeto.isBorrado()+"'";	
			 
			 query+=" where hito_id ="+objeto.getHitoId()+" AND hito_accion_id ="+objeto.getHitoAccionId()+" AND beneficiario_id="+objeto.getBeneficiarioId();
			 
			 try {
				statement=conect.createStatement();
				statement.execute(query);
			    conect.close();
			    return true;
			} catch (SQLException e) {e.printStackTrace(); return false;}
	}	
	
	
	public static boolean updateBeneficiarioTipo(BeneficiarioTipo objeto){
		try {             
			Connection conect=ConnectionConfiguration.conectar();
			String	query = "update beneficiario_tipo set ";
			PreparedStatement update =null;

			if(objeto.getNombre()!=null)       			query+= "nombre= ?";
			if(objeto.getDescripcion()!=null)          	query+= ", descripcion= ?";
			
			query+=" where id = ?";

			int cantCampos =0;
			update = conect.prepareStatement(query);
			if (objeto.getNombre()!=null)    			{    cantCampos++;update.setString (cantCampos, objeto.getNombre());}
			if (objeto.getDescripcion()!=null)    		{    cantCampos++;update.setString (cantCampos, objeto.getDescripcion());}
				
	            cantCampos++;
	            update.setInt    (cantCampos , objeto.getId());

	            update.execute();
			    conect.close();
			    return true;
			} catch (SQLException e) {e.printStackTrace(); return false;} 
		}	
	public static boolean borradoBeneficiarioTipo(BeneficiarioTipo objeto){
	  	 Connection conect=ConnectionConfiguration.conectar();
	  	 Statement statement = null;
		 objeto.changeBorrado();
		 	  	 
			 String query = "update beneficiario_tipo set borrado='"+objeto.isBorrado()+"'";
			 
			 query+=" where id ="+objeto.getId(); 
			 try {
				statement=conect.createStatement();
				statement.execute(query);
			    conect.close();
			    return true;
			} catch (SQLException e) {e.printStackTrace(); return false;}
	}		
	
	
	public static boolean updateAccionHasEtiqueta(AccionHasEtiqueta objeto){
		try {             
			Connection conect=ConnectionConfiguration.conectar();
			String	query = "update accion_has_etiqueta set ";
			PreparedStatement update =null;

			if(objeto.getAccionId()!=0)       		query+= "accion_id= ?";
			if(objeto.getEtiquetaId()!=0)          	query+= ", etiqueta_id= ?";
			if(objeto.getProporcion()!=0)         	query+= ", proporcion= ?";
			
			query+=" where id = ?";

			int cantCampos =0;
			update = conect.prepareStatement(query);
			if (objeto.getAccionId()!=0)    		{    cantCampos++;update.setInt (cantCampos, objeto.getAccionId());}
			if (objeto.getEtiquetaId()!=0)    		{    cantCampos++;update.setInt (cantCampos, objeto.getEtiquetaId());}
			if (objeto.getProporcion()!=0)     		{    cantCampos++;update.setInt (cantCampos, objeto.getProporcion());}
				
	            cantCampos++;
	            update.setInt    (cantCampos , objeto.getAccionId());

	            update.execute();
			    conect.close();
			    return true;
			} catch (SQLException e) {e.printStackTrace(); return false;} 
		}
	public static boolean borradoAccionHasEtiqueta(AccionHasEtiqueta objeto){
	  	 Connection conect=ConnectionConfiguration.conectar();
	  	 Statement statement = null;
		  	objeto.changeBorrado();
	  	 
			 String query = "update accion_has_etiqueta set borrado='"+objeto.isBorrado()+"'";	
			 
			 query+=" where accion_id ="+objeto.getAccionId()+" AND etiqueta_id ="+objeto.getEtiquetaId();
			 
			 try {
				statement=conect.createStatement();
				statement.execute(query);
			    conect.close();
			    return true;
			} catch (SQLException e) {e.printStackTrace(); return false;}
	}	
	
	public static boolean updateBeneficiario(Beneficiario objeto){
		try {             
			Connection conect=ConnectionConfiguration.conectar();
			String	query = "update beneficiario set ";
			PreparedStatement update =null;

			if(objeto.getDescripcion()!=null)       query+= "descripcion= ?";
			if(objeto.getTipoId()!=0)            	query+= ", beneficiario_tipo_id= ?";
			if(objeto.getGrupoId()!=0)            	query+= ", beneficiario_grupo_id= ?";
			if(objeto.getCantidad()!=0)            	query+= ", cantidad= ?";

			query+=" where id = ?";

			int cantCampos =0;
			update = conect.prepareStatement(query);
			if (objeto.getDescripcion()!=null)      {    cantCampos++;update.setString (cantCampos, objeto.getDescripcion());}
			if (objeto.getTipoId()!=0)     			{    cantCampos++;update.setInt (cantCampos, objeto.getTipoId());}
			if (objeto.getGrupoId()!=0)      		{    cantCampos++;update.setInt (cantCampos, objeto.getGrupoId());}
			if (objeto.getCantidad()!=0)          	{    cantCampos++;update.setInt (cantCampos, objeto.getCantidad());}
				
	            cantCampos++;
	            update.setInt    (cantCampos , objeto.getId());

	            update.execute();
			    conect.close();
			    return true;
			} catch (SQLException e) {e.printStackTrace(); return false;}
		}	
	public static boolean borradoBeneficiario(Beneficiario objeto){
	  	 Connection conect=ConnectionConfiguration.conectar();
	  	 Statement statement = null;
		 objeto.changeBorrado();
		 	  	 
			 String query = "update beneficiario set borrado='"+objeto.isBorrado()+"'";
			 
			 query+=" where id ="+objeto.getId(); 
			 try {
				statement=conect.createStatement();
				statement.execute(query);
			    conect.close();
			    return true;
			} catch (SQLException e) {e.printStackTrace(); return false;}
	}
	
	public static boolean updateEtiqueta(Etiqueta objeto){
		try {             
			Connection conect=ConnectionConfiguration.conectar();
			String	query = "update etiqueta set ";
			PreparedStatement update =null;

			if(objeto.getNombre()!=null)            query+= "nombre= ?";
			if(objeto.getDescripcion()!=null)       query+= ", descripcion= ?";

			query+=" where id = ?";

			int cantCampos =0;
			update = conect.prepareStatement(query);
			if (objeto.getNombre()!=null)           {    cantCampos++;update.setString (cantCampos, objeto.getNombre());}
			if (objeto.getDescripcion()!=null)      {    cantCampos++;update.setString (cantCampos, objeto.getDescripcion());}
				
	            cantCampos++;
	            update.setInt    (cantCampos , objeto.getId());

	            update.execute();
			    conect.close();
			    return true;
			} catch (SQLException e) {e.printStackTrace(); return false;}
		}	
	public static boolean borradoEtiqueta(Etiqueta objeto){
	  	 Connection conect=ConnectionConfiguration.conectar();
	  	 Statement statement = null;
		 objeto.changeBorrado();
		 	  	 
			 String query = "update etiqueta set borrado='"+objeto.isBorrado()+"'";
			 
			 query+=" where id ="+objeto.getId(); 
			 try {
				statement=conect.createStatement();
				statement.execute(query);
			    conect.close();
			    return true;
			} catch (SQLException e) {e.printStackTrace(); return false;}
	}			
	
	
	public static boolean updateBeneficiarioDetalle(BeneficiarioDetalle objeto){
	  	try{
			Connection conect=ConnectionConfiguration.conectar();
		  	String query = "update beneficiario_detalle set ";
		  	PreparedStatement update =null;

				if(objeto.getValor()!=null)            			query+= "valor= ?";
				if(objeto.getBeneficiarioDetalleClavesId()!=0)	query+= ", beneficiario_detalle_claves_id= ?";
				if(objeto.getBeneficiarioId()!=0)		      	query+= ", beneficiario_id= ?";
					 
				query+=" where id = ?";

				int cantCampos =0;
				update = conect.prepareStatement(query);
				if (objeto.getValor()!=null)           			{    cantCampos++;update.setString (cantCampos, objeto.getValor());}
				if (objeto.getBeneficiarioDetalleClavesId()!=0)	{    cantCampos++;update.setInt (cantCampos, objeto.getBeneficiarioDetalleClavesId());}
				if (objeto.getBeneficiarioId()!=0)	    		{    cantCampos++;update.setInt (cantCampos, objeto.getBeneficiarioId());}
					
		            cantCampos++;
		            update.setInt    (cantCampos , objeto.getId());

		            update.execute();
				    conect.close();
				    return true;
				} catch (SQLException e) {e.printStackTrace(); return false;}
		}	
	public static boolean borradoBeneficiarioDetalle(BeneficiarioDetalle objeto){
	  	 Connection conect=ConnectionConfiguration.conectar();
	  	 Statement statement = null;
		 objeto.changeBorrado();
		 	  	 
			 String query = "update beneficiario_detalle set borrado='"+objeto.isBorrado()+"'";
			 
			 query+=" where id ="+objeto.getId(); 
			 try {
				statement=conect.createStatement();
				statement.execute(query);
			    conect.close();
			    return true;
			} catch (SQLException e) {e.printStackTrace(); return false;}
	}		
	
	
	public static boolean updateBeneficiarioDetalleClave(BeneficiarioDetalleClave objeto){
		try { 
			Connection conect=ConnectionConfiguration.conectar();
		  	String query = "update beneficiario_detalle_clave set ";
		  	PreparedStatement update =null;

			if(objeto.getClave()!=null)				query+= "clave= ?";
			 
			query+=" where id = ?";
			
			int cantCampos =0;
			update = conect.prepareStatement(query);
			if (objeto.getClave()!=null)           {    cantCampos++;update.setString (cantCampos, objeto.getClave());}

				cantCampos++;
	            update.setInt    (cantCampos , objeto.getId());

	            update.execute();
			    conect.close();
			    return true;
			} catch (SQLException e) {e.printStackTrace(); return false;}
		}	
	
	
	public static boolean updateGeoPoligono(GeoPoligono objeto){
		try {             
			Connection conect=ConnectionConfiguration.conectar();
			String	query = "update geo_poligono set ";
			PreparedStatement update =null;

			if(objeto.getNombre()!=null)            query+= "nombre= ?";
			if(objeto.getDescripcion()!=null)       query+= ", descripcion= ?";
			if(objeto.getGeo()!=null)	       		query+= ", geo= ?";
			if(objeto.getGeoPoligonoId()!=0)    	query+= ", geo_poligono_id= ?";
			if(objeto.getGeoPoligonoTipoId()!=0)	query+= ", geo_poligono_tipo_id= ?";

			query+=" where id = ?";

			int cantCampos =0;
			update = conect.prepareStatement(query);
			if (objeto.getNombre()!=null)           {    cantCampos++;update.setString (cantCampos, objeto.getNombre());}
			if (objeto.getDescripcion()!=null)      {    cantCampos++;update.setString (cantCampos, objeto.getDescripcion());}
			if (objeto.getGeo()!=null)      		{    cantCampos++;update.setString (cantCampos, objeto.getGeo());}
			if (objeto.getGeoPoligonoId()!=0)		{    cantCampos++;update.setInt (cantCampos, objeto.getGeoPoligonoId());}
			if (objeto.getGeoPoligonoTipoId()!=0)	{    cantCampos++;update.setInt (cantCampos, objeto.getGeoPoligonoTipoId());}
				
	            cantCampos++;
	            update.setInt    (cantCampos , objeto.getId());

	            update.execute();
			    conect.close();
			    return true;
			} catch (SQLException e) {e.printStackTrace(); return false;}
		}
	public static boolean borradoGeoPoligono(GeoPoligono objeto){
	  	 Connection conect=ConnectionConfiguration.conectar();
	  	 Statement statement = null;
		 objeto.changeBorrado();
		 	  	 
			 String query = "update geo_poligono set borrado='"+objeto.isBorrado()+"'";
			 
			 query+=" where id ="+objeto.getId()+" AND geo_poligono_id="+objeto.getGeoPoligonoId(); 
			 try {
				statement=conect.createStatement();
				statement.execute(query);
			    conect.close();
			    return true;
			} catch (SQLException e) {e.printStackTrace(); return false;}
	}	
	
	
	public static boolean updateAccionHasGeoPoligono(AccionHasGeoPoligono objeto){
		try {             
			Connection conect=ConnectionConfiguration.conectar();
			String	query = "update accion_has_geo_poligono set ";
			PreparedStatement update =null;

			if(objeto.getAccionId()!=0)            		query+= "accion_id= ?";
			if(objeto.getGeoPoligonoId()!=0)       		query+= ", geo_poligono_id= ?";
			if(objeto.getGeoPoligonoGeoPoligonoId()!=0) query+= ", geo_poligono_geo_poligono_id= ?";
			if(objeto.getProporcion()!=0)    			query+= ", proporcion= ?";

			query+=" where id = ?";

			int cantCampos =0;
			update = conect.prepareStatement(query);
			if (objeto.getAccionId()!=0)           		{    cantCampos++;update.setInt (cantCampos, objeto.getAccionId());}
			if (objeto.getGeoPoligonoId()!=0)     		{    cantCampos++;update.setInt (cantCampos, objeto.getGeoPoligonoId());}
			if (objeto.getGeoPoligonoGeoPoligonoId()!=0){    cantCampos++;update.setInt (cantCampos, objeto.getGeoPoligonoGeoPoligonoId());}
			if (objeto.getProporcion()!=0)   			{    cantCampos++;update.setInt (cantCampos, objeto.getProporcion());}
				
	             cantCampos++;
	             update.setInt    (cantCampos , objeto.getAccionId());

	            update.execute();
			    conect.close();
			    return true;
			} catch (SQLException e) {e.printStackTrace(); return false;}
		}
	public static boolean borradoAccionHasGeoPoligono(AccionHasGeoPoligono objeto){
	  	 Connection conect=ConnectionConfiguration.conectar();
	  	 Statement statement = null;
		 objeto.changeBorrado();
		 	  	 
			 String query = "update accion_has_geo_poligono set borrado='"+objeto.isBorrado()+"'";
			 
			 query+=" where accion_id ="+objeto.getAccionId()+" AND geo_poligono_id="+objeto.getGeoPoligonoId()+" AND geo_poligono_geo_poligono_id="+objeto.getGeoPoligonoGeoPoligonoId(); 
			 try {
				statement=conect.createStatement();
				statement.execute(query);
			    conect.close();
			    return true;
			} catch (SQLException e) {e.printStackTrace(); return false;}
	}
	
	
	public static boolean updateGeoPoligonoTipo(GeoPoligonoTipo objeto){
		try {             
			Connection conect=ConnectionConfiguration.conectar();
			String query = "update geo_poligono_tipo set ";
			PreparedStatement update =null;

			if(objeto.getNombre()!=null)	  			query+= "nombre= ?";
			if(objeto.getDescripcion()!=null)           query+= ", descripcion= ?";
			

			query+=" where id = ?";

			int cantCampos =0;
			update = conect.prepareStatement(query);
			if (objeto.getNombre()!=null)   			{    cantCampos++;update.setString(cantCampos, objeto.getNombre());}
			if (objeto.getDescripcion()!=null)          {    cantCampos++;update.setString(cantCampos, objeto.getDescripcion());}
							
	             cantCampos++;
	             update.setInt    (cantCampos , objeto.getId());

	             		update.execute();
					    conect.close();
					    return true;
					} catch (SQLException e) {e.printStackTrace(); return false;}
		}
	public static boolean borradoGeoPoligonoTipo(GeoPoligonoTipo objeto){
	  	 Connection conect=ConnectionConfiguration.conectar();
	  	 Statement statement = null;
		  	objeto.changeBorrado();
	  	 
			 String query = "update geo_poligono_tipo set borrado='"+objeto.isBorrado()+"'";
			 
			 query+=" where id ="+objeto.getId();
			 try {
				statement=conect.createStatement();
				statement.execute(query);
			    conect.close();
			    return true;
			} catch (SQLException e) {e.printStackTrace(); return false;}
	}	
	
	
	public static boolean updateAccionCatalogo(AccionCatalogo objeto){
		try {             
			Connection conect=ConnectionConfiguration.conectar();
			String	query = "update accion_catalogo set ";
			PreparedStatement update =null;

			if(objeto.getNombre()!=null)            query+= "nombre= ?";
			if(objeto.getDescripcion()!=null)       query+= "descripcion= ?";
			if(objeto.getIdUnidadMedida()!=0)       query+= "id_unidad_medida= ?";
			if(objeto.getVersion()!=0)     			query+= "version= ?";
			if(objeto.isBorrado()!=false)   		query+= ", borrado= ?";

			query+=" where id = ?";

			int cantCampos =0;
			update = conect.prepareStatement(query);
			if (objeto.getNombre()!=null)           {    cantCampos++;update.setString (cantCampos, objeto.getNombre());}
			if (objeto.getDescripcion()!=null)      {    cantCampos++;update.setString (cantCampos, objeto.getDescripcion());}
			if (objeto.getIdUnidadMedida()!=0)      {    cantCampos++;update.setInt (cantCampos, objeto.getIdUnidadMedida());}
			if (objeto.getVersion()!=0)     		{    cantCampos++;update.setInt (cantCampos, objeto.getVersion());}
			if (objeto.isBorrado()!=false)  		{    cantCampos++;update.setBoolean (cantCampos, objeto.isBorrado());}
				
	             cantCampos++;
	             update.setInt    (cantCampos , objeto.getId());

	            update.execute();
			    conect.close();
			    return true;
			} catch (SQLException e) {e.printStackTrace(); return false;}
		}
	
	
	public static boolean updateCronograma(Cronograma objeto){
		try {             
			Connection conect=ConnectionConfiguration.conectar();
			String query = "update actividad set ";
			PreparedStatement update =null;

			if(objeto.getNombre()!=null)            query+= "nombre= ?";
			if(objeto.getDescripcion()!=null)       query+= ", descripcion= ?";
			if(objeto.getProporcion()!=0)           query+= ", proporcion= ?";
			if(objeto.getPeso()!=0)      			query+= ", peso= ?";
			if(objeto.getUnidad_medida_id()!=0)   	query+= ", unidad_medida_id= ?";
			if(objeto.getHito_tipo_id()!=0)         query+= ", hito_tipo_id= ?";

			query+=" where id = ?";

			int cantCampos =0;
			update = conect.prepareStatement(query);
			if (objeto.getNombre()!=null)           {    cantCampos++;update.setString (cantCampos, objeto.getNombre());}
			if (objeto.getDescripcion()!=null)      {    cantCampos++;update.setString (cantCampos, objeto.getDescripcion());}
			if (objeto.getProporcion()!=0)          {    cantCampos++;update.setDouble (cantCampos, objeto.getProporcion());}
			if (objeto.getPeso()!=0)      			{    cantCampos++;update.setDouble (cantCampos, objeto.getPeso());}
			if (objeto.getUnidad_medida_id()!=0)  	{    cantCampos++;update.setInt (cantCampos, objeto.getUnidad_medida_id());}
			if (objeto.getHito_tipo_id()!=0)        {    cantCampos++;update.setInt (cantCampos, objeto.getHito_tipo_id());}
				
	             cantCampos++;
	             update.setInt    (cantCampos , objeto.getId());

	            update.execute();
	            conect.close();
	        return true;
	     }catch (SQLException e) {e.printStackTrace(); return false;}	
		}
	public static boolean borradoCronograma(Cronograma objeto){
	  	 Connection conect=ConnectionConfiguration.conectar();
	  	 Statement statement = null;
	  	 objeto.changeBorrado();
	  	 
		 String query = "update actividad set borrado='"+objeto.isBorrado()+"'";	
		 
		 query+=" where id ="+objeto.getId(); 	
		 try {
			statement=conect.createStatement();
			statement.execute(query);
		    conect.close();
		    return true;
		 }catch (SQLException e) {e.printStackTrace(); return false;}
	}	
	
	
	public static boolean actAvanceCosto(AvanceCosto objeto){
		 try {
			 Connection conect=ConnectionConfiguration.conectar();
			 String query = "update avance_costo set ";
			 PreparedStatement update =null;

			 	if(objeto.getMonto()!=0) 				query+= "monto= ?";
				if(objeto.getCodigoContratacion()!=null)query+= ", codigo_contratacionl= ?";
				if(objeto.getObjetoGasto()!=0)  		query+= ", objeto_gasto= ?";
				if(objeto.getAvanceId()!=0)      		query+= ", avance_id= ?";

				query+=" where id = ?";

				int cantCampos =0;
				update = conect.prepareStatement(query);
				if (objeto.getMonto()!=0) 					{    cantCampos++;update.setDouble (cantCampos, objeto.getMonto());}
				if (objeto.getCodigoContratacion()!=null)	{    cantCampos++;update.setString (cantCampos, objeto.getCodigoContratacion());}
				if (objeto.getObjetoGasto()!=0)     		{    cantCampos++;update.setInt (cantCampos, objeto.getObjetoGasto());}
				if (objeto.getAvanceId()!=0)        		{    cantCampos++;update.setInt	(cantCampos, objeto.getAvanceId());}
						
		             cantCampos++;
		             update.setInt    (cantCampos , objeto.getId());

		            update.execute();
					conect.close();
			    return true;
			} catch (SQLException e) {e.printStackTrace(); return false;}
		}
	public static boolean borradoAvanceCosto(AvanceCosto objeto){
	  	 Connection conect=ConnectionConfiguration.conectar();
	  	 Statement statement = null;
	  	 objeto.changeBorrado();
	  	 
		 String query = "update avance_costo set borrado='"+objeto.isBorrado()+"'";	
		 
		 query+=" where id ="+objeto.getId(); 	
		 try {
			statement=conect.createStatement();
			statement.execute(query);
		    conect.close();
		    return true;
		 }catch (SQLException e) {e.printStackTrace(); return false;}
	}
	
/////////////////////////////////////////////////////////////////////////	
	public static boolean actAvance(Avance objeto) throws ParseException{
		try {             
			Connection conect=ConnectionConfiguration.conectar();
			String query = "update avance set ";
			PreparedStatement update =null;
			
			String startDate = objeto.getFechaEntrega();
			SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
			java.util.Date date = sdf1.parse(startDate);
			java.sql.Date sqlStartDate = new java.sql.Date(date.getTime());

			if(objeto.getJustificacion()!=null) 	query+= "justificacion= ?";
			if(objeto.getCantidad()!=0)				query+= ", cantidad= ?";
			if(objeto.getFechaEntrega()!=null)  	query+= ", fecha_entrega= ?";
			if(objeto.getActividadId()!=0)      	query+= ", actividad_id= ?";
			if(objeto.getVersion()!=0)   			query+= ", version= ?";

			query+=" where id = ?";

			int cantCampos =0;
			update = conect.prepareStatement(query);
			if (objeto.getJustificacion()!=null)	{    cantCampos++;update.setString (cantCampos, objeto.getJustificacion());}
			if (objeto.getCantidad()!=0)          	{    cantCampos++;update.setDouble (cantCampos, objeto.getCantidad());}
			if (objeto.getFechaEntrega()!=null)     {    cantCampos++;update.setDate(cantCampos, sqlStartDate);}
			if (objeto.getActividadId()!=0)        	{    cantCampos++;update.setInt	(cantCampos, objeto.getActividadId());}
			if (objeto.getVersion()!=0)  			{    cantCampos++;update.setInt (cantCampos, objeto.getVersion());}
						
	             cantCampos++;
	             update.setInt    (cantCampos , objeto.getId());

	            update.execute();
	            conect.close();
	        return true;
	     }catch (SQLException e) {e.printStackTrace(); return false;}
	}
	public static boolean borradoAvance(Avance objeto){
	  	 Connection conect=ConnectionConfiguration.conectar();
	  	 Statement statement = null;
	  	  objeto.changeBorrado();
	  	 
		 String query = "update avance set borrado='"+objeto.isBorrado()+"'";	
		 
		 query+=" where id ="+objeto.getId(); 	
		 try {
			statement=conect.createStatement();
			statement.execute(query);
		    conect.close();
		    return true;
		 }catch (SQLException e) {e.printStackTrace(); return false;}
	}
	

	public static boolean updateProgramacion(Programacion objeto) throws ParseException{
		try {             
			Connection conect=ConnectionConfiguration.conectar();
			String query = "update programacion set ";
			PreparedStatement update =null;
			
			String startDate = objeto.getFechaEntrega();
			SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
			java.util.Date date = sdf1.parse(startDate);
			java.sql.Date sqlStartDate = new java.sql.Date(date.getTime());


			if(objeto.getFechaEntrega()!=null)	  query+= "fecha_entrega= ?";
			if(objeto.getCantidad()!=0)           query+= ", cantidad= ?";
			

			query+=" where id = ?";

			int cantCampos =0;
			update = conect.prepareStatement(query);
			if (objeto.getFechaEntrega()!=null)   {    cantCampos++;update.setDate(cantCampos, sqlStartDate);}
			if (objeto.getCantidad()!=0)          {    cantCampos++;update.setDouble(cantCampos, objeto.getCantidad());}
			
				
	             cantCampos++;
	             update.setInt    (cantCampos , objeto.getId());

	            update.execute();
	            conect.close();
	        return true;
	     }catch (SQLException e) {e.printStackTrace(); return false;}
	}
	public static boolean borradoProgramacion(Programacion objeto){
	  	 Connection conect=ConnectionConfiguration.conectar();
	  	 Statement statement = null;
	  	 objeto.changeBorrado();
	  	 
	  	 String query = "update programacion set borrado='"+objeto.isBorrado()+"'";	
				 
		 query+=" where id ="+objeto.getId(); 
		 try {
			statement=conect.createStatement();
			statement.execute(query);
		    conect.close();
		    return true;
		  } catch (SQLException e) {e.printStackTrace(); return false;}
	}
	
	
	public static boolean updateAccionDestinatario(AccionDestinatario objeto){
		try {             
			Connection conect=ConnectionConfiguration.conectar();
			String query = "update accion_destinatario set ";
			PreparedStatement update =null;

			if(objeto.getCantidad()!=0)                 query+= "cantidad= ?";
			if(objeto.getDescripcion()!=null)           query+= ", descripcion= ?";
			if(objeto.getVersion()!=0)              	query+= ", version= ?";
			if(objeto.isBorrado()!=false)       		query+= ", borrado= ?";
			if(objeto.getBeneficiarioTipoId()!=0)   	query+= ", beneficiario_tipo_id= ?";
			if(objeto.getAccionId()!=0)                 query+= ", accion_id= ?";
			if(objeto.getBeneficiarioGrupoId()!=0)      query+= ", beneficiario_grupo_id= ?";

			query+=" where id = ?";

			int cantCampos =0;
			update = conect.prepareStatement(query);
			if (objeto.getCantidad()!=0)                {    cantCampos++;update.setInt (cantCampos, objeto.getCantidad());}
			if (objeto.getDescripcion()!=null)          {    cantCampos++;update.setString(cantCampos, objeto.getDescripcion());}
			if (objeto.getVersion()!=0)               	{    cantCampos++;update.setInt(cantCampos, objeto.getVersion());}
			if (objeto.isBorrado()!=false)       		{    cantCampos++;update.setBoolean(cantCampos, objeto.isBorrado());}
			if (objeto.getBeneficiarioTipoId()!=0)  	{    cantCampos++;update.setInt (cantCampos, objeto.getBeneficiarioTipoId());}
			if (objeto.getAccionId()!=0)               	{    cantCampos++;update.setInt (cantCampos, objeto.getAccionId());}
			if (objeto.getBeneficiarioGrupoId()!=0) 	{    cantCampos++;update.setInt (cantCampos, objeto.getBeneficiarioGrupoId());}
				
	             cantCampos++;
	             update.setInt    (cantCampos , objeto.getId());

	            update.execute();
	            conect.close();
	        return true;
	     }catch (SQLException e) {e.printStackTrace(); return false;}
	}
	public static boolean borradoAccionDestinatario(AccionDestinatario objeto){
	  	 Connection conect=ConnectionConfiguration.conectar();
	  	 Statement statement = null;
	  	 objeto.changeBorrado();
	  	 
	  	 String query = "update accion_destinatario set borrado='"+objeto.isBorrado()+"'";	
				 
		 query+=" where id ="+objeto.getId(); 
		 try {
			statement=conect.createStatement();
			statement.execute(query);
		    conect.close();
		    return true;
		  } catch (SQLException e) {e.printStackTrace(); return false;}
	}
	
	
	public static boolean updateAvanceCualitativo(AvanceCualitativo objeto){
	     try {             

	           Connection conect=ConnectionConfiguration.conectar();
	            String query = "update avance_cualitativo set ";
	            PreparedStatement update =null;

	             if(objeto.getAccionCatalogoId() !=0)                    query+= "accion_catalogo_id= ?";
	             if(objeto.getTrimestreId()!=0)                          query+= ", trimestre_id= ?";
	             if(objeto.getGestionesRealizadas()!=null)               query+= ", gestiones_realizadas= ?";
	             if(objeto.getPrincipalesLogrosAlcanzados()!=null)       query+= ", principales_logros_alcanzados= ?";
	             if(objeto.getDificultadesLeccionesAprendidas()!=null)   query+= ", dificultades_lecciones_aprendidas= ?";
	             if(objeto.getObjetivosTrimestre()!=null)                query+= ", objetivos_del_siguiente_trimestre= ?";


	             //query = query.substring(0, query.length()-2);
	             query+=" where id = ?";

	             int cantCampos =0;
	             update = conect.prepareStatement(query);
	             if (objeto.getAccionCatalogoId() !=0)                    {    cantCampos++;update.setInt (cantCampos, objeto.getAccionCatalogoId());}
	             if (objeto.getTrimestreId()!=0)                          {    cantCampos++;update.setInt (cantCampos, objeto.getTrimestreId());}
	             if (objeto.getGestionesRealizadas()!=null)               {    cantCampos++;update.setString (cantCampos, objeto.getGestionesRealizadas());}
	             if (objeto.getPrincipalesLogrosAlcanzados()!=null)       {    cantCampos++;update.setString (cantCampos, objeto.getPrincipalesLogrosAlcanzados());}
	             if (objeto.getDificultadesLeccionesAprendidas()!=null)   {    cantCampos++;update.setString (cantCampos, objeto.getDificultadesLeccionesAprendidas());}
	             if (objeto.getObjetivosTrimestre()!=null)                {    cantCampos++;update.setString (cantCampos, objeto.getObjetivosTrimestre());}

	             cantCampos++;
	             update.setInt    (cantCampos , objeto.getId());

	            update.execute();
	            conect.close();
	        return true;
	     }catch (SQLException e) {e.printStackTrace(); return false;}
	}
	public static boolean borradoAvanceCualitativo(AvanceCualitativo objeto){
	  	 Connection conect=ConnectionConfiguration.conectar();
	  	 Statement statement = null;
	  	 objeto.changeBorrado();
	  	 
	  	 String query = "update avance_cualitativo set borrado='"+objeto.isBorrado()+"'";	
				 
		 query+=" where id ="+objeto.getId(); 
		 try {
			statement=conect.createStatement();
			statement.execute(query);
		    conect.close();
		    return true;
		  } catch (SQLException e) {e.printStackTrace(); return false;}
	}
}
