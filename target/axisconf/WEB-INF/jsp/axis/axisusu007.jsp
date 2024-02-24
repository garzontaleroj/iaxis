<%/**
*  Fichero: axisusu007.jsp
*  Pantalla de consulta / mantenimiento de roles.
*
*  Fecha: 02/10/2012
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
        <title><axis:alt f="axisusu007" c="NOMBREPANTALLA" lit="9904278"/></title>
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
                <c:if test="${empty __formdata.primeraVez}">
                    objDom.setValorPorId("primeraVez",1);
                    objDom.setValorPorId("isNewRol",1);
                    objUtiles.abrirModal("axisusu008", "src", "modal_axisusu008.do?operation=form");
                </c:if>
            }
            
            function f_limpia_form(){
                objDom.setValorPorId("CROL", "");
                objDom.setValorPorId("TROL", "");
                objDom.setValorPorId("CCFGWIZ", "<%=Integer.MIN_VALUE%>");
                objDom.setValorPorId("CCFGFORM", "<%=Integer.MIN_VALUE%>");
                objDom.setValorPorId("CCFGACC", "<%=Integer.MIN_VALUE%>");
                objDom.setValorPorId("CROLMEN", "<%=Integer.MIN_VALUE%>");
                objDom.setValorPorId("CCONSUPL", "<%=Integer.MIN_VALUE%>");
                objDom.setValorPorId("CACCPROD", "<%=Integer.MIN_VALUE%>");
                objDom.setValorPorId("CCFGDOC", "<%=Integer.MIN_VALUE%>");
                objDom.setValorPorId("CCFGMAP", "<%=Integer.MIN_VALUE%>");
                objDom.setValorPorId("CUSUAGRU", "<%=Integer.MIN_VALUE%>");
                objDom.setValorPorId("CILIMITE", "");
                objDom.setValorPorId("isNewRol",1);
            }

            function f_but_buscar() {
                f_limpia_form();
                objUtiles.abrirModal("axisusu008", "src", "modal_axisusu008.do?operation=form");
            }

            function f_but_salir() {
                objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axisusu007", "cancelar", document.miForm, "_self");
            }   
            
            function f_but_aceptar() {
                if (objValidador.validaEntrada()) {  
                    objUtiles.ejecutarFormulario ("axis_axisusu007.do", "aceptar", document.miForm, "_self", objJsMessages.jslit_cargando);
                }
            } 
            
            function f_nou() {
                objUtiles.cerrarModal("axisusu008");
                f_limpia_form();
                objUtiles.ejecutarFormulario ("axis_axisusu007.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);
            }
            
            function f_cerrar_axisusu008() {
                objUtiles.cerrarModal("axisusu008");
            }
            
            function f_cerrar_axisusu008(isNewRol) {
                objDom.setValorPorId("isNewRol",isNewRol);
                objUtiles.cerrarModal("axisusu008");
            }
            
            function f_aceptar_axisusu008(crol,cempres) {
                f_cerrar_axisusu008(0);
                objUtiles.ejecutarFormulario ("axis_axisusu007.do?PARCROL="+crol+"&PARCEMPRES="+cempres, "buscar", document.miForm, "_self", objJsMessages.jslit_cargando);
            }

        </script>
    </head>
    
    <body onunload="try { f_clear_resources(document.body) } catch (e) {}" onload="f_onload()" >
    
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
        
        <form name="miForm" action="" method="POST">
            <input type="hidden" name="operation" value=""/> 
            <input type="hidden" name="isNewRol" id="isNewRol" value="${__formdata.isNewRol}"/>
            <input type="hidden" name="primeraVez" id="primeraVez" value="${__formdata.primeraVez}"/>
            
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt f="axisusu007" c="MANT_ROLES" lit="9904278"/></c:param> 
                <c:param name="titulo"><axis:alt f="axisusu007" c="MANT_ROLES" lit="9904278"/></c:param> 
                <c:param name="form">axisusu007</c:param>
            </c:import>
            
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="nid_y_titulo">axisusu008|<axis:alt f="axisusu007" c="BUSCAR_ROLES" lit="9904279"/></c:param>
            </c:import>

            
            <!-- Área de campos  -->
            <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <div class="separador">&nbsp; </div>                                        
                        <div class="titulo">
                            <img src="images/flecha.gif"/>
                            <axis:alt f="axisusu007" c="DSP_ROL" lit="9904281" />
                            <div style="float:right;" id="BT_BUSCAR" name="BT_BUSCAR">
                                <img id="find" border="0" src="images/find.gif" alt="<axis:alt f="axisusu007" c="BUSCAR" lit="9000508"/>" title="<axis:alt f="axisusu007" c="BUSCAR_TIT" lit="9000508"/>"onclick="f_but_buscar()" style="cursor:pointer"/>
                            </div>
                        </div>
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
                                                <b><axis:alt f="axisusu007" c="CROL" lit="9901939"/></b> 
                                            </td>
                                            <td class="titulocaja" colspan="2">
                                                <b><axis:alt f="axisusu007" c="TROL" lit="9904280"/></b>
                                            </td>
                                        </tr>
                                        <tr>
                                            <c:if test="${empty __formdata.isNewRol||__formdata.isNewRol==1}">
                                                <td class="campocaja">
                                                    <input type="text" class="campowidthinput campo campotexto" id="CROL" name="CROL" size="15"
                                                    title="<axis:alt f="axisusu007" c="CROL" lit="9901939"/>" <axis:atr f="axisusu007" c="CROL" a="modificable=true&obligatorio=true"/>
                                                    style="width:80%" value="${__formdata.CROL}"/>
                                                </td>
                                            </c:if>
                                            <c:if test="${__formdata.isNewRol==0}">
                                                <td class="campocaja">
                                                    <input type="text" class="campowidthinput campo campotexto" id="CROL" name="CROL" size="15"
                                                    title="<axis:alt f="axisusu007" c="CROL" lit="9901939"/>" <axis:atr f="axisusu007" c="CROL" a="modificable=false&obligatorio=false"/>
                                                    disabled style="width:80%" value="${__formdata.CROL}"/>
                                                </td>
                                            </c:if>
                                            <td class="campocaja" colspan="2">
                                                <input type="text" class="campowidthinput campo campotexto" id="TROL" name="TROL" size="250"
                                                title="<axis:alt f="axisusu007" c="TROL" lit="9904280"/>" <axis:atr f="axisusu007" c="TROL" a="modificable=true&obligatorio=true"/>
                                                style="width:80%" value="${__formdata.TROL}"/>
                                            </td>
                                        </tr>   
                                        
                                        <tr>
                                            <td class="titulocaja" colspan="2">
                                                <b><axis:alt f="axisusu007" c="NAVEGACION_TIT" lit="9000593"/></b> <%-- Navegación --%>
                                            </td>
                                            
                                            <td class="titulocaja" colspan="2">
                                                <b><axis:alt f="axisusu007" c="PANTALLAS_TIT" lit="9000592"/></b> <%-- Pantalles --%>
                                            </td>                                                
                                        </tr>
                                        <tr>
                                            <td class="campocaja" colspan="2">
                                                <select class="campowidthselect campo campotexto"  id="CCFGFORM" name="CCFGFORM" size="1"
                                                style="width:91.4%" <axis:atr f="axisusu007" c="CCFGFORM" a="modificable=true&obligatorio=true"/> title="<axis:alt f="axisusu007" c="PANTALLAS" lit="9000593"/>"/>
                                                    <option value="<%=Integer.MIN_VALUE%>"> - <axis:alt f="axisusu007" c="PANTALLAS_VALOR" lit="1000348"/> - </option>
                                                    <c:forEach items="${__formdata.LSTVALORES.LSTFORM}" var="item">
                                                        <option value="${item.CODIGO}" <c:if test="${item.CODIGO  == __formdata.CCFGFORM}">selected</c:if>>${item.VALOR}</option>
                                                    </c:forEach>
                                                </select>
                                            </td>                                                 

                                            <td class="campocaja" colspan="2">
                                                <select class="campowidthselect campo campotexto" id="CCFGWIZ" name="CCFGWIZ" size="1"
                                                style="width:91.4%"  <axis:atr f="axisusu007" c="CCFGWIZ" a="modificable=true&obligatorio=true"/> title="<axis:alt f="axisusu007" c="NAVEGACION" lit="9000592"/>"/>
                                                    <option value="<%=Integer.MIN_VALUE%>"> - <axis:alt f="axisusu007" c="NAVEGACION_VALOR" lit="1000348"/> - </option>
                                                    <c:forEach items="${__formdata.LSTVALORES.LSTWIZARD}" var="item">
                                                        <option value="${item.CODIGO}" <c:if test="${item.CODIGO  == __formdata.CCFGWIZ}">selected</c:if>>${item.VALOR}</option>
                                                    </c:forEach>
                                                </select>
                                            </td>

                                        </tr>
                                        <tr>
                                            <td class="titulocaja" colspan="2">
                                                <b><axis:alt f="axisusu007" c="MENU_TIT" lit="9000595"/></b> <%-- Menú --%>
                                            </td>                                                
                                            
                                            <td class="titulocaja" colspan="2">
                                                <b><axis:alt f="axisusu007" c="ACCIONES_TIT" lit="9000594"/></b> <%-- Accions --%>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="campocaja" colspan="2"> 
                                                <select class="campowidthselect campo campotexto" id="CROLMEN" name="CROLMEN" size="1"
                                                style="width:91.4%"  <axis:atr f="axisusu007" c="CROLMEN" a="modificable=true&obligatorio=true"/> title="<axis:alt f="axisusu007" c="MENU" lit="9000595"/>"/>
                                                    <option value="<%=Integer.MIN_VALUE%>"> - <axis:alt f="axisusu007" c="MENU_VALOR" lit="1000348"/> - </option>
                                                    <c:forEach items="${__formdata.LSTVALORES.LSTMENU}" var="item">
                                                        <option value="${item.CODIGO}" <c:if test="${item.CODIGO  == __formdata.CROLMEN}">selected</c:if>>${item.VALOR}</option>
                                                    </c:forEach>
                                                </select>
                                            </td>                                                
                                            
                                            <td class="campocaja" colspan="2">
                                                <select class="campowidthselect campo campotexto" id="CCFGACC" name="CCFGACC" size="1"
                                                style="width:91.4%"  <axis:atr f="axisusu007" c="CCFGACC" a="modificable=true&obligatorio=true"/> title="<axis:alt f="axisusu007" c="ACCIONES" lit="9000594"/>"/>
                                                    <option value="<%=Integer.MIN_VALUE%>"> - <axis:alt f="axisusu007" c="ACCIONES_VALOR" lit="1000348"/> - </option>
                                                    <c:forEach items="${__formdata.LSTVALORES.LSTACCION}" var="item">
                                                        <option value="${item.CODIGO}" <c:if test="${item.CODIGO  == __formdata.CCFGACC}">selected</c:if>>${item.VALOR}</option>
                                                    </c:forEach>
                                                </select>
                                            </td>
                                        </tr>                                        
                                            
                                        <tr>
                                            <td class="titulocaja" colspan="2">
                                                <b><axis:alt f="axisusu007" c="SUPLEMENTOS_TIT" lit="104752"/></b> <%-- Suplements --%>
                                            </td>                                            
                                            
                                            <axis:visible c="CCFGDOC" f="axisusu007">                                            
                                            <td class="titulocaja" colspan="2">
                                                <b><axis:alt f="axisusu007" c="DOCUMENTACION_TIT" lit="1000431"/></b> <%-- Documentació --%>
                                            </td>                                                                          
                                            </axis:visible>
                                        </tr>
                                        <tr>                                        
                                            <td class="campocaja" colspan="2">
                                                <select class="campowidthselect campo campotexto" id="CCONSUPL" name="CCONSUPL" size="1"
                                                style="width:91.4%" title="<axis:alt f="axisusu007" c="SUPLEMENTOS" lit="104752"/>"/>
                                                    <option value="<%=Integer.MIN_VALUE%>"> - <axis:alt f="axisusu007" c="SUPLEMENTOS_VALOR" lit="1000348"/> - </option>
                                                    <c:forEach items="${__formdata.LSTVALORES.LSTSUPL}" var="item">
                                                        <option value="${item.CCONSUPL}" <c:if test="${item.CCONSUPL  == __formdata.CCONSUPL}">selected</c:if>>${item.TCONSUPL}</option>
                                                    </c:forEach>
                                                </select>
                                            </td>        

                                            <axis:visible c="CCFGDOC" f="axisusu007">
                                            <td class="campocaja" colspan="2">
                                                <select class="campowidthselect campo campotexto" id="CCFGDOC" name="CCFGDOC" size="1"
                                                style="width:91.4%" title="<axis:alt f="axisusu007" c="DOCUMENTACION" lit="1000431"/>"/>
                                                    <option value="<%=Integer.MIN_VALUE%>"> - <axis:alt f="axisusu007" c="DOCUMENTACION_VALOR" lit="1000348"/> - </option>
                                                    <c:forEach items="${__formdata.LSTVALORES.LSTDOC}" var="item">
                                                        <option value="${item.CODIGO}" <c:if test="${item.CODIGO  == __formdata.CCFGDOC}">selected</c:if>>${item.VALOR}</option>
                                                    </c:forEach>
                                                </select>
                                            </td>                                                 
                                            </axis:visible>
                                        </tr>
                                            
                                        <tr>
                                            <axis:visible c="CACCPROD" f="axisusu007">                                            
                                            <td class="titulocaja" colspan="2">
                                                <b><axis:alt f="axisusu007" c="ACCESO_PRODUCTOS_TIT" lit="9901611"/></b> <%-- Acceso Productos --%>
                                            </td>                                                                          
                                            </axis:visible>
                                            <axis:visible c="CCFGMAP" f="axisusu007">                                            
                                            <td class="titulocaja" colspan="2">
                                                <b><axis:alt f="axisusu007" c="MAP_TIT" lit="108525"/></b> <%-- Informes --%>
                                            </td>                                                                          
                                            </axis:visible>
                                        </tr>
                                        <tr>                                        
                                            <axis:visible c="CACCPROD" f="axisusu007">
                                                <td class="campocaja" colspan="2">
                                                    <select class="campowidthselect campo campotexto" id="CACCPROD" name="CACCPROD" size="1"
                                                    style="width:91.4%" title="<axis:alt f="axisusu007" c="ACCESO_PRODUCTOS" lit="9901611"/>"/>
                                                        <option value="<%=Integer.MIN_VALUE%>"> - <axis:alt f="axisusu007" c="ACCESO_PRODUCTOS_VALOR" lit="1000348"/> - </option>
                                                        <c:forEach items="${__formdata.LSTVALORES.LSTACCPROD}" var="item">
                                                            <option value="${item.CODIGO}" <c:if test="${item.CODIGO  == __formdata.CACCPROD}">selected</c:if>>${item.VALOR}</option>
                                                        </c:forEach>
                                                    </select>
                                                </td>
                                            </axis:visible>
                                            <axis:visible c="CCFGMAP" f="axisusu007">
                                                <td class="campocaja" colspan="2">
                                                    <select class="campowidthselect campo campotexto" id="CCFGMAP" name="CCFGMAP" size="1"
                                                    style="width:91.4%" title="<axis:alt f="axisusu007" c="MAP" lit="108525"/>"/>
                                                        <option value="<%=Integer.MIN_VALUE%>"> - <axis:alt f="axisusu007" c="MAP_VALOR" lit="1000348"/> - </option>
                                                        <c:forEach items="${__formdata.LSTVALORES.LSTMAP}" var="item">
                                                            <option value="${item.CODIGO}" <c:if test="${item.CODIGO  == __formdata.CCFGMAP}">selected</c:if>>${item.VALOR}</option>
                                                        </c:forEach>
                                                    </select>
                                                </td>                                                 
                                            </axis:visible>
                                        </tr>
                                        
                                        <tr>
                                            <axis:visible c="CUSUAGRU" f="axisusu007">                                            
                                            <td class="titulocaja" colspan="2">
                                                <b><axis:alt f="axisusu007" c="CUSUAGRU" lit="9904814"/></b>
                                            </td>                                                                          
                                            </axis:visible>
                                            <axis:visible c="CILIMITE" f="axisusu007">                                            
                                            <td class="titulocaja" colspan="2">
                                                <b><axis:alt f="axisusu007" c="CILIMITE" lit="9904295"/></b> 
                                            </td>                                                                          
                                            </axis:visible>
                                        </tr>
                                        <tr>                                        
                                            <axis:visible c="CUSUAGRU" f="axisusu007">
                                                <td class="campocaja" colspan="2">
                                                    <select class="campowidthselect campo campotexto" id="CUSUAGRU" name="CUSUAGRU" size="1"
                                                    style="width:91.4%" title="<axis:alt f="axisusu007" c="CUSUAGRU" lit="9904814"/>"/>
                                                        <option value="<%=Integer.MIN_VALUE%>"> - <axis:alt f="axisusu007" c="CUSUAGRU_MIN" lit="1000348"/> - </option>
                                                        <c:forEach items="${__formdata.LSTVALORES.LSTUSUAGRU}" var="item">
                                                            <option value="${item.CUSUAGRU}" <c:if test="${item.CUSUAGRU  == __formdata.CUSUAGRU}">selected</c:if>>${item.TUSUAGRU}</option>
                                                        </c:forEach>
                                                    </select>
                                                </td>
                                            </axis:visible>
                                            <axis:visible c="CILIMITE" f="axisusu007">
                                                <td class="campocaja" colspan="2">
                                                    <input type="numeric" class="campowidthinput campo campotexto" id="CILIMITE" name="CILIMITE" size="15"
                                                    title="<axis:alt f="axisusu007" c="CILIMITE" lit="9904295"/>" style="width:40%" value="${__formdata.CILIMITE}"/>
                                                </td>                                                 
                                            </axis:visible>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                        
                    </td>
                </tr>
            </table>
            
            <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisusu007</c:param>
                <c:param name="__botones">salir,aceptar</c:param>
            </c:import>
        </form>
        <c:import url="../include/mensajes.jsp" />
    </body>
</html>