<%--
      NOMBRE:    axismnt019.jsp
      @author <a href = "mailto:joan_torres@csi-ti.com">Joan Torres</a>
      Fecha: 13/09/2012
      PROPÓSITO (descripción pantalla): Nueva CFG
  
      REVISIONES:
      Ver        Fecha        Autor             Descripción
      ---------  ----------  ---------------  ------------------------------------
      1.0        13/09/2012   JTS             1. Creación de la pantalla. Bug.23079
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
                f_cargar_propiedades_pantalla();//Función que nos carga todas las propiedades de pantalla
                
                var ok = "${__formdata.OK}";        
                if (!objUtiles.estaVacio(ok) && ok==1){
                    parent.f_aceptar_axismnt019(objDom.getValorPorId("BCEMPRES"),
                                                objDom.getValorPorId("BSPRODUC"),
                                                objDom.getValorPorId("BCMODO"),
                                                objDom.getValorPorId("BCCFGFORM"),
                                                objDom.getValorPorId("BCODFORM"));
                }   
            }
            
            function f_but_aceptar() {
                if (objValidador.validaEntrada()){
                    //Validamos los campos de pantalla, ahora llamaríamos a la función que tocara
                    objDom.setValorPorId("BCEMPRES", objDom.getValorPorId("CEMPRES"));
                    objDom.setValorPorId("BSPRODUC", objDom.getValorPorId("SPRODUC"));
                    objDom.setValorPorId("BCMODO", objDom.getValorPorId("CMODO"));
                    objDom.setValorPorId("BCCFGFORM", objDom.getValorPorId("CCFGFORM"));
                    objDom.setValorPorId("BCODFORM", objDom.getValorPorId("CODFORM"));
                    objUtiles.ejecutarFormulario("modal_axismnt019.do", "guardar", document.miForm, "_self", objJsMessages.jslit_cargando);
                }
            }
            
            function f_but_salir() {
                parent.f_cerrar_modal("axismnt019");
            }
            
            function f_onchange_empresa(pcempres){
                objDom.setValorPorId("CEMPRES", pcempres);
                //objUtiles.ejecutarFormulario("modal_axismnt019.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);
            }
            
            function f_onchange_producto(psproduc){
                objDom.setValorPorId("SPRODUC", psproduc);
                //objUtiles.ejecutarFormulario("modal_axismnt019.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);
            }
            
            function f_onchange_codmodo(pcodmodo){
                objDom.setValorPorId("CMODO", pcodmodo);
                //objUtiles.ejecutarFormulario("modal_axismnt019.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);
            }           

            
        </script>
    </head>
    <body onload="f_onload()">
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import> 

    <form name="miForm" action="" method="POST">
       <input type="hidden" name="operation" value=""/>
       <input type="hidden" name="BCEMPRES" id="BCEMPRES" value="${__formdata.BCEMPRES}"/>
       <input type="hidden" name="BSPRODUC" id="BSPRODUC" value="${__formdata.BSPRODUC}"/>
       <input type="hidden" name="BCMODO" id="BCMODO" value="${__formdata.BCMODO}"/>
       <input type="hidden" name="BCCFGFORM" id="BCCFGFORM" value="${__formdata.BCCFGFORM}"/>
       <input type="hidden" name="BCODFORM" id="BCODFORM" value="${__formdata.BCODFORM}"/>
       <input type="hidden" name="OK" id="OK" value="${__formdata.OK}"/>
        
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt c="lit_form" f="axismnt019" lit="9904152"/></c:param>
                <c:param name="producto"><axis:alt c="lit_form" f="axismnt019" lit="9904152"/></c:param>
                <c:param name="form">axismnt019</c:param>
            </c:import>
            <div class="separador">&nbsp;</div>
                      <!-- Área de campos  -->
            <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                    <axis:visible c="SEC_NOU" f="axismnt019">
                        <div class="separador">&nbsp;</div>
                        <div class="titulo">
                            <img src="images/flecha.gif"/><axis:alt c="LIT_TITULO1" f="axismnt019" lit="9904152"/>
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
                                            <axis:ocultar f="axismnt019" c="CEMPRES" dejarHueco="false">
                                                <td class="titulocaja" colspan ="2">
                                                    <b><axis:alt f="axismnt019" c="CEMPRES" lit="101619"/></b>
                                                </td>
                                            </axis:ocultar>
                                            <axis:ocultar f="axismnt019" c="SPRODUC" dejarHueco="false">
                                                <td class="titulocaja" colspan ="2">
                                                    <b><axis:alt f="axismnt019" c="SPRODUC" lit="100829"/></b>
                                                </td>
                                            </axis:ocultar>
                                            <axis:ocultar f="axismnt019" c="CCFGFORM" dejarHueco="false">
                                                <td class="titulocaja" colspan ="2">
                                                    <b><axis:alt f="axismnt019" c="CCFGFORM" lit="9001350"/></b>
                                                </td>
                                            </axis:ocultar>
                                        </tr>
                                        <tr>
                                           <axis:ocultar f="axismnt019" c="CEMPRES" dejarHueco="false">
                                                <td class="campocaja" colspan ="2">                                
                                                    <select title="<axis:alt f="axismnt019" c="CEMPRES" lit="101619"/>" name="CEMPRES" id="CEMPRES" onchange="f_onchange_empresa(this.value)" <axis:atr f="axismnt019" c="CEMPRES" a="obligatorio=true&isInputText=false"/>  size="1" class="campowidthselect campo campotexto" style="width:95%;">&nbsp;
                                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axismnt019" c="BLANCO" lit="1000348"/> - </option>
                                                        <c:forEach var="element" items="${__formdata.LISTVALORES.LSTEMPRESAS}">
                                                            <option value = "${element.CEMPRES}"
                                                            <c:if test="${__formdata.CEMPRES == element.CEMPRES}"> selected = "selected"</c:if> />
                                                                ${element.TEMPRES} 
                                                            </option>
                                                        </c:forEach>
                                                    </select>
                                                </td>
                                            </axis:ocultar>
                                            <axis:ocultar f="axismnt019" c="SPRODUC" dejarHueco="false">
                                                <td class="campocaja" colspan ="2">
                                                    <select title="<axis:alt f="axismnt019" c="SPRODUC" lit="100829"/>" name="SPRODUC" id="SPRODUC" onchange="f_onchange_producto(this.value)" <axis:atr f="axismnt019" c="SPRODUC" a="obligatorio=true&isInputText=false"/> size="1" class="campowidthselect campo campotexto" style="width:95%;">&nbsp;
                                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axismnt019" c="BLANCO" lit="1000348"/> - </option>
                                                        <c:forEach var="element" items="${__formdata.LISTVALORES.LSTPRODUCTOS}">
                                                            <option value = "${element.SPRODUC}"
                                                            <c:if test="${__formdata.SPRODUC == element.SPRODUC}"> selected = "selected"</c:if> />
                                                                ${element.TTITULO} 
                                                            </option>
                                                        </c:forEach>
                                                    </select>
                                                </td>
                                            </axis:ocultar>
                                            <axis:ocultar f="axismnt019" c="CCFGFORM" dejarHueco="false">
                                                <td class="campocaja" colspan ="2">
                                                    <select title="<axis:alt f="axismnt019" c="CCFGFORM" lit="9001350"/>" name="CCFGFORM" id="CCFGFORM" onchange="" <axis:atr f="axismnt019" c="CCFGFORM" a="obligatorio=true&isInputText=false"/> size="1" class="campowidthselect campo campotexto" style="width:95%;">&nbsp;
                                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axismnt019" c="BLANCO" lit="1000348"/> - </option>
                                                        <c:forEach var="element" items="${__formdata.LISTVALORES.LSTCCFGFORM}">
                                                            <option value = "${element.CCFGFORM}"
                                                            <c:if test="${__formdata.CCFGFORM == element.CCFGFORM}"> selected = "selected"</c:if> />
                                                                ${element.TDESC} 
                                                            </option>
                                                        </c:forEach>
                                                    </select>
                                                </td> 
                                            </axis:ocultar>
                                        </tr>
                                        
                                        <tr>
                                            <axis:ocultar f="axismnt019" c="CMODO" dejarHueco="false">
                                                <td class="titulocaja" colspan ="2">
                                                    <b><axis:alt f="axismnt019" c="CMODO" lit="9901139"/></b>
                                                </td>
                                            </axis:ocultar>
                                            <axis:ocultar f="axismnt019" c="CODFORM" dejarHueco="false">
                                                <td class="titulocaja" colspan ="2">
                                                    <b><axis:alt f="axismnt019" c="CODFORM" lit="9000593"/></b>
                                                </td>
                                            </axis:ocultar>
                                            <td class="titulocaja" colspan ="2">
                                                   &nbsp;
                                            </td>
                                        </tr>
                                        <tr>
                                           <axis:ocultar f="axismnt019" c="CMODO" dejarHueco="false">
                                                <td class="campocaja" colspan ="2">                                
                                                    <select title="<axis:alt f="axismnt019" c="CMODO" lit="9901139"/>" name="CMODO" id="CMODO" onchange="f_onchange_codmodo(this.value)" <axis:atr f="axismnt019" c="CMODO" a="obligatorio=true&isInputText=false"/>  size="1" class="campowidthselect campo campotexto" style="width:95%;">&nbsp;
                                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axismnt019" c="BLANCO" lit="1000348"/> - </option>
                                                        <c:forEach var="element" items="${__formdata.LISTVALORES.LSTCODMODO}">
                                                            <option value = "${element.CMODO}"
                                                            <c:if test="${__formdata.CMODO == element.CMODO}"> selected = "selected"</c:if> />
                                                                ${element.CMODO}&nbsp;-&nbsp;${element.TMODO} 
                                                            </option>
                                                        </c:forEach>
                                                    </select>
                                                </td>
                                            </axis:ocultar>
                                            <axis:ocultar f="axismnt019" c="CODFORM" dejarHueco="false">
                                                <td class="campocaja" colspan ="2">
                                                    <select title="<axis:alt f="axismnt019" c="CODFORM" lit="9000593"/>" name="CODFORM" id="CODFORM" onchange="" <axis:atr f="axismnt019" c="CODFORM" a="obligatorio=true&isInputText=false"/> size="1" class="campowidthselect campo campotexto" style="width:95%;">&nbsp;
                                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axismnt019" c="BLANCO" lit="1000348"/> - </option>
                                                        <c:forEach var="element" items="${__formdata.LISTVALORES.LSTCODFORM}">
                                                            <option value = "${element.CFORM}"
                                                            <c:if test="${__formdata.CODFORM == element.CFORM}"> selected = "selected"</c:if> />
                                                                ${element.CFORM}&nbsp;-&nbsp;${element.TFORM} 
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
    
    <c:import url="../include/botonera_nt.jsp">
       <c:param name="f">axismnt019</c:param>
       <c:param name="__botones"><axis:ocultar f="axismnt019" c = "BT_SALIR" dejarHueco="false">salir</axis:ocultar><axis:ocultar f="axismnt019" c = "BT_ACEPTAR" dejarHueco="false">,aceptar</axis:ocultar></c:param>
    </c:import>
    <c:import url="../include/mensajes.jsp" />
    
    </body>
</html>