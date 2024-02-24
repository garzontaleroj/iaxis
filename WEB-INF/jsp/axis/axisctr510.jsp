<%/**
*  Fichero: axisctr510.jsp
*  @author <a href="mailto:cj.mesa@tcs.com">Carlos Javier MEsa R.</a>
*   
*  Modal - Calcula Traslado de vigencias
*
*  Fecha: 12/04/2019
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
	
	    <!--********** CALENDARIO ************************* -->
		<!-- Hoja de estilo del Calendario -->
		<link rel="stylesheet" type="text/css" media="all" href="styles/calendar-green.css" title="green" />
		<!-- Script principal del calendario -->
		<script type="text/javascript" src="scripts/calendar.js"></script>
		<!-- Idioma del calendario, en función del Locale -->
		<script type="text/javascript" src="scripts/calendar-${sessionScope.__locale}.js"></script>
		<!-- Setup del calendario -->
		<script type="text/javascript" src="scripts/calendar-setup.js"></script>
		<script type="text/javascript" src="scripts/jsFecha.js"></script>
		<c:import url="../include/carga_framework_js.jsp" />
	    <!--*********************************** -->
	
		<script language="Javascript" type="text/javascript">
	
	    function f_onload() {
	        f_cargar_propiedades_pantalla();
	        //var value = document.getElementById("FECHAINICIO").value;
	        //var myDate = value.replace("_", "");
	        //objDom.setValorPorId("FEFECTO", myDate);
	    }
	    
	    function f_but_cancelar() {
        	objDom.setValorPorId("FORM_ACT", "axisctr510");
	        objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axisctr510", "cancelar", document.axisctr510Form, "_self");
	    }        
	    
	    function f_but_siguiente() {
	        if (!objUtiles.estaVacio(document.getElementById("FEFETRASVIG").value)){
	        	objDom.setValorPorId("FORM_ACT", "axisctr510");
	        	objUtiles.ejecutarFormulario ("axis_axisctr510.do", "siguiente", document.axisctr510Form, "_self", objJsMessages.jslit_cargando);
	        }
	    }    
	    
	    function isNumberKey(evt)
	    {
	        var charCode = (evt.which) ? evt.which : event.keyCode
	        if (charCode > 31 && (charCode < 48 || charCode > 57))
	            return false; 
	         return true;
	    }
	    
	    function isNumberKey(evt)
	    {
	        var charCode = (evt.which) ? evt.which : event.keyCode
	        if (charCode > 31 && (charCode < 48 || charCode > 57))
	            return false; 
	         return true;
	    }
	    
	    function sumarFecha()
	    {  
	        var objFecha = new JsFecha();
	        var myDate = new Date(objFecha.stringToDate(document.getElementById("FEFECTO").value));
	        
	        myDate.setDate(myDate.getDate() + Number(document.getElementById("NDIAS").value));
	        myDate.setMonth(myDate.getMonth() + (Number(document.getElementById("NMESES").value)));
	        myDate.setFullYear(myDate.getFullYear() + Number(document.getElementById("NAÑOS").value));
	        
	        objDom.setValorPorId("FEFETRASVIG", objFecha.formateaFecha(myDate.getDate() + "/" + (myDate.getMonth() + 1) + "/" + myDate.getFullYear()));
	    }    
	    /* Added for BACK (anterior) button (IAXIS-4321) PK-18/06/2019 Start */
        function f_but_anterior() {	    
            objUtiles.ejecutarFormulario("axis_axisctr510.do", "anterior", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
        /* Added for BACK (anterior) button (IAXIS-4321) PK-18/06/2019 End */
	
		</script>
	</head>
	
	<body class=" " onload="f_onload()">
	    <c:import url="../include/precargador_ajax.jsp">
			<c:param name="imagen" value="images/ajax-loader.gif"/>
	    </c:import>
	    <form name="axisctr510Form" action="" method="POST">
	        <input type="hidden" name="operation" value=""/>
	        <input type="hidden" name="FORM_ACT" id="FORM_ACT" value="${__formdata.FORM_ACT}"/>
	        <input type="hidden" id="CAMPO" name="CAMPO" value="${__formdata.CAMPO}"/>
	        <input type="hidden" id="FECHAINICIO" name="FECHAINICIO" value="${__formdata.FECHAINICIO}"/>

	        <c:import url="../include/titulo_nt.jsp">
	            <c:param name="formulario"> <axis:alt f="axisctr010" c="TITULOPANTA" lit="9909216"/> </c:param>
	            <c:param name="producto"> <axis:alt f="axisctr010" c="TITULOPANTA" lit="9909216"/> </c:param>
	            <c:param name="form"> axisctr510 </c:param>
	        </c:import>
        
			<table class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
				<tr>
					<td>                    
						<table class="seccion">
							<tr>
								<div class="titulo">
									<img src="images/flecha.gif"/>
									<axis:alt f="axisctr510" c="LIT_1000096" lit="1000096" />
								</div>
							</tr>
                        
							<td align="left">
								<table class="area" align="center">
	                                <tr>
	                                    <th style="width:15%;height:0px"></th>
	                                    <th style="width:5%;height:0px"></th>
	                                    <th style="width:5%;height:0px"></th>
	                                    <th style="width:5%;height:0px"></th>
	                                    <th style="width:70%;height:0px"></th>
	                                </tr>
                                
	                                <tr>                                    
	                                    <axis:ocultar f="axisctr510" c="FEFECTO" >
	                                        <td class="titulocaja" style="white-space:nowrap">
	                                            <b id="label_FEFECTO" align="right">
	                                            	<axis:alt f="axisctr510" c="LIT_9905745" lit="9905745" />
	                                            </b>
	                                        </td>                                          
	                                    </axis:ocultar>
	                                        
	                                    <axis:ocultar f="axisctr510" c="NDIAS"  >
	                                        <td class="titulocaja" style="white-space:nowrap">
	                                            <b id="label_PEJECUCION">
	                                            	<axis:alt f="axisctr510" c="LIT_9906429" lit="9906429" />
	                                            </b>
	                                        </td>
	                                    </axis:ocultar>
	
	                                    <axis:ocultar f="axisctr510" c="NMESES"  >
	                                        <td class="titulocaja" style="white-space:nowrap">
	                                            <b id="label_PEJECUCION">
	                                            	<axis:alt f="axisctr510" c="LIT_9000496" lit="9000496" />
	                                            </b>
	                                        </td>
	                                    </axis:ocultar>
	
	                                    <axis:ocultar f="axisctr510" c="NAÑOS"  >
	                                        <td class="titulocaja" style="white-space:nowrap">
	                                            <b id="label_PEJECUCION">
	                                            	<axis:alt f="axisctr510" c="LIT_9901109" lit="9901109" />
	                                            </b>
	                                        </td>
	                                    </axis:ocultar>
	                                </tr>
                                
	                                <tr>
	                                    <axis:ocultar f="axisctr510" c="FEFECTO" >
	                                        <td class="campocaja"  style="white-space:nowrap">
	                                            <!--<c:set var="FEFECTO">
	                                            	<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FEFECTO}"/>
	                                            </c:set>-->
	                                            <input id="FEFECTO" name="FEFECTO" type="text" style="width:80px" maxlength="10" onchange="f_actualitza_fvencim(this);" class="campowidthinput campo campotexto"
	                                            	size="15" <axis:atr f="axisctr510" c="FEFECTO" a="modificable=false&obligatorio=true"/>
	                                            	value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FEFECTO}"/>" title="<axis:alt f="axisctr510" c="LIT_9905745" lit="9905745"/>"
	                                            />
	                                        </td>
	                                    </axis:ocultar>
	                                    
	                                   <axis:ocultar f="axisctr510" c="NDIAS" >
	                                        <td class="campocaja">
	                                            <input id="NDIAS" name="NDIAS" type="text" style="width:80%" class="campowidthinput campo campotexto" onchange="sumarFecha()" onkeypress="return isNumberKey(event)" 
	                                            	title="<axis:alt f="axisctr510" c="LIT_9906429" lit="9906429"/>" size="15" <axis:atr f="axisctr510" c="NDIAS" a="modificable=true&obligatorio=false&formato=entero"/>  
	                                            	value ="${__formdata.NDIAS}" 
	                                            />&nbsp;
	                                        </td>
	                                    </axis:ocultar>
										
	                                   <axis:ocultar f="axisctr510" c="NMESES" >
	                                        <td class="campocaja">
	                                            <input id="NMESES" name="NMESES" type="text" style="width:80%" class="campowidthinput campo campotexto" onchange="sumarFecha()" onkeypress="return isNumberKey(event)" 
	                                            	title="<axis:alt f="axisctr510" c="LIT_9000496" lit="9000496"/>" size="15" <axis:atr f="axisctr510" c="NMESES" a="modificable=true&obligatorio=false&formato=entero"/>
	                                            	value="${__formdata.NMESES}"
	                                            />&nbsp;
	                                        </td>
	                                    </axis:ocultar>
										
	                                   <axis:ocultar f="axisctr510" c="NAÑOS" >
	                                        <td class="campocaja">
	                                            <input id="NAÑOS" name="NAÑOS" type="text" style="width:80%" class="campowidthinput campo campotexto" onchange="sumarFecha()" onkeypress="return isNumberKey(event)" 
	                                            	title="<axis:alt f="axisctr510" c="LIT_9901109" lit="9901109"/>" size="15" <axis:atr f="axisctr510" c="NAÑOS" a="modificable=true&obligatorio=false&formato=entero"/>
	                                            	value="${__formdata.NAÑOS}"
	                                            />&nbsp;
	                                        </td>
	                                    </axis:ocultar>                                    
	                                </tr>
                                
	                                <tr>
	                                    <td class="titulocaja" style="white-space:nowrap">
	                                        <axis:ocultar f="axisctr510" c="FEFETRASVIG" >
	                                            <b id="label_FEFETRASVIG">
	                                            	<axis:alt f="axisctr510" c="LIT_89906264" lit="89906264" />
	                                            </b>
	                                        </axis:ocultar>
	                                    </td>
	                                </tr>
                                
	                                <tr>
	                                    <axis:ocultar f="axisctr510" c="FEFETRASVIG" >
	                                        <td class="campocaja"  style="white-space:nowrap"> 
	                                            <!--<c:set var="FEFETRASVIG">
	                                            	<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FEFETRASVIG}"/>
	                                            </c:set>-->
	                                            <input style="width:80px" maxlength="10" type="text" class="campowidthinput campo campotexto" id="FEFETRASVIG" name="FEFETRASVIG" size="15"
		                                            <axis:atr f="axisctr510" c="FEFETRASVIG" a="modificable=false&obligatorio=true&formato=fecha"/>
		                                            value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FEFETRASVIG}"/>" title="<axis:alt f="axisctr510" c="LIT_89906264" lit="89906264"/>" 
												/>
		                                        <a id="icon_FEFETRASVIG" style="vertical-align:middle;" >
		                                        	<img src="images/calendar.gif" border="0" alt="<axis:alt f="axisctr510" c="FEFETRASVIG" lit="89906264"/>" title="<axis:alt f="axisctr510" c="FEFETRASVIG" lit="89906264" />" />
		                                        </a>
	                                        </td>
	                                    </axis:ocultar>
	                                </tr>
                            	</table>
                        	</td>
                    	</table>
                	</td>
            	</tr>
        	</table>
        
        	<!-- Added for BACK (anterior) button (IAXIS-4321) PK-18/06/2019 -->
            <c:import url="../include/botonera_nt.jsp">
                <c:param name="f">axisctr510</c:param>
                <c:param name="__botones">cancelar,anterior,siguiente</c:param>
            </c:import>
            
			<script type="text/javascript">
				Calendar.setup({
				    inputField	:	"FEFETRASVIG",     
				    ifFormat	:	"%d/%m/%Y",      
				    button		:	"icon_FEFETRASVIG", 
				    singleClick	:	true,
				    firstDay	:	1
				});
			</script>
			
    	</form>
    
		<c:import url="../include/mensajes.jsp" />

	</body>
</html>