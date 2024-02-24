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
    
    
    function f_but_guardar() {
        
        var CLAVE = objDom.getValorPorId("NTRAMO");
        var CODIGO = objDom.getValorPorId("CONCEPTO");
        
        
        if (objValidador.validaEntrada())
            parent.f_aceptar_axisgfi013(TRAMO, CONCEPTO);
    }
    
    
    
    function f_onload() {
     var ok = "${__formdata.resultado}";
     
     if (!objUtiles.estaVacio(ok) && ok == 0)   
         parent.f_aceptar_axigfi013();
    var hayErrores    = ${!empty requestScope.__mensajes.m__clave};
      var hayNtramo    = ${!empty __formdata.NTRAMO};
      if ((hayNtramo)&&(document.getElementById('NTRAMO') != null)){
        if (!hayErrores){
            document.getElementById('NTRAMO').readOnly = true;
        }
      }
       f_cargar_propiedades_pantalla();
        
    }
    
    function f_but_cancelar(){
         //alert("Antes de cerrar");
         parent.f_cerrar_modal('axisgfi013');
    }
    
    function f_but_aceptar(){
         //alert("Antes de aceptar");
         if (objValidador.validaEntrada()){
         //parent.f_aceptar_axigfi013(document.miForm.NTRAMO.value,document.miForm.CONCEPTO.value,document.miForm.CONCEPTO_FRANJA.value,document.miForm.CONCEPTO_VALOR.value);
              objUtiles.ejecutarFormulario("modal_axisgfi013.do", "guardar", document.miForm, "_self", objJsMessages.jslit_cargando);
         }
    }
    
   
    </script>
  </head>
  <body onload="f_onload()" onkeypress="if (event.keyCode==13)  { f_but_aceptar() }">
  <c:import url="../include/precargador_ajax.jsp"><c:param name="imagen" value="images/ajax-loader.gif"></c:param></c:import>
<form name="miForm" action="modal_axisgfi003.do" method="POST"> 
<input type="hidden" name="operation" value="aceptar" />
<input type="hidden" name="isNew" id="isNew" value="${__formdata.isNew}" />

<c:import url="../include/titulo_nt.jsp">
    <c:param name="formulario"><axis:alt f="axisgfi013" c="FORM" lit="9002000" /></c:param>
    <c:param name="form">axisgfi013</c:param>
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
                                                    <b><axis:alt f="axisgfi013" c="NTRAMO" lit="9000609" /></b><!-- Tramo -->
                                                </td>
                                            </axis:visible>
                                            <axis:visible f="axisgfi017" c="CONCEPTO">                
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axisgfi013" c="CONCEPTO" lit="9000715" /></b><!-- Concepto -->
                                                </td>                
                                            </axis:visible>
                                        </tr>
                                        <tr>
                                            <td>
                                                <axis:visible f="axisgfi017" c="NTRAMO">
                                                    <input type="text" class="campowidthinput campo campotexto" id="NTRAMO" name="NTRAMO" style="width:20%"
                                                    size="15" value="${__formdata.NTRAMO}" title="<axis:alt f="axisgfi013" c="NTRAMO" lit="1000085"/>" <axis:atr f="axisgfi013" c="NTRAMO" a="modificable=true&obligatorio=true&formato=decimal"/>/>
                                                </axis:visible>
                                            </td>
                                            <td>
                                                <axis:visible f="axisgfi017" c="CONCEPTO">
                                                    <input type="text" class="campowidthinput campo campotexto" id="CONCEPTO" name="CONCEPTO" style="width:50%"
                                                    size="15" value="${__formdata.CONCEPTO}" title="<axis:alt f="axisgfi013" c="CCONCEPTO" lit="1000085"/>" <axis:atr f="axisgfi013" c="CONCEPTO" a="modificable=true&obligatorio=true"/>/>
                                                </axis:visible>
                                            </td>
                                        </tr>
                                        <tr>
                                            <axis:visible f="axisgfi017" c="CONCEPTO_FRANJA">                
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axisgfi013" c="CONCEPTO_FRANJA" lit="9001997" /></b><!-- Concepto franja -->
                                                </td>                
                                            </axis:visible>
                                            <axis:visible f="axisgfi017" c="CONCEPTO_VALOR">                
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axisgfi013" c="CONCEPTO_VALOR" lit="9001998" /></b><!-- Concepto valor -->
                                                </td>                
                                            </axis:visible>
                                        </tr>
                                        <tr>
                                           
                                            <axis:visible f="axisgfi017" c="CONCEPTO_FRANJA">                
                                                <td class="campocaja" colspan="1">
                                                    <input style="width:90%;" type="text" class="campowidthinput campo campotexto" id="CONCEPTO_FRANJA" name="CONCEPTO_FRANJA" 
                                                    size="15" value="${__formdata.CONCEPTO_FRANJA}" title="<axis:alt f="axisgfi013" c="CONCEPTO_FRANJA" lit="9001997"/>" <axis:atr f="axisgfi013" c="CONCEPTO_FRANJA" a="modificable=true"/>/>
                                                </td>
                                            </axis:visible>
                                            <axis:visible f="axisgfi017" c="CONCEPTO_VALOR">                
                                                <td class="campocaja" colspan="1">
                                                    <input style="width:90%;" type="text" class="campowidthinput campo campotexto" id="CONCEPTO_VALOR" name="CONCEPTO_VALOR" 
                                                    size="15" value="${__formdata.CONCEPTO_VALOR}" title="<axis:alt f="axisgfi013" c="CONCEPTO_VALOR" lit="9001998"/>" <axis:atr f="axisgfi013" c="CONCEPTO_VALOR" a="modificable=true"/>/>
                                                </td>
                                            </axis:visible>
                                            
                                        </tr>
                                    </table>
                                <td>
                    </tr>           
               </table>
        </td>
    </tr>
</table>
<c:import url="../include/botonera_nt.jsp"><c:param name="f">ANT__SURROGATE__FNAME</c:param><c:param name="f">axisgfi013</c:param><c:param name="__botones">cancelar,aceptar</c:param></c:import>

</form>
<c:import url="../include/mensajes.jsp" />
</body>
</html>