<%/* Revision:# zmQ3IyvrV0VJlA6xXMQBHw== # */%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>     

<c:set var="nombrePantalla" value="datossiniestrosgenerales"/>

<script type="text/javascript">


function f_onchange_CEMPRES() {
                var CCAUSIN=objDom.getValorPorId("CCAUSIN");
            
            
                if (!objUtiles.estaVacio(CCAUSIN)){
                    var qs="operation=ajax_cargar_motivos";
                    qs=qs+"&CCAUSIN="+CCAUSIN;
                    objAjax.invokeAsyncCGI("axis_axissin006.do", callbackajaxMotivos, qs, this);
                } 
            }    

function callbackajaxMotivos (ajaxResponseText){
                try{ 
                var doc = objAjax.domParse(ajaxResponseText);
                if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
                    var comboAsientos = document.miForm.TMOTSIN;   
             
                    if(objUtiles.existeObjetoXml(doc.getElementsByTagName("element")[0])){
                        objDom.borrarOpcionesDeCombo(comboAsientos);
                            objDom.addOpcionACombo("", " - " + objJsMessages.jslit_seleccionar + " - ", comboAsientos, 0);
                            for(var i = 0;i < doc.getElementsByTagName("element").length;i++){
                                                     
                                var TATRIBU = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("element")[i].getElementsByTagName("TATRIBU")[0])) ? doc.getElementsByTagName("element")[i].getElementsByTagName("TATRIBU")[0].childNodes[0].nodeValue : "");
                                var CATRIBU = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("element")[i].getElementsByTagName("CATRIBU")[0])) ? doc.getElementsByTagName("element")[i].getElementsByTagName("CATRIBU")[0].childNodes[0].nodeValue : "");
                               
                                objDom.addOpcionACombo(CATRIBU, TATRIBU, comboAsientos, i+1);
                            }
                                valor = documento.miForm.TMOTSIN_AUX.value;
                                document.miForm.TMOTSIN.selectedIndex = valor;
                        }else{
                            objDom.borrarOpcionesDeCombo (comboAsientos);
                            objDom.addOpcionACombo("", " - " + objJsMessages.jslit_seleccionar + " - ", comboAsientos, null);
                        }
                    }
                } catch (e) {
                    if (isDebugAjaxEnabled == "true")
                    alert (e.name + " " + e.message);
                }
            }


    
    
     function f_aceptar_axissin017(NSINIES) {
            document.miForm.subpantalla.value="siniestros";
           // objUtiles.ejecutarFormulario("axis_axissin006.do?NSINIES="+NSINIES, "cargarDatos", document.miForm, "_self", objJsMessages.jslit_cargando);
            objUtiles.ejecutarFormulario("axis_axissin006.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);
    }
    
    function f_onclickCheckbox(thiss) {
        thiss.value =  ((thiss.checked)?1:0);
        objDom.setValorPorId(thiss.id, thiss.value);
    }
    
     /* ************************************************************************************************* */
     /* ***************************** ******** MODALES AXISSIN52 ********* ****************************** */
     /* ************************************************************************************************* */
    
     /* ****************************** AXISSIN052 - detalle frau    ************************************* */
    function f_detalle_fraude(){
        
        var NSINIES = document.miForm.NSINIES.value;
       
        f_abrir_axissin052(NSINIES,null);
    }
    
    function f_abrir_axissin052(NSINIES,CFRAUDE) {
     
        
        var SSEGURO = document.miForm.SSEGURO.value;
     
        objUtiles.abrirModal("axissin052","src","modal_axissin052.do?operation=form&NSINIES="+NSINIES+"&CFRAUDE="+CFRAUDE+"&SSEGURO="+SSEGURO+"&MODOFRAU=CONSULTA");               
    }
        
    function f_cerrar_axissin052(){
        objUtiles.cerrarModal("axissin052");
    }
    
    function f_aceptar_axissin052(CTIPREF,TREFEXT,FREFINI,FREFFIN,srefext,TTIPREF){
        //f_anyadir_fila(CTIPREF,TREFEXT,FREFINI,FREFFIN,srefext,TTIPREF);
        f_cerrar_axissin052();
    }
</script>

<form name="${nombrePantalla}Form" action="" method="POST">  


<table class="seccion">
                <tr>
                    <td align="left">
                         <table class="area" align="center">
                            <tr>
                                <th style="width:20%;height:0px"></th>
                                <th style="width:20%;height:0px"></th>
                                <th style="width:20%;height:0px"></th>
                                <th style="width:20%;height:0px"></th>
                                <th style="width:20%;height:0px"></th>
                            </tr>
                            <c:if test="${!empty __formdata.OB_IAX_SINIESTRO.CAGENTE}">
                            <tr>
                             <%-- Agente --%>
                                            <axis:ocultar c="CAGENTE_SIN" f="axissin006" dejarHueco="false">
                                            <td class="titulocaja" colspan="3" id="LIT_CAGENTE_SIN">
                                                <b><axis:alt f="axissin006" c="CAGENTE_SIN" lit="100584"/></b>
                                            </td>
                                            </axis:ocultar>
                                    </tr>
                            <tr>
                                <axis:ocultar c="CAGENTE_SIN" f="axissin006" dejarHueco="false">
                                    <td class="campocaja" colspan="3" id="TD_CAGENTE_SIN">
                                        <input type="text" class="campo campotexto campodisabled" id="CAGENTE_SIN" name="CAGENTE_SIN" <axis:atr f="axissin006" c="CAGENTE_SIN" a="modificable=false&obligatorio=false"/> size="15" style="width:15%"
                                        value="${__formdata.CAGENTE_SIN}" readonly="readonly" />
                                        <input type="text" class="campo campotexto campodisabled" id="TAGENTE_SIN" name="TAGENTE_SIN" size="15" <axis:atr f="axissin006" c="TAGENTE" a="modificable=false&obligatorio=false"/> style="width:75%"
                                        value="${__formdata.TAGENTE_SIN}" readonly="readonly"/>
                                        <img border="0" src="images/informacion.gif" alt="<axis:alt f="axissin006" c="CAGENTE_DTO" lit="9000521"/>" title="<axis:alt f="axissin006" c="CAGENTE_DTO" lit="9000521"/>" onclick="f_consultarAgente()" style="cursor:pointer"/>
                                        
                                    </td>
                                </axis:ocultar>
                            </tr>
                            </c:if>
                            <!-- Riesgo -->
                            <tr>
                            <c:if test="${!empty __formdata.OB_IAX_SINIESTRO.NSINIES && __formdata.OB_IAX_SINIESTRO.NSINIES > 0}">
                                <!-- Siniestro -->
                                <td class="titulocaja">
                                    <b><axis:alt f="axissin006" c="NSINIES" lit="101298" /></b>
                                    
                                </td>
                            </c:if>

                                <!-- F. Ocurrencia -->
                                <axis:ocultar f="axissin006" c="FSINIES" dejarHueco="false">
                                <td class="titulocaja">
                                
                                    <b><axis:alt f="axissin006" c="FSINIES" lit="1000510" /></b>
                               
                                </td>
                                 </axis:ocultar>
                                <!-- Hora Ocurrencia -->
                                <axis:ocultar f="axissin006" c="HSINIES" dejarHueco="false">
                                 <td class="titulocaja">
                                 
                                    <b><axis:alt f="axissin006" c="HSINIES" lit="1000242" /></b>
                                 
                                </td>
                                </axis:ocultar>
                                <!-- Data recepció -->
                                <axis:ocultar f="axissin006" c="FNOTIFI" dejarHueco="false">
                                 <td class="titulocaja">
                                    <b><axis:alt f="axissin006" c="FNOTIFI" lit="102913" /></b>
                                </td>
                                </axis:ocultar>
                                <!-- Data recepció -->
                                <axis:ocultar f="axissin006" c="FALTA" dejarHueco="false">
                                 <td class="titulocaja">
                                    <b><axis:alt f="axissin006" c="FALTA" lit="9902975" /></b>
                                </td>
                                 </axis:ocultar>
                                <!-- Evento -->
                                <axis:ocultar f="axissin006" c="CEVENTO" dejarHueco="false">
                                <td class="titulocaja">
                                    <b><axis:alt f="axissin006" c="CEVENTO" lit="9000973" /></b>
                                </td>
                                </axis:ocultar>
                            </tr>
                            <tr>
                            <c:if test="${!empty __formdata.OB_IAX_SINIESTRO.NSINIES && __formdata.OB_IAX_SINIESTRO.NSINIES > 0}">
                                <!-- Siniestro -->
                                <axis:ocultar f="axissin006" c="NSINIES" dejarHueco="false">
                                <td class="campocaja">
                                    <input <axis:atr f="axissin006" c="NSINIES" a="modificable=false"/> type="text" class="campodisabled campo campotexto" id="NSINIES"  style="width:90%;" name="NSINIES" size="15"   
                                    value="${__formdata.OB_IAX_SINIESTRO.NSINIES}"/> 
                                
                                </td>
                                </axis:ocultar>
                            </c:if>

                                 <!-- F. Ocurrencia -->
                                <axis:ocultar f="axissin006" c="FSINIES" dejarHueco="false">
                                <td class="campocaja">
                                
                                    <input type="text" <axis:atr f="axissin006" c="FSINIES" a="modificable=false&formato=fecha"/> style="width:50%" class="campodisabled campo campotexto"  id="FSINIES" name="FSINIES" size="15" 
                                     value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.OB_IAX_SINIESTRO.FSINIES}"/>"/>   
                                   
                            
                                </td>
                                </axis:ocultar>
                                <!-- Hora Ocurrencia -->
                                <axis:ocultar f="axissin006" c="HSINIES" dejarHueco="false">
                                <td class="campocaja">
                                    
                                    <input <axis:atr f="axissin006" c="HSINIES" a="modificable=false&formato=fecha"/> type="text" class="campodisabled campo campotexto" id="HSINIES"  style="width:30%;" name="HSINIES" size="15" value="${__formdata.OB_IAX_SINIESTRO.HSINIES}"/>
                                    
                                </td>
                                </axis:ocultar>
                                
                                <!-- F. Recepcion -->
                                <axis:ocultar f="axissin006" c="FNOTIFI" dejarHueco="false">
                                <td class="campocaja">
                                    <input readonly="true" type="text"  <axis:atr f="axissin006" c="FNOTIFI" a="modificable=false&formato=fecha"/> class="campodisabled campo campotexto" id="FNOTIFI"  style="width:60%" name="FNOTIFI"  
                                    value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.OB_IAX_SINIESTRO.FNOTIFI}"/>"/>                                    
                                </td>
                                </axis:ocultar>     
                                <axis:ocultar f="axissin006" c="FALTA" dejarHueco="false">
                                <td class="campocaja">
                                    <input readonly="true" type="text"  <axis:atr f="axissin006" c="FALTA" a="modificable=false&formato=fecha"/> class="campodisabled campo campotexto" id="FALTA"  style="width:60%" name="FALTA"  
                                    value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.OB_IAX_SINIESTRO.FALTA}"/>"/>                                    
                                </td>
                                </axis:ocultar>     
                                <!-- Evento -->
                                <axis:ocultar f="axissin006" c="CEVENTO" dejarHueco="false">
                                <td class="campocaja">
                                
                                    <input type="text" class="campodisabled campo campotexto"   <axis:atr f="axissin006" c="CEVENTO" a="modificable=false"/>   
                                    value="${__formdata.OB_IAX_SINIESTRO.CEVENTO} - ${__formdata.OB_IAX_SINIESTRO.TEVENTO}"        name="CEVENTO" id="CEVENTO"  style="width:90%;" />&nbsp;
                                 
                                </td>       
                                </axis:ocultar>   
                                
                            </tr>
                            <tr>
                                <!-- Causas -->
                                <axis:ocultar f="axissin006" c="TCAUSIN" dejarHueco="false">
                                <td class="titulocaja">
                                
                                    <b><axis:alt f="axissin006" c="TCAUSIN" lit="180580" /></b>
                                
                                </td>
                                </axis:ocultar>  
                                <!-- Motivo -->
                                <axis:ocultar f="axissin006" c="TMOTSIN" dejarHueco="false">
                                <td class="titulocaja" colspan="2">
                                
                                    <b><axis:alt f="axissin006" c="TMOTSIN" lit="109651" /></b>
                                
                                </td>
                                </axis:ocultar>  
								
                                <!-- fecha detccion-->
                            
                                <axis:ocultar f="axissin006" c="FDETECCION" dejarHueco="false">
                                <td class="titulocaja" colspan="2">
                                
                                    <b><axis:alt f="axissin006" c="FDETECCION" lit="9908703" /></b>
                                
                                </td>
                                </axis:ocultar>  
                                <!-- Responsabilidad -->
                                <axis:ocultar f="axissin006" c="TCULPAB" dejarHueco="false">
                                <td class="titulocaja">
                                
                                    <b><axis:alt f="axissin006" c="TCULPAB" lit="1000511" /></b>
                                
                                </td>
                                </axis:ocultar>  
                                <!--  Riesgo -->
                           
                                <!-- Reclamación -->
                                <axis:ocultar f="axissin006" c="TRECLAMA" dejarHueco="false">
                                <td class="titulocaja">
                                
                                    <b><axis:alt f="axissin006" c="TRECLAMA" lit="9000974" /></b>
                                
                                </td>
                                </axis:ocultar>  
                                
                            </tr>
                            <tr>
                                <!-- Causas -->
                                 <axis:ocultar f="axissin006" c="TCAUSIN" dejarHueco="false">
                                <td class="campocaja">
                               
                                    <input type="text" class="campodisabled campo campotexto"   <axis:atr f="axissin006" c="TCAUSIN" a="modificable=false"/>   
                                    value="${__formdata.OB_IAX_SINIESTRO.TCAUSIN}"        name="TCAUSIN" id="TCAUSIN"  style="width:90%;" />&nbsp;
                               
                                </td>
                                 </axis:ocultar> 
                                
                                <!-- Motivo -->
                                <axis:ocultar f="axissin006" c="TMOTSIN" dejarHueco="false">
                                <td class="campocaja" colspan="2">
                                
                                    <input type="text" class="campodisabled campo campotexto"   <axis:atr f="axissin006" c="TMOTSIN" a="modificable=false"/>   
                                    value="${__formdata.OB_IAX_SINIESTRO.TMOTSIN}"        name="TMOTSIN" id="TMOTSIN"  style="width:90%;" />&nbsp;
                                  
                                </td>
                                </axis:ocultar>
								
                                  <!-- Fecha deteccion -->
                              <axis:ocultar f="axissin006" c="FDETECCION" dejarHueco="false">
                                <td class="campocaja" colspan="2">
                                
                                    <input type="text" class="campodisabled campo campotexto"   <axis:atr f="axissin006" c="FDETECCION" a="modificable=false"/>   
                                    value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.OB_IAX_SINIESTRO.FDETECCION}"/>"        name="FDETECCION" id="FDETECCION"  style="width:40%;" />&nbsp;
                                  
                                </td>
                                </axis:ocultar>
                                <!-- Responsabilidad -->
                                <axis:ocultar f="axissin006" c="TCULPAB" dejarHueco="false">
                                <td class="campocaja">
                                
                                    <input type="text" class="campodisabled campo campotexto"   <axis:atr f="axissin006" c="TCULPAB" a="modificable=false"/>   
                                    value="${__formdata.OB_IAX_SINIESTRO.TCULPAB}"        name="TCULPAB" id="TCULPAB"  style="width:90%;" />&nbsp;
                               
                                </td>
                                 </axis:ocultar>   
                                <!-- Reclamación -->
                                <axis:ocultar f="axissin006" c="TRECLAMA" dejarHueco="false">
                                <td class="campocaja">
                                
                                    <input type="text" class="campodisabled campo campotexto"   <axis:atr f="axissin006" c="TRECLAMA" a="modificable=false"/>   
                                    value="${__formdata.OB_IAX_SINIESTRO.TRECLAMA}"        name="TRECLAMA" id="TRECLAMA"  style="width:90%;" />&nbsp;
                                
                                </td>       
                                 </axis:ocultar> 
                                <!-- Riesgo -->
                            <%--    <td class="campocaja" colspan="2">
                                    <input  readonly="true" type="text" class="campo campotexto"  id="TRIESGO" name="TRIESGO" 
                                    value="${__formdata.OB_IAX_SINIESTRO.TRIESGO}"/>
                                </td>--%>
                                
                            </tr>
                            <tr>
                                 <!-- Reisgo -->
                                <axis:visible f="axissin006" c="TRIESGO">
                                    <td class="titulocaja" colspan="2">
                                    
                                        <b><axis:alt f="axissin006" c="LIT_DET_RIESGO" lit="1000199"></axis:alt></b>
                                   
                                    </td>
                                </axis:visible>
				<!-- Sinistre compania Ref.externa -->
                                <axis:visible f="axissin006" c="NSINCIA">
                                    <td class="titulocaja">                                
                                        <b><axis:alt f="axissin006" c="CSINCIA" lit="9910863"></axis:alt></b>                               
                                    </td>
                                </axis:visible>
                                <!-- Companyia -->
                                <axis:visible f="axissin006" c="CCOMPANI">
                                    <td class="titulocaja">                                
                                        <b><axis:alt f="axissin006" c="CCOMPANI" lit="9901223"></axis:alt></b>                               
                                    </td>
                                </axis:visible>
                                <!-- Presinistre -->
                                <axis:visible f="axissin006" c="NPRESIN">
                                    <td class="titulocaja">                                
                                        <b><axis:alt f="axissin006" c="NPRESIN" lit="9901400"></axis:alt></b>                               
                                    </td>
                                </axis:visible>
                                <axis:visible f="axissin006" c="CPOLCIA">
                                  <td class="titulocaja">
                                        <b><axis:alt f="axissin006" c="CPOLCIA" lit="9001766" /></b>
                                  </td>
                                </axis:visible>
                                
                                 <axis:visible f="axissin006" c="CCLASIN">
                                  <td class="titulocaja">
                                        <b><axis:alt f="axissin006" c="CCLASIN" lit="Clasificación de siniestros" /></b>
                                  </td>
                                </axis:visible>
                                
                                
                                
                            </tr>
                            <tr>
                                <!-- Detall del risc -->
                                <axis:visible f="axissin006" c="TRIESGO">
                                <td class="campocaja" colspan="2">
                               
                                    <input type="text" class="campodisabled campo campotexto" style="width:95%;" <axis:atr f="axissin006" c="TRIESGO" a="modificable=false"/> id="TRIESGO" name="TRIESGO" size="15"  value="${__formdata.OB_IAX_SINIESTRO.TRIESGO}"/>
                                
                                </td> 
                                </axis:visible>								
				<!-- Sinistre compania Ref.externa-->
                                <axis:visible f="axissin006" c="NSINCIA">
                                    <td class="campocaja" colspan="1">                                   
                                        <input type="text" class="campodisabled campo campotexto" style="width:95%;" <axis:atr f="axissin006" c="NSINCIA" a="modificable=false"/> id="NSINCIA" name="NSINCIA" size="15"  value="${__formdata.OB_IAX_SINIESTRO.NSINCIA}"/>                                    
                                    </td> 
                                </axis:visible>                                
                                <!-- Companyia-->
                                <axis:visible f="axissin006" c="CCOMPANI">
                                    <td class="campocaja" colspan="1">                                   
                                        <input type="text" class="campodisabled campo campotexto" style="width:95%;" <axis:atr f="axissin006" c="CCOMPANI" a="modificable=false"/> id="CCOMPANI" name="CCOMPANI" size="15"  value="${__formdata.OB_IAX_SINIESTRO.TCOMPANI}"/>                                    
                                    </td> 
                                </axis:visible>                                
                                <!-- Presinistre-->
                                <axis:visible f="axissin006" c="NPRESIN">
                                    <td class="campocaja" colspan="1">                                   
                                        <input type="text" class="campodisabled campo campotexto" style="width:95%;" <axis:atr f="axissin006" c="NPRESIN" a="modificable=false"/> id="NPRESIN" name="NPRESIN" size="15"  value="${__formdata.OB_IAX_SINIESTRO.NPRESIN}"/>                                    
                                    </td> 
                                </axis:visible>
                                <axis:visible f="axissin006" c="CPOLCIA">
                                  <td class="campocaja">
                                         <input  type="text" class="campodisabled campo campotexto" style="width:95%;" id="CPOLCIA" name="CPOLCIA"
                                         <axis:atr f="axissin006" c="CPOLCIA" a="modificable=false"/> size="15"  value="${__formdata.OB_IAX_SINIESTRO.CPOLCIA}"/>
                                  </td>
                            </axis:visible>
                            
                             <axis:visible f="axissin006" c="CCLASIN">
                                  <td class="campocaja">
                                         <input  type="text" class="campodisabled campo campotexto" style="width:95%;" id="CCLASIN" name="CCLASIN"
                                         <axis:atr f="axissin006" c="CCLASIN" a="modificable=false"/> size="15"  value="${__formdata.OB_IAX_SINIESTRO.CCLASIN}"/>
                                  </td>
                            </axis:visible>

                            </tr> 
                            <tr>
                                <axis:visible f="axissin006" c="REFEXTERNA">
                                            <td class="titulocaja" colspan="2">
                                                <table>
                                                    <tr>
                                                        <td class="titulocaja">
                                                            <b><axis:alt f="axissin006" c="REFEXTERNA" lit="9902448" /></b>
                                                        </td>
                                                        <axis:visible f="axissin006" c="REF_ICON_MAS">
                                                        <td class="titulocaja" align="right">
                                                        <div id="REF_ICON_MAS">
                                                        
                                                            <img border="0" src="images/new.gif" onclick="f_alta_referencia()" style="cursor:pointer"/>
                                                        
                                                        </div>
                                                        </td>
                                                        </axis:visible>
                                                    </tr>
                                                </table>
                                            </td>
                                            </axis:visible>
                                <axis:visible f="axissin006" c="TFRAUDE">
                                  <td class="titulocaja">
                                        <b><axis:alt f="axissin006" c="TFRAUDE" lit="9902124" /></b>
                                  </td>
                                </axis:visible>
                                <axis:visible f="axissin006" c="CCARPETA">
                                      <td class="titulocaja">
                                            <b><axis:alt f="axissin006" c="CCARPETA" lit="9902601" /></b>
                                      </td>
                                </axis:visible>
                                <!-- ini bug 0024675 -->
                                <axis:visible f="axissin006" c="CSALVAM">
                                      <td class="titulocaja">
                                            <b><axis:alt f="axissin006" c="CSALVAM" lit="9904530" /></b>
                                      </td>
                                </axis:visible>
                                <!-- fin bug 0024675 -->                                
                            </tr>
                            <tr>
                                <axis:visible f="axissin006" c="REFEXTERNA">
                                            <td class="campocaja" colspan="2">
                                                <table class="seccion">
                                                    <tr>
                                                        <td align="left" >
                                                            <table class="area" align="center" tabindex="38">
                                                                <th style="width:100%;height:0px"></th>
                                                                <tr>
                                                                    <td align="left" class="campocaja">
                                                                        <c:set var="title1"><axis:alt f="axissin006" c="TIPOREF" lit="9902449"/></c:set>
                                                                        <c:set var="title2"><axis:alt f="axissin006" c="CODIGO" lit="1000109"/></c:set>
                                                                        <c:set var="title3"><axis:alt f="axissin006" c="FINI" lit="9000526"/></c:set>
                                                                        <c:set var="title6"><axis:alt f="axissin006" c="FFIN" lit="9000527"/></c:set>
                                                                        <c:set var="title4"><axis:alt f="axissin006" c="MODIFICAR" lit="9000552"/></c:set>
                                                                        <c:set var="title5"><axis:alt f="axissin006" c="ELIMINAR" lit="1000127"/></c:set>
                                                                        <div class="displayspace" style="border: solid 0;width:100%" >                         
                                                                            <display:table name="${__formdata.OB_IAX_SINIESTRO.REFERENCIAS}" id="miListaRef" export="false"  class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0" style="width:98.5%;border:1px" 
                                                                             requestURI="axis_axissin006.do?paginar=true">
                                                                                <%@ include file="../include/displaytag.jsp"%>
                                                                                <axis:visible f="axissin006" c="TIPOREF">
                                                                                <display:column title="${title1}" sortable="false" sortProperty="radioGarant" headerClass="headwidth20 sortable fixed"  media="html" autolink="false"  >
                                                                                    <a srefext="${miListaRef.OB_IAX_SINIESTRO_REFERENCIAS.SREFEXT}" ></a><div class="dspNumber">${miListaRef.OB_IAX_SINIESTRO_REFERENCIAS.TTIPREF}</div>
                                                                                </display:column>
                                                                                </axis:visible>
                                                                                <axis:visible f="axissin006" c="CODIGO">
                                                                                <display:column title="${title2}" sortable="false" sortProperty="OB_IAX_SINIESTRO_REFERENCIAS.TREFEXT" headerClass="sortable fixed"  media="html" autolink="false" >
                                                                                    <div class="dspNumber">${miListaRef.OB_IAX_SINIESTRO_REFERENCIAS.TREFEXT}</div>
                                                                                </display:column>
                                                                                </axis:visible>
                                                                                <axis:visible f="axissin006" c="FINI">
                                                                                    <display:column title="${title3}" sortable="false" sortProperty="OB_IAX_SINIESTRO_REFERENCIAS.FREFINI" headerClass="headwidth20 sortable fixed"  media="html" autolink="false">
                                                                                        <div class="dspNumber"><fmt:formatDate pattern="dd/MM/yyyy" value="${miListaRef.OB_IAX_SINIESTRO_REFERENCIAS.FREFINI}"/></div>
                                                                                    </display:column>  
                                                                                </axis:visible>
                                                                                <axis:visible f="axissin006" c="FFIN">
                                                                                    <display:column title="${title6}" sortable="false" sortProperty="OB_IAX_SINIESTRO_REFERENCIAS.FREFFIN" headerClass="headwidth20 sortable fixed"  media="html" autolink="false">
                                                                                        <div class="dspNumber"><fmt:formatDate pattern="dd/MM/yyyy" value="${miListaRef.OB_IAX_SINIESTRO_REFERENCIAS.FREFFIN}"/></div>
                                                                                    </display:column>  
                                                                                </axis:visible>
                                                                                <axis:visible f="axissin006" c="MODIFICAR">
                                                                                    <display:column title="${title4}" sortable="false" sortProperty="ICAPITAL" headerClass="headwidth5 sortable fixed"  media="html" autolink="false">
                                                                                        <div class="dspIcons"  id="MODIFICAR">
                                                                                            <a href="javascript:f_modificar_ref('${miListaRef.OB_IAX_SINIESTRO_REFERENCIAS.CTIPREF}','${miListaRef.OB_IAX_SINIESTRO_REFERENCIAS.TREFEXT}','<fmt:formatDate pattern="dd/MM/yyyy" value="${miListaRef.OB_IAX_SINIESTRO_REFERENCIAS.FREFINI}"/>','<fmt:formatDate pattern="dd/MM/yyyy" value="${miListaRef.OB_IAX_SINIESTRO_REFERENCIAS.FREFFIN}"/>','${miListaRef.OB_IAX_SINIESTRO_REFERENCIAS.SREFEXT}');"><img border="0" alt="<axis:alt f="axissin006" c="EDITAR" lit="100002"/>" title="<axis:alt f="axissin006" c="EDITAR" lit="100002"/>" src="images/lapiz.gif">
                                                                                            </a>
                                                                                        </div>
                                                                                    </display:column>  
                                                                                </axis:visible>
                                                                                <axis:visible f="axissin006" c="ELIMINAR">
                                                                                    <display:column title="${title5}" sortable="false" sortProperty="ICAPITAL" headerClass="headwidth5 sortable fixed"  media="html" autolink="false">
                                                                                        <div class="dspIcons" id="ELIMINAR"><a href="javascript:f_eliminar_ref('${miListaRef.OB_IAX_SINIESTRO_REFERENCIAS.SREFEXT}');"><img border="0" alt="<axis:alt f="axissin006" c="EDITAR" lit="100002"/>" title="<axis:alt f="axissin006" c="EDITAR" lit="100002"/>" src="images/delete.gif"></a></div>
                                                                                    </display:column>  
                                                                                </axis:visible>
                                                                            </display:table>
                                                                        </div>
                                                                   </td>
                                                                 </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            </axis:visible>
                                <axis:visible f="axissin006" c="TFRAUDE">
                                  <td class="campocaja">
                                         <input  type="text" class="campodisabled campo campotexto" style="width:70%;" id="TFRAUDE" name="TFRAUDE"
                                         <axis:atr f="axissin006" c="TFRAUDE" a="modificable=false"/> size="15"  value="${__formdata.OB_IAX_SINIESTRO.TFRAUDE}"/>
                                         <axis:visible f="axissin006" c="DET_FRAUDE"> 
                                         <div style="position:absolute">
                                         <a href="javascript:f_detalle_fraude();"><img border="0" alt="<axis:alt f="axissin006" c="DET_FRAUDE" lit="9903634"/>" title="<axis:alt f="axissin006" c="DET_FRAUDE" lit="9903634"/>" src="images/mas.gif"></a>
                                         </div>
                                         </axis:visible>
                                  </td>
                                </axis:visible>
                                <axis:visible f="axissin006" c="CCARPETA">
                                <td class="campocaja">
                                    <input type="checkbox" id="CCARPETA" name="CCARPETA" disabled="true" value="${__formdata.OB_IAX_SINIESTRO.CCARPETA}" onclick="f_onclickCheckbox(this)" 
                                    <c:if test="${__formdata.OB_IAX_SINIESTRO.CCARPETA == 1}">checked</c:if>
                                    <axis:atr f="axissin006" c="CCARPETA" a="modificable=false"/> />
                                </td>
                                </axis:visible>
                                <!-- ini bug 0024675 -->
                                <axis:visible f="axissin006" c="CSALVAM">
                                <td class="campocaja">
                                    <input type="checkbox" id="CSALVAM" name="CSALVAM" disabled="true" value="${__formdata.OB_IAX_SINIESTRO.CSALVAM}" onclick="f_onclickCheckbox(this)" 
                                    <c:if test="${__formdata.OB_IAX_SINIESTRO.CSALVAM == 1}">checked</c:if>
                                    <axis:atr f="axissin006" c="CSALVAM" a="modificable=false"/> />
                                </td>
                                </axis:visible>
                                <!-- fin bug 0024675 -->
                            </tr>
                             <axis:visible c="TTIPDEC" f="axissin006">                            
                            <tr>
                                          
                                            
                            <td align="left" colspan="5">
                                           <b class="campocaja"><axis:alt f="axissin006" c="TIT_TTIPDEC" lit="9901032" /></b>
                                    <table class="seccion" align="center">
                                        <tr>
                                            <th style="width:20%;height:0px"></th>
                                            <th style="width:20%;height:0px"></th>
                                            <th style="width:20%;height:0px"></th>
                                            <th style="width:20%;height:0px"></th>
                                            <th style="width:20%;height:0px"></th>
                                        </tr>
                                       
                                            
                                            <tr>
                                <axis:ocultar c="TMEDDEC" f="axissin006" dejarHueco="false">                           
                                <!-- Medio Declaración -->
                                 <td class="titulocaja">
                                     <b><axis:alt f="axissin006" c="TMEDDEC" lit="9000975" /></b>
                                </td>
                                </axis:ocultar>
                                
                                <!-- Tipo Declarante -->
                                <axis:ocultar c="TTIPDEC" f="axissin006" dejarHueco="false"> 
                                <td class="titulocaja">
                                    <b><axis:alt f="axissin006" c="TTIPDEC" lit="9001163" /></b>
                                </td>
                                </axis:ocultar>
                                
                            </tr>
                            <tr>
                                  <axis:visible f="axissin006" c="TMEDDEC">  
                                <!-- Medio DeclaraciÃ³n -->
                                <td class="campocaja">
                                
                                    <input type="text" class="campodisabled campo campotexto"   <axis:atr f="axissin006" c="TMEDDEC" a="modificable=false"/>   
                                    value="${__formdata.OB_IAX_SINIESTRO.TMEDDEC}"        name="TMEDDEC" id="TMEDDEC"  style="width:90%;" />&nbsp;                                
                               
                                </td>
                                 </axis:visible>
                                 <axis:visible f="axissin006" c="TTIPDEC">
                                <!-- Tipo Declarante -->
                                <td class="campocaja">
                                
                                    <input type="text" class="campodisabled campo campotexto"   <axis:atr f="axissin006" c="TTIPDEC" a="modificable=false"/>   
                                    value="${__formdata.OB_IAX_SINIESTRO.TTIPDEC}"        name="TTIPDEC" id="TTIPDEC"  style="width:90%;" />&nbsp;                                
                                
                                </td> 
                                </axis:visible>       
                                
                            </tr>
                            
                            
                             <c:if test="${__formdata.OB_IAX_SINIESTRO.CTIPDEC == 0}">
                                 <tr>
                                    <td class="titulocaja" colspan="2"> 
                                    <b><axis:alt f="axissin006" c="TOMADORES" lit="1000181"/></b>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="campocaja" colspan="2">
                                        <c:forEach var="miListaId" items="${__formdata.T_IAX_TOMADORES}">
                                             <c:if test="${miListaId.OB_IAX_TOMADORES.SPERSON == __formdata.OB_IAX_SINIESTRO.DEC_SPERSON}">
                                              <input type="text" class="campodisabled campo campotexto"   <axis:atr f="axissin006" c="DEC_SPERSON" a="modificable=false"/>   
                                                value="${miListaId.OB_IAX_TOMADORES.NNUMIDE} - ${miListaId.OB_IAX_TOMADORES.TNOMBRE} ${miListaId.OB_IAX_TOMADORES.TAPELLI1} ${miListaId.OB_IAX_TOMADORES.TAPELLI2}" 
                                                name="DEC_SPERSON" id="DEC_SPERSON"  style="width:90%;" />&nbsp;                                
                                            </c:if>
                                        </c:forEach>
                                    </td>
                                </tr>
                             </c:if>

                             <c:if test="${__formdata.OB_IAX_SINIESTRO.CTIPDEC == 2 || __formdata.OB_IAX_SINIESTRO.CTIPDEC == 1}">
                            
                             <tr>
                                    <td class="titulocaja" colspan="2"> 
                                    <c:choose>
                                        <c:when test="${__formdata.OB_IAX_SINIESTRO.CTIPDEC == 2}">
                                             <b><axis:alt f="axissin006" c="PROPIETARIOS" lit="9001271"/></b>
                                        </c:when>
                                        <c:when test="${__formdata.OB_IAX_SINIESTRO.CTIPDEC == 1}">
                                             <b><axis:alt f="axissin006" c="ASSEGURADOS" lit="108228"/></b>
                                        </c:when>
                                    </c:choose>
                                        
                                    </td>
                                </tr>
                                <tr>
                                    <td class="campocaja" colspan="2">
                                            <c:forEach var="miListaId" items="${__formdata.T_IAX_ASEGURADOS}">
                                                    <c:if test="${miListaId.OB_IAX_ASEGURADOS.SPERSON == __formdata.OB_IAX_SINIESTRO.DEC_SPERSON}">
                                                        <input type="text" class="campodisabled campo campotexto"   <axis:atr f="axissin006" c="DEC_SPERSON" a="modificable=false"/>   
                                                         value="${miListaId.OB_IAX_ASEGURADOS.NNUMIDE} - ${miListaId.OB_IAX_ASEGURADOS.TNOMBRE} ${miListaId.OB_IAX_ASEGURADOS.TAPELLI1} ${miListaId.OB_IAX_ASEGURADOS.TAPELLI2}" 
                                                         name="DEC_SPERSON" id="DEC_SPERSON"  style="width:90%;" />&nbsp;                                
                                                    </c:if>
                                            </c:forEach>
                                      </td>
                                </tr>
                              </c:if>  
                             <c:if test="${__formdata.OB_IAX_SINIESTRO.CTIPDEC == 3}">
                             <tr>
                                    <td class="titulocaja" colspan="2"> 
                                             <b><axis:alt f="axissin006" c="CONDUCTORES" lit="9001186"/></b>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="campocaja" colspan="2">
                                     
                                                        <c:forEach var="miListaId" items="${__formdata.T_IAX_CONDUCTORES}">
                                                                <c:if test="${miListaId.OB_IAX_ASEGURADOS.SPERSON == __formdata.OB_IAX_SINIESTRO.DEC_SPERSON}">
                                                                 <input type="text" class="campodisabled campo campotexto"   <axis:atr f="axissin006" c="DEC_SPERSON" a="modificable=false"/>   
                                                                 value="${miListaId.OB_IAX_ASEGURADOS.NNUMIDE} - ${miListaId.OB_IAX_ASEGURADOS.TNOMBRE} ${miListaId.OB_IAX_ASEGURADOS.TAPELLI1} ${miListaId.OB_IAX_ASEGURADOS.TAPELLI2}" 
                                                                 name="DEC_SPERSON" id="DEC_SPERSON"  style="width:90%;" />&nbsp;                                
                                                        </c:if>
                                                        </c:forEach>
                                            </td>
                                </tr>
                             </c:if>  
                            <c:if test="${__formdata.OB_IAX_SINIESTRO.CTIPDEC >= 4}">
                            <axis:ocultar c="TDECLARANTE" f="axissin006" dejarHueco="false">
                            
                            <tr>
                            <td class="titulocaja">
                                  <b><axis:alt f="axissin006" c="TDECLARANTE" lit="102844"/></b>
                                </td>
                            <!-- NNUMIDE -->
                                <td class="titulocaja">
                                <axis:visible f="axissin006" c="NNUMIDE">
                                    <b><axis:alt f="axissin006" c="NNUMIDE" lit="102999" /></b>
                                </axis:visible>
                                </td>  
                                </tr>
                                <tr>
                                
                                   <td class="campocaja">
                                   <axis:visible f="axissin006" c="TTIPIDE">
                                   <input   type="text"  <axis:atr f="axissin006" c="TTIPIDE" a="modificable=false"/> class="campowidthinput campo campotexto" onchange="f_existe_persona(this.value)" 
                                    id="TTIPIDE" name="TTIPIDE" size="15"  value="${__formdata.OB_IAX_SINIESTRO.TTIPIDE}"/>
                                    </axis:visible>
                                    </td>
                             <td class="campocaja">
                                <axis:visible f="axissin006" c="NNUMIDE">
                                    <input   type="text"  <axis:atr f="axissin006" c="NNUMIDEDEC" a="modificable=false"/> class="campowidthinput campo campotexto" onchange="f_existe_persona(this.value)" 
                                    id="NNUMIDEDEC" name="NNUMIDEDEC" size="15"  value="${__formdata.OB_IAX_SINIESTRO.NNUMIDE}"/>
                                </axis:visible>
                                </td>  
                                <c:if test="${!empty __formdata.OB_IAX_SINIESTRO.DEC_SPERSON}">
                                <td class="campocaja">
                                &nbsp;&nbsp;
                                <img border="0" id="INFO_PERSONA" name="INFO_PERSONA" title="<axis:alt f="axissin006" c="INFO_PERSONA" lit="9000968"/>" alt="<axis:alt f="axissin006" c="INFO_PERSONA" lit="9000968"/>" src="images/informacion.gif" onclick="f_consulta_persona()" style="cursor:pointer"/>
                                &nbsp;&nbsp;
                                
                                </td>
                                </c:if>
                                 
                                
                            </tr>
                            
                            
                            
                            <tr>
                                <!-- Nombre -->
                                 
                                 <axis:visible f="axissin006" c="TNOMDEC">
                                 	<td class="titulocaja"> 
                                    <b><axis:alt f="axissin006" c="TNOMDEC" lit="105940" /></b>
                                    	</td>
                                 </axis:visible>
                                
                                 <!-- Nombre1 -->
                                  
                                 <axis:visible f="axissin006" c="TNOM1DEC">
                                 	<td class="titulocaja">
                                    <b><axis:alt f="axissin006" c="TNOM1DEC" lit="105940" /></b>
                                   </td>
                                 </axis:visible>
                              
                             <!-- Nombre2 -->
                                 
                                 <axis:visible f="axissin006" c="TNOM2DEC">
                                 	<td class="titulocaja"> 
                                    <b><axis:alt f="axissin006" c="TNOM2DEC" lit="9902260" /></b>
                                    	 </td>
                                 </axis:visible>
                               
                                <!-- 1r Apellido -->
                             
                                <axis:visible f="axissin006" c="TAPE1DEC">
                                	   <td class="titulocaja">
                                    <b><axis:alt f="axissin006" c="TAPE1DEC" lit="108243" /></b>
                                    </td>
                                </axis:visible>
                               
                                <!-- 2n Apellido -->
                                
                                <axis:visible f="axissin006" c="TAPE2DEC">
                                	<td class="titulocaja">
                                    <b><axis:alt f="axissin006" c="TAPE2DEC" lit="108246" /></b>
                                    </td> 	
                                </axis:visible>
                               
                                 <!-- Telefono -->
                                
                                <axis:visible f="axissin006" c="TTELDEC">
                                	<td class="titulocaja">
                                    <b><axis:alt f="axissin006" c="TTELDEC" lit="9000992" /></b>
                                   </td>  
                                </axis:visible>
                                     
                                                                 
                            </tr>
                            <tr>
                                <!-- Nombre -->
                                
                                <axis:visible f="axissin006" c="TNOMDEC">
                                	<td class="campocaja">
                                    <input   type="text"  <axis:atr f="axissin006" c="TNOMDEC" a="modificable=false"/>  class="campowidthinput campo campotexto" id="TNOMDEC" name="TNOMDEC" size="15"  value="${__formdata.OB_IAX_SINIESTRO.TNOMDEC}"/>
                                    	 </td>
                                </axis:visible>
                               
                                 <!-- Nombre1 -->
                                
                                <axis:visible f="axissin006" c="TNOM1DEC">
                                	<td class="campocaja">
                                    <input   type="text"  <axis:atr f="axissin006" c="TNOM1DEC" a="modificable=false"/>  class="campowidthinput campo campotexto" id="TNOM1DEC" name="TNOM1DEC" size="15"  value="${__formdata.OB_IAX_SINIESTRO.TNOM1DEC}"/>
                                    </td> 	
                                </axis:visible>
                               
                                 <!-- Nombre2 -->
                               
                                <axis:visible f="axissin006" c="TNOM2DEC">
                                	 <td class="campocaja">
                                    <input   type="text"  <axis:atr f="axissin006" c="TNOM2DEC" a="modificable=false"/>  class="campowidthinput campo campotexto" id="TNOM2DEC" name="TNOM2DEC" size="15"  value="${__formdata.OB_IAX_SINIESTRO.TNOM2DEC}"/>
                                    	</td>
                                </axis:visible>
                                
                                <!-- 1r Apellido -->
                                
                                <axis:visible f="axissin006" c="TAPE1DEC">
                                	<td class="campocaja">
                                    <input   type="text" <axis:atr f="axissin006" c="TAPE1DEC" a="modificable=false"/> class="campowidthinput campo campotexto" id="TAPE1DEC" name="TAPE1DEC" size="15"  value="${__formdata.OB_IAX_SINIESTRO.TAPE1DEC}"/>
                                    </td>	
                                </axis:visible>
                                
                                <!-- 2n Apellido -->
                                
                                <axis:visible f="axissin006" c="TAPE2DEC">
                                	<td class="campocaja">
                                    <input   type="text" <axis:atr f="axissin006" c="TAPE2DEC" a="modificable=false"/> class="campowidthinput campo campotexto" id="TAPE2DEC" name="TAPE2DEC" size="15"  value="${__formdata.OB_IAX_SINIESTRO.TAPE2DEC}"/>
                                 </td> 
                                </axis:visible>
                               
                                <!-- Telefono -->
                               
                                <axis:visible f="axissin006" c="TTELDEC">
                                	 <td class="campocaja">
                                    <input   type="text" <axis:atr f="axissin006" c="TTELDEC" a="modificable=false"/> class="campowidthinput campo campotexto" id="TTELDEC" name="TTELDEC" size="15"  value="${__formdata.OB_IAX_SINIESTRO.TTELDEC}"/>
                                      </td>	
                                </axis:visible>
                                  
                                </tr>
                                <tr>
                                   <!-- Telefono MOVIL -->
                                
                                <axis:visible f="axissin006" c="TMOVILDEC">
                                	<td class="titulocaja">
                                    <b><axis:alt f="axissin006" c="TMOVILDEC" lit="9903007" /></b>
                                    </td>  	
                                </axis:visible>
                               
                                
                                    <!-- MAIL -->
                               
                                <axis:visible f="axissin006" c="TEMAILDEC">
                                	 <td class="titulocaja">
                                    <b><axis:alt f="axissin006" c="TEMAILDEC" lit="109792" /></b>
                                    </td> 
                                </axis:visible>
                               
                            </tr>
                                <!-- Telefono mov -->
                                
                                <axis:visible f="axissin006" c="TMOVILDEC">
                                	<td class="campocaja">
                                    <input   type="text" <axis:atr f="axissin006" c="TMOVILDEC" a="modificable=false"/> class="campowidthinput campo campotexto" id="TMOVILDEC" name="TMOVILDEC" size="15"  value="${__formdata.OB_IAX_SINIESTRO.TMOVILDEC}"/>
                                    	 </td>  
                                </axis:visible>
                                
                                 <!-- MAIL -->
                               
                                <axis:visible f="axissin006" c="TEMAILDEC">
                                	  <td class="campocaja">
                                    <input   type="text" <axis:atr f="axissin006" c="TEMAILDEC" a="modificable=false"/> class="campowidthinput campo campotexto" id="TEMAILDEC" name="TEMAILDEC" size="15"  value="${__formdata.OB_IAX_SINIESTRO.TEMAILDEC}"/>
                                      </td>   	
                                </axis:visible>
                              
                            </tr>       
                            
                            </axis:ocultar>
                            
                            </c:if>
                            
                            </tr>
                                            </table>
                                            </td>
                                            </tr>          
                            
</axis:visible>
                            

                        <axis:visible f="axissin006" c="DSP_LOCALIZATRAMIT0">
                        <c:if test="${!empty __formdata.OB_IAX_SINIESTRO.LOCALIZA || 
                     		(empty __formdata.OB_IAX_SINIESTRO.LOCALIZA)}">                                 	            	
                  
                            <tr>
                                <!-- Zona Ocurrencia -->
                                
                                <td class="titulocaja">
                                   
                                    
                                    <axis:visible f="axissin006" c="TLOCALI_DATOS_SIN">
                                    <b><axis:alt f="axissin006" c="TIT_TLOCALI_DATOS_SIN" lit="110492" /></b>
                                    </axis:visible>
                                </td>
                            </tr>
                            <tr>
                                <!-- Lugar Ocurrencia -->
                                 
                                 
                                <!-- Inicio Seccion 
                                    <td class="titulocaja" colspan="4">
                                       <!--input value="0" type="radio"  id="radioLocaliza" name="radioLocaliza" onclick="f_verifica_textarea(this.value);" <c:if test="${!empty __formdata.OB_IAX_SINIESTRO.LOCALIZA.TLOCALI}">checked</c:if>/
                                       <axis:visible f="axissin006" c="TLOCALI_DATOS_SIN">
                                            <b><axis:alt f="axissin006" c="TLOCALI_DATOS_SIN" lit="100588" /></b> 
                                       </axis:visible>
                                    </td> -->

                                <tr>
                                   <td colspan="5" style="width:90%;" class="campocaja">
                                   <axis:visible f="axissin006" c="TLOCALI">
                                        <axis:visible f="axissin006" c="TLOCALI_DATOS_SIN">
                                            <textarea  readonly="true" rows="3" cols="100" class="campodisabled campo campotexto" style="width:100%;" name="TLOCALI" id="TLOCALI">${__formdata.OB_IAX_SINIESTRO.LOCALIZA.TLOCALI}</textarea>
                                        </axis:visible>
                                    </axis:visible>
                                    </td>
                                </tr>
                                <c:if test="${__formdata.OB_IAX_SINIESTRO.LOCALIZA.TLOCALI == null || __formdata.OB_IAX_SINIESTRO.LOCALIZA.TLOCALI == ''}" >
                                    <axis:visible c="DSP_DIREC_REDU" f="axissin006">
                                    <tr>
                                        <!-- Tipo via -->
                                        <axis:ocultar f="axissin006" c="TSIGLAS" dejarHueco="false">
                                        <td class="titulocaja">
                                            <b><axis:alt f="axissin006" c="TSIGLAS" lit="110028" /></b>
                                        </td>
                                        </axis:ocultar>
                                        
                                        <axis:ocultar f="axissin006" c="TVIAVP" dejarHueco="false">
                                        <td class="titulocaja">
                                            <b><axis:alt f="axissin006" c="TVIAVP" lit="9902408" /></b>
                                        </td>
                                        </axis:ocultar>

                                        <!-- Nombre -->
                                        <td class="titulocaja">
                                        <axis:visible f="axissin006" c="TNOMVIA">
                                            <b><axis:alt f="axissin006" c="TNOMVIA" lit="110029" /></b>
                                        </axis:visible>
                                        </td>
                                        <!-- Número -->
                                        <td class="titulocaja">
                                        <axis:visible f="axissin006" c="NNUMVIA">
                                            <b><axis:alt f="axissin006" c="NNUMVIA" lit="800440" /></b>
                                        </axis:visible>
                                        </td>
                                        <!--  Otros -->
                                        <td class="titulocaja">
                                        <axis:visible f="axissin006" c="TCOMPLE">
                                            <b><axis:alt f="axissin006" c="TCOMPLE" lit="110031" /></b>
                                        </axis:visible>
                                        </td>
                                    </tr>
                                    <tr>
                                        <!-- Tipo via -->
                                        <axis:ocultar f="axissin006" c="TSIGLAS" dejarHueco="false">
                                        <td class="campocaja">
                                            <input type="text" class="campodisabled campo campotexto" style="width:90%;"  
                                            <axis:atr f="axissin006" c="TSIGLAS" a="modificable=false"/> id="TSIGLAS" name="TSIGLAS" 
                                            size="15" value="${__formdata.OB_IAX_SINIESTRO.LOCALIZA.TSIGLAS}"/>
                                        </td>
                                        </axis:ocultar>
                                        
                                        <axis:ocultar f="axissin006" c="TVIAVP" dejarHueco="false">
                                        <td class="campocaja">
                                            <input type="text" class="campodisabled campo campotexto" style="width:90%;"  
                                            <axis:atr f="axissin006" c="TVIAVP" a="modificable=false"/> id="TVIAVP" name="TVIAVP" 
                                            size="15" value="${__formdata.OB_IAX_SINIESTRO.LOCALIZA.TVIAVP}"/>
                                        </td>
                                        </axis:ocultar>
                                        
                                        
                                         <!-- Nombre -->
                                        <td class="campocaja">
                                        <axis:visible f="axissin006" c="TNOMVIA">
                                            <input type="text" class="campodisabled campo campotexto"
                                            id="TNOMVIA" name="TNOMVIA" style="width:90%;" <axis:atr f="axissin006" c="TNOMVIA" a="modificable=false"/> size="15"  value="${__formdata.OB_IAX_SINIESTRO.LOCALIZA.TNOMVIA}"/>
                                        </axis:visible>
                                        </td>
                                        <!-- Número -->
                                        <td class="campocaja">
                                        <axis:visible f="axissin006" c="NNUMVIA">
                                            <input  type="text" class="campodisabled campo campotexto"
                                            id="NNUMVIA" name="NNUMVIA" size="15" style="width:60%;" <axis:atr f="axissin006" c="NNUMVIA" a="modificable=false"/>  value="${__formdata.OB_IAX_SINIESTRO.LOCALIZA.NNUMVIA}"/>
                                        </axis:visible>
                                        </td>
                                        <!-- Otros -->
                                        <td class="campocaja" colspan="2">
                                        <axis:visible f="axissin006" c="TCOMPLE">
                                            <input  readonly="true" type="text" style="width:90%;" class="campodisabled campo campotexto" <axis:atr f="axissin006" c="TCOMPLE" a="modificable=false"/>  id="TCOMPLE" name="TCOMPLE" 
                                            value="${__formdata.OB_IAX_SINIESTRO.LOCALIZA.TCOMPLE}"/>
                                        </axis:visible>
                                        </td>
                                    </tr>
                                    <tr>
                                        <!-- C.P -->
                                        <td class="titulocaja">
                                        <axis:visible f="axissin006" c="CPOSTAL">
                                            <b><axis:alt f="axissin006" c="CPOSTAL" lit="101081" /></b>
                                        </axis:visible>
                                        </td>
                                        
                                        <!-- Pais -->
                                        <td class="titulocaja">
                                        <axis:visible f="axissin006" c="TPAIS">
                                            <b><axis:alt f="axissin006" c="TPAIS" lit="100816" /></b>
                                        </axis:visible>
                                        </td>
                                        <!-- Provincia -->
                                        <td class="titulocaja">
                                        <axis:visible f="axissin006" c="TPROVIN">
                                            <b><axis:alt f="axissin006" c="TPROVIN" lit="100756" /></b>
                                        </axis:visible>
                                        </td>
                                        <!--  Población -->
                                        <td class="titulocaja">
                                        <axis:visible f="axissin006" c="TPOBLAC">
                                            <b><axis:alt f="axissin006" c="TPOBLAC" lit="100817" /></b>
                                        </axis:visible>
                                        </td>
                                    </tr>
                                    <tr>
                                         <!-- C.P -->
                                         <td class="campocaja">
                                         <axis:visible f="axissin006" c="CPOSTAL">
                                            <input readonly="true" type="text" class="campodisabled campo campotexto" size="15" 
                                            value="${__formdata.OB_IAX_SINIESTRO.LOCALIZA.CPOSTAL}" <axis:atr f="axissin006" c="CPOSTAL" a="modificable=false"/>  name="CPOSTAL" id="CPOSTAL" 
                                            style="text-transform:uppercase;width:60%;"/>
                                        </axis:visible>
                                        </td>  
                                        <!-- Pais -->
                                        <td class="campocaja">
                                        <axis:visible f="axissin006" c="TPAIS">
                                            <input readonly="true" type="text" class="campodisabled campo campotexto" size="15" <axis:atr f="axissin006" c="TPAIS" a="modificable=false"/> value="${__formdata.OB_IAX_SINIESTRO.LOCALIZA.TPAIS}" name="TPAIS" id="TPAIS"  style="width:90%;" />
                                        </axis:visible>
                                        </td>
                                        <!-- Provincia -->
                                        <td class="campocaja">
                                        <axis:visible f="axissin006" c="TPROVIN">
                                            <input type="text" readonly="true" class="campodisabled campo campotexto" size="15" value="${__formdata.OB_IAX_SINIESTRO.LOCALIZA.TPROVIN}" <axis:atr f="axissin006" c="TPROVIN" a="modificable=false"/> name="TPROVIN" id="TPROVIN" style="width:90%;"  />
                                        </axis:visible>
                                        </td>
                                        <!-- Población -->
                                        <td class="campocaja">
                                        <axis:visible f="axissin006" c="TPOBLAC">
                                            <input type="text" readonly="true" class="campodisabled campo campotexto" size="15" value="${__formdata.OB_IAX_SINIESTRO.LOCALIZA.TPOBLAC}" name="TPOBLAC" id="TPOBLAC" <axis:atr f="axissin006" c="TPOBLAC" a="modificable=false"/> style="width:90%;" />
                                        </axis:visible>
                                        </td>
                                    </tr>
                                    </axis:visible>
                                    <axis:visible f="axissin006" c="DSP_DIREC_AMPL">
                                    <tr>
                                        <td colspan="6">
                                            <table class="seccion">
                                            <!-- Zona Ocurrencia --> 
                                                <tr>
                                                <!-- Lugar Ocurrencia -->
                                                    <td colspan="5">
                                                        <table class="area" align="center">
                                                            <tr>
                                                                <th style="width:25%;height:0px"></th>
                                                                <th style="width:25%;height:0px"></th>
                                                                <th style="width:25%;height:0px"></th>
                                                                <th style="width:25%;height:0px"></th>
                                                            </tr>
                                                            <!-- Inicio Seccion -->
                                                            <tr>
                                                            <td colspan="6">
                                                            <table id="direccions">
                                                            <tr>
                                                                <th style="width:15%;height:0px"></th>
                                                                <th style="width:10%;height:0px"></th>
                                                                <th style="width:20%;height:0px"></th>
                                                                <th style="width:20%;height:0px"></th>
                                                                <th style="width:25%;height:0px"></th>
                                                                <th style="width:10%;height:0px"></th>
                                                            </tr>
                                                            <axis:visible f="axissin006" c="DSP_DIRECCION"> 
                                                                <axis:ocultar f="axissin006" c="CSIGLAS" dejarHueco="false">
                                                                <tr>
                                                                    <!-- Tipo via -->
                                                                    <td class="titulocaja">
                                                                        <b><axis:alt f="axissin006" c="CSIGLAS" lit="110028" /></b>
                                                                    </td>
                                                                </tr>
                                                                </axis:ocultar>
                                                                <axis:ocultar f="axissin006" c="CSIGLAS" dejarHueco="false">
                                                                    <tr>
                                                                        <!-- Tipo via -->
                                                                        <td class="campocaja">
                                                                            <select name="CSIGLAS" id="CSIGLAS" disabled size="1" class="campowidthselect campo campotexto" 
                                                                            <axis:atr f="axissin006" c="CSIGLAS" a="obligatorio=true"/>  title="<axis:alt f="axissin006" c="CSIGLAS" lit="110028" />">&nbsp;
                                                                                <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axissin006" c="BLANCO" lit="1000348"/> - </option>
                                                                                <c:forEach var="element" items="${__formdata.listvalores.lstTipoVia}">
                                                                                    <option value = "${element.CSIGLAS}" 
                                                                                    <c:if test="${element.CSIGLAS == __formdata.OB_IAX_SINIESTRO.LOCALIZA.CSIGLAS}"> selected </c:if> />
                                                                                        ${element.TDENOM} 
                                                                                    </option>
                                                                                </c:forEach>
                                                                            </select>
                                                                        </td>
                                                                    </tr>
                                                                </axis:ocultar>
                                                                <tr>
                                                                    <!-- Nombre -->
                                                                    <td class="titulocaja">
                                                                        <b><axis:alt f="axissin006" c="TNOMVIA" lit="110029" /></b>
                                                                    </td>
                                                                    <!-- Número -->
                                                                    <td class="titulocaja">
                                                                        <b><axis:alt f="axissin006" c="NNUMVIA" lit="800440" /></b>
                                                                    </td>
                                                                    <!--  Otros -->
                                                                    <td class="titulocaja">
                                                                        <b><axis:alt f="axissin006" c="TCOMPLE" lit="110031" /></b>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <!-- Nombre -->
                                                                    <td class="campocaja">
                                                                        <input   type="text" disabled class="campowidthinput campo campotexto_ob" id="TNOMVIA" name="TNOMVIA" size="15" 
                                                                            <axis:atr f="axissin006" c="TNOMVIA" a="obligatorio=true"/> value="${__formdata.OB_IAX_SINIESTRO.LOCALIZA.TNOMVIA}"
                                                                            title="<axis:alt f="axissin006" c="TNOMVIA" lit="110029" />"/>
                                                                    </td>
                                                                    <!-- Número -->
                                                                    <td class="campocaja">
                                                                        <input   type="text" disabled class="campowidthinput campo campotexto_ob" id="NNUMVIA" name="NNUMVIA" size="15"  value="${__formdata.OB_IAX_SINIESTRO.LOCALIZA.NNUMVIA}" style="width:50%;"/>
                                                                    </td>
                                                                    <!-- Otros -->
                                                                    <td class="campocaja" colspan="2">
                                                                        <input    type="text" disabled class="campowidthinput campo campotexto_ob"  id="TCOMPLE" name="TCOMPLE" 
                                                                        value="${__formdata.OB_IAX_SINIESTRO.LOCALIZA.TCOMPLE}"/>
                                                                    </td>
                                                                </tr>
                                                                </axis:visible>
                                                                <%-- Direccion para colombia --%>
                                                                <axis:visible f="axissin006" c="DSP_DIRECCIONCOL">  
                                                                <tr>
                                                                   <td colspan ="6"> 
                                                                    <table>
                                                                    <tr>
                                                                        <th style="width:19%;height:0px"></th>
                                                                        <th style="width:15%;height:0px"></th>
                                                                        <th style="width:17%;height:0px"></th>
                                                                        <th style="width:17%;height:0px"></th>
                                                                        <th style="width:17%;height:0px"></th>
                                                                        <th style="width:15%;height:0px"></th>
                                                                    </tr>
                                                                    <tr>
                                                                        <axis:visible f="axissin006" c="CVIAVP">
                                                                        <td class="titulocaja">
                                                                            <b><axis:alt f="axissin006" c="CVIAVP" lit="9902408"/></b>
                                                                        </td>
                                                                        </axis:visible>
                                                                        <axis:visible f="axissin006" c="TNOMVIA">
                                                                        <td class="titulocaja" colspan="2">
                                                                            <b><axis:alt f="axissin006" c="TNOMVIA" lit="9903010"/></b>
                                                                        </td>
                                                                         </axis:visible>
                                                                        <axis:visible f="axissin006" c="CLITVP">
                                                                        <td class="titulocaja">
                                                                            <b><axis:alt f="axissin006" c="CLITVP" lit="9902409"/></b>
                                                                        </td>
                                                                         </axis:visible>
                                                                        <axis:visible f="axissin006" c="CBISVP">
                                                                        <td class="titulocaja">
                                                                            <b><axis:alt f="axissin006" c="CBISVP" lit="9902410"/></b>
                                                                        </td>
                                                                         </axis:visible>
                                                                        <axis:visible f="axissin006" c="CORVP">
                                                                        <td class="titulocaja">
                                                                            <b><axis:alt f="axissin006" c="CORVP" lit="9902411"/></b>
                                                                        </td>
                                                                        </axis:visible>
                                                                    <tr>
                                                                        <axis:visible f="axissin006" c="CVIAVP">
                                                                        <td class="campocaja" >
                                                                        <select name="CVIAVP" disabled id="CVIAVP" size="1" class="campowidthselect campo campotexto" style="width:80%;" 
                                                                                <axis:atr f="axissin006" c="CSIGLAS" a="obligatorio=false"/> title="<axis:alt f="axissin006" c="CVIAVP" lit="9902408"/>">&nbsp;
                                                                                <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axissin006" c="BLANCO" lit="1000348"/> - </option>
                                                                                <c:forEach var="element" items="${__formdata.listvalores.lstTipoVia}">
                                                                                                    <option value = "${element.CSIGLAS}" 
                                                                                                    <c:if test="${element.CSIGLAS == __formdata.OB_IAX_SINIESTRO.LOCALIZA.CVIAVP}"> selected </c:if> />
                                                                                                ${element.TDENOM} 
                                                                                                    </option>
                                                                                                    </c:forEach>
                                                                            </select>
                                                                        </td>
                                                                         </axis:visible>
                                                                        <axis:visible f="axissin006" c="TNOMVIA">
                                                                        <td class="campocaja" colspan="2">
                                                                            <input   type="text" disabled class="campowidthinput campo campotexto" id="TNOMVIA" name="TNOMVIA" size="15" 
                                                                                <axis:atr f="axissin006" c="TNOMVIA" a="obligatorio=false"/> value="${__formdata.OB_IAX_SINIESTRO.LOCALIZA.TNOMVIA}"
                                                                                title="<axis:alt f="axissin006" c="TNOMVIA" lit="110029" />" maxlength="40"/>
                                                                        </td>
                                                                         </axis:visible>
                                                                        <axis:visible f="axissin006" c="CLITVP">
                                                                        <td class="campocaja">
                                                                            <select name="CLITVP" disabled id="CLITVP" size="1" class="campowidthselect campo campotexto" style="width:70%;"
                                                                             <axis:atr f="axissin006" c="CLITVP" a="obligatorio=false"/> title="<axis:alt f="axissin006" c="CLITVP" lit="9902409"/>">
                                                                                <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axissin006" c="BLANCO" lit="1000348"/> - </option>
                                                                                <c:forEach var="element" items="${__formdata.listvalores.lstCLITVP}">
                                                                                    <option value = "${element.CATRIBU}" 
                                                                                    <c:if test="${element.CATRIBU == __formdata.OB_IAX_SINIESTRO.LOCALIZA.CLITVP}"> selected </c:if> >
                                                                                        ${element.TATRIBU} 
                                                                                    </option>
                                                                                </c:forEach>
                                                                            </select>
                                                                        </td>
                                                                        </axis:visible>
                                                                        <axis:visible f="axissin006" c="CBISVP">
                                                                        <td class="campocaja">
                                                                            <select name="CBISVP" disabled id="CBISVP" size="1" class="campowidthselect campo campotexto" style="width:70%;">
                                                                                <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axissin006" c="BLANCO" lit="1000348"/> - </option>
                                                                                <c:forEach var="element" items="${__formdata.listvalores.lstCBISVP}">
                                                                                    <option value = "${element.CATRIBU}" 
                                                                                    <c:if test="${element.CATRIBU == __formdata.OB_IAX_SINIESTRO.LOCALIZA.CBISVP}"> selected </c:if> >
                                                                                        ${element.TATRIBU} 
                                                                                    </option>
                                                                                </c:forEach>
                                                                            </select>
                                                                        </td>
                                                                        </axis:visible>
                                                                        <axis:visible f="axissin006" c="CORVP">
                                                                        <td class="campocaja">
                                                                            <select name="CORVP" disabled id="CORVP" size="1" class="campowidthselect campo campotexto" style="width:70%;">&nbsp;
                                                                                <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axissin006" c="BLANCO" lit="1000348"/> - </option>
                                                                                <c:forEach var="element" items="${__formdata.listvalores.lstCORVP}">
                                                                                    <option value = "${element.CATRIBU}" 
                                                                                    <c:if test="${element.CATRIBU == __formdata.OB_IAX_SINIESTRO.LOCALIZA.CORVP}"> selected </c:if> />
                                                                                        ${element.TATRIBU} 
                                                                                    </option>
                                                                                </c:forEach>
                                                                            </select>
                                                                        </td>
                                                                        </axis:visible>
                                                                    </tr>
                                                                    <tr>
                                                                        <axis:visible f="axissin006" c="NVIAADCO">
                                                                        <td class="titulocaja">
                                                                            <b><axis:alt f="axissin006" c="NVIAADCO" lit="9902414"/></b>
                                                                        </td>
                                                                        </axis:visible>
                                                                        <axis:visible f="axissin006" c="CLITCO">
                                                                        <td class="titulocaja">
                                                                            <b><axis:alt f="axissin006" c="CLITCO" lit="9902409"/></b>
                                                                        </td>
                                                                        </axis:visible>
                                                                        <axis:visible f="axissin006" c="CORCO">
                                                                        <td class="titulocaja">
                                                                            <b><axis:alt f="axissin006" c="CORCO" lit="9902411"/></b>
                                                                        </td>
                                                                        </axis:visible>
                                                                        <axis:visible f="axissin006" c="NPLACACO">
                                                                        <td class="titulocaja">
                                                                            <b><axis:alt f="axissin006" c="NPLACACO" lit="9902415"/></b>
                                                                        </td>
                                                                        </axis:visible>
                                                                        <axis:visible f="axissin006" c="COR2CO">
                                                                        <td class="titulocaja">
                                                                            <b><axis:alt f="axissin006" c="COR2CO" lit="9902411"/></b>
                                                                        </td>
                                                                        </axis:visible>
                                                                        
                                                                    </tr>
                                                                    <tr>
                                                                        <axis:visible f="axissin006" c="NVIAADCO">
                                                                        <td class="campocaja">
                                                                            <input type="text" disabled class="campowidthinput campo campotexto" size="15" value="${__formdata.OB_IAX_SINIESTRO.LOCALIZA.NVIAADCO}" name="NVIAADCO" id="NVIAADCO" 
                                                                               <axis:atr f="axissin006" c="NVIAADCO" a="obligatorio=false"/>    style="width:70%;" formato="entero" title="<axis:alt f="axissin006" c="NVIAADCO" lit="9902414"/>"/>
                                                                        </td>
                                                                        </axis:visible>
                                                                        <axis:visible f="axissin006" c="CLITCO">
                                                                        <td class="campocaja">
                                                                            <select name="CLITCO" disabled id="CLITCO" size="1" class="campowidthselect campo campotexto" style="width:70%;">&nbsp;
                                                                                <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axissin006" c="BLANCO" lit="1000348"/> - </option>
                                                                                <c:forEach var="element" items="${__formdata.listvalores.lstCLITCO}">
                                                                                    <option value = "${element.CATRIBU}" 
                                                                                    <c:if test="${element.CATRIBU == __formdata.OB_IAX_SINIESTRO.LOCALIZA.CLITCO}"> selected </c:if> />
                                                                                        ${element.TATRIBU} 
                                                                                    </option>
                                                                                </c:forEach>
                                                                            </select>
                                                                        </td>
                                                                        </axis:visible>
                                                                        <axis:visible f="axissin006" c="CORCO">
                                                                        <td class="campocaja">
                                                                            <select name="CORCO" disabled id="CORCO" size="1" class="campowidthselect campo campotexto" style="width:70%;">&nbsp;
                                                                                <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axissin006" c="BLANCO" lit="1000348"/> - </option>
                                                                                <c:forEach var="element" items="${__formdata.listvalores.lstCORCO}">
                                                                                    <option value = "${element.CATRIBU}" 
                                                                                    <c:if test="${element.CATRIBU == __formdata.OB_IAX_SINIESTRO.LOCALIZA.CORCO}"> selected </c:if> />
                                                                                        ${element.TATRIBU} 
                                                                                    </option>
                                                                                </c:forEach>
                                                                            </select>
                                                                        </td>
                                                                        </axis:visible>
                                                                        <axis:visible f="axissin006" c="NPLACACO">
                                                                        <td class="campocaja">
                                                                            <input type="text" disabled class="campowidthinput campo campotexto" size="15" value="${__formdata.OB_IAX_SINIESTRO.LOCALIZA.NPLACACO}" name="NPLACACO" id="NPLACACO" 
                                                                              <axis:atr f="axissin006" c="NPLACACO" a="obligatorio=false"/> style="width:70%;" formato="entero" title="<axis:alt f="axissin006" c="NPLACACO" lit="9902415"/>"/>
                                                                        </td>
                                                                        </axis:visible>
                                                                        <axis:visible f="axissin006" c="COR2CO">
                                                                        <td class="campocaja">
                                                                            <select name="COR2CO" disabled id="COR2CO" size="1" class="campowidthselect campo campotexto" style="width:70%;">&nbsp;
                                                                                <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axissin006" c="BLANCO" lit="1000348"/> - </option>
                                                                                <c:forEach var="element" items="${__formdata.listvalores.lstCOR2CO}">
                                                                                    <option value = "${element.CATRIBU}" 
                                                                                    <c:if test="${element.CATRIBU == __formdata.OB_IAX_SINIESTRO.LOCALIZA.COR2CO}"> selected </c:if> />
                                                                                        ${element.TATRIBU} 
                                                                                    </option>
                                                                                </c:forEach>
                                                                            </select>
                                                                        </td>
                                                                        </axis:visible>
                                                                        
                                                                    </tr>
                                                                    <tr>
                                                                    
                                                                        <axis:visible f="axissin006" c="CDET1IA">
                                                                        <td class="titulocaja">
                                                                            <b><axis:alt f="axissin006" c="CDET1IA" lit="9902417"/></b>
                                                                        </td>
                                                                        </axis:visible>
                                                                        <axis:visible f="axissin006" c="TNUM1IA">
                                                                        <td class="titulocaja" colspan="2">
                                                                            <b><axis:alt f="axissin006" c="TNUM1IA" lit="9902418"/></b>
                                                                        </td>
                                                                        </axis:visible>
                                                                        <axis:visible f="axissin006" c="CDET2IA">
                                                                        <td class="titulocaja">
                                                                            <b><axis:alt f="axissin006" c="CDET2IA" lit="9902419"/></b>
                                                                        </td>
                                                                        </axis:visible>
                                                                        <axis:visible f="axissin006" c="TNUM2IA">
                                                                        <td class="titulocaja" colspan="2">
                                                                            <b><axis:alt f="axissin006" c="TNUM2IA" lit="9902420"/></b>
                                                                        </td>
                                                                        </axis:visible>
                                                                        
                                                                    </tr>
                                                                    <tr>
                                                                    
                                                                        <axis:visible f="axissin006" c="CDET1IA">
                                                                        <td class="campocaja">
                                                                            <select name="CDET1IA" disabled id="CDET1IA" size="1" class="campowidthselect campo campotexto" style="width:70%;">&nbsp;
                                                                                <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axissin006" c="BLANCO" lit="1000348"/> - </option>
                                                                                <c:forEach var="element" items="${__formdata.listvalores.lstCDET}">
                                                                                    <option value = "${element.CATRIBU}" 
                                                                                    <c:if test="${element.CATRIBU == __formdata.OB_IAX_SINIESTRO.LOCALIZA.CDET1IA}"> selected </c:if> />
                                                                                        ${element.TATRIBU} 
                                                                                    </option>
                                                                                </c:forEach>
                                                                            </select>
                                                                        </td>
                                                                        </axis:visible>
                                                                        <axis:visible f="axissin006" c="TNUM1IA">
                                                                        <td class="campocaja" colspan="2">
                                                                            <input type="text" disabled class="campowidthinput campo campotexto" size="5" value="${__formdata.OB_IAX_SINIESTRO.LOCALIZA.TNUM1IA}" name="TNUM1IA" id="TNUM1IA" 
                                                                               style="width:90%;" maxlength="100"/>
                                                                        </td>
                                                                        </axis:visible>
                                                                        <axis:visible f="axissin006" c="CDET2IA">
                                                                        <td class="campocaja">
                                                                            <select name="CDET2IA" disabled id="CDET2IA" size="1" class="campowidthselect campo campotexto" style="width:70%;">&nbsp;
                                                                                <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axissin006" c="BLANCO" lit="1000348"/> - </option>
                                                                                <c:forEach var="element" items="${__formdata.listvalores.lstCDET}">
                                                                                    <option value = "${element.CATRIBU}" 
                                                                                    <c:if test="${element.CATRIBU == __formdata.OB_IAX_SINIESTRO.LOCALIZA.CDET2IA}"> selected </c:if> />
                                                                                        ${element.TATRIBU} 
                                                                                    </option>
                                                                                </c:forEach>
                                                                            </select>
                                                                        </td>
                                                                        </axis:visible>
                                                                        <axis:visible f="axissin006" c="TNUM2IA">
                                                                        <td class="campocaja" colspan="2">
                                                                            <input type="text" disabled class="campowidthinput campo campotexto" size="5" value="${__formdata.OB_IAX_SINIESTRO.LOCALIZA.TNUM2IA}" name="TNUM2IA" id="TNUM2IA" 
                                                                               style="width:90%;" maxlength="100"/>
                                                                        </td>
                                                                        </axis:visible>
                                                                        
                                                                    </tr>
                                                                    <tr>
                                                                    
                                                                        <axis:visible f="axissin006" c="CDET3IA">
                                                                        <td class="titulocaja">
                                                                            <b><axis:alt f="axissin006" c="CDET3IA" lit="9902421"/></b>
                                                                        </td>
                                                                        </axis:visible>
                                                                        <axis:visible f="axissin006" c="TNUM3IA">
                                                                        <td class="titulocaja" colspan="2">
                                                                            <b><axis:alt f="axissin006" c="TNUM3IA" lit="9902422"/></b>
                                                                        </td>
                                                                        </axis:visible>
                                                                        
                                                                    </tr>
                                                                    <tr>
                                                                    
                                                                        <axis:visible f="axissin006" c="CDET3IA">
                                                                        <td class="campocaja">
                                                                            <select name="CDET3IA" disabled  id="CDET3IA" size="1" class="campowidthselect campo campotexto" style="width:70%;">&nbsp;
                                                                                <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axissin006" c="BLANCO" lit="1000348"/> - </option>
                                                                                <c:forEach var="element" items="${__formdata.listvalores.lstCDET}">
                                                                                    <option value = "${element.CATRIBU}" 
                                                                                    <c:if test="${element.CATRIBU == __formdata.OB_IAX_SINIESTRO.LOCALIZA.CDET3IA}"> selected </c:if> />
                                                                                        ${element.TATRIBU} 
                                                                                    </option>
                                                                                </c:forEach>
                                                                            </select>
                                                                        </td>
                                                                        </axis:visible>
                                                                        <axis:visible f="axissin006" c="TNUM3IA">
                                                                        <td class="campocaja" colspan="2">
                                                                            <input type="text" disabled class="campowidthinput campo campotexto" size="5" value="${__formdata.OB_IAX_SINIESTRO.LOCALIZA.TNUM3IA}" name="TNUM3IA" id="TNUM3IA" 
                                                                               style="width:90%;" maxlength="100"/>
                                                                        </td>
                                                                        </axis:visible>
                                                                        
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                    </axis:visible>
                                                    <axis:visible f="axissin006" c="DSP_DIRECCIONCHI" >
                                                    <tr>
                                                        <td>
                                                            &nbsp;
                                                        </td>
                                                        <axis:ocultar c="CSIGLAS" f="axissin006" dejarHueco="false">
                                                        <td class="titulocaja">
                                                            <b><axis:alt f="axissin006" c="CSIGLAS" lit="110028"/></b>
                                                        </td>
                                                        </axis:ocultar>
                                                        <td class="titulocaja">
                                                            <b><axis:alt f="axissin006" c="TNOMVIA" lit="110029"/></b>
                                                        </td>
                                                        <td class="titulocaja">
                                                            <b><axis:alt f="axissin006" c="NNUMVIA" lit="9904598"/></b>
                                                        </td>                     
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            &nbsp;
                                                        </td>
                                                        <axis:ocultar c="CSIGLAS" f="axissin006" dejarHueco="false">
                                                        <td class="campocaja">
                                                            <select name="CSIGLAS" id="CSIGLAS" disabled size="1" class="campowidthselect campo campotexto" style="width:80%;">&nbsp;
                                                                <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axissin006" c="SNV_COMBO" lit="1000348"/> - </option>
                                                                <c:forEach var="element" items="${__formdata.listValores.lstTipoVia}">
                                                                    <option value = "${element.CSIGLAS}" 
                                                                    <c:if test="${element.CSIGLAS == __formdata.OB_IAX_SINIESTRO.LOCALIZA.CSIGLAS}"> selected </c:if> />
                                                                        ${element.TDENOM} 
                                                                    </option>
                                                                </c:forEach>
                                                            </select>
                                                        </td>
                                                        </axis:ocultar>
                                                        <td class="campocaja">
                                                            <input type="text" disabled class="campowidthinput campo campotexto" size="15" value="${__formdata.OB_IAX_SINIESTRO.LOCALIZA.TNOMVIA}" name="TNOMVIA" id="TNOMVIA" 
                                                            style="width:95%;"/>
                                                        </td>
                                                        <td class="campocaja" colspan="3" >
                                                            <input type="text" disabled class="campowidthinput campo campotexto" size="100" value="${__formdata.OB_IAX_SINIESTRO.LOCALIZA.TNUM1IA}" name="TNUM1IA" id="TNUM1IA" 
                                                               style="width:15%;"  maxlength="100"/>
                                                            &nbsp;&nbsp;&nbsp;
                                                            <input type="text" disabled class="campowidthinput campo campotexto" size="15" value="${__formdata.OB_IAX_SINIESTRO.LOCALIZA.NNUMVIA}" name="NNUMVIA" id="NNUMVIA" 
                                                            style="width:15%;"/>
                                                            &nbsp;&nbsp;&nbsp;
                                                            <input type="text" disabled class="campowidthinput campo campotexto" size="15" value="${__formdata.OB_IAX_SINIESTRO.LOCALIZA.TCOMPLE}" name="TCOMPLE" id="TCOMPLE" 
                                                            style="width:15%;"/>
                                                        </td>                                
                                                        </tr>
                                                        <tr>
                                                            <td></td>
                                                            <td class="titulocaja" colspan="2">
                                                                <b><axis:alt f="axissin006" c="TNUM2IA" lit="9904595"/></b>
                                                            </td>
                                                            <td class="titulocaja" colspan="2">
                                                                <b><axis:alt f="axissin006" c="TNUM3IA" lit="9904596"/></b>
                                                            </td> 
                                                        </tr>
                                                        <tr>
                                                            <td></td>
                                                            <td class="campocaja" colspan="2">
                                                                <input type="text" disabled class="campowidthinput campo campotexto" size="100" value="${__formdata.OB_IAX_SINIESTRO.LOCALIZA.TNUM2IA}" name="TNUM2IA" id="TNUM2IA" 
                                                                    style="width:90%;"  title="<axis:alt f="axissin006" c="TNUM2IA" lit="9904595"/>" maxlength="100"/>
                                                            </td>
                                                            <td class="campocaja" colspan="2">
                                                                <input type="text" disabled class="campowidthinput campo campotexto" size="100" value="${__formdata.OB_IAX_SINIESTRO.LOCALIZA.TNUM3IA}" name="TNUM3IA" id="TNUM3IA" 
                                                                    style="width:90%;"  title="<axis:alt f="axissin006" c="TNUM3IA" lit="9904596"/>" maxlength="100"/>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td></td>
                                                            <td class="titulocaja" colspan="2">
                                                                <b><axis:alt f="axisper012" c="LOCALIDAD" lit="9903353"/></b>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td></td>
                                                            <td class="campocaja" colspan="2">
                                                                <input type="text" disabled class="campowidthinput campo campotexto" size="100" value="${__formdata.OB_IAX_SINIESTRO.LOCALIZA.LOCALIDAD}" name="LOCALIDAD" id="LOCALIDAD" 
                                                                    style="width:90%;"  title="<axis:alt f="axissin006" c="LOCALIDAD" lit="9903353"/>" />
                                                            </td>
                                                        </tr>
                                                        </axis:visible>
                                                        <tr>
                                                            <td>
                                                                &nbsp;
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <axis:ocultar c="CPOSTAL" f="axissin006" dejarHueco="false">
                                                            <!-- C.P -->
                                                            <td class="titulocaja">
                                                                <b><axis:alt f="axissin006" c="CPOSTAL" lit="101081" /></b>
                                                            </td>
                                                            </axis:ocultar>
                                                            <!-- Pais -->
                                                            <td class="titulocaja" colspan="2">
                                                                <b><axis:alt f="axissin006" c="CPAIS" lit="100816" /></b>
                                                            </td>
                                                            <!-- Provincia -->
                                                            <td class="titulocaja">
                                                                <b><axis:alt f="axissin006" c="CPROVIN" lit="100756" /></b>
                                                            </td>
                                                            <!--  Población -->
                                                            <td class="titulocaja">
                                                                <b><axis:alt f="axissin006" c="CPOBLAC" lit="100817" /></b>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <axis:ocultar c="CPOSTAL" f="axissin006" dejarHueco="false">
                                                             <!-- C.P -->
                                                           <td class="campocaja">
                                                                <input type="text" disabled class="campowidthinput campo campotexto" size="15" value="${__formdata.OB_IAX_SINIESTRO.LOCALIZA.CPOSTAL}" name="CPOSTAL" id="CPOSTAL" 
                                                                style="text-transform:uppercase;width:60%;" onblur="f_onblur_CPOSTAL(this.value)" style="width:50%;"
                                                                 <axis:atr f="axissin006" c="CPOSTAL" a="obligatorio=false"/> title="<axis:alt f="axissin006" c="CPOSTAL" lit="101081"/>"/>
                                                            </td>   
                                                            </axis:ocultar>
                                                            <td class="campocaja" colspan="2">
                                                                <input type="text" disabled class="campowidthinput campo campotexto" size="3" maxlength="3" value="${__formdata.OB_IAX_SINIESTRO.LOCALIZA.CPAIS}" name="CPAIS" id="CPAIS" onchange="f_onchange_CPAIS()" style="width:15%;" 
                                                                <axis:atr f="axissin006" c="CPAIS" a="obligatorio=false"/> title="<axis:alt f="axissin006" c="CPAIS" lit="100816"/>"/>&nbsp;<img id="findPais" border="0" src="images/find.gif" onclick="f_abrir_axiscom001('152430', 'LISTA_PAIS', null)" style="cursor:pointer"/>
                                                                &nbsp;<span id="TPAIS_span"><b>${__formdata.OB_IAX_SINIESTRO.LOCALIZA.TPAIS}</b></span>
                                                            </td>
                                                            <td class="campocaja">
                                                                <input type="text" disabled class="campowidthinput campo campotexto" size="15" maxlength="3" value="${__formdata.OB_IAX_SINIESTRO.LOCALIZA.CPROVIN}" name="CPROVIN" id="CPROVIN" onchange="f_onchange_CPROVIN()" style="width:18%;" 
                                                                <axis:atr f="axissin006" c="CPROVIN" a="obligatorio=false"/> title="<axis:alt f="axissin006" c="CPROVIN" lit="100756"/>"/>
                                                                &nbsp;<img id="findProvincia" style="visibility:${empty __formdata.CPAIS ? 'hidden' : 'visible'};cursor:pointer" border="0" src="images/find.gif" onclick="f_abrir_axiscom001('152431', 'LISTA_PROVINCIA', document.miForm.CPAIS.value)"/>                
                                                                &nbsp;<span id="TPROVIN_span"><b>${__formdata.OB_IAX_SINIESTRO.LOCALIZA.TPROVIN}</b></span>
                                                            </td>
                                                            
                                                            <td class="campocaja">
                                                                <input type="text" disabled  class="campowidthinput campo campotexto" size="15" maxlength="5" value="${__formdata.OB_IAX_SINIESTRO.LOCALIZA.CPOBLAC}" name="CPOBLAC" id="CPOBLAC" onchange="f_onchange_CPOBLAC()" style="width:18%;" 
                                                                <axis:atr f="axissin006" c="CPOBLAC" a="obligatorio=false"/> title="<axis:alt f="axissin006" c="CPOBLAC" lit="100817"/>"/>
                                                                &nbsp;<img id="findPoblacion" style="visibility:${empty __formdata.CPROVIN ? 'hidden' : 'visible'};cursor:pointer" border="0" src="images/find.gif" onclick="f_abrir_axiscom001('152432', 'LISTA_POBLACION', document.miForm.CPROVIN.value,document.miForm.CPOSTAL.value)"/>                
                                                                &nbsp;<span id="TPOBLAC_span"><b>${__formdata.OB_IAX_SINIESTRO.LOCALIZA.TPOBLAC}</b></span>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </div>
                                            </td>
                                        </tr>
                                    </table>
                                 </td>
                            </tr>
                        </table>                    
                    </td>
                </tr>
                </axis:visible>
            </c:if>
        </c:if>
        </axis:visible>
                            <tr>
                                <td class="titulocaja">
                                   <axis:visible f="axissin006" c="IPERIT_DATOS_SIN">
                                    <b><axis:alt f="axissin006" c="IPERIT_DATOS_SIN" lit="9000904" /></b>
                                   </axis:visible>
                                </td>
                            </tr>
                            <tr>
                                 <td class="campocaja"> 
                                 <axis:visible f="axissin006" c="IPERIT_DATOS_SIN">
                                     <input  type="text" class="campodisabled campo campotexto" style="width:90%;" id="IPERIT_DATOS_SIN" name="IPERIT_DATOS_SIN"
                                      <axis:atr f="axissin006" c="IPERIT_DATOS_SIN" a="modificable=false"/> size="15"  value="<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${__formdata.OB_IAX_SINIESTRO.IPERIT}"/>"/>
                                  </axis:visible>
                                 </td>
                            </tr>
							
							<tr>
                                <td colspan="4" > <!--colspan="5" -->
                                <!-- Lista de Riesgos -->
                                <c:set var="title0"><axis:alt c="NRIESGO" f="axissin006" lit="100649" /></c:set><!--Num Riesgo-->
                                <c:set var="title1"><axis:alt c="TRIESGO" f="axissin006" lit="103417" /></c:set><!--Descricipción RIESGO -->
                                    <table>
                                    <tr>
                                    <td colspan="4"  class="campocaja"> <!--colspan="5" -->
                                    <!-- DisplayTag preguntas -->
                                    <!-- c : if test="${!empty sessionScope.axisctr_preguntasPoliza}"-->
                                    <axis:ocultar f="axissin006" c="DSP_RIESGO">
                                        <c:set var="title0">&nbsp;</c:set>
                                        <c:set var="title1"><axis:alt c="RIESGOS" f="axissin017" lit="102500"/></c:set>
                                        <div class="displayspace">                         
                                            <display:table name="${__formdata.T_IAX_RIESGOS}" id="miListaId2" export="false" class="dsptgtable" pagesize="-1" sort="list" cellpadding="0" cellspacing="0"
                                             requestURI="axissin006.do?paginar=true">
                                                <%@ include file="../include/displaytag.jsp"%>
                                                    <display:column title="${title0}" sortable="false" sortProperty="selectedRiesgo" headerClass="headwidth5 sortable"  media="html" autolink="false" >
                                                        <c:if test="${__formdata.OB_IAX_SINIESTRO.NRIESGO== miListaId2.OB_IAX_RIESGOS.NRIESGO}">
                                                            <div class="dspIcons"><input checked disabled value="${miListaId2.OB_IAX_RIESGOS.NRIESGO}" type="radio" id="selectedRiesgo" name="selectedRiesgo"/></div>
                                                        </c:if>
                                                    </display:column>
                                                    <display:column title="${title1}" sortable="true" sortProperty="OB_IAX_RIESGOS.TRIESGO" headerClass="sortable"  media="html" autolink="false" >
                                                        <c:if test="${__formdata.OB_IAX_SINIESTRO.NRIESGO== miListaId2.OB_IAX_RIESGOS.NRIESGO}">
                                                            <div class="dspText">${miListaId2.OB_IAX_RIESGOS.TRIESGO}</div>
                                                        </c:if>
                                                    </display:column>
                                            </display:table>
                                 
                                        </div>
                                    <!--/c : if-->
                                    </axis:ocultar> 
                                </td>
                                    </tr>
                                    </table>
                                </td>
                            </tr>
							
							<tr>
                             <!-- Descripción del Riesgo -->
 
                                <td class="titulocaja">
                                <axis:ocultar c="TDESCRIE" f="axissin006" dejarHueco="false">
                                    <b><axis:alt c="TDESCRIE" f="axissin006" lit="102524" /></b>
                                </axis:ocultar>
                                </td>
                            </tr>
                            <tr>
                            <!-- Descripción del Riesgo -->
							<axis:ocultar c="TDESCRIE" f="axissin006" dejarHueco="false">
                                 <td colspan="5" style="width:100%;"  class="campocaja"> <!-- colspan="5" -->
                                 
                                     <textarea readonly="true" class="campowidthinput campo campotexto" style="width:100%;" <axis:atr f="axissin006" c="TDESCRIE" a="isInputText=false&modificable=true"/> onkeydown=" if(this.value.length>= 2000 && event.keyCode != 8 && event.keyCode != 46){return false;}" name="TDESCRIE" id="TDESCRIE">${miListaId2.OB_IAX_RIESGOS.TDESCRI1}</textarea>
                           
                                 </td>
							</axis:ocultar>
                              </tr>
						   
                            <tr>
                             <!-- Descripción del siniestro -->
 
                                <td class="titulocaja">
                                   
                                   <!--div class="separador">&nbsp;</div-->
                                   <!--div class="separador">&nbsp;</div-->
                                   <axis:visible f="axissin006" c="TSINIES_DATOS_SIN">
                                    <b><axis:alt f="axissin006" c="TSINIES_DATOS_SIN" lit="1000112" /></b>
                                   </axis:visible>
                                </td>
                            </tr>
                            <tr>
                            <!-- Descripción del siniestro -->
                                 <td colspan="5" style="width:100%;"  class="campocaja"> 
                                 <axis:visible f="axissin006" c="TSINIES_DATOS_SIN">
                                     <textarea readonly="true" class="campodisabled campo campotexto" style="width:100%;" name="TSINIES" id="TSINIES"> ${__formdata.OB_IAX_SINIESTRO.TSINIES}</textarea>
                                 </axis:visible>
                                 </td>
                              </tr>
                           <tr>
                            <!-- Detalle Pretensión -->
                                <tr>
		                        <td class="titulocaja">
		                            <b><axis:alt c="TDETPRETEN" f="axissin006" lit="89908028" /></b><!-- Detalle Pretensión -->
		                        </td>
		                    </tr>
                             <tr>
		                    
<td colspan="6" style="width:100%;" class="campocaja">
		                            <axis:ocultar c="TDETPRETEN" f="axissin006" dejarHueco="false">
		                            <textarea readonly="true"  maxlength="3990"  class="campowidthinput campo campotexto" style="width:100%;" name="TDETPRETEN" id="TDETPRETEN">${__formdata.OB_IAX_SINIESTRO.TDETPRETEN}</textarea>
		                            </axis:ocultar>
		                        </td>
		                        </tr> 
                            <axis:visible f="axissin006" c="FECHAPP">
                                  <td class="titulocaja">
                                  <b><axis:alt c="FECHAPP" f="axissin006" lit="9901534" /></b>
                                  </td>
                            </axis:visible>
                               </tr>
                              <tr>
                                <axis:visible f="axissin006" c="FECHAPP">
                                <td class="campocaja">  
                                     <input style="width:40%;" type="text" class="campodisabled campo campotexto" id="FECHAPP" name="FECHAPP" size="15"  title="<axis:alt c="FFIN" f="axissin006" lit='9001159' />" 
                                                        value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.OB_IAX_SINIESTRO.FECHAPP}"/>" <axis:atr f="axissin006" c="FECHAPP" a="modificable=false&formato=fecha"/> 
                                                        onchange="f_calcula_dias()"/>
                                                        <a style="vertical-align:middle;"><img id="icon_FECHAPP" alt="<axis:alt c="SELECCIONA" f="axissin006" lit="108341"/>" title="<axis:alt c="FFIN" f="axissin006" lit="9001159" />" src="images/calendar.gif"/></a>
                                </td>
                                </axis:visible> 
                                </tr> 
                             <!-- bug 0023643 -->
                            <tr>
                                <td class="titulocaja">
                                   <axis:visible f="axissin006" c="IRESERVA_GLOBAL">
                                    <b><axis:alt f="axissin006" c="IRESERVA_GLOBAL" lit="9904392" /></b>
                                   </axis:visible>
                                </td>
                            </tr>
                            <!-- bug 0023643 -->
                            <tr>
                                <axis:visible f="axissin006" c="IRESERVA_GLOBAL">
                                  <td class="campocaja">
                                      <input  type="text" class="campodisabled campo campotexto" style="width:70%;" id="IRESERVA_GLOBAL" name="IRESERVA_GLOBAL"
                                      <axis:atr f="axissin006" c="IRESERVA_GLOBAL" a="modificable=false"/> size="15"  value="${__formdata.OB_IAX_SINIESTRO.IRESERVA9999}"/>
                                  </td>
                                </axis:visible>                              
                            </tr>
                              
                              
                              
                              
                              <!-- PRESTACIONES -->
                              
                              
                              
                              
                              <axis:visible f="axissin006" c="SINIES_PRESTACIONES">
                                <tr>
                                  <axis:visible f="axissin006" c="CNIVEL">
                                  <td class="titulocaja">
                                        <b><axis:alt f="axissin006" c="CNIVEL" lit="9901374" /></b>
                                  </td>
                                  </axis:visible>
                                   <axis:visible f="axissin006" c="SPERSON2">
                                  <td class="titulocaja" colspan="2">
                                        <b><axis:alt f="axissin006" c="SPERSON2" lit="9901375" /></b>
                                  </td>
                                  </axis:visible>
                                <tr>
                                </tr>
                                <axis:visible f="axissin006" c="CNIVEL">
                                  <td  class="campocaja">
                                       <input type="text" readonly name="TNIVEL" id="TNIVEL" value="${__formdata.OB_IAX_SINIESTRO.TNIVEL}" class="campowidthinput campo campotexto" style="width:70%"
                                        <axis:atr f="axissin006" c="TNIVEL" a="modificable=true"/> onchange="f_actualizar_personarel()" />
                                        
                                  </td>
                                </axis:visible>
                                <axis:visible f="axissin006" c="SPERSON2">
                                  <td  class="campocaja" colspan="2">
                                        
                                        <input type="text" readonly name="TPERSON2" id="TPERSON2" value="${__formdata.OB_IAX_SINIESTRO.TPERSON2}" class="campowidthinput campo campotexto" style="width:70%"
                                        <axis:atr f="axissin006" c="TPERSON2" a="modificable=true"/> onchange="f_actualizar_personarel()" />
                                        
                                  </td>
   
                                </axis:visible>
                                </tr>  
                            </axis:visible>
                              
                              
                              
                              
                            </table>
</form>
