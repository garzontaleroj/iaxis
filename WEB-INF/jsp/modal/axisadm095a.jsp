<%
/*
*  Fichero: axisadm095a.jsp
*  @author <a href = "mailto:mnustes@csi-ti.com">Marlon Nustes</a> 
*  Fecha: 29/04/2015
*/
%>

<%@ page contentType="text/html;charset=windows-1252" errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
    <head>
        <link rel="stylesheet" href="styles/genericosHtml.css" type="text/css">
        <link rel="stylesheet" href="styles/axisnt.css" type="text/css">
        <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>
        <%-- Especial para controlar los scroll con iPad --%>
        <link type="text/css" href="styles/jquery.jscrollpane.css" rel="stylesheet" media="only screen and (min-device-width: 768px) and (max-device-width: 1024px)" />
        <style type="text/css" id="page-css"> </style>
        <%-- Especial para controlar los scroll con iPad --%>
        <c:import url="../include/carga_framework_js.jsp" />   
        
        <script language="Javascript" type="text/javascript">
        
        function f_onload() {       
            f_cargar_propiedades_pantalla();
        }
        
        function val_number(valor){
            try{
                valor = objValidador.valorFormateadoCampoNumerico(valor, true, true);
                if(objNumero.validaNumero(valor, true)) {
                    document.miForm.NREEMBO.value = valor;                        
                }else{
                    document.miForm.NREEMBO.value = '';
                    document.miForm.NREEMBO.focus();
                }               
            }catch(e){
                alert (e.name + " " + e.message);
            }
        }
        
        function f_but_aceptar() {
            if (objValidador.validaEntrada()) {
                
               var query=  "CEMPRES="+$("#HCEMPRES").val()+
                           "&SPERSON="+$("#HSPERSON").val()+
                           "&SSEGURO="+$("#HSSEGURO").val()+
                           "&NNUMLIN="+$("#HNNUMLIN").val()+
                           "&SPRODUC="+$("#HSPRODUC").val()+
                           "&NREEMBO="+$("#NREEMBO").val();
                objAjax.invokeAsyncCGI("modal_axisadm095a.do", callbackAjaxUpdReembo, "operation=ajax_guardar&" + query, this, objJsMessages.jslit_cargando);            
            }
        }
        
        function callbackAjaxUpdReembo (ajaxResponseText){    
            var doc = objAjax.domParse(ajaxResponseText);
            if(!objAppMensajes.existenErroresEnAplicacion(doc)){         
                var ban = objDom.getValorNodoDelComponente(doc.getElementsByTagName("GUARDADO"), 0, 0);
                if(ban==0){
                    parent.f_post_cierre_modalaxisadm095a();
                }
            }
         } 
        
        function f_but_cancelar() {
            parent.f_cerrar_modal("axisadm095a");
        } 
        </script>
        
        
    </head>
    <body onload="f_onload()">

            <c:import url="../include/precargador_ajax.jsp">
                <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
            </c:import>            
                      
            <form name="miForm" action="" method="POST">
                
                <input type="hidden" id="HCEMPRES" name="HCEMPRES" value="${__formdata.CEMPRES}"/>
                <input type="hidden" id="HSPERSON" name="HSPERSON" value="${__formdata.SPERSON}"/>
                <input type="hidden" id="HSSEGURO" name="HSSEGURO" value="${__formdata.SSEGURO}"/>
                <input type="hidden" id="HNNUMLIN" name="HNNUMLIN" value="${__formdata.NNUMLIN}"/>
                <input type="hidden" id="HSPRODUC" name="HSPRODUC" value="${__formdata.SPRODUC}"/>
                <!-- Area de Titulo  -->
                <c:import url="../include/titulo_nt.jsp">
                    <c:param name="formulario"><axis:alt f="axisadm095a" c="FORM" lit="9908009" /></c:param>
                    <c:param name="producto"><axis:alt f="axisadm095a" c="FORM" lit="9908009" /></c:param>
                    <c:param name="form">axisadm095a</c:param>
                </c:import>
                
                <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0" style="height:10px;">
                    <tr>
                    <td>
                        <div class="separador">&nbsp;</div>
                        <div class="titulo">
                            <img src="images/flecha.gif"/>
                            <b><axis:alt f="axisadm095" c="LIT32" lit="9900732"/></b>
                        </div>
                    </td>
                    </tr>
                    
                    <tr>
                        <th style="width:25%;height:0px"></th>
                        <th style="width:25%;height:0px"></th>
                        <th style="width:25%;height:0px"></th>                                
                        <th style="width:25%;height:0px"></th>
                    </tr> 
                    
                    <tr>
                        <axis:ocultar f="axisadm095a" c="NPOLIZA" dejarHueco="false"> 
                            <td class="titulocaja" colspan = "2" >
                                <b><axis:alt f="axisadm095" c="NPOLIZA" lit="101273"/></b>
                            </td>                                            
                        </axis:ocultar>
                    </tr>
                                    
                    <tr>
                        <axis:visible f="axisadm095a" c="NPOLIZA">
                            <td class="campocaja">
                                <input type="text" class="campo campotexto" value="${__formdata.NPOLIZA}" name="NPOLIZA" id="NPOLIZA" size="10" readonly="true"/>
                            </td>
                        </axis:visible>                                              
                        
                    </tr>
                                    
                    <tr>
                        <axis:ocultar f="axisadm095a" c="NREEMBO" dejarHueco="false"> 
                            <td class="titulocaja" colspan = "2">
                                <b><axis:alt f="axisadm095" c="NREEMBO" lit="9908004"/></b>
                            </td>                                            
                        </axis:ocultar>
                    </tr>
                    
                    <tr>
                        <axis:visible f="axisadm095a" c="NREEMBO">
                            <td class="campocaja">
                                <input type="text" class="campo campotexto" value="${__formdata.NREEMBO}" name="NREEMBO" id="NREEMBO" size="10" onchange="val_number(this.value)" 
                                <axis:atr f="axisadm095a" c="NREEMBO" a="decimal=true&obligatorio=true"/> />
                            </td>
                        </axis:visible>                                              
                        
                    </tr>
                    
                </table>
                
                <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisadm095</c:param>
                    <c:param name="__botones"><axis:visible f="axisadm095" c="BT_CANCELAR">cancelar</axis:visible><axis:visible f="axiscaj007" c="BT_ACEPTAR">,aceptar</axis:visible></c:param>
                </c:import>
            </form>            
            
            <c:import url="../include/mensajes.jsp" />
        
    </body>
    
    <c:if test="${ (fn:containsIgnoreCase(header['User-Agent'],'ipad') )   }">
      <script language="Javascript" type="text/javascript">  
        retocarPAGE_CSS('axisadm095');
      </script>                   
    </c:if>
    
</html>