<%/*
*  Fichero: axisage032.jsp
*
*  @author <a href = "mailto:rfonollet@csi-ti.com">Ramon Fonollet</a>
*
*
*  Fecha: 09/04/2015
*/
%>

<%@ page contentType="text/html;charset=windows-1252" errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<html>
  <head>
    <link rel="stylesheet" href="styles/genericosHtml.css" type="text/css">
    <link rel="stylesheet" href="styles/axisnt.css" type="text/css">
    <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>
    <%-- Especial per controlar els scroll amb iPad --%>
        <link type="text/css" href="styles/jquery.jscrollpane.css" rel="stylesheet" media="only screen and (min-device-width: 768px) and (max-device-width: 1024px)" />
        <style type="text/css" id="page-css"></style>
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
            
        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/

        function f_onload() {
        
        	 <c:if test="${ (fn:containsIgnoreCase(header['User-Agent'],'ipad') )   }">
				retocarPAGE_CSS('axisage032');
			 </c:if>
             
            f_cargar_propiedades_pantalla(); 
            
            // Retocar tabla en IE
            if (document.all){ // ES Explorer
                document.getElementById("tabla1").style.marginLeft="1.3%";
            }
        }

        function f_but_cancelar() {
            parent.f_cerrar_axisage032();
        }        

        function f_but_aceptar() {
     
            var datos = document.getElementById("list_COBBANCARIO").value.split(";");
            var empresa =  document.getElementById("CEMPRES").value;
            
                var CBANCO =  datos[0];
                var TBANCO =  datos[1];

            var CESTADO =  objDom.getValorPorId("CESTADO");
            var TESTADO =  (document.getElementById("CESTADO").options[document.getElementById("CESTADO").selectedIndex]).text;
            var DOCUM =  objDom.getValorPorId("DOCUM");
            var IIMPORTE =  objDom.getValorPorId("IIMPORTE");
            var FDOC =  objDom.getValorPorId("FDOC");
            var TNATRIE =  objDom.getValorPorId("TNATRIE");
            var NLIQLIN =  objDom.getValorPorId("NLIQLIN");
            if (objValidador.validaEntrada()) {
                parent.f_aceptar_axisage032(CBANCO,TBANCO,CESTADO,TESTADO,DOCUM,IIMPORTE,FDOC,TNATRIE,NLIQLIN);   
            }
             
        }

        /*******************************************
                  Formateo Numeros
         ********************************************/
         function validarNumeros(IMPORTE){
             if (!objUtiles.estaVacio(IMPORTE)){
                 IMPORT = objValidador.valorFormateadoCampoNumerico(IMPORTE, true, true);
                 if(objNumero.validaNumero(IMPORT, true)){
                     return this.formateaNumeroCero(IMPORT, true);
                 }
                 else{
                     return   '';
                 }
             }
             else return IMPORTE;
         }
         
        function formateaNumeroCero(entrada, isDecimal){
            // es crida al reformateixador  ###.###,00
            var fnum=objNumero.formateaNumero(entrada,isDecimal);
            if(entrada.indexOf(objNumero.getSeparadorDecimales())<0){
                fnum += objNumero.getSeparadorDecimales() + '00';
            }
            // si es tracta d'un 0 el converteix a 0,00
            if(fnum=='0') fnum += objNumero.getSeparadorDecimales() + '00';
            return fnum;
        }
         
        function f_formatear(thiss){
            thiss.value = validarNumeros(thiss.value);
        }
        
        function f_calculoma(thiss){               
            f_formatear(thiss);
        }
        
        
        /*******************************************
                 Actualizar/Buscar Banco
         ********************************************/
        
        function f_abrir_axisadm062() {
            objUtiles.abrirModal("axisadm062","src","modal_axisadm062.do?operation=form");
        }
            
        function f_cerrar_axisadm062() {
            objUtiles.cerrarModal("axisadm062")
        }    
        function f_aceptar_axisadm062 (CBANCO){
            objDom.setValorPorId("CBANCO", CBANCO);
            f_cerrar_axisadm062();                
            objAjax.invokeAsyncCGI("modal_axisage032.do", callbackAjaxCambiarBanco, "operation=ver_banco&CBANCO=" + CBANCO, this, objJsMessages.jslit_actualizando_registro);
        }
        
        function callbackAjaxCambiarBanco(ajaxResponseText){            
            var doc=objAjax.domParse(ajaxResponseText);
            if(!objAppMensajes.existenErroresEnAplicacion(doc)){   
                var TBANCOformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("PTBANCO"), 0, 0);                
                objDom.setValorPorId("TBANCO", TBANCOformateado);
             }
        }               
        
        function f_actualizar_banco(){    
            var CBANCO =  objDom.getValorPorId("CBANCO");
            objDom.setValorPorId("TBANCO","");         
            objAjax.invokeAsyncCGI("modal_axisage032.do", callbackAjaxCargarBanco, "operation=ajax_actualizar_banco&CBANCO=" + CBANCO, this, objJsMessages.jslit_cargando);                
        }
        
        function callbackAjaxCargarBanco(ajaxResponseText){ 
        
            var doc=objAjax.domParse(ajaxResponseText);
            var elementos = doc.getElementsByTagName("element");
            if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                if(objUtiles.hayValorElementoXml(doc.getElementsByTagName("CBANCO")[0]) && elementos[0]){
                    var CBANCOformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("CBANCO"), 0, 0);
                    var TBANCOformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("TBANCO"), 0, 0);
                    objDom.setValorPorId("CBANCO", CBANCOformateado); 
                    objDom.setValorPorId("TBANCO", TBANCOformateado);                         
                }else{                        
                    objDom.setValorPorId("CBANCO",""); 
                    objDom.setValorPorId("TBANCO","");                        
                }
            }
        }
        

        function f_fecha_FDOC() {

 
                var lista = document.getElementById("CESTADO").value;
                var today = new Date();
                var dd = today.getDate();
                var mm = today.getMonth()+1; //January is 0!
        
                var yyyy = today.getFullYear();
                if(dd<10){
                    dd='0'+dd
                } 
                if(mm<10){
                    mm='0'+mm
                } 
                var today = dd+'/'+mm+'/'+yyyy;
                if(lista == 2){
                    document.getElementById("FDOC").value = today;
                }else {
                    document.getElementById("FDOC").value = "";
                }
         
        }

    </script>
  </head>
  
    <body onload="f_onload()" onkeypress="">
    	<div id="wrapper" class="wrapper">
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
        <form name="miForm" action="" method="POST">
            
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt c="formulario" f="axisage032" lit="9907743" /></c:param>
                <c:param name="producto"><axis:alt c="producto" f="axisage032" lit="9907743" /></c:param>
                <c:param name="form">axisage032</c:param>
            </c:import>
            
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt f="axisage032" c="TIT_AXISCTR014" lit="1000234" /></c:param>
                <c:param name="nid" value="axisctr014" />
            </c:import>   
            
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt c="TIT_AXISADM0062" f="axisage032" lit="9901537" /></c:param>
                <c:param name="nid" value="axisadm062" />
            </c:import>
 
            <input type="hidden" name="operation"/>
            <input type="hidden" id="CONDICION" name="CONDICION" value="${__formdata.CONDICION}"/> 
            <input type="hidden" id="PARTNER" name="PARTNER" value="${__formdata.PARTNER}"/> 
            <input type="hidden" id="SPRODUC" name="SPRODUC" value="${__formdata.SPRODUC}"/> 
            <input type="hidden" id="NLIQLIN" name="SPRODUC" value="${__formdata.NLIQLIN}"/>
			<input type="hidden" id="CEMPRES" name="CEMPRES" value="${requestScope.CEMPRES}"/>
            
            <!-- Area de campos  -->
            <table id="tabla1" class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <!--campos-->
                        <table>
                            <tr>
                            
                                <th style="width:33%;height:0%;"/>
                                <th style="width:33%;height:0%;"/>
                                <th style="width:33%;height:0%;"/>
                                
                            </tr>
                            <tr>
                            
                                <td class="titulocaja">
                                    <b><axis:alt c="COBRO" f="axisage032" lit="9902893" /></b> <!-- Forma de cobro -->
                                </td>
                                <td class="titulocaja">
                                    <b><axis:alt c="DOCUM" f="axisage032" lit="9903661" /></b> <!-- Documento -->
                                </td>   
                                <td class="titulocaja">
                                    <b><axis:alt c="BANCO" f="axisage032" lit="9000964" /></b> <!-- Banco -->
                                </td>  
                                
                            </tr>
                            <tr>
                               <td class="campocaja">
                                   <select name="CESTADO" id="CESTADO" size="1" onchange="f_cargar_propiedades_pantalla();f_fecha_FDOC()" class="campowidthselect campo campotexto" style="width:90%;" <axis:atr f="axisage032" c="CESTADO" a="obligatorio=true&isInputText=false"/> <axis:alt f="axisage032" c="CESTADO" lit="9902893"/> >
                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisage032" c="SELECC" lit="1000348"/> - </option>
                                        <c:forEach var="element" items="${FORMA_DE_COBRO}">
                                            <option value = "${element.CATRIBU}"
                                            <c:if test="${__formdata.CATRIBU == element.CATRIBU || fn:length(FORMA_DE_COBRO) == 1}"> selected = "selected"</c:if>>
                                                ${element.TATRIBU} 
                                            </option>
                                        </c:forEach>
                                    </select>
                                </td>      
                                <td class="campocaja"  id="td_DOCUM">
                                    <input type="text" class="campowidthinput campo campotexto" value="${__formdata['DOCUM']}" name="DOCUM" id="DOCUM" size="1"
                                    style="width:90%" title="<axis:alt c="DOCUM" f="axisage032" lit="9903661"/>" <axis:atr f="axisage032" c="DOCUM" a="obligatorio=false"/>/>
                                </td>    
                                <td class="campocaja" colspan="3">
                                    <axis:ocultar f="axisage032" c="COBBAN" dejarHueco="false">    
                                        <input type="text" name="CBANCO" id="CBANCO" value="${__formdata.CBANCO}" class="campowidthinput campo campotexto" style="width:20%"
                                        formato="entero" maxLength="4" title="<axis:alt c="CBANCO" f="axisage032" lit="9000964"/>" 
                                        <axis:atr f="axisadm003" c="CBANCO" a="obligatorio=false"/> onchange="f_actualizar_banco()" />
                                        <img border="0" src="images/find.gif" onclick="f_abrir_axisadm062()" style="cursor:pointer"/>
                                        <input readonly="true" type="text" name="TBANCO" id="TBANCO" value="${__formdata.TBANCO}"  style="width:70%" class="campowidthinput campo campotexto"/>
                                    </axis:ocultar>
                                    
                                    <axis:ocultar f="axisage032" c="list_COBBANCARIO" dejarHueco="false"> 
                                        <select title="<axis:alt c="COBBAN" f="axisage032" lit='100879' />" alt="<axis:alt c="COBBAN" f="axisage032" lit='100879' />" name = "list_COBBANCARIO" id="list_COBBANCARIO" size="1" 
                                            class="campowidthselect campo campotexto_ob" style="width:200px;"
                                            <axis:atr f="axisage032" c="COBBAN" a="modificable=true&obligatorio=true"/>>
                                            <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisage032" c="SELECC" lit="1000348"/> - </option>
                                            <c:forEach var="cobradores" items="${requestScope.REC_IAX_COBRADORES}">
                                                <option value = "${cobradores.CCOBBAN};${cobradores.DESCRIPCION}"
                                                <c:if test="${__formdata.CBANCO == cobradores.CCOBBAN}"> selected = "selected"</c:if>>
                                                    ${cobradores.CCOBBAN} - ${cobradores.DESCRIPCION}
                                                </option>
                                            </c:forEach>
                                        </select>
                                    </axis:ocultar>
                                </td>  
                               
                            </tr>
                            <tr>
                            
                                <td class="titulocaja">
                                    <b><axis:alt c="IIMPORTE" f="axisage032" lit="9904351" /></b> <!-- Importe -->
                                </td>
                                <td class="titulocaja">
                                    <b><axis:alt c="FDOC" f="axisage032" lit="9903313" /></b> <!-- Fecha Documento -->
                                </td>   
                                <td class="titulocaja">
                                    <b></b>
                                </td>  
                                
                            </tr>
                             <tr>
                                <td class="campocaja">
                                    <input type="text" class="campowidthinput campo campotexto" value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONEDAPROD]}' value='${__formdata.IIMPORTE}'/>" name="IIMPORTE" id="IIMPORTE" size="15"
                                    style="width:97%" title="<axis:alt c="IIMPORTE" f="axisage032" lit="9904351"/>" onChange = "javascript:f_calculoma(this);" <axis:atr f="axisadm003" c="IIMPORTE" a="obligatorio=true"/>/>
                                </td>  
                                <td class="campocaja" id="td_FDOC">
                                    <input formato="fecha" type="text" class="campowidthinput campo campotexto" size="10" value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FDOC}"/>" name="FDOC" id="FDOC"  style="width:90%;"
                                    <axis:atr f="axisage032" c="FDOC" a="formato=fecha"/> title="<axis:alt f="axisage032" c="FDOC" lit="9903313"/>"  <axis:atr f="axisage032" c="FDOC" a="obligatorio=false"/>/> 
                                    <a id="icon_FDOC" style="vertical-align:middle;" href="#"><img id="popup_calendario_FDOC" border="0" alt="<axis:alt f="axisage032" c="FDOC_CAL" lit="9903313"/>" title="<axis:alt f="axisage032" c="TIT_FDOC" lit="100959" />" src="images/calendar.gif"/></a>
                                </td>      
                                <td></td>  
                            </tr>
                   
                        </table>
                        <table>
                            <tr>
                            
                                <td class="titulocaja">
                                    <b><axis:alt c="OBSERVACIONES" f="axisage032" lit="101162" /></b> <!-- Observaciones -->
                                </td>
                            
                            </tr>
                            <tr>
                                <td>
                                    <textarea cols="" rows="10" class="campo campotexto" id="TNATRIE" name="TNATRIE" size="15" title="<axis:alt f="axisage032" c="LIT_100588" lit="101162"/>"
                                        style="width:97.5%;overflow:hidden;">${__formdata.TNATRIE}</textarea>
                                </td> 
                            </tr>
                        </table>

                    </td>
                </tr>
            </table>
            <!-- Botonera -->
            <c:import url="../include/botonera_nt.jsp">
                <c:param name="f">axisage032</c:param>        
                <c:param name="__botones">cancelar,aceptar</c:param>
            </c:import>
        </form>
        
        <script type="text/javascript">

            Calendar.setup({
                inputField     :    "FDOC",     
                ifFormat       :    "%d/%m/%Y",      
                button         :    "popup_calendario_FDOC", 
                singleClick    :    true,
                firstDay       :    1
            });
        </script>
        
        <c:import url="../include/mensajes.jsp" />
        </div>
    </body>
</html>	