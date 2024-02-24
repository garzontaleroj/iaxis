<%/**
*  Fichero: axisadm007.jsp
*  Simulación Contable
*  @author <a href = "mailto:lcalvo@csi-ti.com">Luz Calvo Flores</a>  
*  Fecha: 09/09/2008
*/
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>    

<%@ page contentType="text/html;charset=iso-8859-15" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">

<html>
    <head>
        <title><axis:alt f="axisadm010" c="FORM" lit="formulario.axisnombrepantalla"/></title>
        <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>          
        <c:import url="../include/carga_framework_js.jsp" />
        <script type="text/javascript">        
            
            /****************************************************************************************/
            /*********************************** NAVEGACION *****************************************/
            /****************************************************************************************/
            
            function f_onload() {
                 f_cargar_propiedades_pantalla(); 
            }
            
            function f_but_cancelar(){
                //objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axisadm010", "cancelar", document.miForm, "_self");
                parent.f_cerrar_axisadm010();
            }
            /****************************************************************************************/
            /******************************* CALLBACKS AJAX *****************************************/
            /****************************************************************************************/
            
            // TODO Implementar CallBack Ajax
            
            
            function f_but_aceptar(){ //Guardar Plantilla
                
                if (objValidador.validaEntrada()) {
                    var CEMPRES=objDom.getValorPorId("CEMPRES");
                    var SMODCON=objDom.getValorPorId("SMODCON");
                    var TDESCRI=objDom.getValorPorId("TDESCRI");
                    var CUENTAC=objDom.getValorPorId("CUENTAC");
                    var TIPOLIN=objDom.getValorPorId("TIPOLIN");
                    var TSELECT=objDom.getValorPorId("TSELECT");
                    var NLINEA=objDom.getValorPorId("NLINEA");
                    var PLANTILLA = objDom.getValorPorId("PLANTILLA");
                    var FINI = objDom.getValorPorId("FINI");
                
                
                    var qs="operation=ajax_guardar_linea";
                    qs=qs+"&CEMPRES="+CEMPRES+"&SMODCON="+SMODCON+"&TDESCRI="+TDESCRI;
                    qs=qs+"&CUENTAC="+CUENTAC+"&TIPOLIN="+TIPOLIN+"&TSELECT="+TSELECT;
                    qs=qs+"&NLINEA="+NLINEA+"&PLANTILLA="+PLANTILLA+"&FINI="+FINI;
                    
                    objAjax.invokeAsyncCGI("modal_axisadm010.do", callbackajaxGuardarLinea, qs, this);
             
                
                }
                
            }
            
              function callbackajaxGuardarLinea (ajaxResponseText){
            try{ 
            
            
                var doc = objAjax.domParse(ajaxResponseText);
                if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
                    alert("<axis:alt f="axisadm010" c="OP_OK" lit="1000405"/>");
                    objDom.setDisabledPorId("but_aceptar",true); //boton guardar línea
                    parent.f_cerrar_axisadm010();
                }
            } catch (e) {
               if (isDebugAjaxEnabled == "true")
                alert (e.name + " " + e.message);
            }
        }
            
  
            
        </script>
    </head>
    <body  onload="f_onload()">
        <c:import url="../include/precargador_ajax.jsp"><c:param name="imagen" value="images/ajax-loader.gif"></c:param></c:import>
        <form name="miForm" action="" method="POST">
            <input type="hidden" name="operation" value=""/> 
            <input type="hidden" name="CEMPRES" value="${__formdata.CEMPRES}"/> 
            <input type="hidden" name="SMODCON" value="${__formdata.SMODCON}"/>
            <input type="hidden" name="FINI" value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FINI}"/>"/>
            <input type="hidden" name="NLINEA" value="${sessionScope.listaLinea[__formdata.NLINEA_SEL].OB_IAX_DETMODCONTA.NLINEA}"/>
            
            <c:import url="../include/titulo_nt.jsp">
            
                <c:param name="titulo"><axis:alt f="axisadm010" c="TITULO" lit="9000570"/><axis:alt f="axisadm010" c="TITULO" lit="1000113"/><axis:alt f="axisadm010" c="TITULO" lit="105371"/></c:param>
                <c:param name="formulario"><axis:alt f="axisadm010" c="FORMULARIO" lit="9000570"/><axis:alt f="axisadm010" c="FORMULARIO" lit="1000113"/><axis:alt f="axisadm010" c="FORMULARIO" lit="105371"/></c:param>
                <c:param name="form">axisadm010</c:param>
            </c:import>
            <!-- Área de campos  -->
            <table class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <div class="separador">&nbsp;</div>
                        <div class="titulo">
                        <img src="images/flecha.gif"/><axis:alt f="axisadm010" c="DATOS_GENERALES" lit="103593"/>
                         </div>
                        <!-- Sección 1 -->
                        <table class="seccion">
                            <tr>
                                <td >
                                    <!-- Área 1 -->
                                    <table class="area" align="center">
                                        <tr>
                                            <th style="width:50%;height:0px"></th>
                                            <th style="width:50%;height:0px"></th>
                                        </tr>
                                        <tr>
                                            <td class="titulocaja" ><b><axis:alt f="axisadm010" c="TDESCRI" lit="100588"/></b></td><!-- Descripción -->
                                            <td/></td><!--no meses-->
                                        </tr>
                                        <tr>
                                            <axis:visible f="axisadm010" c="TDESCRI"> 
                                            <td class="campocaja">
                                            <input type="text"  class="campowidthextrabig campo campotexto_ob" id="TDESCRI" name="TDESCRI" size="15" title="<axis:alt f="axisadm010" c="TDESCRI" lit="100588"/>"
                                            value="${sessionScope.listaLinea[__formdata.NLINEA_SEL].OB_IAX_DETMODCONTA.TDESCRI}" <axis:atr f="axisadm010" c="TDESCRI" a="modificable=true&obligatorio=true"/> />
                                            </td>
                                            </td>
                                            </axis:visible>
                                            <td class="campocaja">
                                            <input type="hidden"  class="campowidth campo campotexto" id="PLANTILLA" name="PLANTILLA" size="15"
                                            value="${__formdata.PLANTILLA}" />
                                            </td>
                                        </tr>
                                       
                                        <tr>
                                            <td class="titulocaja" ><b><axis:alt f="axisadm010" c="CUENTAC" lit="104999"/></b></td><!-- Cuenta contable-->
                                            <td class="titulocaja" ><b><axis:alt f="axisadm010" c="TIPOLIN" lit="9000499"/>/<axis:alt f="axisadm010" c="TIPOLIN" lit="9000500"/></td><!-- Tipo de linea D/H -->
                                        </tr>
                                        <c:set var="tcuenta">
                                            <c:if test="${sessionScope.listaLinea[__formdata.NLINEA_SEL].OB_IAX_DETMODCONTA.TCUENTA=='D'}" >
                                            1
                                            </c:if>
                                            <c:if test="${sessionScope.listaLinea[__formdata.NLINEA_SEL].OB_IAX_DETMODCONTA.TCUENTA=='H'}" >
                                            2
                                            </c:if>
                                      </c:set>
                                     
                                        <c:set var="ccuenta">${sessionScope.listaLinea[__formdata.NLINEA_SEL].OB_IAX_DETMODCONTA.CCUENTA}</c:set>
                                       <tr>
                                                                                       
                                            <axis:visible f="axisadm004" c="CUENTAC"> 
                                            <td class="campocaja">
                                                <select name = "CUENTAC" id="CUENTAC" <axis:atr f="axisadm010" c="CUENTAC" a="obligatorio=true" /> style="width:100%;" size="1" onchange="" title="<axis:alt f="axisadm010" c="CUENTAC" lit="104999"/>" class="campowidthselect campo campotexto_ob" >
                                                <option value = "null"> - <axis:alt f="axisadm010" c="CUENTAC" lit="1000348"/> - </option>
                                                <c:forEach var="cuenta" items="${sessionScope.axisadm_listaCuentas}">
                                                    <option value = "${cuenta.CCUENTA}" <c:if test="${cuenta.CCUENTA == ccuenta}" >selected</c:if> >
                                                        ${cuenta.TCUENTA} <!--F_LITERA -->
                                                    </option>
                                                </c:forEach>
                                                </select>
                                            </td>
                                            </axis:visible>
                                            <!----  ******* ----->
                                            <axis:visible f="axisadm004" c="TIPOLIN"> 
                                            <td class="campocaja">
                                                <select name = "TIPOLIN" id="TIPOLIN" style="width:200px;" size="1" title="<axis:alt f="axisadm010" c="TIPOLIN" lit="9000499"/>_<axis:alt f="axisadm010" c="TIPOLIN" lit="9000500"/>" onchange="" class="campowidthselect campo campotexto_ob" <axis:atr f="axisadm010" c="TIPOLIN" a="isInputText=false&obligatorio=true" /> >
                                                <option value = "null"> - <axis:alt f="axisadm010" c="TIPOLIN" lit="1000348"/> - </option>
                                                <c:forEach var="dh" items="${sessionScope.axisadm_listaConceptos}">
                                                    <option value = "${dh.CATRIBU}" <c:if test="${dh.CATRIBU == tcuenta}" >selected</c:if>>
                                                        ${dh.TATRIBU}
                                                    </option>
                                                </c:forEach>
                                                </select>
                                            </td>
                                            </axis:visible>
                                            
                                        </tr>
                                        <tr>
                                            <td class="titulocaja" ><b><axis:alt f="axisadm010" c="TSELECT" lit="9000574"/></b></td><!-- Select-->
                                            <td class="titulocaja" ></td><!-- Tipo de linea -->
                                        </tr>
                                        <tr>
                                            <axis:visible f="axisadm010" c="TSELECT"> 
                                            <td class="campocaja" colspan="2">                             
                                                <textarea cols="" rows="4" class="campo campotexto_ob" title="<axis:alt f="axisadm010" c="TSELECT" lit="9000574"/>" id="TSELECT" <axis:atr f="axisadm010" c="TSELECT" a="isInputText=false&modificable=true&obligatorio=true" /> name="TSELECT" size="15" 
                                                style="width:99%;overflow:hidden">${sessionScope.listaLinea[__formdata.NLINEA_SEL].OB_IAX_DETMODCONTA.TSCUADRE}</textarea>
                                            </td>
                                            </axis:visible>
                                            
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                        <div class="separador">&nbsp;</div>
                        
             <div class="separador">&nbsp;</div>
            <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisadm010</c:param><c:param name="__botones">cancelar,aceptar</c:param></c:import>
        </form>
        <c:import url="../include/mensajes.jsp" />
    </body>
</html>