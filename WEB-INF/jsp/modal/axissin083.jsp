<%/* Revision:# viuKoNnyC3HvZxDIYCiaOg== # */%>
<%/*
*  Fichero: axissin083.jsp
  
*  Titulo: Modal guardar informacion de siniestro maxima perdida probable, riesgo y contingencia
*
*  Fecha: 03/03/2009
*/
%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ page import="java.util.*" %>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>
<%@ page contentType="text/html;charset=iso-8859-15" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
    <title><axis:alt f="axissin083" c="TITULO" lit="89906303"/></title>
    <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
    <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
    <link rel="stylesheet" href="styles/displaytag.css">
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
    <c:import url="../include/carga_framework_js.jsp"/>
    <script type="text/javascript">
        function f_onload() { 
        	var val1 = "<%=request.getAttribute("OK")%>";
        	 if (val1=="OK"){
			alert('Registro guardado con Exito');
			f_but_cancelar();
             }
        	 
        	 var NSINIES = "${__formdata.NSINIES}";
             objDom.setValorPorId("NSINIES",NSINIES);
            f_cargar_propiedades_pantalla();
        }
             
        
        function f_but_guardar(){
        	objUtiles.ejecutarFormulario("modal_axissin083.do", "guardar", document.miForm, "_self", objJsMessages.jslit_cargando);   
        }
        
        function f_but_cancelar(){
        	parent.f_but_cerrar_axissin083();
        }

        function ocultarNFallo(){
                f_cargar_propiedades_pantalla();
                if(document.miForm.NINSTPROC.value==3||document.miForm.NINSTPROC.value==4){
                	document.miForm.NFALLOCP.value=-2147483648;  
                	document.getElementById('td_NFALLOCP').style.display='none';
                	document.getElementById('td_NFALLOCP2').style.display='none';
                }else{
                	document.miForm.NFALLOCP.style.display='';
                	document.getElementById('td_NFALLOCP').style.display='';
                	document.getElementById('td_NFALLOCP2').style.display='';
                }
                
        }
      
            
    </script>
</head>
<body onload="javascript:f_onload()">
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
    <form name="miForm" id="miForm" action="modal_axissin083.do" method="POST">
    <input type="hidden" id="MODIFICACION" name="MODIFICACION" value="${__formdata.MODIFICACION}"/>
    <input type="hidden" name="operation" value="guardar" />   
    <c:import url="../include/titulo_nt.jsp">
        <c:param name="titulo"><axis:alt f="axissin083" c="TITULO" lit="89906303"/></c:param>
        <c:param name="formulario"><axis:alt f="axissin083" c="TITULO" lit="89906303"/></c:param>
        <c:param name="form">axissin083</c:param>
    </c:import>
    <div class="separador">&nbsp;</div>
    <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
        <tr>
            <td>
               <table class="seccion">
                    <tr>
                        <th style="width:25%;height:0px"></th>
                        <th style="width:25%;height:0px"></th>
                        <th style="width:25%;height:0px"></th>
                        <th style="width:25%;height:0px"></th>
                    </tr>
                    <tr>
                      <axis:visible c="NSINIES" f="axissin083">  
                    	<td class="titulocaja">
                                   <b><axis:alt f="axissin083" c="NSINIES" lit="101298"/></b>
                        </td>
                         </axis:visible>
                         
                         <axis:visible c="NTRAMIT" f="axissin083">  
                        <td class="titulocaja">
                            <b><axis:alt f="axissin083" c="NTRAMIT" lit="9000908"/></b><!-- tramitacion -->
                        </td>
                         </axis:visible>
                         
                         <axis:visible c="NMOVIMI" f="axissin083">  
                        <td class="titulocaja">
                            <b><axis:alt f="axissin083" c="NMOVIMI" lit="9001868"/></b><!-- MOVIMIENTO  -->
                        </td> 
                         </axis:visible>
                         <axis:visible c="NCLASEPRO" f="axissin083">                            
                        <td class="titulocaja">
                            <b><axis:alt f="axissin083" c="NCLASEPRO" lit="89908020"/></b><!-- Clase de proceso -->
                        </td>
                        </axis:visible> 
<axis:visible c="NINSTPROC" f="axissin083">                            
                        <td class="titulocaja">
                            <b><axis:alt f="axissin083" c="NINSTPROC" lit="89908021"/></b><!-- Instancia del Proceso -->
                        </td>
                        </axis:visible>
                   </tr>
                    
                    <tr>
                       <axis:visible c="NSINIES" f="axissin083">     
                                <td class="campocaja">
                                    <input type="text" <axis:atr f="axissin083" c="NSINIES" a="modificable=false"/>  class="campowidthinput campo campotexto"  style="width:90%"  name="NSINIES" id="NSINIES"   formato="entero"
                                    value="${__formdata.NSINIES}" title='<axis:alt f="axissin083" c="SINIESTRO" lit="101298"/>'/>
                                </td>
                        </axis:visible>
                        
                         <axis:visible c="NTRAMIT" f="axissin083">        
                        <td class="campocaja">
                         <input type="text" <axis:atr f="axissin083" c="NTRAMIT" a="modificable=false"/>  name="NTRAMIT" value="${__formdata.NTRAMIT}" class="campodisabled campo campotexto" style="width:90%"/>
			            </td>
			             </axis:visible>  
			            
			            <axis:visible c="NMOVIMI" f="axissin083">    
                        <td class="campocaja">
                         <input type="text" name="NMOVIMI" value="${__formdata.NMOVIMI}" class="campodisabled campo campotexto" style="width:90%"/>    
                  	    </axis:visible>
                  	    <!-- Clase de proceso -->
                      <axis:visible f="axissin083" c="NCLASEPRO" >
                         <td class="campocaja">
                            <select name = "NCLASEPRO" id ="NCLASEPRO" size="1"  class="campowidthselect campo campotexto" style="width:90%"
                           	title="<axis:alt f="axissin083" c="NCLASEPRO" lit="89908020"/>"  >                                                    
                                <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axissin083" c="C_NCLASEPRO" lit="1000348"/> - </option>
                               		<c:forEach var="ITEM" items="${__formdata.listvalores.clase_proceso}">
                                   		 <option value = "${ITEM.CATRIBU}" 
                                    		<c:if test="${ITEM.CATRIBU == __formdata.NCLASEPRO}">selected</c:if>>
                                             ${ITEM.TATRIBU}
                                 		</option>
                               	   </c:forEach>
                            </select>
                         </td>
                        </axis:visible> 
<!-- Instancia del Proceso -->
                      <axis:visible f="axissin083" c="NINSTPROC" >
                         <td class="campocaja">
                            <select name = "NINSTPROC" id ="NINSTPROC" size="1"  onchange="javascript:ocultarNFallo();"  class="campowidthselect campo campotexto" style="width:90%"
                           	title="<axis:alt f="axissin083" c="NINSTPROC" lit="89908021"/>">                                                    
                                <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axissin083" c="C_NINSTPROC" lit="1000348"/> - </option>
                               		<c:forEach var="ITEM" items="${__formdata.listvalores.instancia_proceso}">
                                   		 <option value = "${ITEM.CATRIBU}" 
                                    		<c:if test="${ITEM.CATRIBU == __formdata.NINSTPROC}">selected</c:if>>
                                             ${ITEM.TATRIBU}
                                 		</option>
                               	   </c:forEach>
                            </select>
                         </td>
                        </axis:visible> 
                  	    
                    </tr>
                    <tr>
                   
                            
 
                        <axis:ocultar c="NFALLOCP" f="axissin083" dejarHueco="false">
				                      <td class="titulocaja" id="td_NFALLOCP" colspan="1">
				                            <b id="label_NFALLOCP"><axis:alt f="axissin083" c="NFALLOCP" lit="89908022"/></b><!-- Fallo -->
				                      </td>
				                </axis:ocultar>  
                        
                        <axis:ocultar f="axissin083" c="FCONTINGEN" dejarHueco="false"> 
		                            <td class="titulocaja">
		                                <b><axis:alt f="axissin083" c="FCONTINGEN_LIT" lit="89908024"/></b><!-- Fecha -->
		                            </td>
		                       </axis:ocultar>
		                       
		                       
                    </tr>
                    
                     <tr>
                     <!-- Fallo -->
                        
                      <axis:visible f="axissin083" c="NFALLOCP" >
                         <td class="campocaja" id="td_NFALLOCP2" colspan="1">
                            <select name = "NFALLOCP" id ="NFALLOCP" size="1"  class="campowidthselect campo campotexto" style="width:90%"
                           	title="<axis:alt f="axissin083" c="NFALLOCP" lit="89908022"/>">                                                    
                                <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axissin083" c="C_NFALLOCP" lit="1000348"/> - </option>
                               		<c:forEach var="ITEM" items="${__formdata.listvalores.contingencia_fallo}">
                                   		 <option value = "${ITEM.CATRIBU}" 
                                    		<c:if test="${ITEM.CATRIBU == __formdata.NFALLOCP}">selected</c:if>>
                                             ${ITEM.TATRIBU}
                                 		</option>
                               	   </c:forEach>
                            </select>
                         </td>
                        </axis:visible>
                        
                        <!-- Fecha -->
<axis:ocultar f="axissin083" c="FCONTINGEN" dejarHueco="false"> 
		                            <td class="campocaja">
		                             	<input   type="text"  class="campowidthinput campo" id="FCONTINGEN"  style="width:65%" name="FCONTINGEN" onblur="javascript:f_actData(this)"
                                	 	<axis:atr f="axissin083" c="FCONTINGEN" /> value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FCONTINGEN}"/>"
                                				  title="<axis:alt f="axissin083" c="FCONTINGEN" lit="89908024"/>"/>                                    
                                		<a style="vertical-align:middle;"><img id="popup_calendario_FCONTINGEN" alt="<axis:alt f="axissin083" c="popup_calendario_FCONTINGEN" lit="89908024"/>" title="<axis:alt f="axissin083" c="popup_calendario_FCONTINGEN" lit="89908024" />" src="images/calendar.gif"/></a>                            
		                            </td>
		                        </axis:ocultar>
		                        
                    </tr>
                    <tr>
		                        <td class="titulocaja">
		                            <b><axis:alt c="TOBSFALLO" f="axissin083" lit="89908027" /></b><!-- Observación de Fallo -->
		                        </td>
		                    </tr>
		                    <tr>
		                        <!-- Observación de Fallo -->
<td colspan="6" style="width:100%;" class="campocaja">
		                            <axis:ocultar c="TOBSFALLO" f="axissin083" dejarHueco="false">
		                            <textarea maxlength="1000" class="campowidthinput campo campotexto" style="width:100%;" rows="3"  name="TOBSFALLO" id="TOBSFALLO">${__formdata.TOBSFALLO}</textarea>
		                            </axis:ocultar>
		                        </td>
		                    </tr>
	        </table>
		                    <div class="separador">&nbsp;</div>
                    <div class="titulo"> 
	                                        <img  src="images/flecha.gif"/>
	                                        <axis:alt c="flecha" f="axissin070" lit="89908035" /> 
	                                    </div> 
								<div class="separador">&nbsp;</div>		
										
			<table class="seccion">
                    <tr>
                        <axis:visible c="NMAXPP" f="axissin083">                                     
                        <td class="titulocaja">
                            <b><axis:alt f="axissin083" c="NMAXPP" lit="89906302"/></b><!-- MAXIMA PERDIDA pROBABLE --> 
                        </td>
                         </axis:visible>
                        
                        <axis:visible c="NCONTIN" f="axissin083">                            
                        <td class="titulocaja">
                            <b><axis:alt f="axissin083" c="NCONTIN" lit="9909237"/></b><!-- CONTINGENCIA -->
                        </td>
                        </axis:visible> 
                        
                        <axis:visible c="NCAUSA" f="axissin083">  
                        <td class="titulocaja">
                            <b><axis:alt f="axissin083" c="NCAUSA" lit="180580"/></b><!-- causa -->
                        </td> 
                         </axis:visible> 
<axis:visible c="NCALMOT" f="axissin083">                            
                        <td class="titulocaja">
                            <b><axis:alt f="axissin083" c="NCALMOT" lit="89908023"/></b><!-- Calificación Motivos -->
                        </td>
                        </axis:visible> 
                                               
                    </tr>
                    
                    <tr>               
                  
                        <!-- Maxima Perdida Probable -->
                     <td class="campocaja">
                         <input type="text" name="NMAXPP"  id="NMAXPP" 
                         value="<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${__formdata.NMAXPP}"/>"
                         class="campowidthinput campo campotexto" style="width:90%"/>                
                    </td>
                  
                         
                        <!-- contingencia -->
                      <axis:visible f="axissin083" c="NCONTIN" >
                         <td class="campocaja">
                            <select name = "NCONTIN" id ="NCONTIN" size="1"  class="campowidthselect campo campotexto" style="width:90%"
                           	title="<axis:alt f="axissin083" c="NCONTIN" lit="9909237"/>">                                                    
                                <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axissin083" c="C_NCONTIN" lit="1000348"/> - </option>
                               		<c:forEach var="ITEM" items="${__formdata.listvalores.tipo_contin}">
                                   		 <option value = "${ITEM.CATRIBU}" 
                                    		<c:if test="${ITEM.CATRIBU == __formdata.NCONTIN}">selected</c:if>>
                                             ${ITEM.TATRIBU}
                                 		</option>
                               	   </c:forEach>
                            </select>
                         </td>
                        </axis:visible> 
                           
                                   
                        <!-- RIESGO -->
                        <axis:visible c="NCAUSA" f="axissin083">                        
                        <td class="campocaja">
                            <select name="NCAUSA" id="NCAUSA" size="1" class="campowidthselect campo campotexto" style="width:90%">
                                <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt f="axissin083" c="COMBO_NCAUSA" lit="1000348"/> - </option>
                                <c:forEach var="ITEM" items="${__formdata.listvalores.tipo_riesgo}">
                                    <option value = "${ITEM.CATRIBU}" 
                                    <c:if test="${ITEM.CATRIBU == __formdata.NCAUSA}">selected</c:if>>
                                        ${ITEM.TATRIBU}
                                    </option>
                                </c:forEach>
                            </select>
                        </td>
                        </axis:visible>  
                        
                        
 
<!-- Calificación Motivos -->
                      <axis:visible f="axissin083" c="NCALMOT" >
                         <td class="campocaja">
                            <select name = "NCALMOT" id ="NCALMOT" size="1"  class="campowidthselect campo campotexto" style="width:90%"
                           	title="<axis:alt f="axissin083" c="NCALMOT" lit="89908023"/>">                                                    
                                <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axissin083" c="C_NCALMOT" lit="1000348"/> - </option>
                               		<c:forEach var="ITEM" items="${__formdata.listvalores.calificacion_motivo}">
                                   		 <option value = "${ITEM.CATRIBU}" 
                                    		<c:if test="${ITEM.CATRIBU == __formdata.NCALMOT}">selected</c:if>>
                                             ${ITEM.TATRIBU}
                                 		</option>
                               	   </c:forEach>
                            </select>
                         </td>
                        </axis:visible> 
                                                                       
                    </tr>                    
                
                <tr>
               		<td class="titulocaja">
                            <b><axis:alt f="axissin083" c="TOBS" lit="89908033"/></b><!-- NCAUSA -->
                    </td> 
                </tr>
                
                <tr>
                 
					<td colspan="6" style="width:100%;"  class="campocaja">
						    <textarea maxlength="1000" cols="100"  size="1" rows="3" name="TOBS" id="TOBS" value="${__formdata.TOBS}"
							class="campowidthinput campo campotexto" style="width: 100%"
							alt="<axis:alt f="axissin083" c="TOBS" lit="89908033" />"
							title="<axis:alt f="axissin083" c="TOBS" lit="89908033" />">${__formdata.TOBS}</textarea>
					</td>
				
                </tr>
                </table>
            </td>
        </tr>
    </table>
    <c:import url="../include/botonera_nt.jsp">
        <c:param name="f">axissin083</c:param>
        <c:param name="__botones"><axis:visible f="axissin083" c="BT_CANCELAR">cancelar</axis:visible><axis:visible f="axissin083" c="BT_GUARDAR">,guardar</axis:visible></c:param>
    </c:import>
    </form>
 <script type="text/javascript">
            Calendar.setup({
                inputField     :    "FCONTINGEN",     
                ifFormat       :    "%d/%m/%Y",      
                button         :    "popup_calendario_FCONTINGEN", 
                singleClick    :    true,
                firstDay       :    1
            });
		</script>
  <c:import url="../include/mensajes.jsp" />
</body>
</html>
