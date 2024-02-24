<%/*
*  Fichero: axisctr214.jsp
*  @author <a href = "mailto:rkirchner@csi-ti.com">Roger Kirchner</a> 
*
*  Fecha: 14/10/2008
*/
%>

<%@ page contentType="text/html;charset=iso-8859-15" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page import="java.util.HashMap" %>
<%@ page import="axis.util.Constantes" %>
<%@ page import="java.util.ArrayList" %>
<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
    <title><axis:alt f="axisctr214" c="EDITDATA" lit="9000494"/></title> <%-- EDICIÓN DATOS DE CIERRES --%>
    <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
    <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
     <%-- Especial per controlar els scroll amb iPad --%>
        <link type="text/css" href="styles/jquery.jscrollpane.css" rel="stylesheet" media="only screen and (min-device-width: 768px) and (max-device-width: 1024px)" />
        <style type="text/css" id="page-css"> </style>
    <%-- FI Especial per controlar els scroll amb iPad --%>
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
         		 <c:if test="${ (fn:containsIgnoreCase(header['User-Agent'],'ipad') )   }">
						retocarPAGE_CSS('axisctr214');
					</c:if>
            revisarEstilos();
            f_cargar_propiedades_pantalla(); 
            f_carga_dependencias();
          
         }       
     
        
        function f_but_cancelar() {
           parent.f_cerrar_modal('axisctr214');                      
        }
        
       
        
       /* function f_abrir_axisctr014() {
            objUtiles.abrirModal("axisctr014","src","modal_axisctr014.do?operation=form");
        }*/
        
        function f_abrir_axisctr014(tipage) {        
                document.miForm.CTIPAGE_BUSC.value = tipage;
                
                if (!objUtiles.estaVacio(tipage)){
                    document.miForm.DONDE.value = 2;
                     objUtiles.abrirModal("axisctr014","src","modal_axisctr014.do?operation=form&CONDICION=CTIPAGECON_"+tipage);
                }else{
                 document.miForm.DONDE.value = 1;
                 objUtiles.abrirModal("axisctr014","src","modal_axisctr014.do?operation=form");
                } 
            }
        
        function f_cerrar_axisctr014() {
            objUtiles.cerrarModal("axisctr014");
        }    
       function f_but_detailmov (NMOVIMI, CMOTMOV, NCERTIF) {
       
                objUtiles.abrirModal("axisctr025", "src", "modal_axisctr025.do?operation=form&SSEGURO=" + document.miForm.SSEGURO.value + "&NMOVIMI=" + NMOVIMI + 
                    "&CMOTMOV=" + CMOTMOV + "&NCERTIF=" + NCERTIF);
            }       
            
          
            
            function f_cerrar_axisctr025 () {
                objUtiles.cerrarModal("axisctr025");
            }
            
            // Modal Detalle Riesgo Asegurado ACTR029
            function f_abrir_axisctr029 (NRIESGO) {
                objUtiles.abrirModal("axisctr029", "src", "modal_axisctr029.do?operation=form&NRIESGO=" + NRIESGO);
            }
            function f_cerrar_axisctr029() {
                objUtiles.cerrarModal("axisctr029");
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
        
         function f_cancelar_axisdir002(MODO){
            f_cerrar_modal('axisctr042');
        }
        
        function f_abrir_axisctrautos (NRIESGO,NMOVIMI) {
                objUtiles.abrirModal("axisctr148", "src", "axis_axisctr148.do?operation=form&NRIESGO=" + NRIESGO+"&NMOVIMI="+NMOVIMI);
        }     
        
          function f_cerrar_axisctr148()         {
            objUtiles.cerrarModal("axisctr148");
        } 
           
    </script>    
</head>

<body onunload="try { f_clear_resources(document.body) } catch (e) {}" onload="f_onload()" onkeypress="if (event.keyCode==13)  { f_but_buscar() }">
    <div id="wrapper" class="wrapper">
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
    
    <form name="miForm" action="" method="POST">         
    
        <c:import url="../include/titulo_nt.jsp">
                <c:param name="titulo"><axis:alt f="axisctr214" c="TIT_PANTALLA" lit="9905061"/></c:param>     <%-- Buscador de propuestas retenidas --%>
                <c:param name="formulario"><axis:alt f="axisctr214" c="TIT_PANTALLA" lit="9905061"/></c:param> <%-- Buscador de propuestas retenidas --%>
                <c:param name="form">axisctr214</c:param>
        </c:import>
        
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="titulo"><axis:alt f="axisctr214" c="LIT_AXISCTR025" lit="140360" /></c:param>
            <c:param name="nid" value="axisctr025" />
        </c:import>
        <c:import url="../include/modal_estandar.jsp">
                <c:param name="nid_y_titulo">axisctr042|<axis:alt f="axisctr214" c="MOD_PANT_AXISCTR042" lit="9000420"/>#axisctr043|<axis:alt f="axisctr214" c="MOD_PANT_AXISCTR043" lit="9000471"/></c:param>
            </c:import>
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="nid_y_titulo">axisctr019|<axis:alt f="axisctr214" c="MOD_PANT_AXICTR019" lit="1000188"/>#axisimprimir|<axis:alt f="axisctr214" c="MOD_PANT_IMPRIMIR" lit="1000205"/>|true#axisgedox|<axis:alt f="${pantalla}" c="LIT_GEDOX" lit="1000201"></axis:alt>#axisctr023|<axis:alt f="axisctr214" c="MOD_PANT_AXISCTR023" lit="1000191"/>#axisctr025|<axis:alt f="axisctr214" c="MOD_PANT_AXISCTR025" lit="140360"/>#axisctr029|<axis:alt f="${pantalla}" c="LIT_PANTALLA_DETASE" lit="1000195"/>#axisctr148|<axis:alt f="axisctr214" c="MOD_PANTALLA_AXISCTR148" lit="1000199"/>#axisctr030|<axis:alt f="axisctr214" c="MOD_PANTALLA_AXISCTR030" lit="1000196"/>#axisctr039|Suplementos#axisadm028|<axis:alt f="axisctr214" c="MOD_PANTALLA_AXISADM028" lit="1000568"/>#axisopenurl||<axis:alt f="axisctr214" c="MOD_PANTALLA_AXISOPENURL" lit="1000568"/></c:param>
            </c:import>
            
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt f="axisctr214" c="LIT_9000416" lit="9000416" /></c:param>
                <c:param name="nid" value="axisdir002" />
            </c:import>
            
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt f="axisctr214" c="LIT_9000416" lit="9000416" /></c:param>
                <c:param name="nid" value="axisdir002" />
            </c:import>
          
        <input type="hidden" name="operation" value=""/>
        <input type="hidden" id="SSEGURO" name="SSEGURO" value="${__formdata.SSEGURO}"/>
        <input type="hidden" id="NRIESGO" name="NRIESGO" value="${__formdata.NRIESGO}"/>
        <input type="hidden" id="COBJASE" name="COBJASE" value="${__formdata.COBJASE}"/>
        
        
                                           <div class="separador">&nbsp;</div>                                    <div class="separador">&nbsp;</div>
        
        <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td>               
                 <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axisctr001" c="LSTRIESGOS" lit="9000418" /></div>               
                                <table class="seccion" align="center">
                                   
                                    
                                    <tr>                                      
                                        <th style="width:25%;height:0%;"/>
                                        <th style="width:25%;height:0%;"/>
                                        <th style="width:25%;height:0%;"/>
                                        <th style="width:25%;height:0%;"/>
                                    </tr>
                                    <tr>
                                    
                                    <td colspan="4">
                    <c:set var="title0"><axis:alt f="axisctr214" c="NRIESGO" lit="800440"></axis:alt></c:set>  
		    <c:set var="title1"><b id="label_TRIESGO"><axis:alt f="axisctr214" c="TRIESGO" lit="100649"></b> </axis:alt></c:set>   
                    <c:set var="title2"><axis:alt f="axisctr214" c="TTIPMOV" lit="102421"></axis:alt></c:set>
                    <c:set var="title3"><axis:alt f="axisctr214" c="TMOTMOV" lit="102577" /></c:set>
		    <c:set var="title4"><axis:alt f="axisctr214" c="FEFECTO" lit="100883" /></c:set>
                        <c:set var="title5"><axis:alt f="axisctr214" c="FEMISIO" lit="1000562" /></c:set>
                        <c:set var="title6"><axis:alt f="axisctr214" c="DET_MOV" lit="9001868" /></c:set>
                        <c:set var="title7"><axis:alt f="axisctr214" c="DET_RIE" lit="102239" /></c:set>
                        
                        
                        
                                    <display:table name="${__formdata.lstriesgos}" 
                                    id="LSTRIESGOS" export="false" 
                                    class="dsptgtable" pagesize="-1" defaultsort="1" 
                                    defaultorder="ascending" sort="list" 
                                    cellpadding="0" cellspacing="0"
                                    requestURI="axis_axisctr214.do?paginar=true"> 
                                     <%@ include file="../include/displaytag.jsp"%>
                                    
                                       <display:column title="${title0}" sortable="true" 
                                       sortProperty="NRIESGO" 
                                       headerClass="headwidth5 sortable"  
                                       media="html" autolink="false" >
                                       <div class="dspText">
                                       ${LSTRIESGOS.NRIESGO}
                                       </div>
                                       </display:column>
                                        <display:column title="${title1}" sortable="true" 
                                       sortProperty="NRIESGO" 
                                       headerClass="headwidth sortable"  
                                       media="html" autolink="false" >
                                       <div class="dspText">
                                       ${LSTRIESGOS.TRIESGO}
                                       </div>
                                       </display:column>
                                       
                                         <display:column title="${title2}" sortable="true" sortProperty="TTIPMOV" headerClass="headwidth15 sortable"  media="html" autolink="false" >
                                    <div class="dspText">${LSTRIESGOS.TTIPMOV}</div>
                                </display:column>
                                <display:column title="${title3}" sortable="true" sortProperty="TMOTMOV" headerClass="headwidth sortable"  media="html" autolink="false" >
                                    <div class="dspText">${LSTRIESGOS.TMOTMOV}</div>
                                </display:column>
                                  <display:column title="${title4}" sortable="true" sortProperty="FEFECTO" headerClass="headwidth sortable"  media="html" autolink="false" >
                                    <div class="dspDate"><fmt:formatDate value="${LSTRIESGOS.FEFECTO}" pattern="dd/MM/yyyy"/></div>
                                </display:column>
                                <axis:visible f="axisctr214" c="FEMISIO">
                                    <display:column title="${title5}" sortable="true" sortProperty="FEMISIO" headerClass="headwidth sortable"  media="html" autolink="false" >
                                        <div class="dspDate"><fmt:formatDate value="${LSTRIESGOS.FEMISIO}" pattern="dd/MM/yyyy"/></div>
                                    </display:column>
                                </axis:visible>
                            <display:column title="${title6}" headerClass="headwidth5 sortable" media="html" autolink="false" >
                                 <div class="dspIcons"><img border="0" alt="<axis:alt f="axisctr214" c="MAS" lit="140280"/>" title="<axis:alt f="axisctr214" c="MAS" lit="140280"/>" src="images/informacion.gif" width="11px" height="11px"
                                 style="cursor:pointer;vertical-align:middle;" onclick="f_but_detailmov('${LSTRIESGOS.NMOVIMI}', '${LSTRIESGOS.CMOTMOV}','' )"/></div>
                                </display:column>
                                        <%--axis:visible f="axisctr214" c="DET_ITEMS_RIESGO">  
			   <display:column title="${title7}"
			   headerClass="headwidth5 sortable"
			   media="html" autolink="false">
			   <c:choose>
			   <c:when test="${__formdata.COBJASE==1}">
			   <div class="dspIcons">
                                    <img border="0"
                                         alt='<axis:alt f="axisctr214" c="LIT_DET_ASE" lit="1000195"></axis:alt>'                                        
                                         title='<axis:alt f="axisctr214" c="LIT_DET_ASE" lit="1000195"></axis:alt>'
                                         src="images/mas.gif" width="11px"
                                         height="11px"
                                         style="vertical-align:middle;cursor:pointer;"
                                         onclick="f_abrir_axisctr029('${LSTRIESGOS.NRIESGO}')"/>
                                </div>
                            </c:when>
                            <c:when test="${__formdata.COBJASE==2}">
                                <div class="dspIcons">
                                    <img border="0"
                                         alt='<axis:alt f="axisctr214" c="LIT_DET_ASE" lit="1000199"></axis:alt>'
                                         title='<axis:alt f="axisctr214" c="LIT_DET_ASE" lit="1000199"></axis:alt>'
                                         src="images/mas.gif" width="11px"
                                         height="11px"
                                         style="vertical-align:middle;cursor:pointer;"
                                         onclick="f_abrir_riedireccion('${LSTRIESGOS.NRIESGO}');"/>
                                </div>
                            </c:when>
                            <c:when test="${__formdata.COBJASE==3}">
                                <div class="dspIcons">
                                    <img border="0"
                                         alt='<axis:alt f="axisctr214" c="LIT_DET_ASE" lit="1000199"></axis:alt>'
                                         title='<axis:alt f="axisctr214" c="LIT_DET_ASE" lit="1000199"></axis:alt>'
                                         src="images/mas.gif" width="11px"
                                         height="11px"
                                         style="vertical-align:middle;cursor:pointer;"
                                         onclick="f_abrir_modal('axisctr043', false, '&NRIESGO=' + ${LSTRIESGOS.NRIESGO});"/>
                                </div>
                            </c:when>
                            <c:when test="${__formdata.COBJASE==4}">
                                <div class="dspIcons">
                                    <img border="0"
                                         alt='<axis:alt f="axisctr214" c="LIT_DET_ASE" lit="1000199"></axis:alt>'
                                         title='<axis:alt f="axisctr214" c="LIT_DET_ASE" lit="1000199"></axis:alt>'
                                         src="images/mas.gif" width="11px"
                                         height="11px"
                                         style="vertical-align:middle;cursor:pointer;"
                                         onclick="f_abrir_modal('axisctr043', false, '&NRIESGO=' + ${LSTRIESGOS.NRIESGO});"/>
                                </div>
                            </c:when>
                            <c:when test="${__formdata.COBJASE==5}">
                                <div class="dspIcons">
                                    <img border="0"
                                         alt='<axis:alt f="axisctr214" c="LIT_DET_ASE" lit="1000199"></axis:alt>'
                                         title='<axis:alt f="axisctr214" c="LIT_DET_ASE" lit="1000199"></axis:alt>'
                                         src="images/mas.gif" width="11px"
                                         height="11px"
                                         style="vertical-align:middle;cursor:pointer;"
                                         onclick="f_abrir_axisctrautos('${LSTRIESGOS.NRIESGO}','${LSTRIESGOS.NMOVIMI}')"/>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <div class="dspIcons">
                                    <img border="0"
                                         alt='<axis:alt f="axisctr214" c="LIT_DET_ASE" lit="1000199"></axis:alt>'
                                         title='<axis:alt f="axisctr214" c="LIT_DET_ASE" lit="1000199"></axis:alt>'
                                         src="images/mas.gif" width="11px"
                                         height="11px"
                                         style="vertical-align:middle;cursor:pointer;"
                                         onclick="f_abrir_axisctr029('${LSTRIESGOS.NRIESGO}')"/>
                                         
                                </div>
                        </c:otherwise>
                    </c:choose>
                    </display:column>
                    </axis:visible--%>
                                     </display:table>
                                     
                                     
                             
                                     
                                    
                                        </td>
                                        </tr>
                                    </table>
                                    
                                    
                                    <div class="separador">&nbsp;</div>
                                    
                       
                                  
                        
                </td>
            </tr>
        </table>
        
        <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisctr214</c:param>
               <c:param name="f">axisctr214</c:param>
              <c:param name="__botones">cancelar</c:param>
        </c:import>
    
    </form>
    
    <c:import url="../include/mensajes.jsp"/>

    <script type="text/javascript">
        Calendar.setup({
            inputField     :    "FCANCEL",     
            ifFormat       :    "%d/%m/%Y",      
            button         :    "icon_FCANCEL", 
            singleClick    :    true,
            firstDay       :    1
        });
     </script>
</div>
</body>
</html>