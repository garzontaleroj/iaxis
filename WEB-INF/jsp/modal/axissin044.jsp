<%/*
*  Fichero: axisadm001.jsp
*
*  @author <a href="mailto:rkirchner@csi-ti.com">Roger Kirchner</a>
*  Fecha: 04/07/2008
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
    <script type="text/javascript">
    
        function f_but_cancelar() {
           parent.f_cerrar_axissin044();                      
        }
        
        function f_but_aceptar(){
            if (objValidador.validaEntrada()){
            //alert(objDom.getValorPorId("FREFINI"));
                objAjax.invokeAsyncCGI("modal_axissin044.do", f_callbackajaxAceptar, 
                        "operation=ajax_aceptar&CTIPREF=" + objDom.getValorPorId("CTIPREF")
                        +"&TREFEXT=" + objDom.getValorPorId("TREFEXT")+"&FREFINI=" + 
                        objDom.getValorPorId("FREFINI") +"&FREFFIN=" + objDom.getValorPorId("FREFFIN") +
                        "&NSINIES=" + objDom.getValorPorId("NSINIES")+ "&SREFEXT="+ objDom.getValorPorId("SREFEXT"), this, objJsMessages.jslit_cargando);
            }
        }
        function f_onload() {
            f_cargar_propiedades_pantalla();
         
            /* ****************************************** tratar valor especial fini *************************************** */
            var fecha_ini = "${__configform.axissin044__FREFINI__valordefecto}";
            //var fecha_ini="12345678";          
             
            if(fecha_ini!=null&&(fecha_ini.length>0||fecha_ini.length==8)){
                var inid= fecha_ini.substr(0,2);
                var inim= fecha_ini.substr(2,2);
                var inia= fecha_ini.substr(4,7);
                var total = inid+"/"+inim+"/"+inia;
               
                document.miForm.FREFINI.value = total;
            }
            
           /* ************************************************************************************************************* */
            
            
            
            
            
        } 
        
        function f_callbackajaxAceptar(ajaxResponseText){
            //alert(ajaxResponseText);
            var TTIPREF = "";
            var doc=objAjax.domParse(ajaxResponseText);
            if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                srefext = objDom.getValorNodoDelComponente(doc.getElementsByTagName("RETURN"), 0, 0);
                try{
                    TTIPREF = document.getElementById('CTIPREF_'+objDom.getValorPorId("CTIPREF")).getAttribute("text");
                }catch(e){}
                parent.f_aceptar_axissin044(objDom.getValorPorId("CTIPREF"),objDom.getValorPorId("TREFEXT"),objDom.getValorPorId("FREFINI"),objDom.getValorPorId("FREFFIN"),srefext,TTIPREF);
            }
        }
        
    </script>
  </head>
  
  <body onload="f_onload()" >
    <c:import url="../include/precargador_ajax.jsp"><c:param name="imagen" value="images/ajax-loader.gif"></c:param></c:import>
    
    <form name="miForm" action="modal_axissin044.do" method="POST">         
        <c:import url="../include/titulo_nt.jsp">
            <c:param name="titulo"><axis:alt f="axissin044" c="TITULO" lit="9902468"/></c:param>
            <c:param name="formulario"><axis:alt f="axissin044" c="TITULO" lit="9902468"/></c:param>
            <c:param name="form">axissin044</c:param>
        </c:import>
        
        <input type="hidden" id="operation" name="operation" value=""/>
        <input type="hidden" id="NSINIES" name="NSINIES" value="${__formdata.NSINIES}"/>
        <input type="hidden" id="SREFEXT" name="SREFEXT" value="${__formdata.SREFEXT}"/>
        
        <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="3">            
            <tr>
                <td>
                    <div class="separador">&nbsp;</div>
                    <table class="seccion">
                        <tr>
                            <th style="width:25%;height:0%;"/>
                            <th style="width:25%;height:0%;"/>
                            <th style="width:25%;height:0%;"/>
                            <th style="width:25%;height:0%;"/>
                        </tr>
                        <tr>
                        <axis:ocultar f="axissin044" c="CTIPREF" dejarHueco="false">
                            <td class="titulocaja">
                                <b><axis:alt f="axissin044" c="CTIPREF" lit="9902449"/></b>
                            </td>
                        </axis:ocultar>
                        <axis:ocultar f="axissin044" c="TREFEXT" dejarHueco="false">
                            <td class="titulocaja">
                                <b><axis:alt f="axissin044" c="TREFEXT" lit="1000109"/></b>
                            </td>
                        </axis:ocultar>
                        <axis:ocultar f="axissin044" c="FREFINI" dejarHueco="false">
                            <td class="titulocaja">
                                <b><axis:alt f="axissin044" c="FREFINI" lit="9000526"/></b>
                            </td>
                        </axis:ocultar>
                        <axis:ocultar f="axissin044" c="FREFFIN" dejarHueco="false">
                            <td class="titulocaja">
                                <b><axis:alt f="axissin044" c="FREFFIN" lit="9000527"/></b>
                            </td>
                        </axis:ocultar>
                        </tr>
                        <tr>
                           <axis:ocultar f="axissin044" c="CTIPREF" dejarHueco="false">
                            <td class="campocaja" >                                
                                <select name="CTIPREF" id="CTIPREF" onchange="" <axis:atr f="axissin044" c="CTIPREF" a="obligatorio=false&isInputText=false"/>  size="1" class="campowidthselect campo campotexto" style="width:94%;">&nbsp;
                                    <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axissin044" c="BLANCO" lit="1000348"/> - </option>
                                    <c:forEach var="element" items="${__formdata.tipos}">
                                        <option id="CTIPREF_${element.CATRIBU}"  text="${element.TATRIBU}"  value = "${element.CATRIBU}"
                                        <c:if test="${__formdata.CTIPREF == element.CATRIBU}"> selected = "selected"</c:if> />
                                            ${element.TATRIBU} 
                                        </option>
                                    </c:forEach>
                                </select>
                            </td>
                            </axis:ocultar>
                            <axis:ocultar f="axissin044" c="TREFEXT" dejarHueco="false">
                             <td class="campocaja" >                             
                                <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.TREFEXT}" name="TREFEXT" id="TREFEXT" 
                                style="width:70%;" title="<axis:alt f="axissin044" c="TREFEXT" lit="1000109"/>"
                                <axis:atr f="axissin044" c="TREFEXT" a="obligatorio=true"/> />
                            </td>
                            </axis:ocultar>
                                
                            <axis:ocultar f="axissin044" c="FREFINI" dejarHueco="false">
                            <td class="campocaja"> 
                                 <input style="width:40%;" type="text" class="campowidthinput campo campotexto" id="FREFINI" name="FREFINI" size="15"  title="<axis:alt f='axissin032' c='FREFINI' lit='9000526' />" 
                                                        value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata['FREFINI']}"/>" <axis:atr f="axissin032" c="FREFINI" a="modificable=true&obligatorio=true&formato=fecha"/> 
                                                        onchange=""/>
                                                        <a style="vertical-align:middle;"><img id="icon_FREFINI" alt="<axis:alt f="axissin032" c="icon_FREFINI" lit="9000526"/>" title="<axis:alt f="axissin032" c="icon_FREFINI" lit="9000526" />" src="images/calendar.gif"/></a>
                            </td>
                            </axis:ocultar>
                            <axis:ocultar f="axissin044" c="FREFFIN" dejarHueco="false">
                            <td class="campocaja"> 
                                 <input style="width:40%;" type="text" class="campowidthinput campo campotexto" id="FREFFIN" name="FREFFIN" size="15"  title="<axis:alt f='axissin032' c='FREFFIN' lit='9000527' />" 
                                                        value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata['FREFFIN']}"/>" <axis:atr f="axissin032" c="FREFFIN" a="modificable=true&obligatorio=false&formato=fecha"/> 
                                                        onchange=""/>
                                                        <a style="vertical-align:middle;"><img id="icon_FREFFIN" alt="<axis:alt f="axissin032" c="icon_FREFFIN" lit="9000527"/>" title="<axis:alt f="axissin032" c="icon_FREFFIN" lit="9000527" />" src="images/calendar.gif"/></a>
                            </td>
                            </axis:ocultar>

                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        
      
        
        <c:import url="../include/botonera_nt.jsp">
            <c:param name="__botones">cancelar<axis:visible f="axissin044" c="BT_ACEPTAR">,aceptar</axis:visible></c:param>
            <c:param name="f">axissin044</c:param>
        </c:import>
        
    </form>
    <c:import url="../include/mensajes.jsp" />
    
    <script type="text/javascript">
        Calendar.setup({
            inputField     :    "FREFFIN",     
            ifFormat       :    "%d/%m/%Y",      
            button         :    "icon_FREFFIN", 
            singleClick    :    true,
            firstDay       :    1
        });
        
        Calendar.setup({
            inputField     :    "FREFINI",    
            ifFormat       :    "%d/%m/%Y",     
            button         :    "icon_FREFINI",  
            singleClick    :    true,
            firstDay       :    1
        });
    </script>

</body>
</html>