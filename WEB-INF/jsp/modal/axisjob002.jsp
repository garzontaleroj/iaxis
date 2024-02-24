<%/*
*  Fichero: Axisjob002.jsp
*  @author <a href = "mailto:amartinez@csi-ti.com">Alex Martinez</a> 
*
*  Fecha: 05/03/2008
*/
%>
<%@ page contentType="text/html;charset=iso-8859-15" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>

<%@ page import="java.util.List" %>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<html>
  <head>
    <link rel="stylesheet" href="styles/genericosHtml.css" type="text/css">
    <link rel="stylesheet" href="styles/axisnt.css" type="text/css">
    <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>
    
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
    
    <c:import url="../include/carga_framework_js.jsp" />
    <script language="Javascript" type="text/javascript">

        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/

       function f_but_cerrar() {
            parent.f_cerrar_axisjob002();
       }
       
       function f_but_aceptar() {  
       	 if (objValidador.validaEntrada()) {
        if (document.axisjob002Form.CMODO.value == 'EDITAR'){
        
            objUtiles.ejecutarFormulario ("modal_axisjob002.do?NUMJOBhidden="+document.axisjob002Form.NUMJOB.value+"&FUNCIONhidden="+document.axisjob002Form.FUNCION.value, "modificarjob", document.axisjob002Form, "_self", objJsMessages.jslit_cargando); 
        }
        else if (document.axisjob002Form.CMODO.value == 'NUEVO'){
            objUtiles.ejecutarFormulario ("modal_axisjob002.do", "altajob", document.axisjob002Form, "_self", objJsMessages.jslit_cargando); 
        }
        
      }
        
       }    
       
       function f_onload(){
        
        var ver="${ERROR}";
        var salir = 0;
        if (!objUtiles.estaVacio(ver) && '${ERROR}' == 0){
            salir = 1;
            f_but_cerrar();
        }
        
        if (document.axisjob002Form.CMODO.value == 'EDITAR' && salir == 0  ){
            objDom.setDisabledPorId("NUMJOB",true);
            objDom.setDisabledPorId("FUNCION",true);
            document.axisjob002Form.PFECHA.focus();
        }
        else if (document.axisjob002Form.CMODO.value == 'NUEVO' && salir == 0 ){
            objDom.setVisibilidadPorId("NUMJOB","hidden");
            objDom.setVisibilidadPorId("LNUMJOB","hidden");
         
            document.axisjob002Form.FUNCION.focus();
        }
        f_cargar_propiedades_pantalla();
       }
        
    </script>
  </head>
    <body onload="f_onload()" class=" ">
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
        <form name="axisjob002Form" action="" method="POST">
            <input type="hidden" name="operation" value="">
            <input type="hidden" name="CMODO" value="${__formdata.CMODO}">
            <input type="hidden" name="CNUMJOB" value="${CNUMJOB}">
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt f="axisjob002" c="FORM" lit="1000113" /></c:param>
                <c:param name="producto"><axis:alt f="axisjob002" c="PRODUCTO" lit="1000113" /></c:param>
                <c:param name="form">Axisjob002</c:param>
            </c:import>
            <!-- Area de campos  -->
            <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <table class="seccion">    
                        <div  class="titulo"><img src="images/flecha.gif"/><b><axis:alt f="axisjob002" c="TITULO" lit="9001669" /></div>
                        <tr>
                            <td align="left" >
                                <table class="area" align="center">
                                    <tr>
                                        <th style="width:15%;height:0px"></th>
                                        <th style="width:35%;height:0px"></th>
                                        <th style="width:25%;height:0px"></th>
                                        <th style="width:5%;height:0px"></th>
                                        <th style="width:20%;height:0px"></th>
                                        
                                    </tr>
                                    <tr>
                                        <!-- Codigo -->
                                        <td class="titulocaja" id="LNUMJOB" >
                                            <b><axis:alt f="axisjob002" c="LNUMJOB" lit="1000109" /></b>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="campocaja" >
                                            <input type="text" name="NUMJOB" id="NUMJOB"  value="${__formdata.NUMJOB}"  class="campowidthinput campo campotexto"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <!-- Codigo -->
                                        <td class="titulocaja" >
                                            <b><axis:alt f="axisjob002" c="FUNCION" lit="1000505" /></b>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td class="campocaja" colspan="3">
                                            <textarea  rows="2" cols="20" class="campo campotexto"  style="width:100%;"  name="FUNCION" id="FUNCION" title="<axis:alt f="axisjob002" c="FUNCION" lit="1000505"/>" <axis:atr f="axisjob002" c="FUNCION" a="obligatorio=true"/>>${__formdata.FUNCION}</textarea>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="titulocaja" >
                                            <b><axis:alt f="axisjob002" c="PFECHA" lit="9001574" /></b>
                                        </td> 
                                        <td class="titulocaja" >
                                            <b><axis:alt f="axisjob002" c="PHORA" lit="102790" /></b>
                                        </td>
                                        <td class="titulocaja" >
                                            <b><axis:alt f="axisjob002" c="CINTERVALO" lit="9001583" /></b>
                                        </td> 
                                        <td class="titulocaja" >
                                            <b><axis:alt f="axisjob002" c="CBLOQUEADO" lit="9001584" /></b>
                                        </td> 
                                    </tr>
                                    <tr> 
                                        <td class="campocaja" >
                                            <input type="text" formato="fecha" name="PFECHA" id="PFECHA" style="width:70%;"   value="<fmt:formatDate value="${__formdata.PFECHA}" pattern="dd/MM/yyyy" />" class="campowidthinput campo campotexto"
                                            title="<axis:alt f="axisjob002" c="PFECHA" lit="9001574"/>" <axis:atr f="axisjob002" c="PFECHA" a="obligatorio=true"/>/>
                                            <a id="icon_PFECHA" style="vertical-align:middle;">
                                            <img alt="<axis:alt f="axisjob002" c="CAL" lit="108341" />" title="<axis:alt f="axisjob002" c="PFECHA" lit="100883"/>" src="images/calendar.gif"/></a>
                                        </td>
                                        <td class="campocaja">
                                            <input tabindex="1400" type="text" class="campowidthinput campo" id="PHORA" name="PHORA" maxislength="5" size="15" style="width:30%"
                                              value="${__formdata['PHORA']}" title="<axis:alt f='axisjob002' c='HORA' lit='102790' />" <axis:atr f="axisjob002" c="PHORA" a="formato=hora&obligatorio=true"/> />
                                        </td>
                                        <td class="campocaja" >
                                            <input type="text" name = "CINTERVALO" id="CINTERVALO"  value="${__formdata.CINTERVALO}"  class="campowidthinput campo campotexto" title="<axis:alt f="axisjob002" c="CINTERVALO" lit="9001583"/>" <axis:atr f="axisjob002" c="CINTERVALO" a="obligatorio=false"/>/>
                                        </td>
                                        <td class="campocaja" >
                                            <select name = "CBLOQUEADO" id="CBLOQUEADO"  
                                                    value="" size="1" onchange="" class="campowidthselect campo campotexto_ob"
                                                    title="<axis:alt f="axisjob002" c="CBLOQUEADO" lit="9001584"/>"
                                                    <axis:atr f="axisjob002" c="CBLOQUEADO" a="obligatorio=true"/>>
                                                    <option value=""> - <fmt:message key="108341"/> - </option>
                                                    <c:forEach var="bloqueado" items="${BLOQUEADO}">
                                                        <option value = "${bloqueado.CATRIBU}"
                                                        <c:if test="${(!empty __formdata.CBLOQUEADO)&& bloqueado.CATRIBU == __formdata.CBLOQUEADO}"> selected </c:if>>
                                                        ${bloqueado.TATRIBU}</option>  
                                                    </c:forEach>
                                            </select>
                                        </td>
                                    </tr>
                                </table>    
                            </td>
                        </tr>
                        </table>
                    </td>
                </tr>
            </table>					
            
            

	<c:import url="../include/botonera_nt.jsp">
        <c:param name="f">axisjob002</c:param>
        <c:param name="__botones">cerrar<axis:visible c="BT_ACEPTAR" f="axisjob002">,aceptar</axis:visible></c:param>
    </c:import>

            
            <script type="text/javascript">
            Calendar.setup({
            inputField     :    "PFECHA",     
            ifFormat       :    "%d/%m/%Y",      
            button         :    "icon_PFECHA", 
            singleClick    :    true,
            firstDay       :    1
            });
</script>
            
        </form>
      <c:import url="../include/mensajes.jsp" />
    </body>
</html>

