<%/*
*  Fichero: axiscob001c.jsp
*  @author <a href = "mailto:jpacheco@csi-ti.com">Juan Carlos PAcheco</a> 
*     

*/
%>
<%@ page contentType="text/html;charset=windows-1252" errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page import="java.util.List" %>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<html>
  <head>
    <link rel="stylesheet" href="styles/genericosHtml.css" type="text/css">
    <link rel="stylesheet" href="styles/axisnt.css" type="text/css">
    <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>
    <%-- Especial per controlar els scroll amb iPad --%>
        <link type="text/css" href="styles/jquery.jscrollpane.css" rel="stylesheet" media="only screen and (min-device-width: 768px) and (max-device-width: 1024px)" />
        <style type="text/css" id="page-css"> </style>
    <%-- FI Especial per controlar els scroll amb iPad --%>
    <c:import url="../include/carga_framework_js.jsp" />
    <script language="Javascript" type="text/javascript">

        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/

        function f_onload() {
        
            try{
                document.miForm.NOMBRE.focus();
            } catch (e) {	
                try{
                document.miForm.NOMBRECOMP.focus();
                }catch(e){ alert(e);}
            }
            
            if (document.all) // ES Explorer
                document.getElementById("tabla1").style.marginLeft="1.3%";
            f_cargar_propiedades_pantalla();
        }
        
        function f_but_cancelar() {
            parent.f_cerrar_modal("axiscob001c");
        }        
        
    </script>
  </head>
    <body onload="f_onload();">
        <c:import url="../include/titulo_nt.jsp">
            <c:param name="titulo">
        <axis:alt f="axiscob001" c="TITULO" lit="9908734"/>
        </c:param>
            <c:param name="formulario">
        <axis:alt f="axiscob001" c="FORM" lit="9908006"/>
        </c:param>
            <c:param name="form">axiscob001c</c:param>
        </c:import>
       
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
        
        <form name="miForm" action="" method="POST">
            <input type="hidden" name="operation" value=""/>
            <input type="hidden" name="SPERSON" id="SPERSON" value="${__formdata.SPERSON}" />
            <input type="hidden" name="SNIP" id="SNIP" value="${__formdata.SNIP}" />
            <input type="hidden" name="CAGENTE" id="CAGENTE" value="${__formdata.CAGENTE}" />
            <input type="hidden" name="SSEGURO" id="SSEGURO" value="${__formdata.SSEGURO}" />
            <input type="hidden" name="MODO_SWPUBLI" id="MODO_SWPUBLI" value="${__formdata.MODO_SWPUBLI}" />
            <input type="hidden" name="MODO_BUSQUEDA" id="MODO_BUSQUEDA" value="${__formdata.MODO_BUSQUEDA}" />
            <input type="hidden" name="CONDICION" id="CONDICION" value="${__formdata.CONDICION}" />
            <input type="hidden" name="SEQCAJA" id="SEQCAJA" value="" />            
           
            
            <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0" style="height:10px;">
            <tr>
            <td>
                <div class="separador">&nbsp;</div>
                <div class="titulo">
                    <img src="images/flecha.gif"/>
                    <b><axis:alt f="axiscob001c" c="LIT32" lit="9908006"/></b>
                </div>
                <table class="seccion">
                <tr>                        
                <td align="left">
                    <table class="area" align="center">
                    <tr> 
                        <th style="width:25%;height:0px"></th>
                        <th style="width:25%;height:0px"></th>
                        <th style="width:25%;height:0px"></th>
                        <th style="width:25%;height:0px"></th>
                    </tr>
                    
                    <tr>
                        <axis:ocultar f="axiscob001c" c="POLICY" dejarHueco="false"> 
                        <td class="titulocaja">
                            <b><axis:alt f="axiscob001c" c="POLICY" lit="9001875" /></b>
                        </td>                                            
                        </axis:ocultar>
                        
                        <axis:ocultar f="axiscob001c" c="HOLDER" dejarHueco="false"> 
                        <td class="titulocaja">
                            <b><axis:alt f="axiscob001c" c="HOLDER" lit="9907907" /></b>
                        </td>                                            
                        </axis:ocultar>
                        
                        <axis:ocultar f="axiscob001c" c="BALANCE" dejarHueco="false"> 
                        <td class="titulocaja">
                            <b><axis:alt f="axiscob001c" c="BALANCE" lit="9905069" /></b>
                        </td>                                            
                        </axis:ocultar>
                    </tr>
                    
                    <tr>
                        <axis:visible f="axiscob001c" c="POLICY">
                        <td class="campocaja">
                            <input type="text" style="width:300px" class="campo campotexto" value="${__formdata.NPOLIZA}" name="NPOLIZA" id="NPOLIZA" size="15"
                                   <axis:atr f="axiscob001c" c="POLICY" a="modificable=false"/>/>
                        </td>
                        </axis:visible>  
                        
                        <axis:visible f="axiscob001c" c="HOLDER">
                        <td class="campocaja">
                            <input type="text" style="width:300px" class="campo campotexto" value="${__formdata['NOMBRE']}" name="NOMBRE" id="NOMBRE" size="15"
                                   <axis:atr f="axiscob001c" c="HOLDER" a="modificable=false"/>/>
                        </td>
                        </axis:visible>
                        
                        <axis:visible f="axiscob001c" c="BALANCE">
                        <td class="campocaja">
                            <input type="text" style="width:300px" class="campo campotexto" value="<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${__formdata.TRANS_SPL}"/>" name="TRANS_SPL" id="TRANS_SPL" size="15"
                                   <axis:atr f="axiscob001c" c="BALANCE" a="modificable=false"/>/>
                        </td>
                        </axis:visible>  
                    </tr>
                    </table>
                    <div class="separador">&nbsp;</div>
                    
                    <c:set var="title4"><axis:alt f="axiscob001c" c="POLICY_T" lit="102829"/></c:set>
                    <c:set var="title3"><axis:alt f="axiscob001c" c="POLICY_TARGET" lit="9908181"/></c:set>
                    <c:set var="title2"><axis:alt f="axiscob001c" c="HOLDER_T" lit="9907907"/></c:set>
                    <c:set var="title1"><axis:alt f="axiscob001c" c="PREMIUM_T" lit="100563"/></c:set>
                    <c:set var="title0"><axis:alt f="axiscob001c" c="DESTINY_T" lit="9907906"/></c:set>
                    
                    <div class="seccion displayspacePersonas"> 
                    
                        <display:table name="${sessionScope.listaPolizas}" 
                            id="miListaId"
                            export="false" 
                            class="dsptgtable" 
                            pagesize="10" 
                            defaultsort="1"
                            defaultorder="ascending" 
                            requestURI="modal_axiscob001c.do?paginar=true" 
                            sort="list" 
                            cellpadding="0" 
                            cellspacing="0">
                        
                        <%@ include file="../include/displaytag.jsp"%>
                        
                        <display:column title="${title4}" 
                            sortable="true" style="width:10%;" 
                            sortProperty="miListaId.SSEGURO" 
                            headerClass="headwidth5 sortable"  
                            media="html"
                            autolink="false" >
                        <div class="dspNumber">                        
                            ${miListaId.NPOLIZA}
                        </div>                        
                        </display:column>
                        
                        <display:column title="${title3}" 
                            sortable="true" style="width:10%;" 
                            sortProperty="miListaId.SSEGURO_D" 
                            headerClass="headwidth5 sortable"  
                            media="html"
                            autolink="false" >
                        <div class="dspNumber">                        
                            ${miListaId.NPOLIZAD}
                        </div>
                        </display:column>
                        
                        <display:column title="${title2}" 
                            sortable="true" 
                            style="width:50%;" 
                            sortProperty="miListaId.TNOMBRE"
                            headerClass="sortable" 
                            media="html" autolink="false" >
                        <div class="dspText">
                            ${miListaId.TNOMBRE}
                        </div>
                        </display:column>
                        
                        <display:column 
                            title="${title1}" 
                            sortable="true" 
                            style="width:5%;" 
                            sortProperty="miListaId.IMOVIMI"
                            headerClass="headwidth5 
                            sortable"  media="html" 
                            autolink="false" >
                        <div class="dspNumber">
                            ${miListaId.IMOVIMI}
                        </div>
                        </display:column>
                        
                        </display:table>
                    </div>
                    
                </td>                        
                </tr>
                </table>
            </td>
            </tr>            
            </table>
            
            <div class="separador">&nbsp;</div>
            <c:import url="../include/botonera_nt.jsp"><c:param name="f">axiscob001c</c:param><c:param name="f">axiscob001c</c:param>
                <c:param name="f">axiscob001c</c:param>
                <c:param name="__botones">cancelar</c:param>
            </c:import>
        </form>
    <c:import url="../include/mensajes.jsp" />
    </div>
    </body>
    <c:if test="${ (fn:containsIgnoreCase(header['User-Agent'],'ipad') )   }">
      <script language="Javascript" type="text/javascript">  
        retocarPAGE_CSS('axiscob001c');
      </script>                   
    </c:if>
</html>

