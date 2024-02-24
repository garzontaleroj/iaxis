<%@ page contentType="text/html;charset=iso-8859-15" %>
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
    <title><axis:alt f="axismnt023" c="TITULO" lit="9001162"/></title> <%-- Tratamiento de recibos --%>
    <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
    <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
    <link rel="stylesheet" href="styles/displaytag.css">
    <c:import url="../include/carga_framework_js.jsp"/>
  <link rel="stylesheet" type="text/css" media="all" href="styles/calendar-green.css" title="green" />
  <script type="text/javascript" src="scripts/calendar.js"></script>
  <script type="text/javascript" src="scripts/calendar-${sessionScope.__locale}.js"></script>
  <script type="text/javascript" src="scripts/calendar-setup.js"></script>
<!--*********************************** -->

    <script type="text/javascript">
    
        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/
        
        function f_onload() { 
            f_cargar_propiedades_pantalla();
          }
          
          function f_recargar(){
                 reformatearImportes();
                 objUtiles.ejecutarFormulario ("modal_axismnt023.do", "recargar", document.miForm, "_self", objJsMessages.jslit_cargando);    
          }

       
            function f_but_cancelar() {
               parent.f_cerrar_axismnt023('f_but_cancelar');
            }
        
          function f_onclickCheckbox(thiss) {
                thiss.value =  (thiss.checked)?1:0;
            }
            
            function f_but_guardar(){
                 if (objValidador.validaEntrada()) { 
                    var CCOMPANI = $('#CCOMPANI').val();
                    var CTIPIND = $('#CTIPIND').val();
                    var NVALOR = $('#NVALOR').val();
                    var FINIVIG = $('#FINIVIG').val();
                    var CENVIOSAP = $('#CENVIOSAP').val();
                    var CAPLICA = $('#CAPLICA').val();
                    var params = "&CCOMPANI="+CCOMPANI+"&CTIPIND="+CTIPIND+"&NVALOR="+NVALOR+"&FINIVIG="+FINIVIG+"&CENVIOSAP="+CENVIOSAP+"&CAPLICA="+CAPLICA;
                    objAjax.invokeAsyncCGI("modal_axismnt023.do", callbackSalir, "operation=guardar"+ params, this, objJsMessages.jslit_cargando);
                   
                }
            }
        
            function callbackSalir(){
                parent.f_cerrar_axismnt023('f_but_guardar');
            }
          
    </script>    
</head>

<body  onload="f_onload()">
    
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
    
    <form name="miForm" action="" method="POST" >         
     <input type="hidden" id="operation" name="operation" value=""/>
     <input type="hidden" name="CCOMPANI" id="CCOMPANI" value="${__formdata.CCOMPANI}" />
        <c:import url="../include/titulo_nt.jsp">
                <c:param name="titulo"><axis:alt f="axismnt023" c="TIT_MNT023" lit="9906474"/></c:param>     <%-- Detall compta tècnica --%>
                <c:param name="form">axismnt023</c:param>
        </c:import>        
           
        <table class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td>
                  <table class="seccion">
                      <tr>
                        <td>
                        	<!-- ${__formdata} -->
                          <table class="area" align="center">
                             <tr>
                                <th style="width:33%;height:0px"></th>
                                <th style="width:33%;height:0px"></th>                            
                                <th style="width:33%;height:0px"></th>
                            </tr>
                            <tr>
                                 <axis:ocultar c="NVALOR" f="axismnt023" dejarHueco="false">
                                    <td class="titulocaja">
                                        <b><axis:alt f="axismnt023" c="NVALOR" lit="101159" /></b> 
                                    </td>
                                </axis:ocultar>
                                
                                <axis:ocultar c="CTIPIND" f="axismnt023" dejarHueco="false">
                                    <td class="titulocaja">
                                        <b><axis:alt f="axismnt023" c="CTIPIND" lit="9906486" /></b> 
                                    </td>
                                </axis:ocultar>
                                
                                 <axis:ocultar c="CAPLICA" f="axismnt023" dejarHueco="false">
                                    <td class="titulocaja">
                                        <b><axis:alt f="axismnt023" c="CAPLICA" lit="9906475" /></b> 
                                    </td>
                                </axis:ocultar>
                            </tr>
                            <tr>
                                <axis:ocultar f="axismnt023" c="NVALOR" dejarHueco="false">
                                    <td class="campocaja">
                                        <input type="text" class="campowidthinput campo campotexto" 
                                        <axis:atr f="axismnt023" c="NVALOR" a="modificable=true&obligatorio=true"/>
                                        style="width:55%;" size="15" value="${__formdata.NVALOR}" name="NVALOR" id="NVALOR"
                                        title="<axis:alt f="axismnt023" c="NVALOR" lit="101159"/>"/>
                                    </td>
                                </axis:ocultar>  
                            
                                <axis:ocultar c="CTIPIND" f="axismnt023" dejarHueco="false">
                                 <td class = "campocaja" >  
                                        <select name = "CTIPIND" id ="CTIPIND" size="1" class="campowidthselect campo"  title="<axis:alt f="axismnt023" c="CTIPIND" lit="9906486" />"
                                            <axis:atr f="axismnt023" c="CTIPIND" a="isInputText=false&obligatorio=true&modificable=true"/>>
                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axismnt023" c="SNV_COMBO" lit="9906486" /> - </option>
                                        <c:forEach items="${__formdata.listvalores.lstTiposIndicadores}" var="item">
                                            <option value = "${item.CTIPIND}" <c:if test="${__formdata.CTIPIND==item.CTIPIND}">selected</c:if> >${item.TINDICA}</option>
                                        </c:forEach>
                                    </select>
                                 </td>
                                 </axis:ocultar>
                                 
                                 <axis:ocultar c="CAPLICA" f="axismnt023" dejarHueco="false">
                                 <td class = "campocaja" >  
                                        <select name = "CAPLICA" id ="CAPLICA" size="1" class="campowidthselect campo"  title="<axis:alt f="axismnt023" c="CAPLICA" lit="9906475" />"
                                        <axis:atr f="axismnt023" c="CAPLICA" a="isInputText=false&obligatorio=true&modificable=true"/>>
                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axismnt023" c="SNV_COMBO" lit="9906475" /> - </option>
                                        <c:forEach items="${__formdata.listvalores.lstCAplicaInd}" var="item">
                                            <option value = "${item.CATRIBU}" <c:if test="${__formdata.CAPLICA==item.CATRIBU}">selected</c:if> >${item.TATRIBU}</option>
                                        </c:forEach>
                                    </select>
                                 </td>
                                 </axis:ocultar>
                            </tr>
                            
                            <tr>
                                <axis:ocultar c="FINIVIG" f="axismnt023" dejarHueco="false">
                                    <td class="titulocaja">
                                        <b><axis:alt f="axismnt023" c="FINIVIG" lit="9000572" /></b> 
                                    </td>
                                </axis:ocultar>
                                
                                <axis:ocultar c="CENVIOSAP" f="axismnt023" dejarHueco="false">
                                    <td class="titulocaja">
                                        <b><axis:alt f="axismnt023" c="CENVIOSAP" lit="9906476" /></b> 
                                    </td>
                                </axis:ocultar>
                            </tr>
                            
                            <tr>
                                <axis:visible c="FINIVIG" f="axismnt023">
                                 <td class = "campocaja" >
                                        <input type="text" style="width:50%;" class="campo campotexto" size="15" 
                                         value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FINIVIG}"/>" name="FINIVIG" id="FINIVIG"
                                         <axis:atr f="axismnt023" c="FINIVIG" a="modificable=true&obligatorio=true&formato=fecha"/>  title="<axis:alt f="axismnt023" c="FINIVIG" lit="9000572" />"/>     
                                         <a style="vertical-align:middle;"><img
                                    id="icon_FINIVIG" alt="<axis:alt f="axismnt023" c="FINIVIG" lit="9000572"/>" title="<axis:alt f="axismnt023" c="FFINVIG" lit="9000572" />" src="images/calendar.gif"/></a>
                                 </td>
                                 </axis:visible>
                                 
                                <axis:visible c="CENVIOSAP" f="axismnt023">
                                         <td class = "campocaja" >                                                          
                                              <input type="checkbox" id="CENVIOSAP" name="CENVIOSAP" onclick="f_onclickCheckbox(this)"  
                                                <c:if test="${__formdata.CENVIOSAP == 1}">checked</c:if>
                                                 value="${__formdata.CENVIOSAP}" <axis:atr f="axismnt023" c="CENVIOSAP" a="&obligatorio=true&modificable=true" /> />
                                        </td>
                                 </axis:visible>
                            </tr>
                            
                    </table>
                </td>
            </tr>
        </table>
        </tr>
    </td>
    </table>
        
        <c:import url="../include/botonera_nt.jsp"><c:param name="f">axismnt023</c:param><c:param name="f">axismnt023</c:param>
		<c:param name="__botones">cancelar<axis:visible c="BT_GUARDAR" f="axismnt023">,guardar</axis:visible></c:param> 
        </c:import>
    </form>

    <c:import url="../include/mensajes.jsp"/>

<axis:visible f="axismnt017" c="FINIVIG">
<script type="text/javascript">
        Calendar.setup({
            inputField     :    "FINIVIG",     
            ifFormat       :    "%d/%m/%Y",      
            button         :    "icon_FINIVIG", 
            singleClick    :    true,
            firstDay       :    1
        });
        
 </script>    
 
 </axis:visible>   

</body>
</html>