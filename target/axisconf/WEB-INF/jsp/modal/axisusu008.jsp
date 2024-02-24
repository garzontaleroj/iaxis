<%/**
*  Fichero: axisusu008.jsp
*  Pantalla de busqueda de roles
*
*  Fecha: 03/10/2012
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
        <title><axis:alt f="axisusu008" c="NOMBREPANTALLA" lit="9904279"/></title>
        <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>          

        <style type="text/css">
            .displayspaceMaximo {
                width:99.8%;
                height: expression( this.scrollHeight > 349 ? "350px" : "auto" );
                max-height:350px;
                overflow-x: hidden;
                overflow-y: auto;
                border: 1px solid #DDDDDD;
            }
        </style>

        <c:import url="../include/carga_framework_js.jsp" />
        
        <script type="text/javascript">        
            
            /****************************************************************************************/
            /*********************************** NAVEGACION *****************************************/
            /****************************************************************************************/
            
            function f_onload() {
                f_cargar_propiedades_pantalla();
            }

            function f_but_buscar() {
                objUtiles.ejecutarFormulario ("modal_axisusu008.do", "buscar", document.miForm, "_self", objJsMessages.jslit_cargando);
            }

            function f_but_cancelar() {
                parent.f_cerrar_axisusu008();            
            } 
            
            function f_but_nuevo() {
                parent.f_nou();            
            } 
            
            function f_seleccionar_indice(crol,cempres){
                objDom.setValorPorId("CROLSEL",crol);
                objDom.setValorPorId("CEMPRESSEL",cempres);
            }
            
            function f_but_aceptar() {
                var crol = objDom.getValorPorId("CROLSEL");
                var cempres = objDom.getValorPorId("CEMPRESSEL");
                parent.f_aceptar_axisusu008(crol,cempres);       
            }

        </script>
    </head>
    
    <body onunload="try { f_clear_resources(document.body) } catch (e) {}" onload="f_onload()" onkeypress="if (event.keyCode==13)  { f_but_buscar() }">
    
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
        
        <form name="miForm" action="" method="POST">
            <input type="hidden" name="operation" value=""/>    
            <input type="hidden" name="CROLSEL" id="CROLSEL" value=""/> 
            <input type="hidden" name="CEMPRESSEL" id="CEMPRESSEL" value=""/> 
            
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt f="axisusu008" c="BUSC_ROL" lit="9904279"/></c:param> 
                <c:param name="titulo"><axis:alt f="axisusu008" c="BUSC_ROL" lit="9904279"/></c:param> 
                <c:param name="form">axisusu008</c:param>
            </c:import>

            <!-- Área de campos  -->
            <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <div class="separador">&nbsp; </div>                                        
                        <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axisusu008" c="FILTRO" lit="1000178" /></div>
                        <table class="seccion">
                            <tr>
                                <td>
                                    <table class="area" align="center">
                                        <tr>
                                            <th style="width:25%;height:0px"></th>
                                            <th style="width:25%;height:0px"></th>
                                            <th style="width:25%;height:0px"></th>
                                            <th style="width:25%;height:0px"></th>
                                        </tr>
                                        <tr>
                                            <td class="titulocaja">
                                                <b><axis:alt f="axisusu008" c="CROL" lit="9901939"/></b> <%-- Nombre usuario --%>
                                            </td>
                                            <td class="titulocaja">
                                                <b><axis:alt f="axisusu008" c="TROL" lit="9904280"/></b> <%-- Delegación --%>
                                            </td>
                                            <td class="titulocaja">
                                                &nbsp;
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="campocaja">
                                                <input type="text" class="campowidthinput campo campotexto" id="CROL" name="CROL" size="15"
                                                title="<axis:alt f="axisusu008" c="CROL" lit="9901939"/>" style="width:80%" value=""/>
                                            </td>
                                            <td class="campocaja" colspan="2">
                                                <input type="text" class="campowidthinput campo campotexto" id="TROL" name="TROL" size="15"
                                                title="<axis:alt f="axisusu008" c="TROL" lit="9904280"/>" style="width:80%" value=""/>   
                                                &nbsp;&nbsp;&nbsp;&nbsp;
                                                <img id="find" border="0" src="images/find.gif" alt="<axis:alt f="axisusu008" c="BUSCAR" lit="9000508"/>" title="<axis:alt f="axisusu008" c="BUSCAR_TIT" lit="9000508"/>"
                                                onclick="f_but_buscar()" style="cursor:pointer"/>
                                            </td>
                                        </tr>              
                                    </table>
                                </td>
                            </tr>
                        </table>
                        
                        <div class="separador">&nbsp; </div>                         
                        <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axisusu008" c="RESULTADOS_TIT" lit="1000345" /></div>
                        <table class="seccion">
                            <tr>
                                <td>
                                    <table class="area" align="center">
                                        <tr>
                                            <td>
                                                <div class="separador">&nbsp; </div>
                                                <c:set var="title1"><axis:alt f="axisusu008" c="CROL" lit="9901939"/></c:set>   <%-- Nombre --%>
                                                <c:set var="title2"><axis:alt f="axisusu008" c="TROL" lit="9904280"/></c:set>  
                                                <div class="displayspaceMaximo">
                                                    <display:table name="${__formdata.LSTROLS}" id="LSTROLS" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                                                         requestURI="axis_axisusu008.do?paginar=true">
                                                        <%@ include file="../include/displaytag.jsp"%>
                                                        <display:column headerClass="headwidth5 sortable fixed" title="" media="html" autolink="false" >
                                                            <div class="dspIcons">                                                
                                                                <input value="${LSTROLS.CROL}" onclick="javascript:f_seleccionar_indice('${LSTROLS.CROL}','${LSTROLS.CEMPRES}')" type="radio" id="radioNVERSIO" name="radioNVERSIO" />
                                                            </div>
                                                        </display:column> 
                                                        
                                                        <display:column title="${title1}" sortable="true" sortProperty="CROL" headerClass="sortable"  media="html" autolink="false" >
                                                            <div class="dspText">
                                                                <a href="javascript:parent.f_aceptar_axisusu008('${LSTROLS.CROL}','${LSTROLS.CEMPRES}');">${LSTROLS.CROL}</a>
                                                            </div>
                                                        </display:column>
                                                        <display:column title="${title2}" sortable="true" sortProperty="TROL" headerClass="sortable"  media="html" autolink="false" >
                                                            <div class="dspText">
                                                                <a href="javascript:parent.f_aceptar_axisusu008('${LSTROLS.CROL}','${LSTROLS.CEMPRES}');">${LSTROLS.TROL}</a>
                                                            </div>
                                                        </display:column>
                                                                  
                                                    </display:table>                                                        
                                                </div>
                                                <div class="separador">&nbsp; </div>                                        
                                            </td>                                                
                                        </tr>
                                    </table>           
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
            
            <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisusu008</c:param>
                <c:param name="__botones">cancelar,nuevo,aceptar</c:param>
            </c:import>
        </form>
        <c:import url="../include/mensajes.jsp" />
    </body>
</html>