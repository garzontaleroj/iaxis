<%/* Revision:# PuGJU0W7sO4UVuKoUXYs5A== # */%>
<%/*
*  Fichero: axisctr030.jsp
*
*  @author <a href = "mailto:rkirchner@csi-ti.com">Roger Kirchner</a>
*
*  Fecha: 28/02/2007
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
      <%-- Especial per controlar els scroll amb iPad --%>
        <link type="text/css" href="styles/jquery.jscrollpane.css" rel="stylesheet" media="only screen and (min-device-width: 768px) and (max-device-width: 1024px)" />
        <style type="text/css" id="page-css"> </style>
    <%-- FI Especial per controlar els scroll amb iPad --%>  
    <c:import url="../include/carga_framework_js.jsp" />
    <script language="Javascript" type="text/javascript">
        function f_onload() {
        		<c:if test="${ (fn:containsIgnoreCase(header['User-Agent'],'ipad') )   }">
								retocarPAGE_CSS('axisctr030');
							</c:if>
            revisarEstilos();
            // Retocar tabla en IE
            if (document.all) // ES Explorer
                document.getElementById("tabla1").style.marginLeft="1.3%";
        
             f_cargar_propiedades_pantalla();
        }
        function f_but_cancelar() {
            parent.f_cerrar_axisctr030();
        }
              
        function f_abrir_188(cpregun,tpregun,tipo) {
                 var CGARANT = document.miForm.CGARANT.value;
                 var ORIGEN = document.miForm.ORIGEN.value;
                 
                 if (!objUtiles.estaVacio(ORIGEN)){
                    if (ORIGEN == "AXISCTR020")
                        var CTABLA = "POL";
                    else
                        var CTABLA = "EST";
                 }
                 else
                    var CTABLA = "EST";
                    
            // objUtiles.abrirModal("axisctr188", "src", "modal_axisctr188.do?operation=form&CPREGUN=" + cpregun+"&TPREGUN="+tpregun+"&TIPO_PREGUNTA="+tipo+"&CONSULTA=1&CGARANT="+CGARANT+"&NRIESGO="+objDom.getValorPorId("NRIESGO"));             
						// objUtiles.abrirModal("axisctr218", "src", "modal_axisctr218.do?operation=form&ORIGEN=AXISCTR009&CTABLA="+CTABLA+"&CPREGUN=" + cpregun+"&TPREGUN="+tpregun+"&TIPO_PREGUNTA="+tipo+"&CONSULTA=1&CGARANT="+CGARANT+"&NRIESGO="+objDom.getValorPorId("NRIESGO")+"&NMOVIMI="+objDom.getValorPorId("NMOVIMI"));
             objUtiles.abrirModal("axisctr218", "src", "modal_axisctr218.do?operation=form&ORIGEN=AXISCTR009&CTABLA="+CTABLA+"&CPREGUN=" + cpregun+"&TPREGUN="+tpregun+"&TIPO_PREGUNTA="+tipo+"&SSEGURO="+objDom.getValorPorId("SSEGURO")+"&CONSULTA=1&CGARANT="+CGARANT+"&NRIESGO="+objDom.getValorPorId("NRIESGO")+"&NMOVIMI="+objDom.getValorPorId("NMOVIMI"));
             
             }
             function f_cerrar_modal (pform) {
                objUtiles.cerrarModal(pform);
              }

        
    </script>
  </head>
    <body onload="f_onload()">
    	<div id="wrapper" class="wrapper">
        <form name="miForm" action="" method="POST">
            <input type="hidden" name="operation" value=""/>
            <input type="hidden" name="CGARANT" id="CGARANT" value="${__formdata.CGARANT}"/>
            <input type="hidden" name="NRIESGO" id="NRIESGO" value="${__formdata.NRIESGO}"/>
            <input type="hidden" name="ORIGEN" id="ORIGEN" value="${__formdata.ORIGEN}"/>
            <input type="hidden" name="NMOVIMI" id="NMOVIMI" value="${__formdata.NMOVIMI}"/>
            <input type="hidden" name="SSEGURO" id="SSEGURO" value="${__formdata.SSEGURO}"/>
            
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt f="axisctr030" c="TITULO" lit="1000196" /></c:param>
                <c:param name="producto"><axis:alt f="axisctr030" c="TITULO" lit="1000196" /></c:param>
                <c:param name="form">axisctr030</c:param>
            </c:import>
            
              <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt f="axisctr030" c="TITULO_DET" lit="9901369" /></c:param>
                <c:param name="nid" value="axisctr188" />
            </c:import>
            
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt f="axisctr030" c="TITULO_DET" lit="9901369" /></c:param>
                <c:param name="nid" value="axisctr218" />
            </c:import>

            <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <table class="seccion">
                            <tr>
                                <td align="left">
                                    <table class="area" align="center">
                                        <tr>
                                            <th style="width:25%;height:0px"></th>
                                            <th style="width:25%;height:0px"></th>
                                            <th style="width:25%;height:0px"></th>
                                            <th style="width:25%;height:0px"></th>
                                        </tr>
                                        <tr>             
                                            <axis:ocultar f="axisctr030" c="TRIESGO" dejarHueco="false">
                                            <td class="titulocaja" colspan="2">
                                                <b><axis:alt f="axisctr030" c="TRIESGO" lit="100649"/></b>
                                            </td>
                                            </axis:ocultar>
                                            <axis:ocultar f="axisctr030" c="TGARANT" dejarHueco="false">
                                            <td class="titulocaja">
                                                <b><axis:alt f="axisctr030" c="TGARANT" lit="110994"/></b>
                                            </td>
                                            </axis:ocultar>
                                        </tr>
                                        <tr>   
                                            <axis:ocultar f="axisctr030" c="TRIESGO" dejarHueco="false">
                                            <td class="campocaja" colspan="2">
                                                <input type="text" class="campowidthinput campo campotexto" style="width:92%;.width:90%" id="TRIESGO" name="TRIESGO" size="15"
                                                value="${__formdata.TRIESGO}" readonly="true" />
                                            </td>
                                            </axis:ocultar>
                                            <axis:ocultar f="axisctr030" c="TGARANT" dejarHueco="false">
                                             <td class="campocaja" colspan="2">
                                                <input type="text" class="campowidthinput campo campotexto" style="width:92%;.width:90%" id="TGARANT" name="TGARANT" size="15"
                                                value="${__formdata.OB_IAX_GARANTIAS.TGARANT}" readonly="true" />
                                            </td>
                                            </axis:ocultar>
                                        </tr>                            
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>                
                <axis:visible c="DSP_PREGUNTAS" f="axisctr030">
                    <tr>
                    <td class="campocaja" >
                    <div class="separador">&nbsp;</div>     
                    <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axisctr030" c="DSP_PREGUNTAS" lit="102299"/></div>
                    <table class="seccion">
                        <tr>
                            <td align="left">
                               <div class="displayspace">
                                 <c:set var="title0"><axis:alt f="axisctr030" c="CPREGUN" lit="800440"/></c:set>
                                 <c:set var="title1"><axis:alt f="axisctr030" c="TPREGUN" lit="102738"/></c:set>
                                 <c:set var="title2"><axis:alt f="axisctr030" c="TRESPUE" lit="103712"/></c:set>
                                  <display:table name="${axisctr_preguntasGarantia}" id="PREGUNTAS" export="false" class="dsptgtable" pagesize="-1" sort="list" cellpadding="0" cellspacing="0" 
                                  requestURI="modal_axisctr030.do?paginar=true">
                                       <%@ include file="../include/displaytag.jsp"%>
                                       <axis:ocultar f="axisctr030" c="CPREGUN" dejarHueco="false">
                                       <display:column title="${title0}" sortable="true" sortProperty="OB_IAX_PREGUNTAS.CPREGUN" headerClass="headwidth5 sortable"  media="html" autolink="false" >
                                           <div class="dspNumber">${PREGUNTAS.OB_IAX_PREGUNTAS.CPREGUN}</div>
                                       </display:column>
                                       </axis:ocultar>
                                       <axis:ocultar f="axisctr030" c="TPREGUN" dejarHueco="false">
                                       <display:column title="${title1}" sortable="true" sortProperty="OB_IAX_PREGUNTAS.TPREGUN" headerClass="sortable"  media="html" autolink="false" >
                                           <div class="dspText">${PREGUNTAS.OB_IAX_PREGUNTAS.TPREGUN}</div>
                                       </display:column>
                                       </axis:ocultar>
                                       <axis:ocultar f="axisctr030" c="TRESPUE" dejarHueco="false">
                                       <display:column title="${title2}" sortable="false" headerClass="headwidth30 sortable"  media="html" autolink="false" >
                                           <div class="dspText">
                                              <c:choose>
                                                    <c:when test="${PREGUNTAS.OB_IAX_PREGUNTAS.TRESPUE != null}">
                                                        ${PREGUNTAS.OB_IAX_PREGUNTAS.TRESPUE}
                                                    </c:when>
                                                    <c:when test="${PREGUNTAS.OB_IAX_PREGUNTAS.CRESPUE != null}">
                                                         ${PREGUNTAS.OB_IAX_PREGUNTAS.CRESPUE}
                                                    </c:when>
                                                     <c:when test="${!empty PREGUNTAS.OB_IAX_PREGUNTAS.TPREGUNTASTAB}">
                                                     <a href="javascript:void(0)" onClick="f_abrir_188('${PREGUNTAS.OB_IAX_PREGUNTAS.CPREGUN}','${PREGUNTAS.OB_IAX_PREGUNTAS.TPREGUN}','G');"> 
                                                        <b style="color:red"><axis:alt f="axisctr004" c="VERDETALLE" lit="9000968"/></b>
                                                      </a>
                                                     </c:when>
                                                   
                                                </c:choose>
                                           </div>
                                       </display:column>    
                                       </axis:ocultar>
                                  </display:table>
                               </div>
                            </td>
                        </tr>
                    </table>
                    </td>
                    </tr>
                </axis:visible>                
                <c:if test="${!empty sessionScope.axisctr_pregGarQuestSalut}">                
                    <axis:ocultar c="DSP_PREGUNTASQUEST" f="axisctr030" dejarHueco="false">
                    <tr>
                    <td class="campocaja" >
                    <div class="separador">&nbsp;</div>     
                    <div class="titulo"><img src="images/flecha.gif"/><axis:alt c="LIT_PREG_QUESTSALUT" f="axisctr030" lit="103672"/></div>
                    <table class="seccion">
                        <tr>
                            <td align="left">
                               <div class="displayspace">
                                 <c:set var="title0"><axis:alt f="axisctr030" c="CPREGUN" lit="800440"/></c:set>
                                 <c:set var="title1"><axis:alt f="axisctr030" c="TPREGUN" lit="102738"/></c:set>
                                 <c:set var="title2"><axis:alt f="axisctr030" c="TRESPUE" lit="103712"/></c:set>
                                  <display:table name="${axisctr_pregGarQuestSalut}" id="PREGUNTAS" export="false" class="dsptgtable" pagesize="-1" sort="list" cellpadding="0" cellspacing="0" 
                                  requestURI="modal_axisctr030.do?paginar=true">
                                       <%@ include file="../include/displaytag.jsp"%>
                                       <axis:ocultar f="axisctr030" c="CPREGUN" dejarHueco="false">
                                       <display:column title="${title0}" sortable="true" sortProperty="OB_IAX_PREGUNTAS.CPREGUN" headerClass="headwidth5 sortable"  media="html" autolink="false" >
                                           <div class="dspNumber">${PREGUNTAS.OB_IAX_PREGUNTAS.CPREGUN}</div>
                                       </display:column>
                                       </axis:ocultar>
                                       <axis:ocultar f="axisctr030" c="TPREGUN" dejarHueco="false">
                                       <display:column title="${title1}" sortable="true" sortProperty="OB_IAX_PREGUNTAS.TPREGUN" headerClass="sortable"  media="html" autolink="false" >
                                           <div class="dspText">${PREGUNTAS.OB_IAX_PREGUNTAS.TPREGUN}</div>
                                       </display:column>
                                       </axis:ocultar>
                                       <axis:ocultar f="axisctr030" c="TRESPUE" dejarHueco="false">
                                       <display:column title="${title2}" sortable="false" headerClass="headwidth30 sortable"  media="html" autolink="false" >
                                           <div class="dspText">
                                              <c:choose>
                                                    <c:when test="${PREGUNTAS.OB_IAX_PREGUNTAS.TRESPUE != null}">
                                                        ${PREGUNTAS.OB_IAX_PREGUNTAS.TRESPUE}
                                                    </c:when>
                                                    <c:when test="${PREGUNTAS.OB_IAX_PREGUNTAS.CRESPUE != null}">
                                                         ${PREGUNTAS.OB_IAX_PREGUNTAS.CRESPUE}
                                                    </c:when>
                                                     <c:when test="${!empty PREGUNTAS.OB_IAX_PREGUNTAS.TPREGUNTASTAB}">
                                                     <a href="javascript:void(0)" onClick="f_abrir_188('${PREGUNTAS.OB_IAX_PREGUNTAS.CPREGUN}','${PREGUNTAS.OB_IAX_PREGUNTAS.TPREGUN}','G');"> 
                                                        <b style="color:red"><axis:alt f="axisctr004" c="VERDETALLE" lit="9000968"/></b>
                                                      </a>
                                                     </c:when>
                                                   
                                                </c:choose>
                                           </div>
                                       </display:column>    
                                       </axis:ocultar>
                                  </display:table>
                               </div>
                            </td>
                        </tr>
                    </table>
                    </td>
                    </tr>
                    </axis:ocultar>                
                </c:if>
                <c:if test="${!empty sessionScope.axisctr_pregGarDespeses}">                
                    <axis:ocultar c="DSP_PREGUNTASDESPESES" f="axisctr030" dejarHueco="false">
                    <tr>
                    <td class="campocaja" >
                    <div class="separador">&nbsp;</div>     
                    <div class="titulo"><img src="images/flecha.gif"/><axis:alt c="LIT_PREG_DESPESES" f="axisctr030" lit="9001509"/></div>
                    <table class="seccion">
                        <tr>
                            <td align="left">
                               <div class="displayspace">
                                 <c:set var="title0"><axis:alt f="axisctr030" c="CPREGUN" lit="800440"/></c:set>
                                 <c:set var="title1"><axis:alt f="axisctr030" c="TPREGUN" lit="102738"/></c:set>
                                 <c:set var="title2"><axis:alt f="axisctr030" c="TRESPUE" lit="103712"/></c:set>
                                  <display:table name="${axisctr_pregGarDespeses}" id="PREGUNTAS" export="false" class="dsptgtable" pagesize="-1" sort="list" cellpadding="0" cellspacing="0" 
                                  requestURI="modal_axisctr030.do?paginar=true">
                                       <%@ include file="../include/displaytag.jsp"%>
                                       <axis:ocultar f="axisctr030" c="CPREGUN" dejarHueco="false">
                                       <display:column title="${title0}" sortable="true" sortProperty="OB_IAX_PREGUNTAS.CPREGUN" headerClass="headwidth5 sortable"  media="html" autolink="false" >
                                           <div class="dspNumber">${PREGUNTAS.OB_IAX_PREGUNTAS.CPREGUN}</div>
                                       </display:column>
                                       </axis:ocultar>
                                       <axis:ocultar f="axisctr030" c="TPREGUN" dejarHueco="false">
                                       <display:column title="${title1}" sortable="true" sortProperty="OB_IAX_PREGUNTAS.TPREGUN" headerClass="sortable"  media="html" autolink="false" >
                                           <div class="dspText">${PREGUNTAS.OB_IAX_PREGUNTAS.TPREGUN}</div>
                                       </display:column>
                                       </axis:ocultar>
                                       <axis:ocultar f="axisctr030" c="TRESPUE" dejarHueco="false">
                                       <display:column title="${title2}" sortable="false" headerClass="headwidth30 sortable"  media="html" autolink="false" >
                                           <div class="dspText">
                                              <c:choose>
                                                    <c:when test="${PREGUNTAS.OB_IAX_PREGUNTAS.TRESPUE != null}">
                                                        ${PREGUNTAS.OB_IAX_PREGUNTAS.TRESPUE}
                                                    </c:when>
                                                    <c:when test="${PREGUNTAS.OB_IAX_PREGUNTAS.CRESPUE != null}">
                                                         ${PREGUNTAS.OB_IAX_PREGUNTAS.CRESPUE}
                                                    </c:when>
                                                     <c:when test="${!empty PREGUNTAS.OB_IAX_PREGUNTAS.TPREGUNTASTAB}">
                                                     <a href="javascript:void(0)" onClick="f_abrir_188('${PREGUNTAS.OB_IAX_PREGUNTAS.CPREGUN}','${PREGUNTAS.OB_IAX_PREGUNTAS.TPREGUN}','G');"> 
                                                        <b style="color:red"><axis:alt f="axisctr004" c="VERDETALLE" lit="9000968"/></b>
                                                      </a>
                                                     </c:when>
                                                   
                                                </c:choose>
                                           </div>
                                       </display:column>    
                                       </axis:ocultar>
                                  </display:table>
                               </div>
                            </td>
                        </tr>
                    </table>
                    </td>
                    </tr>
                    </axis:ocultar>                
                </c:if>
                <%-- Inici apartat nou dades   --%>
                <c:if test="${__formdata.OB_IAX_GARANTIAS.MASDATOS.NDETGAR >= 0}">
                    <tr>
                     <td>
                            <div class="separador">&nbsp;</div>     
                            <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axisctr030" c="LIT_DATOS" lit="9001754"/></div>
                            <table class="seccion">
                            <!-- Campos -->
                             <div class="separador">&nbsp;</div>        
                                <tr>
                                    <td align="left">
                                        <table class="area" align="center">
                                             <tr>
                                                <th style="width:20%;height:0px"></th>
                                                <th style="width:15%;height:0px"></th>
                                                <th style="width:15%;height:0px"></th>
                                                <th style="width:15%;height:0px"></th>
                                                <th style="width:15%;height:0px"></th>
                                                <th style="width:20%;height:0px"></th>                                            
                                            </tr>
                                             <tr>         
                                                <axis:ocultar f="axisctr030" c="TESTADO" dejarHueco="false">
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axisctr030" c="TESTADO" lit="100587"/></b> <!-- ESTADO =  -->
                                                </td>  
                                                </axis:ocultar>
                                                <axis:ocultar f="axisctr030" c="NDETGAR" dejarHueco="false">
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axisctr030" c="NDETGAR" lit="9001755"/></b> <!-- Num. detalle =  -->
                                                </td>                                                       
                                                </axis:ocultar>
                                                <axis:ocultar f="axisctr030" c="FEFECTO" dejarHueco="false">
                                                <td class="titulocaja" >
                                                    <b><axis:alt f="axisctr030" c="FEFECTO" lit="100883"/></b> <!-- Data efecte =  -->
                                                </td>                                            
                                                </axis:ocultar>
                                                <axis:ocultar f="axisctr030" c="FVENCIM" dejarHueco="false">
                                                 <td class="titulocaja">
                                                    <b><axis:alt f="axisctr030" c="FVENCIM" lit="100885"/></b> <!-- Data venciment =  -->
                                                </td>  
                                                </axis:ocultar>
                                                <axis:ocultar f="axisctr030" c="NDURCOB" dejarHueco="false">
                                                <td class="titulocaja" >
                                                    <b><axis:alt f="axisctr030" c="NDURCOB" lit="1000467"/></b> <!-- Durada pagaments =  -->
                                                </td>                   
                                                </axis:ocultar>
                                                <axis:ocultar f="axisctr030" c="FFINCOB" dejarHueco="false">
                                                <td class="titulocaja" >
                                                    <b><axis:alt f="axisctr030" c="FFINCOB" lit="9001756"/></b> <!-- Data fi pagaments =  -->
                                                </td>                   
                                                </axis:ocultar>
                                            </tr>
                                            <tr>   
                                                <axis:ocultar f="axisctr030" c="TESTADO" dejarHueco="false">
                                                <td class="campocaja">
                                                    <input type="text" class="campowidthinput campo campotexto" id="TESTADO" name="TESTADO" style="width:60%" 
                                                    size="15" value="${__formdata.OB_IAX_GARANTIAS.MASDATOS.TESTADO}" readonly="true"
                                                    title="<axis:alt f="axisctr030" c="TESTADO" lit="100587"/>"/>
                                                </td>
                                                </axis:ocultar>
                                                <axis:ocultar f="axisctr030" c="NDETGAR" dejarHueco="false">
                                                <td class="campocaja">
                                                    <input type="text" class="campowidthinput campo campotexto" id="NDETGAR" name="NDETGAR" 
                                                    size="15" value="${__formdata.OB_IAX_GARANTIAS.MASDATOS.NDETGAR}" readonly="true" style="width:60%" 
                                                    title="<axis:alt f="axisctr030" c="NDETGAR" lit="9001755"/>"/>
                                                </td>
                                                </axis:ocultar>
                                                <axis:ocultar f="axisctr030" c="FEFECTO" dejarHueco="false">
                                                 <td class="campocaja">
                                                    <input type="text" class="campowidthinput campo campotexto" id="FEFECTO" name="FEFECTO" size="15" 
                                                    <axis:atr f="axisctr030" c="FEFECTO" a="modificable=false"/>
                                                    value="<fmt:formatDate value="${__formdata.OB_IAX_GARANTIAS.MASDATOS.FEFECTO}" pattern="dd/MM/yyyy"/>"
                                                    style="width:60%" title="<axis:alt f="axisctr030" c="FEFECTO" lit="100883"/>"/>
                                                </td>
                                                </axis:ocultar>
                                                <axis:ocultar f="axisctr030" c="FVENCIM" dejarHueco="false">
                                                <td class="campocaja">
                                                    <input type="text" class="campowidthinput campo campotexto" id="FVENCIM" name="FVENCIM" size="15" 
                                                    <axis:atr f="axisctr030" c="FVENCIM" a="modificable=false"/>
                                                    value="<fmt:formatDate value="${__formdata.OB_IAX_GARANTIAS.MASDATOS.FVENCIM}" pattern="dd/MM/yyyy"/>"
                                                    style="width:60%" title="<axis:alt f="axisctr030" c="FVENCIM" lit="100885"/>"/>
                                                </td>
                                                </axis:ocultar>
                                                <axis:ocultar f="axisctr030" c="NDURCOB" dejarHueco="false">
                                                <td class="campocaja">
                                                    <input type="text" class="campowidthinput campo campotexto" id="NDURCOB" name="NDURCOB" 
                                                    size="15" value="${__formdata.OB_IAX_GARANTIAS.MASDATOS.NDURCOB }" readonly="true" style="width:60%"
                                                    title="<axis:alt f="axisctr030" c="NDURCOB" lit="1000467"/>"/>
                                                </td>
                                                </axis:ocultar>
                                                <axis:ocultar f="axisctr030" c="FFINCOB" dejarHueco="false">
                                                <td class="campocaja">
                                                    <input type="text" class="campowidthinput campo campotexto" id="FFINCOB" name="FFINCOB" size="15" 
                                                    <axis:atr f="axisctr030" c="FFINCOB" a="modificable=false"/>
                                                    value="<fmt:formatDate value="${__formdata.OB_IAX_GARANTIAS.MASDATOS.FFINCOB}" pattern="dd/MM/yyyy"/>"
                                                    style="width:60%" title="<axis:alt f="axisctr030" c="FFINCOB" lit="9001756"/>"/>
                                                </td>   
                                                </axis:ocultar>
                                           </tr>
                                           <tr>      
                                                <axis:ocultar f="axisctr030" c="valor_revalorizacion" dejarHueco="false">
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axisctr030" c="valor_revalorizacion" lit="1000073"/></b> <!-- Capital =  -->
                                                </td>   
                                                </axis:ocultar>
                                                <axis:ocultar f="axisctr030" c="CTARIFA" dejarHueco="false">
                                                <td class="titulocaja" >
                                                    <b><axis:alt f="axisctr030" c="CTARIFA" lit="100990"/></b> <!-- Código de tarifa =  -->
                                                </td>                                            
                                                </axis:ocultar>
                                                <axis:ocultar f="axisctr030" c="FTARIFA" dejarHueco="false">
                                                 <td class="titulocaja">
                                                    <b><axis:alt f="axisctr030" c="FTARIFA" lit="9001757"/></b> <!-- Fecha de tarifa =  -->
                                                </td>                                                       
                                                </axis:ocultar>
                                                <axis:ocultar f="axisctr030" c="PINTTEC" dejarHueco="false">
                                                <td class="titulocaja" >
                                                    <b><axis:alt f="axisctr030" c="PINTTEC" lit="107049"/></b> <!-- Interés técnico =  -->
                                                </td>                   
                                                </axis:ocultar>
                                                <axis:ocultar f="axisctr030" c="PINTMIN" dejarHueco="false">
                                                <td class="titulocaja" >
                                                    <b><axis:alt f="axisctr030" c="PINTMIN" lit="9001758"/></b> <!-- Interés mínimo garantizado =  -->
                                                </td>      
                                                </axis:ocultar>
                                                <axis:ocultar f="axisctr030" c="CUNICA" dejarHueco="false">
                                                <td class="titulocaja" >
                                                    <b><axis:alt f="axisctr030" c="CUNICA" lit="9001984"/></b> <!-- Única -->
                                                </td>
                                                </axis:ocultar>
                                          </tr>
                                          <tr>    
                                                <axis:ocultar f="axisctr030" c="VALOR_REVALORIZACION" dejarHueco="false">
                                                <td class="campocaja">
                                                    <input type="text" class="campowidthinput campo campotexto" id="valor_revalorizacion" name="valor_revalorizacion" 
                                                    size="15" value="${__formdata.OB_IAX_GARANTIAS.ICAPITAL}" readonly="true" style="width:60%" 
                                                    title="<axis:alt f="axisctr030" c="VALOR_REVALORIZACION" lit="1000073"/>"/>
                                                </td>
                                                </axis:ocultar>
                                                <axis:ocultar f="axisctr030" c="CTARIFA" dejarHueco="false">
                                                 <td class="campocaja">
                                                    <input type="text" class="campowidthinput campo campotexto" id="CTARIFA" name="CTARIFA" size="15" 
                                                    <axis:atr f="axisctr030" c="FANULAC" a="modificable=false"/>
                                                    value="${__formdata.OB_IAX_GARANTIAS.MASDATOS.CTARIFA}"
                                                    style="width:60%" title="<axis:alt f="axisctr030" c="FANULAC" lit="100990"/>"/>
                                                </td>
                                                </axis:ocultar>
                                                <axis:ocultar f="axisctr030" c="FTARIFA" dejarHueco="false">
                                                <td class="campocaja">
                                                    <input type="text" class="campowidthinput campo campotexto" id="FTARIFA" name="FTARIFA" size="15" 
                                                    <axis:atr f="axisctr030" c="FTARIFA" a="modificable=false"/>
                                                    value="<fmt:formatDate value="${__formdata.OB_IAX_GARANTIAS.MASDATOS.FTARIFA}" pattern="dd/MM/yyyy"/>"
                                                    style="width:60%" title="<axis:alt f="axisctr030" c="FTARIFA" lit="9001757"/>"/>
                                                </td>
                                                </axis:ocultar>
                                                <axis:ocultar f="axisctr030" c="PINTTEC" dejarHueco="false">
                                                <td class="campocaja">
                                                    <input type="text" class="campowidthinput campo campotexto" id="PINTTEC" name="PINTTEC" 
                                                    size="15" readonly="true" style="width:60%"
                                                    value="${__formdata.OB_IAX_GARANTIAS.MASDATOS.PINTTEC}"
                                                    title="<axis:alt f="axisctr030" c="PINTTEC" lit="107049"/>"/>
                                                </td>
                                                </axis:ocultar>
                                                <axis:ocultar f="axisctr030" c="PINTMIN" dejarHueco="false">
                                                <td class="campocaja">
                                                    <input type="text" class="campowidthinput campo campotexto" id="PINTMIN" name="PINTMIN" size="15" 
                                                    <axis:atr f="axisctr030" c="PINTMIN" a="modificable=false"/>
                                                    value="${__formdata.OB_IAX_GARANTIAS.MASDATOS.PINTMIN}"
                                                    style="width:60%" title="<axis:alt f="axisctr030" c="PINTMIN" lit="9001758"/>"/>
                                                </td>
                                                </axis:ocultar>
                                                <axis:ocultar f="axisctr030" c="CUNICA" dejarHueco="false">
                                                <td class="campocaja">
                                                    <input disabled="true" type="checkbox" name="CUNICA" id="CUNICA" <c:if test="${__formdata.OB_IAX_GARANTIAS.MASDATOS.CUNICA == '1'}">checked</c:if>
                                                    <axis:atr f="axisctr030" c="CUNICA" a="modificable=false"/> alt="<axis:alt f="axisctr030" c="CUNICA" lit="9001984" />" title="<axis:alt f="axisctr030" c="CUNICA" lit="9001984" />"/>
                                                </td> 
                                                </axis:ocultar>
                                           </tr>
                                            <tr>                                            
                                                <axis:ocultar f="axisctr030" c="IPROVT0" dejarHueco="false">
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axisctr030" c="IPROVT0" lit="9001759"/></b> <!-- Provisión T0 =  -->
                                                </td>                                                                                        
                                                </axis:ocultar>   
                                                <axis:ocultar f="axisctr030" c="FPROVT0" dejarHueco="false">
                                                <td class="titulocaja" >
                                                    <b><axis:alt f="axisctr030" c="FPROVT0" lit="9001760"/></b> <!-- Fecha de provión T0 =  -->
                                                </td>                                            
                                                </axis:ocultar>
                                                <axis:ocultar f="axisctr030" c="IPROVT1" dejarHueco="false">
                                                 <td class="titulocaja">
                                                    <b><axis:alt f="axisctr030" c="IPROVT1" lit="9001761"/></b> <!-- Provisión T0 =  -->
                                                </td>                                                                                        
                                                </axis:ocultar>
                                                <axis:ocultar f="axisctr030" c="FPROVT1" dejarHueco="false">
                                                <td class="titulocaja" >
                                                    <b><axis:alt f="axisctr030" c="FPROVT1" lit="9001762"/></b> <!-- Fecha de provión T0 =  -->
                                                </td>                   
                                                </axis:ocultar>    
                                                <axis:ocultar f="axisctr030" c="CAGENTE" dejarHueco="false">
                                                <td class="titulocaja" >                                               
                                                    <b><axis:alt f="axisctr030" c="CAGENTE" lit="100584"/></b> <!-- Agente  -->
                                                </td>   
                                                </axis:ocultar>    
                                                <axis:ocultar f="axisctr030" c="PROVAC" dejarHueco="false">
                                                    <td class="titulocaja" >
                                                        <b><axis:alt f="axisctr030" c="PROVAC" lit="1000518"/></b> <!-- Provión -->
                                                    </td>                   
                                                </axis:ocultar>
                                                <%--
                                                <td class="titulocaja" >                                               
                                                    <b><axis:alt f="axisctr030" c="NOMBRE_TEXT" lit="105940" /></b> <!-- Descripcción Agente  -->
                                                </td>
                                                --%>
                                          </tr>
                                             <tr>                                            
                                                <axis:ocultar f="axisctr030" c="IPROVT0" dejarHueco="false">
                                                <td class="campocaja">
                                                    <input type="text" class="campowidthinput campo campotexto" id="IPROVT0" name="IPROVT0" style="width:60%" 
                                                    size="15" value="${__formdata.OB_IAX_GARANTIAS.MASDATOS.IPROVT0}" readonly="true"
                                                    title="<axis:alt f="axisctr030" c="IPROVT0" lit="9001759"/>"/>
                                                </td>
                                                </axis:ocultar>
                                                <axis:ocultar f="axisctr030" c="FPROVT0" dejarHueco="false">
                                                 <td class="campocaja">
                                                    <input type="text" class="campowidthinput campo campotexto" id="FPROVT0" name="FPROVT0" size="15" 
                                                    <axis:atr f="axisctr030" c="FPROVT0" a="modificable=false"/>
                                                    value="<fmt:formatDate value="${__formdata.OB_IAX_GARANTIAS.MASDATOS.FPROVT0}" pattern="dd/MM/yyyy"/>"
                                                    style="width:60%" title="<axis:alt f="axisctr030" c="FPROVT0" lit="9001760"/>"/>
                                                </td>                                           
                                                </axis:ocultar>  
                                                <axis:ocultar f="axisctr030" c="IPROVT1" dejarHueco="false">
                                                <td class="campocaja">
                                                    <input type="text" class="campowidthinput campo campotexto" id="IPROVT1" name="IPROVT1" 
                                                    size="15" value="${__formdata.OB_IAX_GARANTIAS.MASDATOS.IPROVT1 }" readonly="true" style="width:60%"
                                                    title="<axis:alt f="axisctr030" c="IPROVT1" lit="9001761"/>"/>
                                                </td>
                                                </axis:ocultar>    
                                                <axis:ocultar f="axisctr030" c="FPROVT1" dejarHueco="false">
                                                <td class="campocaja">
                                                    <input type="text" class="campowidthinput campo campotexto" id="FPROVT1" name="FPROVT1" size="15" 
                                                    <axis:atr f="axisctr030" c="FPROVT1" a="modificable=false"/>
                                                    value="<fmt:formatDate value="${__formdata.OB_IAX_GARANTIAS.MASDATOS.FPROVT1}" pattern="dd/MM/yyyy"/>"
                                                    style="width:60%" title="<axis:alt f="axisctr030" c="FPROVT1" lit="9001762"/>"/>
                                                </td>     
                                                </axis:ocultar>    
                                                <axis:ocultar f="axisctr030" c="CAGENTE" dejarHueco="false">
                                                <td class="campocaja">
                                                    <input type="text" name="CAGENTE" id="CAGENTE" value="${__formdata.OB_IAX_GARANTIAS.MASDATOS.CAGENTE}" class="campowidthinput campo campotexto" style="width:50%"
                                                    <axis:atr f="axisctr030" c="CAGENTE" a="modificable=false"/>/>
                                                </td>
                                                </axis:ocultar>    
                                                <axis:ocultar f="axisctr030" c="PROVAC" dejarHueco="false">
                                                    <td class="campocaja">
                                                        <input type="text" name="PROVAC" id="PROVAC" size="15" value="${__formdata.OB_IAX_GARANTIAS.MASDATOS.PROVMAT}" class="campowidthinput campo campotexto" style="width:60%"
                                                        <axis:atr f="axisctr030" c="PROVAC" a="modificable=false"/>/>
                                                    </td>
                                                </axis:ocultar>
                                                                                                
                                                
                                                <%--
                                                 <td class="campocaja">    
                                                    <input readonly="true" type="text" name="NOMBRE_TEXT" id="NOMBRE_TEXT" value="${__formdata.AXISCTR_AGENTE.NOMBRE}" class="campowidthinput campo campotexto"/>
                                                </td>
                                                --%>
                                           </tr>           
                                        </table>
                                       </td>
                                     </tr>                            
                                </table>                        
                            </td>
                        </tr>
                </c:if>
                
                
                <%-- Fi apartat nou dades   --%>
                <tr>
                    <axis:visible c="DSP_PRIMAS" f="axisctr030">
                    <td>
                        <div class="separador">&nbsp;</div>     
                        <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axisctr030" c="DSP_PRIMAS" lit="1000114"/><axis:visible c="CMONPROD" f="axisctr030">  <c:if test="${!empty CMONPROD}"> <b class="titulocaja" style="color:black"> <axis:alt f="axisctr030" c="CMONPROD" lit="108645"/> :  ${CMONPRODINT} - ${requestScope.TMONPROD}</b> </c:if> </axis:visible></div>
                        <table class="seccion">
                        <!-- Campos -->
                        <div class="separador">&nbsp;</div>        
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
                                        <tr>
                                            <c:if test="${__formdata.OB_IAX_GARANTIAS.TREVALI != null}">
                                                <axis:ocultar f="axisctr030" c="TREVALI" dejarHueco="false">
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axisctr030" c="TREVALI" lit="101432"/></b>
                                                </td>
                                                </axis:ocultar>
                                            </c:if>
                                            <c:if test="${__formdata.OB_IAX_GARANTIAS.PREVALI != null}">
                                                <axis:ocultar f="axisctr030" c="PREVALI" dejarHueco="false">
                                                <td class="titulocaja" colspan="2">
                                                    <b id="valor_revalorizacionLabel"><axis:alt f="axisctr030" c="PREVALI" lit="1000382"/></b>
                                                </td>
                                                </axis:ocultar>
                                            </c:if>
                                        </tr>

                                        <tr>
                                            <c:if test="${__formdata.OB_IAX_GARANTIAS.TREVALI != null}">
                                                <axis:ocultar f="axisctr030" c="TREVALI" dejarHueco="false">
                                                <td class="campocaja">
                                                    <input type="text" class="campowidthinput campo campotexto" id="valor_revalorizacion" name="valor_revalorizacion" 
                                                    size="15" value="${__formdata.OB_IAX_GARANTIAS.TREVALI}" readonly="true"/>
                                                </td>
                                                </axis:ocultar>
                                            </c:if>
                                            <c:if test="${__formdata.OB_IAX_GARANTIAS.PREVALI != null}">
                                                <axis:ocultar f="axisctr030" c="PREVALI" dejarHueco="false">
                                                <td class="campocaja" colspan="2">
                                                    <input type="text" class="campowidthinput campo campotexto" id="valor_revalorizacion" name="valor_revalorizacion" 
                                                    size="15" value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONPRODINT]}' value='${__formdata.OB_IAX_GARANTIAS.PREVALI}'/>" readonly="true"/>
                                                </td>
                                                </axis:ocultar>
                                            </c:if>
                                            </tr>
                                           <tr>
                                               <axis:visible f="axisctr030" c="IPRITAR">
                                               <td class="titulocaja">
                                                    <b><axis:alt f="axisctr030" c="IPRITAR" lit="1000496"/></b> <!-- Prima tarifa = IPRITAR -->
                                                </td>
                                                </axis:visible>
                                                <axis:ocultar f="axisctr030" c="IEXTRAP" dejarHueco="false">
                                                <td class="titulocaja" >
                                                    <b><axis:alt f="axisctr030" c="IEXTRAP" lit="101918"/></b> <!-- Extraprima -->
                                                </td>   
                                                </axis:ocultar>
                                                <axis:visible f="axisctr030" c="IRECARG">
                                                <td class="titulocaja" >
                                                    <b><axis:alt f="axisctr030" c="IRECARG" lit="101671"/></b> <!-- Sobreprima = PRECARG -->
                                                </td>   
                                                </axis:visible>
                                                <axis:visible f="axisctr030" c="ITOTDTO">
                                                 <td class="titulocaja" >
                                                    <b><axis:alt f="axisctr030" c="ITOTDTO" lit="1000119"/></b> <!-- Dto = PDTOCOM -->
                                                </td>
                                                </axis:visible>
                                                <axis:visible f="axisctr030" c="IPRITOT" >
                                                    <td class="titulocaja" >
                                                        <b><axis:alt f="axisctr030" c="IPRITOT" lit="1000497"/></b> <!-- Prima Neta = IPRIANU = IPRITOT -->
                                                    </td>
                                                </axis:visible>
                                            

                                        </tr>
                                        
                                        <tr>
                                            <axis:visible f="axisctr030" c="IPRITAR">
                                                <td class="campocaja">
                                                    <input type="text" class="campowidthinput campo campotexto" id="prima_tarifa" name="prima_tarifa" size="15"
                                                    value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONPRODINT]}' value='${__formdata.OB_IAX_GARANTIAS.PRIMAS.IPRITAR}'/>" readonly="true"/>
                                                </td>  
                                            </axis:visible>
                                            <axis:ocultar f="axisctr030" c="IEXTRAP" dejarHueco="false">
                                                <td class="campocaja"  >
                                                    <input type="text"  class="campowidthinput campo campotexto" id="sobreprima" style="width:30%" name="sobreprima" size="20"
                                                    value="<fmt:formatNumber pattern='###,##0.00####' value='${__formdata.OB_IAX_GARANTIAS.PRIMAS.IEXTRAP}'/>" readonly="true"/>
                                                    &nbsp;&nbsp;
                                                    <input type="text"  class="campowidthinput campo campotexto" id="sobreprima" name="sobreprima" style="width:70%" size="15"
                                                    value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONPRODINT]}' value='${__formdata.OB_IAX_GARANTIAS.PRIMAS.IIEXTRAP}'/>" readonly="true"/>
                                                </td>
                                            </axis:ocultar>
                                            <axis:visible f="axisctr030" c="IRECARG">
                                                <td class="campocaja">
                                                    <input type="text"  class="campowidthinput campo campotexto" id="sobreprima" style="width:20%" name="sobreprima" size="15"
                                                    value="${__formdata.OB_IAX_GARANTIAS.PRIMAS.PRECARG} %" readonly="true"/>
                                                    &nbsp;&nbsp;
                                                    <input type="text"  class="campowidthinput campo campotexto" id="sobreprima" name="sobreprima" size="15" style="width:70%"
                                                    value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONPRODINT]}' value='${__formdata.OB_IAX_GARANTIAS.PRIMAS.IRECARG}'/>" readonly="true"/>
                                                </td>
                                            </axis:visible>
                                            <axis:visible f="axisctr030" c="ITOTDTO">
                                                <td class="campocaja"  >
                                                    <input type="text" class="campowidthinput campo campotexto" id="dto" name="dto" style="width:20%" size="15"
                                                    value="${__formdata.OB_IAX_GARANTIAS.PRIMAS.PDTOCOM} %" readonly="true"/>
                                                     &nbsp;&nbsp;
                                                    <input type="text" class="campowidthinput campo campotexto" id="dto" name="dto" size="15" style="width:70%"
                                                    value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONPRODINT]}' value='${__formdata.OB_IAX_GARANTIAS.PRIMAS.ITOTDTO}'/>" readonly="true"/>
                                                </td>
                                            </axis:visible>
                                            <axis:visible f="axisctr030" c="IPRITOT">
                                            <td class="campocaja" >
                                                <input type="text" class="campowidthinput campo campotexto" id="prima_neta" name="prima_neta" size="15"
                                                value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONPRODINT]}' value='${__formdata.OB_IAX_GARANTIAS.PRIMAS.IPRITOT}'/>" readonly="true"/>
                                            </td>
                                            </axis:visible>
                                            
    
                                        </tr>
                                        
                                        
                                        
                                         <tr>
                                            
                                            <axis:ocultar f="axisctr030" c="IARBITR"  dejarHueco="false">
                                            <td class="titulocaja">
                                                <b><axis:alt f="axisctr030" c="IARBITR" lit="101705"/></b><!-- IARBRIT -->
                                            </td>
                                            </axis:ocultar>
                                            <axis:ocultar f="axisctr030" c="ICDERREG" dejarHueco="false">
                                            <td class="titulocaja">
                                                <b><axis:alt f="axisctr030" c="ICDERREG" lit="9001509"/></b> <!-- ICDERREG -->
                                            </td>
                                            </axis:ocultar>
                                          
                                        
                                        </tr>
                                            
                                        <tr>
                                           
                                            <axis:ocultar f="axisctr030" c="IARBITR"  dejarHueco="false">
                                            <td class="campocaja">
                                                <input type="text" class="campowidthinput campo campotexto" id="IARBITR" name="IARBITR" size="15"
                                                value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONPRODINT]}' value='${__formdata.OB_IAX_GARANTIAS.PRIMAS.IARBITR}'/>" readonly="true"/>
                                            </td>
                                            </axis:ocultar>
                                            <axis:ocultar f="axisctr030" c="ICDERREG"  dejarHueco="false">
                                            <td class="campocaja">
                                                <input type="text" class="campowidthinput campo campotexto" id="ICDERREG" name="ICDERREG" size="15"
                                                value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONPRODINT]}' value='${__formdata.OB_IAX_GARANTIAS.PRIMAS.ICDERREG}'/>" readonly="true"/>
                                            </td>
                                            </axis:ocultar>
                                            
                                        </tr>
                                        

                                        </table>
                                         <table class="area" align="center">
                                         <tr>
                                            <th style="width:20%;height:0px"></th>
                                            <th style="width:20%;height:0px"></th>
                                            <th style="width:20%;height:0px"></th>
                                            <th style="width:20%;height:0px"></th>
                                            <th style="width:20%;height:0px"></th>
                                        </tr>
                                        <tr>
                                        <axis:visible f="axisctr030" c="IRECFRA">
                                            <td class="titulocaja">
                                                <b><axis:alt f="axisctr030" c="IRECFRA" lit="1000341"/></b>   <!-- Rec = IRECFRA  -->
                                            </td>
                                        </axis:visible>
                                        <axis:visible f="axisctr030" c="ICONSOR">
                                            <td class="titulocaja">
                                                <b><axis:alt f="axisctr030" c="ICONSOR" lit="103101"/></b> <!-- Cons = ICONSOR -->
                                            </td>
                                        </axis:visible>
                                        <axis:visible f="axisctr030" c="IDGS">
                                            <td class="titulocaja">
                                                <b><axis:alt c="IDGS" f="axisctr030" lit="1000498"/></b> <!-- Imp.clea = IDGS -->
                                            </td>                                
                                        </axis:visible>
                                        <axis:visible f="axisctr030" c="IIPS">
                                            <td class="titulocaja">
                                                <b><axis:alt f="axisctr030" c="IIPS" lit="101515"/></b>  <!-- IPS = IIPS -->
                                            </td>
                                        </axis:visible>
                                        <axis:visible f="axisctr030" c="ITOTALR">
                                            <td class="titulocaja">
                                                <b><axis:alt f="axisctr030" c="ITOTALR" lit="140531"/></b> <!-- Prima recibo = ITOTALR -->
                                            </td>
                                        </axis:visible>
                                        
                                          <axis:visible f="axisctr030" c="ITOTANU">
                                            <td class="titulocaja">
                                                <b><axis:alt f="axisctr030" c="ITOTANU" lit="9902047"/></b> <!-- Prima Total Anual -->
                                            </td>
                                        </axis:visible>
                                        
                                        </tr>
                                        <tr>
                                        <axis:visible f="axisctr030" c="IRECFRA">
                                            <td class="campocaja">
                                                <input type="text" class="campowidthinput campo campotexto" id="rec" name="rec" size="15"
                                                value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONPRODINT]}' value='${__formdata.OB_IAX_GARANTIAS.PRIMAS.IRECFRA}'/>" readonly="true"/>
                                            </td>  
                                        </axis:visible>
                                        <axis:visible f="axisctr030" c="ICONSOR">
                                            <td class="campocaja" >
                                                <input type="text" class="campowidthinput campo campotexto" id="cons" name="cons" size="15"
                                                value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONPRODINT]}' value='${__formdata.OB_IAX_GARANTIAS.PRIMAS.ICONSOR}'/>" readonly="true"/>
                                            </td>
                                        </axis:visible>
                                        <axis:visible f="axisctr030" c="IDGS">
                                            <td class="campocaja" >
                                                <input type="text" class="campowidthinput campo campotexto" id="clea" name="clea" size="15"
                                                value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONPRODINT]}' value='${__formdata.OB_IAX_GARANTIAS.PRIMAS.IDGS}'/>" readonly="true"/>
                                            </td>      
                                        </axis:visible>
                                        <axis:visible f="axisctr030" c="IIPS">
                                            <td class="campocaja">
                                                <input type="text" class="campowidthinput campo campotexto" id="ips" name="ips" size="15"
                                                value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONPRODINT]}' value='${__formdata.OB_IAX_GARANTIAS.PRIMAS.IIPS}'/>" readonly="true"/>
                                            </td>
                                        </axis:visible>
                                        <axis:visible f="axisctr030" c="ITOTALR">
                                            <td class="campocaja">
                                                <input type="text" class="campowidthinput campo campotexto" id="prima_total" name="prima_total" size="15"
                                                value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONPRODINT]}' value='${__formdata.OB_IAX_GARANTIAS.PRIMAS.ITOTALR}'/>" readonly="true"/>
                                            </td>       
                                        </axis:visible>
                                        
                                         <axis:visible f="axisctr030" c="ITOTANU">
                                            <td class="campocaja">
                                                <input type="text" class="campowidthinput campo campotexto" id="prima_total" name="prima_total" size="15"
                                                value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONPRODINT]}' value='${__formdata.OB_IAX_GARANTIAS.PRIMAS.ITOTANU}'/>" readonly="true"/>
                                            </td>       
                                        </axis:visible>

                                        </tr>
                                        
                                         </tr>
                                         <!--etm ini-->
                                                         <tr>
                                                     <axis:visible f="axisctr030" c="PDTOTEC" >
                                                        <td class="titulocaja">
                                                            <b id="label_PDTOTEC"><axis:alt f="axisctr030" c="LIT_9903609" lit="9903609" /></b>
                                                        </td>
                                                    </axis:visible> 
                                                   
                                                         <axis:visible f="axisctr030" c="IDTOTEC" >
                                                        <td class="titulocaja">
                                                            <b id="label_IDTOTEC"><axis:alt f="axisctr030" c="LIT_9903664" lit="9903664" /></b>
                                                        </td>
                                                    </axis:visible> 
                                                        <axis:visible f="axisctr030" c="PRECCOM" >
                                                            <td class="titulocaja">
                                                                <b id="label_PRECCOM"><axis:alt f="axisctr030" c="LIT_9903608" lit="9903608" /></b>
                                                            </td>
                                                        </axis:visible>
                                                        
                                                         <axis:visible f="axisctr030" c="IRECCOM" >
                                                        <td class="titulocaja">
                                                            <b id="label_IRECCOM"><axis:alt f="axisctr030" c="LIT_9903665" lit="9903665" /></b>
                                                        </td>
                                                    </axis:visible> 
                                                     </tr>   
                                                     
                                                    <tr>
                                                    <axis:visible f="axisctr030" c="PDTOTEC" >
                                                        <td class="campocaja">
                                                            <input type="text" style="width:85%"  class="campowidth campo campotexto" id="PDTOTEC" name="PDTOTEC" onchange=""
                                                            title="<axis:alt f="axisctr030" c="LIT_9903609" lit="9903609"/>" size="15" value ="<fmt:formatNumber pattern="###,##0.00" value='${__formdata.OB_IAX_GARANTIAS.PRIMAS.PDTOTEC}'/>"
                                                            <axis:atr f="axisctr030" c="PDTOTEC" a="modificable=false&formato=decimal"/>/>&nbsp;
                                                        </td>
                                                    </axis:visible>
                                                       <axis:visible f="axisctr030" c="IDTOTEC" >
                                                        <td class="campocaja">
                                                            <input type="text" style="width:85%"  class="campowidth campo campotexto" id="IDTOTEC" name="IDTOTEC" onchange=""
                                                            title="<axis:alt f="axisctr030" c="LIT_9903664" lit="9903664"/>" size="15" value ="<fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value='${__formdata.OB_IAX_GARANTIAS.PRIMAS.IDTOTEC}'/>" readonly="true"
                                                            <axis:atr f="axisctr030" c="IDTOTEC" a="modificable=false&formato=decimal"/>/>&nbsp;
                                                           
                                                        </td>
                                                    </axis:visible>
                                                    
                                                      <axis:visible f="axisctr030" c="PRECCOM" >
                                                        <td class="campocaja">
                                                                 <input type="text" style="width:85%"  class="campowidth campo campotexto" id="PRECCOM" name="PRECCOM" onchange=""
                                                            title="<axis:alt f="axisctr030" c="LIT_9903608" lit="9903608"/>" size="15" value ="<fmt:formatNumber pattern="###,##0.00" value='${__formdata.OB_IAX_GARANTIAS.PRIMAS.PRECCOM}'/>"
                                                            <axis:atr f="axisctr030" c="PRECCOM" a="modificable=false&formato=decimal"/>/>&nbsp;
                                                       </td>
                                                    </axis:visible>
                                                     <axis:visible f="axisctr030" c="IRECCOM" >
                                                        <td class="campocaja">
                                                                 <input type="text" style="width:85%"  class="campowidth campo campotexto" id="IRECCOM" name="IRECCOM" onchange=""
                                                            title="<axis:alt f="axisctr030" c="LIT_9903665" lit="9903665"/>" size="15" value ="<fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value='${__formdata.OB_IAX_GARANTIAS.PRIMAS.IRECCOM}'/>" readonly="true"
                                                            <axis:atr f="axisctr030" c="IRECCOM" a="modificable=false&formato=decimal"/>/>&nbsp;
                                                       </td>
                                                    </axis:visible>
                                                    </tr>
                                                     <!--etm fin--> 
                                        
                                       <%-- <tr>

                                            <td class="titulocaja">
                                                <b><axis:alt f="axisctr030" c="IEXTRAP" lit="101918" /></b> <!-- Extraprima = IEXTRAP -->
                                            </td>

                                        </tr>
                                        <tr>

                                            <td class="campocaja">
                                                <input type="text" class="campowidthinput campo campotexto" id="extraprima" name="extraprima" size="15"
                                                value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONPRODINT]}' value='${__formdata.OB_IAX_GARANTIAS.PRIMAS.IEXTRAP}'/>" readonly="true"/>
                                            </td>

                                        </tr>--%>
                                        
                                        
                                        <!-- **************************************** Table desglose tarifa *************************************  -->
                                        <axis:visible  f="axisctr030" c="DSP_DETPRIMAS">
                                            <tr>
                                                <td class="campocaja titulocampo"> 
                                                    <b><axis:alt f="axisctr030" c="LIT_IPRITAR" lit="9903544" /></b> <!-- Tabla Corr. -->
                                                </td>
                                            </tr>
                                            <tr>
                                              <td colspan="3">
                                              <!--div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axisctr030" c="IMG_TITULO_DESPLEGA" lit="9903544"/></div-->
                                
                                                <c:set var="title1"><axis:alt f="axisctr030" c="CORRTARIFA" lit="9903545" /></c:set><!-- Corrector de tarifa -->
                                                <c:set var="title2"><axis:alt f="axisctr030" c="VALOR" lit="101159" /></c:set><!-- valor -->
                                                
                                                <div class="displayspace">
                                                  <display:table name="${DETPRIMAS}" id="DETPRIMAS" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0" 
                                                   requestURI="axis_axisctr011.do?paginar=true">
                                                    <%@ include file="../include/displaytag.jsp"%>
                                                    
                                                                   
                                                    <display:column title="${title1}" sortable="true" sortProperty="npoliza" headerClass="sortable fixed" media="html" autolink="false" >
                                                        <div class="dspText">${DETPRIMAS.OB_IAX_DETPRIMAS.TCONCEP}</div>
                                                    </display:column>  
                                                   
                                                    <display:column title="${title2}" sortable="true" sortProperty="titpro" headerClass="sortable fixed" media="html" autolink="false" >
                                                        <div class="dspText">
                                                        <input type="text" class="campowidthinput campo campotexto campodisabled" id="valorcorr" name="valorcorr" size="15"
                                                        value="<fmt:formatNumber pattern='${DETPRIMAS.OB_IAX_DETPRIMAS.PDECVIS}' value='${DETPRIMAS.OB_IAX_DETPRIMAS.ICONCEP}'/>" readonly="true"/>
                                                    </display:column> 
                                                                   
                                                </display:table>
                                                </div>
                                              
                                              </td>
                                            </tr>
                                        </axis:visible>
                                        <!-- **************************************** Fin tabla desg. tarifa ************************************  -->
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </td>
                    </axis:visible>
                </tr>
            </table>
            <c:import url="axisctr030_franquicias.jsp"/>
                                </td>
                            </tr>
                            
                        </table>
                    </td>
                </tr>
            </table>

            <c:import url="../include/botonera_nt.jsp">
                <c:param name="f">axisctr030</c:param>
                <c:param name="__botones">cancelar</c:param>
            </c:import>
            <c:import url="../include/mensajes.jsp" />
        </form>
      </div>
    </body>
</html>
