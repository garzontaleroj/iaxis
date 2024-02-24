<%/* Revision:# PuGJU0W7sO4UVuKoUXYs5A== # */%>
﻿<%--/**
*  Fichero: axisctr104.jsp*  
*  
*  
*  Fecha: 27/08/2010
*/
--%>
<%@ page contentType="text/html;charset=windows-1252"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
    <head>
        <title><axis:alt f="axisctr104" c="LIT_PANTALLA" lit="101908"/></title>
        <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
        <link rel="stylesheet" href="styles/displaytag.css">
        <c:import url="../include/carga_framework_js.jsp" />
        
         <c:import url="../../../scripts/axis/axisctrConsultaPol.jsp">        
            <c:param name="f">axisctr104</c:param>
        </c:import>
  
        <script type="text/javascript">
           
            /****************************************************************************************/
            /*********************************** NAVEGACION *****************************************/
            /****************************************************************************************/
            
            
            function f_onload_axisctr104(){
                f_onload();
                //f_cargar_propiedades_pantalla();
            }

            function f_but_9901376(){
                objUtiles.ejecutarFormulario ("axis_axisctr104.do", "aceptar", document.miForm, "_self", objJsMessages.jslit_cargando);     
            }
         
            function f_but_salir() {              
                objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axisctr104", "cancelar", document.miForm, "_self");
            }

            /****************************************************************************************/
            /************************************* MODAL ********************************************/
            /****************************************************************************************/
            
            /* IMPRESION */
            function f_but_100001() {
                objUtiles.abrirModal("axisimprimir", "src", "modal_axisimprimir.do?dt=<%=new java.util.Date().getTime()%>&operation=form&SEGURO="+document.miForm.SSEGURO.value);
            }
  
            function f_cerrar_axisimprimir() {
             objUtiles.cerrarModal("axisimprimir");
               <% if (Boolean.valueOf(true).equals(session.getAttribute("axisctr104_suplementosPendientes"))) { %>
               <%--     <c:if test="${empty mvtretencion_sup}" >--%>
                        objUtiles.ejecutarFormulario ("axis_axisctr104.do?", "limpiar_suplemento", document.miForm, "_self", objJsMessages.jslit_cargando);    
                    <%--</c:if>--%>
                <% } else { %>
                        objUtiles.ejecutarFormulario ("axis_axisctr104.do?", "form", document.miForm, "_self", objJsMessages.jslit_cargando);         
                <% } %>
            }
            
           
            // Modal Buscador
            function f_abrir_axisctr019 () {
            document.miForm.VALORRADIO.value = '';
                objUtiles.abrirModal("axisctr019", "src", "modal_axisctr019.do?operation=form&tipo=12");
            }
            
            function f_cerrar_axisctr019() {
                objUtiles.cerrarModal("axisctr019");
            }
            
            function f_aceptar_axisctr019 (SSEGURO) {
                f_cerrar_axisctr019();
                document.miForm.SSEGURO.value=SSEGURO;
                document.miForm.NMOVIMI.value= -9999;//Le ponemos un valor imposible para conseguir que, al cambiar de póliza, salga siempre cargado el primer movimiento del multiregistro
                objUtiles.ejecutarFormulario ("axis_axisctr104.do?limpiaChecks=1", "form", document.miForm, "_self", objJsMessages.jslit_cargando);     
            }
            
            /****************************************************************************************/
            /******************************* CALLBACKS AJAX *****************************************/
            /****************************************************************************************/
            
            
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
      
        //
        // Bug 11177.NMM.f.------
        //
        
        function f_marcar(SSEGURO,CCOMPANI,CMARCAR,SPRODUCESP){                      
                var marcado = ((CMARCAR.checked)?1:0);             
                objDom.setValorPorId(CMARCAR.id, CMARCAR.value);                              
                var nuevoIdsDeLosMarcados = CCOMPANI;
                
                //objAjax.invokeAsyncCGI("axis_axisctr104.do?VALORRADIO="+objDom.getValorPorId("VALORRADIO")+"&MARCADOS="+nuevoIdsDeLosMarcados+"&SSEGURO="+SSEGURO+"&CCOMPANI="+CCOMPANI+"&CMARCAR="+marcado+"&SPRODUCESP="+SPRODUCESP, callbackAjaxMarcar, "operation=ajax_marcar", this, objJsMessages.jslit_cargando);
                
                document.miForm.MARCADOS.value=nuevoIdsDeLosMarcados;
                objUtiles.ejecutarFormulario("axis_axisctr104.do?CMARCAR="+marcado+"&CCOMPANI="+CCOMPANI+"&SPRODUCESP="+SPRODUCESP, "marcar", document.miForm, "_self", objJsMessages.jslit_cargando);  
        }
        
        function callbackAjaxMarcar(ajaxResponseText){             
           var doc = objAjax.domParse(ajaxResponseText);
                // Comprobar errores
                if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
                  null;
                  // objUtiles.ejecutarFormulario ("axis_axisctr104.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);  
                }
        }

         function f_but_contratar(CCOMPANI, SPRODUC){
                if (objValidador.validaEntrada()) {
                    objUtiles.ejecutarFormulario ("axis_axisctr104.do?CCOMPANI="+CCOMPANI+"&SPRODUCESP="+SPRODUC, "contratar", document.miForm, "_self", objJsMessages.jslit_cargando);     
                }
            }            
    </script>
    </head>
    <body onload="f_onload_axisctr104()">
          
        
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
        <form name="miForm" action="axis_axisctr104.do" method="POST">
            <input type="hidden" id="operation" name="operation" value=""/>
            <input type="hidden" id="NRIESGO" name="NRIESGO" value="${__formdata.NRIESGO}"/>
            <input type="hidden" id="NRECIBO" name="NRECIBO" value=""/>
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
            <input type="hidden" id="MARCADOS" name="MARCADOS" value="" />
            <input type="hidden" id="VALORRADIO" name="VALORRADIO" value="${__formdata['VALORRADIO']}" />
     <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt f="axisctr020" c="MOD_PANT_AXICTR163" lit="180183"/></c:param>
                <c:param name="nid" value="axisctr163" />
            </c:import>    
           
    <c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">axisagd004|<axis:alt f="axisctr104" c="MOD_PANT_AXISAGD004" lit="9001769"/></c:param>
            </c:import>
         
             <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt f="axisctr020" c="MOD_PANT_AXISAGD002" lit="180183"/></c:param>
                <c:param name="nid" value="axisagd002" />
            </c:import>
              
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="nid_y_titulo">axisfileupload|<axis:alt f="axisctr020" c="TITULOFILEUPLOAD" lit="1000614"/></c:param>
            </c:import>
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt f="axisctr020" c="PSU003" lit="9002255" /></c:param>
                <c:param name="nid" value="axispsu003" />
            </c:import>
            
             <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt f="axisctr004" c="LIT_1000184" lit="1000184" /></c:param>
                <c:param name="nid" value="axisctr010" />
            </c:import>
            
    <c:import url="../include/modal_estandar.jsp">
                <c:param name="nid_y_titulo">axisctr019|<axis:alt f="axisctr104" c="LIT_MODAL_019" lit="1000188" />#axisimprimir|<axis:alt f="axisctr104" c="LIT_IMPRIMIR" lit="1000205" />|true#axisgedox|<axis:alt f="${param.f}" c="LIT_GEDOX" lit="1000201"></axis:alt>#axisctr023|<axis:alt f="axisctr104" c="LIT_MODAL_023" lit="1000191" />#axisctr025|<axis:alt f="axisctr104" c="LIT_MODAL_025" lit="140360"/>#axisctr029|<axis:alt f="${param.f}" c="LIT_PANTALLA_DETASE" lit="1000195"/>#axisctr148|<axis:alt f="axisctr104" c="LIT_MODAL_148" lit="1000195"/>#axisctr030|<axis:alt f="axisctr104" c="LIT_MODAL_030" lit="1000196"/>#axisctr039|Suplementos#axisadm028|<axis:alt f="axisctr104" c="LIT_MODAL_028" lit="1000568"/></c:param>
            </c:import>
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="nid_y_titulo">axisctr042|<axis:alt f="axisctr104" c="LIT_MODAL_042" lit="9000420" />#axisctr043|<axis:alt f="axisctr104" c="LIT_MODAL_043" lit="9000471" /></c:param>
            </c:import>
            <c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">axisctr063|<axis:alt f="axisctr104" c="LIT_MODAL_063" lit="9001769" /></c:param>
            </c:import>
            <!-- S'ha d'afegir el nom de la pantalla que cridarem.Bug 11177.NMM.i.---------------------------------------------->
            <c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">axisctr057|<axis:alt f="axisctr104" c="LIT_MODAL_057" lit="9001769" /></c:param>
            </c:import>
            <c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">axissin006|<axis:alt f="axisctr104" c="LIT_MODAL_006" lit="111264" /></c:param>
            </c:import>
            
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt f="axisctr104" c="LIT_MODAL_086" lit="9001953" /></c:param>
                <c:param name="nid" value="axisctr086" />
            </c:import>
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt f="axisctr104" c="LIT_MODAL_087" lit="9001955" /></c:param>
                <c:param name="nid" value="axisctr087" />
            </c:import>
    
     <!-- Bug 11177.NMM.f.---------------------------------------------->
            <c:import url="../include/titulo_nt.jsp">
                    <c:param name="modalidad"><axis:alt c="LIT_FORM" f="axisctr104" lit="9901607"/></c:param>
                    <c:param name="titulo"></c:param>
                    <c:param name="formulario"><axis:alt c="LIT_FORM" f="axisctr104" lit="9901607"/></c:param>
                    <c:param name="form">axisctr104</c:param>
            </c:import>
    
    
           
            <!-- Area de campos  -->            
          <table class="mainTableDimensions area" align="center" cellpadding="0" cellspacing="0" border="0"> 
             <tr>
                   <td >
                                      
                     <!-- Secci򬞱 -->
                        <table class="seccion">
                            <tr>
                                <td >
                                  <table class="area">
                                    <tr>
                                        <td >
                                        <c:import url="axisctr020_a.jsp">
                                        <c:param name="f">axisctr104</c:param>
                                        </c:import >
                                        <!-- De riesgos hasta el final -->
                                        <c:import url="axisctr020_b.jsp">
                                        <c:param name="f">axisctr104</c:param>
                                        </c:import >
                                        <c:import url="axisctr020_b1.jsp">
                                        <c:param name="f">axisctr104</c:param>
                                        </c:import >
                                        <c:import url="axisctr020_e.jsp">
                                        <c:param name="f">axisctr104</c:param>
                                        </c:import>
                                        <c:import url="axisctr020_e.jsp"/> 
                                        <c:import url="axisctr020_c.jsp">
                                         <c:param name="f">axisctr104</c:param>
                                          </c:import>
                                        <c:import url="axisctr020_d.jsp">
                                         <c:param name="f">axisctr104</c:param>
                                          </c:import>
                                                                 
                                        </td>
                                    </tr> 
                                    </table>
                                    </td>
                                    </tr>
                                    </table>
                                    
                                   
                                    <div class="separador">&nbsp;</div>
                                    <div class="separador">&nbsp;</div>
                               <axis:visible c="SEC_COMPANIAS" f="axisctr104">
                                        <div class="titulo">
                                            <img src="images/flecha.gif"/><axis:alt f="axisctr104" c="TIT_PRODESP" lit="9901607"></axis:alt>
                                        </div>                    
                                     <table class="seccion">
                            <tr>
                               <td align="left">
                                  <table class="area" align="center">
                                    <tr>
                                        <td > 
             
                                        <div class="separador">&nbsp;</div>
                                       
                                           
                                                      <div class="separador">&nbsp;</div>     
                                                                <c:set var="title0"><axis:alt f="axisctr104" c="TCOMPANI" lit="9000600"/></c:set>
                                                                <c:set var="title1"><axis:alt f="axisctr104" c="CAGENCORR" lit="100584"/></c:set>
                                                                <c:set var="title2"><axis:alt f="axisctr104" c="TPRODUCESP" lit="9901239"/></c:set>
                                                                <div class="displayspace">
                                                                    <display:table name="${__formdata.COMPANIAS}"
                                                                                   id="COMPANIAS"
                                                                                   export="false"
                                                                                   class="dsptgtable"                                                       
                                                                                   pagesize="-1"
                                                                                   defaultsort="2"
                                                                                   defaultorder="ascending"
                                                                                   requestURI="axis_axisctr104.do?paginar=true&limpiaChecks=0"
                                                                                   sort="list"
                                                                                   cellpadding="0"
                                                                                   cellspacing="0">
                                                                        <%@ include file="../include/displaytag.jsp"%>
                                                                       
                                                                        <axis:visible c="CMARCAR" f="axisctr104">
                                                                            <display:column title="" sortable="false"  style="width:10%;" headerClass="headwidth5 sortable fixed"  media="html" autolink="false" >    
                                                                                
                                                                                <c:if test="${!empty COMPANIAS.OB_IAX_COMPANIPROD.TPRODUCESP}">
                                                                                <div class="dspIcons"><input <c:if test="${COMPANIAS.OB_IAX_COMPANIPROD.CMARCAR==1}">checked</c:if> type="checkbox" id="cmarcaCompania" name="cmarcaCompania" value="${COMPANIAS.OB_IAX_COMPANIPROD.CMARCAR}" onclick="f_marcar('${__formdata.SSEGURO}','${COMPANIAS.OB_IAX_COMPANIPROD.CCOMPANI}',this,'${COMPANIAS.OB_IAX_COMPANIPROD.SPRODUCESP}')"    <c:if test="${COMPANIAS.MARCADO == 1}"> checked="checked"</c:if>/></div>
                                                                                </c:if>
                                                                            </display:column>
                                                                        </axis:visible>
                                                                       
                                                                   <%--     <axis:ocultar c="CAGENCORR" f="axisctr104" dejarHueco="false">
                                                                        <display:column title="${title1}"
                                                                                        sortable="true"
                                                                                        sortProperty="OB_IAX_COMPANIPROD.CAGENCORR"
                                                                                        headerClass="sortable"
                                                                                        media="html"
                                                                                        autolink="false">
                                                                            <div class="dspText">${COMPANIAS.OB_IAX_COMPANIPROD.CAGENCORR}</div>
                                                                        </display:column>
                                                                        </axis:ocultar>--%>
                                                                          <axis:visible c="TCOMPANI" f="axisctr104">
                                                                        <display:column title="${title0}"
                                                                                        sortable="false"
                                                                                        sortProperty="OB_IAX_COMPANIPROD.TCOMPANI"
                                                                                        headerClass="sortable fixed"
                                                                                        media="html" style="width:30%;" 
                                                                                        autolink="false">
                                                                            <div class="dspText">${COMPANIAS.OB_IAX_COMPANIPROD.TCOMPANI}</div>
                                                                        </display:column>
                                                                        </axis:visible>
                                                                        <axis:visible c="TPRODUCESP" f="axisctr104">
                                                                        <display:column title="${title2}"
                                                                                        sortable="false"
                                                                                        sortProperty="OB_IAX_COMPANIPROD.TPRODUCESP"
                                                                                        headerClass="sortable fixed"
                                                                                        media="html"
                                                                                        style="width:45%;"
                                                                                        autolink="false">
                                                                            <div class="dspText">${COMPANIAS.OB_IAX_COMPANIPROD.TPRODUCESP}</div>
                                                                        </display:column>
                                                                        </axis:visible>     
                                                                          <axis:visible c="BT_CONTRATAR" f="axisctr104">
                                                                            <display:column title="" sortable="false" headerClass="headwidth5 sortable fixed"  style="width:15%;" media="html" autolink="false" >    
                                                                                <c:if test="${!empty COMPANIAS.OB_IAX_COMPANIPROD.TPRODUCESP}">
                                                                                <c:if test="${COMPANIAS.OB_IAX_COMPANIPROD.CMARCAR==1}">
										<div class="dspIcons">
                                                                                <b>
                                                                                	
                                                                                <a xhref="javascript:void(0)" 
                                                                                 alt="<axis:alt f='axisctr104' c='LNK_CONTRATAR_TITTLE' lit='9901451'/> - ${COMPANIAS.OB_IAX_COMPANIPROD.TPRODUCESP}" 
                                                                                 title="<axis:alt f='axisctr104' c='LNK_CONTRATAR_TITTLE' lit='9901451'/> - ${COMPANIAS.OB_IAX_COMPANIPROD.TPRODUCESP}" 
                                                                                 href="javascript:f_but_contratar('${COMPANIAS.OB_IAX_COMPANIPROD.CCOMPANI}','${COMPANIAS.OB_IAX_COMPANIPROD.SPRODUCESP}')">  <%-- +"&mimetype=csv" --%>
                                                                                    <axis:alt f="axisctr104" c="LNK_CONTRATAR" lit="1000429"/>
                                                                                 </a>
                                                                                 </b>
                                                                                        
                                                                                </c:if>
                                                                                <%--    <input type="button"  class="boton" id="but_contratar" value="<axis:alt f="axisctr104" c="BUT_CONTRATAR" lit="1000429"/>" onclick="f_but_contratar('${COMPANIAS.OB_IAX_COMPANIPROD.CCOMPANI}','${COMPANIAS.OB_IAX_COMPANIPROD.SPRODUCESP}')" />--%>
                                                                                    </div>
                                                                                </c:if>
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
                              </axis:visible>  
                             </td>   
                         </tr> 
                      </table> 
                       </td>   
                         </tr> 
                      </table> 
        </form>
        <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisctr104</c:param>
                <c:param name="f">axisctr104</c:param>
                <c:param name="__botones">salir,<%--axis:visible c="BT_PRESUPUESTO" f="axisctr104">9901376</axis:visible--%></c:param></c:import>
        <c:import url="../include/mensajes.jsp"/>
    </body>
</html>