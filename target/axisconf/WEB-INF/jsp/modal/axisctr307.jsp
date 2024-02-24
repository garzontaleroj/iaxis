<%/* Revision:# B0fQOFxs0baoVZWE3o1wVg== # */%>
<%/**
*  Fichero: axisctr307.jsp
*  Pantalla modal (ALTA/MODIFICACION) CITAS MEDICAS)
*  @author <a href = "mailto:igil@csi-ti.com">Ivan Gil</a>  
*
*  Fecha: 08/07/2015
*/
%>
<%@ page contentType="text/html;charset=windows-1252"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>    

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
 
<html>
    <head>
        <title><axis:alt f="axisctr307" c="NOMBREPANTALLA" lit="formulario.axisnombrepantalla"/></title>
        <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>          
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
        <script type="text/javascript">        
            
            /****************************************************************************************/
            /*********************************** NAVEGACION *****************************************/
            /****************************************************************************************/
            
            function f_onload() {                
                
                if (${requestScope.grabarOK == true}) {
                    parent.f_aceptar_modal("axisctr307");
                }
                
                if (${requestScope.isNew == "false"}) {
                   
                }
               
                if(!${__formdata.CPAGO == 1} || !${empty __formdata.CPAGO}){
                   if (document.getElementById('IEVIDEN'))
                      objDom.setVisibilidadPorId('IEVIDEN', 'hidden'); 
                   if (document.getElementById('IEVIDEN_TXT'))
                      objDom.setVisibilidadPorId('IEVIDEN_TXT', 'hidden'); 
                }else{
                   if (document.getElementById('IEVIDEN'))
                      objDom.setVisibilidadPorId('IEVIDEN', 'visible');  
                   if (document.getElementById('IEVIDEN_TXT'))
                      objDom.setVisibilidadPorId('IEVIDEN_TXT', 'visible'); 
                }
                f_cargar_propiedades_pantalla();
                revisarEstilos();
            }
            
             function f_but_aceptar() {
                
                CEVIDEN = objUtiles.utilSplit(objDom.getValorComponente(document.miForm.listaEviden), "|")[0];
                TEVIDEN = objUtiles.utilSplit(objDom.getValorComponente(document.miForm.listaEviden), "|")[1];
                CODEVID = objUtiles.utilSplit(objDom.getValorComponente(document.miForm.listaEviden), "|")[2];
                CTIPO = objUtiles.utilSplit(objDom.getValorComponente(document.miForm.listaEviden), "|")[3];
                SPERASEG = objUtiles.utilSplit(objDom.getValorComponente(document.miForm.listaAsegu), "|")[0];
                TPERASEG = objUtiles.utilSplit(objDom.getValorComponente(document.miForm.listaAsegu), "|")[1];
                
                if(CTIPO == 0){
                
                    CESTADO = objUtiles.utilSplit(objDom.getValorComponente(document.miForm.listaEst), "|")[0];
                    TESTADO = objUtiles.utilSplit(objDom.getValorComponente(document.miForm.listaEst), "|")[1];
                    objDom.setValorComponente(document.miForm.CESTADO, CESTADO);
                    objDom.setValorComponente(document.miForm.TESTADO, TESTADO);
                }

                

                objDom.setValorComponente(document.miForm.SPERASEG, SPERASEG);
                objDom.setValorComponente(document.miForm.TPERASEG, TPERASEG);

                objDom.setValorComponente(document.miForm.CEVIDEN, CEVIDEN);
                objDom.setValorComponente(document.miForm.TEVIDEN, TEVIDEN);
                objDom.setValorComponente(document.miForm.CODEVID, CODEVID);
                objDom.setValorComponente(document.miForm.CTIPO, CTIPO);
                CEVIDEN = objUtiles.utilSplit(objDom.getValorComponente(document.miForm.listaEviden), "|")[0];  
                if(objUtiles.estaVacio(objDom.getValorComponente(document.miForm.listaAsegu))){  
                        mensajesAlert = "<axis:alt f='axisctr307' c='MENSAAGE'   lit='9908360'/>";
                        alert(mensajesAlert);
                }else if(CEVIDEN<0){  
                        mensajesAlert = "<axis:alt f='axisctr307' c='MENSAAGE'    lit='9908362'/>";
                        alert(mensajesAlert);
                }else{
                    if(CTIPO == 0){

                        if(objUtiles.estaVacio(objDom.getValorComponente(document.miForm.listaEst))){  
                            mensajesAlert = "<axis:alt f='axisctr307' c='MENSAAGE'    lit='9908361'/>";
                            alert(mensajesAlert);
                        }else if( objUtiles.estaVacio(objDom.getValorComponente(document.miForm.NOMBRE_TEXT))){
                            mensajesAlert = "<axis:alt f='axisctr307' c='MENSAAGE'    lit='9908363'/>";
                            alert(mensajesAlert);
                        }else if(objUtiles.estaVacio(objDom.getValorComponente(document.miForm.FEVIDEN))){
                            mensajesAlert = "<axis:alt f='axisctr307' c='MENSAAGE'    lit='9908426'/>";
                            alert(mensajesAlert);              
                        }else{
                            objDom.setVisibilidadPorId('but_aceptar', 'hidden'); 
                            objUtiles.ejecutarFormulario("modal_axisctr307.do", "aceptar", document.miForm, "_self");
                        }
                    }else{
                        objDom.setVisibilidadPorId('but_aceptar', 'hidden'); 
                        objUtiles.ejecutarFormulario("modal_axisctr307.do", "aceptar", document.miForm, "_self"); 
                    }
                }
                


                    
            }           

            function f_but_cancelar() {
            
                parent.f_aceptar_modal("axisctr307");
                
            }
            function f_mostrar_importe(){
            
                objDom.setValorPorId("CPAGO", ((document.miForm.CPAGO.checked)? "1" : "0"));
                objDom.setValorPorId("CPAGO_CLK", ((document.miForm.CPAGO.checked)? "1" : "0"));
                if(!document.miForm.CPAGO.checked){
                   objDom.setVisibilidadPorId('IEVIDEN', 'hidden'); 
                   objDom.setVisibilidadPorId('IEVIDEN_TXT', 'hidden'); 
                }else{              
                   objDom.setVisibilidadPorId('IEVIDEN', 'visible');  
                   objDom.setVisibilidadPorId('IEVIDEN_TXT', 'visible'); 
                }
                
                
            }
            function f_abrir_axisper001() {
                objUtiles.abrirModal("axisper001","src","modal_axisper001.do?operation=form&faceptar=f_aceptar_axisper001&ORIGEN=AXISCTR307&HOSPITAL=HPL");
    
            }            
            function f_aceptar_axisper001(SPERSON) {
                f_cerrar_axisper001();  
                objAjax.invokeAsyncCGI("modal_axisctr307.do", callbackAjaxCambiarMedico, "operation=ver_medico&SPERSON=" + SPERSON, this, objJsMessages.jslit_actualizando_registro);                              
            }
            function f_cerrar_axisper001() {
                objUtiles.cerrarModal("axisper001");
            }
     
            
            function f_seleccionar_CPAGO(){
                objDom.setValorPorId("CPAGO", ((document.miForm.CPAGO.checked)? "1" : "0"));
            } 
            
            function f_actualizar_medico(){
                 
                 if(document.miForm.CMEDICO_TEXT){
                    objAjax.invokeAsyncCGI("modal_axisctr307.do", callbackAjaxCargarMedico, "operation=ajax_actualizar_medico&CMEDICO=" + objDom.getValorComponente(document.miForm.CMEDICO_TEXT) , this, objJsMessages.jslit_cargando);
				
				}
                
            }
            
            function f_cargar_importe_eviden(){
                CEVIDEN = objUtiles.utilSplit(objDom.getValorComponente(document.miForm.listaEviden), "|")[0];
                TEVIDEN = objUtiles.utilSplit(objDom.getValorComponente(document.miForm.listaEviden), "|")[1];
                objDom.setValorComponente(document.miForm.CEVIDEN, CEVIDEN);
                objDom.setValorComponente(document.miForm.TEVIDEN, TEVIDEN);
                objAjax.invokeAsyncCGI("modal_axisctr307.do", callbackAjaxCargarImporte, "operation=ajax_cargar_importe&CEVIDEN="+CEVIDEN , this, objJsMessages.jslit_cargando);
			
                
            }
                             
            function callbackAjaxCargarMedico(ajaxResponseText){
                
                var doc=objAjax.domParse(ajaxResponseText);
                
                var elementos = doc.getElementsByTagName("element");
                if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                    if(objUtiles.hayValorElementoXml(doc.getElementsByTagName("NNUMNIF")[0]) && elementos[0]){
                        var CMEDICOformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("NNUMNIF"), 0, 0);
                        var CODIformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("CODI"), 0, 0);
                        var NOMBREformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("NOMBRE"), 0, 0);
                        objDom.setValorPorId("CMEDICO_TEXT", CMEDICOformateado); 
                        objDom.setValorPorId("CMEDICO", CODIformateado);
                        objDom.setValorPorId("SPERSON_HOS", CODIformateado);
                        objDom.setValorPorId("NOMBRE_TEXT", NOMBREformateado); 
                    }else{
                        
                        objDom.setValorPorId("NOMBRE_TEXT",""); 
                        objDom.setValorPorId("CMEDICO_TEXT","");
                        objDom.setValorPorId("CMEDICO","");
                    }
                }
                if (objUtiles.estaVacio(objDom.getValorPorId("CMEDICO_TEXT"))) {
                    var mensajesAlert = "<axis:alt f='axisctr307' c='MENSAAGE' lit='9908325'/>";
                    alert(mensajesAlert);
                }
 
             
            }
            function callbackAjaxCambiarMedico(ajaxResponseText){
                var doc=objAjax.domParse(ajaxResponseText);
                               
                if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                    if(objUtiles.hayValorElementoXml(doc.getElementsByTagName("NNUMNIF")[0]) ){
               
                        var CMEDICOformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("NNUMNIF"), 0, 0);
                        var SPERSONformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("CODI"), 0, 0);
                        var NOMBREformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("NOMBRE"), 0, 0);
                        objDom.setValorPorId("CMEDICO_TEXT", CMEDICOformateado);
                        objDom.setValorPorId("CMEDICO", SPERSONformateado);
                        objDom.setValorPorId("SPERSON_HOS", SPERSONformateado);
                        objDom.setValorPorId("NOMBRE_TEXT", NOMBREformateado);
                    }else{
                        
                        objDom.setValorPorId("NOMBRE_TEXT",""); 
                        objDom.setValorPorId("CMEDICO_TEXT","");
                        objDom.setValorPorId("CMEDICO","");
                    }
                }
                
            }
            function callbackAjaxCargarImporte(ajaxResponseText){
                
                var doc=objAjax.domParse(ajaxResponseText);
                
                var elementos = doc.getElementsByTagName("ajax");
                if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                    if(objUtiles.hayValorElementoXml(doc.getElementsByTagName("IEVIDEN")[0]) && elementos[0]){
                        var IMPORTEformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("IEVIDEN"), 0, 0);
                        objDom.setValorPorId("IEVIDEN", IMPORTEformateado); 
                    }else{                       
                        objDom.setValorPorId("IEVIDEN",""); 
                    }
                }

 
             
            }
            function mostrar(nombreCapa){             
              document.getElementById(nombreCapa).style.visibility="visible"; 
            } 
            
            function ocultar(nombreCapa){             
             document.getElementById(nombreCapa).style.visibility="hidden"; 
            }
          
        </script>
    </head>
    <body onload="f_onload()">
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
        
        <form name="miForm" action="" method="POST">
            <input type="hidden" name="operation" value=""/> 
            <input type="hidden" name="isNew" id="isNew" value="${__formdata.isNew}"/>
            <input type="hidden" name="CEVIDEN" id="CEVIDEN" value="${__formdata.CEVIDEN}"/>
            <input type="hidden" name="TEVIDEN" id="TEVIDEN" value="${__formdata.TEVIDEN}"/>
            <input type="hidden" name="TPERASEG" id="TPERASEG" value="${__formdata.TPERASEG}"/>
            <input type="hidden" name="CESTADO" id="CESTADO" value="${__formdata.CESTADO}"/>
            <input type="hidden" name="TESTADO" id="TESTADO" value="${__formdata.TESTADO}"/>
            <input type="hidden" name="SPERASEG" id="SPERASEG" value="${__formdata.SPERASEG}"/>
            <input type="hidden" name="CASEGURA" id="CASEGURA" value="${__formdata.CASEGURA}"/>
            <input type="hidden" name="CODEVID" id="CODEVID" value="${__formdata.CODEVID}"/>
            <input type="hidden" name="NORDEN" id="NORDEN" value="${__formdata.NORDEN}"/>
            <input type="hidden" name="NORDEN_R" id="NORDEN_R" value="${__formdata.NORDEN_R}"/>
            <input type="hidden" name="CTIPO" id="CTIPO" value="${__formdata.CTIPO}"/>
            <axis:visible f="axisctr307" c="CTIPO_MED">
                <input type="hidden" name="CTIPO_MED" id="CTIPO_MED" value="${__formdata.CTIPO_MED}"/>
            </axis:visible>
            <input type="hidden" name="SPERSON_HOS" id="SPERSON_HOS" value="${__formdata.SPERSON_HOS}"/>
            <input type="hidden" name="CMEDICO" id="CMEDICO" value="${sessionScope.axisctr_medico.CODI}"/>
            <input type="hidden" name="CPAGO_CLK" id="CPAGO_CLK" value="${__formdata.CPAGO_CLK}" />
            
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt f="axisctr307" c="CAUTLOG_CHECK" lit="${__formdata.isNew == 'true' ? '9908316' : '9908317'}"/></c:param>
                <c:param name="titulo"><axis:alt f="axisctr307" c="CAUTLOG_CHECK_TIT" lit="${__formdata.isNew == 'true' ? '9908316' : '9908317'}"/></c:param>
                <c:param name="form">axisctr307</c:param>
            </c:import>
            
            <c:import url="../include/modal_estandar.jsp">
                    <c:param name="titulo"><axis:alt f="axisctr307" c="PERSONAS" lit="9908313"/></c:param>
                    <c:param name="nid">axisper001</c:param>
            </c:import> 
            
            <!-- Área de campos  -->
            <table class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <div class="separador">&nbsp;</div>
                        <div class="titulo"><img src="images/flecha.gif"/><b id="label_CAMPOS"><axis:alt f="axisctr307" c="CAMPOS" lit="9908312"/></b></div>
                        <table class="seccion">
                            <tr>
                                <td>
                                    <table class="area" align="center">
                                        <tr>
                                            <th style="width:25%;height:0px"></th>
                                            <th style="width:25%;height:0px"></th>
                                            <th style="width:25%;height:0px"></th>
                                            <th style="width:25%;height:0px"></th>
                                        </tr>
                                        <tr>
                                        
                                        
                    
                                        <axis:visible f="axisctr307" c="CEVIDEN">
                                            <td class="titulocaja">
                                                <b id="label_CEVIDEN"><axis:alt f="axisctr307" c="CEVIDEN" lit="9908312"/></b> <%-- Evidencia --%>
                                            </td>
                                        </axis:visible>
                                        
                                         </tr>


                                    <tr>
                                        <axis:visible f="axisctr307" c="CEVIDEN">
                                            <td class="campocaja"> 
                                                <select name="listaEviden" id="listaEviden" size="1" class="campowidthselect campo campotexto" style="width:85%;" onchange="f_cargar_importe_eviden()" value="${__formdata.CEVIDEN} / ${__formdata.TEVIDEN} / ${__formdata.CODEVID}"
                                                <axis:atr f="axisctr307" c="CEVIDEN" />
                                                <c:if test="${__formdata.isNew == 'false'}">readonly="true"</c:if> 
                                                <c:if test="${__formdata.isNew == 'false'}">disabled="disabled"</c:if>>&nbsp;
                                                <c:if test="${__formdata.CTIPO_MED == 0}"><option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisctr307" c="CEVIDEN" lit="9908312"/> - </option></c:if>
                                                <c:if test="${__formdata.CTIPO_MED == 1}"><option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisctr307" c="CEVIDEN" lit="9908947"/> - </option></c:if> 
                                                    
                                                    <c:forEach var="element" items="${__formdata.LISTVALORES.LSTEVIDENCIAS}">
                                                    <c:if test="${__formdata.CTIPO_MED == element.CTIPO}">
                                                        <option value = "${element.CEVIDEN} | ${element.TEVIDEN} | ${element.CODEVID} | ${element.CTIPO}"
                                                        <c:if test="${__formdata.CEVIDEN == element.CEVIDEN || fn:length(__formdata.LISTVALORES.LSTEVIDENCIAS) == 1}"> selected = "selected"</c:if>>
                                                            ${element.CODEVID} - ${element.TEVIDEN} 
                                                        </option>
                                                    </c:if>
                                                    </c:forEach>
                                                </select>
                                            </td> 
                                        </axis:visible>
                                    </tr>
                                    <tr>
                                        <axis:visible f="axisctr307" c="NOMASEG">
                                            <td class="titulocaja">
                                                <b><axis:alt f="axisctr307" c="NOMASEG" lit="100645"/></b> <%-- Asegurado --%>
                                            </td>   
                                        </axis:visible>
                                        <c:if test="${__formdata.CTIPO_MED == 0}">
                                        <axis:visible f="axisctr307" c="CMEDICO">
                                            <td class="titulocaja">
                                                <b><axis:alt f="axisctr307" c="CMEDICO" lit="9908313"/></b> <%-- Medico especialista --%>
                                            </td>   
                                        </axis:visible>
                                        </c:if>
                                   </tr>
                                       
                                        <axis:visible f="axisctr307" c="NOMASEG">
                                            <td class="campocaja"> 
                                                
                                                <select name="listaAsegu" id="listaAsegu" size="1" class="campowidthselect campo campotexto" style="width:79%;" 
                                                <axis:atr f="axisctr307" c="NOMASEG" />
                                                <c:if test="${__formdata.isNew == 'false'}">readonly="true"</c:if> 
                                                <c:if test="${__formdata.isNew == 'false'}">disabled="disabled"</c:if>>&nbsp;
                                                    <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisctr307" c="NOMASEG" lit="100645"/> - </option>
                                                    <c:forEach var="element" items="${__formdata.LISTVALORES.LSTASEGURADOS}">
                                                        <option value = "${element.OB_IAX_ASEGURADOS.SPERSON} | ${element.OB_IAX_ASEGURADOS.NNUMIDE} - ${element.OB_IAX_ASEGURADOS.TNOMBRE}"
                                                        <c:if test="${element.OB_IAX_ASEGURADOS.SPEREAL == __formdata.SPERASEG ||  element.OB_IAX_ASEGURADOS.SPERSON == __formdata.SPERASEG  || fn:length(__formdata.LISTVALORES.LSTASEGURADOS) == 1}"> selected = "selected"</c:if>>
                                                          ${element.OB_IAX_ASEGURADOS.NNUMIDE} - ${element.OB_IAX_ASEGURADOS.TNOMBRE} 
                                                        </option>
                                                    </c:forEach>
                                                </select>
                                            </td> 
                                        </axis:visible>
                                        <c:if test="${__formdata.CTIPO_MED == 0}">
                                        <axis:visible f="axisctr307" c="CMEDICO"> 
                                            <td class="campocaja">
                                               <input type="text" class="campowidthinput campo campotexto" name="CMEDICO_TEXT" id="CMEDICO_TEXT"  title="<axis:alt f="axisctr307" c="CMEDICO" lit="100584"/>"  value="${__formdata.CMEDICO}"  style="width:47%"
                                                onchange="f_actualizar_medico()" <axis:atr f="axisctr307" c="CMEDICO" /> />
                                               <c:if test="${__formdata.isNew == 'false'}"><axis:visible f="axisctr307" c="CMEDICO_BTN" ><img id="IMG_CMEDICO_TEXT" border="0" src="images/find.gif" onclick="f_abrir_axisper001()" style="cursor:pointer" > </axis:visible></c:if>             
                                               <c:if test="${__formdata.isNew == 'true'}"><img id="IMG_CMEDICO_TEXT" border="0" src="images/find.gif" onclick="f_abrir_axisper001()" style="cursor:pointer" > </c:if> 
                                                <input type="text" class="campo campotexto" value="${__formdata.TMEDICO}" name="NOMBRE_TEXT" id="NOMBRE_TEXT" title="<axis:alt f="axisctr019" c="TMEDICO" lit="100584"/>" size="15" style="width:70%" readonly="true"/>
                                            </td>
                                             
                                        </axis:visible>
                                        
                                                                                <tr>
                                        <axis:visible f="axisctr307" c="CESTADO">
                                            <td class="titulocaja">
                                                <b><axis:alt f="axisctr307" c="CESTADO" lit="9905523"/></b> <%-- Estado --%>
                                            </td>   
                                        </axis:visible>
                                        <axis:visible f="axisctr307" c="FEVIDEN">
                                            <td class="titulocaja">
                                                <b><axis:alt f="axisctr307" c="FEVIDEN" lit="9908311"/></b> <%-- Fecha de cita medica --%>
                                            </td>   
                                        </axis:visible>
                                        
                                        <axis:visible f="axisctr307" c="CPAGO">
                                            <td class="titulocaja">
                                                <b><axis:alt f="axisctr307" c="CPAGO" lit="9908320"/></b> <%-- Paga? --%>
                                            </td>   
                                        </axis:visible>
                                        <axis:visible f="axisctr307" c="IEVIDEN_TXT">
                                            <td class="titulocaja">
                                                <b id="IEVIDEN_TXT"><axis:alt f="axisctr307" c="IEVIDEN_TXT" lit="9908321"/></b> <%-- Importe--%>
                                            </td>   
                                        </axis:visible>
                                        </tr>
                                        <tr>
                                        <axis:visible f="axisctr307" c="CESTADO">
                                            <td class="campocaja"> 
                                                
                                                <select name="listaEst" id="listaEst" size="1" class="campowidthselect campo campotexto" style="width:79%;" value="${__formdata.IDESTADO}"
                                                <axis:atr f="axisctr307" c="CESTADO"  a="modificable=true&isInputText=false"/>
                                                >&nbsp;
                                                    <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisctr307" c="TESTADO" lit="9905523"/> - </option>
                                                    <c:forEach var="element" items="${__formdata.LISTVALORES.LSTESTADOS}">
                                                        <option value = "${element.CATRIBU} | ${element.TATRIBU}"
                                                        <c:if test="${__formdata.isNew == 'true' && element.CATRIBU == 1}">selected = "selected"</c:if>
                                                        <c:if test="${__formdata.CESTADO == element.CATRIBU || fn:length(__formdata.LISTVALORES.LSTESTADOS) == 1}"> selected = "selected"</c:if> >
                                                            ${element.TATRIBU} 
                                                        </option>
                                                    </c:forEach>
                                                </select>
                                            </td> 
                                        </axis:visible>
                                        <axis:visible f="axislist307" c="FEVIDEN">
                                            <td class="campocaja">
						<input type="text" class="campowidthinput campo campotexto" size="40" 
                                                <axis:atr f="axisctr307" c="FEVIDEN" />
                                                disable ="disable"
                                                value='<fmt:formatDate value="${__formdata.FEVIDEN}" pattern="dd/MM/yyyy HH:mm"/>' name="FEVIDEN" id="FEVIDEN" style="width:97px;" <axis:atr f="axislist307" c="FEVIDEN" /> title='<axis:alt f="axislist307" c="FEVIDEN" lit="104095"/>'/>
                                                <axis:visible f="axisctr307" c="SEL_FEVIDEN"><a style="vertical-align:middle;"><img id="SEL_FEVIDEN" src="images/calendar.gif"/></a></axis:visible>
                                            </td>
					</axis:visible>
                                        
                                        <axis:visible f="axisctr307" c="CPAGO" >
                                             <td class="campocaja">
                                                <div class="dspIcons">
                                                
                                                            <input onclick="f_mostrar_importe()"
                                                                   type="checkbox" 
                                                                   <axis:atr f="axisctr307" c="CPAGO" />
                                                                   id="CPAGO"
                                                                   name="CPAGO"
                                                                   value="${__formdata.CPAGO}"  <c:if test="${__formdata.CPAGO == 1}"> checked="checked"</c:if>/>
                                                 
                                                </div> 
                                             </td>    
                                       </axis:visible> 
                                        
                                       <axis:visible f="axisctr307" c="IEVIDEN" >
                                            <td class="campocaja">
                                            
                                                <input type="text" class="campowidthinput campo campotexto" size="15" 
                                                value="${__formdata.IEVIDEN}" name="IEVIDEN" id="IEVIDEN" formato="entero"
                                                style="width:40%;" title="<axis:alt f="axisctr307" c="IEVIDEN" lit="9908046"/>" 
                                                <axis:atr f="axisctr307" c="IEVIDEN" />/>
                                            
                                            </td> 
                                       </axis:visible> 
                        
                         </tr> 
                         </c:if>
                                    </table>
                                </td>
                            </tr>
                        </table>
                </tr>
            </table>
            
            <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisctr307</c:param>
                <c:param name="__botones">cancelar,aceptar</c:param>
            </c:import>
        </form>
        <script type="text/javascript">
            Calendar.setup({
                inputField     :    "FEVIDEN",     
                ifFormat       :    "%d/%m/%Y %H:%M",      
                button         :    "SEL_FEVIDEN", 
                singleClick    :    true,
                firstDay       :    1,
                showsTime      :    true,
                timeFormat     :    24
            });    

        </script>
        <c:import url="../include/mensajes.jsp" />
    </body>
</html>
