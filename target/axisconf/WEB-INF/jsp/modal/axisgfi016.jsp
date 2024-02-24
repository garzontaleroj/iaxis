<%/*
*  Fichero: axisgfi016.jsp
*
*  @author <a href = "mailto:lcalvo@csi-ti.com">Luz Calvo</a>
*
*  Fecha: 23/07/2009
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
    var hayORDEN   = ${!empty __formdata.ORDEN};
      if ((hayORDEN)&&(document.getElementById('ORDEN') != null)){
        document.getElementById('ORDEN').readOnly = true;
      }
        f_cargar_propiedades_pantalla();
    }
    
    function f_but_cancelar(){
         //alert("Antes de cerrar");
         parent.f_cerrar_modal('axisgfi016');
    }
    
    function f_but_aceptar(){
         //alert("Antes de aceptar");
         orden = '';
          <c:if test="${!empty __formdata.isNew && __formdata.isNew == 0}">
            orden = document.miForm.ORDEN.value;
          </c:if>
         
         if (objValidador.validaEntrada()){
         parent.f_aceptar_axigfi016(orden,document.miForm.DESDE.value,document.miForm.HASTA.value,document.miForm.VALOR.value);
         }
    }
    
   
   
    </script>
  </head>
  <body onload="f_onload()" onkeypress="if (event.keyCode==13)  { f_but_aceptar() }">
  <c:import url="../include/precargador_ajax.jsp"><c:param name="imagen" value="images/ajax-loader.gif"></c:param></c:import>
<form name="miForm" action="modal_axisgfi016.do" method="POST"> 
<input type="hidden" name="operation" value="aceptar" />
<input type="hidden" id="isNew" name="isNew" value="${__formdata.isNew}" />

<c:import url="../include/titulo_nt.jsp">
    <c:param name="formulario"><axis:alt f="axisgfi016" c="FORM" lit="9002005" /></c:param>
    <c:param name="form">axisgfi016</c:param>
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
                                    <th style="height:0px;width:25%"></th>
                                    <th style="height:0px;width:25%"></th>
                                    <th style="height:0px;width:25%"></th>
                                    <th style="height:0px;width:25%"></th>
                                </tr>
                                <tr>
                                   <c:if test="${!empty __formdata.isNew && __formdata.isNew == 0}">
                                        <td class="titulocaja">
                                        <axis:visible f="axisgfi016" c="ORDEN">
                                            <b><axis:alt f="axisgfi016" c="ORDEN" lit="500102" /></b>
                                        </axis:visible>
                                        </td>
                                    </c:if>
                                        <td class="titulocaja">
                                        <axis:visible f="axisgfi016" c="DESDE">
                                            <b><axis:alt f="axisgfi016" c="DESDE" lit="104095" /></b>
                                        </axis:visible>
                                        </td>
                                        <td class="titulocaja">
                                        <axis:visible f="axisgfi016" c="HASTA">
                                            <b><axis:alt f="axisgfi016" c="HASTA" lit="103051" /></b>
                                        </axis:visible>
                                        </td>
                                        <td class="titulocaja">
                                        <axis:visible f="axisgfi016" c="VALOR">
                                            <b><axis:alt f="axisgfi016" c="VALOR" lit="101159" /></b>
                                        </axis:visible>
                                        </td>
                                    
                                    <td></td>
                                </tr>
                                <tr>
                                <c:if test="${!empty __formdata.isNew && __formdata.isNew == 0}">
                                    <td>
                                        <axis:visible f="axisgfi016" c="ORDEN">
                                        
                                            <input type="text" class="campowidthinput campo campotexto" id="ORDEN" name="ORDEN" style="width:60%" formato="entero"
                                            size="15" value="${__formdata.ORDEN}" title="<axis:alt f="axisgfi016" c="ORDEN" lit="500102"/>" <axis:atr f="axisgfi016" c="ORDEN" a="modificable=true&obligatorio=true"/>/>
                                            &nbsp;&nbsp;&nbsp;
                                        </axis:visible>
                                    </td>
                                    </c:if>
                                    <td>
                                        <axis:visible f="axisgfi016" c="DESDE">
                                        
                                            <input type="text" class="campowidthinput campo campotexto" id="DESDE" name="DESDE" style="width:60%" formato="entero"
                                            size="15" value="${__formdata.DESDE}" title="<axis:alt f="axisgfi016" c="DESDE" lit="104095"/>" <axis:atr f="axisgfi016" c="DESDE" a="modificable=true&obligatorio=true"/>/>
                                            &nbsp;&nbsp;&nbsp;
                                        </axis:visible>
                                    </td>
                                    <td>
                                        <axis:visible f="axisgfi016" c="HASTA">
                                        
                                            <input type="text" class="campowidthinput campo campotexto" id="HASTA" name="HASTA" style="width:60%" formato="entero"
                                            size="15" value="${__formdata.HASTA}" title="<axis:alt f="axisgfi016" c="HASTA" lit="103051"/>" <axis:atr f="axisgfi016" c="HASTA" a="modificable=true&obligatorio=true"/>/>
                                            &nbsp;&nbsp;&nbsp;
                                        </axis:visible>
                                    </td>
                                    <td>
                                        <axis:visible f="axisgfi016" c="VALOR">
                                        
                                            <input type="text" class="campowidthinput campo campotexto" id="VALOR" name="VALOR" style="width:60%" formato="decimal"
                                            size="15" value="${__formdata.VALOR}" title="<axis:alt f="axisgfi016" c="VALOR" lit="101159"/>" <axis:atr f="axisgfi016" c="VALOR" a="modificable=true&obligatorio=true"/>/>
                                            &nbsp;&nbsp;&nbsp;
                                        </axis:visible>
                                    </td>
                                </tr>
                                
                            </table>
                        </td>
                     </tr>   
               
            </table>
        </td>
    </tr>
</table>
<c:import url="../include/botonera_nt.jsp"><c:param name="f">axisgfi016</c:param><c:param name="__botones">cancelar,aceptar</c:param></c:import>

</form>
<c:import url="../include/mensajes.jsp" />
</body>
</html>