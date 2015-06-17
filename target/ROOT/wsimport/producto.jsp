<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="py.gov.stp.mh.test.Client" %>
<%@ page import="py.gov.stp.mh.tools.SqlHelper" %>
<%@ page import="py.gov.stp.mh.clasificadores.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Fuente Financiamiento</title>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
</head>
<body>
<div id="niveles">
<% 
    int anio=2016;
    int pais=1;
    int version = 2;

	List lista = Client.todosLosProductosPorAnio(anio, version);

	for(Iterator<Producto> iterador = lista.iterator(); iterador.hasNext(); ) {
		Producto item = iterador.next();
        //SqlHelper.insertProductosPresupuesto(item.getNivel(), item.getEntidad(), item.getTipoPrograma(), item.getCodigoPrograma(), item.getCodigoSubprograma(), item.getCodigoProyecto(), item.getCodigoProducto(), item.getVersion(), item.getCodigoUnidadMedida(),  anio, item.getNumeroFila());
        SqlHelper.insertProductosPresupuestoMeta(item.getNivel(), item.getEntidad(), item.getTipoPrograma(), item.getCodigoPrograma(), item.getCodigoSubprograma(), item.getCodigoProyecto(), item.getCodigoProducto(), item.getCodigoProducto(), item.getCodigoUnidadMedida(),anio , 1, item.getMetaEnero());
        SqlHelper.insertProductosPresupuestoMeta(item.getNivel(), item.getEntidad(), item.getTipoPrograma(), item.getCodigoPrograma(), item.getCodigoSubprograma(), item.getCodigoProyecto(), item.getCodigoProducto(), item.getCodigoProducto(), item.getCodigoUnidadMedida(),anio , 2, item.getMetaFebrero());
        SqlHelper.insertProductosPresupuestoMeta(item.getNivel(), item.getEntidad(), item.getTipoPrograma(), item.getCodigoPrograma(), item.getCodigoSubprograma(), item.getCodigoProyecto(), item.getCodigoProducto(), item.getCodigoProducto(), item.getCodigoUnidadMedida(),anio , 3, item.getMetaMarzo());
        SqlHelper.insertProductosPresupuestoMeta(item.getNivel(), item.getEntidad(), item.getTipoPrograma(), item.getCodigoPrograma(), item.getCodigoSubprograma(), item.getCodigoProyecto(), item.getCodigoProducto(), item.getCodigoProducto(), item.getCodigoUnidadMedida(),anio , 4, item.getMetaAbril());
        SqlHelper.insertProductosPresupuestoMeta(item.getNivel(), item.getEntidad(), item.getTipoPrograma(), item.getCodigoPrograma(), item.getCodigoSubprograma(), item.getCodigoProyecto(), item.getCodigoProducto(), item.getCodigoProducto(), item.getCodigoUnidadMedida(),anio , 5, item.getMetaMayo());
        SqlHelper.insertProductosPresupuestoMeta(item.getNivel(), item.getEntidad(), item.getTipoPrograma(), item.getCodigoPrograma(), item.getCodigoSubprograma(), item.getCodigoProyecto(), item.getCodigoProducto(), item.getCodigoProducto(), item.getCodigoUnidadMedida(),anio , 6, item.getMetaJunio());
        SqlHelper.insertProductosPresupuestoMeta(item.getNivel(), item.getEntidad(), item.getTipoPrograma(), item.getCodigoPrograma(), item.getCodigoSubprograma(), item.getCodigoProyecto(), item.getCodigoProducto(), item.getCodigoProducto(), item.getCodigoUnidadMedida(),anio , 7, item.getMetaJulio());
        SqlHelper.insertProductosPresupuestoMeta(item.getNivel(), item.getEntidad(), item.getTipoPrograma(), item.getCodigoPrograma(), item.getCodigoSubprograma(), item.getCodigoProyecto(), item.getCodigoProducto(), item.getCodigoProducto(), item.getCodigoUnidadMedida(),anio , 8, item.getMetaAgosto());
        SqlHelper.insertProductosPresupuestoMeta(item.getNivel(), item.getEntidad(), item.getTipoPrograma(), item.getCodigoPrograma(), item.getCodigoSubprograma(), item.getCodigoProyecto(), item.getCodigoProducto(), item.getCodigoProducto(), item.getCodigoUnidadMedida(),anio , 9, item.getMetaSetiembre());
        SqlHelper.insertProductosPresupuestoMeta(item.getNivel(), item.getEntidad(), item.getTipoPrograma(), item.getCodigoPrograma(), item.getCodigoSubprograma(), item.getCodigoProyecto(), item.getCodigoProducto(), item.getCodigoProducto(), item.getCodigoUnidadMedida(),anio , 10, item.getMetaOctubre());
        SqlHelper.insertProductosPresupuestoMeta(item.getNivel(), item.getEntidad(), item.getTipoPrograma(), item.getCodigoPrograma(), item.getCodigoSubprograma(), item.getCodigoProyecto(), item.getCodigoProducto(), item.getCodigoProducto(), item.getCodigoUnidadMedida(),anio , 11, item.getMetaNoviembre());
        SqlHelper.insertProductosPresupuestoMeta(item.getNivel(), item.getEntidad(), item.getTipoPrograma(), item.getCodigoPrograma(), item.getCodigoSubprograma(), item.getCodigoProyecto(), item.getCodigoProducto(), item.getCodigoProducto(), item.getCodigoUnidadMedida(),anio , 12, item.getMetaDiciembre());
	}
	%>
	Proyecto<br> 

</div>
</body>
</html>