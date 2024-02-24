<%/**
*  Fichero: axisper037.jsp
*  @author <a href = "mailto:amartinez@csi-ti.com">Alex Martinez</a>
*  
*  Pantalla de Mant. de promotores y respresentantes de venta
*
*  Fecha: 27/11/2012
*/
%>

<%@ page contentType="text/html;charset=windows-1252"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
    <head>
        <title><axis:alt f="axisper037" c="NOMFORM" lit=""/></title>
        <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
        <link rel="stylesheet" href="styles/displaytag.css">

        <c:import url="../include/carga_framework_js.jsp" />
        <script type="text/javascript">
        
            
            function f_but_salir() {
                //Esborrem les vars de session
                objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axisper037", "cancelar", document.miForm, "_self");
            }
            
            function f_abrir_axisper038(){
                document.miForm.SPERSON.value = null;
                document.miForm.CTIPO.value = null; 
                document.miForm.CSUBTIPO.value = null;
                objUtiles.abrirModal("axisper038", "src", "modal_axisper038.do?operation=form"); 
            }
            
            function f_but_buscar(SPERSON,CTIPO,CSUBTIPO,TCOMPANIA,TOFICINA){
                                  
                document.miForm.SPERSON.value = SPERSON;
                document.miForm.CTIPO.value = CTIPO; 
                document.miForm.CSUBTIPO.value = CSUBTIPO; 
                document.miForm.TCOMPANIA.value = TCOMPANIA;
                document.miForm.TOFICINA.value = TOFICINA;
                objUtiles.ejecutarFormulario ("axis_axisper037.do", "buscar", document.miForm, "_self", objJsMessages.jslit_cargando);
            }
            
            function f_abrir_axisper039(SPERSON,MODO){
                objUtiles.abrirModal("axisper039", "src", "modal_axisper039.do?operation=form&SPERSON="+SPERSON+"&CMODO="+MODO); 
            }
            
            function f_cerrar_axisper039(){
                objUtiles.cerrarModal("axisper039");
            }
            
            function f_cerrar_axisper038(){
                objUtiles.cerrarModal("axisper038");
            }
            
            function f_aceptar_axisper039(SPERSON){
                f_but_buscar(SPERSON);
            }
            
            function f_borrar_emppleado(SPERSON){
                var confirma=confirm(objJsMessages.jslit_confirma_borrar);
                if (confirma) {
                    document.miForm.SPERSON.value = SPERSON;
                    objUtiles.ejecutarFormulario ("axis_axisper037.do", "borrar", document.miForm, "_self", objJsMessages.jslit_cargando);
                }
            }
            
            function f_onload(){
                f_cargar_propiedades_pantalla();
                <c:if test="${empty listasEmp}">
                     f_abrir_axisper038();
                </c:if>
                
                var ok = '${__formdata.OK}';
                if(ok == '0'){
                    f_but_buscar();
                }
            }
            
        </script>
        
    </head>
    
    <body onload="f_onload()">
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="titulo"><axis:alt f="axisper037" c="TIT_002" lit="9904587" /></c:param>
            <c:param name="nid" value="axisper038" />
        </c:import>
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="titulo"><axis:alt f="axisper037" c="TIT_003" lit="9904586" /></c:param>
            <c:param name="nid" value="axisper039" />
        </c:import>
        
        <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
    
    <form name="miForm" action="" method="POST">
    
        <input type="hidden" id="operation" name="operation" value="${__formdata.operation}"/>
        
        <input type="hidden" id="SPERSON" name="SPERSON" value="${__formdata.SPERSON}"/>
        <input type="hidden" id="CTIPO" name="CTIPO" value="${__formdata.CTIPO}"/>
        <input type="hidden" id="CSUBTIPO" name="CSUBTIPO" value="${__formdata.CSUBTIPO}"/>
        <input type="hidden" id="TCOMPANIA" name="TCOMPANIA" value="${__formdata.TCOMPANIA}"/>
        <input type="hidden" id="TOFICINA" name="TOFICINA" value="${__formdata.TOFICINA}"/>
        
        <c:set var="pantalla" value="axisper037"/>
        <c:set var="literalPantalla" value=""/>
        <c:import url="../include/titulo_nt.jsp">
                <c:param name="titulo"><axis:alt c="TITULO" f="axisper037" lit="9904582"/></c:param>
                <c:param name="formulario"><axis:alt f="axisper037" c="TITPANT" lit="${literalPantalla}"/></c:param>
                <c:param name="form">${pantalla}</c:param>
        </c:import>
   
        
    <table class="mainTableDimensions base"  align="center" cellpadding="0" cellspacing="0"> 
       <tr>
            <td>
                    <table class="seccion">
                        <tr>
                            <td align="left" >
                                <table class="area" align="center">
                                    <tr>
                                        <th style="width:15%;height:0%;"/>
                                        <th style="width:15%;height:0%;"/>
                                        <th style="width:15%;height:0%;"/>
                                        <th style="width:15%;height:0%;"/>
                                        <th style="width:15%;height:0%;"/>
                                        <th style="width:15%;height:0%;"/>
                                        <th style="width:10%;height:0%;"/>
                                    </tr>
                                    <tr>
                                        <td colspan="7">
                                            
                                            <div class="titulo" >
                                            	<div style="float:left">
                                                <img src="images/flecha.gif"/>
                                                <axis:alt f="axisper037" c="FIND" lit="151502"/>
                                                <img id="find" border="0" src="images/find.gif" onclick="f_abrir_axisper038()" style="cursor:pointer"/>
                                              </div>
                                                <div style="float:right">
                                                <img id="new" border="0" src="images/new.gif" title="<axis:alt f="axisper037" c="NEW" lit="1000428"/>" 
                                                    alt="<axis:alt f="axisper037" c="NEW" lit="1000428"/>"  onclick="f_abrir_axisper039(null,'NEW')" style="cursor:pointer"/>
                                            		</div>
                                                
                                            </div>
                                            
                                            <div class="separador">&nbsp;</div>
                                            <c:set var="title1"><axis:alt f="axisper037" c="NNUMIDE" lit="9904434"/></c:set>
                                            <c:set var="title2"><axis:alt f="axisper037" c="TTIPIDE" lit="9904433"/></c:set>
                                            <c:set var="title3"><axis:alt f="axisper037" c="NOMBREPER" lit="105940"/></c:set>
                                            <c:set var="title4"><axis:alt f="axisper037" c="CTIPO" lit="100565"/></c:set>
                                            <c:set var="title5"><axis:alt f="axisper037" c="CSUBTIPO" lit="9904577"/></c:set>
                                            <c:set var="title6"><axis:alt f="axisper037" c="COMPANIA" lit="9901223"/></c:set>
                                            <c:set var="title7"><axis:alt f="axisper037" c="OFICINA" lit="102347"/></c:set>
                                            <c:set var="title8"><axis:alt f="axisper037" c="SPERCOORD" lit="9902626"/></c:set>
                                            
                                            <div class="displayspaceMaximo">
                                                 <display:table name="${listasEmp}" id="miListaId" export="false" class="dsptgtable" pagesize="10"  requestURI="axis_axisper037.do?paginar=true"  sort="list" cellpadding="0" cellspacing="0">
                                                <%@ include file="../include/displaytag.jsp"%>
                                                    <display:column title="${title1}" sortable="true" sortProperty="NNUMIDE" headerClass="sortable"  media="html" autolink="false">
                                                        <div class="dspText">${miListaId.NNUMIDE}</div>
                                                    </display:column>
                                                    <display:column title="${title2}" sortable="true" sortProperty="TTIPIDE" headerClass="sortable"  media="html" autolink="false" >
                                                        <div class="dspText">${miListaId.TTIPIDE}</div>
                                                    </display:column> 
                                                    <display:column title="${title3}" sortable="true" sortProperty="TNOMBRE" headerClass="sortable"  media="html"  >
                                                        <div class="dspText">${miListaId.TNOMBRE}</div>
                                                    </display:column>
                                                    <display:column title="${title4}" sortable="true" sortProperty="TTIPO" headerClass="sortable"  media="html" autolink="false" >
                                                        <div class="dspText">${miListaId.TTIPO}</div>
                                                    </display:column>
                                                    <display:column title="${title5}" sortable="true" sortProperty="TSUBTIPO" headerClass="sortable"  media="html" autolink="false" >
                                                       <div class="dspText">${miListaId.TSUBTIPO}</div>
                                                    </display:column>
                                                    <display:column title="${title6}" sortable="true" sortProperty="TCOMPANIA" headerClass="sortable"  media="html" autolink="false" >
                                                        <div class="dspText">${miListaId.TCOMPANIA}</div>
                                                    </display:column>
                                                    <display:column title="${title7}" sortable="true" sortProperty="TPUNTOVENTA" headerClass="sortable"  media="html" autolink="false" >
                                                        <div class="dspText">${miListaId.TPUNTOVENTA}</div>
                                                    </display:column>
                                                    <display:column title="${title8}" sortable="true" sortProperty="TSPERCOORD" headerClass="sortable"  media="html" autolink="false" >
                                                        <div class="dspText">${miListaId.TSPERCOORD}</div>
                                                    </display:column>
                                                     <display:column title="" sortable="false"  headerClass="headwidth5 sortable"  media="html" autolink="false" >
                                                       <div class="dspIcons"><img border="0" alt="<axis:alt f="axisper037" c="NOVVIG2" lit="9000552"/>" title1="<axis:alt f="axisper037" c="NOVVIG2" lit="9000552"/>" src="images/lapiz.gif" 
                                                        style="cursor:pointer;" onclick="javascript:f_abrir_axisper039('${miListaId.SPERSON}','MODIF')"/></div>
                                                      </display:column>
                                                    <display:column title="" sortable="false"  headerClass="headwidth5 sortable"  media="html" autolink="false" >
                                                        <div class="dspIcons"><img border="0" alt="<axis:alt f="axisper037" c="NOVVIG2" lit="9001333"/>" title1="<axis:alt f="axisper037" c="NOVVIG2" lit="9001333"/>" src="images/delete.gif" 
                                                        style="cursor:pointer;" onclick="javascript:f_borrar_emppleado('${miListaId.SPERSON}')"/></div>
                                                     </display:column>
                                                    
                                                </display:table>
                                            </div>	
                                        </td>
                                    </tr>    
                                    <tr>
                                        <td>
                                            <div class="separador">&nbsp;</div>
                                            <div class="separador">&nbsp;</div>
                                        </td>
                                    </tr>
                                    
                                </table>
                            </td>
                        </tr>
                    </table>
            </td>
        </tr>    
    </table>
         
<div class="separador">&nbsp;</div>
<!-- Botonera -->
<c:import url="../include/botonera_nt.jsp"><c:param name="f">axisper037</c:param>
    <c:param name="__botones">salir</c:param>
</c:import>

</form>

<c:import url="../include/mensajes.jsp" />
    
</body>
</html>

