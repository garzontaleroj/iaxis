<%/* Revision:# gTQO8+htqqBG82ysetkMhQ== # */%>
<%/*
*  Fichero: axiscob001b.jsp
*  @author <a href = "mailto:jpacheco@csi-ti.com">Juan Carlos PAcheco</a> 
*     

*/
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=windows-1252" errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page import="java.util.List" %>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>
 

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252"/>
        
        <link rel="stylesheet" href="styles/genericosHtml.css" type="text/css">
        <link rel="stylesheet" href="styles/axisnt.css" type="text/css">
        <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>
        <%-- Especial per controlar els scroll amb iPad --%>
        <link type="text/css" href="styles/jquery.jscrollpane.css" rel="stylesheet" media="only screen and (min-device-width: 768px) and (max-device-width: 1024px)" />
        <style type="text/css" id="page-css"> </style>
        <%-- FI Especial per controlar els scroll amb iPad --%>
        <c:import url="../include/carga_framework_js.jsp" />
        
        <script language="Javascript" type="text/javascript">
        function f_onload(){        
            
            var f_aceptar = "${__formdata.f_aceptar_true}";
            if (!objUtiles.estaVacio(f_aceptar))
                if (f_aceptar == "OK")
                    parent.f_aceptar_axiscob001b();
            try{
               document.miForm.ACCOUNT.focus();
            } catch (e) {	
                try{
                    document.miForm.NOMBRECOMP.focus();
                }catch(e){ }
            }
            f_cargar_propiedades_pantalla();
        }
        
        function f_but_cancelar() {
            parent.f_but_cerrar_axiscob001b();
        }    
                
        function quitarPuntosDeMil (valor) {
            return objUtiles.replaceAll(valor, ".", "");
        }

        function f_but_9908118(){
               
           var SPERSON=objDom.getValorPorId("SPERSON");
           var SSEGURO=objDom.getValorPorId("SSEGURO");
           var vSSEGURO=objDom.getValorPorId("NPOLIZA");
           var vSSEGURO_D=objDom.getValorPorId("NPOLIZA_D");
           var vAccount = objDom.getValorPorId("ACCOUNT");
           
           
               if(vSSEGURO != vSSEGURO_D){
               
                   if (objValidador.validaEntrada()) {
                       if(objUtiles.estaVacio(SPERSON) || objUtiles.estaVacio(SSEGURO)){
                          alert("<axis:alt f='axiscob001' c='ADVERTENCIA' lit='9907925'/>");                 
                       }
                       else if(vAccount==7 && (objUtiles.estaVacio(vSSEGURO_D)||vSSEGURO_D == '')){
                       
                          alert("<axis:alt f='axiscob001' c='ADVERTENCIA' lit='9908874'/>"); 
                           
                       }
                       else{
                          objUtiles.ejecutarFormulario("modal_axiscob001b.do", "insertar_break", document.miForm, "_self", objJsMessages.jslit_cargando);
                        }
                   }
               
               }else{
                   
                   alert("<axis:alt f='axiscob001' c='ADVERTENCIA' lit='9908854'/>");  
                   
               }
           
           
        }
        
        function f_cerrar_axisctr019(){
	   objUtiles.cerrarModal("axisctr019");
	}

	function f_aceptar_axisctr019(SSEGURO,NPOLIZA,NCERTIF){
	   objDom.setValorPorId("SSEGURO_D", SSEGURO);
           objDom.setValorPorId("NPOLIZA_D", NPOLIZA);
           f_cerrar_axisctr019();
		
	}
        
        function f_buscar_poliza(){
             objUtiles.abrirModal("axisctr019","src","modal_axisctr019.do?operation=form");
        }
		
        function formatNumber(valor){
            document.miForm.PAMOUNT.value = objValidador.valorFormateadoCampoNumerico(valor, true, true); 
        }
        
        function f_carga_lista(valor){
            var vAcount = objDom.getValorPorId("ACCOUNT");
            
            if(vAcount != 7){
            
            document.getElementById("imagen").style.visibility = 'hidden';
            objDom.setValorPorId("NPOLIZA_D",'');
            
            }else{
                document.getElementById("imagen").style.visibility = 'visible';
                
                
            }
            
            objAjax.invokeAsyncCGI("modal_axiscob001b.do?VLISTA= "+valor, callbackCargarLista, "operation=cargaLista", this, objJsMessages.jslit_cargando);
        }
        
        function callbackCargarLista(ajaxResponseText) {
            
            var motivosCombo = document.miForm.RFREIMBURSING;
            try {
                var doc=objAjax.domParse(ajaxResponseText);               
                                                        
                if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                        if(objUtiles.existeObjetoXml(doc.getElementsByTagName("element")[0])){
                            objDom.borrarOpcionesDeCombo(motivosCombo);
                            objDom.addOpcionACombo("", " - " + objJsMessages.jslit_seleccionar + " - ", motivosCombo, 0);
                            
                            for(var i = 0;i < doc.getElementsByTagName("element").length;i++){
                                    var CATRIBU = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("element")[i].getElementsByTagName("CATRIBU")[0])) ? doc.getElementsByTagName("element")[i].getElementsByTagName("CATRIBU")[0].childNodes[0].nodeValue : "");
                                    var TATRIBU = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("element")[i].getElementsByTagName("TATRIBU")[0])) ? doc.getElementsByTagName("element")[i].getElementsByTagName("TATRIBU")[0].childNodes[0].nodeValue : "");
                                    objDom.addOpcionACombo(CATRIBU, TATRIBU, motivosCombo, i + 1);
                            }
                            
                        }else{
                            objDom.borrarOpcionesDeCombo (motivosCombo);
                            objDom.addOpcionACombo("", " - " + objJsMessages.jslit_seleccionar + " - ", motivosCombo, null);
                        }
                }
            } catch (e) {
               objDom.addOpcionACombo("", " - " + objJsMessages.jslit_seleccionar + " - ", motivosCombo, null);
            }
	}
        </script> 
    </head>
   <body onload="f_onload();" onkeypress="if (event.keyCode==13)  { f_but_9908118() }">
   <div id="wrapper" class="wrapper">
        <c:import url="../include/modal_estandar.jsp">
        <c:param name="nid_y_titulo">
          axisctr019
          <axis:alt f="axiscob001b" c="TIT_007" lit="9001558"/>
        </c:param>
        </c:import>
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
        <form name="miForm" action="" method="POST">
            <input type="hidden" name="operation" value=""/>
            <input type="hidden" name="SPERSON" id="SPERSON" value="${__formdata.SPERSON}" />
            <input type="hidden" name="SNIP" id="SNIP" value="${__formdata.SNIP}" />
            <input type="hidden" name="CAGENTE" id="CAGENTE" value="${__formdata.CAGENTE}" />
            <input type="hidden" name="SSEGURO" id="SSEGURO" value="${__formdata.SSEGURO}" />
            <input type="hidden" name="MODO_SWPUBLI" id="MODO_SWPUBLI" value="${__formdata.MODO_SWPUBLI}" />
            <input type="hidden" name="MODO_BUSQUEDA" id="MODO_BUSQUEDA" value="${__formdata.MODO_BUSQUEDA}" />
            <input type="hidden" name="SEQCAJA" id="SEQCAJA"  value="${__formdata.SEQCAJA}" />
            <input type="hidden" style="width:200px" class="campo campotexto"   value="${__formdata.SSEGURO_D}" name="SSEGURO_D" id="SSEGURO_D" size="15"/>
            
            <c:import url="../include/titulo_nt.jsp">            
                <c:param name="titulo">
                <axis:alt f="axiscob001" c="TITULO" lit="9907904"/>
                </c:param>
                <c:param name="formulario">
                <axis:alt f="axiscob001" c="FORM" lit="9907904"/>
                </c:param>
                <c:param name="form">axiscob001b</c:param>            
            </c:import>            
            
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo">
                <axis:alt f="axisctr019" c="TITULO" lit="9001558"/>
                </c:param>
                <c:param name="nid" value="axisctr019"/>
            </c:import> 
            
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo">
                <axis:alt f="axiscob001b" c="TITULO" lit="9907904"/>
                </c:param>
                <c:param name="nid" value="axiscob001b"/>
            </c:import>
            
            <table class="area" align="center"> 
                <tr>
                    <th style="width:15%;height:0px"></th>
                    <th style="width:15%;height:0px"></th>                
                </tr>
                
                <tr>
                    <axis:visible f="axiscob001b" c="ACCOUNT">
                        <td class="titulocaja" colspan="2">
                            <b><axis:alt f="axiscob001b" c="ACCOUNT" lit="9000533" /></b>
                        </td>
                    
                        <td class="campocaja" colspan="2">
                            <select name="ACCOUNT" id="ACCOUNT" style="width:200px" size="1" class="campowidthselect campo campotexto"
                            onchange="f_carga_lista(this.value);"
                            <axis:atr f="axiscob001b" c="ACCOUNT" a="obligatorio=true"/> title="<axis:alt f="axiscob001b" c="ACCOUNT" lit="9000533"/>">
                                <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axiscob001b" c="SNV_COMBO" lit="1000348"/> - </option>
                                <c:forEach var="element" items="${__formdata.listValores.montoMSV}">
                                    <option value = "${element.CATRIBU}">
                                        ${element.TATRIBU}
                                    </option>
                                </c:forEach>
                            </select>
                        </td>
                    </axis:visible>
                </tr>
                                          
                <tr>
                    <axis:visible f="axiscob001b" c="RFREIMBURSING">
                        <td class="titulocaja" colspan="2">
                            <b><axis:alt f="axiscob001b" c="RFREIMBURSING" lit="9907903" /></b>
                        </td>
                        
                        <td class="campocaja" colspan = "2" >
                            <select name="RFREIMBURSING" id="RFREIMBURSING" style="width:200px" size="1" class="campowidthselect campo campotexto"
                            <axis:atr f="axiscob001b" c="RFREIMBURSING" a="obligatorio=true"/> title="<axis:alt f="axiscob001b" c="RFREIMBURSING" lit="9907903"/>">
                                <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axiscob001b" c="SNV_COMBO" lit="1000348"/> - </option>
                                <c:forEach var="element" items="${__formdata.listValores.reembolsoMSV}">
                                    <option value = "${element.CATRIBU}">
                                        ${element.TATRIBU} 
                                    </option>
                                </c:forEach>
                            </select>
                        </td>
                    </axis:visible>
                </tr>
                                        
                <tr>
                    <axis:visible f="axiscob001b" c="PAMOUNT">
                        <td class="titulocaja" colspan="2">
                            <b><axis:alt f="axiscob001b" c="PAMOUNT" lit="9908123" /></b>
                        </td>
                        
                        <td class="campocaja" colspan="2">
                            <input type="text" style="width:200px" class="campo campotexto" value="<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${__formdata.PAMOUNT}"/>" 
                            <axis:atr f="axiscob001b" c="PAMOUNT" a="obligatorio=true"/> title="<axis:alt f="axiscob001b" c="PAMOUNT" lit="9908123"/>"
                            onchange="formatNumber(this.value);" name="PAMOUNT" id="PAMOUNT" size="15"/>                        
                        </td>
                    </axis:visible>          
                </tr>
                                 
                <tr>
                    <axis:visible f="axiscob001b" c="POLICY">
                        <td class="titulocaja" colspan="2">
                            <b><axis:alt f="axiscob001b"  c="POLICY" lit="102829" /></b>
                        </td>
                        
                        <td class="campocaja" colspan="2">
                            <input type="hidden" style="width:200px" class="campo campotexto" disabled="true" value="${__formdata.SSEGURO}" name="SSEGURO" id="SSEGURO" size="15"/>
                            <input type="text" style="width:200px" class="campowidthinput campo campotexto" <axis:atr f="axiscob001b" c="NPOLIZA" a="modificable=false"/> value="${__formdata.NPOLIZA}" name="NPOLIZA" id="NPOLIZA" size="15"/>
                        </td>
                    </axis:visible> 
                </tr>
                
                <tr>
                    <axis:visible f="axiscob001b" c="TPOLICY">
                        <td class="titulocaja" colspan="2">
                            <b><axis:alt f="axiscob001b" c="TPOLICY" lit="9907924" /></b>
                        </td>
                        
                        <td class="campocaja" colspan="2">                        
                            <input type="text" style="width:200px" class="campowidthinput campo campotexto" <axis:atr f="axiscob001b" c="NPOLIZA_D" a="modificable=false"/>  value="${__formdata.NPOLIZA_D}" name="NPOLIZA_D" id="NPOLIZA_D" size="15"/>
                            &nbsp;<img border="0" src="images/find.gif" id='imagen' onclick="f_buscar_poliza();" style="cursor:pointer" alt='<axis:alt f="axiscob001" c="BUSQ" lit="9000508"/>' title='<axis:alt f="axiscob001" c="BUSQ" lit="9000508"/>'/>
                        </td>
                    </axis:visible> 
                </tr>
                                        
                <tr>
                    <axis:visible f="axiscob001b" c="HOLDER">
                        <td class="titulocaja" colspan="2">
                            <b><axis:alt f="axiscob001b" c="HOLDER" lit="9907907" /></b>
                        </td>                        
                        <td class="campocaja" colspan="2">
                            <input type="text" style="width:200px" class="campowidthinput campo campotexto" <axis:atr f="axiscob001b" c="NOMBRE" a="modificable=false"/> value="${__formdata.NOMBRE}" name="NOMBRE" id="NOMBRE" size="15"/>
                        </td>
                    </axis:visible> 
                </tr>
                                        
                <tr>
                    <axis:visible f="axiscob001b" c="TRANS_SPL">
                        <td class="titulocaja" colspan="2">
                            <b><axis:alt f="axiscob001b" c="TRANS_SPL" lit="9907902" /></b>
                        </td>                        
                        <td class="campocaja" colspan="2">
                            <input type="text" style="width:200px" class="campowidthinput campo campotexto" <axis:atr f="axiscob001b" c="TRANS_SPL" a="modificable=false"/> value="${__formdata.TRANS_SPL}" name="TRANS_SPL" id="TRANS_SPL" size="15"/>
                        </td>
                    </axis:visible>          
                </tr>  
                                                  
            </table>
            
            <c:import url="../include/botonera_nt.jsp"><c:param name="f">axiscob001b</c:param><c:param name="f">axiscob001b</c:param>
                <c:param name="f">axiscob001b</c:param>
                <c:param name="__botones">cancelar,9908118</c:param>
            </c:import>
            
        </form>        
        <c:import url="../include/mensajes.jsp" />
        
    </div>
   </body>
</html>
