<%/* Revision:# 6Lg1fjFFTc1A4ehrVi6c5A== # */%>
<%-- CONSULTA CUENTAS COASEGURO--%>
<%@ page contentType="text/html;charset=iso-8859-15"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <link rel="stylesheet" href="styles/genericosHtml.css" type="text/css"></link>
    <link rel="stylesheet" href="styles/axisnt.css" type="text/css"></link>
    <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>
    <link rel="StyleSheet" href="styles/tree.css" type="text/css"></link>
    <link rel="stylesheet" type="text/css" media="all"
          href="styles/calendar-green.css" title="green"/>
    <script type="text/javascript" src="scripts/calendar.js"></script>
    <script type="text/javascript"
            src="scripts/calendar-${sessionScope.__locale}.js"></script>
    <script type="text/javascript" src="scripts/calendar-setup.js"></script>
    <c:import url="../include/carga_framework_js.jsp"/>
    <script type="text/javascript">
        function f_but_cancelar() {
           parent.f_cerrar_axiscoa005();
        }
        
        function f_seleccionar(identificador) {
            var s = identificador.split("|");
            //Si no tiene informado el campo FCIERRE no podemos pasar a la axiscoa002
         //   if(objUtiles.estaVacio(s[4])){
         //       alert("<axis:alt f="axiscoa005" c="ERRORFCIERRE" lit="9906426"/>");
         //   }else{
               document.miForm.identificador.value = identificador;
                objUtiles.ejecutarFormulario ("axis_axiscoa002.do", "recuperar", document.miForm, "_self", objJsMessages.jslit_cargando); 
         //   }
        }
       
        function f_but_aceptar() {
            var identificador=null;
            try {
            var total=document.miForm.totalx.value;
            
            for(var j=0;j<total;j++){
                    var valor = eval("document.miForm.selCta_"+j+".checked");
                    var obtenido = valor?"1":"0";
                    if(obtenido=='1'){
                       identificador=eval("document.miForm.selCta_"+j+".value");
                    }
            }
            
            }catch(Exception){}           
            if (identificador!=undefined&&identificador!=null) {
                f_seleccionar(identificador);
            } 
            else {
                alert("<axis:alt f="axiscoa005" c="ERRORSINMARCAR" lit="9000505"/>");
            }
        }
        
        function f_onload() {
            f_cargar_propiedades_pantalla();
        }

    </script>
  </head>
  <body onunload="try { f_clear_resources(document.body) } catch (e) {}"
        onload="f_onload()"><c:import url="../include/precargador_ajax.jsp">
      <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import><form name="miForm" action="modal_axiscoa005.do" method="POST">
      <c:import url="../include/titulo_nt.jsp">
        <c:param name="titulo">
          <axis:alt f="axiscoa005" c="TITULO" lit="CONSULTA CUENTAS COASEGURO"/>
        </c:param>
        <c:param name="formulario">
          <axis:alt f="axiscoa005" c="TITULO" lit="CONSULTA CUENTAS COASEGURO"/>
        </c:param>
        <c:param name="form">axiscoa005</c:param>
      </c:import>
      <input type="hidden" id="operation" name="operation" value=""/>
      <input type="hidden" id="filtros" name="filtros" value="${__formdata.filtros}"/>
      <input type="hidden" id="identificadorFila001" name="identificadorFila001" value="${__formdata.identificador}"/>
      <input type="hidden" id="identificador" name="identificador" value="${__formdata.identificador}"/>
      
      <table class="mainTableDimensions base" align="center" cellpadding="0"
             cellspacing="3">
        <tr>
          <td>
            <div class="separador">&nbsp;</div>
            <table class="seccion">
              <tr>
                <td class="titulocaja" colspan="5">
                  <div class="separador">&nbsp;</div>
                  <div class="displayspaceGrande">

                    <c:set var="title0">
                      <axis:alt f="axiscoa005" c="EMPRESA" lit="101619"/>
                    </c:set>
                     
                    <c:set var="title1">
                      <axis:alt f="axiscoa005" c="COASEGURADORA"
                                lit="9904160"/>
                    </c:set>
                     
                     <c:set var="title2">
                      <axis:alt f="axiscoa001" c="RAMO" lit="100784"/>
                    </c:set>
                     
                    <c:set var="title3">
                      <axis:alt f="axiscoa001" c="PRODUCTO" lit="9902909"/>
                    </c:set>
                     
                    <c:set var="title4">
                      <axis:alt f="axiscoa005" c="FECHACIERRE" lit="9000490"/>
                    </c:set>
                    
                    <c:set var="title5">
                      <axis:alt f="axiscoa001" c="POLIZA" lit="9001639"/>
                    </c:set>
                    
                    <c:set var="title6">
                      <axis:alt f="axiscoa005" c="TIPOCOASEGURO" lit="9902935"/>
                    </c:set>
                                         
                     
                    <c:set var="title7">
                      <axis:alt f="axiscoa005" c="MONEDA" lit="108645"/>
                    </c:set>
                    
                    <c:set var="title8">
                      <axis:alt f="axiscoa005" c="ISALDO" lit="104910"/>
                    </c:set>
                      <% int x = 0; %>   
                      <% int sumatorio = 1; %>   
                      <c:set var="total1A">0</c:set>
                      <c:set var="total2A">0</c:set>
					  <c:set var="total3A">0</c:set>
                      <c:set var="total4A">0</c:set>
                     <%--${CTACOASEGURO}--%>
                    <display:table name="${CTACOASEGURO}"
                                   id="CTACOASEGURO" export="false"
                                   class="dsptgtable" pagesize="-1"
                                   defaultsort="1" defaultorder="ascending"
                                   sort="list" cellpadding="0" cellspacing="0"
                                   requestURI="modal_axiscoa005.do?paginar=true">
                      <%@ include file="../include/displaytag.jsp"%>
                      <c:set var="IDENTIFICADOR">${CTACOASEGURO.CEMPRES}|${CTACOASEGURO.CCOMPAPR}|${CTACOASEGURO.CCOMPANI}|${CTACOASEGURO.SSEGURO}|<fmt:formatDate pattern="dd/MM/yyyy" value="${CTACOASEGURO.FCIERRE}"/>|${CTACOASEGURO.ES_LIQUIDABLE}|${CTACOASEGURO.TMONEDA}</c:set><%-- CEMPRES|CCOMPANI|SSEGURO|FCIERRE|ES_LIQUIDABLE --%>
                      

                        <display:column title="" sortable="false"
                                      headerClass="sortable headwidth5 fixed"
                                      media="html" autolink="false">
                        <div class="dspIcons">
                          <input type="radio" name="selCta" id="selCta_<%=x%>"
                                 value="${IDENTIFICADOR}"/>                      
                        </div>
                      </display:column>

                      <display:column title="${title0}" sortable="true"
                                      sortProperty="TEMPRES"
                                      headerClass="sortable fixed" media="html"
                                      autolink="false">
                        <div class="dspText">
                          <span style="text-decoration:underline;cursor:pointer"
                                onclick="f_seleccionar('${IDENTIFICADOR}' )">
                            ${CTACOASEGURO.TEMPRES}
                          </span>
                        </div>
                      </display:column>
                      <display:column title="${title1}" sortable="true"
                                      sortProperty="TCOMPANI"
                                      headerClass="sortable fixed" media="html"
                                      autolink="false">
                        <div class="dspText">
                          <span style="text-decoration:underline;cursor:pointer"
                                onclick="f_seleccionar('${IDENTIFICADOR}')">
                            ${CTACOASEGURO.TCOMPANI}
                          </span>
                        </div>
                      </display:column>
                      <display:column title="${title2}" sortable="true"
                                      sortProperty="TRAMO"
                                      headerClass="sortable fixed" media="html"
                                      autolink="false">
                        <div class="dspText">
                          ${CTACOASEGURO.TRAMO}
                        </div>
                      </display:column>
                      <display:column title="${title3}" sortable="true" style="width:20%"
                                      sortProperty="TPRODUC"
                                      headerClass="sortable fixed" media="html"
                                      autolink="false">
                        <div class="dspText">
                          <span style="text-decoration:underline;cursor:pointer"
                                onclick="f_seleccionar('${IDENTIFICADOR}')">
                            ${CTACOASEGURO.TPRODUC}
                          </span>
                        </div>
                      </display:column>
                      <display:column title="${title4}" sortable="true"
                                      sortProperty="FCIERRE"
                                      headerClass="sortable fixed" media="html"
                                      autolink="false">
                        <div class="dspText">
                          <fmt:formatDate value="${CTACOASEGURO.FCIERRE}"
                                          pattern="dd/MM/yyyy"/>
                        </div>
                      </display:column>
                      <display:column title="${title5}" sortable="true"
                                      sortProperty="POLIZA"
                                      headerClass="sortable fixed" media="html"
                                      autolink="false">
                        <div class="dspText">
                          ${CTACOASEGURO.POLIZA}
                        </div>
                      </display:column>
                      <display:column title="${title6}" sortable="true"
                                      sortProperty="TTIPCOA"
                                      headerClass="sortable fixed" media="html"
                                      autolink="false">
                        <div class="dspText">
                          <span style="text-decoration:underline;cursor:pointer"
                                onclick="f_seleccionar('${IDENTIFICADOR}')">
                            ${CTACOASEGURO.TTIPCOA}
                          </span>
                        </div>
                      </display:column>
                      <display:column title="${title7}" sortable="true"
                                      sortProperty="TMONEDA"
                                      headerClass="sortable fixed" media="html"
                                      autolink="false">
                        <div class="dspText">
                          ${CTACOASEGURO.TMONEDA}
                        </div>
                        </display:column>
                        <display:column title="${title8}" sortable="true"
                                      sortProperty="ISALDO"
                                      headerClass="sortable fixed" media="html"
                                      autolink="false">
                        <div class="dspNumber" style="width:80%">
							<c:choose>
								<c:when test="${CTACOASEGURO.TMONEDA == 'CLP' || CTACOASEGURO.TMONEDA == 'UF'}">
									<fmt:formatNumber value="${CTACOASEGURO.ISALDO}" pattern="#,##0.000000"/>  
								</c:when>    
								<c:otherwise>
									<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${CTACOASEGURO.ISALDO}"/>
								</c:otherwise>
							</c:choose>
                        </div>
                      </display:column>
                        <% x=x+sumatorio; %>
                    <c:set var="total"><%=x%></c:set>
                        <c:if test="${CTACOASEGURO.TMONEDA == 'USD' }">
                            <c:set var="total1A">${total1A + CTACOASEGURO.ISALDO}</c:set>
                         </c:if>                                                     
                         <c:if test="${CTACOASEGURO.TMONEDA == 'COP'}">
                            <c:set var="total2A">${total2A + CTACOASEGURO.ISALDO}</c:set>
                         </c:if>
						   <c:if test="${CTACOASEGURO.TMONEDA == 'CLP'}">
                            <c:set var="total3A">${total3A + CTACOASEGURO.ISALDO}</c:set>
                         </c:if>
						  <c:if test="${CTACOASEGURO.TMONEDA == 'UF'}">
                            <c:set var="total4A">${total4A + CTACOASEGURO.ISALDO}</c:set>
                         </c:if>
                    </display:table>
                    
                    <input type="hidden" name="totalx" id="totalx"  value="${total}" />
                  </div>
                  
                  <table cellpadding="0" class="dsptgtable grid" style="width:98%" cellspacing="0"><tbody>
				  <axis:ocultar f="axiscoa005" c="SALDOUSD">
                    <tr class="gridEven">
                    <td style="width:5%"></td>
                    <td style="width:10%"></td>
                    <td style="width:10%"></td>
                    <td style="width:10%"></td>
                    <td style="width:10%"></td>
                    <td style="width:5%"></td>
                    <td style="width:10%"></td>
                    <td style="width:10%"> <b><axis:alt f="axiscoa005" c="SALDO_USD" lit="9905029"/></b></td>
                    <td style="width:10%"><div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${total1A}"/></td>
                    </td></tr>
					</axis:ocultar>
					<axis:ocultar f="axiscoa005" c="SALDOCOP">
                    <tr class="gridEven">
                    <td style="width:5%"></td>
                    <td style="width:10%"></td>
                    <td style="width:10%"></td>
                    <td style="width:10%"></td>
                    <td style="width:10%"></td>
                    <td style="width:5%"></td>
                    <td style="width:10%"></td>
                    <td style="width:10%"> <b><axis:alt f="axiscoa005" c="SALDO_COP" lit="9905030"/></b>  </td>
                    <td style="width:10%"><div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${total2A}"/></td>
                    </td></tr>
					</axis:ocultar>
					<axis:ocultar f="axiscoa005" c="SALDOCLP">
					 <tr class="gridEven">
                    <td style="width:5%"></td>
                    <td style="width:10%"></td>
                    <td style="width:10%"></td>
                    <td style="width:10%"></td>
                    <td style="width:10%"></td>
                    <td style="width:5%"></td>
                    <td style="width:10%"></td>
                    <td style="width:10%"> <b><axis:alt f="axiscoa001" c="SALDO_CLP" lit="9908248"/></b>  </td>
                    <td style="width:10%"><div class="dspNumber"><fmt:formatNumber value="${total3A}" pattern="#,##0.000000"/></td>
                    </td></tr>
					</axis:ocultar>
					<axis:ocultar f="axiscoa005" c="SALDOUF">
						 <tr class="gridEven">
                    <td style="width:5%"></td>
                    <td style="width:10%"></td>
                    <td style="width:10%"></td>
                    <td style="width:10%"></td>
                    <td style="width:10%"></td>
                    <td style="width:5%"></td>
                    <td style="width:10%"></td>
                    <td style="width:10%"> <b><axis:alt f="axiscoa001" c="SALDO_UF" lit="9908249"/></b>  </td>
                    <td style="width:10%"><div class="dspNumber"><fmt:formatNumber value="${total4A}" pattern="#,##0.000000"/></td>
                    </td></tr>
					</axis:ocultar>
                    </tbody></table> 
                  
                  <div class="separador">&nbsp;</div>
                </td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
      <c:import url="../include/botonera_nt.jsp">
        <c:param name="f">axiscoa005</c:param>
        <c:param name="__botones">cancelar,aceptar</c:param>
      </c:import>
      <div class="separador">&nbsp;</div>
    </form><c:import url="../include/mensajes.jsp"/><script type="text/javascript">
        Calendar.setup({
            inputField     :    "FCIERRE",     
            ifFormat       :    "%d/%m/%Y",      
            button         :    "icon_FCIERRE", 
            singleClick    :    true,
            firstDay       :    1
        });
   </script></body>
</html>