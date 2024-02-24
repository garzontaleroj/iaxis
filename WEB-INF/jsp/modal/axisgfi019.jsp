<%/*
*  Fichero: axisgfi019.jsp ALTA/MOD. BUCLES
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
        var hayTERMINO   = ${!empty __formdata.TERMINO};
      if ((hayTERMINO)&&(document.getElementById('TERMINO') != null)){
        document.getElementById('TERMINO').readOnly = true;
      }
        f_cargar_propiedades_pantalla();
    }
    
    function f_but_cancelar(){
         //alert("Antes de cerrar");
         parent.f_cerrar_modal('axisgfi019');
    }
    
    function f_but_aceptar(){
         //alert("Antes de aceptar");
         if (objValidador.validaEntrada()){
         //alert(document.miForm.OPERACION.value);
         parent.f_aceptar_axigfi019(document.miForm.TERMINO.value,document.miForm.NITERAC.value,document.miForm.OPERACION.value,document.miForm.NEW.value);
         }
    }
    
   
    </script>
  </head>
  <body onload="f_onload()" onkeypress="if (event.keyCode==13)  { f_but_aceptar() }">
  <c:import url="../include/precargador_ajax.jsp"><c:param name="imagen" value="images/ajax-loader.gif"></c:param></c:import>
<form name="miForm" action="modal_axisgfi001.do" method="POST"> 
<input type="hidden" name="operation" value="aceptar" />
<input type="hidden" name="NEW" value="${__formdata.NEW}" />

<c:import url="../include/titulo_nt.jsp">
    <c:param name="formulario"><axis:alt f="axisgfi019" c="FORM" lit="9901761" /></c:param>
    <c:param name="form">axisgfi019</c:param>
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
                                   <axis:visible f="axisgfi019" c="TERMINO">
                                        <td class="titulocaja">
                                            <b><axis:alt f="axisgfi019" c="TERMINO" lit="9001991" /></b>
                                        </td>
                                    </axis:visible>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>
                                        <axis:visible f="axisgfi019" c="TERMINO">
                                        
                                            <input type="text" class="campowidthinput campo campotexto" id="TERMINO" name="TERMINO" style="width:20%"
                                            size="15" value="${__formdata.TERMINO}" title="<axis:alt f="axisgfi019" c="TERMINO" lit="9001991"/>" <axis:atr f="axisgfi017" c="TERMINO" a="modificable=true&obligatorio=true"/>/>
                                            &nbsp;&nbsp;&nbsp;
                                        </axis:visible>
                                    </td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <axis:visible f="axisgfi019" c="NITERAC">                
                                        <td class="titulocaja">
                                            <b><axis:alt f="axisgfi019" c="NITERAC" lit="9002037" /></b>
                                        </td>                
                                    </axis:visible>
                                    <td></td>
                                </tr>
                                <tr>
                                   
                                    <axis:visible f="axisgfi019" c="NITERAC">                
                                        <td class="campocaja" colspan="1">
                                            <input style="width:50%;" type="text" class="campowidthinput campo campotexto" id="NITERAC" name="NITERAC" 
                                            size="15" value='${__formdata.NITERAC}' title="<axis:alt f="axisgfi019" c="NITERAC" lit="9002037"/>" <axis:atr f="axisgfi019" c="NITERAC" a="modificable=true&obligatorio=true"/>/>
                                        </td>
                                    </axis:visible>
                                    <td></td>
                                </tr>
                                <tr>
                                    <axis:visible f="axisgfi019" c="OPERACION">                
                                        <td class="titulocaja">
                                            <b><axis:alt f="axisgfi019" c="OPERACION" lit="9002038" /></b>
                                        </td>                
                                    </axis:visible>
                                    <td></td>
                                </tr>
                                <tr>
                                   
                                    <axis:visible f="axisgfi019" c="OPERACION">                
                                        <td class="campocaja" colspan="1">
                                            <select name = "OPERACION" id="OPERACION" title="<axis:alt f="axisgfi019" c="NITERAC" lit="9002038"/>" style="width:51%;"  size="1" onchange="" class="campowidthselect campo campotexto_ob" <axis:atr f="axisgfi019" c="OPERACION" a="isInputText=false&modificable=true&obligatorio=true"/> >
                                                <option value = "null" selected> - <axis:alt f="axisgfi019" c="SNV_COMBO" lit="1000348"/> - </option>
                                                <option value = "*" <c:if test="${__formdata.OPERACION=='*'}">selected</c:if> >*</option>
                                                <option value = "+" <c:if test="${__formdata.OPERACION ne '*'}">selected</c:if>>+</option>
                                            </select>
                                            
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
<c:import url="../include/botonera_nt.jsp"><c:param name="f">axisgfi019</c:param><c:param name="__botones">cancelar,aceptar</c:param></c:import>

</form>
<c:import url="../include/mensajes.jsp" />
</body>
</html>