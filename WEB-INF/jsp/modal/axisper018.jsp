<%-- 
*  Fichero: axisper018.jsp
*  @author <a href = "mailto:xpastor@csi-ti.com">Xavi Pastor</a>
*
*  Fecha: 23/07/2008
*/
--%>
<%@ page contentType="text/html;charset=windows-1252" errorPage="/WEB-INF/jsp/axiserror.jsp"%>
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


    <script language="Javascript" type="text/javascript">

        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/

        function f_onload_axisper018() {
        	 <c:if test="${ (fn:containsIgnoreCase(header['User-Agent'],'ipad') )   }">
						retocarPAGE_CSS('axisper018');
					</c:if>
            revisarEstilos();
            var grabarOK = '${requestScope.grabarOK}';
            var subpantalla = '${requestScope.subpantalla}';
            
            <% 
            if (request.getAttribute("subpantalla") != null && !"null".equals(request.getAttribute("subpantalla")) && !"".equals(request.getAttribute("subpantalla"))) { 
            %> 
                var subpantalla = '<%=request.getAttribute("subpantalla")%>';  
                objEstilos.toggleDisplay(subpantalla, document.getElementById(subpantalla+"_parent"));  
              <%}%>
                
            if (!objUtiles.estaVacio(grabarOK) && grabarOK == "0")
                    parent.f_aceptar_axisper018();             
                // Se ha grabado correctamente la CCC
                // Cerrar modal y volver a la pantalla padre
           
           var valor = "${__formdata.CSITFAM}";
           if(!objUtiles.estaVacio(valor))
            f_cambiosit(valor);
                
        }
                
        function f_but_aceptar() {
            if (objValidador.validaEntrada()) {
            	NANO = objDom.getValorPorId("NANOselected");
                if (objUtiles.estaVacio(NANO)|| NANO == 'undefined' || NANO < 0){
                    NANO = objDom.getValorPorId("NANO");
                    objDom.setValorPorId("NANOselected", NANO);
                    parent.f_aceptar2_axisper018(NANO);
                }    
            	
            		 
                    objUtiles.ejecutarFormulario("modal_axisper018.do", "grabar", document.axisper018Form, "_self", objJsMessages.jslit_cargando);                    
            }
        }
        function f_cerrar_modal(modal) {
            objUtiles.cerrarModal(modal);
        }
        
        function f_aceptar_axisper019(){
            f_cerrar_modal("axisper019");
            objUtiles.ejecutarFormulario("modal_axisper018.do?subpantalla=descendents", "ActualitzarDisplays", document.axisper018Form, "_self", objJsMessages.jslit_cargando);   
        }
        function f_aceptar_axisper020(){
            f_cerrar_modal("axisper020");
            objUtiles.ejecutarFormulario("modal_axisper018.do?subpantalla=mayores", "ActualitzarDisplays", document.axisper018Form, "_self", objJsMessages.jslit_cargando);   
        }
        
        function f_but_cancelar() {
                parent.f_cerrar_axisper018();                
        }    
        
        function actualitzarCheckbox(obj){
         objDom.setValorPorId(obj.name, ((objDom.getComponenteMarcado(obj))? "1" : "0" ));
        }
        
        function f_abrir_axisper019(NORDEN, FNACIMI, CGRADO, CENTER, FADOPCION){
            NANO = objDom.getValorPorId("NANOselected");
            if (objUtiles.estaVacio(NANO)|| NANO == 'undefined' || NANO < 0){
                NANO = objDom.getValorPorId("NANO");
                objDom.setValorPorId("NANOselected", NANO);
            }
                
            
            param = "&SPERSON="+objDom.getValorPorId("SPERSONselected")+"&CAGENTE="+objDom.getValorPorId("CAGENTEselected")+"&NANOmarcat="+NANO;
           
            if (NORDEN != -1){
            param = param +"&NORDEN="+NORDEN+"&FNACIMI="+FNACIMI+"&CGRADO="+CGRADO+"&CENTER="+CENTER+"&FADOPCION="+FADOPCION; 
            }
            
            objUtiles.abrirModal("axisper019","src","modal_axisper019.do?operation=form"+param,900,300);

        }
        function f_abrir_axisper020(NORDEN, FNACIMI, CGRADO, NVIVEN, CRENTA){
            NANO = objDom.getValorPorId("NANOselected");
            if (objUtiles.estaVacio(NANO)|| NANO == 'undefined' || NANO < 0){
                NANO = objDom.getValorPorId("NANO");
                objDom.setValorPorId("NANOselected", NANO);
            }
            param = "&SPERSON="+objDom.getValorPorId("SPERSONselected")+"&CAGENTE="+objDom.getValorPorId("CAGENTEselected")+"&NANOmarcat="+NANO;
            if (NORDEN != -1){
                param = param +"&NORDEN="+NORDEN+"&FNACIMI="+FNACIMI+"&CGRADO="+CGRADO+"&NVIVEN="+NVIVEN+"&CRENTA="+CRENTA; 
            }
            
            objUtiles.abrirModal("axisper020","src","modal_axisper020.do?operation=form"+param,900,300);
        }        
        function f_borrar_descendientes(NORDEN){
            NANO = objDom.getValorPorId("NANOselected");
            if (objUtiles.estaVacio(NANO)|| NANO == 'undefined' || NANO < 0){
                NANO = objDom.getValorPorId("NANO");
                objDom.setValorPorId("NANOselected", NANO);
            }

            param = "?subpantalla=descendents&NORDEN="+NORDEN;
            objUtiles.ejecutarFormulario("modal_axisper018.do"+param, "eliminarDescen", document.axisper018Form, "_self", objJsMessages.jslit_cargando);   
        }
        function f_borrar_mayores(NORDEN){
            NANO = objDom.getValorPorId("NANOselected");
            if (objUtiles.estaVacio(NANO)|| NANO == 'undefined' || NANO < 0){
                NANO = objDom.getValorPorId("NANO");
                objDom.setValorPorId("NANOselected", NANO);
            }            
            param = "?subpantalla=mayores&NORDEN="+NORDEN;
            objUtiles.ejecutarFormulario("modal_axisper018.do"+param, "eliminarMayor", document.axisper018Form, "_self", objJsMessages.jslit_cargando);           
        }
        
        function f_cambiosit(valor){
            if(valor == 2){
                objDom.setVisibilidadPorId("CCNIFCON","visible");
                objDom.setVisibilidadPorId("TCNIFCON","visible");
                objDom.setVisibilidadPorId("IIPENSION","visible");
                objDom.setVisibilidadPorId("TIPENSION","visible");
                objDom.setDisplayPorId("CCNIFCON","block");
                objDom.setDisplayPorId("TCNIFCON","block");
                objDom.setDisplayPorId("IIPENSION","block");
                objDom.setDisplayPorId("TIPENSION","block");
            }
            else{
                objDom.setVisibilidadPorId("CCNIFCON","hidden");
                objDom.setVisibilidadPorId("TCNIFCON","hidden");
                objDom.setVisibilidadPorId("IIPENSION","hidden");
                objDom.setVisibilidadPorId("TIPENSION","hidden");
                objDom.setDisplayPorId("CCNIFCON","none");
                objDom.setDisplayPorId("TCNIFCON","none");
                objDom.setDisplayPorId("IIPENSION","none");
                objDom.setDisplayPorId("TIPENSION","none");
            }
        
        }
        

    </script>
  
  
  </head>
  <body onload="f_onload_axisper018()">
  	<div id="wrapper" class="wrapper">
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
  
  
 
    <form name="axisper018Form" action="" method="POST">
        <input type="hidden" name="operation" value=""/>
        <input type="hidden" name="SPERSONselected"  value="${__formdata.SPERSONselected}"/>
        <input type="hidden" name="CNORDBAN"  value="${__formdata.CNORDBAN}"/>
        <input type="hidden" name="faceptar" value="${__formdata.faceptar}"/>
        <input type="hidden" name="CAGENTEselected" value="${__formdata.CAGENTEselected}"/>
        <input type="hidden" name="NANOselected" value="${__formdata.NANOselected}"/>

        <c:import url="../include/titulo_nt.jsp">
            <c:param name="formulario"><axis:alt f="axisper018" c="TITULONT" lit="9001275" /></c:param>
            <c:param name="producto"><axis:alt f="axisper018" c="PRODUCTO" lit="9001275" /></c:param>
            <c:param name="form">axisper018</c:param>
        </c:import>
        <c:import url="../include/modal_estandar.jsp">
        <c:param name="titulo"><axis:alt f="axisper018" c="TITULO" lit="9001275" />,&nbsp;<axis:alt f="axisper018" c="TITULO1" lit="9001276" /></c:param>
        <c:param name="nid" value="axisper019" />
        </c:import>   
        <c:import url="../include/modal_estandar.jsp">
        <c:param name="titulo"><axis:alt f="axisper018" c="TITULO2" lit="9001275" />,&nbsp;<axis:alt f="axisper018" c="TITULO3" lit="9001277" /></c:param>
        <c:param name="nid" value="axisper020" />
        </c:import>          


        <!-- Area de campos  -->
        <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0" style="height:130px">
            <div class="separador">&nbsp;</div>
            
            <tr>
                <td>   
                    
                    <!-- Datos IRPF  -->
                    <table class="area">
                        <tr>
                            <th style="width:2%;height:0px"></th>
                            <th style="width:22%;height:0px"></th>
                            <th style="width:22%;height:0px"></th>
                            <th style="width:22%;height:0px"></th>
                            <th style="width:22%;height:0px"></th>                                            
                            <th style="width:8%;height:0px"></th>
                        <tr>
                        <tr>
                            <td class="campocaja" colspan="6">
                                <div style="float:left;">
                                    <b><axis:alt f="axisper018" c="IRPF" lit="9901095"/></b>
                                </div>
                                <div style="clear:both;">
                                    <hr class="titulo">
                                </div>
                            </td>
                        </tr>
                         
                        <tr>
                            <td></td>
                            <td class="titulocaja">
                                <b><axis:alt f="axisper018" c="IRPF1" lit="101606"/></b>
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td class="campocaja"  >                                                        
                                <select name="NANO" <c:if test="${!empty __formdata.NANO}">disabled</c:if> id="NANO" size="1" style="width:40%" class="campowidthselect campo campotexto"
                                        title="<axis:alt f="axisper018" c="NANO" lit="101606"/>"
                                        <axis:atr f="axisper018" c="NANO" a="obligatorio=true"/>>&nbsp;                                                                 
                                        <c:if test="${empty __formdata.NANO}">
                                            <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisper018" c="NANO" lit="1000348"/> - </option>
                                        </c:if>
                                        <c:forEach var="element" items="${__formdata.listValores.lstanys}">
                                            <option value = "${element.NANO}" 
                                                <c:if test="${element.NANO == __formdata.NANO}"> selected </c:if> />
                                                ${element.NANO} 
                                            </option>
                                        </c:forEach>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td class="titulocaja"><b><axis:alt f="axisper018" c="TITULO5" lit="9000879"/></b></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td class="campocaja">
                                <select name="CSITFAM" id="CSITFAM" size="1" style="width:90%" 
                                        class="campowidthselect campo campotexto" onchange="f_cambiosit(this.value)"
                                    <axis:atr f="axisper018" c="CSITFAM" a="modificable=true&isInputText=false"/> 
                                        title="<axis:alt f="axisper018" c="CSITFAM" lit="9000879"/>"
                                        <axis:atr f="axisper012" c="CSITFAM" a="obligatorio=true"/>>&nbsp;
                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisper018" c="CSITFAM" lit="1000348"/> - </option>
                                        <c:forEach var="element" items="${__formdata.listValores.lstsitfam}">
                                            <option value = "${element.CATRIBU}" 
                                                <c:if test="${element.CATRIBU == __formdata.CSITFAM}"> selected </c:if> />
                                                ${element.TATRIBU} 
                                            </option>
                                        </c:forEach>
                                </select>
                            </td>  
                        </tr>  
                        <tr>
                            <td></td>
                            <td class="titulocaja" id="TCNIFCON"><b><axis:alt f="axisper018" c="TCNIFCON" lit="9000880"/></b></td>
                            <td class="titulocaja"><b><axis:alt f="axisper018" c="TCNIFCONVAL" lit="9000882"/></b></td>
                                                                                    
                        </tr> 
                        <tr>
                            <td></td>
                            <td class="campocaja" id="CCNIFCON">
                                <input type="text" name="CNIFCON" id="CNIFCON" value="${__formdata.CNIFCON}"  class="campowidthinput campo campotexto" style="width:95%"
                                    <axis:atr f="axisper018" c="CNIFCON" a="modificable=true"/>/>
                            </td>                                                          
                               
                            <td class="campocaja">
                                <select name="CGRADO" id="CGRADO" <axis:atr f="axisper018" c="CGRADO" a="modificable=true&isInputText=false"/> size="1" style="width:90%"  class="campowidthselect campo campotexto">&nbsp;
                                    <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisper018" c="CGRADO" lit="1000348"/> - </option>
                                    <c:forEach var="element" items="${__formdata.listValores.lstgraumin}">
                                        <option value = "${element.CATRIBU}" 
                                            <c:if test="${element.CATRIBU == __formdata.CGRADO}"> selected </c:if> />
                                            ${element.TATRIBU} 
                                        </option>
                                    </c:forEach>
                                </select>                                                        
                            </td>                                                          
                                                                                      
                        </tr> 
                        <%--
                        <tr>
                            <td></td>
                            <td class="titulocaja" colspan="3"><b><axis:alt f="axisper018" c="CAYUDA" lit="9000884"/></b>
                                <input type="checkbox" name="CAYUDA" onclick="actualitzarCheckbox(this)"   <c:if test="${__formdata.CAYUDA == 1}">checked</c:if> value="${__formdata.CAYUDA}"  
                                        <axis:atr f="axisper018" c="CAYUDA" a="modificable=true"/>/>
                            </td>
                        </tr>    --%>
                        <tr>
                            <td></td>
                            <td class="titulocaja">
                                <b><axis:alt f="axisper018" c="CAYUDA1" lit="9000885"/></b>
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td class="titulocaja" >
                                <input   type="text"  class="campowidthinput campo campotexto" id="FMOVGEO"  style="width:40%" name="FMOVGEO"  
                                            <axis:atr f="axisper018" c="FMOVGEO" a="modificable=true&formato=fecha"/> value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FMOVGEO}"/>"/>                                    
                                            <a style="vertical-align:middle;"><img id="popup_calendario_FMOVGEO" alt="<axis:alt f="axisper018" c="FMOVGEO" lit="9901104"/>" title="<axis:alt f="axisper018" c="FMOVEO" lit="9901104" />" src="images/calendar.gif"/></a> 
                            </td>
                            <td class="titulocaja" colspan="2"><b><axis:alt f="axisper018" c="PROLON" lit="9000886"/></b>
                                <input type="checkbox" name="PROLON" onclick="actualitzarCheckbox(this)"  <c:if test="${__formdata.PROLON == 1}">checked</c:if> 
                                    value="${__formdata.PROLON}"  <axis:atr f="axisper009" c="PROLON" a="modificable=true"/>/>    
                            </td>                                                             
                        </tr>   
                        <tr>
                            <td colspan="6">
                                <table class="area" >                         
                                    <tr>
                                        <td class="campocaja" colspan="6" >
                                            <div class="separador">&nbsp;</div>   
                                            <div style="float:left;">
                                                <img id="descendents_parent" src="images/mes.gif" onclick="objEstilos.toggleDisplay('descendents', this)" style="cursor:pointer"/> 
                                                <b><axis:alt f="axisper018" c="DATOS" lit="9001276"/></b>&nbsp;&nbsp;
                                            </div>
                                            <div style="float:right;">
                                                <a href="javascript:f_abrir_axisper019(-1)"><img border="0" alt="<axis:alt f="axisper018" c="DATOS1" lit="9000422"/>" title="<axis:alt f="axisper018" c="DATOS2" lit="1000615"/>" src="images/new.gif"/></a>
                                            </div>
                                            <div style="clear:both;">
                                                <hr class="titulo">
                                            </div>
                                        </td>
                                    </tr>
                                    <!--  INICIO SECCION CAMPOS **********************************************************  -->
                                    <tr id="descendents_children" style="display:none">                                        
                                        <td>&nbsp;&nbsp;</td>   
                                        <td class="campocaja">
                                            <c:if test="${!empty __formdata.DESCENDIENTES}">
                                                 <div class="displayspace">
                                                    <c:set var="title1"><axis:alt f="axisper018" c="CAMPO1" lit="500102"/></c:set>
                                                    <c:set var="title2"><axis:alt f="axisper018" c="CAMPO2" lit="101606"/></c:set>
                                                    <c:set var="title0"><axis:alt f="axisper018" c="CAMPO3" lit="9000882"/></c:set>
                                                    <c:set var="title3"><axis:alt f="axisper018" c="CAMPO4" lit="9000887"/></c:set>
                                                    <c:set var="title4"><axis:alt f="axisper018" c="CAMPO5" lit="9901108"/></c:set>
                                                    
                                                    <display:table name="${__formdata.DESCENDIENTES}" id="DESCENDIENTES" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" cellpadding="0" cellspacing="0"
                                                               requestURI="axis_axisper009.do?paginar=true&subpantalla=datosgenerales">                                                     
                                                               <%@ include file="../include/displaytag.jsp"%>
                                                               <display:column title="${title1}" sortable="true" style="width:10%;" sortProperty="NORDEN" headerClass="sortable"   media="html" autolink="false" >
                                                                   <div class="dspText">${DESCENDIENTES.OB_IAX_IRPFDESCEN.NORDEN}</div>
                                                               </display:column>
                                                                <display:column title="${title2}" sortable="true" style="width:10%;" sortProperty="NANO" headerClass="sortable"   media="html" autolink="false" >
                                                                   <div class="dspText"><fmt:formatDate pattern="dd/MM/yyyy" value="${DESCENDIENTES.OB_IAX_IRPFDESCEN.FNACIMI}"/></div>
                                                               </display:column>
                                                                <display:column title="${title4}" sortable="true" style="width:10%;" sortProperty="NANO" headerClass="sortable"   media="html" autolink="false" >
                                                                   <div class="dspText"><fmt:formatDate pattern="dd/MM/yyyy" value="${DESCENDIENTES.OB_IAX_IRPFDESCEN.FADOPCION}"/></div>
                                                               </display:column>
                                                               <display:column title="${title0}" sortable="true" style="width:55%;" sortProperty="TGRADO" headerClass="headwidth5 sortable"  media="html" autolink="false" >
                                                                   <div class="dspText">${DESCENDIENTES.OB_IAX_IRPFDESCEN.TGRADO}</div>
                                                               </display:column>
                                                               <display:column title="${title3}" sortable="true" style="width:15%;" sortProperty="CENTER" headerClass="headwidth5 sortable"  media="html" autolink="false" >
                                                                    <div class="dspText" align="center"><input type="checkbox" name="OB_IAX_IRPFDESCEN.CENTER" disabled <c:if test="${DESCENDIENTES.OB_IAX_IRPFDESCEN.CENTER == 1}">checked</c:if> /></div>                                                           
                                                               </display:column>  
                                                                <display:column title="" sortable="false" sortProperty="" style="width:5%;" headerClass="headwidth5 sortable" media="html" autolink="false" >
                                                                    <div class="dspIcons">
                                                                    <a href="javascript:f_abrir_axisper019('${DESCENDIENTES.OB_IAX_IRPFDESCEN.NORDEN}','<fmt:formatDate pattern="dd/MM/yyyy" value="${DESCENDIENTES.OB_IAX_IRPFDESCEN.FNACIMI}"/>','${DESCENDIENTES.OB_IAX_IRPFDESCEN.CGRADO}','${DESCENDIENTES.OB_IAX_IRPFDESCEN.CENTER}','<fmt:formatDate pattern="dd/MM/yyyy" value="${DESCENDIENTES.OB_IAX_IRPFDESCEN.FADOPCION}"/>')">
                                                                    <img border="0" alt="<axis:alt f='axisper018' c='FNACIMI' lit='100002'/> <axis:alt f='axisper018' c='FNACIMI' lit='105889'/>" title="<axis:alt f='axisper018' c='CENTER' lit='100002'/> <axis:alt f='axisper018' c='FADOPCIO' lit='105889'/>" src="images/lapiz.gif"/>
                                                                    </a>
                                                                    </div>
                                                                </display:column>                                    
                                                                <display:column title="" sortable="false" sortProperty="" style="width:5%;" headerClass="headwidth5 sortable" media="html" autolink="false" >
                                                                    <div class="dspIcons">
                                                                    <a href="javascript:f_borrar_descendientes('${DESCENDIENTES.OB_IAX_IRPFDESCEN.NORDEN}')">
                                                                    <img border="0" alt="<axis:alt f='axisper018' c='NORDEN' lit='1000127'/> <axis:alt f='axisper018' c='NOREND1' lit='105889'/>" title="<axis:alt f='axisper018' c='NOREND2' lit='1000127'/> <axis:alt f='axisper018' c='NOREND3' lit='105889'/>" src="images/delete.gif"/></a>
                                                                    </div>
                                                                </display:column>      
                                                    </display:table>
                                                
                                                </div>
                                            </c:if>
                                            <c:if test="${empty __formdata.DESCENDIENTES}">
                                                <b><axis:alt f="axisper018" c="DATOS5" lit="120135"/></b>
                                            </c:if>                                      
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        
                        
                        <tr>
                            <td colspan="6">
                            <table class="area" >                         
                                <tr>
                                    <td class="campocaja" colspan="6" >
                                            <div class="separador">&nbsp;</div>   
                                            <div style="float:left;">
                                                <img id="mayores_parent" src="images/mes.gif" onclick="objEstilos.toggleDisplay('mayores', this)" style="cursor:pointer"/> 
                                                <b><axis:alt f="axisper018" c="MAYORES" lit="9001277"/></b>&nbsp;&nbsp;
                                            </div>
                                            <div style="float:right;">
                                                <a href="javascript:f_abrir_axisper020(-1)"><img border="0" alt="<axis:alt f="axisper018" c="DATOS6" lit="9000422"/>" title="<axis:alt f="axisper018" c="DATOS7" lit="1000615"/>" src="images/new.gif"/></a>
                                            </div>
                                            <div style="clear:both;">
                                                <hr class="titulo">
                                            </div>
                                    </td>
                                </tr>
                                <!--  INICIO SECCION CAMPOS **********************************************************  -->
                                <tr id="mayores_children" style="display:none">
                                    <td>&nbsp;&nbsp;</td>           
                                    <td class="campocaja" > 
                                        <c:if test="${!empty __formdata.MAYORES}">
                                                <div class="displayspace">
                                                    <c:set var="title1"><axis:alt f="axisper018" c="MAYORES1" lit="500102"/></c:set>
                                                    <c:set var="title2"><axis:alt f="axisper018" c="MAYORES2" lit="101606"/></c:set>
                                                    <c:set var="title0"><axis:alt f="axisper018" c="MAYORES3" lit="9000882"/></c:set>
                                                    <c:set var="title3"><axis:alt f="axisper018" c="MAYORES4" lit="9000889"/></c:set>
                                                    <c:set var="title4"><axis:alt f="axisper018" c="MAYORES5" lit="9000890"/></c:set>
                                                    
                                                     <display:table name="${__formdata.MAYORES}" id="MAYORES" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" cellpadding="0" cellspacing="0"
                                                               requestURI="axis_axisper018.do?paginar=true&subpantalla=datosgenerales">                                                     
                                                               <%@ include file="../include/displaytag.jsp"%>
                                                        <display:column title="${title1}" sortable="true" style="width:10%;" sortProperty="NORDEN" headerClass="sortable"   media="html" autolink="false" >
                                                            <div class="dspText">${MAYORES.OB_IAX_IRPFMAYORES.NORDEN}</div>
                                                        </display:column>
                                                        <display:column title="${title2}" sortable="true" style="width:10%;" sortProperty="NANO" headerClass="sortable"   media="html" autolink="false" >
                                                            <div class="dspText"><fmt:formatDate pattern="dd/MM/yyyy" value="${MAYORES.OB_IAX_IRPFMAYORES.FNACIMI}"/></div>
                                                        </display:column>
                                                        <display:column title="${title0}" sortable="true" style="width:45%;" sortProperty="TGRADO" headerClass="headwidth5 sortable"  media="html" autolink="false" >
                                                            <div class="dspText">${MAYORES.OB_IAX_IRPFMAYORES.TGRADO}</div>
                                                        </display:column>
                                                        <display:column title="${title3}" sortable="true" style="width:10%;" sortProperty="NVIVEN" headerClass="headwidth5 sortable"  media="html" autolink="false" >
                                                            <div class="dspText" align="center"><input type="checkbox" name="OB_IAX_IRPFMAYORES.NVIVEN" disabled <c:if test="${MAYORES.OB_IAX_IRPFMAYORES.NVIVEN == 1}">checked</c:if> /></div>
                                                        </display:column> 
                                                        <display:column title="${title4}" sortable="true" style="width:15%;" sortProperty="CRENTA" headerClass="headwidth5 sortable"  media="html" autolink="false" >
                                                            <div class="dspText" align="center"><input type="checkbox" name="OB_IAX_IRPFMAYORES.CRENTA" disabled <c:if test="${MAYORES.OB_IAX_IRPFMAYORES.CRENTA == 1}">checked</c:if> /></div>
                                                        </display:column>         
                                                        <display:column title="" sortable="false" sortProperty="" style="width:5%;" headerClass="headwidth5 sortable" media="html" autolink="false" >
                                                            <div class="dspIcons">
                                                                <a href="javascript:f_abrir_axisper020('${MAYORES.OB_IAX_IRPFMAYORES.NORDEN}','<fmt:formatDate pattern="dd/MM/yyyy" value="${MAYORES.OB_IAX_IRPFMAYORES.FNACIMI}"/>','${MAYORES.OB_IAX_IRPFMAYORES.CGRADO}','${MAYORES.OB_IAX_IRPFMAYORES.NVIVEN}','${MAYORES.OB_IAX_IRPFMAYORES.CRENTA}')">
                                                                <img border="0" alt="<axis:alt f='axisper018' c='NOREN6' lit='100002'/> <axis:alt f='axisper018' c='FNACIMI' lit='105889'/>" title="<axis:alt f='axisper018' c='CGRADO' lit='100002'/> <axis:alt f='axisper018' c='NVIVEN' lit='105889'/>" src="images/lapiz.gif"/>
                                                                </a>
                                                            </div>
                                                        </display:column>                                    
                                                        <display:column title="" sortable="false" sortProperty="" style="width:5%;" headerClass="headwidth5 sortable" media="html" autolink="false" >
                                                            <div class="dspIcons">
                                                                <a href="javascript:f_borrar_mayores('${MAYORES.OB_IAX_IRPFMAYORES.NORDEN}')">
                                                                    <img border="0" alt="<axis:alt f='axisper018' c='NOREN11' lit='1000127'/> <axis:alt f='axisper018' c='FNACIMI1' lit='105889'/>" title="<axis:alt f='axisper018' c='NVIVEN1' lit='1000127'/> <axis:alt f='axisper018' c='CRENTA1' lit='105889'/>" src="images/delete.gif"/></a>
                                                            </div>
                                                        </display:column>                                                      
                                                    </display:table>    
                                                    </div>
                                              
                                        </c:if>
                                        <c:if test="${empty __formdata.MAYORES}">
                                            <b><axis:alt f="axisper018" c="DATOS15" lit="120135"/></b>
                                        </c:if>
                                    </td>
                                </tr>
                            </table>
                            </td>
                        </tr>
                        
                        <tr>
                            <td class="campocaja" colspan="6">
                                <div style="float:left;">
                                    <b><axis:alt f="axisper018" c="DATOS16" lit="9901097"/></b>
                                </div>
                                <div style="clear:both;">
                                    <hr class="titulo">
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td class="titulocaja" id="TIPENSION"><b ><axis:alt f="axisper018" c="TIPENSION" lit="9000881"/></b></td>
                            <td class="titulocaja"><b><axis:alt f="axisper018" c="TIPENSION" lit="9000883"/></b></td> 
                        </tr>
                        <tr>
                           <td></td> 
                           <td class="campocaja" id="IIPENSION">
                                <input type="text" name="IPENSION" id="IPENSION" value="${__formdata.IPENSION}"  class="campowidthinput campo campotexto" style="width:30%"
                                    <axis:atr f="axisper018" c="IPENSION" a="modificable=true"/>/>
                            
                            </td>
                            <td class="campocaja">
                                <input type="text" name="IANUHIJOS" value="${__formdata.IANUHIJOS}"  class="campowidthinput campo campotexto" style="width:30%"
                                    <axis:atr f="axisper018" c="IANUHIJOS" a="modificable=true"/>/>
                            </td> 
                        </tr>
                        <tr>
                            <td class="campocaja" colspan="6">
                                <div style="float:left;">
                                    <b><axis:alt f="axisper018" c="IANUHIJOS" lit="9901098"/></b>
                                </div>
                                <div style="clear:both;">
                                    <hr class="titulo">
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td class="titulocaja" colspan="4"><b><axis:alt f="axisper018" c="CPAGO" lit="9901099"/></b>
                                <input type="checkbox" name="CPAGO" id="CPAGO" onclick="actualitzarCheckbox(this)"  <c:if test="${__formdata.CPAGO == 1}">checked</c:if> value="${__formdata.CPAGO}"  
                                        <axis:atr f="axisper018" c="CPAGO" a="modificable=true"/>/>
                            </td>
                        </tr>
                    
                    </table> 
                    </td> 
                </tr>      
            </table>                                    
        <!-- ************************* FIN DATOS IRPF  ********************* -->     			
        <script type="text/javascript">
            Calendar.setup({
                inputField     :    "FMOVGEO",     
                ifFormat       :    "%d/%m/%Y",      
                button         :    "popup_calendario_FMOVGEO", 
                singleClick    :    true,
                firstDay       :    1
            });
        </script>
        <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisper018</c:param><c:param name="f">axisper018</c:param>
            <c:param name="__botones">cancelar,aceptar</c:param>
        </c:import>
    </form>

    <c:import url="../include/mensajes.jsp" />
</div>
    </body>
</html>


