<%@ page contentType="text/html;charset=windows-1252" errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<html>
  <head>
    <link rel="stylesheet" href="styles/genericosHtml.css" type="text/css">
    <link rel="stylesheet" href="styles/axisnt.css" type="text/css">
    <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>
    <link type="text/css" href="styles/jquery.jscrollpane.css" rel="stylesheet" media="only screen and (min-device-width: 768px) and (max-device-width: 1024px)" />
    <link rel="stylesheet" type="text/css" media="all" href="styles/calendar-green.css" title="green" />
    <script type="text/javascript" src="scripts/calendar.js"></script>    
    <script type="text/javascript" src="scripts/calendar-${sessionScope.__locale}.js"></script>
    <script type="text/javascript" src="scripts/calendar-setup.js"></script>           
    <style type="text/css" id="page-css"> </style>
    <c:import url="../include/carga_framework_js.jsp" />
    <script language="Javascript" type="text/javascript">
        
        function f_onload() {
        	f_cargar_propiedades_pantalla();
            var guardat = "${__formdata.guardat}";
            if ((!objUtiles.estaVacio(guardat))&&(guardat=="0")){
               parent.f_aceptar_modal("axisprf107", "STARIFA_OUT="+${__formdata.STARIFA});
            }else{
                resetEntradas($("#CVALOR").val());
            }
        }  
        
        function f_but_cancelar() {
            parent.f_cerrar_modal('axisprf107');                      
        }           
        
        function f_but_aceptar(){          
          if (objValidador.validaEntrada()) {
                objUtiles.ejecutarFormulario("modal_axisprf107.do", "guardar", document.miForm, "_self", objJsMessages.jslit_cargando); 
          }
        }
        
        function resetEntradas(valor){
            if (valor<-1){
                $("#CTIPO").val(valor);
                $("#CTIPO").removeClass("campotexto_ob");
                $("#CTIPO").attr("disabled",true);
                $("#CTIPO").addClass("campodisabled");
            }else{
                $("#CTIPO").attr("disabled",false);
                $("#CTIPO").removeClass("campodisabled");
                $("#CTIPO").addClass("campotexto_ob");                
            }
            mostrarEntradas();
        }
        
        function mostrarEntradas(){
            if($("#CTIPO").val()==1){
               $("#NIMPORTE").removeAttr("readonly");
               $("#NIMPORTE").removeClass("campodisabled");
               $("#NIMPORTE").addClass("campotexto_ob");
               $("#NIMPORTE").focus();
               $("#NPORCENT").attr("readonly", false);
               $("#NPORCENT").removeClass("campotexto_ob");
               $("#NPORCENT").addClass("campodisabled");
            }else if($("#CTIPO").val()==2){
               $("#NPORCENT").removeAttr("readonly");
               $("#NIMPORTE").attr("readonly",true);
               $("#NPORCENT").removeClass("campodisabled");
               $("#NPORCENT").addClass("campotexto_ob");
               $("#NPORCENT").focus();
               $("#NIMPORTE").removeClass("campotexto_ob");
               $("#NIMPORTE").addClass("campodisabled");
            }else{
               $("#NPORCENT").removeClass("campotexto_ob");
               $("#NPORCENT").addClass("campodisabled");
               $("#NPORCENT").attr("readonly",true);
               $("#NPORCENT").val(null);
               $("#NIMPORTE").removeClass("campotexto_ob");
               $("#NIMPORTE").addClass("campodisabled");
               $("#NIMPORTE").attr("readonly",true);
               $("#NIMPORTE").val(null);
            }
        }
    </script>
    
  </head>
  <body onload="f_onload()">
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
    <form name="miForm" action="" method="POST">
        <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt f="axisprf107" c="TITULO" lit="9900736" /></c:param>
                <c:param name="nid" value="axisprf107" />
        </c:import>
        <input type="hidden" name="operation" value=""/>  
        <input type="hidden" id="pSERVICIOS" name="pSERVICIOS" value="${__formdata.SERVICIOS}"/>
        <input type="hidden" id="pSTARIFA" name="pSTARIFA" value="${__formdata.STARIFA}"/>
        <c:import url="../include/titulo_nt.jsp">
           <c:param name="formulario"><axis:alt c="formulario" f="axisprf107" lit="9900736" /></c:param>
           <c:param name="producto"><axis:alt c="formulario" f="axisprf107" lit="9900736" /></c:param>
           <c:param name="form">axisprf107</c:param>
        </c:import>             
        <div class="separador">&nbsp;</div>        
        <!-- Area de campos  -->
        <table class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0" style="height:10px;">
            <tr>
                <th style="width:34%;height:0px"></th>
                <th style="width:33%;height:0px"></th>
                <th style="width:33%;height:0px"></th>                                
            </tr>        
            <tr>
                <axis:visible f="axisprf107" c="CVALOR"> 
                    <td class="titulocaja">
                       <b><axis:alt f="axisprf107" c="CVALOR" lit="101159"/></b>
                    </td>
                </axis:visible>
            </tr>        
            <tr>
                <axis:ocultar f="axisprf107" c="CVALOR" dejarHueco="false"> 
                    <td class="campocaja">
                        <select name="CVALOR" id="CVALOR" size="1" class="campowidthselect campo campotexto_ob"
                                <axis:atr f="axisprf107" c="CVALOR" a="obligatorio=true"/> 
                                title="<axis:alt f="axisprf107" c="CVALOR" lit="101159"/>" onchange="resetEntradas(this.value)">
                            <option value="<%= Integer.MIN_VALUE %>">
                              <axis:alt f="axisprf107" c="SELECCIONAR" lit="108341"/>                                
                            </option>
                            <c:forEach var="valores" items="${__formdata.VALORES}">
                                <option value="${valores.CATRIBU}" <c:if test="${ valores.CATRIBU == __formdata.CVALOR }"> selected </c:if> >
                                    ${valores.TATRIBU}
                                </option>
                            </c:forEach>
                        </select>
                    </td>
                </axis:ocultar>   
            </tr>        
            <tr>
                <axis:visible f="axisprf107" c="CTIPO">                 
                    <td class="titulocaja">
                        <b><axis:alt f="axisprf107" c="CTIPO" lit="100565"/></b>
                    </td> 
                </axis:visible>
            </tr> 
            <tr>
                <axis:ocultar f="axisprf107" c="CTIPO" dejarHueco="false"> 
                    <td class="campocaja">
                        <select name="CTIPO" id="CTIPO" size="1" class="campowidthselect campo"
                                title="<axis:alt f="axisprf107" c="CTIPO" lit="9901195"/>" onchange="mostrarEntradas()">
                            <option value="<%= Integer.MIN_VALUE %>">
                              <axis:alt f="axisprf107" c="SELECCIONAR" lit="108341"/>                                
                            </option>
                            <c:forEach var="tipo" items="${__formdata.TIPO}">
                                <option value="${tipo.CATRIBU}" <c:if test="${ tipo.CATRIBU == __formdata.CTIPO }"> selected </c:if> >
                                    ${tipo.TATRIBU}
                                </option>
                            </c:forEach>
                        </select>
                    </td>
                </axis:ocultar>
            </tr>
            <tr>
                <axis:visible f="axisprf107" c="NIMPORTE"> 
                    <td class="titulocaja" id="tit_NIMPORTE">
                       <b><axis:alt f="axisprf107" c="NIMPORTE" lit="100563"/></b>
                    </td>
                </axis:visible>
                <axis:visible f="axisprf107" c="NPORCENT"> 
                    <td class="titulocaja" id="tit_NPORCENT">
                       <b><axis:alt f="axisprf107" c="NPORCENT" lit="9903530"/></b>
                    </td>
                </axis:visible>
            </tr>
            <tr>
                <axis:ocultar f="axisprf107" c="NIMPORTE" dejarHueco="false">
                    <td>
                        <input type="text" class="campo campotexto" value=""  name="NIMPORTE" id="NIMPORTE" size="15"
                               style="width:75%;" readonly="true" 
                               onblur="if(!objUtiles.estaVacio(this.value)) if(!objValidador.esCampoNumerico(this.value, true, -1,'<axis:alt f="axisprf107" c="NIMPORTE" lit="100563"/>')){this.value='';this.focus()}else{var num=parseFloat(objNumero.cambiarSeparadorDecimalesPorMiles(objNumero.stripNonNumeric(this.value)));this.value=num.toFixed(2).replace(objNumero.getSeparadorMiles(),objNumero.getSeparadorDecimales())}"/>
                    </td>
                </axis:ocultar>
                <axis:ocultar f="axisprf107" c="NPORCENT" dejarHueco="false">
                    <td>
                        <input type="text" class="campo campotexto" value=""  name="NPORCENT" id="NPORCENT" size="15"
                               style="width:75%;" readonly="true"
                               onblur="if(!objUtiles.estaVacio(this.value)) if(!objValidador.esCampoNumerico(this.value, true, -1,'<axis:alt f="axisprf107" c="NPORCENT" lit="9903530"/>')){this.value='';this.focus()}else{var num=parseFloat(objNumero.cambiarSeparadorDecimalesPorMiles(objNumero.stripNonNumeric(this.value)));this.value=num.toFixed(2).replace(objNumero.getSeparadorMiles(),objNumero.getSeparadorDecimales())}"/>
                    </td>
                </axis:ocultar>              
            </tr>
        </table>	
        <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisprf107</c:param><c:param name="f">axisprf107</c:param>
            <c:param name="__botones">cancelar,aceptar</c:param>
        </c:import>
    </form>
        
    <c:import url="../include/mensajes.jsp" />
   </body>
</html>
