
<%@ page contentType="text/html;charset=windows-1252" errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page import="java.util.List" %>
<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
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
        /*********************************** NAVEGATION *****************************************/
        /****************************************************************************************/

        function f_onload() {    
            f_cargar_propiedades_pantalla();
        }
         
          /****************************************************************************************/
        /*********************************** BUTTONS*****************************************/
        /****************************************************************************************/
                
        function f_but_aceptar(cual, cont) {
             var NNUMIDE = "";      
             var NOMBRE = "";
             var SPERSON = "";      
             var i ="";            

            if (!objUtiles.estaVacio(cont))                    
            {
                NNUMIDE = document.getElementById("NNUMIDE_"+cont).value; 
                

            }
            
            //if (!objUtiles.estaVacio(cual) || !objUtiles.estaVacio(cont) )           
            if (!objUtiles.estaVacio(cual) || !objUtiles.estaVacio(cont) )  {         
                // Seleccionada por el hipervínculo
                SPERSON = cual; 
                
               
            }
            else if (!objUtiles.estaVacio(document.miForm.seleccionaPersona)) {
                // Checkeada por el radio button
                
                i = objUtiles.f_GuardaCasillasChecked("seleccionaPersona");

                NNUMIDE = document.getElementById("NNUMIDE_"+i).value;
                NOMBRE = document.getElementById("NOMBRE_"+i).value;
               
 
            }             
           
            if (objUtiles.estaVacio(NNUMIDE) ) 
                alert(objJsMessages.jslit_selecciona_una_poliza);
            else
            {
                // Si hay una seleccionada, llamar al Action.
              if (!objUtiles.estaVacio(NNUMIDE)){
              
               
                    parent.f_aceptar_axisadm090b(NNUMIDE);   }
              else  {
                  alert ("death" + SPERSON);        
                 
               //   objAjax.invokeAsyncCGI("modal_axisctr019.do", callbackAjaxCargarURL, "operation=ajax_cargar_url&SPRODUC=" + SPRODUC+"&NPOLIZA = "+NPOLIZA, this, objJsMessages.jslit_cargando);                                  
                   }
            }
            
            
        }
        
        function f_but_cancelar() {
        parent.f_cerrar_axisadm090b();
        }        
        
        function f_but_buscar() {
            //Si la validación es correcta (true), ejecutamos la acción
            if (objValidador.validaEntrada()) {
                objUtiles.ejecutarFormulario("modal_axisadm093b.do","busqueda_persona",document.miForm, "_self", objJsMessages.jslit_buscando_personas);   
            }
        }
        
    </script>
        

    </head>
    <body onload="f_onload()">
        <div id="wrapper" class="wrapper">
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
        <form name="miForm" action="" method="POST">
            <input type="hidden" name="operation" value=""/>
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt f="axisadm093b" c="FORM" lit="9908024" /></c:param>
                <c:param name="producto"><axis:alt f="axisadm093b" c="FORM" lit="9908024" /></c:param>
                <c:param name="form">axisadm090b</c:param>
            </c:import>
            <!-- Area de campos  -->
            <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <!--campos-->
                        <table class="seccion">
                            <tr>
                                <td>
                                    <!-- Área 1 -->
                                    <table class="area" align="center">
                                        <tr>
                                            <th style="width:15%;height:0px"></th>
                                            <th style="width:15%;height:0px"></th>
                                            <th style="width:15%;height:0px"></th>
                                            <th style="width:15%;height:0px"></th>
                                            <th style="width:15%;height:0px"></th>
                                            <th style="width:15%;height:0px"></th>
                                        </tr>
                                    
                                        </table>
                                </td>
                            </tr>
                        </table>
                    
                        <div class="separador">&nbsp;</div>
                            <!-- DisplayTag ListaPersonas -->
                            <c:set var="title1"><axis:alt f="axisadm093b" c="PIDE" lit="9908025"/></c:set>
                            <c:set var="title2"><axis:alt f="axisadm093b" c="PNAME" lit="9000493"/></c:set>
                            <c:set var="title3"><axis:alt f="axisadm093b" c="PNAME" lit="9907691"/></c:set>
                            <c:set var="title4"><axis:alt f="axisadm093b" c="PNAME" lit="9907695"/></c:set>
                            <c:set var="title5"><axis:alt f="axisadm093b" c="PNAME" lit="9907691"/></c:set>               
                                            
                                          

                            <%int contador = 0;%>
                            <div class="seccion displayspacePersonas">
                            
                                <display:table name="${map_arch}" id="miListaId" export="false" class="dsptgtable" pagesize="15" defaultsort="1"  requestURI="modal_axisadm090b.do?paginar=true" sort="list" cellpadding="0" cellspacing="0">
                                   <%@ include file="../include/displaytag.jsp"%>
                                    
                                    <c:set var="contador"><%=contador%></c:set>                                      
                                    <display:column title="" sortable="false" headerClass="headwidth5 sortable" style="width:5%;"  media="html" autolink="false" >    
                                        <div class="dspIcons"><input <c:if test="${miListaId['seleccionaPersona']}">checked</c:if> type="radio" id="seleccionaPersona" name="seleccionaPersona" value="${contador}"/></div>
                                    </display:column>
                                    
                                    <display:column title="${title1}" sortable="true" style="width:15%;" sortProperty="NNUMIDE" headerClass="headwidth5 sortable"  media="html" autolink="false" >
                                        <div class="dspText">${miListaId['CDARCHI']}</div>
                                        <input type="hidden" id="NNUMIDE_${contador}" name="NNUMIDE_${contador}" value="${miListaId['CDARCHI']}"/>     
                                       
                                      </display:column>
                                    
                                    <display:column title="${title2}" sortable="true" style="width:25%;" sortProperty="NOMBRE" headerClass="sortable"  media="html" autolink="false" >
                                        <div class="dspText">${miListaId['CPROCES']}</div>
                                        <input type="hidden" id="NOMBRE_${contador}" name="NOMBRE_${contador}" value="${miListaId['NOMBRE']}"/>
                                    </display:column>
                                    
                                    <display:column title="${title3}" sortable="true" style="width:25%;" sortProperty="NOMBRE" headerClass="sortable"  media="html" autolink="false" >
                                        <div class="dspText">${miListaId['CARCEST']}</div>
                                        <input type="hidden" id="NOMBRE_${contador}" name="NOMBRE_${contador}" value="${miListaId['NOMBRE']}"/>
                                    </display:column>
                                    
                                    <display:column title="${title5}" sortable="true" style="width:25%;" sortProperty="NOMBRE" headerClass="sortable"  media="html" autolink="false" >
                                        <div class="dspText"><a href="javascript:f_but_aceptar('${miListaId['NOMBRE']}','${contador}')">${miListaId['CTIPARC']}</a></div>
                                        <input type="hidden" id="NOMBRE_${contador}" name="NOMBRE_${contador}" value="${miListaId['NOMBRE']}"/>
                                    </display:column>
                                    
                                    <display:column title="${title4}" sortable="true" style="width:25%;" sortProperty="NOMBRE" headerClass="sortable"  media="html" autolink="false" >
                                        <div class="dspText"><a href="javascript:f_but_aceptar('${miListaId['NOMBRE']}','${contador}')">${miListaId['CSEPARA']}</a></div>
                                        <input type="hidden" id="NOMBRE_${contador}" name="NOMBRE_${contador}" value="${miListaId['NOMBRE']}"/>
                                    </display:column>
                                    
                                    
                                    
                                    <%contador++;%>
                                </display:table>
                               
                            </div>	
                            
                    </td>
                </tr>
            </table>						
            
            <div class="separador">&nbsp;</div>
            <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisadm093b</c:param>
                <c:param name="__botones"><axis:visible f="axisadm093b" c="BT_CANCELAR">cancelar</axis:visible><axis:visible f="axisadm093b" c="BT_ACEPTAR">,aceptar</axis:visible></c:param>
            </c:import>
        </form>

    <c:import url="../include/mensajes.jsp" />
    </div>
    </body>
    

</html>