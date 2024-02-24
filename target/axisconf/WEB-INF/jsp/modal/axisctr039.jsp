<%/*
*  Fichero: axisctr039.jsp
*
*  @author <a href = "mailto:xgallego@csi-ti.com">Xavier Gallego</a>
*
*  Fecha: 11/06/2008
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

<html>
  <head>
    <link rel="stylesheet" href="styles/genericosHtml.css" type="text/css">
    <link rel="stylesheet" href="styles/axisnt.css" type="text/css">
    <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>
        <%-- Especial per controlar els scroll amb iPad --%>
        <link type="text/css" href="styles/jquery.jscrollpane.css" rel="stylesheet" media="only screen and (min-device-width: 768px) and (max-device-width: 1024px)" />
        <style type="text/css" id="page-css"> </style>
    <%-- FI Especial per controlar els scroll amb iPad --%>
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
    <!--*********************************** -->
    <script language="Javascript" type="text/javascript">
        function f_onload() {  
        		 <c:if test="${ (fn:containsIgnoreCase(header['User-Agent'],'ipad') )   }">
						retocarPAGE_CSS('axisctr039');
					</c:if>
            f_cargar_propiedades_pantalla();
            
            var ok = '${__formdata.OKVal}';
            
            if (!objUtiles.estaVacio(ok) && ok == 0){
                
                var fefecto = '${__formdata.PFEFECTO_039}';
                
                if(!objUtiles.estaVacio(objDom.getValorPorId("PFEFECTO")))
                    var pfefecto = objDom.getValorPorId("PFEFECTO");
                else
                    var pfefecto = fefecto;
                
                if(document.miForm.NCERTIF.value == 0)
                    parent.f_editar_suplemento(pfefecto,document.miForm.NNUMCASO.value,document.miForm.NCASO_BPM.value,null);
                else
                    parent.f_editar_suplemento(pfefecto,document.miForm.NNUMCASO.value,document.miForm.NCASO_BPM.value,document.miForm.NSOLICI_BPM.value);
                parent.f_cerrar_axisctr039();
            }
        }
        
        function f_but_cancelar() {
            parent.f_cerrar_axisctr039();
        }
        
        function f_but_aceptar() {
            // Llamada para guardar los valores de la pantalla
            if (objValidador.validaEntrada()){
            
               // parent.f_editar_suplemento(objDom.getValorPorId("PFEFECTO"));
               // parent.f_cerrar_axisctr039();
               
               var NCASO_BPM = document.miForm.NCASO_BPM.value;
               var NSOLICI_BPM = null;
               <c:if test="${__formdata.NCERTIF != 0}">
                NSOLICI_BPM = document.miForm.NSOLICI_BPM.value;
               </c:if> 
               var NCERTIF = document.miForm.NCERTIF.value;
            
               if(objUtiles.estaVacio(NCASO_BPM) && objUtiles.estaVacio(NSOLICI_BPM)){
                   objUtiles.ejecutarFormulario("modal_axisctr039.do", "aceptar", document.miForm, "_self", objJsMessages.jslit_cargando);
               }
               else{
                  if(NCERTIF != 0){
                        if( (!objUtiles.estaVacio(NCASO_BPM) && objUtiles.estaVacio(NSOLICI_BPM)) || 
                             (objUtiles.estaVacio(NCASO_BPM) && !objUtiles.estaVacio(NSOLICI_BPM))){
                                alert("<axis:alt f='axisctr001' c='MENSAAGE' lit='9906096'/>"); 
                        }
                        else{
                         objUtiles.ejecutarFormulario("modal_axisctr039.do", "aceptar", document.miForm, "_self", objJsMessages.jslit_cargando);
                        }
                  }
                  else{
                    objUtiles.ejecutarFormulario("modal_axisctr039.do", "aceptar", document.miForm, "_self", objJsMessages.jslit_cargando);
                  }                 
               }
            }
        }
        
        function f_abrir_axisctr213(){
            var NPOLIZA = document.miForm.NPOLIZA.value; 
            var SPRODUC = document.miForm.SPRODUC.value;
            var NCERTIF = document.miForm.NCERTIF.value;
            objUtiles.abrirModal("axisctr213","src","modal_axisctr213.do?operation=form&DONDE=AXISCTR039&SPRODUCSEL="+SPRODUC+"&NPOLIZASEL="+NPOLIZA+"&NCERTIFSEL="+NCERTIF);
        }
            
            function f_cerrar_axisctr213() {
                objUtiles.cerrarModal("axisctr213");
            }
            
            function f_aceptar_axisctr213(NNUMCASO,NCASO_BPM,NSOLICI_BPM){ 
                objUtiles.cerrarModal("axisctr213");
                document.miForm.NCASO_BPM.value = NCASO_BPM;
                document.miForm.NNUMCASO.value = NNUMCASO;
                f_cargar_casobpm(2);
            }
            
            function f_cargar_casobpm(donde){
                   elemento = document.getElementById('NCASO_BPM');     
                var re = /^(-)?[0-9]*$/;     
                if (!re.test(elemento.value)) {    
                    document.miForm.NCASO_BPM.value = "";
                    alert("<axis:alt f='axisadm022' c='ERRORNUM' lit='1000150'/>");
                    
                }
                else{ 
                    
                    if(donde == 1)
                        document.miForm.NNUMCASO.value = "";
                        
                    
                    if (!objUtiles.estaVacio (document.miForm.NNUMCASO.value) ||
                        !objUtiles.estaVacio (document.miForm.NCASO_BPM.value)){
                        NNUMCASO  = document.miForm.NNUMCASO.value;
                        NCASO_BPM = document.miForm.NCASO_BPM.value;
                        
                        if(document.miForm.NCERTIF.value != 0)
                            NSOLICI_BPM = document.miForm.NSOLICI_BPM.value;
                        else
                            NSOLICI_BPM = null;
                       
                       document.miForm.NOMBRE_NCASO_BPM.value = "";     
                       objAjax.invokeAsyncCGI("modal_axisctr039.do", callbackAjaxCargarCasoBPM, "operation=ajax_cargar_casobpm&NNUMCASO=" + NNUMCASO +"&NCASO_BPM="+NCASO_BPM+"&NSOLICI_BPM="+NSOLICI_BPM, this, objJsMessages.jslit_cargando);
                    }
                    else
                        document.miForm.NOMBRE_NCASO_BPM.value = "";
                }
            }
            
             function callbackAjaxCargarCasoBPM (ajaxResponseText){
                //alert(ajaxResponseText);
                var doc=objAjax.domParse(ajaxResponseText);
               // CRAMOform  = document.miForm.CRAMO.value;
               // var seleccionado = false;
                if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                    if(objUtiles.hayValorElementoXml(doc.getElementsByTagName("PTNOMCOM")[0])){
                        var NOMBREformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("PTNOMCOM"), 0, 0);
                        objDom.setValorPorId("NOMBRE_NCASO_BPM", NOMBREformateado); 
                    }else{
                        
                        objDom.setValorPorId("NOMBRE_NCASO_BPM",""); 
                    }
                    
                }
                
            } 
    </script>
  </head>
    <body onload="f_onload()">
        <div id="wrapper" class="wrapper">
        <form name="miForm" action="" method="POST">
          <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
            <input type="hidden" name="operation" value=""/>
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="modalidad">
                    <axis:visible f="axisctr039" c="ETIQ_PANTALLA">
                        <axis:alt f="axisctr039" c="ETIQ_PANTALLA" lit="1000126"></axis:alt>
                    </axis:visible>
                    <axis:visible f="axisctr039" c="PTMOTMOV"> ${__formdata.PTMOTMOV}
                    </axis:visible>
                </c:param>
                <c:param name="formulario">
                    <axis:visible f="axisctr039" c="ETIQ_TITULO">
                        <axis:alt f="axisctr039" c="ETIQ_TITULO" lit="1000126"></axis:alt>
                    </axis:visible>
                </c:param>
                <c:param name="form">axisctr039</c:param>
            </c:import>
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="nid_y_titulo">axisctr213|<axis:alt c="axisctr213_TITULO" f="axisctr039" lit="9906011"/></c:param>
            </c:import>
            
            <input type="hidden" name="NCERTIF" id="NCERTIF" value="${__formdata.NCERTIF}"/>
            <input type="hidden" name="NPOLIZA" id="NPOLIZA" value="${__formdata.NPOLIZA}"/>
            <input type="hidden" name="NNUMCASO" id="NNUMCASO" value="${__formdata.NNUMCASO}"/> 
            <input type="hidden" name="SPRODUC" id="SPRODUC" value="${__formdata.SPRODUC}"/>
            <input type="hidden" name="PRIMERAVEZ" id="PRIMERAVEZ" value="${__formdata.PRIMERAVEZ}"/>
            

            <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td >
                    <table class="seccion">
                        <tr>
                            <td align="left">
                               <table class="area" align="center">
                                    <tr>
                                        <th style="width:25%;height:0px"></th>
                                    </tr>
                                    <tr>                  
                                        <axis:ocultar f="axisctr039" c="FEFECTO">
                                            <td class="titulocaja">
                                                <b><axis:alt f="axisctr039" c="FEFECTO" lit="9905744"></axis:alt></b>
                                            </td>
                                        </axis:ocultar>
                                    </tr>
                                    <tr> 
                                        <axis:ocultar f="axisctr039" c="FEFECTO">
                                            <td class="campocaja">
                                                <input formato="fecha" type="text" class="campo campotexto" style="width:10%;" id="PFEFECTO" name="PFEFECTO" size="15" obligatorio="true"
                                                title="<axis:alt f="axisctr060" c="FEFECTO" lit="9905744" />"
                                                <axis:atr f="axisctr039" c="PFEFECTO" a="modificable=true"/>
                                                value="<fmt:formatDate pattern='dd/MM/yyyy' value='${requestScope.PFEFECTO_039}'/>" />
                                                <a style="vertical-align:middle;"><img 
                                                id="icon_PFEFECTO" alt="<axis:alt f="axisctr060" c="FEFECTO" lit="108341" />" 
                                                title="<axis:alt f="axisctr060" c="FEFECTO" lit="9905744" />" src="images/calendar.gif"/>
                                                </a>
                                            </td>
                                        </axis:ocultar>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                    </td>
                </tr>
                <axis:ocultar f="axisctr039" c="NCASO_BPM">
                <tr>
                    <td>
                       <%-- <div class="separador">&nbsp;</div> --%>
                        <div class="titulo">
                            <img src="images/flecha.gif"/><axis:alt f="axisctr039" c="LIT_IMG_1" lit="9906099" />
                        </div> 
                        <table class="seccion" cellpadding="0" cellspacing="0">
                            <tr>
                                <td>
                                    <table class="area" align="center"> 
                                        <tr>
                                            <th style="width:15%;height:0px"></th>
                                            <th style="width:17%;height:0px"></th>
                                            <th style="width:5%;height:0px"></th>
                                            <th style="width:30%;height:0px"></th>
                                            <th style="width:33%;height:0px"></th>
                                        </tr>
                                        <tr>
                                            <td class="titulocaja" id="tit_NCASO_BPM">
                                                <b><axis:alt f="axisctr039" c="NCASO_BPM" lit="9905993" /></b>
                                            </td>
                                            <c:if test="${__formdata.NCERTIF != 0}">
                                            <td class="titulocaja" id="tit_NSOLICI_BPM">
                                                <b><axis:alt c="NSOLICI_BPM" f="axisctr039" lit="9905998" /></b>
                                            </td>
                                            </c:if>
                                            <td></td>
                                            <td class="titulocaja" id="tit_NOMBRE_NCASO_BPM">
                                                <b><axis:alt f="axisctr039" c="TNCASO_BPM" lit="105940" /></b>
                                            </td>
                                        </tr>
                                        <tr>   
                                            <td class="campocaja">
                                                <input type="text" id="NCASO_BPM" name="NCASO_BPM" title="<axis:alt f="axisctr039" c="NCASO_BPM" lit="9905993" />" id="NCASO_BPM" value="${__formdata.NCASO_BPM}" class="campowidthinput campo campotexto"  formato="entero"
                                                    <axis:atr f="axisctr039" c="NCASO_BPM" a="modificable=true&obligatorio=false"/> onchange="f_cargar_casobpm(1)" />
                                            </td>
                                            <c:if test="${__formdata.NCERTIF != 0}">
                                            <td class="campocaja">
                                                <input type="text" id="NSOLICI_BPM" name="NSOLICI_BPM" title="<axis:alt f="axisctr039" c="NSOLICI_BPM" lit="9905993" />" id="NSOLICI_BPM" value="${__formdata.NSOLICI_BPM}" class="campowidthinput campo campotexto" formato="entero"
                                                    <axis:atr f="axisctr039" c="NSOLICI_BPM" a="modificable=true&obligatorio=false"/> onchange="f_cargar_casobpm(1)" />
                                            </td>
                                            </c:if>
                                            <td>
                                                <img border="0" src="images/find.gif" onclick="f_abrir_axisctr213()" style="cursor:pointer" id="BUSQNCASO_BPM"/>
                                            </td>
                                            <td class="campocaja" colspan="2">    
                                                <input readonly="true" type="text" name="NOMBRE_NCASO_BPM" id="NOMBRE_NCASO_BPM" value="${__formdata.NOMBRE_NCASO_BPM}" class="campowidthinput campo campotexto"/>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </td> 
                </tr>
                </axis:ocultar>
            </table>

            <c:import url="../include/botonera_nt.jsp">
				<c:param name="f">axisctr039</c:param>
                <c:param name="__botones">cancelar,aceptar</c:param>
            </c:import>
			
			
            <c:import url="../include/mensajes.jsp" />
            <script type="text/javascript">
                Calendar.setup({
                    inputField     :    "PFEFECTO",     
                    ifFormat       :    "%d/%m/%Y",      
                    button         :    "icon_PFEFECTO", 
                    singleClick    :    true,
                    firstDay       :    1
                });
            </script>
        </form>
      </div>
    </body>
</html>
            