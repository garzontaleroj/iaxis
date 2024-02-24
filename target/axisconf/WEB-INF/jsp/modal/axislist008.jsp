<%/**
    *  Fichero: axislist008.jsp
    *  @author <a href = "mailto:jgutierrez@csi-ti.com">Jenny Gutierrez</a>
    *  
    *    Comentarios
    *
    *
    *  Fecha: 22/07/13
    */
    %>
<%@ page contentType="text/html;charset=iso-8859-15"%>
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
    
    <title><axis:alt f="axislist008" c="TITULO" lit="102089"/></title> <%-- LITERAL --%>
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
            revisarEstilos();
            f_cargar_propiedades_pantalla();
            document.miForm.SPROCES.focus();
            
        }
                
        function f_but_cancelar() {
            parent.f_cerrar_axislist008();
        }        
        
        
		
        function f_cargar_gestores(){
        
                     EMPRESA= objUtiles.utilSplit(objDom.getValorComponente(document.miForm.EMPRESA), "/")[0];
                     if (!objUtiles.estaVacio (EMPRESA) ){
					 objDom.setValorComponente(document.miForm.EMPRESA, objDom.getValorComponente(document.miForm.EMPRESA));
                    }else
                    objDom.setValorComponente(document.miForm.EMPRESA, null);
					objAjax.invokeAsyncCGI("modal_axislist008.do", callbackAjaxCargarGstores, "operation=ajax_busqueda_gestores&EMPRESA=" + objDom.getValorComponente(document.miForm.EMPRESA), this, objJsMessages.jslit_cargando);
                   
            }   
         
            function callbackAjaxCargarGstores (ajaxResponseText){
            
                var doc=objAjax.domParse(ajaxResponseText);
                if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                    var elementos = doc.getElementsByTagName("TGESTOR");
					var GESTORCombo = document.miForm.GESTOR;     
                    objDom.borrarOpcionesDeCombo(GESTORCombo);
                    objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", '- <axis:alt f="axislist008" c="GESTOR" lit="108341"/> - ', GESTORCombo, 0);
                    var FORMATOCombo = document.miForm.FORMATO;
                    objDom.borrarOpcionesDeCombo(FORMATOCombo);
                    objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", '- <axis:alt f="axislist008" c="FORMATO" lit="108341"/> - ', FORMATOCombo, 0);
                        
                       for (i = 0; i < elementos.length; i++) {
                            var GESTOR = objDom.getValorNodoDelComponente(doc.getElementsByTagName("TGESTOR"), i, 0);
                            var TITULO = objDom.getValorNodoDelComponente(doc.getElementsByTagName("TNOMBRE"), i, 0); 
                            objDom.addOpcionACombo(GESTOR, TITULO, GESTORCombo, i+1);
                            }
                   

                }
                 f_cargar_propiedades_pantalla();
				 $.reinitialiseScroll();
			}   
            
			function f_cargar_formatos(){
        
                     GESTOR= objUtiles.utilSplit(objDom.getValorComponente(document.miForm.GESTOR), "/")[0];
                     if (!objUtiles.estaVacio (GESTOR) ){
					 objDom.setValorComponente(document.miForm.GESTOR, objDom.getValorComponente(document.miForm.GESTOR));
					}else
                    objDom.setValorComponente(document.miForm.GESTOR, null);
					objAjax.invokeAsyncCGI("modal_axislist008.do", callbackAjaxCargarFormatos, "operation=ajax_busqueda_formatos&GESTOR=" + objDom.getValorComponente(document.miForm.GESTOR), this, objJsMessages.jslit_cargando);
            }   
         
            function callbackAjaxCargarFormatos (ajaxResponseText){
            
                var doc=objAjax.domParse(ajaxResponseText);
                if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                    var elementos = doc.getElementsByTagName("TFORMAT");
                    var FORMATOCombo = document.miForm.FORMATO;     
                    objDom.borrarOpcionesDeCombo(FORMATOCombo);
                   objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", '- <axis:alt f="axislist008" c="FORMATO" lit="108341"/> - ', FORMATOCombo, 0);
				   
				   for (i = 0; i < elementos.length; i++) {
                            var FORMATO = objDom.getValorNodoDelComponente(doc.getElementsByTagName("TFORMAT"), i, 0);
                            var TITULO = objDom.getValorNodoDelComponente(doc.getElementsByTagName("TNOMBRE"), i, 0);
                            objDom.addOpcionACombo(FORMATO, TITULO, FORMATOCombo, i+1);
                        }
				}
                    f_cargar_propiedades_pantalla();
					$.reinitialiseScroll();
                
            }    
       
        function f_but_buscar() {
            if (objValidador.validaEntrada()){
        
                var params = '';
                if (!objUtiles.estaVacio(objDom.getValorPorId("SPROCES"))){
                    params += "&SPROCES="+objDom.getValorPorId("SPROCES");
                }
                if (!objUtiles.estaVacio(objDom.getValorPorId("FPROINI"))){
                    params += "&FPROINI="+objDom.getValorPorId("FPROINI");
                }
                if (!objUtiles.estaVacio(objDom.getValorPorId("NERROR"))){
                    params += "&NERROR="+objDom.getValorPorId("NERROR");
                }
                if (!objUtiles.estaVacio(objDom.getValorPorId("EMPRESA"))){
                    params += "&EMPRESA="+objDom.getValorPorId("EMPRESA");
                }
                if (!objUtiles.estaVacio(objDom.getValorPorId("CUSUARI"))){
                    params += "&CUSUARI="+objDom.getValorPorId("CUSUARI");
                }
                
                if (!objUtiles.estaVacio(objDom.getValorPorId("GESTOR"))){
                    params += "&GESTOR="+objDom.getValorPorId("GESTOR");
                }
                
                if (!objUtiles.estaVacio(objDom.getValorPorId("FORMATO"))){
                    params += "&FORMATO="+objDom.getValorPorId("FORMATO");
                }
                
                if (!objUtiles.estaVacio(objDom.getValorPorId("ANIO"))){
                    params += "&ANIO="+objDom.getValorPorId("ANIO");
                }
                
                if (!objUtiles.estaVacio(objDom.getValorPorId("MES"))){
                    params += "&MES="+objDom.getValorPorId("MES");
                }
                
                if (!objUtiles.estaVacio(objDom.getValorPorId("DIA"))){
                    params += "&DIA="+objDom.getValorPorId("DIA");
                }
            
                               
                parent.f_aceptar_axislist008(params);
            }
        }
        
    </script>    
</head> 
        
         <body class=" " onload="f_onload()" onkeypress="if (event.keyCode==13)  { f_but_buscar() }">
    
    <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
                 
<form name="miForm" action="" method="POST">         
    
        <c:import url="../include/titulo_nt.jsp">
                <c:param name="titulo"><axis:alt f="axislist008" c="TITULOMODAL" lit="9901036"/></c:param>     <%-- Buscador de Procesos --%>
                <c:param name="formulario"><axis:alt f="axislist008" c="SUBTITULOMODAL" lit="9901036"/></c:param> <%-- Buscador de Procesos --%>
                <c:param name="form">axislist008</c:param>
        </c:import>
        
        <input type="hidden" name="operation" value=""/>
       
        <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0"> 
        <tr>
                <td>
                    <div class="separador">&nbsp;</div>
                    <div class="titulo">
                    </div>

                    <table class="seccion" align="center">
                        <tr>
                            <td >
                                <table class="area" align="center">
                                    <tr>                                      
                                        <th style="width:23.3%;height:0%;"/>
                                        <th style="width:23.3%;height:0%;"/>
                                        <th style="width:23.3%;height:0%;"/>
                                        <th style="width:15%;height:0%;"/>
                                    </tr>
                                    

         <tr>
                                        <!-- Empresa -->   
                                        <axis:ocultar f="axislist008" c="EMPRESA">
                                        <td class="titulocaja">
                                            <b><axis:alt f="axislist008" c="EMPRESA" lit="101619"/></b>
                                        </td>
                                         </axis:ocultar>
                                        <axis:ocultar f="axislist008" c="PROCESO">
                                        <td class="titulocaja">
                                            <b><axis:alt f="axislist008" c="PROCESO" lit="1000576"/></b>  
                                        </td>
                                        </axis:ocultar>
                                       <axis:ocultar f="axislist008" c="FINICIO">
                                         <td class="titulocaja">
                                            <b><axis:alt f="axislist008" c="FINICIO" lit="9000526"/></b> <%-- F. Inicio --%>
                                        </td>
                                         </axis:ocultar>
                                         
                                         <axis:ocultar f="axislist008" c="ERROR">
                                        <td class="titulocaja">
                                            <b><axis:alt f="axislist008" c="ERROR" lit="9000464"/></b> <%-- Error --%>
                                        </td>
                                        </axis:ocultar>
                                                                               
                                                    
                                    <tr>
                                    <axis:ocultar f="axislist008" c="EMPRESA">
                                        <td class="campocaja">
                                            <select name="EMPRESA" obligatorio="true" id ="EMPRESA" size="1" class="campowidthselect campo campotexto_ob" style="width:250px" onchange="f_cargar_gestores()">
                                                <option value="null"> - <axis:alt f="axislist008" c="COMBONULL" lit="1000348"/> - </option>
                                                <c:forEach var="EMPRESA" items="${EMPRESAS}">
                                                    <option value="${EMPRESA.CEMPRES}"
                                                    <c:if test="${__formdata.EMPRESA != null && EMPRESA.CEMPRES == __formdata.EMPRESA}"> selected </c:if>>
                                                    ${EMPRESA.TEMPRES}</option>
                                                </c:forEach>
                                            </select>
                                        </td> 
                                        </axis:ocultar>
                                        <axis:ocultar f="axislist008" c="PROCESO">
                                        <td class="campocaja">                             
                                            <input type="text" class="campowidthinput campo campotexto" size="15" 
                                            value="${__formdata.SPROCES}" name="SPROCES" id="SPROCES" 
                                            style="width:67%;" title="<axis:alt f="axislist008" c="PROCESO" lit="1000576"/>"
                                            <axis:atr f="axisctr033" c="SPROCES" a="formato=entero"/> />
                                        </td>
                                         </axis:ocultar>
                                         
                                         <axis:ocultar f="axislist008" c="FPROINI">
                                         <td class="campocaja">                             
                                            <input type="text" class="campowidthinput campo campotexto" size="15" 
                                            value="<fmt:formatDate value='${__formdata.FPROINI}' pattern='dd/MM/yyyy'/>" name="FPROINI" id="FPROINI"
                                            style="width:60%;" <axis:atr f="axislist008" c="FPROINI" a="formato=fecha"/>
                                            title="<axis:alt f="axislist008" c="FPROINI" lit="9000526"/>"/><a id="icon_FPROINI" style="vertical-align:middle;"><img 
                                            alt="<axis:alt f="axislist008" c="FPROINI" lit="108341"/>" title="<axis:alt f="axislist008" c="FPROINI" lit="9000526" />" src="images/calendar.gif"/></a>
                                        </td>
                                        </axis:ocultar>
                                        
                                <axis:ocultar f="axislist008" c="ERROR">
                                        <td class="campocaja" colspan="2">
                                            <select name="NERROR" id ="NERROR" size="1" class="campowidthselect campo campotexto_ob" style="width:250px">
                                                <option value="null"> - <axis:alt f="axislist008" c="COMBONULL" lit="1000348"/> - </option>
                                                <c:forEach var="ERROR" items="${ERRORES}">
                                                    <option value="${ERROR.CATRIBU}"
                                                    <c:if test="${__formdata.NERROR != null && ERROR.CATRIBU == __formdata.NERROR}"> selected </c:if>>
                                                    ${ERROR.TATRIBU}</option>
                                                </c:forEach>
                                            </select>
                                        </td> 
                                        </axis:ocultar>
                                        
                                        <td class="titulocaja">
                                            &nbsp;
                                        </td>    
                                    </tr>                     
                                    <tr>
                                        <axis:ocultar f="axislist008" c="GESTOR">
                                          <td class="titulocaja">
                                            <b><axis:alt f="axislist008" c="GESTOR" lit="9000569"/></b>
                                        </td>
                                        </axis:ocultar>
                                        <axis:ocultar f="axislist008" c="FORMATOS">
                                        <td class="titulocaja">
                                            <b><axis:alt f="axislist008" c="FORMATOS" lit="9905788"/></b>
                                        </td>
                                        </axis:ocultar>
                                        
                                        <axis:ocultar f="axislist008" c="ANIO">
                                        <td class="titulocaja">
                                            <b><axis:alt f="axislist008" c="ANIO" lit="101606"/></b>
                                        </td>
                                        </axis:ocultar>
                                        
                                        <axis:ocultar f="axislist008" c="MES">
                                        <td class="titulocaja">
                                            <b><axis:alt f="axislist008" c="MES" lit="9000495"/></b>
                                        </td>
                                        </axis:ocultar>
                                        
                                        <axis:ocultar f="axislist008" c="SEMANA">
                                        <td class="titulocaja">
                                            <b><axis:alt f="axislist008" c="SEMANA" lit="9900972"/></b>
                                        </td>
                                        </axis:ocultar>
                                         
                                        <td class="titulocaja">
                                            &nbsp;
                                        </td>                                        
                                    </tr>
                                    <tr>
                                        <axis:ocultar f="axislist008" c="GESTOR">
                                        <td class="campocaja">
                                            <select name="GESTOR" id ="GESTOR" size="1" class="campowidthselect campo campotexto_ob" style="width:250px" onchange="f_cargar_formatos()">
                                                <option value="null"> - <axis:alt f="axislist008" c="GESTORCombo" lit="1000348"/> - </option>
                                                <c:forEach var="GESTORES" items="${GESTORES}">
                                                    <option value="${GESTORES.TGESTOR}"
                                                    <c:if test="${__formdata.GESTOR != null && GESTORES.TGESTOR == __formdata.GESTOR}"> selected </c:if>>
                                                    ${GESTORES.TNOMBRE}</option>
                                                </c:forEach>
                                            </select>
                                        </td>
                                        </axis:ocultar>
                                        ${__formdata.FORMATO}
                                        <axis:ocultar f="axislist008" c="FORMATO">
                                         <td class="campocaja">
                                            <select name="FORMATO"  id ="FORMATO" size="1" class="campowidthselect campo campotexto_ob" style="width:250px">
                                                <option value="null"> - <axis:alt f="axislist008" c="FORMATOCombo" lit="1000348"/> - </option>
                                                <c:forEach var="FORMATOS" items="${FORMATOS}">
                                                    <option value="${FORMATOS.TFORMAT}"
                                                    <c:if test="${__formdata.FORMATO != null && FORMATOS.TFORMAT == __formdata.FORMATO}"> selected </c:if>>
                                                    ${FORMATOS.TNOMBRE}</option>
                                                </c:forEach>
                                            </select>
                                        </td> 
                                        </axis:ocultar>
                                          <axis:ocultar f="axislist008" c="ANIO">
                                        <td class="campocaja">                             
                                            <input type="text" class="campowidthinput campo campotexto" size="15" 
                                            value="${__formdata.ANIO}" name="ANIO" id="ANIO" maxlength="4"
                                            style="width:67%;" title="<axis:alt f="axislist008" c="ANIO" lit="9000464"/>"
                                            <axis:atr f="axislist008" c="ANIO" a="formato=entero"/> />
                                        </td>
                                        </axis:ocultar>
                                        <axis:ocultar f="axislist008" c="MES">
                                         <td class="campocaja">
                                            <select name="MES"   id ="MES" size="1" class="campowidthselect campo campotexto_ob" style="width:80px">
                                                <option value="null"> - <axis:alt f="axislist009" c="MESCombo"  lit="9000495"/> - </option>
                                                <c:forEach var="MES" items="${MESES}">
                                                    <option value="${MES.CATRIBU}"
                                                    <c:if test="${__formdata.MES != null && MES.CATRIBU == __formdata.MES}"> selected </c:if>>
                                                    ${MES.TATRIBU}</option>
                                                </c:forEach>
                                            </select>
                                        </td> 
                                        </axis:ocultar>
                                        <axis:ocultar f="axislist008" c="DIA">
                                         <td class="campocaja">
                                            <select name="DIA" id ="DIA" size="1" class="campowidthselect campo campotexto_ob" style="width:80px">
                                                <option value="null"> - <axis:alt f="axislist009" c="DIACombo"  lit="9900972"/> - </option>
                                                <c:forEach var="DIA" items="${DIAS}">
                                                    <option value="${DIA.CATRIBU}"
                                                    <c:if test="${__formdata.DIA != null && DIA.CATRIBU == __formdata.DIA}"> selected </c:if>>
                                                    ${DIA.TATRIBU}</option>
                                                </c:forEach>
                                            </select>
                                        </td>
                                        </axis:ocultar>
                                        <td class="titulocaja">
                                            &nbsp;
                                        </td>                                        
                                    </tr>
                                    <tr>
                                        <td class="titulocaja">
                                            <b><axis:alt f="axislist008" c="USUARI" lit="100894"/></b> <%-- USUARI --%>
                                        </td>
                                        <td class="titulocaja">
                                            &nbsp;
                                        </td>                                        
                                       <td class="titulocaja">
                                            &nbsp;
                                        </td>                 
                                        <td class="titulocaja">
                                            &nbsp;
                                        </td>                                        
                                    </tr>
                                    <tr>                              
                                        <td class="campocaja" colspan="2">                                
                                            <input type="text" class="campowidthinput campo campotexto" size="15" 
                                            value="${__formdata.CUSUARI}" name="CUSUARI" id="CUSUARI" 
                                            style="width:67%;" title="<axis:alt f="axislist008" c="USUARI" lit="100894"/>"
                                            <axis:atr f="axislist008" c="CUSUARI" /> />
                                        </td>
                                        <td class="titulocaja">
                                            &nbsp;
                                        </td>                                        
                                        <td class="titulocaja">
                                            &nbsp;
                                        </td>     
                                        <td class="titulocaja">
                                            &nbsp;
                                        </td>                                        
                                    </tr>    
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
                                              

        <c:import url="../include/botonera_nt.jsp">
              <c:param name="f">axislist008</c:param>
              <c:param name="__botones">cancelar,buscar</c:param>
        </c:import>
    
    </form>
    
    <c:import url="../include/mensajes.jsp"/>

    <script type="text/javascript">
        Calendar.setup({
            inputField     :    "FPROINI",     
            ifFormat       :    "%d/%m/%Y",      
            button         :    "icon_FPROINI", 
            singleClick    :    true,
            firstDay       :    1
        });
     </script>

</body>
</html>