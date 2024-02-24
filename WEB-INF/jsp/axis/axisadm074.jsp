<%--
      NOMBRE:    axisadm074.jsp
      @author <a href = "mailto:joan_torres@csi-ti.com">Joan Torres</a>
      Fecha: 04/07/2012
      PROPÓSITO (descripción pantalla): 
      Ejemplo : Gestión de impagados
  
      REVISIONES:
      Ver        Fecha        Autor             Descripción
      ---------  ----------  ---------------  ------------------------------------
      1.0        04/07/2012   JTS             1. Creación de la pantalla. Bug.22342
--%>

<%@ page contentType="text/html;charset=windows-1252"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page import="axis.util.Constantes, java.util.*" %>


<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
    <head>
        <title></title>
        <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
        <link rel="stylesheet" href="styles/displaytag.css">
        <c:import url="../include/carga_framework_js.jsp" />
        
        <%--Inicio Sólo si vamos a tener un campo fecha --%>
        <!--********** CALENDARIO ************************* -->
        <!-- Hoja de estilo del Calendario -->
        <link rel="stylesheet" type="text/css" media="all" href="styles/calendar-green.css" title="green" />
        <!-- Script principal del calendario -->
        <script type="text/javascript" src="scripts/calendar.js"></script>
        <!-- Idioma del calendario, en función del Locale -->
        <script type="text/javascript" src="scripts/calendar-${sessionScope.__locale}.js"></script>
        <!-- Setup del calendario -->
        <script type="text/javascript" src="scripts/calendar-setup.js"></script>
        <!--*********************************** -->
        <%-- fin Sólo si vamos a tener un campo fecha --%>
        <script type="text/javascript">

            /****************************************************************************************/
            /*********************************** NAVEGACION *****************************************/
            /****************************************************************************************/            
            function f_onload(){
                var SSEGURO = "${__formdata.SSEGURO}";	 	
                 if (objUtiles.estaVacio(SSEGURO))     
                    f_abrir_modal("axisadm073");
 
                f_cargar_propiedades_pantalla();//Función que nos carga todas las propiedades de pantalla
            }
            
            function f_abrir_modal_params(cual, optionalQueryString){
                optionalQueryString = optionalQueryString+"&NRIESGO="+objDom.getValorPorId("NRIESGO");
                f_abrir_modal(cual, optionalQueryString);
            }
            
            function f_abrir_modal(cual, optionalQueryString) {
                if (objUtiles.estaVacio(optionalQueryString))                
                    optionalQueryString = "";
                objUtiles.abrirModal(cual, "src", "modal_" + cual + ".do?operation=init" + optionalQueryString);   
            }
            
            function f_cargar_impagado(cual,SSEGURO,NRECIBO,CACTIMP,FACCION){
                objUtiles.cerrarModal(cual);
                objDom.setValorPorId("SSEGURO", SSEGURO);
                objDom.setValorPorId("NRECIBO", NRECIBO);
                objDom.setValorPorId("CACTIMP_BUSC", CACTIMP);
                objDom.setValorPorId("FACCION", FACCION);
                objUtiles.ejecutarFormulario("axis_axisadm074.do", "form", document.miForm, "_self", objJsMessages.jslit_buscando_polizas);
            }
            
            function f_cerrar_modal(cual){
                 objUtiles.cerrarModal(cual);
            }
            
            function f_but_salir() {
                objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axisadm074", "cancelar", document.miForm, "_self");
            }
            
            function f_but_aceptar() {
                if (objValidador.validaEntrada()){
                    //Validamos los campos de pantalla, ahora llamaríamos a la función que tocara
                    objUtiles.ejecutarFormulario("axis_axisadm074.do", "guardar", document.miForm, "_self", objJsMessages.jslit_buscando_polizas);
                }
            }
            
        </script>
    </head>
    <body onload="f_onload()">
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>

    <c:import url="../include/modal_estandar.jsp">
        <c:param name="nid_y_titulo">axisadm073|<axis:alt c="NOMFORM" f="axisadm074" lit="9903917"/></c:param>
    </c:import>
   


    <form name="miForm" action="" method="POST">
       <input type="hidden" id="operation" name="operation" value=""/>
       <input type="hidden" name="SSEGURO" id="SSEGURO" value="${__formdata.SSEGURO}"/>
       <input type="hidden" name="CACTIMP_BUSC" id="CACTIMP_BUSC" value="${__formdata.CACTIMP_BUSC}"/>
       <input type="hidden" name="OK" id="OK" value="${__formdata.OK}"/>
        
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt c="lit_form" f="axisadm074" lit="9903915"/></c:param>
                <c:param name="producto"><axis:alt c="lit_form" f="axisadm074" lit="9903917"/></c:param>
                <c:param name="form">axisadm074</c:param>
            </c:import>
            <div class="separador">&nbsp;</div>
                      <!-- Área de campos  -->
            <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                    <axis:visible c="SEC_MANT1" f="axisadm074">
                        <div class="separador">&nbsp;</div>
                        <div class="titulo">
                        <img src="images/flecha.gif"/><axis:alt c="LIT_TITULO1" f="axisadm074" lit="9001644"/>
                         <img id="find" border="0" src="images/find.gif" onclick="f_abrir_modal('axisadm073')" style="cursor:pointer"/>
                         </div>
                        <!-- Sección 1 -->
                        <table class="seccion">
                            <tr>
                                <td >
                                    <!-- Área 1 -->
                                    <table class="area" align="center">
                                        <tr>
                                            <th style="width:12.5%;height:0px"></th>
                                            <th style="width:12.5%;height:0px"></th>
                                            <th style="width:12.5%;height:0px"></th>
                                            <th style="width:12.5%;height:0px"></th>
                                            <th style="width:12.5%;height:0px"></th>
                                            <th style="width:12.5%;height:0px"></th>
                                            <th style="width:12.5%;height:0px"></th>
                                            <th style="width:12.5%;height:0px"></th>
                                        </tr>
                                        <tr>
                                            <axis:ocultar f="axisadm074" c="CEMPRES" dejarHueco="false">
                                                <td class="titulocaja" colspan ="2">
                                                    <b><axis:alt f="axisadm074" c="EMPRESA" lit="101619"/></b>
                                                </td>
                                            </axis:ocultar>
                                            <axis:ocultar f="axisadm074" c="CRAMO" dejarHueco="false">
                                                <td class="titulocaja" colspan ="2">
                                                    <b><axis:alt f="axisadm074" c="CRAMO" lit="100784"/></b>
                                                </td>
                                            </axis:ocultar>
                                            <axis:ocultar f="axisadm074" c="SPRODUC" dejarHueco="false">
                                                <td class="titulocaja" colspan ="2">
                                                    <b><axis:alt f="axisadm074" c="SPRODUC" lit="100829"/></b>
                                                </td>
                                            </axis:ocultar>
                                        </tr>
                                        <tr>
                                           <axis:ocultar f="axisadm074" c="CEMPRES" dejarHueco="false">
                                                <td class="campocaja" colspan ="2">                                
                                                    <input readonly="true" type="text" name="TEMPRESA" id="TEMPRESA" value="${__formdata.TEMPRESA}"  style="width:95%" class="campowidthinput campo campotexto"/>
                                                </td>
                                            </axis:ocultar>
                                            <axis:ocultar f="axisadm074" c="CRAMO" dejarHueco="false">
                                                <td class="campocaja" colspan ="2">
                                                    <input readonly="true" type="text" name="TRAMO" id="TRAMO" value="${__formdata.TRAMO}"  style="width:95%" class="campowidthinput campo campotexto"/>
                                                </td>
                                            </axis:ocultar>
                                            <axis:ocultar f="axisadm074" c="SPRODUC" dejarHueco="false">
                                                <td class="campocaja" colspan ="2">
                                                    <input readonly="true" type="text" name="TPRODUCTO" id="TPRODUCTO" value="${__formdata.TPRODUCTO}"  style="width:95%" class="campowidthinput campo campotexto"/>
                                                </td> 
                                            </axis:ocultar>
                                        </tr>
                                        <tr>
                                            <axis:ocultar f="axisadm074" c="NPOLIZA" dejarHueco="false">
                                                 <td class="titulocaja" colspan ="2">
                                                    <b><axis:alt f="axisadm074" c="POLIZA" lit="100836"/></b> <%-- Pòlissa --%>
                                                    <b><axis:alt f="axisadm074" c="CERTIFICADO" lit="101300"/></b> <%-- Certificat --%>
                                                </td>
                                            </axis:ocultar>
                                            <axis:ocultar f="axisadm074" c="NRECIBO" dejarHueco="false">
                                                <td class="campocaja" >
                                                    <b><axis:alt f="axisadm074" c="NRECIBO" lit="100895"/></b>
                                                </td>
                                            </axis:ocultar>
                                            <axis:ocultar f="axisadm074" c="NIMPAGO" dejarHueco="false">
                                                <td class="campocaja" >
                                                    <b><axis:alt f="axisadm074" c="NIMPAGO" lit="9901852"/></b>
                                                </td>
                                            </axis:ocultar>
                                            <axis:ocultar f="axisadm074" c="MOTDEVOLU" dejarHueco="false">
                                                <td class="titulocaja" colspan ="2">
                                                    <b><axis:alt f="axisadm074" c="MOTDEVOLU" lit="9001626"/></b> 
                                                </td>
                                            </axis:ocultar>
                                            <axis:ocultar c="FACCION" f="axisadm074" dejarHueco="false">
                                                <td class="titulocaja">
                                                     <b><axis:alt f="axisadm073" c="FACCION" lit="9903927"/></b>
                                                </td>
                                            </axis:ocultar>
                                        </tr>
                                        <tr>
                                            <axis:ocultar f="axisadm074" c="NPOLIZA" dejarHueco="false">
                                                <td class="campocaja"  colspan ="2">                             
                                                    <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.NPOLIZA}" name="NPOLIZA" id="NPOLIZA" 
                                                    style="width:70%;" onchange="f_onchange_NPOLIZA()" title="<axis:alt f="axisadm074" c="NPOLIZA" lit="100836"/>" readonly="true"
                                                    <axis:atr f="axisadm074" c="NPOLIZA" a="formato=entero&obligatorio=false"/> />
                                                    
                                                    <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.NCERTIF}" name="NCERTIF" id="NCERTIF" 
                                                    style="width:21%;" title="<axis:alt f="axisadm074" c="NCERTIFS" lit="1000348"/>" readonly="true"
                                                    <axis:atr f="axisadm074" c="NCERTIF" a="formato=entero"/> />
                                                </td>
                                            </axis:ocultar>                          
                                            <axis:ocultar f="axisadm074" c="NRECIBO" dejarHueco="false">
                                                <td class="campocaja" >
                                                    <input readonly="true" type="text" name="NRECIBO" id="NRECIBO" value="${__formdata.NRECIBO}"  style="width:87%" class="campowidthinput campo campotexto"/>
                                                </td>
                                            </axis:ocultar>
                                            <axis:ocultar f="axisadm074" c="NIMPAGO" dejarHueco="false">
                                                <td class="campocaja" >
                                                    <input readonly="true" type="text" name="NIMPAGAD" id="NIMPAGAD" value="${__formdata.NIMPAGAD}"  style="width:88%" class="campowidthinput campo campotexto"/>
                                                </td>
                                            </axis:ocultar>
                                            <axis:ocultar f="axisadm074" c="MOTDEVOLU" dejarHueco="false">
                                                <td class="campocaja" colspan ="2">
                                                    <input readonly="true" type="text" name="TMOTIVO" id="TMOTIVO" value="${__formdata.TMOTIVO}"  style="width:95%" class="campowidthinput campo campotexto"/>
                                                </td> 
                                            </axis:ocultar>
                                            <axis:ocultar c="FACCION" f="axisadm074" dejarHueco="false">
                                                <td class="campocaja" >
                                                     <input readonly="true" type="text" name="FACCION" id="FACCION" value="<fmt:formatDate pattern='dd/MM/yyyy' value='${__formdata.FACCION}'/>"  style="width:70%" class="campowidthinput campo campotexto"/>
                                                </td>
                                            </axis:ocultar>
                                        </tr>
                                        
                                        
                                        <tr>
                                            <axis:ocultar f="axisadm074" c="CAGENTE" dejarHueco="false"> 
                                                <td class="titulocaja" colspan="4">
                                                    <b><axis:alt f="axisadm074" c="CAGENTE" lit="9901930"></axis:alt></b>
                                                </td>
                                            </axis:ocultar>
                                            <axis:ocultar f="axisadm074" c="COFICINA" dejarHueco="false">
                                                <td class="titulocaja" colspan ="2">
                                                    <b><axis:alt f="axisadm074" c="COFICINA" lit="9000436"/></b> 
                                                </td>
                                            </axis:ocultar>
                                        </tr>
                                        <tr>
                                            <axis:ocultar f="axisadm074" c="CAGENTE"  dejarHueco="false" > 
                                                <td class="campocaja" colspan="4">
                                                    <input readonly="true" type="text" name="TCAGENTE" id="TCAGENTE" value="${__formdata.TCAGENTE}"  style="width:97%" class="campowidthinput campo campotexto"/>
                                                </td>                                    
                                            </axis:ocultar>
                                            <axis:ocultar f="axisadm074" c="COFICINA" dejarHueco="false">
                                                <td class="campocaja" colspan ="2">
                                                    <input readonly="true" type="text" name="TOFICINA" id="TOFICINA" value="${__formdata.TOFICINA}"  style="width:95%" class="campowidthinput campo campotexto"/>
                                                </td> 
                                            </axis:ocultar>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                        </axis:visible>
                        <axis:visible c="SEC_MANT2" f="axisadm074">
                        <div class="separador">&nbsp;</div>
                        <div class="titulo"><img src="images/flecha.gif"/>
                        <axis:alt c="LIT_TITULO2" f="axisadm074" lit="9903930"/>
                        </div>
                        <table class="seccion">
                            <tr>
                                <td id="td_SEC_MANT2">
                                    <!-- Área 2 -->
                                    <table class="area" align="center">
                                        <tr>
                                            <tr>
                                            <th style="width:25%;height:0px"></th>
                                            <th style="width:25%;height:0px"></th>
                                            <th style="width:25%;height:0px"></th>
                                            <th style="width:25%;height:0px"></th>
                                        </tr>
                                        <tr>
                                            <axis:ocultar f="axisadm074" c="MCARTA" dejarHueco="false">
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axisadm074" c="MCARTA" lit="9001640"/></b> 
                                                </td>
                                            </axis:ocultar>
                                            <axis:ocultar f="axisadm074" c="CACCION" dejarHueco="false">
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axisadm074" c="CACCION" lit="9000844"/></b> 
                                                </td>
                                            </axis:ocultar>
                                            
                                        </tr>
                                        <tr>
                                            <axis:ocultar f="axisadm074" c="MCARTA" dejarHueco="false">
                                                <td class="campocaja">
                                                    <select name="CTIPCAR" id="CTIPCAR" size="1" class="campowidthselect campo campotexto" style="width:95%;">&nbsp;
                                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisadm074" c="BLANCO" lit="1000348"/> - </option>
                                                        <c:forEach var="element" items="${__formdata.LISTVALORES.LSTCARTAS}">
                                                            <option value = "${element.CATRIBU}"
                                                            <c:if test="${__formdata.CTIPCAR == element.CATRIBU}"> selected = "selected"</c:if> />
                                                                ${element.TATRIBU} 
                                                            </option>
                                                        </c:forEach>
                                                    </select>
                                                </td> 
                                            </axis:ocultar>
                                            <axis:ocultar f="axisadm074" c="CACCION" dejarHueco="false">
                                                <td class="campocaja">
                                                    <select name="CACTIMP" id="CACTIMP" size="1" <axis:atr f="axisadm074" c="CACTIMP" a="obligatorio=true"/>
                                                    class="campowidthselect campo campotexto" style="width:95%;">&nbsp;
                                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisadm074" c="BLANCO" lit="1000348"/> - </option>
                                                        <c:forEach var="element" items="${__formdata.LISTVALORES.LSTACCION}">
                                                            <option value = "${element.CATRIBU}"
                                                            <c:if test="${__formdata.CACTIMP == element.CATRIBU}"> selected = "selected"</c:if> />
                                                                ${element.TATRIBU} 
                                                            </option>
                                                        </c:forEach>
                                                    </select>
                                                </td> 
                                            </axis:ocultar>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table> 
                        </axis:visible>
                        
                    </td> 
                </tr>
            </table>
        
             <div class="separador">&nbsp;</div>
    </form>
    <!-- fin Sólo si vamos a tener un campo fecha !-->
    

<c:import url="../include/botonera_nt.jsp">
   <c:param name="f">axisadm074</c:param>
   <c:param name="__botones"><axis:ocultar f="axisadm074" c = "BT_SALIR" dejarHueco="false">salir</axis:ocultar><axis:ocultar f="axisadm074" c = "BT_ACEPTAR" dejarHueco="false">,aceptar</axis:ocultar></c:param>
</c:import>
<c:import url="../include/mensajes.jsp" />
    
</body>
</html>


