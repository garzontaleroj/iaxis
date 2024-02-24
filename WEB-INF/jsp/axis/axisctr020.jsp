<%/* Revision:# 99bHdugEuhW6HIdHY5s3/w== # */%>
<%--/**
*  Fichero: axisctr020.jsp
*  
*  Primara pantalla del flujo de trabajo "Consulta Póliza".
*  Título: Consulta de Pólizas
*
*  Fecha: 27/11/2007
*/
--%>
<%@ page contentType="text/html;charset=windows-1252"%>
<%@ page import="axis.mvc.model.*" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>
<%
UsuarioBean usuario=(UsuarioBean)session.getAttribute("__usuario");
String CONTINUE=(String)usuario.getContenedor().remove("CONTINUE");
usuario.getContenedor().remove("CONTINUE");
%>
<jsp:useBean id="today" class="java.util.Date" /> 
<c:choose>
    <c:when test="${empty param.f}">
        <c:set var="pantalla" value="axisctr020"/>
    </c:when>
    <c:otherwise>
        <c:set var="pantalla" value="${param.f}"/>
    </c:otherwise>
</c:choose>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
    <head>
        <title><axis:alt f="axisctr020" c="TITULO_PANTALLA" lit="101908"/></title>
        <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
        <link rel="stylesheet" href="styles/displaytag.css">
        <c:import url="../include/carga_framework_js.jsp" />
        <style type="text/css">
         div.fixedHeaderTable {
             position: relative;
             height: 100px;
             overflow-y: auto;
             overflow-x: hidden; 

         }
         
         div.fixedHeaderTable tbody {
             height: auto;
             position:relative;
         }

         div.fixedHeaderTable table {
            height: auto;
            border-width: thin;
            border-style: solid;
            border-color: #E6E6E6;
         }
         
         /* IE */
         div.fixedHeaderTable {
             *position: relative;
             *height: 100px;
             *overflow-y: auto;
             *overflow-x: hidden;
         }
         
         div.fixedHeaderTable tbody {
             *height: auto;
             *position:relative;
        }  
         
         div.fixedHeaderTable table {
            *height: auto;
            *border-width: thin;
            *border-style: solid;
            *border-color: #E6E6E6;  
         }
        </style>
        <script type="text/javascript">
           
            /****************************************************************************************/
            /*********************************** NAVEGACION *****************************************/
            /****************************************************************************************/
            
			var but_emitir_clicked=false;
			function f_onload(){                
                f_cargar_suplementos ();
                f_cargar_propiedades_pantalla('axisctr020');
				try{
                  f_actualiza_evoluprov("${__formdata.SSEGURO}","${__formdata.NESCENA}",null);
				}
				catch(ErrorVisibilidad){
				  null;
				}
                
                objDom.setVisibilidadPorId("but_aceptar", "visible");
                //Validacion botones de motivos de retencion suplmentos
                <c:if test="${empty mvtretencion_sup}"> /* Si está vacio deshabilitamos botón emitir*/                   
                    <c:choose>
                        <c:when test="${!empty param.PCESTPOL && param.PCESTPOL == 1 || (!empty param.CINSPREQ && param.CINSPREQ == 0 )}">
                            //para cuando se vuelve de pantalla axisctr024, determinar si se deben mostrar los botones aceptar y emitir.
                            objDom.setVisibilidadPorId("but_aceptar", "visible");
                            objDom.setVisibilidadPorId("but_emitir","hidden");
                            objDom.setVisibilidadPorId("but_1000081","hidden");// CONF-172
                        </c:when>
                        <c:otherwise>
                             objDom.setVisibilidadPorId("but_aceptar", "hidden");
                            objDom.setVisibilidadPorId("but_emitir","visible");
                            objDom.setVisibilidadPorId("but_1000081","visible");// CONF-172
                        </c:otherwise>
                    </c:choose>
                    <c:if test="${__formdata.ES_COL_ADMIN==1 && __formdata.NCERTIF_COL==0 && (__formdata.CSITUAC_COL==4 || __formdata.CSITUAC_COL==5) && __formdata.ES_AGE_LIDER==0 && __formdata.CRETENI==0}">
                    try {
                        if(objDom.getVisibilidadPorId("but_9904239","visible") == "visible"){
                          <axis:visible c="BT_EMITIR" f="axisctr020">
                            objDom.setVisibilidadPorId("but_9904239","hidden");
                            </axis:visible>
                        }
                    }catch(ErrorVisibilidad) {}
                    </c:if>
                    
                    <c:if test="${__formdata.ES_COL_ADMIN==1 && __formdata.NCERTIF_COL==0 && __formdata.CSITUAC_COL==0 && __formdata.ES_AGE_LIDER==0}">
                    if(objDom.getVisibilidadPorId("but_emitir","visible") == "visible"){
                    <axis:visible c="BT_ABRIR" f="axisctr020">
                        try{
                            objDom.setVisibilidadPorId("but_9904240","hidden");
                        }catch(ErrorVisibilidad) {}
                        </axis:visible>
                    }
                    </c:if>  
                </c:if>
                <c:if test="${!empty mvtretencion_sup}"> /* Si está vacio deshabilitamos botón aceptar*/
                    objDom.setVisibilidadPorId("but_emitir", "hidden");
                    objDom.setVisibilidadPorId("but_1000081", "hidden"); // CONF-172 
                    objDom.setVisibilidadPorId("but_aceptar", "visible");
                    
                    <c:if test="${__formdata.ES_COL_ADMIN==1 && __formdata.NCERTIF_COL==0 && (__formdata.CSITUAC_COL==4 || __formdata.CSITUAC_COL==5) && __formdata.ES_AGE_LIDER==0 && __formdata.CRETENI==0}">
                    if(objDom.getVisibilidadPorId("but_emitir","hidden") == "hidden"){
                     <axis:visible c="BT_EMITIR" f="axisctr020">
                        try{
                            objDom.setVisibilidadPorId("but_9904239","visible");
                        }catch(ErrorVisibilidad) {}
                        </axis:visible>
                    }
                    </c:if>
                    <c:if test="${__formdata.ES_COL_ADMIN==1 && __formdata.NCERTIF_COL==0 && __formdata.CSITUAC_COL==0 && __formdata.ES_AGE_LIDER==0}">
                    if(objDom.getVisibilidadPorId("but_emitir","hidden") == "hidden"){
                    <axis:visible c="BT_ABRIR" f="axisctr020">
                        try{
                            objDom.setVisibilidadPorId("but_9904240","visible");
                        }catch(ErrorVisibilidad) {}
                        </axis:visible>
                    }
                    </c:if>
                    
                </c:if>
            
                <c:if test="${empty OB_IAX_IMPAGOS}">
                     //alert("voy a cerrar");
                     if(document.getElementById("seccion_impagados")){
                        var seccion =document.getElementById("seccion_impagados");
                        seccion.style.display ="none";
                     }
                     //seccion.style.visibility ="hidden";
                </c:if>
                
                document.getElementById("but_100001").style.visibility="hidden";
                
              //bug 22839 ini
              <c:if test="${empty  __formdata.SSEGURO_ORIG}"> 
                 document.getElementById("but_9902500").style.visibility="hidden";
             </c:if>
              <c:if test="${!empty  __formdata.SSEGURO_ORIG}">  
                <c:if test="${__formdata.ES_SUPL_MULTP==0 || empty __formdata.ES_SUPL_MULTP}">
                 document.getElementById("but_9902500").style.visibility="visible";
               </c:if>
              </c:if>
                
              //bug 22839 fin
                
                <% if (request.getAttribute("__formdata") != null &&
                       ((java.util.Map) request.getAttribute("__formdata")).get("SSEGURO") == null) { %>
                    f_abrir_axisctr019();
                <% } %>
                // Si venimos del flujo de suplementos, mirar si hay que mostrar el boton Emitir y deshabilitar el boton de busqueda
                <% if (Boolean.valueOf(true).equals(session.getAttribute("axisctr020_suplementosPendientes"))) { %>
                        <c:if test="${empty mvtretencion_sup && empty PTPSUS}" >
                        document.getElementById("but_emitir").style.visibility="visible"
                        	document.getElementById("but_1000081").style.visibility="visible"
                            <c:if test="${__formdata.ES_COL_ADMIN==1 && __formdata.NCERTIF_COL==0 && (__formdata.CSITUAC_COL==4 || __formdata.CSITUAC_COL==5) && __formdata.ES_AGE_LIDER==0 && __formdata.CRETENI==0}">// CONF-172
                            try{
                                if(objDom.getVisibilidadPorId("but_9904239","visible") == "visible"){
                                 <axis:visible c="BT_EMITIR" f="axisctr020">
                                    objDom.setVisibilidadPorId("but_9904239","hidden");
                                    </axis:visible>
                                }
                            }catch(ErrorVisibilidad) {}
                            </c:if>
                            <c:if test="${__formdata.ES_COL_ADMIN==1 && __formdata.NCERTIF_COL==0 && __formdata.CSITUAC_COL==0 && __formdata.ES_AGE_LIDER==0}">
                            try{
                                if(objDom.getVisibilidadPorId("but_9904240","visible") == "visible"){
                                <axis:visible c="BT_ABRIR" f="axisctr020">
                                    objDom.setVisibilidadPorId("but_9904240","hidden");
                                    </axis:visible>
                                }
                            }catch(ErrorVisibilidad) {}
                            </c:if>
                        </c:if>
                        <c:if test="${!empty mvtretencion_sup}"> /* Si está vacio deshabilitamos botón aceptar*/
                            objDom.setVisibilidadPorId("but_emitir", "hidden");
                            objDom.setVisibilidadPorId("but_1000081", "hidden");// CONF-172
                            objDom.setVisibilidadPorId("but_aceptar", "visible");
                            
                            <c:if test="${__formdata.ES_COL_ADMIN==1 && __formdata.NCERTIF_COL==0 && (__formdata.CSITUAC_COL==4 || __formdata.CSITUAC_COL==5) && __formdata.ES_AGE_LIDER==0 && __formdata.CRETENI==0}">
                            if(objDom.getVisibilidadPorId("but_emitir","hidden") == "hidden"){
                             <axis:visible c="BT_EMITIR" f="axisctr020">
                                try{
                                    objDom.setVisibilidadPorId("but_9904239","visible");
                                }catch(ErrorVisibilidad) {}
                                </axis:visible>
                            }
                            </c:if>
                            <c:if test="${__formdata.ES_COL_ADMIN==1 && __formdata.NCERTIF_COL==0 && __formdata.CSITUAC_COL==0 && __formdata.ES_AGE_LIDER==0}">
                            if(objDom.getVisibilidadPorId("but_emitir","hidden") == "hidden"){
                            <axis:visible c="BT_ABRIR" f="axisctr020">
                                try{
                                    objDom.setVisibilidadPorId("but_9904240","visible");
                                }catch(ErrorVisibilidad) {}
                                </axis:visible>
                            }
                            </c:if>
                            
                        </c:if>
                        <c:if test="${!empty PTPSUS}"> 
                        	  <c:if test="${!empty PCESTPOL && PCESTPOL == 1}">
	                            objDom.setVisibilidadPorId("but_emitir", "hidden");
	                            objDom.setVisibilidadPorId("but_1000081", "hidden");// CONF-172
	                            
	                            objDom.setVisibilidadPorId("but_aceptar", "visible");
                                
                                <c:if test="${__formdata.ES_COL_ADMIN==1 && __formdata.NCERTIF_COL==0 && (__formdata.CSITUAC_COL==4 || __formdata.CSITUAC_COL==5) && __formdata.ES_AGE_LIDER==0 && __formdata.CRETENI==0}">
                                if(objDom.getVisibilidadPorId("but_emitir","hidden") == "hidden"){
                                 <axis:visible c="BT_EMITIR" f="axisctr020">
                                    try{
                                        objDom.setVisibilidadPorId("but_9904239","visible");
                                    }catch(ErrorVisibilidad) {}
                                    </axis:visible>
                                }
                                </c:if>
                                <c:if test="${__formdata.ES_COL_ADMIN==1 && __formdata.NCERTIF_COL==0 && __formdata.CSITUAC_COL==0 && __formdata.ES_AGE_LIDER==0}">
                                if(objDom.getVisibilidadPorId("but_emitir","hidden") == "hidden"){
                                <axis:visible c="BT_ABRIR" f="axisctr020">
                                    try{
                                        objDom.setVisibilidadPorId("but_9904240","visible");
                                    }catch(ErrorVisibilidad) {}
                                    </axis:visible>
                                }
                                </c:if>
                                
                                
	                          </c:if>  
                        </c:if>
                        
                        
                        document.getElementById("find").onclick = f_dummy;
                        document.getElementById("find").style.cursor = "default";
                <% } else { %>
                        document.getElementById("but_emitir").style.visibility="hidden";
                        document.getElementById("but_1000081").style.visibility="hidden";// CONF-172
                        
                        <c:if test="${__formdata.ES_COL_ADMIN==1 && __formdata.NCERTIF_COL==0 && (__formdata.CSITUAC_COL==4 || __formdata.CSITUAC_COL==5) && __formdata.ES_AGE_LIDER==0 && __formdata.CRETENI==0}">
                                if(objDom.getVisibilidadPorId("but_emitir","hidden") == "hidden"){
                                 <axis:visible c="BT_EMITIR" f="axisctr020">
                                    try{
                                        objDom.setVisibilidadPorId("but_9904239","visible");
                                    }catch(ErrorVisibilidad) {}
                                    </axis:visible>
                                }
                                </c:if>
                                <c:if test="${__formdata.ES_COL_ADMIN==1 && __formdata.NCERTIF_COL==0 && __formdata.CSITUAC_COL==0 && __formdata.ES_AGE_LIDER==0}">
                                if(objDom.getVisibilidadPorId("but_emitir","hidden") == "hidden"){
                                <axis:visible c="BT_ABRIR" f="axisctr020">
                                    try{
                                        objDom.setVisibilidadPorId("but_9904240","visible");
                                    }catch(ErrorVisibilidad) {}
                                    </axis:visible>
                                }
                                </c:if>
                <% } %>
                
                //if (document.miForm.SSEGURO.value.length>0) {
                //    document.getElementById("but_100001").style.visibility="visible"
                //}
                                
                
                                
                // Desplegar siempre riesgos
                
                <% if (request.getAttribute("DSP_RIESGOS") != null) { %>
                    objEstilos.toggleDisplay("DSP_RIESGOS", document.getElementById("DSP_RIESGOS_parent"));
                    if (!objUtiles.estaVacio(document.getElementById("GARANTIAS_parent")))
                        objEstilos.toggleDisplay("DSP_GARANTIAS", document.getElementById("DSP_GARANTIAS_parent"));
                <% } %>

                 
                // Desplegar la tabla que estábamos ordenando
                <% if (request.getAttribute("tabla_ordenada") != null) { %>
                    var tabla_ordenada = '<%=request.getAttribute("tabla_ordenada")%>';
                    if (tabla_ordenada == 'clausulasesp' || tabla_ordenada == 'clausulasprod')
                        objEstilos.toggleDisplay("DSP_CLAUSULAS", document.getElementById("DSP_CLAUSULAS_parent"));
                    else
                        objEstilos.toggleDisplay(tabla_ordenada, document.getElementById(tabla_ordenada + "_parent"));
                <% } %>
                 
                // Desplegar la seccin correspondiente si volvemos despues de editar_suplemento.
                <% 
                    
                    if(request.getAttribute("SECACTIVA") != null){
                        java.util.List SECACTIVA = (java.util.List)request.getAttribute("SECACTIVA");
                        for(int i=0;i<SECACTIVA.size();i++){
                    %>      
                        var seccion = '<%=SECACTIVA.get(i)%>';
                        
                        if (!objUtiles.utilEquals (seccion,'DSP_RIESGOS') && !objUtiles.utilEquals (seccion,'DSP_GARANTIAS'))                        
                             objEstilos.toggleDisplay(seccion, document.getElementById(seccion + "_parent"));
                 <% 
                        }
                    } %>    
             
             <% 
             
            if (request.getAttribute("subpantalla") != null && !"null".equals(request.getAttribute("subpantalla")) && !"".equals(request.getAttribute("subpantalla"))) { 
            %>       
                var subpantalla = '<%=request.getAttribute("subpantalla")%>';        
                objEstilos.toggleDisplay(subpantalla, document.getElementById(subpantalla + "_parent"));
            <% } %>
        <%     
                      if (request.getAttribute("subpantalla_b") != null && !"null".equals(request.getAttribute("subpantalla_b")) && !"".equals(request.getAttribute("subpantalla_b"))) { 
            %>       
                var subpantalla_b = '<%=request.getAttribute("subpantalla_b")%>';                        
                objEstilos.toggleDisplay(subpantalla_b, document.getElementById(subpantalla_b + "_parent"));
            <% } %>   

<%
if (CONTINUE!=null) {
    if (CONTINUE.startsWith("axismenu:axisctr020|SSEGURO=")) { 
             String CONTINUE_substring_28=CONTINUE.substring(28); //justamente despues del =
             if (CONTINUE_substring_28.startsWith("-1")) {
                    %>
                    f_abrir_axisctr019 ();
                    <%
             }
             else {
                    %>
                    f_aceptar_axisctr019 ("<%=CONTINUE.substring(28)%>");
                    <%
             }
     } //end-if CONTINUE tipo axismenu:axisctr020|SSEGURO=
}
%>   
           

              <c:if test="${ __formdata.ES_COL_ADMIN==1}">  
                 document.getElementById("but_emitir").style.visibility="hidden";
                 document.getElementById("but_1000081").style.visibility="hidden";// CONF-172
                 <% if (Boolean.valueOf(true).equals(session.getAttribute("axisctr020_suplementosPendientes"))) { %>
                 document.getElementById("but_aceptar").style.visibility="visible";
                 <% } %>
               </c:if>
               
               
            <axis:visible c="BT_GUARDAR_SUPLEMENTO" f="axisctr020">
	              objDom.setVisibilidadPorId("but_1000081", "hidden");// CONF-172
	       	</axis:visible>
	       	
	       	objDom.setVisibilidadPorId("DSP_PTPSUS_HIST", "hidden");
			 objDom.setVisibilidadPorId("DSP_PSU_RETENIDAS_HIST", "hidden");
	         
	          
			     alert("antes del if");
	         // if("${__formdata.CSITUAC_COL}  ==4 "|| "${__formdata.CSITUAC_COL} ==5"  ){
	          
	         	<c:if test="${__formdata.CSITUAC_COL}==4  || ${__formdata.CSITUAC_COL}==5 ">  
	         	
	         	alert("entro if");
	         	<axis:visible c="DSP_PTPSUS_HIST" f="axisctr020">
	          	 objDom.setVisibilidadPorId("DSP_PTPSUS_HIST", "visible");
	          	 objDom.setVisibilidadPorId("DSP_PSU_RETENIDAS_HIST", "visible");
	          	 objDom.setVisibilidadPorId("DOCPOL2", "visible");
	     
	         	 </axis:visible>
	         	 </c:if> 
	          	 
	          //}else{
	          <c:if test="${__formdata.CSITUAC_COL}!=4  && ${__formdata.CSITUAC_COL}!=5  ">  	
	           alert("entro else");
	           objDom.setVisibilidadPorId("DSP_PTPSUS_HIST", "hidden");
	         	 objDom.setVisibilidadPorId("DSP_PSU_RETENIDAS_HIST", "hidden");
	         	 objDom.setVisibilidadPorId("DOCPOL2", "hidden");
	         	</c:if> 	
	          	
	         // } 
			
	       	 
              
            
                f_cargar_propiedades_pantalla();
                
                if (document.referrer.indexOf("main.do")>0) { objSeccion.seccionPorAbrirCookieBorrar("axisctr020");}
                objSeccion.abrirSeccionesPorAbrir("axisctr020");
                //INI-CONF-209-VLCG
                <c:if test="${sessionScope.CMONEDAPROD eq 'COP'}">
                    $("#but_convpesos").hide();
                </c:if>                
                //FIN-CONF-209-VLCG
            }
            
            function f_abrir_axispsu004 () {           
                var NOVISIBLE = document.getElementById("NOVISIBLE").value;                                
                objUtiles.abrirModal("axispsu004", "src", "modal_axispsu004.do?operation=form&NOVISIBLE"+NOVISIBLE+"&PTABLAS=POL");
            }
            
            function f_cerrar_axispsu004() {
                objUtiles.cerrarModal("axispsu004");
            }    
            
            function f_abrir_axispsu003(SSEGURO,NMOVIMI,NRIESGO,CCONTROL,NOCURRE,CGARANT) {                      
                var param = '&SSEGURO='+SSEGURO+'&NMOVIMI='+NMOVIMI+'&NRIESGO='+NRIESGO+'&CCONTROL='+CCONTROL+'&NOCURRE='+NOCURRE+'&CGARANT='+CGARANT+'&PTABLAS=POL'+'&MODO=1&ORIGEN=AXISCTR020';            
                objUtiles.abrirModal("axispsu003", "src", "modal_axispsu003.do?operation=form"+param);
            } 
            
            function f_cerrar_axispsu003() {
                objUtiles.cerrarModal("axispsu003");
            }    
            
            
            function f_dummy() {
                return;
            }
            
            function mostrar(nombreCapa){ 
            //alert(nombreCapa);
            document.getElementById(nombreCapa).style.visibility="visible"; 
            } 
            
            function ocultar(nombreCapa){ 
            //alert(nombreCapa);
            document.getElementById(nombreCapa).style.visibility="hidden"; 
            } 
            
            function mostrar_ocultar(nombreCapa){ 
                if(document.getElementById(nombreCapa).style.visibility=="visible"){
                    document.getElementById(nombreCapa).style.visibility="hidden"; 
                }else{
                    document.getElementById(nombreCapa).style.visibility="visible"; 
                }
            } 
                       
            function f_but_anterior() {
            }
            

            
            function f_but_cancelar() {
                <% if (Boolean.valueOf(true).equals(session.getAttribute("axisctr020_suplementosPendientes"))) { %>
               <%--     <c:if test="${empty mvtretencion_sup}" >--%>
                        objUtiles.ejecutarFormulario ("axis_axisctr020.do?", "limpiar_suplemento", document.miForm, "_self", objJsMessages.jslit_cargando);    
                    <%--</c:if>--%>
                <% } else { %>
                        objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axisctr020", "cancelar", document.miForm, "_self");
                <% } %>
            }            

            function f_but_salir() {
                <% if (Boolean.valueOf(true).equals(session.getAttribute("axisctr020_suplementosPendientes"))) { %>
               <%--     <c:if test="${empty mvtretencion_sup}" >--%>
                        objUtiles.ejecutarFormulario ("axis_axisctr020.do?", "limpiar_suplemento", document.miForm, "_self", objJsMessages.jslit_cargando);    
                    <%--</c:if>--%>
                <% } else { %>
                        objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axisctr020", "cancelar", document.miForm, "_self");
                <% } %>
            }

            function f_inicializar_suplemento(CMOTMOV, seccion_activa,CMOTMOV_ALT) {
                document.miForm.CMOTMOV.value = CMOTMOV;
                
                document.miForm.SECACTIVA.value = seccion_activa;
                if (CMOTMOV_ALT==undefined || CMOTMOV_ALT==null) {
                objAjax.invokeAsyncCGI("axis_axisctr020.do", callbackInicializaSuplemento, "operation=inicializar_suplemento&SSEGURO=" + objDom.getValorPorId("SSEGURO") + "&CMOTMOV=" + CMOTMOV, this,  objJsMessages.jslit_cargando, false);
                }
                else {
                    document.miForm.CMOTMOV_ALT.value = CMOTMOV_ALT;
                    objAjax.invokeAsyncCGI("axis_axisctr020.do", callbackInicializaSuplemento, "operation=inicializar_suplemento&SSEGURO=" + objDom.getValorPorId("SSEGURO") + "&CMOTMOV=" + CMOTMOV+"&CMOTMOV_ALT="+CMOTMOV_ALT, this,  objJsMessages.jslit_cargando, false);
                }
            }
            
            function f_editar_suplemento(PFEFECTO,PNNUMCASO,PNCASO_BPM,PNSOLICI_BPM) {
                document.miForm.PFEFECTO.value = PFEFECTO;
                
                document.miForm.NNUMCASO.value = PNNUMCASO;
                document.miForm.NCASO_BPM.value = PNCASO_BPM;
                document.miForm.NSOLICI_BPM.value = PNSOLICI_BPM;
                
                objUtiles.ejecutarFormulario ("axis_axisctr020.do?PFEFECTO="+PFEFECTO, "editar_suplemento", document.miForm, "_self", objJsMessages.jslit_cargando);
            }
            
            function f_but_emitir() {
               //objUtiles.ejecutarFormulario ("axis_axisctr020.do?", "emitirPropuesta", document.miForm, "_self", objJsMessages.jslit_cargando);         
              
               // objAjax.invokeAsyncCGI("axis_axisctr020.do", callbackEmitir, "operation=emitirPropuesta", this,  objJsMessages.jslit_cargando, false);
              
              operacio = "emitir";  
              if (but_emitir_clicked) {
                    //se ignora, no se hace nada
              }
              else {  
                    but_emitir_clicked=true;
                    var o=document.miForm.but_emitir; //hacer el boton invisible
                    o.style.visibility="hidden"; //hacer el boton invisible
                    //Validem si hi ha documentació requerida necessaria
                    objAjax.invokeAsyncCGI("axis_axisctr020.do", callbackValDocRequerida, "operation=ajax_valdocrequerida",
                                            this, objJsMessages.jslit_cargando);
               }
            
            }
            
            function f_actualiza_evoluprov(PSSEGURO,PNESCENA,PTABLAS){
             try{
               objAjax.invokeAsyncCGI("axis_axisctr020.do", 
               callbackAjaxActualizaEvoluProv, "operation=actualiza_evoluprov&PSSEGURO=" + PSSEGURO + "&TABLAS=" + PTABLAS + "&PNESCENA=" +  PNESCENA,  this);
             } catch (e) {
               if (isDebugAjaxEnabled == "true")
                 alert (e.name + " " + e.message);
             }              
            }
			
            function callbackAjaxActualizaEvoluProv(ajaxResponseText){
              try {
                 var doc = objAjax.domParse(ajaxResponseText);
                 if (!objAppMensajes.existenErroresEnAplicacion(doc, false)) {
                    var table = document.getElementById("evoluprovmatseg");
                    var tbody = table.getElementsByTagName("tbody")[0];
                    var tr = tbody.getElementsByTagName("tr");
					var vacio = 0;
                    objLista.borrarFilasDeLista ("evoluprovmatseg", "7",  '<axis:alt f="axisctr020" c="MENSA2" lit="1000254"/>');
                    for (var i = 0; i < objDom.numeroDeTags(doc, "NANYO") ; i++) {
                       var rowstyle = objLista.addEstiloEnFilaDeLista(tr, "gridEven", "gridNotEven");
                       var newtr = objLista.crearNuevaFila(rowstyle);
                       var newtd = new Array(7);
 
			 var valdat = 0;
             <axis:visible f="${pantalla}" c="NANYO">			 
                         newtd[0] = objLista.addTextoEnLista(objDom.getValorNodoDelComponente(doc.getElementsByTagName("NANYO"), i, 0));
                         valdat = 1;
			 </axis:visible>
             <axis:visible f="${pantalla}" c="FPROVMAT">						 
                         newtd[1] = objLista.addTextoEnLista(objUtiles.formateaTimeStamp2(objDom.getValorNodoDelComponente(doc.getElementsByTagName("FPROVMAT"), i, 0)));
			 valdat = 1;
			 </axis:visible>
			 <axis:visible f="${pantalla}" c="IPROVMAT">
                         newtd[2] = objLista.addNumeroEnLista(objNumero.formateaNumeroCero(objDom.getValorNodoDelComponente(doc.getElementsByTagName("IPROVMAT"), i, 0), true));
			 valdat = 1;
			 </axis:visible>
             <axis:visible f="${pantalla}" c="PRESCATE">			 
                         newtd[3] = objLista.addTextoEnLista(objDom.getValorNodoDelComponente(doc.getElementsByTagName("PRESCATE"), i, 0));
			 valdat = 1;
			 </axis:visible>
			 <axis:visible f="${pantalla}" c="PINTTEC">
                         newtd[4] = objLista.addTextoEnLista(objNumero.formateaNumeroCero(objDom.getValorNodoDelComponente(doc.getElementsByTagName("PINTTEC"), i, 0), true));
			 valdat = 1;
			 </axis:visible>
			 <axis:visible f="${pantalla}" c="IVALRES">
                         newtd[5] = objLista.addTextoEnLista(objNumero.formateaNumeroCero(objDom.getValorNodoDelComponente(doc.getElementsByTagName("IVALRES"), i, 0), true));
			 valdat = 1;
			 </axis:visible>
			 <axis:visible f="${pantalla}" c="IPRIMA">
                         newtd[6] = objLista.addTextoEnLista(objNumero.formateaNumeroCero(objDom.getValorNodoDelComponente(doc.getElementsByTagName("IPRIMA"), i, 0), true));                        
			 valdat = 1;
			 </axis:visible>
					   
			 if ( valdat == 1 ) {
			    objLista.borrarFilaVacia(tbody, tr);
                            objLista.addNuevaFila(newtd, newtr, tbody);
		            vacio = 1;
			 }	 
                    }
					
		    if ( vacio == 0 ) 
		       objLista.borrarFilasDeLista ("evoluprovmatseg", "7", '<axis:alt f="axisctr020" c="MENSA2" lit="1000254"/>');
                    }
              
                } catch (e) {
                   if (isDebugAjaxEnabled == "true")
                      alert (e.name + " " + e.message);
                }               
            }
            
            function callbackValDocRequerida(ajaxResponseText){
                var doc = objAjax.domParse(ajaxResponseText);
                //if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
                    var  TIPERROR = 0;
                    var CERROR = 0;
                    var TERROR = "";
                    try{ 
                        TIPERROR = objDom.getValorNodoDelComponente(doc.getElementsByTagName("TIPERROR"), 0, 0);
                        CERROR = objDom.getValorNodoDelComponente(doc.getElementsByTagName("CERROR"), 0, 0);
                        TERROR = objDom.getValorNodoDelComponente(doc.getElementsByTagName("TERROR"), 0, 0);
                    } catch (e) {
                        TIPERROR = 0;
                    }
                    if (TIPERROR == 0){
                        //objAjax.invokeAsyncCGI("axis_axisctr024.do", callbackEmitir, "operation=emitirPropuesta", this, objJsMessages.jslit_cargando);
                        //ecg20120113 Bug/nota 20671/103711 evitar multiple pulsacion del boton de Aceptar, ha de ser igual como "contratar"
                        /*LOCAL_invokeAsyncCGI("axis_axisctr020.do", callbackEmitir, 
		                        "operation=emitirPropuesta",
		                        this, objJsMessages.jslit_cargando);*/
                         objAjax.invokeAsyncCGI_JSON("axis_axisctr020.do?operation=preguntaProgagaSupl", callbacPregPropagaSup, objJsMessages.jslit_cargando);

                    }else if (TIPERROR == 2){
                        //Avis
                        var confirma=confirm(TERROR);
                        if (confirma) {
                            //objAjax.invokeAsyncCGI("axis_axisctr024.do", callbackEmitir, "operation=emitirPropuesta", this, objJsMessages.jslit_cargando);
		                    //ecg20120113 Bug/nota 20671/103711 evitar multiple pulsacion del boton de Aceptar, ha de ser igual como "contratar"
		                    		/*LOCAL_invokeAsyncCGI("axis_axisctr020.do", callbackEmitir, 
		                        "operation=emitirPropuesta",
		                        this, objJsMessages.jslit_cargando);*/
                             objAjax.invokeAsyncCGI_JSON("axis_axisctr020.do?operation=preguntaProgagaSupl", callbacPregPropagaSup, objJsMessages.jslit_cargando);
                        }
                    }else{
                        objAppMensajes.existenErroresEnAplicacion(doc);
                    }
                //}
            }
            
            function callbacPregPropagaSup(p) {
                
                objEventos.showHideLoader("ajaxLoader", "ajaxContent", "ajaxText", "", "none");
                if(!objAppMensajes.existenErroresEnAplicacion_JSON(p, true, "resultado")){
                    var mensajes = p.JSON2.resultado.OTEXTO;
                    if (!objUtiles.estaVacio(p.JSON2.resultado.OTEXTO)){
                       var confirmaPropaga=confirm(mensajes);
                       if (confirmaPropaga) {
                          LOCAL_invokeAsyncCGI("axis_axisctr020.do?PCPROPAGASUPL=1", callbackEmitir, "operation=emitirPropuesta", this, objJsMessages.jslit_cargando);
                       }else{
                          LOCAL_invokeAsyncCGI("axis_axisctr020.do?PCPROPAGASUPL=0", callbackEmitir, "operation=emitirPropuesta", this, objJsMessages.jslit_cargando);
                       }
                    }else{
                        LOCAL_invokeAsyncCGI("axis_axisctr020.do", callbackEmitir, "operation=emitirPropuesta", this, objJsMessages.jslit_cargando);
                    }
                }  else{alert ("hay errores");}
                $.reinitialiseScroll();
            }
            
            function LOCAL_invokeAsyncCGI(strURL, callback, qs, self, ajaxTexto, optionalCallBackParam) {
                try{
                    // Muestra la precarga ajax
                    if(!objUtiles.estaVacio(ajaxTexto)) {
                        LOCAL_showHideLoader("01",  ajaxTexto, "inline");
                    }
                    // Recodificar la QueryString
                    qs = objAjax.tratarEncodingQs(qs);
                    var xmlHttpReq = false;
                    if (window.XMLHttpRequest) { // Mozilla
                        self.xmlHttpReq = new XMLHttpRequest();
                    }
                    else if (window.ActiveXObject) { //IE
                        self.xmlHttpReq = new ActiveXObject("Microsoft.XMLHTTP");
                    }
                    if (strURL.indexOf("?")>=0) {
                        self.xmlHttpReq.open('POST', strURL+"&"+qs, true);
                    }
                    else {
                        self.xmlHttpReq.open('POST', strURL+"?"+qs, true);
                    }
                    self.xmlHttpReq.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
                    self.xmlHttpReq.onreadystatechange = function() {
                        if (self.xmlHttpReq != null && self.xmlHttpReq.readyState == 4) {
                            if (!objUtiles.estaVacio(callback)) callback(self.xmlHttpReq.responseText, optionalCallBackParam);
                            //Esconde la precarga ajax (el setTimeOut es para que sea apreciable mientras no estamos en producción)
                            //if( !objUtiles.estaVacio(ajaxTexto)) LOCAL_showHideLoader("01", "", "none");
                        }
                    }
                    self.xmlHttpReq.send(null);
                }catch(e){
                    alert(e);
                    LOCAL_showHideLoader("01",  "", "none");
                }
            }
            
            function LOCAL_showHideLoader(localid,  valorTexto, visualizar){
                try {
                    var loader="LOCAL"+localid+"ajaxLoader"
                    var content="LOCAL"+localid+"ajaxContent"
                    var text="LOCAL"+localid+"ajaxText"
                    document.getElementById("LOCAL"+localid+"ajax4ie").style.display=visualizar;
                    document.getElementById(loader).style.display=visualizar;
                    document.getElementById(content).style.display=visualizar;
                    document.getElementById(text).innerHTML= valorTexto;
                }
                catch(excep) {
                    alert(excep)
                }
            }
            
            
            //bug 22839 ini
            function f_but_9902500() {
                document.miForm.SSEGURO.value=document.miForm.SSEGURO_ORIG.value; 
                document.miForm.SSEGURO_ORIG.value = '';
              
                objUtiles.ejecutarFormulario ("axis_axisctr020.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);     
           
              
            }
            //bug 22839 fin 
            
            function f_getRiesgo (NRIESGO) {
                document.miForm.NRIESGO.value = NRIESGO;
                objUtiles.ejecutarFormulario ("axis_axisctr020.do?", "form", document.miForm, "_self", objJsMessages.jslit_cargando);         
            }
            
            function f_getMotivo (SSEGURO, NMOVIMI) {
                document.miForm.NMOVIMI.value = NMOVIMI;
                document.miForm.SSEGURO.value = SSEGURO;
                objUtiles.ejecutarFormulario ("axis_axisctr020.do?canviNmovimi=1", "form", document.miForm, "_self", objJsMessages.jslit_cargando);         
            }
            
            function f_getmails(){
                var correos="";
                var mails = document.getElementsByName("CONTACTOEMAIL"); 
                for(var i = 0; i < mails.length ; i++){
                    var separador = ((i + 1) < mails.length)?";":""; 
                    correos+=mails[i].value.toUpperCase() + separador ; 
                }
                return correos;
            }

            /****************************************************************************************/
            /************************************* MODAL ********************************************/
            /****************************************************************************************/
            
            
            
            /* IMPRESION */
            function f_but_100001() {
                var correos= f_getmails();
                objUtiles.abrirModal("axisimprimir", "src", "modal_axisimprimir.do?dt=<%=new java.util.Date().getTime()%>&operation=form&SEGURO="+document.miForm.SSEGURO.value+"&EMAILENVIODOC="+correos);
            }
            
            function f_but_ctaseguro() {
                var correos= f_getmails();
                objUtiles.abrirModal("axisimprimir", "src", "modal_axisimprimir.do?dt=<%=new java.util.Date().getTime()%>&operation=impresion_doc_tipo&SEGURO="+document.miForm.SSEGURO.value+"&TIPO=LSTCTASEGURO"+"&EMAILENVIODOC="+correos);
            }
            
            function f_but_docseguro(vtipo) {
                  var correos= f_getmails();
                  
                // Bug 677- 20/04/2018 -VCG
                //  if (objDom.getValorPorId("CSITUAC_COL")==4) {
                //	  vtipo = "CON_ALTA";
                //  }
                  if (objUtiles.estaVacio(vtipo)) vtipo = "DOCPOL";
                  objUtiles.abrirModal("axisimprimir", "src", "modal_axisimprimir.do?dt=<%=new java.util.Date().getTime()%>&operation=impresion_doc_tipo&SEGURO="+document.miForm.SSEGURO.value+"&TIPO="+vtipo+"&EMAILENVIODOC="+correos);
            }
            
            function  f_but_docdetalleprimas()  {
            
               <c:if test="${!empty informes}" >
                 var strURL="axis_axisctr020.do?operation=imprimir_detalle_primas_json&SSEGURO="+document.miForm.SSEGURO.value+"&NRIESGO="+ objDom.getValorPorId("NRIESGO")+"&PTABLAS=POL";
                 var ajaxTexto=objJsMessages.jslit_cargando;
                 objAjax.invokeAsyncCGI_JSON(strURL, callbackdetalle_primas, ajaxTexto)
                        
              </c:if>
              
           }
            
            
           function callbackdetalle_primas(p) {
                objEventos.showHideLoader("ajaxLoader", "ajaxContent", "ajaxText", "", "none");
                if(!objAppMensajes.existenErroresEnAplicacion_JSON(p, true, "resultado")){
                    
                    if (!objUtiles.estaVacio( p.JSON2.lstinforme))      {
                      for (var i = 0 ; i<p.JSON2.lstinforme.length;i++){
                   
                        var informe = p.JSON2.lstinforme[i];
                        var ficherolist = informe.OB_IAX_IMPRESION.FICHERO;
                         var str2 = ficherolist.replace(/barrainvertida/gi, "\\");    
                         objUtiles.abrirModal("axisimprimir", "src", "modal_axisimprimir.do?operation=tunnel&file="+str2+"&origen=axislist020.jsp",600,200);
                    
                       }
                       
                    }
                }
            }
             
            function f_cerrar_axisimprimir() {
             objUtiles.cerrarModal("axisimprimir");
               <% if (Boolean.valueOf(true).equals(session.getAttribute("axisctr020_suplementosPendientes"))) { %>
               <%--     <c:if test="${empty mvtretencion_sup}" >--%>
                        objUtiles.ejecutarFormulario ("axis_axisctr020.do?", "limpiar_suplemento", document.miForm, "_self", objJsMessages.jslit_cargando);    
                    <%--</c:if>--%>
                <% } else { %>
                        objUtiles.ejecutarFormulario ("axis_axisctr020.do?", "form", document.miForm, "_self", objJsMessages.jslit_cargando);         
                <% } %>
            }
            
            /* GEDOX */
            function f_but_gedox(NMOVIMI) {
                objUtiles.abrirModal("axisgedox", "src", 
                    "modal_axisgedox.do?dt=<%=new java.util.Date().getTime()%>&operation=form&SEGURO="+document.miForm.SSEGURO.value + "&NMOVIMI=" + NMOVIMI);
            }   
            function f_cerrar_axisgedox() {
                objUtiles.cerrarModal("axisgedox");
            }

            // Modal Buscador
            function f_abrir_axisctr019 () {
                objUtiles.abrirModal("axisctr019", "src", "modal_axisctr019.do?operation=form");
            }
              function f_cerrar_axisctr019() {                 
                objUtiles.cerrarModal("axisctr019");
                if(objUtiles.estaVacio(document.miForm.SSEGURO.value)){
                f_but_salir();
                }                           
                }
                
            function f_aceptar_axisctr019 (SSEGURO) {
                objUtiles.cerrarModal("axisctr019");
                if (objUtiles.estaVacio(SSEGURO)){
                    return false;
                }
                document.miForm.SSEGURO.value=SSEGURO;
                document.miForm.NMOVIMI.value= -9999;//Le ponemos un valor imposible para conseguir que, al cambiar de póliza, salga siempre cargado el primer movimiento del multiregistro
                objUtiles.ejecutarFormulario ("axis_axisctr020.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);     
            }
            //bug  22839 ini
             function f_aceptar_certif_axisctr019 (SSEGURO,NPOLIZA,NCERTIF) {
                objUtiles.cerrarModal("axisctr019");
                
                document.miForm.SSEGURO_ORIG.value=document.miForm.SSEGURO.value;
                document.miForm.SSEGURO.value=SSEGURO;
                document.miForm.NPOLIZA.value=NPOLIZA;
                document.miForm.NCERTIF.value=NCERTIF;
                
                 //22839
                 if (document.miForm.NCERTIF.value !=0) {
                 <c:if test="${__formdata.ES_SUPL_MULTP==0 || empty __formdata.ES_SUPL_MULTP}">
                    objDom.setVisibilidadPorId("but_9902500", "visible");
                    </c:if>
                   }
                  else {
                    
                    objDom.setVisibilidadPorId("but_9902500", "hidden");
                  }
        
                objUtiles.ejecutarFormulario ("axis_axisctr020.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);     
            
            }
            
        function f_seleccionar_certif(SSEGURO){
            objAjax.invokeAsyncCGI("axis_axisctr020.do?SSEGURO_HIJO="+SSEGURO, miresppermisup, "operation=permitesuplem", this,  objJsMessages.jslit_cargando,SSEGURO);
         }    
         
         //INICIO CONF-172
         function f_but_1000081() {
            objAjax.invokeAsyncCGI("axis_axisctr020.do", callbackAceptar, "operation=guardar_supl", this,  objJsMessages.jslit_cargando, false);
       }// FIN CONF-172
         
            
         function miresppermisup (ajaxResponseText,SSEGURO) { 
                var doc = objAjax.domParse(ajaxResponseText);    
           if (!objAppMensajes.existenErroresEnAplicacion(doc)) {                  
                if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("PERMITESUPLEM")[0])){
                         var permite_suplem = objDom.getValorNodoDelComponente(doc.getElementsByTagName("PERMITESUPLEM"), 0, 0);
           
                      if (permite_suplem !=0 || permite_suplem != null || objUtiles.estaVacio(SSEGURO) ) {    
                                alert(permite_suplem); //ENSEAMOS MENSAJE
                                //permite_suplem ponerla vacia
                        }
                           
                  }
             else{
                 objUtiles.ejecutarFormulario("axis_axisctr020.do?SSEGURO_BAJA="+SSEGURO, "consultarBajacertif", document.miForm, "_self", objJsMessages.jslit_cargando);   
             }
                              
                
           }    
         }
        //bug  22839 fin 
            // Modal Importes Garantías ACTR030
            function f_abrir_axisctr030 (CGARANT, NRIESGO, NDETGAR) {
            var SPRODUC = '${datos_poliza.SPRODUC}';
                objUtiles.abrirModal("axisctr030", "src", "modal_axisctr030.do?operation=form&CGARANT=" + CGARANT + "&NRIESGO=" + NRIESGO+"&SPRODUC="+SPRODUC + "&NDETGAR=" + NDETGAR+"&ORIGEN=AXISCTR020"+"&NMOVIMI="+objDom.getValorPorId("NMOVIMI"));
            }
            function f_cerrar_axisctr030() {
                objUtiles.cerrarModal("axisctr030");
            }    
            
            // Modal Detalle Riesgo Asegurado ACTR029
            function f_abrir_axisctr029 (NRIESGO) {
                objUtiles.abrirModal("axisctr029", "src", "modal_axisctr029.do?operation=form&NRIESGO=" + NRIESGO);
            }
            function f_cerrar_axisctr029() {
                objUtiles.cerrarModal("axisctr029");
            }    
            
            // Modal Detalle Provisiones 
            function f_abrir_axisctr215 (SSEGURO, NMOVIMI, CGARANT, FECHA) {
                objUtiles.abrirModal("axisctr215", "src", "modal_axisctr215.do?operation=form&SSEGURO=" + SSEGURO + "&NMOVIMI=" + NMOVIMI +"&CGARANT=" + CGARANT +"&FECHA=" + FECHA);
                //alert ("SSEGURO"+SSEGURO+"NMOVIMI"+NMOVIMI+"CGARANT"+CGARANT+"FECHA"+FECHA);
            }
            function f_cerrar_axisctr215() {
                objUtiles.cerrarModal("axisctr215");
            }    
            
           /* COBRO RECIBO 023  */            
            function f_abrir_axisctr023(valor) {
                document.miForm.NRECIBO.value=valor;
                objUtiles.abrirModal("axisctr023", "src", "modal_axisctr023.do?operation=init&NRECIBO="+valor);              
            }
            function f_aceptar_axisctr023(valor1,valor2,valor3,valor4){
                document.miForm.CTIPCOB.value=valor1;
                document.miForm.CTIPBAN.value=valor2;
                document.miForm.CBANCAR1.value=valor3;
                document.miForm.NRECIBO.value=valor4;
                objUtiles.ejecutarFormulario ("axis_axisctr020.do", "cobrar_recibo", document.miForm, "_self", objJsMessages.jslit_cargando);  
                objUtiles.cerrarModal("axisctr023");
            }
            
            function f_cerrar_axisctr023 () {
                objUtiles.cerrarModal("axisctr023");
            }    
            
            /* DETALLE MOVIMIENTO 025  */
            function f_but_detailmov (NMOVIMI, CMOTMOV, NCERTIF) {
                objUtiles.abrirModal("axisctr025", "src", "modal_axisctr025.do?operation=form&SSEGURO=" + document.miForm.SSEGURO.value + "&NMOVIMI=" + NMOVIMI + 
                    "&CMOTMOV=" + CMOTMOV + "&NCERTIF=" + NCERTIF);
            }       
            
            function f_but_deletemov (NMOVIMI, CMOTMOV, TOBSERV) {
					var mensaje = "<axis:alt f="axisctr020" c="ALERT1_PANTALLA" lit="9901090"/>";
					
					
					//alert(TOBSERV);
					
                	if (confirm(mensaje)) {
                		
                		if (TOBSERV != "Movimiento anulado") {
    						
                			var SSEGURO = "${datos_poliza.SSEGURO}";
                        	var NLINEA = "${datos_poliza.NLINEA}";
                        	var PMODO = 0;
                        	var NPOLIZA = "${datos_poliza.NPOLIZA}";
                            objUtiles.abrirModal('axisctr063_1', "src", "modal_axisctr063_1.do?operation=init&NMOVIMI="+NMOVIMI+"&CMOTMOV="+CMOTMOV+"&TOBSERV="+TOBSERV+"&NPOLIZA="+NPOLIZA+"&SSEGURO="+SSEGURO+"&NLINEA="+NLINEA+"&PMODO="+PMODO);
                            
                            
    						

                		} else {
                			alert("Movimiento anulado");
                			//objUtiles.ejecutarFormulario ("axis_axisctr020.do?NMOVIMI_REGISTRO="+NMOVIMI+"&CMOTMOV_REGISTRO="+CMOTMOV+"&TOBSERV_REGISTRO="+TOBSERV, "deletemov", document.miForm, "_self", objJsMessages.jslit_cargando);
                    	
                		}
						
					}
    	
            } 

            
            function f_cerrar_axisctr025 () {
                objUtiles.cerrarModal("axisctr025");
            }
            
            function f_but_aceptar(){
                
                objAjax.invokeAsyncCGI("axis_axisctr020.do", callbackAceptar, 
                        "operation=aceptar",
                        this,  objJsMessages.jslit_cargando, false);
            }
            
            /*MODAL AXCTR039*/
            function f_abrir_axisctr039(PFEFECTO) {
                var ncertif = document.miForm.NCERTIF.value;
                var NPOLIZA = document.miForm.NPOLIZA.value;
                var SPRODUC = document.miForm.SPRODUC.value;
                var CMODO = 'SUPLEMENTO_' + document.miForm.CMOTMOV.value;
                objUtiles.abrirModal("axisctr039", "src", "modal_axisctr039.do?operation=form&PFEFECTO=" + PFEFECTO + "&NPOLIZA="+NPOLIZA + "&NCERTIF="+ncertif+"&SPRODUC="+SPRODUC+"&CMODO="+CMODO);              
            }
            
            function f_cerrar_axisctr039 () {
                objUtiles.cerrarModal("axisctr039");
            }
            
            // Gestin recibos
            
            /* Realiza una llamada a F_GET_ACCIONES para saber si el recibo seleccionado tiene acciones.
            * Si tiene exactamente 1 accin a realizar, devuelve va Ajax su CFORM (pantalla destino de la accin)
            * para que la pantalla AXISCTR020 pueda navegar a esa pantalla. Si no, no devolver CFORM, y la pantalla
            * AXISCTR020 sabr que tiene que abrir el modal AXISADM028 para escoger accin.
            */
            function f_gestionar_recibos(NRECIBO, TESTREC) {
                objAjax.invokeAsyncCGI("modal_axisadm028.do", callbackAjaxGestionarRecibos, 
                    "operation=gestionar_recibos&NRECIBO=" + NRECIBO, this, null, TESTREC);
            }
            
            // Modal gestin de cobro
            function f_abrir_axisadm028 (NRECIBO, TESTREC) {
                objUtiles.abrirModal("axisadm028", "src", "modal_axisadm028.do?operation=init&NRECIBO=" + NRECIBO + "&TESTREC=" + TESTREC, 800, 420);
            }

            function f_cerrar_axisadm028() {
                objUtiles.cerrarModal("axisadm028");
            } 
            
            function f_aceptar_axisadm028(NRECIBO, CFORM) {
                try {
                    objUtiles.cerrarModal("axisadm028");
                } catch (e) {}
                objDom.setValorPorId("NRECIBO", NRECIBO);
                objUtiles.ejecutarFormulario ("axis_axisctr020.do?CFORM=" + CFORM, "gestion_cobros", document.miForm, "_self", objJsMessages.jslit_cargando);  
            }
            
            function f_cobro_host(NRECIBO){
                objDom.setValorPorId("NRECIBO", NRECIBO);
                objUtiles.ejecutarFormulario ("axis_axisctr020.do", "cobro_host", document.miForm, "_self", objJsMessages.jslit_cargando);  
            }
            
            /****************************************************************************************/
            /******************************* CALLBACKS AJAX *****************************************/
            /****************************************************************************************/
            
            //function callbackEmitir(ajaxResponseText) {
                // Recibe la respuesta Ajax de emitir propuesta.
                // Y escribe los mensajes de info/error correspondientes.
              //  var doc = objAjax.domParse(ajaxResponseText);
                
                // Hacemos la llamada para pintar los errores/infos
                //if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
                    // Si no hay errores, esconder el botón emitir
                //    document.getElementById("but_emitir").style.visibility="hidden";
                //}
            //}
            
            function callbackAceptar (ajaxResponseText) {
                 // Recibe la respuesta Ajax de emitir propuesta.
                // Y escribe los mensajes de info/error correspondientes.
                var doc = objAjax.domParse(ajaxResponseText);
                // Hacemos la llamada para pintar los errores/infos
                if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
                    // Si todo ha ido bien, desactivar botones.
                    objDom.setVisibilidadPorId("but_aceptar", "hidden");
                    if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("TINFO")[0])){
                                var mensaje = objDom.getValorNodoDelComponente(doc.getElementsByTagName("TINFO"), 0, 0);
                    }else{
                        var mensaje="";
                    }
                    //Se anyade una llamada a impresiones
                    
                    if(version_tomcat <= 6){
                    objUtiles.abrirModal("axisimprimir", "src", "modal_axisimprimir.do?dt="+<%=new java.util.Date().getTime()%>+"&operation=impresion_doc&MENSAJE="+mensaje+"&SEGURO=" + objDom.getValorNodoDelComponente(doc.getElementsByTagName("OSSEGURO"), 0, 0));
                    }
                    else{
                    	objUtiles.abrirModal("axisimprimir", "src", "modal_axisimprimir.do?dt="+<%=new java.util.Date().getTime()%>+"&operation=impresion_doc&MENSAJE="+encodeURI(mensaje)+"&SEGURO=" + objDom.getValorNodoDelComponente(doc.getElementsByTagName("OSSEGURO"), 0, 0));
                    }
                } 
            }
            
            function callbackInicializaSuplemento (ajaxResponseText){
                var doc = objAjax.domParse(ajaxResponseText);
                //alert(ajaxResponseText);
                
                if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
                    var PFEFECTO = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("PFEFECTO")[0])) ? objDom.getValorNodoDelComponente(doc.getElementsByTagName("PFEFECTO"), 0, 0) : null );
                    if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("PMODFEFE")[0])){
                        PMODFEFE = objDom.getValorNodoDelComponente(doc.getElementsByTagName("PMODFEFE"), 0, 0);
                        if(objUtiles.utilEquals(PMODFEFE, 1)){
                            f_abrir_axisctr039 (PFEFECTO);
                        } else{
                            f_editar_suplemento(PFEFECTO);
                        }   
                    }
                }
            }
            
            function callbackEmitir(ajaxResponseText) {
                
                // Recibe la respuesta Ajax de emitir propuesta.
                // Y escribe los mensajes de info/error correspondientes.
                var doc = objAjax.domParse(ajaxResponseText);
                //alert(ajaxResponseText);
                // Hacemos la llamada para pintar los errores/infos
                if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
                
                    var hayError = 0;
                    if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("hayError")[0])){
                      hayError = objDom.getValorNodoDelComponente(doc.getElementsByTagName("hayError"), 0, 0);
                    }
                  
                    if (hayError != 1){
                         // Si todo ha ido bien, desactivar botones.
                         objDom.setVisibilidadPorId("but_emitir", "hidden");
                         objDom.setVisibilidadPorId("but_1000081", "hidden");//CONF-172
                         //recogemos mensaje con el nmero de poliza y lo enviamos a
                         //impresion Axisimprimir
                         if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("TINFO")[0])){
                             var mensaje = objDom.getValorNodoDelComponente(doc.getElementsByTagName("TINFO"), 0, 0);
                         }else{
                             var mensaje="";
                         }
           
                         //Se anyade una llamada a impresiones
                         LOCAL_showHideLoader("01", "", "none");
                         
                         if(version_tomcat <= 6){
	                         objUtiles.abrirModal("axisimprimir", "src", "modal_axisimprimir.do?dt="+<%=new java.util.Date().getTime()%>+"&operation=impresion_doc&MENSAJE="+mensaje+"&SEGURO=" + objDom.getValorNodoDelComponente(doc.getElementsByTagName("OSSEGURO"), 0, 0));
                         }else{
                        	 objUtiles.abrirModal("axisimprimir", "src", "modal_axisimprimir.do?dt="+<%=new java.util.Date().getTime()%>+"&operation=impresion_doc&MENSAJE="+encodeURI(mensaje)+"&SEGURO=" + objDom.getValorNodoDelComponente(doc.getElementsByTagName("OSSEGURO"), 0, 0));
                         }
                         
                         
                         }else{
                        objDom.setVisibilidadPorId("but_emitir", "hidden");
                        objDom.setVisibilidadPorId("but_1000081", "hidden");// CONF-172
                        objUtiles.ejecutarFormulario ("axis_axisctr020.do?", "limpiar_suplemento", document.miForm, "_self", objJsMessages.jslit_cargando);    
                    }
                } 
            }
            
            /* Callback de la llamada a F_GET_ACCIONES para saber si el recibo seleccionado tiene acciones.
            * Si tiene exactamente 1 accin a realizar, devuelve va Ajax su CFORM (pantalla destino de la accin)
            * para que la pantalla AXISCTR020 pueda navegar a esa pantalla. Si no, no devolver CFORM, y la pantalla
            * AXISCTR020 sabr que tiene que abrir el modal AXISADM028 para escoger accin.
            */
            function callbackAjaxGestionarRecibos(ajaxResponseText, TESTREC) {
                var doc = objAjax.domParse(ajaxResponseText);
                if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
                
                    if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("NRECIBO")[0])) {
                        var NRECIBO = objDom.getValorNodoDelComponente(doc.getElementsByTagName("NRECIBO"), 0, 0);                                                
                        
                        if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("PSALTAR")[0])) {
                            var PSALTAR = objDom.getValorNodoDelComponente(doc.getElementsByTagName("PSALTAR"), 0, 0);
                            if (PSALTAR == 0) {
                                var mensaje="";
                                alert("<axis:alt f="axisctr020" c="ALERT2_PANTALLA" lit="9000790"/>");    
                            } else if (PSALTAR == 1) {
                                if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("CFORM")[0])) {
                                    var CFORM = objDom.getValorNodoDelComponente(doc.getElementsByTagName("CFORM"), 0, 0);
                                    f_aceptar_axisadm028(NRECIBO, CFORM);                    
                                }
                            } else {    
                                f_abrir_axisadm028(NRECIBO, TESTREC);
                            }
                        }
                    }
                } 
            }
            
            //Modal axisopen URL
            function f_cancelar_axisopenurl() {
                  f_abrir_axisctr019();
            } 
            
            /****************************************************************************************/
            /*********************************** ORDENACION TABLAS **********************************/
            /****************************************************************************************/
         
            function f_ordenar(campo, tabla, outerMap) {
                <% request.setAttribute(axis.util.Constantes.FORMDATA, request.getAttribute(axis.util.Constantes.FORMDATA)); %>
                objUtiles.ejecutarFormulario ("axis_axisctr020.do?ordenar=true&campo=" + campo + "&tabla=" + tabla + "&outerMap=" + outerMap, "form", document.miForm, "_self");         
            }
            
          
          function f_detrecibos(NRECIBO) {
            objUtiles.ejecutarFormulario("axis_axisctr020.do?NRECIBO="+NRECIBO, "consultarDetRecibos", document.miForm, "_self", objJsMessages.jslit_cargando);
         }
        // Modal Detalle Riesgo Asegurado ATUOS ACTR148
        function f_cerrar_axisctr148()         {
            objUtiles.cerrarModal("axisctr148");
        }      
        
        function f_detprovision(CGARANT, SSEGURO) {
            objUtiles.ejecutarFormulario("axis_axisctr020.do?CGARANT="+CGARANT, "consultarDetRecibos", document.miForm, "_self", objJsMessages.jslit_cargando);
         }
            
        function f_abrir_axisctrautos (NRIESGO) {
                objUtiles.abrirModal("axisctr148", "src", "axis_axisctr148.do?operation=form&NRIESGO=" + NRIESGO+"&origen=axisctr020");
        }        
            
       // Bug 10024-11/05/2009-AMC    
       function f_cambiar_estado_diferido(PCMOTMOV,PCESTADO){
        
        var mensaje = "<axis:alt f="axisctr020" c="MENSA1" lit="9001555"/>";
        var answer = confirm(mensaje);
        if (answer)
            document.miForm.SECACTIVA.value = "DSP_DIFERIDOS";
            objUtiles.ejecutarFormulario("axis_axisctr020.do?PCMOTMOV="+PCMOTMOV+"&PCESTADO="+PCESTADO, "cambioestdiferir",  document.miForm, "_self", objJsMessages.jslit_cargando); 
       }

        // MODALES GENERICAS    
        function f_abrir_modal(cual, noXButton, optionalQueryString) {
						
            if (objUtiles.estaVacio(optionalQueryString))                
                optionalQueryString = "";
                
            objUtiles.abrirModal(cual, "src", "modal_" + cual + ".do?operation=form" + optionalQueryString);   
        }
        
        function f_cerrar_modal(cual) {
            objUtiles.cerrarModal(cual);
        }
        
        function f_aceptar_modal(cual, params) {
            f_cerrar_modal(cual);
            
            //f_cerrar_axisctr019();
            //    document.miForm.SSEGURO.value=SSEGURO;
            //    document.miForm.NMOVIMI.value= -9999;
            //    objUtiles.ejecutarFormulario ("axis_axisctr020.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);  
        }
       
        function f_gestioagenda(NLINEA,NPOLIZA,PMODO) {
            var SSEGURO = "${datos_poliza.SSEGURO}";
           param = "&NPOLIZA="+NPOLIZA+"&NLINEA="+NLINEA+"&PMODO="+PMODO+"&SSEGURO="+SSEGURO;
            document.miForm.SECACTIVA.value = "DSP_AGENDA";
           //f_abrir_modal('axisctr063',null,param);
           objUtiles.abrirModal('axisctr063', "src", "modal_axisctr063.do?operation=init" + param); 
        }
        
        function f_cerrar_axisctr063() {
          objUtiles.cerrarModal("axisctr063");   
          document.miForm.SECACTIVA.value = "DSP_AGENDA";
          objUtiles.ejecutarFormulario ("axis_axisctr020.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);  
        }
        
        function f_aceptar_axisctr063 () {
           f_cerrar_modal('axisctr063');
           document.miForm.SECACTIVA.value = "DSP_AGENDA";
            objUtiles.ejecutarFormulario ("axis_axisctr020.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);  
        }
        
        //axsctr063_1
        
        function f_cerrar_axisctr063_1() {
			
            objUtiles.cerrarModal("axisctr063_1");   
            document.miForm.SECACTIVA.value = "DSP_AGENDA";
            objUtiles.ejecutarFormulario ("axis_axisctr020.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando); 
          
        }
        
        function f_aceptar_axisctr063_1 (NMOVIMI, CMOTMOV, TOBSERV) {
          // f_cerrar_modal('axisctr063_1');
           
           objUtiles.cerrarModal('axisctr063_1'); 
           //document.miForm.SECACTIVA.value = "DSP_AGENDA";
           //alert("nmovimi: "+NMOVIMI+" - cmotmov: "+ CMOTMOV+" - tobser;"+ TOBSERV+" - TTITULO: "+TITULO+" - TEXTO: "+TEXTO);    
         objUtiles.ejecutarFormulario ("axis_axisctr020.do?NMOVIMI_REGISTRO="+NMOVIMI+"&CMOTMOV_REGISTRO="+CMOTMOV+"&TOBSERV_REGISTRO="+TOBSERV, "deletemov", document.miForm, "_self", objJsMessages.jslit_cargando);
           
           
           //objUtiles.ejecutarFormulario ("axis_axisctr020.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);
        } 
        
       //18176 
       function f_agd_gestioagenda(IDAPUNTE,IDAGENDA,CMODO) {          
           param = "&IDAPUNTE="+IDAPUNTE+"&IDAGENDA="+IDAGENDA+"&CMODO="+CMODO;         
           document.miForm.SECACTIVA.value = "DSP_TAREAS_USUARIO";           
           objUtiles.abrirModal('axisagd004', "src", "modal_axisagd004.do?operation=init" + param); 
        }
        
       function f_agd_gestioagenda_alta(IDAPUNTE,IDAGENDA,NPOLIZA,NCERTIF,CMODO) {          
           var SSEGURO = objDom.getValorPorId("SSEGURO");
           param = "&IDAPUNTE="+IDAPUNTE+"&IDAGENDA="+IDAGENDA+"&CMODO="+CMODO+"&CCLAGD=1&TCLAGD="+SSEGURO+"&TCLAGD_OUT="+NPOLIZA+" - "+NCERTIF;                
           document.miForm.SECACTIVA.value = "DSP_TAREAS_USUARIO";           
           objUtiles.abrirModal('axisagd004', "src", "modal_axisagd004.do?operation=form" + param); 
        }
        
       function f_cerrar_modal_004(PANTALLA) {
          objUtiles.cerrarModal(PANTALLA);   
          document.miForm.SECACTIVA.value = "DSP_TAREAS_USUARIO";
          objUtiles.ejecutarFormulario ("axis_axisctr020.do?CHANGEMODO=1", "form", document.miForm, "_self", objJsMessages.jslit_cargando);  
        }
        //18176
       
        //
        // Bug 11177.NMM.i.------
        //
        function f_ConsultaAgenda(NLINEA,NPOLIZA,PMODO) {
            var SSEGURO = "${datos_poliza.SSEGURO}";
           param = "&NLINEA="+NLINEA+"&PMODO="+PMODO+"&SSEGURO="+SSEGURO+"&ORIGEN=CONSULTA_POLISSA";
            document.miForm.SECACTIVA.value = "DSP_AGENDA";
           //f_abrir_modal('axisctr057',null,param);
           objUtiles.abrirModal('axisctr057', "src", "axis_axisctr057.do?operation=init" + param); 
        }

        function f_seleccionar_siniestro(NSINIES, SSEGURO){
            // if (objUtiles.estaVacio(NSINIES) || objUtiles.estaVacio(SSEGURO))
            //alert("En seleccionar siniestro");            
            if (objUtiles.estaVacio(NSINIES))
               alert (objJsMessages.jslit_error_de_seleccion);
            else
            // objUtiles.ejecutarFormulario ("axis_axissin006.do?NSINIESselected="+NSINIES, "inicializarDatos", document.miForm, "_self", objJsMessages.jslit_cargando);     
           //objUtiles.abrirModal('axissin006', "src", "axis_axissin006.do?operation=inicializarDatos&NSINIESselected="+NSINIES); 
            //objUtiles.ejecutarFormulario("axis_axissin006.do", "consultarPoliza", document.miForm, "_self", objJsMessages.jslit_cargando);
            objUtiles.ejecutarFormulario("axis_axisctr020.do?NSINIES="+NSINIES, "consultarSiniestro", document.miForm, "_self", objJsMessages.jslit_cargando);   
        }         

        
        function f_cancelar_axisctr057(){
           objUtiles.cerrarModal("axisctr057");  
        }
        //
        // Bug 11177.NMM.f.------
        //

        function f_actualizar_provisiones() {
            var SSEGURO = "${datos_poliza.SSEGURO}";
            
            objAjax.invokeAsyncCGI("axis_axisctr020.do", 
            callbackAjaxActualizarProvisiones, "operation=actualizar_provisiones&SSEGURO=" + SSEGURO,  this, objJsMessages.jslit_cargando, false);
        }

        function f_ajax_obtener_impagados (NRECIBO){
            document.miForm.NRECIBO_sel.value=NRECIBO;
            var SSEGURO = document.miForm.SSEGURO.value;
            //alert("Antes de la llamada al mtodo");
            //alert("NRECIBO:"+NRECIBO);
            //alert("SSEGURO:"+SSEGURO);
             objAjax.invokeAsyncCGI("axis_axisctr020.do", 
                callbackAjaxObtenerImpagados, "operation=ajax_obtener_impagados&NRECIBO=" + NRECIBO + "&SSEGURO=" + SSEGURO,  this);
            
        }

        /****************************************************************************************/
        /************************************ CALLBACKS AJAX ************************************/
        /****************************************************************************************/

        function callbackAjaxActualizarProvisiones(ajaxResponseText) {
            try {
                var doc = objAjax.domParse(ajaxResponseText);
                
                if (!objAppMensajes.existenErroresEnAplicacion(doc, false)) {

                    var tableM = document.getElementById("GARANDEF");
                    var tbodyM = tableM.getElementsByTagName("tbody")[0];
                    var trM = tbodyM.getElementsByTagName("tr");
                    var columns = 0;

                    if (objDom.numeroDeTags(doc, "OB_IAX_GARANTIAS")>0){
                        objLista.borrarFilasDeLista ("GARANDEF", "3", '<axis:alt f="axisctr020" c="MENSA2" lit="1000254"/>');
                    }
                    
                    if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("CGARANT")[0]))
                        columns = columns + 1;
                    
                    if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("TGARANT")[0]))
                        columns = columns + 1;
                    
                    if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("ICAPITAL")[0]))
                        columns = columns + 1;
                    
                    if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("IPRIANU")[0]))
                        columns = columns + 1;
                    
                    if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("NDETGAR")[0]))
                        columns = columns + 1;
                    
                    if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("PROVMAT")[0]))
                        columns = columns + 1;
                    
                    if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("IREDUCC")[0]))
                        columns = columns + 1;
                        
                    if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("DETPROV")[0]))                   
                        columns = columns + 1; 
                    <axis:visible c="GARANPROV_VALRESC" f="axisctr020">
                    if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("VALRESC")[0]))
                        columns = columns + 1;
                    </axis:visible>
                    for (var i = 0; i < objDom.numeroDeTags(doc, "OB_IAX_GARANTIAS") ; i++) {
                        // Como hay resultados, borramos la fila vacia
                        if (i==0) 
                        objLista.borrarFilaVacia(tbodyM, trM);
                                                                       
                        
                        // Obtenemos el estilo para la fila que insertaremos
                        var rowstyle = objLista.addEstiloEnFilaDeLista(trM, "gridEven", "gridNotEven");
                        
                        // Creamos una nueva fila vacia y le damos el estilo obtenido
                        var newtr = objLista.crearNuevaFila(rowstyle);
                        
                        // Creamos un array de columnas a añadir a la nueva fila del displayTag
                        var newtd = new Array(columns);
                        
                        // Creamos todas las columnas (newtdX) asociadas a la fila que estamos creando
                        if (columns >=7){ // APRA
                            var CGARANT = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("CGARANT")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("CGARANT"), i, 0) : "");
                            newtd[0] = objLista.addTextoEnLista(CGARANT);
                            
                            // Creamos todas las columnas (newtdX) asociadas a la fila que estamos creando
                            var TGARANT = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("TGARANT")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("TGARANT"), i, 0) : "");
                            newtd[1] = objLista.addTextoEnLista(TGARANT);
                            
                            // Creamos todas las columnas (newtdX) asociadas a la fila que estamos creando
                            var ICAPITAL = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("ICAPITAL")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("ICAPITAL"), i, 0) : null);
                            var FORMAT = f_truncator(ICAPITAL,2);
                            newtd[2] = objLista.addTextoEnLista(f_formatNumber(FORMAT));
                            
                            // Creamos todas las columnas (newtdX) asociadas a la fila que estamos creando
                            var IPRIANU = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("IPRIANU")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("IPRIANU"), i, 0) : "");
                            newtd[3] = objLista.addTextoEnLista(IPRIANU);
            
                            var NDETGAR = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("NDETGAR")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("NDETGAR"), i, 0) : null);
                            newtd[4] = objLista.addTextoEnLista(NDETGAR);
            
                            var PROVMAT = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("PROVMAT")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("PROVMAT"), i, 0) : "");
                            FORMAT = f_truncator(PROVMAT,2);
                            newtd[5] = objLista.addTextoEnLista(f_formatNumber(FORMAT));
                            
                            var IREDUCC = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("IREDUCC")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("IREDUCC"), i, 0) : "");
                            newtd[6] = objLista.addTextoEnLista(IREDUCC);
                            <axis:visible c="GARANPROV_VALRESC" f="axisctr020">
                                var VALRESC = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("VALRESC")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("VALRESC"), i, 0) : "");
                                FORMAT = f_truncator(VALRESC,2);
                                newtd[7] = objLista.addTextoEnLista(f_formatNumber(FORMAT));
                            </axis:visible>
                        }else{
                            columns=0;
                            var CGARANT = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("CGARANT")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("CGARANT"), i, 0) : "");
                            newtd[columns] = objLista.addTextoEnLista(CGARANT);
                            
                            // Creamos todas las columnas (newtdX) asociadas a la fila que estamos creando
                            columns = columns + 1;
                            var TGARANT = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("TGARANT")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("TGARANT"), i, 0) : "");
                            newtd[columns] = objLista.addTextoEnLista(TGARANT);
                            
                            columns = columns + 1;
                            var PROVMAT = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("PROVMAT")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("PROVMAT"), i, 0) : null);
                            var FORMAT = f_truncator(PROVMAT,2);
                            newtd[columns] = objLista.addTextoEnLista(f_formatNumber(FORMAT));
                            <axis:visible c="GARANPROV_VALRESC" f="axisctr020">
                                columns = columns + 1;
                                var VALRESC = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("VALRESC")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("VALRESC"), i, 0) : "");
                                FORMAT = f_truncator(VALRESC,2);
                                newtd[columns] = objLista.addTextoEnLista(f_formatNumber(FORMAT));
                            </axis:visible>
                            
                           // var DETPROV = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("TGARANT")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("TGARANT"), i, 0) : "");
                           
                           //var NMOVIMI = objUtiles.estaVacio(GARANDEF.GARANPROV.OB_IAX_GARANTIAS.NMOVIMI)? '' : GARANDEF.GARANPROV.OB_IAX_GARANTIAS.NMOVIMI;
                           var NMOVIMI = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("NMOVIMI")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("NMOVIMI"), i, 0) : "");
                           var FEFECTO = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("FEFECTO")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("FEFECTO"), i, 0) : "");
                           
                           <axis:visible c="GARANPROV_DETPROV" f="axisctr020">
                           
                           var jclass  = "campo campotexto";
                           var desctd=document.createElement("td");
                           desctd.setAttribute('class','dspText');
                           desctd.className="dspText";
                                      
                           var descdiv=document.createElement("div");
                           descdiv.setAttribute('class','dspIcons');
                           descdiv.className="dspIcons";
                                     
                           var descinput = document.createElement("input");
                           descinput.setAttribute('id','DETPROV_'+CGARANT);  
                           descinput.setAttribute('name','DETPROV_'+CGARANT);
                           descinput.name='DETPROV_'+CGARANT;
                           descinput.id='DETPROV_'+CGARANT;
                                            
                           descinput.setAttribute('class',jclass); //Será obligatorio?
                           descinput.className=jclass;   
                                            
                           descinput.setAttribute('type','text');
                           descinput.type="text";
                           //descinput.onfocus = new Function("f_on_focus_capital(this)");
                                           
                           var ael = document.createElement("a");                          
                           
                           //'${datos_poliza.SSEGURO}','${GARANDEF.GARANPROV.OB_IAX_GARANTIAS.NMOVIMI}', '${GARANDEF.GARANPROV.OB_IAX_GARANTIAS.MASDATOS.CGARANT}','${GARANDEF.GARANPROV.OB_IAX_GARANTIAS.MASDATOS.FEFECTO}'
                           
                           var funcion_img = "javascript:f_abrir_axisctr215('"+'${datos_poliza.SSEGURO}'+"','"+'${datos_poliza.NMOVIMI}'+"','"+CGARANT+"','"+'<fmt:formatDate pattern="dd/MM/yyyy" value="${today}"/>'+"')";
                           ael.setAttribute('href',funcion_img);
                           var imgel = document.createElement("img");
                           imgel.setAttribute('border','0');
                           imgel.setAttribute('title','<axis:alt f="axisctr020" c="LITERAL8" lit="1000113" />');
                           imgel.setAttribute('alt','<axis:alt f="axisctr020" c="LITERAL8" lit="1000113" />');
                                                       
                           imgel.setAttribute('src','images/mas.gif');
                           ael.appendChild(imgel);        
                                                          
                           descdiv.appendChild(ael);                
                                                                                                                
                           desctd.appendChild(descdiv);
                                                                            
                           //newtd[ttd] = desctd;ttd++;
                           columns = columns + 1;
                           newtd[columns] = desctd;
                           
                           </axis:visible>
                            
                        }
            
                        // Añadimos la nueva fila(con sus nuevas columnas) al cuerpo del displayTag
                        objLista.addNuevaFila(newtd, newtr, tbodyM);
                    } // Fi for
                 
                    for (var i = 0; i < objDom.numeroDeTags(doc, "PROVPOL") ; i++) {
                        var PROVPOL = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("IMPPROVISION")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("IMPPROVISION"), i, 0) : "");
                        document.miForm.PROVPOL.value = PROVPOL;
                    } // Fi for
                    
                    objEstilos.toggleDisplay('DSP_PROVGAR1', document.getElementById("DSP_PROVGAR_parent")); 
                    objEstilos.toggleDisplay('DSP_PROVGAR2', document.getElementById("DSP_PROVGAR_parent")); 
                    objEstilos.toggleDisplay('DSP_PROVGAR3', document.getElementById("DSP_PROVGAR_parent"));
                }
                
            } catch (e) {
                if (isDebugAjaxEnabled == "true")
                    alert (e.name + " " + e.message);
            } 
        }     
        
        function callbackAjaxObtenerImpagados(ajaxResponseText) {
        var jDate = new JsFecha();
        
            try {
                //alert(ajaxResponseText);
                var doc = objAjax.domParse(ajaxResponseText);
                
                if (!objAppMensajes.existenErroresEnAplicacion(doc, false)) {

                    var tableM = document.getElementById("IMPAGOS");
                    var tbodyM = tableM.getElementsByTagName("tbody")[0];
                    var trM = tbodyM.getElementsByTagName("tr");

                    objLista.borrarFilasDeLista ("IMPAGOS", "5", '<axis:alt f="axisctr020" c="MENSA3" lit="1000254"/>');
                    
                    if(objDom.numeroDeTags(doc, "CCARTA")>0){
                   
                        if(document.getElementById("seccion_impagados")){
                            var seccion =document.getElementById("seccion_impagados");
                            seccion.style.display ="";
                        } 
                    
                    for (var i = 0; i < objDom.numeroDeTags(doc, "CCARTA") ; i++) {
                        // Como hay resultados, borramos la fila vacia
                        if (i==0) 
                            objLista.borrarFilaVacia(tbodyM, trM);
                        // Obtenemos el estilo para la fila que insertaremos
                        var rowstyle = objLista.addEstiloEnFilaDeLista(trM, "gridEven", "gridNotEven");
                        // Creamos una nueva fila vacia y le damos el estilo obtenido
                        var newtr = objLista.crearNuevaFila(rowstyle);
                        // Creamos un array de columnas a añadir a la nueva fila del displayTag
                        var newtd = new Array(5);
                        
                        // Creamos todas las columnas (newtdX) asociadas a la fila que estamos creando
                        var CTRACTAT = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("CTRACTAT")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("CTRACTAT"), i, 0) : "");
                        newtd[0] = objLista.addTextoEnLista(CTRACTAT);
                        
                        // Creamos todas las columnas (newtdX) asociadas a la fila que estamos creando
                        var FFEJECU = objUtiles.hayValorElementoXml(doc.getElementsByTagName("FFEJECU")[i]) ? 
                        objUtiles.formateaTimeStamp2(objDom.getValorNodoDelComponente(doc.getElementsByTagName("FFEJECU"), i, 0)) : "";
                        //var FFEJECU = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("FFEJECU")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("FFEJECU"), i, 0) : "");
                        //FFEJECU = f_transform_date(FFEJECU);
                        newtd[1] = objLista.addTextoEnLista(FFEJECU);
                        
                        // Creamos todas las columnas (newtdX) asociadas a la fila que estamos creando
                        var CACTIMP = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("CACTIMP")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("CACTIMP"), i, 0) : "");
                        newtd[2] = objLista.addTextoEnLista(CACTIMP);
                        
                        // Creamos todas las columnas (newtdX) asociadas a la fila que estamos creando
                        var CCARTA = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("CCARTA")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("CCARTA"), i, 0) : "");
                        newtd[3] = objLista.addTextoEnLista(CCARTA);
        
                        var FIMPRES = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("FIMPRES")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("FIMPRES"), i, 0) : "");
                        if (FIMPRES != "") 
                            FIMPRES = objUtiles.formateaTimeStamp2(FIMPRES);
                        
                        //var FIMPRES = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("FIMPRES")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("FIMPRES"), i, 0) : "");
                        //FIMPRES = f_transform_date(FIMPRES);
                        newtd[4] = objLista.addTextoEnLista(FIMPRES);
                        
                        //alert("Antes de aadir fila");
                        // Añadimos la nueva fila(con sus nuevas columnas) al cuerpo del displayTag
                        objLista.addNuevaFila(newtd, newtr, tbodyM);
                    } // Fi for
                    
                    } else {   // fi else
                    
                         if(document.getElementById("seccion_impagados")){
                             var seccion =document.getElementById("seccion_impagados");
                             seccion.style.display ="none";
                         }
                    }

                    objEstilos.toggleDisplay('DSP_PROVGAR1', this); 
                }
                
            } catch (e) {
                if (isDebugAjaxEnabled == "true")
                    alert (e.name + " " + e.message);
            } 
        }     
        
        // ****************************************************************************************************** //
        // ****************************************************************************************************** // 
        // ****************************************************************************************************** //
        // ****************************************************************************************************** //
        function f_abrir_axisctr214(NRIESGO,SSEGURO,COBJASE){
            objUtiles.abrirModal("axisctr214", "src", "modal_axisctr214.do?operation=form&SSEGURO="+document.miForm.SSEGURO.value+"&NRIESGO="+NRIESGO+"&COBJASE="+COBJASE);
        }
        
        function f_cerrar_axisctr214() {
            objUtiles.cerrarModal("axisctr214");
        }

        function f_abrir_axisctr086(PSRECREN){
            objUtiles.abrirModal("axisctr086", "src", "modal_axisctr086.do?operation=form&PSSEGURO="+document.miForm.SSEGURO.value+"&PSRECREN="+PSRECREN);
        }
            
        function f_cerrar_axisctr086() {
            objUtiles.cerrarModal("axisctr086");
        }
            
        function f_abrir_axisctr087(SRECREN){
            objUtiles.abrirModal("axisctr087", "src", "modal_axisctr087.do?operation=form&SRECREN="+SRECREN);
        }
            
        function f_cerrar_axisctr087() {
            objUtiles.cerrarModal("axisctr087");
        }
        function f_recargar_cuadro_amortizacion(contador){                
                objDom.setValorPorId("NCONTADOR", contador);
                objUtiles.ejecutarFormulario("axis_axisctr020.do", "consultarCuadros", document.miForm, "_self", objJsMessages.jslit_cargando);                 
        }   
        function f_abrir_axisctr163 (idGarantia) {
            // objDom.setValorPorId("CGARANT", idGarantia);
            objUtiles.abrirModal("axisctr163", "src", "modal_axisctr163.do?operation=form&CGARANT=" + idGarantia);
        }
                
        function f_borrar_agenda(IDOBS){
            // Antes de proceder a borrar el registro, pedimos confirmacion
             var confirma=confirm(objJsMessages.jslit_confirma_borrar);
             document.miForm.SECACTIVA.value = "DSP_AGENDA";
                if (confirma) {
                   objDom.setValorPorId("IDOBS", IDOBS);
                   objUtiles.ejecutarFormulario ("axis_axisctr020.do?subseccion=DSP_AGENDA", "borrar_agenda", document.miForm, "_self", objJsMessages.jslit_cargando);     
                }
        }
        function f_comisions(){
            objUtiles.ejecutarFormulario ("axis_axisctr020.do", "comisions", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
            
         function f_actualizar_estado(CESTADO,SSEGURO,NMOVIMI,NRIESGO,CMOTMOV,CGARANT,CPREGUN){
           objAjax.invokeAsyncCGI("axis_axisctr020.do", 
                callbackAjaxActEstado, "operation=actualizarestadosolicitud&CGARANT="+CGARANT+"&SSEGURO="+SSEGURO+"&CESTADO="+CESTADO+"&NMOVIMI="+NMOVIMI+"&NRIESGO="+NRIESGO+"&CPREGUN="+CPREGUN+"&CMOTMOV="+CMOTMOV,  this);
         
         }
         
         function callbackAjaxActEstado(ajaxResponseText) {
            try {
         
                var doc = objAjax.domParse(ajaxResponseText);
                
                objAppMensajes.existenErroresEnAplicacion(doc, false)
                
            } catch (e) {
                if (isDebugAjaxEnabled == "true")
                    alert (e.name + " " + e.message);
            } 
        }  
        
        function f_but_1000615() { // Aadir documentacin
            f_abrir_modal("axisfileupload", true, "&SSEGURO=${__formdata.SSEGURO}&NMOVIMI=1");
        }
        
        function f_aceptar_axisfileupload(){
           objUtiles.cerrarModal("axisfileupload");
                  document.miForm.SECACTIVA.value = "DSP_DOCUMENTACION";
                  objUtiles.ejecutarFormulario ("axis_axisctr020.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);  
        }
        /** INICI MODAL AXISCTR010 **/
        function f_abrir_axisctr010 (MODO) {
            var CTIPCOM =  objDom.getValorPorId("CTIPCOM");
            var NRIESGO =  objDom.getValorPorId("NRIESGO");
           if (!objUtiles.estaVacio(CTIPCOM) ){
                 if (CTIPCOM != 91 ){
                    objUtiles.abrirModal("axisctr010", "src", "modal_axisctr010.do?operation=form&CTIPCOM="+CTIPCOM+"&CMODO="+MODO+"&NRIESGO="+NRIESGO); 
                }else
                     objUtiles.abrirModal("axisctr189", "src", "modal_axisctr189.do?operation=form&CTIPCOM="+CTIPCOM+"&CONSULTA=1&NRIESGO="+NRIESGO); 
            }
        }
        function f_cerrar_axisctr010 () {
            objUtiles.cerrarModal("axisctr010");
        }    
        function f_aceptar_axisctr010 () {
            f_cerrar_axisctr010();
        } 
        function f_cerrar_axisctr184 () {
            objUtiles.cerrarModal("axisctr184");
        }
        function f_abrir_axisctr184(CTAPRES) {
            var SSEGURO =  objDom.getValorPorId("SSEGURO");
            var NRIESGO =  objDom.getValorPorId("NRIESGO");
            objUtiles.abrirModal("axisctr184", "src", "modal_axisctr184.do?operation=form&SSEGURO="+SSEGURO+"&NRIESGO="+NRIESGO+"&CTAPRES="+CTAPRES); 
        }
        
        function f_abrir_riedireccion(NRIESGO){
            
            var geo = '${__formdata.GEODIRECCION}';
            if (geo == 1)
                f_abrir_modal("axisdir002", false, "&NRIESGO=" + NRIESGO + "&MODO=CONSULTA");
            else
                f_abrir_modal("axisctr042", false, "&NRIESGO=" + NRIESGO); 
        }
        
        function f_cancelar_axisdir002(MODO){
            f_cerrar_modal('axisdir002');
        }
        
        function f_abrir_188(cpregun,tpregun,tipo) {
            // objUtiles.abrirModal("axisctr188", "src", "modal_axisctr188.do?operation=form&CPREGUN=" + cpregun+"&TPREGUN="+tpregun+"&TIPO_PREGUNTA="+tipo+"&CONSULTA=1&NRIESGO="+objDom.getValorPorId("NRIESGO"));
            objUtiles.abrirModal("axisctr218", "src", "modal_axisctr218.do?operation=form&CPREGUN=" + cpregun+"&TPREGUN="+tpregun+"&TIPO_PREGUNTA="+tipo+"&CONSULTA=1&NRIESGO="+objDom.getValorPorId("NRIESGO")+"&NMOVIMI="+objDom.getValorPorId("NMOVIMI")+"&CTABLA=POL"+"&ORIGEN=AXISCTR020");
        }

        function toggleDisplay2 (ths, objeto, img_mes, img_menys) {
         
            var pimg_mes="images/mes.gif"
            var pimg_menys="images/menys.gif"
            
            if (img_mes!=undefined || img_mes!=null) pimg_mes=img_mes;
            if (img_menys!=undefined || img_menys!=null) pimg_menys=img_menys;
            
	   			  var thisChildrenId=ths+"_children";
            if (document.getElementById(thisChildrenId)!=null){
                var actualDisplayValue=document.getElementById(thisChildrenId).style.display;
            }
                
            var resto = document.getElementsByTagName("tr");
		
            for (i=0; i < resto.length; i++) {            
                if(resto[i].getAttribute("tipo")=='cont'){
                     resto[i].style.display="none";
                }
            }

            if (actualDisplayValue=="none"){ 
                  actualDisplayValue="";// en vez de "block", mejor "" para evitar FireFox bug
                  var imagen =	document.getElementById("img_"+ths);
                  
                  
                if ( !objUtiles.estaVacio(imagen)) imagen.src=pimg_menys;//"images/menys.gif";
                
            }else{ 
                actualDisplayValue="none";
                 var imagen =	document.getElementById("img_"+ths);
                 
                if ( !objUtiles.estaVacio(imagen)) imagen.src=pimg_mes;//"images/mes.gif";
            }
            if (document.getElementById(thisChildrenId)!=null){
                document.getElementById(thisChildrenId).style.display=actualDisplayValue;
            }
         }   

          
        // Bug 0027955/0152240 - JSV (17/09/2013) => Añadimos parametro a  f_abrir_axisctr074 
        function f_abrir_axisctr074(ctipo,CTIPVISGRUP){
              objUtiles.abrirModal("axisctr074", "src", "modal_axisctr074.do?operation=form&NRIESGO="+document.miForm.NRIESGO.value +"&CTIPVISGRUP="+CTIPVISGRUP+"&CONSULTA=1&CTIPO="+ctipo);
        }
    
     function f_cerrar_axisctr074() {
        objUtiles.cerrarModal("axisctr074");
    }  
        
         function f_but_9904239() {
              objAjax.invokeAsyncCGI("axis_axisctr020.do", callbackEmitirColectivo, "operation=emitirPropuestaColectiva&SSEGURO="+objDom.getValorPorId("SSEGURO"), this,  objJsMessages.jslit_cargando, false);
         }
        
         function callbackEmitirColectivo(ajaxResponseText) {
            
            // Recibe la respuesta Ajax de emitir propuesta colectiva.
            // Y escribe los mensajes de info/error correspondientes.
            var doc = objAjax.domParse(ajaxResponseText);

            // Hacemos la llamada para pintar los errores/infos
            if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
            
                var hayError = 0;
                if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("hayError")[0])){
                  hayError = objDom.getValorNodoDelComponente(doc.getElementsByTagName("hayError"), 0, 0);
                }
              
                if (hayError != 1){
                     // Si todo ha ido bien, desactivar botones.
                   
                     objDom.setVisibilidadPorId("but_9904239", "hidden");
                   
                     //recogemos mensaje con el nmero de poliza y lo enviamos a
                     //impresion Axisimprimir
                     if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("TINFO")[0])){
                         var mensaje = objDom.getValorNodoDelComponente(doc.getElementsByTagName("TINFO"), 0, 0);
                     }else{
                         var mensaje="";
                     }
                     var continuaEmitir = objDom.getValorNodoDelComponente(doc.getElementsByTagName("continuaEmitir"), 0, 0);                                          
                     if (continuaEmitir == '0'){
                        //en este caso, se puede continuar emitiendo.
                        //Se anyade una llamada a impresiones
                        
                        if(version_tomcat <= 6){
                        	objUtiles.abrirModal("axisimprimir", "src", "modal_axisimprimir.do?dt="+<%=new java.util.Date().getTime()%>+"&operation=impresion_doc&MENSAJE="+mensaje+"&SEGURO=" + objDom.getValorNodoDelComponente(doc.getElementsByTagName("OSSEGURO"), 0, 0));
                        }else{
                        	objUtiles.abrirModal("axisimprimir", "src", "modal_axisimprimir.do?dt="+<%=new java.util.Date().getTime()%>+"&operation=impresion_doc&MENSAJE="+encodeURI(mensaje)+"&SEGURO=" + objDom.getValorNodoDelComponente(doc.getElementsByTagName("OSSEGURO"), 0, 0));
                        }
                        
                     }
                     else if(continuaEmitir == '2'){
		     	//Bug 29665/163095 - 16/01/2013 - AMC
                        //No recargamos, hemos diferido la emisión de los nertificados
                     }
                     else{                        
                        objUtiles.ejecutarFormulario ("axis_axisctr020.do?", "form", document.miForm, "_self", objJsMessages.jslit_cargando);
                     }       
                }else{
                 <axis:visible c="BT_EMITIR" f="axisctr020">
                    try{
                        objDom.setVisibilidadPorId("but_9904239", "visible");
                    }
                    catch(ErrorVisibilidad) {}
                    </axis:visible>
                }
            } 
         }
            
         function f_but_9904240() {
              objAjax.invokeAsyncCGI("axis_axisctr020.do", callbackSuplemColectivo, "operation=abrirSuplemColectivo&SSEGURO="+objDom.getValorPorId("SSEGURO"), this,  objJsMessages.jslit_cargando, false);
         }
        
         function callbackSuplemColectivo(ajaxResponseText) {
            
            // Recibe la respuesta Ajax de emitir propuesta colectiva.
            // Y escribe los mensajes de info/error correspondientes.
            var doc = objAjax.domParse(ajaxResponseText);

            // Hacemos la llamada para pintar los errores/infos
            if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
            
                var hayError = 0;
                if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("hayError")[0])){
                  hayError = objDom.getValorNodoDelComponente(doc.getElementsByTagName("hayError"), 0, 0);
                }
              
                if (hayError != 1){
                     // Si todo ha ido bien, desactivar botones.
                    
                     objDom.setVisibilidadPorId("but_9904240", "hidden");
                 
                     //recogemos mensaje con el nmero de poliza y lo enviamos a
                     //impresion Axisimprimir
                     if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("TINFO")[0])){
                         var mensaje = objDom.getValorNodoDelComponente(doc.getElementsByTagName("TINFO"), 0, 0);
                     }else{
                         var mensaje="";
                     }
                     objUtiles.ejecutarFormulario ("axis_axisctr020.do?", "form", document.miForm, "_self", objJsMessages.jslit_cargando);
                }else{
                <axis:visible c="BT_ABRIR" f="axisctr020">
                    try{
                        objDom.setVisibilidadPorId("but_9904240", "visible");
                    }catch(ErrorVisibilidad) {}
                    </axis:visible>
                }
            } 
        }
        
	function f_consultar_persona(SPERSON){
            objUtiles.ejecutarFormulario("axis_axisctr020.do?SPERSON_CON="+SPERSON+"&SSEGURO_CON="+document.miForm.SSEGURO.value, "consulta_persona", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
    
    function f_consultar_inspecciones(CTIPMAT, CMATRIC){       
        objUtiles.abrirModal("axisins001", "src", "modal_axisins001.do?operation=form&CTIPMAT="+CTIPMAT+"&CMATRIC="+CMATRIC);
    }
    
    function f_consultar_inspeccion(orden, inspeccion){ 
        objUtiles.abrirModal("axisins001", "src", "modal_axisins001.do?operation=form&SORDEN="+orden+"&NINSPECCION="+inspeccion);
    }
    
    function f_cerrar_axisins001() {
        objUtiles.cerrarModal("axisins001");
    } 
    
      function f_but_9903980(){    
                if (objUtiles.estaVacio (objDom.getValorComponente(document.miForm.SSEGURO)))
                    alert(objJsMessages.jslit_selecciona_una_poliza);
                else
               {
                    //RCL BUG 26926/146670 - Comprobamos que se pueda duplicar
                    //Llamamos a un m?todo que comprueba la opci?n : duplicar una propuesta
                    objAjax.invokeAsyncCGI_JSON("axis_axisctr018.do?operation=validaDupSeguro", callbackValidaDupSeguro, objJsMessages.jslit_cargando);
                }
            }
	  function callbackValidaDupSeguro(p)
            {
                objEventos.showHideLoader("ajaxLoader", "ajaxContent", "ajaxText", "", "none");
                if(!objAppMensajes.existenErroresEnAplicacion_JSON(p, true, "resultado"))
                {
                    if (p.JSON2.resultado.RETURN == 0)
                       //  objUtiles.abrirModal("axisctr019", "src", "modal_axisctr019.do?operation=form");
                         objUtiles.abrirModal("axisctr190", "src", "modal_axisctr190.do?operation=form&SSEGURO="+objDom.getValorComponente(document.miForm.SSEGURO));
                        //objUtiles.abrirModal("axisctr190", "src", "modal_axisctr190.do?operation=form&SSEGURO="+document.miForm.SSEGURO.value);
                }  
                else
                {
                    alert ("hay errores");
                }
                $.reinitialiseScroll();
            }
            
        function f_seleccionar(NSEQCAJA, NNUMLIN){
            objUtiles.abrirModal("axiscaj020", "src", "modal_axiscaj020.do?operation=form&NSEQCAJAO=" + NSEQCAJA + "&NNUMLINO=" + NNUMLIN);
        }

      //CONF-10 ASDQ ini
        function f_but_103669() {
            if (objUtiles.estaVacio (objDom.getValorComponente(document.miForm.SSEGURO)))
                alert(objJsMessages.jslit_selecciona_una_poliza);
            else
            {
                //RCL BUG 26926/146670 - Comprobamos que se pueda duplicar
                //Llamamos a un m?todo que comprueba la opci?n : duplicar una propuesta
                objAjax.invokeAsyncCGI_JSON("axis_axisctr018.do?operation=validaDupSeguro", callbackValidaDupSeguro, objJsMessages.jslit_cargando);
            }
         }
        //CONF-10 ASDQ fin
        
        function f_abrir_axisctr173(){
            document.getElementById('MODALFORM').value= 'axisctr173';
            objUtiles.abrirModal("axisctr173", "src", "modal_axisctr173.do?operation=docrequerida&origen=axisctr020&cmodoconsult=UNDERWRITING");
        }
        
        function f_cerrar_axisctr173(){
            objUtiles.cerrarModal("axisctr173");
            document.miForm.SECACTIVA.value = "DSP_DOCU_REQUERIDA";
            objUtiles.ejecutarFormulario ("axis_axisctr020.do?CHANGEMODO=1", "form", document.miForm, "_self", objJsMessages.jslit_cargando); 
        }
        
        function f_solo_cerrar_axisctr173(){
            objUtiles.cerrarModal("axisctr173");
        }         
        // INI-CONF-209-ASDQ
	    function f_convpesos(){
			//CONF-1326 CJMR
			//objUtiles.abrirModal("axisctr222","src","modal_axisctr222.do?operation=form&FEFECTO="+"${datos_poliza.FEFECTO}");
			objUtiles.abrirModal("axisctr222","src","modal_axisctr222.do?operation=form&FEFECTO="+"${datos_poliza.FEMISIO}");
	    }
	    function f_cerrar_Axisctr222() {
	        objUtiles.cerrarModal("axisctr222");
	    }
        // FIN-CONF-209-ASDQ
        </script>
    </head>
    <body onload="f_onload();">
     
        <iframe id="LOCAL01ajax4ie" class="precarga_fija" src="" style="top:0px;left:0px;z-index:100;display:none;width:100%;height:100%;filter:progid:DXImageTransform.Microsoft.Chroma(Color='#ffffff');" frameborder="0"></iframe>
    <div id="LOCAL01ajaxLoader" class="precarga_fija" style="z-index:101;display:none;width:100%;height:100%;background-color:#ffffff;filter:alpha(opacity=75);-moz-opacity:.75;opacity:.75;">&nbsp;</div>
    <div id="LOCAL01ajaxContent" class="precarga_fija" style="z-index:102;display:none;width:300px;height:100px;margin:10% 0 0 36%;background-color:#ededed;border:4px solid #000000;">
    <div style="float:left;padding:8% 0 0 10px;"><img border="0" src="images/ajax-loader.gif"/></div>
    <div style="float:left;padding:8% 0 0 10px;width:200px;height:50px;"><span id="LOCAL01ajaxText" style="font-size:14px;color:#000000;font-weight:bold;">&nbsp;</span></div>
    <div style="clear:both;">&nbsp;</div>
    </div>     
    
    
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="titulo"><axis:alt f="axisctr020" c="DOCU_REQUERIDA" lit="9901998"/></c:param>
            <c:param name="nid" value="axisctr173" />
        </c:import>  
        <form name="miForm" action="axis_axisctr020.do" method="POST">
            <input type="hidden" id="operation" name="operation" value=""/>
            
            <input type="hidden" id="IDOBS" name="IDOBS" value="${__formdata.IDOBS}"/>
            <input type="hidden" id="NRIESGO" name="NRIESGO" value="${__formdata.NRIESGO}"/>
            <input type="hidden" id="NRECIBO" name="NRECIBO" value=""/>
            <input type="hidden" name="MODALFORM" id="MODALFORM" value="${__formdata.MODALFORM}"/> 
            <input type="hidden" id="CTIPBAN" name="CTIPBAN" value=""/>
            <input type="hidden" id="CBANCAR1" name="CBANCAR1" value=""/>
            <input type="hidden" id="CTIPCOB" name="CTIPCOB" value=""/>
            <input type="hidden" id="CMOTMOV" name="CMOTMOV" value=""/>
            <input type="hidden" id="CMOTMOV_ALT" name="CMOTMOV_ALT" value=""/>
            <input type="hidden" id="PFEFECTO" name="PFEFECTO" value="${__formdata.PFEFECTO}"/>
            <input type="hidden" id="NMOVIMI" name="NMOVIMI" value="${__formdata.NMOVIMI}"/>
            <input type="hidden" id="NMOVIMI_ULTIMO" name="NMOVIMI_ULTIMO" value="${__formdata.NMOVIMI_ULTIMO}"/>
            <input type="hidden" id="MODO" name="MODO" value="${__formdata.MODO}"/>
            <input type="hidden" id="SSEGURO" name="SSEGURO" value="${__formdata['SSEGURO']}" />
            <input type="hidden" id="SECACTIVA" name="SECACTIVA" value="" />
            <input type="hidden" id="NRECIBO_sel" name="NRECIBO_sel" value="${__formdata.NRECIBO_sel}"/>
            <input type="hidden" id="SELECTEDGARANTIAS" name="SELECTEDGARANTIAS" value="${__formdata.selectedGarantias}"/>
            <input type="hidden" id="BAJA" name="BAJA" value="${__formdata.BAJA}"/>
            <input type="hidden" id="CRETENI" name="CRETENI" value="${__formdata.CRETENI}"/>
            <input type="hidden" name="NCONTADOR" id="NCONTADOR" value="${__formdata.NCONTADOR}"/>        
            <input type="hidden" id="COBJASE" name="COBJASE" value="${datos_poliza.COBJASE}"/>
            <input type="hidden" id="SPRODUC" name="SPRODUC" value="${datos_poliza.SPRODUC}"/>
            <input type="hidden" name="SSEGURO_ORIG" id="SSEGURO_ORIG" value="${__formdata.SSEGURO_ORIG}" />
            <input type="hidden" id="PERMITESUPLEM" name="PERMITESUPLEM" value="${__formdata.PERMITESUPLEM}"/>
            <input type="hidden" name="ES_COL_ADMIN" id="ES_COL_ADMIN" value="${__formdata.ES_COL_ADMIN}"/>
            <input type="hidden" name="ES_AGE_LIDER" id="ES_AGE_LIDER" value="${__formdata.ES_AGE_LIDER}"/>
            <input type="hidden" name="NCERTIF_COL" id="NCERTIF_COL" value="${__formdata.NCERTIF_COL}"/>
            <input type="hidden" name="CSITUAC_COL" id="CSITUAC_COL" value="${__formdata.CSITUAC_COL}"/>
            <input type="hidden" name="ES_SUPL_MULTP" id="ES_SUPL_MULTP" value="${__formdata.ES_SUPL_MULTP}"/>
            <input type="hidden" name="NNUMCASO" id="NNUMCASO" value="${__formdata.NNUMCASO}"/>
            <input type="hidden" name="NCASO_BPM" id="NCASO_BPM" value="${__formdata.NCASO_BPM}"/>
            <input type="hidden" name="NSOLICI_BPM" id="NSOLICI_BPM" value="${__formdata.NSOLICI_BPM}"/>
            
            <input type="hidden" name="NCERTIFDEP" id="NCERTIFDEP" value="${__formdata.NCERTIFDEP}"/>
            
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt f="axisctr020" c="MOD_PANT_AXICTR163" lit="180183"/></c:param>
                <c:param name="nid" value="axisctr163" />
            </c:import>    
               <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt f="axisctr020" c="MOD_PANT_AXICTR214" lit="9905061"/></c:param>
                <c:param name="nid" value="axisctr214" />
            </c:import>   
            
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="nid_y_titulo">axisctr019|<axis:alt f="axisctr020" c="MOD_PANT_AXICTR019" lit="1000188"/>#axisimprimir|<axis:alt f="axisctr020" c="MOD_PANT_IMPRIMIR" lit="1000205"/>|true#axisgedox|<axis:alt f="${pantalla}" c="LIT_GEDOX" lit="1000201"></axis:alt>#axisctr023|<axis:alt f="axisctr020" c="MOD_PANT_AXISCTR023" lit="1000191"/>#axisctr025|<axis:alt f="axisctr020" c="MOD_PANT_AXISCTR025" lit="140360"/>#axisctr029|<axis:alt f="${pantalla}" c="LIT_PANTALLA_DETASE" lit="1000195"/>#axisctr148|<axis:alt f="axisctr020" c="MOD_PANTALLA_AXISCTR148" lit="1000199"/>#axisctr030|<axis:alt f="axisctr020" c="MOD_PANTALLA_AXISCTR030" lit="1000196"/>#axisctr039|Suplementos#axisadm028|<axis:alt f="axisctr020" c="MOD_PANTALLA_AXISADM028" lit="1000568"/>#axisopenurl||<axis:alt f="axisctr020" c="MOD_PANTALLA_AXISOPENURL" lit="1000568"/></c:param>
            </c:import>
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="nid_y_titulo">axisctr042|<axis:alt f="axisctr020" c="MOD_PANT_AXISCTR042" lit="9000420"/>#axisctr043|<axis:alt f="axisctr020" c="MOD_PANT_AXISCTR043" lit="9000471"/></c:param>
            </c:import>
            
            <!-- INI BUG CONF-114 - 17/09/2016 - JAEG-->   
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt f="axisctr020" c="TITULO_DET" lit="1000199" /></c:param>
                <c:param name="nid" value="axisctr044" />
            </c:import>
            <!-- FIN BUG CONF-114 - 17/09/2016 - JAEG-->              
            <!-- INI-CES: 24/05/2019 : Ajuste para agenda -->
			<c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">axisctr063|<axis:alt f="axisctr020" c="MOD_PANT_AXISCTR036" lit="9001769"/></c:param>
            </c:import>
			<!-- END-CES: 24/05/2019 : Ajuste para agenda -->
            <c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">axisctr063_1|<axis:alt f="axisctr020" c="MOD_PANT_AXISCTR036" lit="9001769"/></c:param>
            </c:import>
            <!-- 18176 -->
            <c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">axisagd004|<axis:alt f="axisctr020" c="MOD_PANT_AXISAGD004" lit="9001769"/></c:param>
            </c:import>
               <c:import url="../include/modal_estandar.jsp">
                <c:param name="nid_y_titulo">axisctr190|<axis:alt f="axisctr020" c="TIT_AXISCTR190" lit="9000547" /></c:param>
            </c:import> 
             <c:import url="../include/modal_estandar.jsp">                                    
        <c:param name="titulo"><axis:alt f="axisctr009" c="TIT_FRANQ" lit="1000113" /></c:param>
        <c:param name="nid" value="axisctr074" />
    </c:import>
    
      <c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">axisctr215|<axis:alt f="axisctr020" c="MOD_PANT_AXISCTR215" lit="102656"/></c:param>
            </c:import>
                   
            <!-- S'ha d'afegir el nom de la pantalla que cridarem.Bug 11177.NMM.i.---------------------------------------------->
            <c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">axisctr057|<axis:alt f="axisctr020" c="MOD_PANTALLA_AXISCTR057" lit="9001769"/></c:param>
            </c:import>
            <c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">axissin006|<axis:alt f="axisctr020" c="MOD_PANTALLA_AXISSIN006" lit="111264"/></c:param>
            </c:import>
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt f="axisctr020" c="TITULO_DET" lit="9901369" /></c:param>
                <c:param name="nid" value="axisctr188" />
            </c:import>
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt f="axisctr020" c="TITULO_DET" lit="9901369" /></c:param>
                <c:param name="nid" value="axisctr218" />
            </c:import>
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt f="axisctr020" c="MOD_PANTALLA_AXISCTR086" lit="9001953"/></c:param>
                <c:param name="nid" value="axisctr086" />
            </c:import>
             <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt f="axisctr020" c="MOD_PANT_AXISAGD002" lit="180183"/></c:param>
                <c:param name="nid" value="axisagd002" />
            </c:import>
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt f="axisctr020" c="MOD_PANTALLA_AXISCTR087" lit="9001955"/></c:param>
                <c:param name="nid" value="axisctr087" />
            </c:import>
            
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="nid_y_titulo">axisfileupload|<axis:alt f="axisctr020" c="TITULOFILEUPLOAD" lit="1000614"/></c:param>
            </c:import>
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt f="axisctr020" c="PSU003" lit="9002255" /></c:param>
                <c:param name="nid" value="axispsu003" />
            </c:import>
            
             <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt f="axisctr020" c="LIT_1000184" lit="1000184" /></c:param>
                <c:param name="nid" value="axisctr010" />
            </c:import>
             <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt f="axisctr020" c="LIT_1000184" lit="1000184" /></c:param>
                <c:param name="nid" value="axisctr189" />
            </c:import>
            
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt f="axisctr184" c="LIT_1000184" lit="9903133" /></c:param>
                <c:param name="nid" value="axisctr184" />
            </c:import>
            
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt f="axisdir002" c="LIT_9000416" lit="9000416" /></c:param>
                <c:param name="nid" value="axisdir002" />
            </c:import>
            
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt f="axisdir002" c="LIT_9000416" lit="9000416" /></c:param>
                <c:param name="nid" value="axisdir002" />
            </c:import>
            
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt f="axis" c="INSPECCIONES" lit="9905244"/></c:param> 
                <c:param name="nid" value="axisins001" />
            </c:import>
            
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt f="axiscaj020" c="MOVCAJA" lit="9907918"/></c:param>
                <c:param name="nid" value="axiscaj020"/>
            </c:import>   
		<!-- INICIO CONF-209 PRODUCTO MULTIMONEDA ASDQ  -->
		    <c:import url="../include/modal_estandar.jsp">
		        <c:param name="titulo"><axis:alt f="axisctr222" c="TITULO_DET" lit="9909212" /></c:param>
		        <c:param name="nid" value="axisctr222" />
		    </c:import>
		    <!-- FIN CONF-209 PRODUCTO MULTIMONEDA ASDQ  -->
            
            <!-- Bug 11177.NMM.f.---------------------------------------------->
            <c:import url="../include/titulo_nt.jsp">
                    <c:param name="modalidad"><axis:alt f="axisctr020" c="TIT_PANTALLA" lit="109142"/></c:param>
                    <c:param name="titulo"></c:param>
                    <c:param name="formulario"><axis:alt f="axisctr020" c="FORM_PANTALLA" lit="101908"/></c:param>
                    <c:param name="form">axisctr020</c:param>
            </c:import>
            <!-- Area de campos  -->
            <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
                <!-- De datos póliza a tomadores -->        
                <c:import url="axisctr020_a.jsp"/>
                <!-- De riesgos hasta el final -->
                <c:import url="axisctr020_b.jsp"/>
                <c:import url="axisctr020_b1.jsp"/>
                <c:import url="axisctr020_e.jsp"/> 
                <c:import url="axisctr020_c.jsp"/>
                <c:import url="axisctr020_f.jsp"/>
                <c:import url="axisctr020_d.jsp"/>
				
				<!-- BUG 26373 JMT  -->
                <c:import url="axisctr020_datos_contacto.jsp"/>
                
                <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisctr020</c:param>
                <c:param name="f">axisctr020</c:param>
                <c:param name="__botones">salir,aceptar,emitir,100001,1000081<c:if test="${ empty __formdata.ES_SUPL_MULTP || __formdata.ES_SUPL_MULTP==0}">,9902500</c:if><c:if test="${__formdata.ES_COL_ADMIN==1 && __formdata.NCERTIF_COL==0 && (__formdata.CSITUAC_COL==4 || __formdata.CSITUAC_COL==5) && __formdata.ES_AGE_LIDER==0 && __formdata.CRETENI==0}"><axis:visible c="BT_EMITIR" f="axisctr020">,9904239</axis:visible></c:if><c:if test="${__formdata.ES_COL_ADMIN==1 && __formdata.NCERTIF_COL==0 && __formdata.CSITUAC_COL==0 && __formdata.ES_AGE_LIDER==0}"><axis:visible c="BT_ABRIR" f="axisctr020">,9904240</axis:visible></c:if><axis:visible f="axisctr020" c="BT_DUPLICAR" >,9903980</axis:visible></c:param>
                </c:import> 
            </table>
        </form>
        <c:import url="../include/mensajes.jsp"/>
    </body>
</html>
