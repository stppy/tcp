package py.gov.stp.tools2;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;

import py.gov.stp.objetosV2.*;


public class SqlUpdates {

	
	
	public static boolean updateTipoAccion(TipoAccion objeto){
  	 Connection conect=ConnectionConfiguration.conectar();
   	
  	 Statement statement = null;

				 String										query = "update tipo_accion set ";
				 if(objeto.getNombre()!=null)			    query+= "nombre='"+objeto.getNombre()+"'";
				 if(objeto.getDescripcion()!=null)			query+= ", descripcion='"+objeto.getDescripcion()+"'";
				 //if(objeto.isBorrado()!=false)			query+= "borrado=\""+objeto.isBorrado()+"\"";	
				 
				 query+=" where id ="+objeto.getId();
				 
				 try {
					statement=conect.createStatement();
					statement.execute(query);
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
	  	 Connection conect=ConnectionConfiguration.conectar();
	   	
	  	 Statement statement = null;

					 String										query = "update unidad_medida set ";
					 if(objeto.getNombre()!=null)			    query+= "nombre='"+objeto.getNombre()+"'";
					 if(objeto.getDescripcion()!=null)			query+= ", descripcion='"+objeto.getDescripcion()+"'";
					 if(objeto.getSigla()!=null)			 	query+= ", sigla='"+objeto.getSigla()+"'";	
					 
					 
					 query+=" where id ="+objeto.getId();

					 try {
						statement=conect.createStatement();
						statement.execute(query);
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
	  	 Connection conect=ConnectionConfiguration.conectar();
	   	
	  	 Statement statement = null;

					 String										query = "update linea_estrategica set ";
					 if(objeto.getNombre()!=null)				query+= "nombre='"+objeto.getNombre()+"'";
					 if(objeto.getDescripcion()!=null)			query+= ", descripcion='"+objeto.getDescripcion()+"'";
					 if(objeto.getOrden()!=0)			 		query+= ", orden="+objeto.getOrden()+"";
					 //if(objeto.isBorrado()!=false)			query+= "borrado=\""+objeto.isBorrado()+"\"";	

					 query+=" where id ="+objeto.getId();
					 try {
						statement=conect.createStatement();
						statement.execute(query);
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
	  	 Connection conect=ConnectionConfiguration.conectar();
	   	
	  	 Statement statement = null;

					 String										query = "update linea_accion set ";
					 if(objeto.getNombre()!=null)				query+= "nombre='"+objeto.getNombre()+"'";
					 if(objeto.getDescripcion()!=null)			query+= ", descripcion='"+objeto.getDescripcion()+"'";
					 if(objeto.getOrden()!=0)			 		query+= ", orden="+objeto.getOrden()+"";
					 if(objeto.getPeso()!=0)					query+= ", peso='"+objeto.getPeso()+"'";
					 if(objeto.isAcumular()!=false || objeto.isAcumular()!=true)			    query+= ", acumular='"+objeto.isAcumular()+"'";	
					 if(objeto.getTipoAccionId()!=0)			query+= ", tipo_accion_id="+objeto.getTipoAccionId()+"";
					 if(objeto.getEstrategiaId()!=0)			query+= ", estrategia_id="+objeto.getEstrategiaId()+"";
					 if(objeto.getUnidadMedidaId()!=0)			query+= ", unidad_medida_id="+objeto.getUnidadMedidaId()+"";					 
					 
					 
					 //if(objeto.isBorrado()!=false)			query+= "borrado=\""+objeto.isBorrado()+"\"";	

					 query+=" where id ="+objeto.getId();

					 try {
						statement=conect.createStatement();
						statement.execute(query);
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
	  	 Connection conect=ConnectionConfiguration.conectar();
	   	
	  	 Statement statement = null;

					 String										query = "update ins_linea_accion set ";
					 if(objeto.getLineaAccionId()!=0)			query+= "linea_accion_id="+objeto.getLineaAccionId()+"";	
					 if(objeto.getInstitucionId()!=0)			query+= ", institucion_id="+objeto.getInstitucionId()+"";
					 if(objeto.getPeriodoId()!=0)				query+= ", periodo_id="+objeto.getPeriodoId()+"";
					 if(objeto.getMeta()!=0)					query+= ", meta="+objeto.getMeta()+"";		
					 if(objeto.getVersion()!=0)					query+= ", version="+objeto.getVersion()+"";					 
					 //if(objeto.isBorrado()!=false)			query+= "borrado=\""+objeto.isBorrado()+"\"";	

					 query+=" where id ="+objeto.getId();
					 try {
						statement=conect.createStatement();
						statement.execute(query);
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
	  	 Connection conect=ConnectionConfiguration.conectar();
	   	
	  	 Statement statement = null;  

					 String										query = "update institucion set ";
					 if(objeto.getNombre()!=null)				query+= "nombre='"+objeto.getNombre()+"'";	
					 if(objeto.getDescripcion()!=null)			query+= ", descripcion='"+objeto.getDescripcion()+"'";
					 if(objeto.getSigla()!=null)				query+= ", sigla='"+objeto.getSigla()+"'";
					 if(objeto.getNivelId()!=0)					query+= ", nivel_id="+objeto.getNivelId()+"";	
					 if(objeto.getEntidadId()!=0)				query+= ", entidad_id="+objeto.getEntidadId()+"";
					 if(objeto.getUnidadJerarquicaId()!=0)		query+= ", unidad_jerarquica_id="+objeto.getUnidadJerarquicaId()+"";
					 if(objeto.getUnidadResponsableId()!=0)		query+= ", unidad_responsable_id="+objeto.getUnidadResponsableId()+"";
					 if(objeto.getOrden()!=0)					query+= ", orden="+objeto.getOrden()+"";	
					 //if(objeto.isBorrado()!=false)			query+= "borrado=\""+objeto.isBorrado()+"\"";	
					 
					 
					 query+=" where id ="+objeto.getId();
					 
					 try {
						statement=conect.createStatement();
						statement.execute(query);
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
	
	public static boolean updatePeriodo(Periodo objeto){
	  	 Connection conect=ConnectionConfiguration.conectar();
	   	
	  	 Statement statement = null;

					 String										query = "update periodo set ";
					 if(objeto.getNombre()!=null)				query+= "nombre='"+objeto.getNombre()+"'";	
					 if(objeto.getDescripcion()!=null)			query+= ", descripcion='"+objeto.getDescripcion()+"'";
					 if(objeto.getFechaInicio()!=null)			query+= ", fecha_inicio='"+objeto.getFechaInicio()+"'";
					 if(objeto.getFechaFin()!=null)				query+= ", fecha_fin='"+objeto.getFechaFin()+"'";
					 //if(objeto.isBorrado()!=false)			query+= "borrado=\""+objeto.isBorrado()+"\"";	

					 query+=" where id ="+objeto.getId();
					 try {
						statement=conect.createStatement();
						statement.execute(query);
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
	  	 Connection conect=ConnectionConfiguration.conectar();
	   	
	  	 Statement statement = null;

					 String										query = "update hito_tipo set ";
					 if(objeto.getNombre()!=null)				query+= "nombre='"+objeto.getNombre()+"'";	
					 if(objeto.getDescripcion()!=null)			query+= ", descripcion='"+objeto.getDescripcion()+"'";
					 //if(objeto.isBorrado()!=false)			query+= "borrado=\""+objeto.isBorrado()+"\"";	

					 query+=" where id ="+objeto.getId(); 
					 
					 try {
						statement=conect.createStatement();
						statement.execute(query);
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
	
	public static boolean updateHito(Hito objeto){
	  	 Connection conect=ConnectionConfiguration.conectar();
	   	
	  	 Statement statement = null;

					 String										query = "update hito set ";
					 if(objeto.getNombre()!=null)				query+= "nombre='"+objeto.getNombre()+"'";	
					 if(objeto.getDescripcion()!=null)			query+= ", descripcion='"+objeto.getDescripcion()+"'";
					 if(objeto.getCantidad()!=0)				query+= ", cantidad="+objeto.getCantidad()+"";
					 if(objeto.getFechaEntrega()!=null)			query+= ", fecha_entrega='"+objeto.getFechaEntrega()+"'";
					 if(objeto.getHitoTipoId()!=0)				query+= ", hito_tipo_id="+objeto.getHitoTipoId()+"";
					 if(objeto.getAccionId()!=0)				query+= ", accion_id="+objeto.getAccionId()+"";
					 if(objeto.getEvidenciaId()!=0)				query+= ", evidencia_id="+objeto.getEvidenciaId()+"";
					 if(objeto.getUnidadMedidaId()!=0)			query+= ", unidad_medida_id="+objeto.getUnidadMedidaId()+"";
					 if(objeto.getPeso()!=0)					query+= ", peso="+objeto.getPeso()+"";
					 //if(objeto.isBorrado()!=false)			query+= "borrado=\""+objeto.isBorrado()+"\"";	
					 
					
					 query+=" where id ="+objeto.getId()+" AND accion_id="+objeto.getAccionId();


					 try {
						statement=conect.createStatement();
						statement.execute(query);
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
	
	public static boolean updateAccion(Accion objeto){
	  	 Connection conect=ConnectionConfiguration.conectar();
	   	
	  	 Statement statement = null;
					 String										query = "update accion set ";
					 if(objeto.getCosto() != 0)					query+= "costo="+objeto.getCosto()+"";
					 if(objeto.getPeso() != 0)					query+= ", peso="+objeto.getPeso()+"";
					 if(objeto.getFechaInicio() != null)		query+= ", fecha_inicio='"+objeto.getFechaInicio()+"'";
					 if(objeto.getFechaFin() != null)			query+= ", fecha_fin='"+objeto.getFechaFin()+"'";
					 if(objeto.getVersion() != 0)				query+= ", version="+objeto.getVersion()+"";
					 /*if(objeto.getMeta1() != 0)*/					query+= ", meta1="+objeto.getMeta1()+"";
					 /*if(objeto.getMeta2() != 0)	*/				query+= ", meta2="+objeto.getMeta2()+"";
					 /*if(objeto.getMeta3() != 0)		*/			query+= ", meta3="+objeto.getMeta3()+"";
					 /*if(objeto.getMeta4() != 0)	*/				query+= ", meta4="+objeto.getMeta4()+"";
					 if(objeto.getInsLineaAccionId() != 0)		query+= ", ins_linea_accion_id="+objeto.getInsLineaAccionId()+"";
					 if(objeto.getDepartamentoId() != 0)		query+= ", depto_id="+objeto.getDepartamentoId()+"";
					 if(objeto.getDistritoId() != 0)			query+= ", dist_id="+objeto.getDistritoId()+"";
					 if(objeto.getAccionCatalogoId() != 0)		query+= ", id_accion_catalogo="+objeto.getAccionCatalogoId()+"";
					 

					 query+=" where id ="+objeto.getId();

					 try {
						statement=conect.createStatement();
						statement.execute(query);
					    conect.close();
					    return true;
					} catch (SQLException e) {e.printStackTrace(); return false;}

		}
	
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
	  	 Connection conect=ConnectionConfiguration.conectar();
	   	
	  	 Statement statement = null;

					 String										query = "update accion_has_producto set ";
					 if(objeto.getProporcion()!=0)				query+= "proporcion="+objeto.getProporcion()+"";	
					 if(objeto.getAccionId()!=0)				query+= ", accion_id="+objeto.getAccionId()+"";
					 if(objeto.getSprProductoId()!=0)			query+= ", spr_producto_id="+objeto.getSprProductoId()+"";	

					 query+=" where id ="+objeto.getId();
					 try {
						statement=conect.createStatement();
						statement.execute(query);
					    conect.close();
					    return true;
					} catch (SQLException e) {e.printStackTrace(); return false;}

		}	
	
	public static boolean updateSprProducto(SprProducto objeto){
	  	 Connection conect=ConnectionConfiguration.conectar();
	   	
	  	 Statement statement = null;

					 String										query = "update spr_producto set ";
					 if(objeto.getNivelId()!=0)					query+= "nivel_id="+objeto.getNivelId()+"";	
					 if(objeto.getEntidadId()!=0)				query+= ", entidad_id="+objeto.getEntidadId()+"";
					 if(objeto.getTipoId()!=0)					query+= ", tipo_id="+objeto.getTipoId()+"";	
					 if(objeto.getProgramaId()!=0)				query+= ", progama_id="+objeto.getProgramaId()+"";
					 if(objeto.getSubprogramaId()!=0)			query+= ", subprograma_id="+objeto.getSubprogramaId()+"";
					 if(objeto.getProyectoId()!=0)				query+= ", proyecto_id="+objeto.getProyectoId()+"";	
					 if(objeto.getFuncionalId()!=0)				query+= ", funcional_id="+objeto.getFuncionalId()+"";
					 if(objeto.getUnidadResponsableId()!=0)		query+= ", unidad_responsable_id="+objeto.getUnidadResponsableId()+"";
					 if(objeto.getProductoId()!=0)				query+= ", producto_id="+objeto.getProductoId()+"";	
					 		 
					 query+=" where id ="+objeto.getId();
					 
					 try {
						statement=conect.createStatement();
						statement.execute(query);
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
	  	 Connection conect=ConnectionConfiguration.conectar();
	   	
	  	 Statement statement = null;

					 String										query = "update ws set ";
					 if(objeto.getNombre()!=null)				query+= "nombre='"+objeto.getNombre()+"'";
					 if(objeto.getDescripcion()!=null)			query+= ", descripcion='"+objeto.getDescripcion()+"'";
					 if(objeto.getUrl()!=null)					query+= ", url='"+objeto.getUrl()+"'";
					 if(objeto.getMetodo()!=null)				query+= ", metodo='"+objeto.getMetodo()+"'";
					 if(objeto.getUsuario()!=null)				query+= ", usuario='"+objeto.getUsuario()+"'";
					 if(objeto.getPass()!=null)					query+= ", pass='"+objeto.getPass()+"'";
					 if(objeto.getIdClave()!=null)				query+= ", id_clave='"+objeto.getIdClave()+"'";
					 if(objeto.getIdValor()!=null)				query+= ", id_valor='"+objeto.getIdValor()+"'";
					 if(objeto.getWsTipoId()!=0)				query+= ", ws_tipo_id="+objeto.getWsTipoId()+"";	
					 //if(objeto.isBorrado()!=false)				query+= "borrado=\""+objeto.isBorrado()+"\"";	

					 query+=" where id ="+objeto.getId();
					 
					 try {
						statement=conect.createStatement();
						statement.execute(query);
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
	  	 Connection conect=ConnectionConfiguration.conectar();
	   	
	  	 Statement statement = null;

					 String										query = "update evidencia set ";
					 if(objeto.getNombre()!=null)			    query+= "nombre='"+objeto.getNombre()+"'";
					 if(objeto.getDescripcion()!=null)			query+= ", descripcion='"+objeto.getDescripcion()+"'";
					 if(objeto.getWsId()!=0)					query+= ", ws_id="+objeto.getWsId()+"";
					 if(objeto.getUrl()!=null)					query+= ", url='"+objeto.getUrl()+"'";
					 if(objeto.getUrlDocumento()!=null)			query+= ", url_documento='"+objeto.getUrlDocumento()+"'";
					 if(objeto.getVersion()!=0l)				query+= ", version="+objeto.getVersion()+"";

					 //if(objeto.isBorrado()!=false)			query+= "borrado=\""+objeto.isBorrado()+"\"";	
					 
					 query+=" where id ="+objeto.getId();
					 
					 		 
					 try {
						statement=conect.createStatement();
						statement.execute(query);
					    conect.close();
					    return true;
					} catch (SQLException e) {e.printStackTrace(); return false;}

		}
	
	
	public static boolean updateWsTipo(WsTipo objeto){
	  	 Connection conect=ConnectionConfiguration.conectar();
	   	
	  	 Statement statement = null;

					 String										query = "update ws_tipo set ";
					 if(objeto.getNombre()!=null)			    query+= "nombre='"+objeto.getNombre()+"'";
					 if(objeto.getDescripcion()!=null)			query+= ", descripcion='"+objeto.getDescripcion()+"'";
					 //if(objeto.isBorrado()!=false)			query+= "borrado=\""+objeto.isBorrado()+"\"";	
					 
					 query+=" where id ="+objeto.getId();
					 		 
					 try {
						statement=conect.createStatement();
						statement.execute(query);
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
	  	 Connection conect=ConnectionConfiguration.conectar();
	   	
	  	 Statement statement = null;

					 String										query = "update hito_has_beneficiario set ";
					 if(objeto.getHitoId()!=0)					query+= "hito_id="+objeto.getHitoId()+"";
					 if(objeto.getHitoAccionId()!=0)			query+= ", hito_accion_id="+objeto.getHitoAccionId()+"";
					 if(objeto.getBeneficiarioId()!=0)			query+= ", beneficiario_id="+objeto.getBeneficiarioId()+"";
					 //if(objeto.isBorrado()!=false)			query+= "borrado=\""+objeto.isBorrado()+"\"";	
					 	
					 //query+=" where accion_id ="+objeto.getHitoId()+" AND hito_accion_id="+objeto.getHitoAccionId()+" AND beneficiario_id="+objeto.getBeneficiarioId();
					 try {
						statement=conect.createStatement();
						statement.execute(query);
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
	  	 Connection conect=ConnectionConfiguration.conectar();
	  	 Statement statement = null;

	  	 			String										query = "update beneficiario_tipo set ";
	  	 			if(objeto.getNombre()!=null)			    query+= "nombre='"+objeto.getNombre()+"'";
	  	 			if(objeto.getDescripcion()!=null)			query+= ", descripcion='"+objeto.getDescripcion()+"'";
	  	 			//if(objeto.isBorrado()!=false)			query+= "borrado=\""+objeto.isBorrado()+"\"";	
				 
	  	 			query+=" where id ="+objeto.getId();
				
					 try {
						statement=conect.createStatement();
						statement.execute(query);
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
	
	public static boolean updateAccionHasEtiqueta(AccionHasEtiqueta objeto){
	  	 Connection conect=ConnectionConfiguration.conectar();
	   	
	  	 Statement statement = null;

					 String										query = "update accion_has_etiqueta set ";
					 if(objeto.getAccionId()!=0)				query+= "accion_id="+objeto.getAccionId()+"";
					 if(objeto.getEtiquetaId()!=0)				query+= ", etiqueta_id="+objeto.getEtiquetaId()+"";
					 if(objeto.getProporcion()!=0)				query+= ", proporcion="+objeto.getProporcion()+"";
					 //if(objeto.isBorrado()!=false)			query+= "borrado=\""+objeto.isBorrado()+"\"";	
					 
					 query+=" where accion_id ="+objeto.getAccionId()+" AND etiqueta_id="+objeto.getEtiquetaId();
					 		 
					 try {
						statement=conect.createStatement();
						statement.execute(query);
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
	  	 Connection conect=ConnectionConfiguration.conectar();
	   	
	  	 Statement statement = null;

					 String										query = "update beneficiario set ";
					 //if(objeto.getNombre()!=null)				query+= "nombre='"+objeto.getNombre()+"'";
					 if(objeto.getDescripcion()!=null)			query+= "descripcion='"+objeto.getDescripcion()+"'";
					 if(objeto.getTipoId()!=0)					query+= ", beneficiario_tipo_id="+objeto.getTipoId()+"";
					 if(objeto.getGrupoId()!=0)					query+= ", beneficiario_grupo_id="+objeto.getGrupoId()+"";
					 if(objeto.getCantidad()!=0)				query+= ", cantidad="+objeto.getCantidad()+"";
					 //if(objeto.isBorrado()!=false)			query+= "borrado=\""+objeto.isBorrado()+"\"";
					 
					 query+=" where id ="+objeto.getId();
					 		 
					 try {
						statement=conect.createStatement();
						statement.execute(query);
					    conect.close();
					    return true;
					} catch (SQLException e) {e.printStackTrace(); return false;}

		}	
	
	public static boolean updateEtiqueta(Etiqueta objeto){
	  	 Connection conect=ConnectionConfiguration.conectar();
	   	
	  	 Statement statement = null;

					 String										query = "update etiqueta set ";
					 if(objeto.getNombre()!=null)			    query+= "nombre='"+objeto.getNombre()+"'";
					 if(objeto.getDescripcion()!=null)			query+= ", descripcion='"+objeto.getDescripcion()+"'";
					 //if(objeto.isBorrado()!=false)			query+= "borrado=\""+objeto.isBorrado()+"\"";	
					 
					 query+=" where id ="+objeto.getId();
					 		 
					 try {
						statement=conect.createStatement();
						statement.execute(query);
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
	  	 Connection conect=ConnectionConfiguration.conectar();
	   	
	  	 Statement statement = null;

					 String											query = "update beneficiario_detalle set ";
					 if(objeto.getValor()!=null)					query+= "valor='"+objeto.getValor()+"'";
					 if(objeto.getBeneficiarioDetalleClavesId()!=0)	query+= ", beneficiario_detalle_claves_id="+objeto.getBeneficiarioDetalleClavesId()+"";
					 if(objeto.getBeneficiarioId()!=0)				query+= ", beneficiario_id="+objeto.getBeneficiarioId()+"";
					 		 
					 query+=" where id ="+objeto.getId();
	
					 try {
						statement=conect.createStatement();
						statement.execute(query);
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
	  	 Connection conect=ConnectionConfiguration.conectar();
	   	
	  	 Statement statement = null;

					 String											query = "update beneficiario_detalle_clave set ";
					 if(objeto.getClave()!=null)					query+= "clave='"+objeto.getClave()+"'";
					 
					 query+=" where id ="+objeto.getId();
					 		 
					 try {
						statement=conect.createStatement();
						statement.execute(query);
					    conect.close();
					    return true;
					} catch (SQLException e) {e.printStackTrace(); return false;}

		}	
	
	public static boolean updateGeoPoligono(GeoPoligono objeto){
	  	 Connection conect=ConnectionConfiguration.conectar();
	   	
	  	 Statement statement = null;

					 String											query = "update geo_poligono set ";
					 if(objeto.getNombre()!=null)					query+= "nombre='"+objeto.getNombre()+"'";
					 if(objeto.getDescripcion()!=null)				query+= ", descripcion='"+objeto.getDescripcion()+"'";
					 if(objeto.getGeo()!=null)						query+= ", geo='"+objeto.getGeo()+"'";
					 if(objeto.getGeoPoligonoId()!=0)				query+= ", geo_poligono_id="+objeto.getGeoPoligonoId()+"";
					 if(objeto.getGeoPoligonoTipoId()!=0)			query+= ", geo_poligono_tipo_id="+objeto.getGeoPoligonoTipoId()+"";
					 //if(objeto.isBorrado()!=false)				query+= "borrado=\""+objeto.isBorrado()+"\"";	
					 		 
					 query+=" where id ="+objeto.getId()+" AND geo_poligono_id="+objeto.getGeoPoligonoId();
					 try {
						statement=conect.createStatement();
						statement.execute(query);
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
	  	 Connection conect=ConnectionConfiguration.conectar();
	   	
	  	 Statement statement = null;

					 String											query = "update accion_has_geo_poligono set ";
					 if(objeto.getAccionId()!=0)					query+= "accion_id="+objeto.getAccionId()+"";
					 if(objeto.getGeoPoligonoId()!=0)				query+= ", geo_poligono_id="+objeto.getGeoPoligonoId()+"";
					 if(objeto.getGeoPoligonoGeoPoligonoId()!=0)	query+= ", geo_poligono_geo_poligono_id="+objeto.getGeoPoligonoGeoPoligonoId()+"";
					 if(objeto.getProporcion()!=0)					query+= ", proporcion="+objeto.getProporcion()+"";
					 //if(objeto.isBorrado()!=false)				query+= "borrado=\""+objeto.isBorrado()+"\"";	
					 
					 query+=" where accion_id ="+objeto.getAccionId()+" AND geo_poligono_id="+objeto.getGeoPoligonoId()+" AND geo_poligono_geo_poligono_id="+objeto.getGeoPoligonoGeoPoligonoId();
		 
					 try {
						statement=conect.createStatement();
						statement.execute(query);
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
	  	 Connection conect=ConnectionConfiguration.conectar();
	   	
	  	 Statement statement = null;

					 String											query = "update geo_poligono_tipo set ";
					 if(objeto.getNombre()!=null)					query+= "nombre='"+objeto.getNombre()+"'";
					 if(objeto.getDescripcion()!=null)				query+= ", descripcion='"+objeto.getDescripcion()+"'";
					 //if(objeto.isBorrado()!=false)				query+= "borrado=\""+objeto.isBorrado()+"\"";	
					 		 
					 query+=" where id ="+objeto.getId();
							 
					 try {
						statement=conect.createStatement();
						statement.execute(query);
					    conect.close();
					    return true;
					} catch (SQLException e) {e.printStackTrace(); return false;}

		}
	public static boolean updateAccionCatalogo(AccionCatalogo objeto){
	  	 Connection conect=ConnectionConfiguration.conectar();
	   	
	  	 Statement statement = null;

					 String											query = "update accion_catalogo set ";
					 if(objeto.getNombre()!=null)					query+= "nombre='"+objeto.getNombre()+"'";
					 if(objeto.getDescripcion()!=null)				query+= "descripcion='"+objeto.getDescripcion()+"'";
					 if(objeto.getIdUnidadMedida()!=0)				query+= "id_unidad_medida='"+objeto.getIdUnidadMedida()+"'";
					 if(objeto.getVersion()!=0)						query+= "verdion='"+objeto.getVersion()+"'";
					 if(objeto.isBorrado()!=false)					query+= ", borrado='"+objeto.isBorrado()+"'";

					 		 
					 query+=" where id ="+objeto.getId();
							 
					 try {
						statement=conect.createStatement();
						statement.execute(query);
					    conect.close();
					    return true;
					} catch (SQLException e) {e.printStackTrace(); return false;}

		}
	public static boolean updateCronograma(Cronograma objeto){
	  	 Connection conect=ConnectionConfiguration.conectar();
	   	
	  	 Statement statement = null;

					 String											query = "update actividad set ";
					 if(objeto.getNombre()!=null)					query+= "nombre='"+objeto.getNombre()+"'";
					 if(objeto.getDescripcion()!=null)				query+= ", descripcion='"+objeto.getDescripcion()+"'";
					 if(objeto.getProporcion()!=0)					query+= ", proporcion='"+objeto.getProporcion()+"'";
					 if(objeto.getPeso()!=0)						query+= ", peso='"+objeto.getVersion()+"'";
					 if(objeto.getUnidad_medida_id()!=0)			query+= ", unidad_medida_id='"+objeto.getUnidad_medida_id()+"'";
					 if(objeto.getHito_tipo_id()!=0)				query+= ", hito_tipo_id='"+objeto.getHito_tipo_id()+"'";
					 												query+= ", acumulable='"+objeto.isAcumulable()+"'";

					 query+=" where id ="+objeto.getId();
							 
					 try {
						statement=conect.createStatement();
						statement.execute(query);
					    conect.close();
					    return true;
					} catch (SQLException e) {e.printStackTrace(); return false;}

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
	
	public static boolean actAvanceCosto(AvanceCosto objeto){
	  	 Connection conect=ConnectionConfiguration.conectar();
	   	
	  	 Statement statement = null;

					 String											query = "update avance_costo set ";
					 if(objeto.getMonto()!=0)								query+= "monto='"+objeto.getMonto()+"'";
					 if(objeto.getCodigoContratacion()!=null)				query+= ", codigo_contratacionl='"+objeto.getCodigoContratacion()+"'";
					 if(objeto.getObjetoGasto()!=0)							query+= ", objeto_gasto='"+objeto.getObjetoGasto()+"'";
					 if(objeto.getAvanceId()!=0)							query+= ", avance_id='"+objeto.getAvanceId()+"'";

					 					 		 
					 		 
					 query+=" where id ="+objeto.getId();
							 
					 try {
						statement=conect.createStatement();
						statement.execute(query);
					    conect.close();
					    return true;
					} catch (SQLException e) {e.printStackTrace(); return false;}

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
	
	public static boolean actAvance(Avance objeto){
	  	 Connection conect=ConnectionConfiguration.conectar();
	  	 Statement statement = null;
	  	 
		 String													query = "update avance set ";
		 if(objeto.getJustificacion()!=null)					query+= "justificacion='"+objeto.getJustificacion()+"'";
		 if(objeto.getCantidad()!=0)							query+= ", cantidad='"+objeto.getCantidad()+"'";
		 if(objeto.getFechaEntrega()!=null)						query+= ", fecha_entrega='"+objeto.getFechaEntrega()+"'";
//		 if(objeto.getCantidadBeneficiarios()!=0)				query+= ", cantidad_beneficiarios='"+objeto.getCantidadBeneficiarios()+"'";	
		 if(objeto.getActividadId()!=0)							query+= ", actividad_id='"+objeto.getActividadId()+"'";
		 if(objeto.getVersion()!=0)								query+= ", version='"+objeto.getVersion()+"'";

		 query+=" where id ="+objeto.getId(); 	
		 try {
			statement=conect.createStatement();
			statement.execute(query);
		    conect.close();
		    return true;
		 }catch (SQLException e) {e.printStackTrace(); return false;}
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
	public static boolean updateProgramacion(Programacion objeto){
	  	 Connection conect=ConnectionConfiguration.conectar();
	  	 Statement statement = null;
	  	 
		 String													query = "update programacion set ";
		 if(objeto.getFechaEntrega()!=null)						query+= "fecha_entrega='"+objeto.getFechaEntrega()+"'";
		 if(objeto.getCantidad()!=0)							query+= ", cantidad='"+objeto.getCantidad()+"'";

		 query+=" where id ="+objeto.getId(); 	
		 try {
			statement=conect.createStatement();
			statement.execute(query);
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
	  	 Connection conect=ConnectionConfiguration.conectar();
	  	 Statement statement = null;
	  	 
		 String										query = "update accion_destinatario set ";
		 if(objeto.getCantidad()!=0)				query+= "cantidad='"+objeto.getCantidad()+"'";
		 if(objeto.getDescripcion()!=null)			query+= ", descripcion='"+objeto.getDescripcion()+"'";
		 if(objeto.getVersion()!=0)					query+= ", version='"+objeto.getVersion()+"'";
		 if(objeto.isBorrado()!=false)				query+= ", borrado='"+objeto.isBorrado()+"'";
		 if(objeto.getBeneficiarioTipoId()!=0)		query+= ", beneficiario_tipo_id='"+objeto.getBeneficiarioTipoId()+"'";
		 if(objeto.getAccionId()!=0)				query+= ", accion_id='"+objeto.getAccionId()+"'";
		 if(objeto.getBeneficiarioGrupoId()!=0)		query+= ", beneficiario_grupo_id='"+objeto.getBeneficiarioGrupoId()+"'";		 

		 query+=" where id ="+objeto.getId(); 	
		 try {
			statement=conect.createStatement();
			statement.execute(query);
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
	  	 Connection conect=ConnectionConfiguration.conectar();
	  	 Statement statement = null;
	  	 
		 String													query = "update avance_cualitativo set ";
		 if(objeto.getAccionCatalogoId() !=0)					query+= "accion_catalogo_id='"+objeto.getAccionCatalogoId()+"'";
		 if(objeto.getTrimestreId()!=0)							query+= ", trimestre_id='"+objeto.getTrimestreId()+"'";
		 if(objeto.getGestionesRealizadas()!=null)				query+= ", gestiones_realizadas='"+objeto.getGestionesRealizadas()+"'";
		 if(objeto.getPrincipalesLogrosAlcanzados()!=null)		query+= ", principales_logros_alcanzados='"+objeto.getPrincipalesLogrosAlcanzados()+"'";
		 if(objeto.getDificultadesLeccionesAprendidas()!=null)	query+= ", dificultades_lecciones_aprendidas='"+objeto.getDificultadesLeccionesAprendidas()+"'";
		 if(objeto.getObjetivosTrimestre()!=null)				query+= ", objetivos_del_siguiente_trimestre='"+objeto.getObjetivosTrimestre()+"'";

		 query+=" where id ="+objeto.getId(); 	
		 try {
			statement=conect.createStatement();
			statement.execute(query);
		    conect.close();
		    return true;
		 }catch (SQLException e) {e.printStackTrace(); return false;}
	}
}
