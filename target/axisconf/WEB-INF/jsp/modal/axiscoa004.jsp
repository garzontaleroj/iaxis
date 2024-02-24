<%/*
*  Fichero: axiscoa004.jsp
*
*  @author <a href="mailto:amartinez@csi-ti.com">Alex Martinez</a>
*  Fecha: 28/08/2012
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
    <script type="text/javascript">
    
        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/
        
        function f_but_cancelar() {
           objUtiles.ejecutarFormulario ("modal_axiscoa004.do", "cancelar", document.miForm, "_self"); 
           parent.f_cerrar_axiscoa004();                      
        }
        
       
        function f_but_aceptar(){
            //parent.f_aceptar_axiscoa004();
            objUtiles.ejecutarFormulario ("modal_axiscoa004.do", "guardarcuadro", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
        
        function f_onload() {
            f_cargar_propiedades_pantalla();
            
            var ok = "${__formdata.OK}";  
            
            if (!objUtiles.estaVacio(ok)){
                if(ok == 0){
                    parent.f_aceptar_axiscoa004();
                }
            }
        }
        
        function f_new_cia(){
            var ccompani = document.miForm.SCIACOA.value;
            var tcompani = document.miForm.SCIACOA[document.miForm.SCIACOA.selectedIndex].text;
            var params = "?CCOMPANIA="+ccompani+"&TCOMPANIA="+tcompani;
            
            //Cuando el parametro CP_GASTOS esté visible, si ya hay una compañia de coaseguro copiaremos PCOMGAS (% Gastos) a las nuevas compañías añadidas
            <axis:visible c="CP_GASTOS" f="axiscoa004">
            if($("[id^='PCOMGAS_']").length > 0){
                var firstPCOMGAS = $("[id^='PCOMGAS_']").get(0).value;
                params = params +"&firstPCOMGAS="+firstPCOMGAS;
            }
            </axis:visible>            
            
            objUtiles.ejecutarFormulario ("modal_axiscoa004.do"+params, "buscar_cia", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
        
        function f_insertval(CCOMPANI,CAMPO,VALOR){
       
          if(CAMPO == 'PCESCOA'){           
                var VALORformateado=objNumero.formateaNumero(VALOR, true);
                var numericoVALOR=hacerNumerico(VALORformateado);
                if(0 < numericoVALOR && numericoVALOR < 100){
                    objAjax.invokeAsyncCGI("modal_axiscoa004.do", callbackAjaxInsertVal, "operation=ajax_insertval&CCOMPANIA="+CCOMPANI+"&CAMPO="+CAMPO+"&VALOR="+VALORformateado, this);
                }else{
                    alert("<axis:alt f="axiscoa004" c="LIT_1000390" lit="1000390"/>");
                }            
          }
          else
            objAjax.invokeAsyncCGI("modal_axiscoa004.do", callbackAjaxInsertVal, "operation=ajax_insertval&CCOMPANIA="+CCOMPANI+"&CAMPO="+CAMPO+"&VALOR="+VALOR, this);
        }
        
        function callbackAjaxInsertVal(ajaxResponseText){
            var doc=objAjax.domParse(ajaxResponseText);
            var elementos = doc.getElementsByTagName("element");
        }
        
        function f_borrar_cia(CCOMPANI){
            objUtiles.ejecutarFormulario ("modal_axiscoa004.do?CCOMPANIA="+CCOMPANI, "borrar_cia", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
        
        function hacerNumerico(miDato) {
           var miDatoStripped=objNumero.stripNonNumeric(miDato);
           if (miDatoStripped.indexOf(objNumero.getSeparadorDecimales())>=0) { //separador decimal ha sido una ",", hay q cambiarlo a un punto
               miDatoStripped=objNumero.cambiarSeparadorDecimalesPorMiles(miDatoStripped);
           }
           return (eval(miDatoStripped));
         }   
    </script>
  </head>
  
  <body onload="f_onload()" >
    <c:import url="../include/precargador_ajax.jsp"><c:param name="imagen" value="images/ajax-loader.gif"></c:param></c:import>
    
    <form name="miForm" action="modal_axiscoa004.do" method="POST">         
        <c:import url="../include/titulo_nt.jsp">
            <c:param name="titulo"><axis:alt f="axiscoa004" c="TITULO" lit="9904170"/></c:param>
            <c:param name="formulario"><axis:alt f="axiscoa004" c="TITULO" lit="9904170"/></c:param>
            <c:param name="form">axiscoa004</c:param>
        </c:import>
        
        <input type="hidden" id="operation" name="operation" value=""/>  
        <input type="hidden" id="CTIPCOA" name="CTIPCOA" value="${__formdata.CTIPCOA}"/>  
        <input type="hidden" id="PLOCCOA1" name="PLOCCOA1" value="${__formdata.PLOCCOA1}"/>
        <input type="hidden" id="BORRADO" name="BORRADO" value="${__formdata.BORRADO}"/>
       
        <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="3">            
            <tr>
                <td>
                    <div class="separador">&nbsp;</div>
                    <table class="seccion">
                        <tr>
                            <th style="width:2%;height:0%;"/>
                            <th style="width:30%;height:0%;"/>
                            <th style="width:20%;height:0%;"/>
                            <th style="width:25%;height:0%;"/>
                            <th style="width:20%;height:0%;"/>
                            <th style="width:3%;height:0%;"/>
                        </tr>
                        <tr> 
                            <td></td>
                            <axis:visible f="axisctr004" c="CCOBBAN">     
                                <td class="titulocaja" colspan="2">
                                    <b><axis:alt f="axiscoa004" c="LIT_9000600" lit="9000600" /></b>
                                </td>
                            </axis:visible> 
                        </tr>
                        <tr>
                            <td></td>
                            <axis:ocultar f="axisctr004" c="SCIACOA" dejarHueco="false">
                                    <td class="campocaja">
                                       <select name = "SCIACOA" id ="SCIACOA" size="1" 
                                            class="campowidthselect campo campotexto" title="<axis:alt f="axiscoa004" c="LIT_9000600" lit="9000600" />" alt="<axis:alt f="axiscoa004" c="LIT_9000600" lit="9000600" />" <axis:atr f="axisctr004" c="SCIACOA" a="obligatorio=true&isInputText=false"/>>&nbsp;
                                            <option value="<%=Integer.MIN_VALUE%>"> - <axis:alt f="axiscoa004" c="SELEC" lit="1000348"/> - </option>
                                            <c:forEach items="${__formdata.companias}" var="cia">
                                                <option value = "${cia.CCOMPANI}" <c:if test="${cia.CCOMPANI  == __fomdata.SCIACOA}">selected</c:if>>${cia.TCOMPANI}</option>
                                            </c:forEach>
                                        </select>
                                    </td>
                            </axis:ocultar>
                            <axis:ocultar f="axisctr004" c="BT_NEWCIA" dejarHueco="false">
                                <td>
                                    <div align="left">
                                        <input type="button" class="boton" id="BT_NEWCIA" name ="BT_NEWCIA"   value="<axis:alt f="axiscoa004" c="LIT_104825" lit="104825" />" onclick="f_new_cia()" />                      
                                    </div>
                                </td>
                            </axis:ocultar>
                        </tr>
                        <tr>
                            <td></td>
                            <td colspan=4>
                                  <div class="separador">&nbsp;</div>
                                    <!-- DisplayTag P&oacute;lizas -->
                                    <c:set var="title1"><b><axis:alt f="axiscoa004" c="label_TCOMPANI" lit="9000600"/></b> </c:set>
                                    <c:set var="title2"><b><axis:alt f="axiscoa004" c="label_PCESCOA" lit="104818"/></b> </c:set>
                                    <c:set var="title3"><b><axis:alt f="axiscoa004" c="label_PCOMCON" lit="9001923"/></b> </c:set>
                                    <c:set var="title4"><b><axis:alt f="axiscoa004" c="label_PCOMGAS" lit="9902215"/> </c:set>
                                    <c:set var="title5"><b><axis:alt f="axiscoa004" c="label_PCOMCOA" lit="9904150"/> </c:set>
                                    
                                    <div class="seccion displayspaceGrande">
                                        <display:table name="${sessionScope.LSTCOMPANIAS}"  id="miListaId" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending"  sort="list" cellpadding="0" cellspacing="0">
                                            <%@ include file="../include/displaytag.jsp"%>
                                            <axis:visible f="axiscoa004" c="TCOMPAN">    
                                                <display:column title="${title1}" sortable="false" sortProperty="TCOMPANI" headerClass="headwidth5 sortable"  media="html" autolink="false" style="width:38%" >    
                                                   <div class="dspText">${miListaId.OB_IAX_COACEDIDO.TCOMPAN}</div>
                                                </display:column>
                                            </axis:visible> 
											<!--INI-CES-IAXIS-3581 16/04/2019-->
                                            <axis:visible f="axiscoa004" c="PCESCOA">    
                                                <display:column title="${title2}" sortable="false" sortProperty="PCESCOA" headerClass="headwidth5 sortable"  media="html" autolink="false" style="width:15%" >    
                                                   <div class="dspText"><input class="campo" type="text" name="PCESCOA_${miListaId.OB_IAX_COACEDIDO.CCOMPANI}" onblur="if(!objUtiles.estaVacio(this.value)) if(!objValidador.esCampoNumerico((this.value).replace('.',','), true, -1,'<axis:alt f="axisctr004" c="PLOCCOA" lit="9904141"/>')){this.value='';this.focus()}else{var num=parseFloat(objNumero.cambiarSeparadorDecimalesPorMiles(objNumero.stripNonNumeric((this.value).replace('.', ',')))); if(num>99){alert('<axis:alt f="axisctr004" c="PLOCCOA" lit="89906154"/>');this.value='';this.focus()}else{this.value=num.toFixed(4).replace(objNumero.getSeparadorMiles(),objNumero.getSeparadorDecimales())}}" value="<fmt:formatNumber value="${miListaId.OB_IAX_COACEDIDO.PCESCOA}" pattern="###,####0.0000"/>" onchange="f_insertval('${miListaId.OB_IAX_COACEDIDO.CCOMPAN}','PCESCOA',this.value.replace('.', ','))"/></div>
                                                </display:column>
                                            </axis:visible> 
											<!--END-CES-IAXIS-3581 16/04/2019-->
                                            <axis:visible f="axiscoa004" c="PCOMCON">    
                                                <display:column title="${title3}" sortable="false" sortProperty="PCOMCON" headerClass="headwidth5 sortable"  media="html" autolink="false" style="width:15%" >    
                                                   <div class="dspText"><input class="campo" type="text" name="PCOMCON_${miListaId.OB_IAX_COACEDIDO.CCOMPANI}" value="<fmt:formatNumber value="${miListaId.OB_IAX_COACEDIDO.PCOMCON}" pattern="###,##0.00"/>" onchange="f_insertval('${miListaId.OB_IAX_COACEDIDO.CCOMPAN}','PCOMCON',this.value)" /></div>
                                                </display:column>
                                            </axis:visible> 
                                            <axis:visible f="axiscoa004" c="PCOMGAS">    
                                                <display:column title="${title4}" sortable="false" sortProperty="PCOMGAS" headerClass="headwidth5 sortable"  media="html" autolink="false" style="width:15%" >    
                                                   <div class="dspText"><input class="campo" type="text" id="PCOMGAS_${miListaId.OB_IAX_COACEDIDO.CCOMPANI}" name="PCOMGAS_${miListaId.OB_IAX_COACEDIDO.CCOMPANI}" value="<fmt:formatNumber value="${miListaId.OB_IAX_COACEDIDO.PCOMGAS}" pattern="###,##0.00"/>" onchange="f_insertval('${miListaId.OB_IAX_COACEDIDO.CCOMPAN}','PCOMGAS',this.value)" /></div>
                                                </display:column>
                                            </axis:visible>
                                            <axis:visible f="axiscoa004" c="PCOMCOA"> 
                                                <display:column title="${title5}" sortable="false" sortProperty="PCOMCOA" headerClass="headwidth5 sortable"  media="html" autolink="false" style="width:15%" >    
                                                   <div class="dspText"><input class="campo" type="text" name="PCOMCOA_${miListaId.OB_IAX_COACEDIDO.CCOMPANI}" value="<fmt:formatNumber value="${miListaId.OB_IAX_COACEDIDO.PCOMCOA}" pattern="###,##0.00"/>" onchange="f_insertval('${miListaId.OB_IAX_COACEDIDO.CCOMPAN}','PCOMCOA',this.value)" /></div>
                                                </display:column>
                                            </axis:visible> 
                                              
                                            <axis:ocultar f="axiscoa004" c="DELCIA" dejarHueco="false">
                                            <display:column title="" style="width:2%" headerClass="headwidth5 sortable"  media="html" autolink="false" >
                                                <div class="dspIcons">
                                                    <img border="0" style="cursor:pointer;" onclick="f_borrar_cia('${miListaId.OB_IAX_COACEDIDO.CCOMPAN}')"  alt="<axis:alt f="axisage003" c="DELETE" lit="1000127" />" title="<axis:alt f="axisage003" c="DELETE" lit="1000127" />" src="images/delete.gif"/>
                                                </div>
                                            </display:column>
                                            </axis:ocultar>
                                        </display:table>
                                    </div>
                                    <div class="separador">&nbsp;</div>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        
        <c:import url="../include/botonera_nt.jsp">
            <c:param name="__botones">cancelar,aceptar</c:param>
            <c:param name="f">axiscoa004</c:param>
        </c:import>
        
    </form>
    <c:import url="../include/mensajes.jsp" />
    
    

</body>
</html>