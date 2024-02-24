<%/*
*  Fichero: axisadm050.jsp
*  @author <a href = "mailto:rkirchner@csi-ti.com">Roger Kirchner</a> 
*
*  Fecha: 07/07/2008
*/
%>

<%@ page contentType="text/html;charset=iso-8859-15" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ page import="axis.mvc.control.AbstractDispatchAction"%>
<%@ page import="axis.service.axis.AxisBaseService"%>


<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
    <title><axis:alt f="axisadm050" c="LIT" lit="1000564"/></title> <%-- CONSULTA DE DATOS DE UN RECIBO --%>
    <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
    <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
    <link rel="stylesheet" href="styles/displaytag.css">
    <c:import url="../include/carga_framework_js.jsp"/>
    
  
   <c:set var="saltar"></c:set>
    <script type="text/javascript">
    
        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/
        
        function f_onload() { 
            f_cargar_propiedades_pantalla();
            revisarEstilos();
            var nrecibo = "${__formdata.NRECIBO_ORIGEN}";
            
            if (objUtiles.estaVacio(nrecibo))        
                f_buscar_recibos('1');            
            
        }
             
        function f_but_salir() {
                objUtiles.ejecutarFormulario("flujodetrabajo.do?forigen=axisadm050", "cancelar", document.miForm, "_self");
            }
         
          function f_cerrar_modal(cual) {
            objUtiles.cerrarModal(cual);
        }
         
        function f_aceptar_modal_recerca_rebut(NREBUT) {
            
            f_cerrar_modal('axisadm001');        
            var TIPUSREBUT = document.miForm.TIPORECIBO.value;
            if(TIPUSREBUT=='1')
            objDom.setValorPorId("NRECIBO_ORIGEN", NREBUT);
            else if(TIPUSREBUT=='2')
            objDom.setValorPorId("NRECIBO_DESTINO", NREBUT);
      

            objUtiles.ejecutarFormulario("axis_axisadm050.do", "buscarRebut", document.miForm, "_self", objJsMessages.jslit_cargando);                
  
        }
        
        /****************************************************************************************/
        /************************************** MODAL *******************************************/
        /****************************************************************************************/
        
        function f_abrir_modal(cual, noXButton, optionalQueryString) {
            if (objUtiles.estaVacio(optionalQueryString))                
                optionalQueryString = "";
                
            if (noXButton) 
                objDom.setVisibilidadPorId("but_cerrar_modal_" + cual, "hidden");    
                
            objUtiles.abrirModal(cual, "src", "modal_" + cual + ".do?operation=form" + optionalQueryString);    
        }
               
        
        function f_buscar_rebut_directe_destino(NRECIBO) {       
                objUtiles.ejecutarFormulario("axis_axisadm050.do?TIPOREBUT=destino&REBUTATRACTAR="+NRECIBO, "buscarRebut", document.miForm, "_self", objJsMessages.jslit_cargando);                
                
            }
            
        function f_buscar_rebut_directe_origen(NRECIBO) {                
                objUtiles.ejecutarFormulario("axis_axisadm050.do?TIPOREBUT=origen&REBUTATRACTAR="+NRECIBO, "buscarRebut", document.miForm, "_self", objJsMessages.jslit_cargando);                
                
            }   
        function f_buscar_recibos(tipoRecibo) {
                document.miForm.TIPORECIBO.value = tipoRecibo;
                f_abrir_modal("axisadm001");
        }
            
        function f_cerrar_modal(cual) {
            objUtiles.cerrarModal(cual);
        }
        
        function f_but_aceptar() {
            if (objValidador.validaEntrada())
                objUtiles.ejecutarFormulario("axis_axisadm050.do", "aceptar", document.miForm, "_self", objJsMessages.jslit_cargando);                
        }
            
        function f_calcular_saldos(){
            objUtiles.ejecutarFormulario("axis_axisadm050.do?MODI=1", "form", document.miForm, "_self", objJsMessages.jslit_cargando);                
       }
      
        
    </script>    
</head>

<body onunload="try { f_clear_resources(document.body) } catch (e) {}" onload="f_onload()">
    
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">axisadm001|<axis:alt f="axisadm050" c="LIT" lit="1000552"/></c:param>
        </c:import>    
    
    <form name="miForm" action="" method="POST">         
    
        <c:import url="../include/titulo_nt.jsp">
                <c:param name="titulo"><axis:alt f="axisadm050" c="LIT" lit="9901046"/></c:param>     <%-- Transferencias de saldo --%>
                <c:param name="formulario"><axis:alt f="axisadm050" c="LIT" lit="9901046"/></c:param> <%-- Transferencias de saldo --%>
                <c:param name="form">axisadm050</c:param>
        </c:import>
        
        <input type="hidden" name="operation" value=""/>
        <input type="hidden" name="TIPORECIBO" value="${__formdata.TIPORECIBO}"/>
        

        
        <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
        <%-- Origen recibo --%>
            <tr>
                <td>
                     <div class="separador">&nbsp;</div>
                    <div class="titulo">
                        <img src="images/flecha.gif"/><b>&nbsp;<axis:alt f="axisadm050" c="LIT" lit="9000443"/> </b>    
                          <b><axis:alt f="axisadm050" c="LIT" lit="1000565"/></b>&nbsp;&nbsp;<axis:alt f="axisadm050" c="LIT" lit="800636"/> ${__formdata.NRECIBO_ORIGEN}&nbsp;-&nbsp;<axis:alt f="axisadm050" c="LIT" lit="100883"/> <fmt:formatDate value="${__formdata.OB_IAX_RECIBOS_ORIGEN.FEFECTO}" pattern="dd/MM/yyyy"/>&nbsp;-&nbsp;<axis:alt f="axisadm050" c="LIT" lit="100885"/> <fmt:formatDate value="${__formdata.OB_IAX_RECIBOS_ORIGEN.FVENCIM}" pattern="dd/MM/yyyy"/>&nbsp;-&nbsp;<axis:alt f="axisadm050" c="LIT" lit="100563"/> <fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${__formdata.OB_IAX_RECIBOS_ORIGEN.IMPORTE}"/>

                    </div>
                    
                    <table class="seccion" align="center">
                        <tr>
                            <td align="left">
                                <table class="area" align="center">
                                    <%-- DATOS RECIBO --%>
                                    <tr>
                                        <td align="left">
                                             <table class="area" align="center">
                                                 <tr>
                                                    <th style="width:25%;height:0px"></th>
                                                    <th style="width:25%;height:0px"></th>
                                                    <th style="width:25%;height:0px"></th>
                                                    <th style="width:25%;height:0px"></th>                                                    
                                                    <th style="width:25%;height:0px"></th>                                                    
                                                </tr>
                                                <tr>                                                
                                                  <%-- Nº recibo --%>
                                                    <td class="titulocaja">
                                                        <b><axis:alt f="axisadm050" c="LIT" lit="800636"/></b>
                                                    </td>
                                                </tr>
                                                 <tr>
                                                 <%-- Nº recibo --%>
                                                    <td class="campocaja">
                                                        <input type="text" class="campo campotexto" id="NRECIBO_ORIGEN" name="NRECIBO_ORIGEN" size="15" style="width:50%" obligatorio="true"
                                                        value="${__formdata.NRECIBO_ORIGEN}" obligatorio="true" onchange="f_buscar_rebut_directe_origen(this.value);"/>
                                                        <img id="find" border="0" src="images/find.gif" alt="<axis:alt f="axisadm050" c="LIT" lit="100797" />" onclick="f_buscar_recibos('1');" style="cursor:pointer"/>                
                                                    </td>
                                                </tr>
                                                
                                                <tr>
                                                    <%-- Empresa --%>
                                                    <td class="titulocaja">
                                                        <b><axis:alt f="axisadm050" c="LIT" lit="101619"/></b>
                                                    </td>
                                                    <%-- Producto --%>
                                                     <td class="titulocaja">
                                                        <b><axis:alt f="axisadm050" c="LIT" lit="100829"/></b>
                                                    </td>                                                  
                                                </tr>
                                                <tr>
                                                    <%-- Empresa --%>
                                                    <td class="campocaja">
                                                        <input type="text" class="campo campotexto campodisabled" id="TEMPRES" name="TEMPRES" size="15" style="width:90%"
                                                        value="${__formdata.OB_IAX_GENPOLIZA_ORIGEN.TEMPRES}" readonly="readonly"/>
                                                        
                                                    </td>
                                                    <%-- Producto --%>
                                                    <td class="campocaja" colspan="2">
                                                        <input type="text" class="campo campotexto campodisabled" id="TROTULO" name="TROTULO" size="15" style="width:95%"
                                                        value="${__formdata.OB_IAX_GENPOLIZA_ORIGEN.TPRODUC}" readonly="readonly"/>
                                                    </td>
                                                </tr>
                                                 <tr>

                                                    <%-- Número de póliza --%>
                                                     <td class="titulocaja">
                                                        <b><axis:alt f="axisadm050" c="LIT" lit="100624"/></b>
                                                    </td>                                                  
                                                    <%-- Número certificado --%>
                                                    <td class="titulocaja">
                                                        <b><axis:alt f="axisadm050" c="LIT" lit="100899"/> <axis:alt f="axisadm050" c="LIT" lit="101300"/></b>
                                                    </td>    
                                                    <%-- Nombre tomador --%>
                                                    <td class="titulocaja">
                                                        <b> <axis:alt f="axisadm050" c="LIT" lit="101027"/></b>
                                                    </td>                                                    
                                                </tr>
                                                <tr>

                                                    <%-- Número de póliza --%>
                                                    <td class="campocaja">
                                                        <input type="text" class="campo campotexto campodisabled" id="NPOLIZA" name="NPOLIZA" size="15" style="width:90%"
                                                        value="${__formdata.OB_IAX_GENPOLIZA_ORIGEN.NPOLIZA}" readonly="readonly"/>
                                                    </td>
                                                    <%-- Número certificado --%>
                                                    <td class="campocaja">
                                                        <input type="text" class="campo campotexto campodisabled" id="NCERTIF" name="NCERTIF" size="15" style="width:20%"
                                                        value="${__formdata.OB_IAX_GENPOLIZA_ORIGEN.NCERTIF}" readonly="readonly"/>
                                                    </td>
                                                    <%-- Nombre tomador --%>
                                                    <td class="campocaja" colspan="2">
                                                        <input type="text" class="campo campotexto campodisabled" id="TNOMTOM" name="TNOMTOM" size="15" style="width:95%"
                                                        value="${__formdata.OB_IAX_GENPOLIZA_ORIGEN.TNOMTOM}" readonly="readonly"/>
                                                    </td>                                                    
                                                </tr>
                        
                                               
                                                <tr>
                                                    <%-- Forma pago --%>
                                                     <td class="titulocaja">
                                                        <b><axis:alt f="axisadm050" c="LIT" lit="100712"/></b>
                                                    </td>   
                                                    <%-- Tipo de cuenta --%>
                                                     <td class="titulocaja">
                                                        <b><axis:alt f="axisadm050" c="LIT" lit="1000374"/></b>
                                                    </td>                                                  
                                                    <%-- Cuenta bancaria --%>
                                                    <td class="titulocaja">
                                                        <b><axis:alt f="axisadm050" c="LIT" lit="100965"/></b>
                                                    </td>                    
                                                </tr>
                                                <tr>
                                                     <%-- Forma pago --%>
                                                    <td class="campocaja">
                                                        <input type="text" class="campo campotexto campodisabled" id="TFORPAG" name="TFORPAG" size="15" style="width:90%"
                                                        value="${__formdata.OB_IAX_RECIBOS_ORIGEN.TFORPAG}" readonly="readonly"/>
                                                    </td>
                                                    <%-- Tipo de cuenta --%>
                                                    <td class="campocaja">
                                                        <input type="text" class="campo campotexto campodisabled" id="TTIPBAN" name="TTIPBAN" size="15" style="width:90%"
                                                        value="${__formdata.OB_IAX_RECIBOS_ORIGEN.TTIPBAN}" readonly="readonly"/>
                                                    </td>
                                                    <%-- Cuenta bancaria --%>
                                                    <td class="campocaja" colspan="2">
                                                        <input type="text" class="campo campotexto campodisabled" id="CBANCAR" name="CBANCAR" size="15" style="width:95%"
                                                        value="${__formdata.OB_IAX_RECIBOS_ORIGEN.CBANCAR}" readonly="readonly"/>
                                                    </td>
                                                </tr>
                                               
                                                <tr>
                                                    <%-- Estado recibo --%>
                                                    <td class="titulocaja">
                                                        <b><axis:alt f="axisadm050" c="LIT" lit="1000553"/></b>
                                                    </td>
                                                    <%-- Importe --%>
                                                    <td class="titulocaja">
                                                        <b><axis:alt f="axisadm050" c="LIT" lit="100563"/></b>
                                                    </td>                    
                                                    <%-- Fecha emisión --%>
                                                    <td class="titulocaja">
                                                        <b><axis:alt f="axisadm050" c="LIT" lit="100883"/></b>
                                                    </td>    
                                                     <%-- Fecha baja --%>
                                                    <td class="titulocaja">
                                                        <b><axis:alt f="axisadm050" c="LIT" lit="100885"/></b>
                                                    </td> 
                                                    
                                                </tr>
                                                <tr>
                                                    <%-- Estado recibo --%>
                                                    <td class="campocaja">
                                                        <input type="text" class="campo campotexto campodisabled" id="TESTREC" name="TESTREC" size="15" style="width:90%"
                                                        value="${__formdata.OB_IAX_RECIBOS_ORIGEN.TESTREC}" readonly="readonly"/>
                                                    </td>
                                                   <%-- Importe --%>
                                                    <td class="campocaja">
                                                        <input type="text" class="campo campotexto" id="TOTAL_RECIBO" name="TOTAL_RECIBO" size="15" style="width:90%"
                                                        value="<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${__formdata.OB_IAX_RECIBOS_ORIGEN.IMPORTE}"/>" readonly="readonly"/>
                                                    </td>
                                                    <%-- Fecha emisión --%>
                                                    <td class="campocaja">
                                                        <input type="text" class="campo campotexto" id="FEMISIO" name="FEMISIO" size="15" style="width:90%"
                                                        value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.OB_IAX_RECIBOS_ORIGEN.FEFECTO}"/>" readonly="readonly"/>
                                                    </td>
                                                     <%-- Fecha baja --%>
                                                    <td class="campocaja">
                                                        <input type="text" class="campo campotexto" id="FVENCIM" name="FVENCIM" size="15" style="width:90%"
                                                        value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.OB_IAX_RECIBOS_ORIGEN.FVENCIM}"/>" readonly="readonly"/>
                                                    </td>
                                                    
                                                    
                                                </tr>
                                            </table>        
                                        </td> 
                                    </tr>       
                                </table>
                            </td>
                        </tr>
                        
                        
                        
                        
                        
                        
                        
                        
                      
                       
                    </table>
                </td>
            </tr>
           
            
          
          <%-- Destino recibo --%>
            <tr>
                <td>
                     <div class="separador">&nbsp;</div>
                    <div class="titulo">
                        <img src="images/flecha.gif"/><b>&nbsp;<axis:alt f="axisadm050" c="LIT" lit="9900766"/> </b>    
                          <b><axis:alt f="axisadm050" c="LIT" lit="1000565"/></b>&nbsp;&nbsp;<axis:alt f="axisadm050" c="LIT" lit="800636"/> ${__formdata.NRECIBO_DESTINO}&nbsp;-&nbsp;<axis:alt f="axisadm050" c="LIT" lit="100883"/> <fmt:formatDate value="${__formdata.OB_IAX_RECIBOS_DESTINO.FEFECTO}" pattern="dd/MM/yyyy"/>&nbsp;-&nbsp;<axis:alt f="axisadm050" c="LIT" lit="100885"/> <fmt:formatDate value="${__formdata.OB_IAX_RECIBOS_DESTINO.FVENCIM}" pattern="dd/MM/yyyy"/>&nbsp;-&nbsp;<axis:alt f="axisadm050" c="LIT" lit="100563"/> <fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${__formdata.OB_IAX_RECIBOS_DESTINO.IMPORTE}"/>

                    </div>
                    
                    <table class="seccion" align="center">
                        <tr>
                            <td align="left">
                                <table class="area" align="center">
                                    <%-- DATOS RECIBO --%>
                                    <tr>
                                        <td align="left">
                                             <table class="area" align="center">
                                                 <tr>
                                                    <th style="width:25%;height:0px"></th>
                                                    <th style="width:25%;height:0px"></th>
                                                    <th style="width:25%;height:0px"></th>
                                                    <th style="width:25%;height:0px"></th>                                                    
                                                    <th style="width:25%;height:0px"></th>                                                    
                                                </tr>
                                                <tr>                                                
                                                  <%-- Nº recibo --%>
                                                    <td class="titulocaja">
                                                        <b><axis:alt f="axisadm050" c="LIT" lit="800636"/></b>
                                                    </td>
                                                </tr>
                                                 <tr>
                                                 <%-- Nº recibo --%>
                                                    <td class="campocaja">
                                                        <input type="text" class="campo campotexto" id="NRECIBO_DESTINO" name="NRECIBO_DESTINO" size="15" style="width:50%" obligatorio="true"
                                                        value="${__formdata.NRECIBO_DESTINO}" obligatorio="true" onchange="f_buscar_rebut_directe_destino(this.value);"/>
                                                        <img id="find" border="0" src="images/find.gif" alt="<axis:alt f="axisadm050" c="LIT" lit="100797" />" onclick="f_buscar_recibos('2');" style="cursor:pointer"/>                
                                                    </td>
                                                </tr>
                                                
                                                <tr>
                                                    <%-- Empresa --%>
                                                    <td class="titulocaja">
                                                        <b><axis:alt f="axisadm050" c="LIT" lit="101619"/></b>
                                                    </td>
                                                    <%-- Producto --%>
                                                     <td class="titulocaja">
                                                        <b><axis:alt f="axisadm050" c="LIT" lit="100829"/></b>
                                                    </td>                                                  
                                                </tr>
                                                <tr>
                                                    <%-- Empresa --%>
                                                    <td class="campocaja">
                                                        <input type="text" class="campo campotexto campodisabled" id="TEMPRES" name="TEMPRES" size="15" style="width:90%"
                                                        value="${__formdata.OB_IAX_GENPOLIZA_DESTINO.TEMPRES}" readonly="readonly"/>
                                                        
                                                    </td>
                                                    <%-- Producto --%>
                                                    <td class="campocaja" colspan="2">
                                                        <input type="text" class="campo campotexto campodisabled" id="TROTULO" name="TROTULO" size="15" style="width:95%"
                                                        value="${__formdata.OB_IAX_GENPOLIZA_DESTINO.TPRODUC}" readonly="readonly"/>
                                                    </td>
                                                </tr>
                                                 <tr>

                                                    <%-- Número de póliza --%>
                                                     <td class="titulocaja">
                                                        <b><axis:alt f="axisadm050" c="LIT" lit="100624"/></b>
                                                    </td>                                                  
                                                    <%-- Número certificado --%>
                                                    <td class="titulocaja">
                                                        <b><axis:alt f="axisadm050" c="LIT" lit="100899"/> <axis:alt f="axisadm050" c="LIT" lit="101300"/></b>
                                                    </td>    
                                                    <%-- Nombre tomador --%>
                                                    <td class="titulocaja">
                                                        <b> <axis:alt f="axisadm050" c="LIT" lit="101027"/></b>
                                                    </td>                                                    
                                                </tr>
                                                <tr>

                                                    <%-- Número de póliza --%>
                                                    <td class="campocaja">
                                                        <input type="text" class="campo campotexto campodisabled" id="NPOLIZA" name="NPOLIZA" size="15" style="width:90%"
                                                        value="${__formdata.OB_IAX_GENPOLIZA_DESTINO.NPOLIZA}" readonly="readonly"/>
                                                    </td>
                                                    <%-- Número certificado --%>
                                                    <td class="campocaja">
                                                        <input type="text" class="campo campotexto campodisabled" id="NCERTIF" name="NCERTIF" size="15" style="width:20%"
                                                        value="${__formdata.OB_IAX_GENPOLIZA_DESTINO.NCERTIF}" readonly="readonly"/>
                                                    </td>
                                                    <%-- Nombre tomador --%>
                                                    <td class="campocaja" colspan="2">
                                                        <input type="text" class="campo campotexto campodisabled" id="TNOMTOM" name="TNOMTOM" size="15" style="width:95%"
                                                        value="${__formdata.OB_IAX_GENPOLIZA_DESTINO.TNOMTOM}" readonly="readonly"/>
                                                    </td>                                                    
                                                </tr>
                        
                                               
                                                <tr>
                                                    <%-- Forma pago --%>
                                                     <td class="titulocaja">
                                                        <b><axis:alt f="axisadm050" c="LIT" lit="100712"/></b>
                                                    </td>   
                                                    <%-- Tipo de cuenta --%>
                                                     <td class="titulocaja">
                                                        <b><axis:alt f="axisadm050" c="LIT" lit="1000374"/></b>
                                                    </td>                                                  
                                                    <%-- Cuenta bancaria --%>
                                                    <td class="titulocaja">
                                                        <b><axis:alt f="axisadm050" c="LIT" lit="100965"/></b>
                                                    </td>                    
                                                </tr>
                                                <tr>
                                                     <%-- Forma pago --%>
                                                    <td class="campocaja">
                                                        <input type="text" class="campo campotexto campodisabled" id="TFORPAG" name="TFORPAG" size="15" style="width:90%"
                                                        value="${__formdata.OB_IAX_RECIBOS_DESTINO.TFORPAG}" readonly="readonly"/>
                                                    </td>
                                                    <%-- Tipo de cuenta --%>
                                                    <td class="campocaja">
                                                        <input type="text" class="campo campotexto campodisabled" id="TTIPBAN" name="TTIPBAN" size="15" style="width:90%"
                                                        value="${__formdata.OB_IAX_RECIBOS_DESTINO.TTIPBAN}" readonly="readonly"/>
                                                    </td>
                                                    <%-- Cuenta bancaria --%>
                                                    <td class="campocaja" colspan="2">
                                                        <input type="text" class="campo campotexto campodisabled" id="CBANCAR" name="CBANCAR" size="15" style="width:95%"
                                                        value="${__formdata.OB_IAX_RECIBOS_DESTINO.CBANCAR}" readonly="readonly"/>
                                                    </td>
                                                </tr>
                                               
                                                <tr>
                                                    <%-- Estado recibo --%>
                                                    <td class="titulocaja">
                                                        <b><axis:alt f="axisadm050" c="LIT" lit="1000553"/></b>
                                                    </td>
                                                    <%-- Importe --%>
                                                    <td class="titulocaja">
                                                        <b><axis:alt f="axisadm050" c="LIT" lit="100563"/></b>
                                                    </td>                    
                                                    <%-- Fecha emisión --%>
                                                    <td class="titulocaja">
                                                        <b><axis:alt f="axisadm050" c="LIT" lit="100883"/></b>
                                                    </td>    
                                                     <%-- Fecha baja --%>
                                                    <td class="titulocaja">
                                                        <b><axis:alt f="axisadm050" c="LIT" lit="100885"/></b>
                                                    </td> 
                                                    
                                                </tr>
                                                <tr>
                                                    <%-- Estado recibo --%>
                                                    <td class="campocaja">
                                                        <input type="text" class="campo campotexto campodisabled" id="TESTREC" name="TESTREC" size="15" style="width:90%"
                                                        value="${__formdata.OB_IAX_RECIBOS_DESTINO.TESTREC}" readonly="readonly"/>
                                                    </td>
                                                   <%-- Importe --%>
                                                    <td class="campocaja">
                                                        <input type="text" class="campo campotexto" id="TOTAL_RECIBO" name="TOTAL_RECIBO" size="15" style="width:90%"
                                                        value="<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${__formdata.OB_IAX_RECIBOS_DESTINO.IMPORTE}"/>" readonly="readonly"/>
                                                    </td>
                                                    <%-- Fecha emisión --%>
                                                    <td class="campocaja">
                                                        <input type="text" class="campo campotexto" id="FEMISIO" name="FEMISIO" size="15" style="width:90%"
                                                        value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.OB_IAX_RECIBOS_DESTINO.FEFECTO}"/>" readonly="readonly"/>
                                                    </td>
                                                     <%-- Fecha baja --%>
                                                    <td class="campocaja">
                                                        <input type="text" class="campo campotexto" id="FVENCIM" name="FVENCIM" size="15" style="width:90%"
                                                        value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.OB_IAX_RECIBOS_DESTINO.FVENCIM}"/>" readonly="readonly"/>
                                                    </td>
                                                    
                                                    
                                                </tr>
                                            </table>        
                                        </td> 
                                    </tr>       
                                </table>
                            </td>
                        </tr>
          
       
            
            
        </table>
          <%-- Saldos --%>
         
        <%--    <tr>
                <td>--%>
                     <div class="separador">&nbsp;</div>                     
                    <div class="titulo">
                        <img src="images/flecha.gif"/><b>&nbsp;<axis:alt f="axisadm050" c="LIT" lit="9001942"/> </b>                        
                    </div>
                    <table class="seccion" align="center">
                        <tr>
                            <td align="left">
                                <table class="area" align="center">
                                    <%-- DATOS RECIBO --%>
                                    <tr>
                                        <th style="width:100%;height:0px"></th>
                                    </tr>
                                                                          
                                    <tr id="datos_recibo_destino">
                                        <td align="left">
                                             <table class="area" align="center">
                                                 <tr>
                                                    <th style="width:15%;height:0px"></th>
                                                    <th style="width:1%;height:0px"></th>
                                                    <th style="width:15%;height:0px"></th>                                                    
                                                    <th style="width:1%;height:0px"></th>
                                                    <th style="width:15%;height:0px"></th>                                                    
                                                    <th style="width:53%;height:0px"></th>                                                    
                                                </tr>
                                                
                                            
                                           
                                                <tr>
                                                <td colspan="5">
                                                   <fieldset>
                                                        <legend class="titulocaja"><b><axis:alt f="axisadm050" c="LIT" lit="9901101"/> - ${__formdata.NRECIBO_ORIGEN}</b></legend>
                                                        <table>
                                                            <tr>
                                                                <th style="width:30%;height:0px"></th>
                                                                <th style="width:1%;height:0px"></th>
                                                                <th style="width:36%;height:0px"></th>                                                    
                                                                <th style="width:1%;height:0px"></th>
                                                                <th style="width:30%;height:0px"></th>                                                     
                                                            </tr>
                                                            <tr>
                                                                <%-- Saldo --%>
                                                                <td class="titulocaja">
                                                                    <b><axis:alt f="axisadm050" c="LIT" lit="9001942"/></b>
                                                                </td>
                                                                  <%-- Signe menos --%>
                                                                 <td class="titulocaja">
                                                                    <b></b>
                                                                </td>                     
                                                                <%-- Transferencia de saldo --%>
                                                                 <td class="titulocaja">
                                                                    <b><axis:alt f="axisadm050" c="LIT" lit="9901103"/></b>
                                                                </td>                     
                                                                  <%-- Signe igual --%>
                                                                 <td class="titulocaja">
                                                                    <b></b>
                                                                </td>                     
                                                                 <%-- Saldo final --%>
                                                                 <td class="titulocaja">
                                                                    <b><axis:alt f="axisadm050" c="LIT" lit="9002057"/></b>
                                                                </td>              
                                                            </tr>
                                                            <tr>
                                                                <%-- Saldo --%>
                                                                <td class="campocaja">
                                                                    <input type="text" class="campo campotexto" id="PISALDO_ORIGEN" name="PISALDO_ORIGEN" size="15" style="width:100%"
                                                                     value="<c:if test="${empty __formdata.PISALDO_ORIGEN}"><fmt:formatNumber pattern='${__formatNumberPatterns[__defaultCMONINT]}' value='0'/></c:if><c:if test="${!empty __formdata.PISALDO_ORIGEN}"><fmt:formatNumber pattern='${__formatNumberPatterns[__defaultCMONINT]}' value='${__formdata.PISALDO_ORIGEN}'/></c:if>" readonly="readonly"/>                                                        
                                                                </td>
                                                                <td>
                                                                  -&nbsp;
                                                                </td>
                                                                
                                                                 <%-- Transferencia de saldo --%>
                                                                <td class="campocaja">
                                                                    <input type="text" class="campo campotexto" id="TRANSF_ORIGEN" name="TRANSF_ORIGEN" obligatorio size="15" style="width:100%"                                                     
                                                                     value="<fmt:formatNumber pattern='${__formatNumberPatterns[__defaultCMONINT]}' value='${__formdata.TRANSF_ORIGEN}'/>" onchange="f_calcular_saldos();"/>                                                        
                                                                    
                                                                </td>
                                                                 <td>
                                                                  =&nbsp;
                                                                </td>                                                    
                                                                
                                                                 <%-- Saldo final --%>
                                                                <td class="campocaja">
                                                                    <input type="text" class="campo campotexto" id="PFSALDO_ORIGEN" name="PFSALDO_ORIGEN" size="15" style="width:100%"
                                                                     value="<fmt:formatNumber pattern='${__formatNumberPatterns[__defaultCMONINT]}' value='${__formdata.PISALDO_ORIGEN - __formdata.TRANSF_ORIGEN}'/>" readonly/>
                                                                    
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </fieldset>
                                                    </td>
                                                    <td style="width:100%;" rowspan="4"  class="campocaja"> 
                                                       <table>
                                                            <tr>
                                                                <th style="width:15%;height:0px"></th>
                                                                <th style="width:85%;height:0px"></th>
                                                                                                                
                                                            </tr>
                                                            <tr>
                                                            <axis:visible f="axisadm050" c="TDESCRIP">
                                                                <TD></TD>
                                                                <td class="titulocaja">
                                                                    <div id="literal_tdescrip" ><b><axis:alt f="axisadm050" c="LIT" lit="100588"/></b><!-- descrpcion --></div>
                                                                </td> 
                                                            </axis:visible>
                                                            </tr>
                                                            <tr>
                                                            <axis:visible f="axisadm050" c="TDESCRIP">
                                                                <TD></TD>
                                                                <td>
                                                                    <textarea rows="8" class="campo campotexto" <axis:atr f="axisadm050" c="TDESCRIP" a="modificable=true&isInputText=false"/> style="width:100%;"  name="TDESCRIP" id="TDESCRIP">${__formdata.TDESCRIP}</textarea>
                                                                </td>
                                                            </axis:visible>
                                                            </tr>
                                                       </table> 
                                                    </td>
                                                </tr>
                                                <tr>
                                                
                                                <c:if test="${!empty __formdata.NRECIBO_DESTINO}">
                                                <tr>
                                                 <td colspan="5">
                                                   <fieldset>
                                                        <legend class="titulocaja"><b><axis:alt f="axisadm050" c="LIT" lit="9901102"/> - ${__formdata.NRECIBO_DESTINO}</b></legend>
                                                        <table>
                                                            <tr>
                                                                <th style="width:30%;height:0px"></th>
                                                                <th style="width:1%;height:0px"></th>
                                                                <th style="width:36%;height:0px"></th>                                                    
                                                                <th style="width:1%;height:0px"></th>
                                                                <th style="width:30%;height:0px"></th>                                                    
                                                                
                                                            </tr>
                                                            <tr>
                                                                <%-- Saldo --%>
                                                                <td class="titulocaja">
                                                                    <b><axis:alt f="axisadm050" c="LIT" lit="9001942"/></b>
                                                                </td>
                                                                  <%-- Signe mes --%>
                                                                 <td class="titulocaja">
                                                                    <b></b>
                                                                </td>  
                                                                <%-- Transferencia de saldo --%>
                                                                 <td class="titulocaja">
                                                                    <b><axis:alt f="axisadm050" c="LIT" lit="9901103"/></b>
                                                                </td>           
                                                                <%-- Signe igual --%>
                                                                 <td class="titulocaja">
                                                                    <b></b>
                                                                </td>                     
                                                                 <%-- Saldo final --%>
                                                                 <td class="titulocaja">
                                                                    <b><axis:alt f="axisadm050" c="LIT" lit="9002057"/></b>
                                                                </td>              
                                                            </tr>
                                                            <tr>
                                                                <%-- Saldo --%>
                                                                <td class="campocaja">
                                                                    <input type="text" class="campo campotexto" id="PISALDO_DESTINO" name="PISALDO_DESTINO" size="15" style="width:100%"
                                                                    value="<c:if test="${empty __formdata.PISALDO_DESTINO}"><fmt:formatNumber pattern='${__formatNumberPatterns[__defaultCMONINT]}' value='0'/></c:if><c:if test="${!empty __formdata.PISALDO_DESTINO}"><fmt:formatNumber pattern='${__formatNumberPatterns[__defaultCMONINT]}' value='${__formdata.PISALDO_DESTINO}'/></c:if>" readonly="readonly"/>    
                                                                </td>
                                                                <td>
                                                                    +&nbsp;
                                                                </td>
                                                                 <%-- Transferencia de saldo --%>
                                                                <td class="campocaja">
                                                                    <input type="text" class="campo campotexto" id="TRANSF_DESTINO" name="TRANSF_DESTINO" size="15" style="width:100%"
                                                                    value="<fmt:formatNumber pattern='${__formatNumberPatterns[__defaultCMONINT]}' value='${__formdata.TRANSF_ORIGEN}'/>" readonly="readonly"/>                                                         
                                                                </td>
                                                                <td>
                                                                  =&nbsp;
                                                                </td>            
                                                                 <%-- Saldo final --%>
                                                                <td class="campocaja">
                                                                    <input type="text" class="campo campotexto" id="PFSALDO_DESTINO" name="PFSALDO_DESTINO" size="15" style="width:100%"
                                                                    value="<fmt:formatNumber pattern='${__formatNumberPatterns[__defaultCMONINT]}' value='${__formdata.PISALDO_DESTINO + __formdata.TRANSF_ORIGEN}'/>" readonly="readonly"/>                                                        
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </fieldset>
                                                    </td>
                                                    
                                                   
                    
                                                </tr>
                                                </c:if>
                                            </table>        
                                        </td> 
                                    </tr>       
                                </table>
                            </td>
                        </tr>
                        
                    
                       
                    </table>
              
        
        <c:import url="../include/botonera_nt.jsp">
            <c:param name="f">axisadm050</c:param>
            <c:param name="__botones">salir,aceptar</c:param> 
        </c:import>
    
    </form>
    
    <c:import url="../include/mensajes.jsp"/>
</body>
</html>