<%/* Revision:# zwtccuQ0b0SKEINDP7lebg== # */%>
<%/**
*  Fichero: axisctr081.jsp
*  @author <a href = "mailto:xpastor@csi-ti.com">Xavier Pastor</a>
*  
*  Detalle cuenta técnica
*
*
*  Fecha: 09/07/2009
*/
%>

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
    <title><axis:alt f="axisctr081" c="TRATAMIENTOS" lit="9001162"/></title> <%-- Tratamiento de recibos --%>
    <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
    <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
    <link rel="stylesheet" href="styles/displaytag.css">
    <c:import url="../include/carga_framework_js.jsp"/>
   
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

    <script type="text/javascript">
    
        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/
        
        function f_onload() {
            f_cargar_propiedades_pantalla();
            reformatearImportes();
            ok = "${__formdata.OK}";
             if (!objUtiles.estaVacio(ok) ){
                parent.f_aceptar_axisctr081();
             }
            
          }
          
   
          
          function f_recargar(){
               //  f_validaImport();
                 reformatearImportes();
                 objUtiles.ejecutarFormulario ("modal_axisctr081.do", "recargar", document.miForm, "_self", objJsMessages.jslit_cargando);    

          }
          function f_validaImport(){
          if (!objUtiles.estaVacio(document.miForm.IIMPORT.value) ){
         
                if (!objValidador.esCampoNumerico(document.miForm.IIMPORT.value, true,  <%= Integer.MIN_VALUE %>, "<axis:alt f="axisctr081" c="IMPORTE" lit="100563"/>") ){
                    document.miForm.IIMPORT.focus();
                    return 1;
                }else{  
                    document.miForm.IIMPORT.value = objValidador.valorFormateadoCampoNumerico(objDom.getValorComponente(document.miForm.IIMPORT) , true, true);
                }    
            }
            return 0;
        }

        function f_but_cancelar() {
          //  f_validaImport();
            reformatearImportes();
            objAjax.invokeAsyncCGI("modal_axisctr081.do", callbackSalir, "operation=salir", this);
        }
        
        function callbackSalir() {
           parent.f_cerrar_axisctr081();
        }
        
        function f_but_aceptar(){
          
         if (objValidador.validaEntrada()) {
              //   f_validaImport();
                reformatearImportes();
                 objUtiles.ejecutarFormulario ("modal_axisctr081.do", "guardar", document.miForm, "_self", objJsMessages.jslit_cargando);    
         }
        }
        function f_but_guardar(){
         
             if (objValidador.validaEntrada()) {
               var error =  f_validaImport();
                  if (error == 0){
                 objUtiles.ejecutarFormulario ("modal_axisctr081.do", "guardar", document.miForm, "_self", objJsMessages.jslit_cargando);    
                 }
            }
        }
        function f_abrir_axisadm002(){
        objUtiles.abrirModal("axisadm002","src","axis_axisadm002.do?operation=init&isModal=1");
        }
    
        function f_abrir_sinistres(){
        objUtiles.abrirModal("axissin002","src","modal_axissin002.do?operation=form");
        }
        
        function f_seleccionarRecibo(NRECIBO){
            objUtiles.cerrarModal("axisadm002");
            document.miForm.NRECIBO.value = NRECIBO;
        }
        
        function f_aceptar_axissin002(NSINIES,SSEGURO){
            objUtiles.cerrarModal("axissin002");
            document.miForm.NSINIES.value = NSINIES;
        }
        
        function f_cerrar_axisadm002(){
            objUtiles.cerrarModal("axisadm002");
        }
        
        function f_cerrar_axissin002(){
            objUtiles.cerrarModal("axissin002");
        }
        
        function f_cerrar_axisctr019(){
            objUtiles.cerrarModal("axisctr019");
        }
        
        function f_aceptar_axisctr019(SSEGURO){
            objUtiles.cerrarModal("axisctr019");
            document.miForm.SSEGURO.value = SSEGURO;
            f_recargar();
        }
        
        function f_abrir_axisctr019(){
            objUtiles.abrirModal("axisctr019","src","modal_axisctr019.do?operation=form");
        }
        
        function f_actSSEGURO(){
           document.miForm.SSEGURO.value = '';
        }
        
                  /**
        * Método que valida y formatea un campo numérico con el patrón ##.##,##. Si no se valida correctamente, devuelve un ''.
        * @param {Object} valor a validar
        * @param {Boolean} isDecimal: true->es decimal, false->no es decimal
        * @param {Boolean} tienePuntoMiles: true->formatea puntos a los miles, false->no lo hace
        * @return {String} Valor obtenido de la validación y formateo
        */
        function valorFormateadoCampoNumerico (entrada, isDecimal, tienePuntoMiles){
            if (objNumero.validaNumero(entrada, isDecimal)){
                // Validación correcta, formatear valor 
                entrada = objNumero.formateaNumero(entrada, isDecimal);  
                if(!tienePuntoMiles) entrada = objNumero.quitarSeparadorMiles(entrada);
                
            }else{
                return '';
            }
            
            return entrada;
        }
               
        function reformatearImportes(){
             objDom.setValorPorId("IIMPORT",valorFormateadoCampoNumerico(objDom.getValorPorId("IIMPORT"),true,true));
        }      
    </script>    
</head>

<body  onload="f_onload()">
    
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
    
    <form name="miForm" action="" method="POST">         
    
        <input type="hidden" name="operation" value=""/>
        <input type="hidden" name="PMODO"  id="PMODO"   value="${__formdata.PMODO}"/>
        <input type="hidden" name="CMANUAL"  id="CMANUAL"   value="${__formdata.CMANUAL}"/>
        <input type="hidden" name="CEMPRES"   value="${__formdata.CEMPRES}"/>
        <input type="hidden" name="SSEGURO"   value="${__formdata.SSEGURO}"/>

        <c:import url="../include/titulo_nt.jsp">
                <c:param name="titulo"><axis:alt f="axisctr081" c="DETALLCOMPTA" lit="9001947"/></c:param>     <%-- Detall compta tècnica --%>
                <c:param name="form">axisctr081</c:param>
        </c:import>        
        <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt f="axisctr081" c="DETALLCOMPTA" lit="9001947" /></c:param>
                <c:param name="nid" value="axisadm002" />
         </c:import>
        <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt f="axisctr081" c="DETALLCOMPTA" lit="9001947" /></c:param>
                <c:param name="nid" value="axissin002" />
         </c:import>
         <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt f="axisctr081" c="DETALLCOMPTA" lit="9001947" /></c:param>
                <c:param name="nid" value="axisctr019" />
         </c:import>
           
           
        <table class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td>
                  <table class="seccion">
                      <tr>
                        <td>
                          <table class="area" align="center">
                             <tr>
                                <th style="width:20%;height:0px"></th>
                                <th style="width:20%;height:0px"></th>
                                <th style="width:20%;height:0px"></th>
                                <th style="width:20%;height:0px"></th>
                                <th style="width:20%;height:0px"></th>

                            </tr>
                            <tr>
                                        <td class = "campocaja" colspan="5" >
                                            <div class="separador">&nbsp;</div>     
                                            <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axisctr081" c="DETALLCOMPTA" lit="9001947"/>
                                        </td>
                                     </tr>
                            <tr>
                            <axis:ocultar c="CAGENTE" f="axisctr081" dejarHueco="false">
                                <td class="titulocaja">
                                    <b><axis:alt f="axisctr081" c="CAGENTE" lit="100584" /></b>
                                </td>
                             </axis:ocultar>
                             <axis:ocultar c="TNOMBRE" f="axisctr081" dejarHueco="false">
                                <td class="titulocaja">
                                    <b><axis:alt f="axisctr081" c="TNOMBRE" lit="105940" /></b>
                                </td>
                            </axis:ocultar>
                            </tr>
                            <tr>
                                <axis:ocultar c="CAGENTE" f="axisctr081" dejarHueco="false">
                                 <td class = "campocaja" >
                                        <input type="text"  class="campo campotexto" style="width:50%;" size="15" value="${__formdata.CAGENTE}" name="CAGENTE" id="CAGENTE"
                                         <axis:atr f="axisctr081" c="CAGENTE" a="modificable=false"/> />
                                 </td>                            
                                 </axis:ocultar>
                                 <axis:ocultar c="TNOMBRE" f="axisctr081" dejarHueco="false">
                                 <td class = "campocaja" colspan="2">
                                        <input type="text" class="campo campotexto" style="width:80%;" size="15" value="${__formdata.TNOMBRE}" name="TNOMBRE" id="TNOMBRE"
                                         <axis:atr f="axisctr081" c="TNOMBRE" a="modificable=false"/> />
                                 </td>
                                 </axis:ocultar>
                            </tr>
                            <tr>
                            <axis:ocultar c="NNUMLIN" f="axisctr081" dejarHueco="false">
                                <td class="titulocaja">
                                    <b><axis:alt f="axisctr081" c="NNUMLIN" lit="9001727" /></b>
                                </td>
                                </axis:ocultar>
                                <axis:ocultar c="TESTADO" f="axisctr081" dejarHueco="false">
                                <td class="titulocaja">
                                    <b><axis:alt f="axisctr081" c="TESTADO" lit="100587" /></b>
                                </td>
                                </axis:ocultar>
                                 <axis:ocultar c="TIPOLIN" f="axisctr081" dejarHueco="false">
                                <td class="titulocaja">
                                    <b><axis:alt f="axisctr081" c="TIPOLIN" lit="9000573" /></b>
                                </td>
                                </axis:ocultar>
                                <axis:ocultar c="FFECMOV" f="axisctr081" dejarHueco="false">
                                <td class="titulocaja">
                                    <b><axis:alt f="axisctr081" c="FFECMOV" lit="100562" /></b>
                                </td>
                                </axis:ocultar>
                                <axis:ocultar c="FVALOR" f="axisctr081" dejarHueco="false">
                                <td class="titulocaja">
                                    <b><axis:alt f="axisctr081" c="FVALOR" lit="1000590" /></b>
                                </td>
                                </axis:ocultar>
                            </tr>
                            <tr>
                                <axis:ocultar c="NNUMLIN" f="axisctr081" dejarHueco="false">
                                 <td class = "campocaja" >
                                        <input type="text" style="width:50%;" class="campo campotexto" size="15" value="${__formdata.NNUMLIN}" name="NNUMLIN" id="NNUMLIN"
                                         <axis:atr f="axisctr081" c="NNUMLIN" a="modificable=false"/> />
                                 </td>                            
                                 </axis:ocultar>
                                 <axis:ocultar c="TESTADO" f="axisctr081" dejarHueco="false">
                                 <td class = "campocaja" >
                                        <input type="text" class="campo campotexto" size="15" value="${__formdata.TESTADO}" name="TESTADO" id="TESTADO"
                                         <axis:atr f="axisctr081" c="TESTADO" a="modificable=false"/> />
                                 </td>
                                 </axis:ocultar>
                                  <axis:ocultar c="TIPOLIN" f="axisctr081" dejarHueco="false">
                                 <td class = "campocaja" >
                                        <input type="text" style="width:50%;" class="campo campotexto" size="15" value="${__formdata.TIPOLIN}" name="TIPOLIN" id="TIPOLIN"
                                         <axis:atr f="axisctr081" c="TIPOLIN" a="modificable=false"/> />
                                 </td>
                                 </axis:ocultar>
                                  <axis:ocultar c="FFECMOV" f="axisctr081" dejarHueco="false">
                                 <td class = "campocaja" >
                                  <jsp:useBean id="today" class="java.util.Date" /> 
                                        <input type="text" style="width:50%;" class="campo campotexto" size="15" 
                                        value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FFECMOV}"/><c:if test="${empty __formdata.FFECMOV}"><fmt:formatDate pattern="dd/MM/yyyy" value="${today}"/></c:if>" name="FFECMOV" id="FFECMOV"
                                         <axis:atr f="axisctr081" c="FFECMOV" a="modificable=false"/> />
                                 </td>
                                 </axis:ocultar>
                                 <axis:visible c="FVALOR" f="axisctr081">
                                 <td class = "campocaja" >
                                        <input type="text" style="width:70%;" class="campo campotexto" size="15" 
                                        value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FVALOR}"/><c:if test="${empty __formdata.FVALOR}"><fmt:formatDate pattern="dd/MM/yyyy" value="${today}"/></c:if>" name="FVALOR" id="FVALOR"
                                         <axis:atr f="axisctr081" c="FVALOR" a="formato=fecha"/> />
                                         <c:if test="${empty __configform.axisctr081__FVALOR__modificable || __configform.axisctr081__FVALOR__modificable != false}">
                                         <a id="icon_FVALOR" style="vertical-align:middle;"><img 
                                             alt="<axis:alt f="axisctr081" c="SELECCIONE" lit="108341"/>" title="<axis:alt f="axisctr081" c="FVALOR" lit="1000590" />" src="images/calendar.gif"/></a>
                                        </c:if>
                                 </td>
                                 </axis:visible>
                            </tr>   
                            
                            <tr>
                            <axis:ocultar c="NPOLIZA" f="axisctr081" dejarHueco="false">
                                <td class="titulocaja">
                                    <b><axis:alt f="axisctr081" c="NPOLIZA" lit="9001875" /></b>
                                    
                                </td>
                            </axis:ocultar>                            
                            <axis:ocultar c="NRECIBO" f="axisctr081" dejarHueco="false">
                                <td class="titulocaja">
                                    <b><axis:alt f="axisctr081" c="NRECIBO" lit="100895" /></b>
                                    
                                </td>
                            </axis:ocultar>
                            <axis:ocultar c="NSINIES" f="axisctr081" dejarHueco="false">
                                <td class="titulocaja">
                                    <b><axis:alt f="axisctr081" c="NSINIES" lit="101298" /></b>
                                </td>
                            </axis:ocultar>
                            </tr>
                            <tr>
                                <axis:ocultar c="NPOLIZA" f="axisctr081" dejarHueco="false">
                                 <td class = "campocaja" >
                                        <input type="text" style="width:40%;" class="campo campotexto" onchange="f_actSSEGURO()" size="15" value="${__formdata.NPOLIZA}" name="NPOLIZA" id="NPOLIZA"
                                         <axis:atr f="axisctr081" c="NPOLIZA" a="modificable=false"/> />
                                       &nbsp; 
                                       <axis:ocultar c="NCERTIF" f="axisctr081" dejarHueco="false">
                                       <input type="text" style="width:8%;" onchange="f_actSSEGURO()" class="campo campotexto" size="15" value="${__formdata.NCERTIF}" name="NCERTIF" id="NCERTIF"
                                         <axis:atr f="axisctr081" c="NCERTIF" a="modificable=false"/> /> 
                                        </axis:ocultar>
                                         <axis:visible c="BT_NPOLIZA" f="axisctr081">
                                             <img id="find" border="0" src="images/find.gif" onclick="f_abrir_axisctr019()" style="cursor:pointer"/> 
                                         </axis:visible>
                                 </td>                            
                                 </axis:ocultar>                            
                                <axis:ocultar c="NRECIBO" f="axisctr081" dejarHueco="false">
                                 <td class = "campocaja" >
                                        <input type="text" style="width:50%;" class="campo campotexto" size="15" value="${__formdata.NRECIBO}" name="NRECIBO" id="NRECIBO"
                                         <axis:atr f="axisctr081" c="NRECIBO" a="modificable=false"/> />
                                         <axis:visible c="BT_NRECIBO" f="axisctr081">
                                             <img id="find" border="0" src="images/find.gif" onclick="f_abrir_axisadm002()" style="cursor:pointer"/> 
                                         </axis:visible>
                                 </td>                            
                                 </axis:ocultar>
                                 <axis:ocultar c="NSINIES" f="axisctr081" dejarHueco="false">
                                 <td class = "campocaja" >
                                        <input type="text" style="width:50%;" class="campo campotexto" size="15" value="${__formdata.NSINIES}" name="NSINIES" id="NSINIES"
                                         <axis:atr f="axisctr081" c="NSINIES" a="modificable=false"/> />
                                         <axis:visible c="BT_NSINIES" f="axisctr081">
                                             <img id="find" border="0" src="images/find.gif" onclick="f_abrir_sinistres()" style="cursor:pointer"/> 
                                         </axis:visible>
                                 </td>
                                 </axis:ocultar>
                            </tr>
                             <tr>
                             <axis:ocultar c="TDESCRIP" f="axisctr081" dejarHueco="false">
                                <td class="titulocaja">
                                    <b><axis:alt f="axisctr081" c="TDESCRIP" lit="100588" /></b>
                                </td>
                            </axis:ocultar>
                            <axis:ocultar c="NDOCUME" f="axisctr081" dejarHueco="false">
                                <td class="titulocaja">
                                    <b><axis:alt f="axisctr081" c="NDOCUME" lit="105330" /></b>
                                </td>
                            </axis:ocultar>
                            </tr>
                            <tr>
                                <axis:ocultar c="TDESCRIP" f="axisctr081" dejarHueco="false">
                                 <td class = "campocaja" >
                                        <input type="text" class="campo campotexto" size="15" value="${__formdata.TDESCRIP}" name="TDESCRIP" id="TDESCRIP"
                                         <axis:atr f="axisctr081" c="TDESCRIP" a="modificable=true"/> />
                                 </td>                            
                                 </axis:ocultar>
                                 <axis:ocultar c="NDOCUME" f="axisctr081" dejarHueco="false">
                                 <td class = "campocaja" >
                                        <input type="text" class="campo campotexto" size="15" value="${__formdata.NDOCUME}" name="NDOCUME" id="NDOCUME"
                                         <axis:atr f="axisctr081" c="NDOCUME" a="modificable=true"/> />
                                 </td>
                                 </axis:ocultar>
                            </tr>
                            <tr>
                            <axis:ocultar c="CCONCEPTO" f="axisctr081" dejarHueco="false">
                                <td class="titulocaja" id="tit_CCONCEPTO">
                                    <b><axis:alt f="axisctr081" c="CCONCEPTO" lit="9000715" /></b>
                                </td>
                            </axis:ocultar>
                            <axis:ocultar c="TCONCEPTO" f="axisctr081" dejarHueco="false">
                                <td class="titulocaja" id="tit_TCONCEPTO" >
                                    <b><axis:alt f="axisctr081" c="CCONCEPTO" lit="9000715" /></b>
                                </td>
                           </axis:ocultar>
                              <axis:ocultar c="CDEBHAB" f="axisctr081" dejarHueco="false">
                                <td class="titulocaja">
                                    <b><axis:alt f="axisctr081" c="TDEBHAB" lit="9001948" /></b>
                                </td>
                            </axis:ocultar>
                              <axis:ocultar c="TDEBHAB" f="axisctr081" dejarHueco="false">
                                <td class="titulocaja">
                                    <b><axis:alt f="axisctr081" c="TDEBHAB" lit="9001948" /></b>
                                </td>
                                </axis:ocultar>
                                   <axis:ocultar c="IMPORTE" f="axisctr081" dejarHueco="false">
                                <td class="titulocaja">
                                    <b><axis:alt f="axisctr081" c="IMPORTE" lit="100563" /></b>
                                </td>
                                </axis:ocultar>
                                <axis:ocultar c="CFISCAL" f="axisctr081" dejarHueco="false">
                                    <td class="titulocaja">
                                        <b><axis:alt f="axisctr081" c="CFISCAL" lit="9901169" /></b>
                                    </td>
                                </axis:ocultar>
                            </tr>
                            <tr>
                            <axis:ocultar c="CCONCEPTO" f="axisctr081" dejarHueco="false">
                             <td class="campocaja" style="width:30%;" id="td_CCONCEPTO">
                                    <select name = "CCONCEPTO"  id ="CCONCEPTO" size="1" class="campowidthselect campo" onchange="f_recargar()" 
                                    <axis:atr f="axisctr081" c="CCONCEPTO" a="isInputText=false&obligatorio=true"/> >
                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisctr081" c="SELECCIONE" lit="108341" /> - </option>
                                        <c:forEach items="${__formdata.listvalores.lstconcep}" var="item">
                                            <option value = "${item.CCONCTA}" <c:if test="${__formdata['CCONCEPTO']==item.CCONCTA}">selected</c:if> >${item.TCCONCTA}</option>
                                        </c:forEach>
                                    </select>
                                </td>
                                </axis:ocultar>
                                <axis:ocultar c="TCONCEPTO" f="axisctr081" dejarHueco="false">
                                     <td class="campocaja" id="td_TCONCEPTO">
                                         <input type="text" class="campo campotexto" size="15" value="${__formdata.TCONCEPTO}" name="TCONCEPTO" id="TCONCEPTO"
                                          <axis:atr f="axisctr081" c="TCONCEPTO" a="modificable=true"/> />
                                    </td>
                                </axis:ocultar>
                                
                                <axis:ocultar c="CDEBHAB" f="axisctr081" dejarHueco="false">
                                <td class="campocaja">
                                    <select name = "CDEBHAB" id ="CDEBHAB" size="1" class="campowidthselect campo" 
                                    <axis:atr f="axisctr081" c="CDEBHAB" a="isInputText=false&obligatorio=true"/> >
                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisctr081" c="SELECCIONE" lit="108341" /> - </option>
                                        <c:forEach items="${__formdata.listvalores.lsttipocta}" var="item">
                                            <option value = "${item.CATRIBU}" <c:if test="${__formdata['CDEBHAB']==item.CATRIBU}">selected</c:if> >${item.TATRIBU}</option>
                                        </c:forEach>
                                    </select>
                                </td>
                                </axis:ocultar>
                                <axis:ocultar c="TDEBHAB" f="axisctr081" dejarHueco="false">
                                <td class="campocaja">
                                          <input type="text" class="campo campotexto" size="15" value="${__formdata.TDEBHAB}" name="TDEBHAB" id="TDEBHAB"
                                          <axis:atr f="axisctr081" c="TDEBHAB" a="modificable=true"/> />                                    
                                </td>
                                </axis:ocultar>
                                 <axis:ocultar c="IIMPORT" f="axisctr081" dejarHueco="false">
                                 <td class = "campocaja" >
                                        <input type="text" style="width:50%;" class="campo campotexto" size="15" value="<fmt:formatNumber pattern='${__formatNumberPatterns[__defaultCMONINT]}' value='${__formdata.IIMPORT}'/>" name="IIMPORT" id="IIMPORT"
                                         title="IIMPORT" <axis:atr f="axisctr081" c="IIMPORT" a="modificable=true&obligatorio=true"/> />
                                 </td>
                                 </axis:ocultar>
                                 
                                 <axis:ocultar c="CFISCAL" f="axisctr081" dejarHueco="false">
                                    <td class="campocaja">
                                        <select name = "CFISCAL" id ="CFISCAL" size="1" class="campowidthselect campo"  
                                        <axis:atr f="axisctr081" c="CFISCAL" a="isInputText=false&obligatorio=true"/> >
                                            <c:forEach items="${__formdata.listvalores.lstcfiscal}" var="item">
                                                <option value = "${item.CATRIBU}" <c:if test="${__formdata['CFISCAL']==item.CATRIBU}">selected</c:if> >${item.TATRIBU}</option>
                                            </c:forEach>
                                        </select>
                                    </td>
                                 </axis:ocultar>
                            </tr>
                            
                    </table>
                </td>
            </tr>
        </table>
        </tr>
    </td>
    </table>
        
        <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisctr081</c:param>
		<c:param name="__botones">cancelar<axis:visible c="BT_GUARDAR" f="axisctr081">,guardar</axis:visible></c:param> 
        </c:import>
<script type="text/javascript">
    Calendar.setup({
        inputField     :    "FVALOR",     
        ifFormat       :    "%d/%m/%Y",      
        button         :    "icon_FVALOR", 
        singleClick    :    true,
        firstDay       :    1
    });
    </script>
    </form>

    <c:import url="../include/mensajes.jsp"/>

</body>
</html>