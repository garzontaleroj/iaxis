<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=windows-1252"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%
// eso lo que sigue haces en teoria en el service: llamar a un package, recuperas los objetos, y los dejas en la request.
// aqui lo simulo todo con un simple "select"
//axis.mvc.model.UsuarioBean __usuario=(axis.mvc.model.UsuarioBean)session.getAttribute("__usuario");
//java.sql.Connection conn=__usuario.getConnection();
//axis.jdbc.AccesoSQL accesoSQL=new axis.jdbc.AccesoSQL(null);
//request.setAttribute("lista",accesoSQL.executeQuery(conn,"select * from paises"));
//axis.jdbc.ConexionFactoria.closeConnection(conn);
// ahora sigue la preparación de datos en solo formato Excel

%>

<form name="miForm" action="" method="POST">         
    <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0" style="height:20px">       
            <tr> 
                <td class="campocaja" >

<display:table name="${REC_LSTCARTERA}" id="miLista" export="true" class="dsptgtable" pagesize="-1" style="visibility:hidden;display:none"  requestURI="modal_axisexporter.do?paginar=true" sort="list" cellpadding="0" cellspacing="0">
    <display:column title="Ram"          media="csv excel xml pdf">${miLista.OB_IAX_LISTADOSINIESTROS_WM.TRAMO}</display:column> 
    <display:column title="Nº Sinistre"          media="csv excel xml pdf">${miLista.OB_IAX_LISTADOSINIESTROS_WM.NSINIES         }</display:column>
    <display:column title="Pòlissa"          media="csv excel xml pdf">${miLista.OB_IAX_LISTADOSINIESTROS_WM.NPOLIZA         }</display:column>    
    <display:column title="Data Efecte"          media="csv excel xml pdf"><fmt:formatDate pattern="dd/MM/yyyy" value="${miLista.OB_IAX_LISTADOSINIESTROS_WM.FEFECTO}"/></display:column>    
    <display:column title="Nom Assegurat"          media="csv excel xml pdf">${miLista.OB_IAX_LISTADOSINIESTROS_WM.TASEGURADO}</display:column>
    <display:column title="Data Sinistre"          media="csv excel xml pdf"><fmt:formatDate pattern="dd/MM/yyyy" value="${miLista.OB_IAX_LISTADOSINIESTROS_WM.FSINIES}"/></display:column>
    <display:column title="Data Apertura"          media="csv excel xml pdf"><fmt:formatDate pattern="dd/MM/yyyy" value="${miLista.OB_IAX_LISTADOSINIESTROS_WM.FENTRAD}"/></display:column>
    <display:column title="Data Tancament"          media="csv excel xml pdf"><fmt:formatDate pattern="dd/MM/yyyy" value="${miLista.OB_IAX_LISTADOSINIESTROS_WM.FCIERRE}"/></display:column>
    <display:column title="Causa"          media="csv excel xml pdf">${miLista.OB_IAX_LISTADOSINIESTROS_WM.TCAUSIN}</display:column>
    <display:column title="Motiu"          media="csv excel xml pdf">${miLista.OB_IAX_LISTADOSINIESTROS_WM.TMOTSIN}</display:column>
    <display:column title="Tràmit"          media="csv excel xml pdf">${miLista.OB_IAX_LISTADOSINIESTROS_WM.TTRAMIT}</display:column>               
    <display:column title="Garantia"          media="csv excel xml pdf">${miLista.OB_IAX_LISTADOSINIESTROS_WM.TGARANT}</display:column>    
    <display:column title="I. Reserva Inicial"          media="csv excel xml pdf"><fmt:formatNumber  pattern="0.00" value="${miLista.OB_IAX_LISTADOSINIESTROS_WM.IVALORI}"/></display:column>
    <display:column title="I. Pagaments Parcials"          media="csv excel xml pdf"><fmt:formatNumber  pattern="0.00" value="${miLista.OB_IAX_LISTADOSINIESTROS_WM.IPAGOST}"/></display:column>    
    <display:column title="I. Reserva Final"          media="csv excel xml pdf"><fmt:formatNumber  pattern="0.00" value="${miLista.OB_IAX_LISTADOSINIESTROS_WM.IVALORF}"/></display:column>        
    <display:column title="I. Recobrament"          media="csv excel xml pdf"><fmt:formatNumber  pattern="0.00" value="${miLista.OB_IAX_LISTADOSINIESTROS_WM.IRECOBRO}"/></display:column>            
    <display:column title="Agent"          media="csv excel xml pdf">${miLista.OB_IAX_LISTADOSINIESTROS_WM.TAGENTE}</display:column> 
    <display:column title="Codi Usuari"          media="csv excel xml pdf">${miLista.OB_IAX_LISTADOSINIESTROS_WM.CUSUALT}</display:column> 
    
    <display:setProperty name="export.pdf" value="true" />
    <display:setProperty name="export.pdf.class" value="org.displaytag.export.PdfView" />
    <display:setProperty name="export.pdf.filename" value="Llistat Sinistres.pdf" /> 
    <display:setProperty name="export.excel.filename" value="Llistat Sinistres.xls" />
    <display:setProperty name="export.csv.filename" value="Llistat Sinistres.csv" />
    <display:setProperty name="export.xml.filename" value="Llistat Sinistres.xml" /> 
    <display:setProperty name="export.banner" value="<div class='gridexportlinks'>Opcions d''exportació: {0}</div>"/> 
</display:table>

                </td>
           </tr>   
         </table>
         </form>
