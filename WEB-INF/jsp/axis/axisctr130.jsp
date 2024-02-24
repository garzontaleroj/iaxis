<%@ page contentType="text/html;charset=windows-1252" errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ page import="axis.mvc.model.*" %><% //ecg20131002 %>
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
        <title><axis:alt f="axisctr130" c="LIT_BUSC_SIMUL" lit="1000200"/></title>
        <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
        <link rel="stylesheet" href="styles/displaytag.css">
        <c:import url="../include/carga_framework_js.jsp" />
        <!--********** CALENDARIO ************************* -->
          <!-- Hoja de estilo del Calendario -->
          <link rel="stylesheet" type="text/css" media="all" href="styles/calendar-green.css" title="green" />
          <!-- Script principal del calendario -->
          <script type="text/javascript" src="scripts/calendar.js"></script>
          <!-- Idioma del calendario, en función del Locale -->
          <script type="text/javascript" src="scripts/calendar-${sessionScope.__locale}.js"></script>
          <!-- Setup del calendario -->
          <script type="text/javascript" src="scripts/calendar-setup.js"></script>
        <script type="text/javascript">
            

            function f_onload() {
                f_cargar_propiedades_pantalla();    	
            }      
            
            function f_but_buscar(){
                alert("buscar");
            }
            
             function f_but_salir() {
                objUtiles.ejecutarFormulario ("main.do", "trabajo", document.miForm, "_self");
            } 
            
            function f_but_aceptar() {     
            
                if(objValidador.validaEntrada()){
                    var accion = document.miForm.GENERAR.value;
                    var modo = document.miForm.REAL.value;
                    
                    if(objUtiles.estaVacio(accion)){
                    	alert('<axis:alt f="axisctr130" c="CCOMPANI" lit="9910938"/>');
                    }else if(objUtiles.estaVacio(modo)){
                    	alert('<axis:alt f="axisctr130" c="CCOMPANI" lit="9910939"/>');
                    }else{
                    
	                    if(accion == 1)
	                    {
	                        objUtiles.ejecutarFormulario ("axis_axisctr130.do", "calcular", document.miForm, "_self", objJsMessages.jslit_cargando);
	                    }else{
	                        var url="axis_axisctr130.do?operation=descargar&CAGENTE="+document.miForm.CAGENTE_TEXT.value+"&FHASTA="+document.miForm.FHASTA.value+"&FDESDE="+document.miForm.FDESDE.value+"&SUCURSAL="+document.miForm.SUCURSAL.value
	                                +"&REPORTE="+document.miForm.REPORTE.value+"&NITAGEINI="+document.miForm.NITAGEINI.value+"&NITAGEFIN="+document.miForm.NITAGEFIN.value+"&REAL="+document.miForm.REAL.value
	                                +"&CODIGOSUCINI="+document.miForm.CODIGOSUCINI.value+"&CODIGOSUCFIN="+document.miForm.CODIGOSUCFIN.value;
	                        objAjax.invokeAsyncCGI_JSON(url, callbackAceptar, "<axis:alt f='axissin071' c='MSG_CARGAR' lit='9905686'/>")
	                    } 
                    	
                    }
                }
            } 
            
            function callbackAceptar (p) {
           
            objEventos.showHideLoader("ajaxLoader", "ajaxContent", "ajaxText", "", "none");
             //hay que actualizar la lista de resulotados xxx
            var odiv_OBFICHERO=document.getElementById("div_OBFICHERO");
            var div_OBFICHEROcontenido="";
            div_OBFICHEROcontenido=div_OBFICHEROcontenido+"<table align=\"center\" class=\"dsptgtable\">";
               if (p.JSON2.LIST_FICHEROS.OFICHERO!=null) { 
                 

                 
                  var ficherolist = p.JSON2.LIST_FICHEROS.OFICHERO;
                           
                         var str2 = ficherolist.replace(/barrainvertida/gi, "\\");    
                         console.log(ficherolist);
                         console.log(str2);
                         objUtiles.abrirModal("axisimprimir", "src", "modal_axisimprimir.do?operation=tunnel&file="+str2+"&origen=axisctr130.jsp",600,200);

           
                } 
           }
            
            function f_but_nuevo() {
                f_abrir_axisadm206("ALTA");
            }
            
            
            function f_abrir_axisctr014() {
                objUtiles.abrirModal("axisctr014","src","modal_axisctr014.do?operation=form&CONDICION=NUEVA_PRODUCCION");
            }
            
            function f_cerrar_axisctr014() {
                objUtiles.cerrarModal("axisctr014")
            }   
            
            function f_aceptar_axisctr014 (CAGENTE){
                objDom.setValorPorId("CAGENTE", CAGENTE);
                f_cerrar_axisctr014();
                objAjax.invokeAsyncCGI("axis_axisctr130.do", callbackAjaxCambiarAgente, "operation=ver_agente&CODI=" + CAGENTE, this, objJsMessages.jslit_actualizando_registro);
            }
            

            function f_actualizar_agente(){
                 //alert("En actualizar agente");
                 if(document.miForm.CAGENTE_TEXT){
                    objAjax.invokeAsyncCGI("axis_axisctr001.do", callbackAjaxCargarAgente, "operation=ajax_actualizar_agente&CAGENTE=" + objDom.getValorComponente(document.miForm.CAGENTE_TEXT),
                    this, objJsMessages.jslit_cargando);
                 };
                
            }

            
            function callbackAjaxCambiarAgente(ajaxResponseText){
                var doc=objAjax.domParse(ajaxResponseText);

                if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                var CAGENTEformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("CODI"), 0, 0);
                var NOMBREformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("NOMBRE"), 0, 0);
                objDom.setValorPorId("CAGENTE_TEXT", CAGENTEformateado);
                objDom.setValorPorId("NOMBRE_TEXT", NOMBREformateado);
                }
                $.reinitialiseScroll(); 
                
            }
            
            function callbackAjaxCargarAgente(ajaxResponseText){
                
                var doc=objAjax.domParse(ajaxResponseText);
                
                var elementos = doc.getElementsByTagName("element");
                if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                    if(objUtiles.hayValorElementoXml(doc.getElementsByTagName("CODI")[0]) && elementos[0]){
                        var CAGENTEformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("CODI"), 0, 0);
                        var NOMBREformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("NOMBRE"), 0, 0);
                        objDom.setValorPorId("CAGENTE_TEXT", CAGENTEformateado); 
                        objDom.setValorPorId("CAGENTE", CAGENTEformateado); 
                        objDom.setValorPorId("NOMBRE_TEXT", NOMBREformateado); 
                    }else{
                        
                        objDom.setValorPorId("NOMBRE_TEXT",""); 
                        objDom.setValorPorId("CAGENTE_TEXT","");
                        objDom.setValorPorId("CAGENTE","");
                    }
                if (objUtiles.estaVacio(objDom.getValorPorId("CAGENTE_TEXT"))) {
                    var mensajesAlert = "<axis:alt f='axisctr001' c='MENSAAGE' lit='9903266'/>";
                    alert(mensajesAlert);
                }

                $.reinitialiseScroll(); 
             
                }
            }
            
             function validaCosiSucursales(){
                var sucur1 = document.miForm.CODIGOSUCINI.value;
                var sucur2 = document.miForm.CODIGOSUCFIN.value;
                
                if(sucur2 < sucur1){
                    alert("<axis:alt f='axisctr001' c='MENSAAGE' lit='9910230'/>");
                    document.miForm.CODIGOSUCINI.value = "<%= Integer.MIN_VALUE %>";
                    document.miForm.CODIGOSUCFIN.value = "<%= Integer.MIN_VALUE %>";
                }
                
            }

        </script>
    </head>
    <body onload="f_onload()">
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
    
    <c:import url="../include/modal_estandar.jsp">
        <c:param name="nid_y_titulo">axisimprimir|<axis:alt f="axissin064" c="TITULO_IMPR" lit="1000205" />|true</c:param>
    </c:import>
    
    <form name="miForm" action="" method="POST">
        <input type="hidden" name="operation"/>
        <input type="hidden" name="TTITULO" id="TTITULO" value=""/>
        <input type="hidden" name="CMODO" id="CMODO" value=""/>
        <input type="hidden" name="PSPERSON" id="PSPERSON" value="${__formdata['OBPROFESIONAL'].SPERSON}"/>
        <input type="hidden" name="DES_FILE" id="DES_FILE" value="${__formdata.DES_FILE}"/>
       
        <c:import url="../include/titulo_nt.jsp">
                <c:param name="modalidad"><axis:alt f="axisctr130" c="TITULO" lit="9910146" /></c:param>
                <c:param name="formulario"><axis:alt f="axisctr130" c="TITULO" lit="9910146" /></c:param>
                <c:param name="form">axisctr130</c:param>
        </c:import>
        
        <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt f="axisctr130" c="TIT_AXISCTR014" lit="1000234" /></c:param>
                <c:param name="nid" value="axisctr014" />
        </c:import>

        
    <!-- Area de campos  -->
    <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td> 
             <div class="separador">&nbsp;</div>
             <div class="titulo"><img src="images/flecha.gif"/>
             <b><axis:alt c="LIT_TITULO2" f="axisctr130" lit="9910148"/></b>&nbsp;   
             <table class="seccion">
                <tr>
                    <td align="left">
                         <table class="area" align="center">
                            <tr>
                                <th style="width:30%;height:0px"></th>
                                <th style="width:30%;height:0px"></th>
                                <th style="width:40%;height:0px"></th>
                              
                            </tr>
                            <tr>
                                <axis:visible f="axisctr130" c="NIT"> 
                                     <td class="titulocaja">
                                        <b><axis:alt f="axisctr130" c="EMPRESA" lit="101619"/></b> <%-- Empresa --%>
                                     </td>
                                     <td class="titulocaja">
                                        <b><axis:alt f="axisctr130" c="CAGENTE" lit="100584" /></b>
                                    </td>
                                    <td class="titulocaja">
                                        <b><axis:alt f="axisctr130" c="TAGENTE" lit="105940" /></b>
                                    </td>
                                </axis:visible>
                            </tr>                                    
                            <tr>
                           
                               <axis:ocultar f="axisctr130" c="CEMPRESA" dejarHueco="false"> 
                                  <td class="campocaja">  
                                    <select name="CEMPRESA" id="CEMPRESA" size="1" class="campowidthselect campo campotexto" style="width:80%;">
                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisctr130" c="SELECCIONAR" lit="1000348"/> - </option>
                                        <c:forEach var="element" items="${__formdata.LISTVALORES.LSTEMPRESAS}">
                                            <option value = "${element.CEMPRES}"
                                            <c:if test="${__formdata.CEMPRESA == element.CEMPRES || fn:length(__formdata.LISTVALORES.LSTEMPRESAS) == 1}"> selected = "selected"</c:if>>
                                                ${element.TEMPRES} 
                                            </option>
                                        </c:forEach>
                                    </select>
                                  </td>  
                              </axis:ocultar>
                                
                              <axis:visible f="axisctr130" c="CAGENTE"> 
                                    <td class="campocaja">
                                        <input type="text" name="CAGENTE_TEXT" title="<axis:alt f="axisctr130" c="CAGENTE" lit="100584" />" id="CAGENTE_TEXT" value="${sessionScope.axisctr_agente.CODI}" class="campowidthinput campo campotexto" style="width:70%" formato="entero"
                                                onchange="f_actualizar_agente()" />
                                        <img id="IMG_CAGENTE_TEXT" border="0" src="images/find.gif" onclick="f_abrir_axisctr014()" style="cursor:pointer"/>
                                    </td>
                                     <td class="campocaja">    
                                        <input readonly="true" type="text" name="NOMBRE_TEXT" id="NOMBRE_TEXT" value="${sessionScope.axisctr_agente.NOMBRE}" class="campowidthinput campo campotexto"/>
                                    </td>
                              </axis:visible>
                               
                            </tr>
                            
                             <tr>
                                <axis:ocultar f="axisctr130" c="REPORTE" dejarHueco="false"> 
                                    <td class="titulocaja">
                                        <b><axis:alt f="axisctr130" c="REPORTE" lit="9000745"></axis:alt></b>
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axisctr130" c="SUCURSAL" dejarHueco="false"> 
                                    <td id="td_SUCURSAL" class="titulocaja">
                                        <b><axis:alt f="axisctr130" c="SUCURSAL" lit="9909330"></axis:alt></b>
                                    </td>
                                </axis:ocultar>
                            </tr>
                            
                             <tr>
                               <axis:ocultar f="axisctr130" c="REPORTE" dejarHueco="false"> <!-- TODO C -->
                                    <td class="campocaja">
                                        <select name = "REPORTE" id="REPORTE" style="width:80%;" size="1" onchange="f_onload()">
                                            <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisctr130" c="REPORTE" lit="108341"/> - </option>
                                            <c:forEach var="tenedor" items="${requestScope.LS_TENEDOR}">
                                                <option value="${tenedor.CATRIBU}">
                                                    ${tenedor.TATRIBU}
                                                </option>
                                            </c:forEach>
                                        </select>
                                    </td>
                                </axis:ocultar> 
                                
                               <axis:ocultar f="axisctr130" c="SUCURSAL" dejarHueco="false"> <!-- TODO C -->
                                    <td class="campocaja">
                                        <select name = "SUCURSAL" id="SUCURSAL" style="width:70%;" size="1"  >
                                            <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisctr130" c="SUCURSAL" lit="108341"/> - </option>
                                            <c:forEach var="ramos" items="${listaSucursales}">
                                                <option value = "${ramos.CODI}">
                                                    ${ramos.NOMBRE}
                                                </option>   
                                            </c:forEach>
                                        </select>
                                    </td>
                                </axis:ocultar>      
                             </tr>
                              
                        </table>
                            
                        <div class="separador">&nbsp;</div>   
                        <b><axis:alt c="LIT_TITULO3" f="axisctr130" lit="9910151"/></b>&nbsp; 
                        
                        <table class="area" align="center">
                            <tr>
                                <th style="width:15%;height:0px"></th>
                                <th style="width:15%;height:0px"></th>
                                <th style="width:10%;height:0px"></th>
                                <th style="width:10%;height:0px"></th>
                                <th style="width:50%;height:0px"></th>
                            </tr>
                            
                            
                            <tr>
                                 <axis:ocultar f="axisctr130" c="FDESDE" dejarHueco="false"> 
                                        <td class="titulocaja" ><b id="label_FDESDE"><axis:alt f="axisctr130" c="LIT_FDESDE" lit="9902360"/></b></td>
                                 </axis:ocultar>
                                
                                 <axis:ocultar f="axisctr130" c="FHASTA" dejarHueco="false">
                                    <td class="titulocaja" ><b id="label_FHASTA"><axis:alt f="axisctr130" c="LIT_FHASTA" lit="9902361"/></b></td>
                                 </axis:ocultar>
                            </tr>
                            
                            <tr>
                                <axis:ocultar f="axisctr130" c="FDESDE" dejarHueco="false"> <!-- TODO C -->
                                    <td class="campocaja">
                                        <input type="text" class="campowidthinput campo campotexto" size="15" value="<fmt:formatDate value='${axisadm206_plListaVersionesDian[0].FINIVIG}' pattern='dd/MM/yyyy'/>" name="FDESDE" id="FDESDE" 
                                            style="width:55%;" <axis:atr f="axisctr130" c="FDESDE" a="modificable=true&formato=fecha"/> /> 
                                            <a style="vertical-align:middle;"><img
                                            id="icon_FDESDE" border=0 alt="<axis:alt f="axisctr130" c="LIT_FDESDE" lit="9902360"/>" title="<axis:alt f="axisctr130" c="LIT_FDESDE_TIT" lit="9902360"/>" src="images/calendar.gif"/></a>
                                    </td>
                                </axis:ocultar>   
                                <axis:ocultar f="axisctr130" c="FHASTA" dejarHueco="false">
                                       <td class="campocaja"> 
                                            <input type="text" class="campowidthinput campo campotexto" size="15" value="<fmt:formatDate value='${axisadm206_plListaVersionesDian[0].FINIVIG}' pattern='dd/MM/yyyy'/>" name="FHASTA" id="FHASTA" 
                                                style="width:55%;" <axis:atr f="axisctr130" c="FHASTA" a="modificable=true&formato=fecha"/> /> 
                                                <a style="vertical-align:middle;"><img
                                                id="icon_FHASTA" border=0 alt="<axis:alt f="axisctr130" c="LIT_FHASTA" lit="100885"/>" title="<axis:alt f="axisctr130" c="LIT_FHASTA_TIT" lit="100885"/>" src="images/calendar.gif"/></a>
                                       </td>
                                </axis:ocultar>
                                
                                <axis:ocultar f="axisctr130" c="CALCULAR" dejarHueco="false"> 
                                    <td id="td_CALCULAR" class="titulocaja">
                                        <input type="radio" id="GENERAR" name="GENERAR" value="1" />                                       
                                        <b><axis:alt f="axisctr130" c="GENERAR" lit="9910152" /></b>
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axisctr130" c="GENERAR" dejarHueco="false"> 
                                    <td id="td_CONDUCTOR" class="titulocaja">
                                        <input type="radio" id="GENERAR" name="GENERAR" value="0" />
                                        <b><axis:alt f="axisctr130" c="GENERAR" lit="9910153" /></b>
                                    </td>
                                </axis:ocultar>

                            </tr>
                            
                            <tr>                                
                                <axis:ocultar f="axisctr130" c="PREVIO" dejarHueco="false"> 
                                    <td id="td_PREVIO" class="titulocaja">
                                        <input type="radio" id="REAL" name="REAL" value="1" />                                       
                                        <b><axis:alt f="axisctr130" c="REAL" lit="9000632" /></b>
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axisctr130" c="REAL" dejarHueco="false"> 
                                    <td id="td_REAL" class="titulocaja">
                                        <input type="radio" id="REAL" name="REAL" value="0"  />
                                        <b><axis:alt f="axisctr130" c="REAL" lit="9000506" /></b>
                                    </td>
                                </axis:ocultar>

                            </tr>

                        </table>
                        
                        <div class="separador">&nbsp;</div>   
                        <b><axis:alt c="LIT_TITULO4" f="axisctr130" lit="9910154"/></b>&nbsp; 
                        
                        <table class="area" align="center">
                            <tr>
                                <th style="width:5%;height:0px"></th>
                                <th style="width:2%;height:0px"></th>
                                <th style="width:3%;height:0px"></th>
                                <th style="width:90%;height:0px"></th>
                            </tr>                    
                            <tr>                                
                                <axis:ocultar f="axisctr130" c="TODAS" dejarHueco="false"> 
                                    <td id="td_TODAS" class="titulocaja">
                                        <b><axis:alt f="axisctr130" c="PREVIO" lit="103233" /></b>
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axisctr130" c="SI" dejarHueco="false"> 
                                    <td id="td_SI" class="titulocaja">
                                        <input type="radio" id="TODAS" name="TODAS" value="3"  />
                                        <b><axis:alt f="axisctr130" c="TODAS" lit="9910187" /></b>
                                    </td>
                                </axis:ocultar>
                                
                                <axis:ocultar f="axisctr130" c="NO" dejarHueco="false"> 
                                    <td id="td_NO" class="titulocaja">
                                        <input type="radio" id="TODAS" name="TODAS" value="3"  />
                                        <b><axis:alt f="axisctr130" c="TODAS" lit="9910188" /></b>
                                    </td>
                                </axis:ocultar>

                            </tr>

                        </table>
                        
                        <div class="separador">&nbsp;</div>   
                        
                        <table class="area" align="center">
                            <tr>
                                <th style="width:35%;height:0px"></th>
                                <th style="width:35%;height:0px"></th>
                                <th style="width:30%;height:0px"></th>
    
                            </tr>                    
                            <tr>                                
                                     <td class="titulocaja">
                                        <b><axis:alt f="axisctr130" c="CODIGOSUCINI" lit="9910190"/></b> <%-- Empresa --%>
                                     </td>
                                     <td class="titulocaja">
                                        <b><axis:alt f="axisctr130" c="CODIGOSUCFIN" lit="9910191" /></b>
                                    </td>   
                            </tr>
                            <tr>
                              <axis:ocultar f="axisctr130" c="CODIGOSUCINI" dejarHueco="false"> 
                                  <td class="campocaja">  
                                    <select name="CODIGOSUCINI" id="CODIGOSUCINI" size="1" class="campowidthselect campo campotexto" style="width:80%;" >&nbsp;
                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisctr130" c="CODIGOSUCINI" lit="1000348"/> - </option>
                                        <c:forEach var="ramos" items="${listaSucursales}">
                                            <option value = "${ramos.CODI}">
                                                ${ramos.NOMBRE}
                                            </option>   
                                        </c:forEach>
                                    </select>
                                  </td>  
                              </axis:ocultar>
                               <axis:ocultar f="axisctr130" c="CODIGOSUCFIN" dejarHueco="false"> 
                                  <td class="campocaja">  
                                    <select name="CODIGOSUCFIN" id="CODIGOSUCFIN" size="1" class="campowidthselect campo campotexto" style="width:80%;" onchange="validaCosiSucursales()">&nbsp;
                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisctr130" c="CODIGOSUCFIN" lit="1000348"/> - </option>
                                        <c:forEach var="ramos" items="${listaSucursales}">
                                            <option value = "${ramos.CODI}">
                                                ${ramos.NOMBRE}
                                            </option>   
                                        </c:forEach>
                                    </select>
                                  </td>  
                              </axis:ocultar>
                                
                            </tr>
                                         
                            <tr>                                
                                     <td class="titulocaja">
                                        <b><axis:alt f="axisctr130" c="NITAGEINI" lit="9910192"/></b> <%-- Empresa --%>
                                     </td>
                                     <td class="titulocaja">
                                        <b><axis:alt f="axisctr130" c="NITAGEFIN" lit="9910193" /></b>
                                    </td>   
                            </tr>
                            <tr>
                              <axis:ocultar f="axisctr130" c="NITAGEINI" dejarHueco="false"> 
                                  <td class="campocaja">  
                                     <input  type="text" name="NITAGEINI" id="NITAGEINI" value="${sessionScope.axisctr_agente.NITAGEINI}" class="campowidthinput campo campotexto"/>
                                  </td>  
                              </axis:ocultar>
                               <axis:ocultar f="axisctr130" c="NITAGEFIN" dejarHueco="false"> 
                                  <td class="campocaja">  
                                     <input  type="text" name="NITAGEFIN" id="NITAGEFIN" value="${sessionScope.axisctr_agente.NITAGEFIN}" class="campowidthinput campo campotexto"/>
                                  </td>  
                              </axis:ocultar>
                                
                            </tr>

                        </table>
                        </tr>
                    </table>
                    
           
                       
            </td>
        </tr>
        <tr>                    
        </tr>  
    </table>
            
            <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisctr130</c:param>
                <c:param name="f">axisctr130</c:param>
                <c:param name="__botones">salir<axis:visible f="axisctr130" c="BT_ACEPTAR">,aceptar</axis:visible></c:param>
            </c:import>
    </form>
<c:import url="../include/mensajes.jsp" />

    <script type="text/javascript">
        Calendar.setup({
            inputField     :    "FDESDE",     
            ifFormat       :    "%d/%m/%Y",      
            button         :    "icon_FDESDE", 
            singleClick    :    true,
            firstDay       :    1
        });
     </script>
     <script type="text/javascript">
           Calendar.setup({
               inputField     :    "FHASTA",     
               ifFormat       :    "%d/%m/%Y",      
               button         :    "icon_FHASTA", 
               singleClick    :    true,
              firstDay       :    1
        });
     </script>
</body>
</html>

