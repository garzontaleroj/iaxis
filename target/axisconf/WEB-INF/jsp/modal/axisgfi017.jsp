<%/*
*  Fichero: axisgfi017.jsp
*
*  @author <a href = "mailto:lcalvo@csi-ti.com">Luz Calvo</a>
*
*  Fecha: 21/07/2008
*/
%>

<%@ page contentType="text/html;charset=iso-8859-15" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <link rel="stylesheet" href="styles/genericosHtml.css" type="text/css">
    <link rel="stylesheet" href="styles/axisnt.css" type="text/css">
    <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>
    <c:import url="../include/carga_framework_js.jsp" />
    <script language="Javascript">
    
    
    function f_onload() {
        f_cargar_propiedades_pantalla();
    }
    
    function f_but_cancelar(){
         //alert("Antes de cerrar");
         parent.f_cerrar_modal('axisgfi017');
    }
    
    function f_but_buscar(){
         if (objValidador.validaEntrada()) {
            parent.f_aceptar_axigfi017(document.miForm.NTRAMO.value,document.miForm.CONCEPTO.value);
        }
    }
    
    function f_but_nuevo(){
        if (objValidador.validaEntrada()) {
            parent.f_cerrar_modal('axisgfi017');
            parent.f_but_alta('','','','','1');
        }
    }
    
   
    </script>
  </head>
  <body onload="f_onload()" onkeypress="if (event.keyCode==13)  { f_but_buscar() }">
  <c:import url="../include/precargador_ajax.jsp"><c:param name="imagen" value="images/ajax-loader.gif"></c:param></c:import>
<form name="miForm" action="modal_axisgfi001.do" method="POST"> 
<input type="hidden" name="operation" value="aceptar" />

<c:import url="../include/titulo_nt.jsp">
    <c:param name="formulario"><axis:alt f="axisgfi017" c="FORM" lit="9001995" /></c:param>
    <c:param name="form">axisgfi017</c:param>
</c:import>
<table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
    <tr>
        <td>
            <!--campos-->
            <table class="seccion">
            <tr>
                <td>
                      <table class="area" align="center">       
                                <tr>
                                    <th style="height:0px;width:50%"></th>
                                    <th style="height:0px;width:50%"></th>
                                </tr>
                                <tr>
                                   <axis:visible f="axisgfi017" c="NTRAMO">
                                        <td class="titulocaja">
                                            <b><axis:alt f="axisgfi017" c="NTRAMO" lit="9000609" /></b>
                                        </td>
                                    </axis:visible>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>
                                        <axis:visible f="axisgfi017" c="NTRAMO">
                                        
                                            <input type="text" class="campowidthinput campo campotexto" id="NTRAMO" name="NTRAMO" style="width:20%" formato="entero"
                                            size="15" value="" title="<axis:alt f="axisgfi017" c="NTRAMO" lit="9000609"/>" <axis:atr f="axisgfi017" c="NTRAMO" a="modificable=true"/>/>
                                            &nbsp;&nbsp;&nbsp;
                                        </axis:visible>
                                    </td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <axis:visible f="axisgfi017" c="CONCEPTO">                
                                        <td class="titulocaja">
                                            <b><axis:alt f="axisgfi017" c="CONCEPTO" lit="9000715" /></b>
                                        </td>                
                                    </axis:visible>
                                    <td></td>
                                </tr>
                                <tr>
                                   
                                    <axis:visible f="axisgfi017" c="CONCEPTO">                
                                        <td class="campocaja" colspan="1">
                                            <input style="width:50%;" type="text" class="campowidthinput campo campotexto" id="CONCEPTO" name="CONCEPTO" 
                                            size="15" value="" title="<axis:alt f="axisgfi017" c="CONCEPTO" lit="9000715"/>" <axis:atr f="axisgfi017" c="CONCEPTO" a="modificable=true"/>/>
                                        </td>
                                    </axis:visible>
                                    <td></td>
                                </tr>
                            </table>
                        </td>
                     </tr>   
               
            </table>
        </td>
    </tr>
</table>
<c:import url="../include/botonera_nt.jsp"><c:param name="f">axisgfi017</c:param><c:param name="__botones">cancelar,nuevo,buscar</c:param></c:import>

</form>
<c:import url="../include/mensajes.jsp" />
</body>
</html>