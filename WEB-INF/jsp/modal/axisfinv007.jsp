<%/**
*  Fichero: axisfinv007.jsp
*/
%>
<%@ page contentType="text/html;charset=windows-1252"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>    

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
 
<html>
    <head>
        <title><axis:alt f="axisfinv007" c="NOMBRE_PANTALLA" lit="formulario.axisnombrepantalla"/></title>
        <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
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
        
        <style type="text/css">
            div.fakefile {
                    position: absolute;
                    top: 0px;
                    left: 0px;
                    z-index: 1;
                    width: 650px;
            }

            input.file {
                    position: relative;
                    text-align: right;
                    -moz-opacity:0 ;
                    filter:alpha(opacity: 0);
                    opacity: 0;
                    z-index: 2;
                    
            }

            div.fileinputs {
                    position: relative;
                    height: 30px;
            }
            
            .campoExaminar {
                border: 1px solid #DDDDDD;
                font-size: 11px;
                color: #333333;
                padding: 1px;   
                margin: 0px 5px 0px 0px;
                width: 60%;
            }
        </style>
        
        <script type="text/javascript">        
            
            /****************************************************************************************/
            /*********************************** NAVEGACION *****************************************/
            /****************************************************************************************/
            
                    
            var W3CDOM = (document.createElement && document.getElementsByTagName);
    
            function initFileUploads() {            
                    if (!W3CDOM) return;
                    var inputFakeButton = document.createElement('input');
                    inputFakeButton.setAttribute('type','button');                
                    inputFakeButton.className = 'boton';
                    inputFakeButton.value = "<axis:alt f='axisfinv007' c='ITASA' lit='9001708'/>";
                    inputFakeButton.id = 'botoCFitxer';                
                    var inputFakeText = document.createElement('input');
                    inputFakeText.setAttribute('type','input');                
                    inputFakeText.className = 'campowidthinput campoExaminar campotexto';
                    inputFakeText.setAttribute('readonly','readonly');
                    inputFakeText.setAttribute('obligatorio','true');                
                    var fakeFileUpload = document.createElement('div');
                    fakeFileUpload.className = 'fakefile';                
                    fakeFileUpload.appendChild(inputFakeText);                
                    fakeFileUpload.appendChild(inputFakeButton);  
                    var x = document.getElementsByTagName('input');
                    for (var i=0;i<x.length;i++) {
                            if (x[i].type != 'file') continue;                        
                            if (x[i].parentNode.className != 'fileinputs') continue;                        
                            x[i].className = 'file hidden'; 
                            var clone = fakeFileUpload.cloneNode(true);
                            x[i].parentNode.appendChild(clone);
                            x[i].relatedElement = clone.getElementsByTagName('input')[0];
                            x[i].onchange = x[i].onmouseout = function () {
                                    this.relatedElement.value = this.value;                                
                            }
                    }
            }
            
            function f_onload() {                
                initFileUploads();
                f_cargar_propiedades_pantalla();
            }
            
            function f_but_cancelar() {
                if (${!empty __formdata.upload007})
                {
                    parent.f_buscar(null,null);
                }
                else{
                    parent.f_cerrar_modal("axisfinv007");  
                }
            }           
            
            function f_but_buscar() {
                parent.f_buscar(document.miForm.MONORIG.value,document.miForm.MONDEST.value);
            }

            /****************************************************************************************/
            /******************************* CALLBACKS AJAX *****************************************/
            /****************************************************************************************/    
            
            function f_enviar_datos() {
                 if (objValidador.validaEntrada()){
                    if(confirm("<axis:alt f='axisfinv007' c='MSG_CONFIRMA' lit='9001183'/>")){
                        var userAgent = "${header['User-agent']}";
                        
                        // En FF, no se recogen bien los acentos en el Fileupload Servlet. 
                        // Por eso, pasamos el nombre de fichero como un campo hidden.
                        // En IE, se recoge de forma normal, con item.getName().
                        if (userAgent.indexOf("Firefox") > 0)
                            objDom.setValorPorId("TFILENAME", objDom.getValorPorId("TFILE"));
            
                        objEventos.showHideLoader("ajaxLoader", "ajaxContent", "ajaxText", objJsMessages.jslit_cargando, "inline");
                        document.miForm.submit();
                    }   
                }
            }
            
        </script>
    </head>
    
    <body onload="f_onload()" onkeypress="if (event.keyCode==13)  { f_but_buscar() }">
    
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
        
        <form name="miForm" enctype='multipart/form-data' action="Axisfinv007fileupload" method="POST" accept-charset='UTF-8'>
            <input type="hidden" name="operation" value=""/>     
            <input type="hidden" id="TFILENAME" name="TFILENAME" value=""/>
            
             <c:import url="../include/titulo_nt.jsp">
                <c:param name="titulo"><axis:alt f="axisfinv007" c="TITULO_PANTALLA" lit="9901969" /></c:param>
                <c:param name="formulario"><axis:alt f="axisfinv007" c="TITULO_FORM" lit="9901969" /></c:param>
                <c:param name="form">axisfinv007</c:param>
            </c:import>
            
            <!-- Área de campos  -->
            <table class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <!-- Área 1 -->
                        <table class="seccion" align="center">
                            <tr>
                                <th style="width:2%;height:0px"></th>
                                <th style="width:33%;height:0px"></th>
                                <th style="width:33%;height:0px"></th>
                                <th style="width:31%;height:0px"></th>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;
                                </td>
                                <axis:visible f="axisfinv007" c="MONORIG">
                                    <td class="titulocaja">
                                        <b><axis:alt f="axisfinv007" c="MONORIG" lit="9901972"/></b>   <%-- Monorig --%>
                                    </td>
                                </axis:visible>
                                <axis:visible f="axisfinv007" c="MONDEST">
                                    <td class="titulocaja">
                                        <b><axis:alt f="axisfinv007" c="MONDEST" lit="9901973"/></b>   <%-- MonDest --%>
                                    </td>
                                </axis:visible>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;
                                </td>
                                <%-- Empresa --%>
                                <axis:visible f="axisfinv007" c="MONORIG">
                                    <td class="campocaja">
                                        <select name="MONORIG" id="MONORIG" size="1" class="campo campotexto" style="width:90%" 
                                        title="<axis:alt f="axisfinv007" c="MONORIG" lit="9901972"/>">
                                            <option value="null"> - <axis:alt f="axisfinv007" c="SNV_COMBO" lit="108341"/> - </option>
                                            <c:forEach items="${listaMon}" var="item">
                                                <option value = "${item.CMONEDA}">${item.TMONEDA}</option>
                                            </c:forEach>
                                        </select>
                                    </td>
                                </axis:visible>
                                <%-- Ramo --%>
                                <axis:visible f="axisfinv007" c="MONDEST">
                                    <td class="campocaja">
                                        <select name="MONDEST" id="MONDEST" size="1" class="campo campotexto" style="width:90%" 
                                        title="<axis:alt f="axisfinv007" c="MONDEST" lit="9901973"/>">
                                            <option value="null"> - <axis:alt f="axisfinv007" c="SNV_COMBO" lit="108341"/> - </option>
                                            <c:forEach items="${listaMon}" var="item">
                                                <option value = "${item.CMONEDA}">${item.TMONEDA}</option>
                                            </c:forEach>
                                        </select>
                                    </td>
                                </axis:visible>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                        </table>
                        
                        <div class="separador">&nbsp; </div> 
                        <axis:visible f="axisfinv007" c="CARGAR_FICHERO">
                            <table align="center">
                                    <tr>
                                        <th style="width:2%;height:0px"></th>
                                        <th style="width:33%;height:0px"></th>
                                        <th style="width:33%;height:0px"></th>
                                        <th style="width:31%;height:0px"></th>
                                    </tr>
                                    <tr>
                                        <td>
                                            &nbsp;
                                        </td>
                                        <axis:visible f="axisfinv007" c="TFILE">
                                            <td class="titulocaja">
                                                <b id="label_TFILE"><axis:alt f="axisfinv007" c="TFILE" lit="9901981"/></b>
                                            </td>
                                        </axis:visible>
                                     </tr>
                                     <tr>
                                        <td>
                                            &nbsp;
                                        </td>
                                        <axis:visible f="axisfinv007" c="TFILE">
                                                <td class="campocaja">                             
                                                    <div class="fileinputs"  style="width:100%;">
                                                        <input type="file" name="TFILE" id="TFILE" title="<axis:alt f="axisfinv007" c="TFILE" lit="9901981"/>" obligatorio="true" style="width:500px" size="35" obligatorio="true"/>                                
                                                    </div>                                                    
                                                </td>
                                                <td class="campocaja">                             
                                                    <input type="button" class="boton" style="vertical-align:bottom;cursor:pointer;" value="<axis:alt f="axisfinv007" c="BOT_CARGA" lit="9001481"/>" onclick="f_enviar_datos()"/>
                                                </td>
                                        </axis:visible>
                                     </tr>
                            </table>
                        </axis:visible>
                        <div class="separador">&nbsp; </div>                                        
                        <c:import url="../include/botonera_nt.jsp">
                            <c:param name="f">axisfinv007</c:param>
                            <c:param name="__botones">cancelar<axis:visible f="axisfinv007" c="BUSCAR">,buscar</axis:visible></c:param>
                        </c:import>
                        <div class="separador">&nbsp; </div>       
                    </td>
                </tr>
            </table>
        </form>
        <c:import url="../include/mensajes.jsp" />
    </body>
</html>
