<%/*
*  Fichero: axismnt014.jsp : Mantenimiento productos. Datos internos
*/
%>

<%@ page contentType="text/html;charset=windows-1252" errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>    

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
 
<html>
    <head>
        <title><axis:alt f="axisusu001" c="PANT_LITERAL" lit="1000233"/></title>
        <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>          
        <c:import url="../include/carga_framework_js.jsp" />
        <script type="text/javascript">        
            
            /****************************************************************************************/
            /*********************************** NAVEGACION *****************************************/
            /****************************************************************************************/
            
            function f_onload() {
             
                <% if (((java.util.Map) request.getAttribute("__formdata")).get("OB_IAX_USER") == null) { %>
                // Si no se ha podido recuperar el usuario, deshabilitar botones de guardar
                    document.miForm.but_guardar_datos_usuario.disabled = true;
                    document.miForm.but_guardar_datos_conexion.disabled = true;
                <% } %>                
                
                document.miForm.initialLocale.value = "${__formdata.OB_IAX_USER.CIDIOMA}";
                parent.fcabecera.location.reload();
                f_cargar_propiedades_pantalla();
            }
            
            function f_guardar_datos_usuario() {
            	
                document.getElementById("OLDPWD").setAttribute("obligatorio", false);
                document.getElementById("NEWPWD").setAttribute("obligatorio", false);
                document.getElementById("NEWPWD_CONFIRMACION").setAttribute("obligatorio", false);                
                
                if (objValidador.validaEntrada()) {
                    var CIDIOMA  = document.miForm.CIDIOMA.value;

                    if (document.miForm.initialLocale.value != CIDIOMA) {
                    // Si se ha cambiado el idioma, realizamos una petición request/response normal, ya que hay que actualizar el Locale
                    // y recargar la página.
                        objUtiles.ejecutarFormulario("axis_axisusu001.do", "guardarDatosUsuarioRequest", document.miForm, "_self");
                        //Recargamos la imagen de la cabecera
                    		
                        
                    } else {
                    // Petición Ajax                
                        var CUSUARI  = document.miForm.CUSUARI.value;
                        var NOMBRE   = document.miForm.NOMBRE.value;
                        
                        objAjax.invokeAsyncCGI("axis_axisusu001.do", callback, 
                                "operation=guardarDatosUsuarioAjax&CUSUARI=" + CUSUARI + "&NOMBRE=" + NOMBRE + 
                                "&CIDIOMA=" + CIDIOMA, this, objJsMessages.jslit_cargando, false);
                    }
                }
            }
            
            function f_guardar_datos_conexion() {
                var CUSUARI             = document.miForm.CUSUARI.value;
                var OLDPWD              = document.miForm.OLDPWD.value;
                var NEWPWD              = document.miForm.NEWPWD.value;
                var NEWPWD_CONFIRMACION = document.miForm.NEWPWD_CONFIRMACION.value;
                
                if (objUtiles.estaVacio(OLDPWD))
                    alert(objJsMessages.jslit_debe_informar_actual_password); 
                else if (objUtiles.estaVacio(NEWPWD))
                    alert(objJsMessages.jslit_debe_informar_nuevo_password); 
                else if (objUtiles.estaVacio(NEWPWD_CONFIRMACION))
                    alert(objJsMessages.jslit_debe_confirmar_nuevo_password); 
                else if (objUtiles.stringTrim(NEWPWD_CONFIRMACION) != objUtiles.stringTrim(NEWPWD)) 
                    alert(objJsMessages.jslit_111210);
                else {
                    objAjax.invokeAsyncCGI("axis_axisusu001.do", callback, 
                        "operation=guardarDatosConexion&CUSUARI=" + CUSUARI + "&OLDPWD=" + OLDPWD + 
                        "&NEWPWD=" + NEWPWD, this, objJsMessages.jslit_cargando, true);
                }
            }            

            function f_but_salir() {
                objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axisusu001", "cancelar", document.miForm, "_self");
            }           
            
            /****************************************************************************************/
            /******************************* CALLBACKS AJAX *****************************************/
            /****************************************************************************************/
            
            function callback(ajaxResponseText, isGuardarDatosConexion) {
                // Recibe la respuesta Ajax de guardar datos usuario/conexión
                // Y escribe los mensajes de info/error correspondientes.
                // isGuardarDatosConexion es un boolean que indica si 
                // estamos guardando datos de conexión o no
                var doc = objAjax.domParse(ajaxResponseText);
                
                // Hacemos la llamada para pintar los errores/infos
                var operationOK = !objAppMensajes.existenErroresEnAplicacion(doc);   
                
                
                // Si hemos guardado los datos conexión correctamente
                // Borrar los campos de password
                if (isGuardarDatosConexion && operationOK) {
                    document.miForm.OLDPWD.value              = "";
                    document.miForm.NEWPWD.value              = "";
                    document.miForm.NEWPWD_CONFIRMACION.value = "";
                    
                    //Recargamos frame cabecera
                    //document.fcabecera.history.reload();
                    
                }

            }
            
        </script>
    </head>
    <body  onload="f_onload()">
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
        <form name="miForm" action="" method="POST">
            <input type="hidden" name="operation" value=""/> 
            <input type="hidden" name="initialLocale" id="initialLocale" value=""/>
            
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt f="axisusu001" c="FORM_NOM" lit="1000233" /></c:param>
                <c:param name="form">axisusu001</c:param>
            </c:import>
            
            <!-- Área de campos  -->
            <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axisusu001" c="TIT_SECCION_PRINCIPAL" lit="1000104"/></div>
                        <!-- Sección Datos Usuario -->
                        <table class="seccion">
                            <tr>
                                <td>
                                    <!-- Área Datos Usuario -->
                                    <table class="area">
                                        <tr>
                                            <th style="width:25%;height:0px"></th>
                                            <th style="width:25%;height:0px"></th>
                                            <th style="width:25%;height:0px"></th>
                                            <th style="width:25%;height:0px"></th>
                                        </tr>
                                        <tr>
                                            <td class="titulocaja">
                                                <b><axis:alt f="axisusu001" c="CUSUARI" lit="100894"/></b>
                                            </td>
                                            <td class="titulocaja">
                                                <b><axis:alt f="axisusu001" c="NOMBRE" lit="101995"/></b>
                                            </td>
                                            <td class="titulocaja">
                                                <b><axis:alt f="axisusu001" c="CIDIOMA" lit="1000246"/></b>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="campocaja">
                                                <input type="text" class="campowidthinput campo campotexto" id="CUSUARI" name="CUSUARI" size="15"
                                                style="width:80%" value="${__formdata.OB_IAX_USER.CUSUARI}" readonly="true"/>
                                            </td>
                                            <td class="campocaja">
                                                <input type="text" class="campowidthinput campo campotexto" id="NOMBRE" name="NOMBRE" size="15"
                                                style="width:80%" value="${__formdata.OB_IAX_USER.NOMBRE}" title="<axis:alt f="axisusu001" c="NOMBRE_LIT" lit="101995"/>" obligatorio="true"/>
                                            </td>
                                            <td class="campocaja">
                                                <select class="campowidthselect campo campotexto" id="CIDIOMA" name="CIDIOMA" <axis:atr f="axisusu001" c="CIDIOMA" a="obligatorio=true&isInputText=false"/> size="1"
                                                style="width:81%" value="${__formdata.CIDIOMA}" obligatorio="true"/>
                                                   <c:forEach items="${__formdata.LISTA_IDIOMAS}" var="idioma">
                                                        <option value="${idioma.CIDIOMA}" <c:if test="${idioma.CIDIOMA  == __formdata.OB_IAX_USER.CIDIOMA}">selected</c:if>>${idioma.TIDIOMA}</option>
                                                    </c:forEach>
                                                </select>
                                            </td>
                                            <axis:visible f="axisusu001" c="BUT_GUARDA_USER">
                                            <td class="campocaja">
                                                <input type="button" class="boton" id="but_guardar_datos_usuario" value="<axis:alt f="axisusu001" c="GUARDA_USER" lit="100009"/>" onclick="f_guardar_datos_usuario()" />
                                            </td>
                                            </axis:visible>
                                        </tr>                                        
                                    </table>
                                </td>
                            </tr>
                        </table>
                        <div class="separador">&nbsp;</div>
                        
                        <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axisusu001" c="AREA_DATOS_SECCION" lit="1000094"/></div>
                        <!-- Sección Datos Conexión -->
                        <table class="seccion">
                            <tr>
                                <td>
                                    <!-- Área Datos Conexión -->
                                    <table class="area">
                                        <tr>
                                            <th style="width:25%;height:0px"></th>
                                            <th style="width:25%;height:0px"></th>
                                            <th style="width:25%;height:0px"></th>
                                            <th style="width:25%;height:0px"></th>
                                        </tr>
                                        <tr>
                                            <td class="titulocaja">
                                                <b><axis:alt f="axisusu001" c="OLDPWD" lit="1000324"/></b>
                                            </td>
                                            <td class="titulocaja">
                                                <b><axis:alt f="axisusu001" c="NEWPWD" lit="1000308"/></b>
                                            </td>
                                            <td class="titulocaja">
                                                <b><axis:alt f="axisusu001" c="NEWPWD_CONFIRMACION" lit="1000089"/></b>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="campocaja">
                                                <input type="password" class="campowidthinput campo campotexto" id="OLDPWD" name="OLDPWD" size="15"
                                                style="width:80%" value="${__formdata.OLDPWD}" obligatorio="true"/>
                                            </td>
                                            
                                            <td class="campocaja">
                                                <input type="password" class="campowidthinput campo campotexto" id="NEWPWD" name="NEWPWD" size="15"
                                                style="width:80%" value="${__formdata.NEWPWD}" obligatorio="true"/>
                                            </td>
                                            <td class="campocaja">
                                                <input type="password" class="campowidthinput campo campotexto" id="NEWPWD_CONFIRMACION" name="NEWPWD_CONFIRMACION" size="15"
                                                style="width:80%" value="${__formdata.NEWPWD_CONFIRMACION}" obligatorio="true"/>
                                            </td>
                                            <axis:visible f="axisusu001" c="BUT_GUARDA_DAT">
                                            <td class="campocaja">
                                                <input type="button" class="boton" id="but_guardar_datos_conexion" value="<axis:alt f="axisusu001" c="BUT_GUARDAR_DAT" lit="100009"/>" onclick="f_guardar_datos_conexion()" />
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
            
            <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisusu001</c:param><c:param name="f">axisusu001</c:param>
                <c:param name="f">axisusu001</c:param>
                <c:param name="__botones">salir</c:param>
            </c:import>
        </form>
        <c:import url="../include/mensajes.jsp" />
    </body>
</html>