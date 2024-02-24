<%/* Revision:# 6Lg1fjFFTc1A4ehrVi6c5A== # */%>
<%-- 
NOMBRE: axislist006.jsp 
Fecha: 04/01/2011 
PROPÓSITO (descripción pantalla):
Ejemplo : http://mantis.srvcsi.com/view.php?id=27005#c145378 Listado de reports que se ha pedido por batch 
REVISIONES: 
Ver       Fecha      Autor           Descripción
--------- ---------- --------------- ------------------------------------
1.0                                  ECG        Version inical
--%>
<%@ page contentType="text/html;charset=windows-1252"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page import="axis.util.Constantes, java.util.*"%>
<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
      <head>
            <title></title>
            <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
            <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
            <link rel="stylesheet" href="styles/displaytag.css"></link>
            <c:import url="../include/carga_framework_js.jsp"/>
            <link rel="stylesheet" type="text/css" media="all" href="styles/calendar-green.css" title="green"/>
            <script type="text/javascript" src="scripts/calendar.js"></script>
            <script type="text/javascript" src="scripts/calendar-${sessionScope.__locale}.js"></script>
            <script type="text/javascript" src="scripts/calendar-setup.js"></script>
            <script type="text/javascript">
function f_but_buscar() {
    if (objValidador.validaEntrada()){
        objUtiles.ejecutarFormulario("axis_axislist006.do", "buscar", document.miForm, "_self", '<axis:alt f="axislist006" c="MSG_CARGAR" lit="1000166"/>');   
    }
}

function f_cerrar_axisimprimir() {
    objUtiles.cerrarModal("axisimprimir");
}

function f_imprimir_fitxer(str){ 
     var str2 = str.replace(/barrainvertida/gi, "\\");    
    objUtiles.abrirModal("axisimprimir", "src", "modal_axisimprimir.do?operation=tunnel&file="+escape(str2)+"&origen=axislist006.jsp",600,200);
}  



function f_onload(){
    f_cargar_propiedades_pantalla();//Función que nos carga todas las propiedades de pantalla
}

function f_but_salir() {
    objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axislist006", "cancelar", document.miForm, "_self");
}

        </script>
      </head>
      <body onload="f_onload()" onkeypress="if (event.keyCode==13)  { f_but_buscar() }">
<c:import url="../include/precargador_ajax.jsp">
    <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
</c:import>
            <form name="miForm" action="" method="POST">
                  <input type="hidden" name="operation" value=""/>
                  <!--<input type="hidden" id="CUSER" name="CUSER"  value="${__formdata.CUSER}"/>-->

<c:import url="../include/titulo_nt.jsp">
	<c:param name="titulo"><b><axis:alt f="axislist006" c="TITULO_FORM" lit="9905674"/></b></c:param>
	<c:param name="formulario"><b><axis:alt f="axislist006" c="TITULO_FORM" lit="9905674"/></b></c:param>
	<c:param name="form">axislist006</c:param>
</c:import>
<c:import url="../include/modal_estandar.jsp">
    <c:param name="nid_y_titulo">axisimprimir|<axis:alt f="axislist006" c="TIT_AXISIMPRIMIR" lit="1000205"/>|true</c:param>
</c:import>
                  <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0"  style="height:20px">
                        <tr>
                              <td>
								<div class="titulo"><img src="images/flecha.gif"/><b><axis:alt f="axislist006" c="TIT_FILTRO" lit="1000178"/></b></div>

								<table class="seccion"><tr><td>

								  <table class="area" align="center" >
										<tr>
											  <th style="width:20%;height:0px"></th>
											  <th style="width:20%;height:0px"></th>
											  <th style="width:20%;height:0px"></th>
											  <th style="width:10%;height:0px"></th>
											  <th style="width:10%;height:0px"></th>
                                              <th style="width:20%;height:0px"></th>
										</tr>
										<tr>
											  <axis:ocultar f="axislist006" c="CEMPRES">
													<td class="titulocaja" id="tit_CEMPRES">
														  <b label="label_CEMPRES"><axis:alt f="axislist006" c="CEMPRES" lit="101619"/></b>
													</td>
											  </axis:ocultar>
											  <axis:ocultar f="axislist006" c="CMAP">
													<td class="titulocaja">
														  <b id="label_CMAP"><axis:alt f="axislist006" c="CMAP" lit="9901582"/></b>
													</td>
											  </axis:ocultar>
											  <axis:ocultar f="axislist006" c="CESTADO">
													<td class="titulocaja">
														  <b id="label_CESTADO"><axis:alt f="axislist006" c="CESTADO" lit="100587"/></b>
													</td>
											  </axis:ocultar>
											  <axis:ocultar f="axislist006" c="FINI">
													<td class="titulocaja">
														  <b id="label_FINI"><axis:alt f="axislist006" c="FINI" lit="104095"/></b>
													</td>
											  </axis:ocultar>
											  <axis:ocultar f="axislist006" c="FFIN">
													<td class="titulocaja">
														  <b id="label_FFIN"><axis:alt f="axislist006" c="FFIN" lit="103051"/></b>
													</td>
											  </axis:ocultar>
  
											  <axis:ocultar f="axislist006" c="CBATCH">
													<td class="titulocaja">
														  <b id="label_CBATCH"><axis:alt f="axislist006" c="CBATCH" lit="9905675"/></b>
													</td>
											  </axis:ocultar>                                                     
										</tr>

										<tr>
											  <axis:ocultar f="axislist006"
															c="CEMPRES">
													<td class="campocaja">
														  <select name="CEMPRES" id="CEMPRES"  class="campowidthinput campo campotexto" title='<axis:alt f="axislist006" c="CEMPRES" lit="101619"/>' <axis:atr f="axislist006" c="CEMPRES" a="modificable=true&isInputText=false"/>>
																<option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axislist006" c="SNV_COMBO" lit="108341"/> - </option>
																<c:forEach var="empresas" items="${EMPRESAS}">
																	  <option value="${empresas.CEMPRES}" <c:if test="${(!empty __formdata.CEMPRES)&& empresas.CEMPRES == __formdata.CEMPRES}"> selected </c:if>>${empresas.TEMPRES}</option>
																</c:forEach>
														  </select>
													</td>
											  </axis:ocultar>
											  <axis:ocultar f="axislist006" c="CMAP">
													<td class="campocaja">
														  <input type="text" class="campo campotexto" value="${__formdata.CMAP}" name="CMAP" id="CMAP" <axis:atr f="axislist006" c="CMAP"  a="modificable=true&isInputText=true"/>/>
													</td>
											  </axis:ocultar>
											  <axis:ocultar f="axislist006"
															c="CESTADO">
													<td class="campocaja">
																											
														  <select name="CESTADO"  id="CESTADO" class="campowidthinput campo campotexto" title='<axis:alt f="axislist006" c="CESTADO" lit="100587"/>' <axis:atr f="axislist006" c="CESTADO" a="modificable=true&isInputText=false"/>>
                                                           <!-- Seleccionar-->
																<option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axislist006" c="SNV_COMBO" lit="108341"/> -
																</option>
                                                                <!-- Finalizado y OK -->
                                                                <option value="0" <c:if test="${(!empty __formdata.CESTADO)&& 0 == __formdata.CESTADO}"> selected </c:if>>
																<axis:alt f="axislist006" c="CESTADO_0" lit="9901094"/>
																</option>
																<!-- Procesando -->
                                                                 <option value="1" <c:if test="${(!empty __formdata.CESTADO)&& 1 == __formdata.CESTADO}"> selected </c:if>>
																<axis:alt f="axislist006" c="CESTADO_1" lit="9905454"/>
																</option>
																<!-- Procesando -->
																<option value="99" <c:if test="${(!empty __formdata.CESTADO)&& 99 == __formdata.CESTADO}"> selected </c:if>>
																<axis:alt f="axislist006" c="CESTADO_99" lit="108953"/>
																</option>																																
														  </select>
													</td>
											  </axis:ocultar>
											  <axis:ocultar f="axislist006" c="FINI">
													<td class="campocaja">
														  <input type="text" class="campowidthinput campo campotexto" size="10" value='<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FINI}"/>' name="FINI" id="FINI" style="width:60px;" <axis:atr f="axislist006" c="FINI" a="modificable=true&formato=fecha"/> title='<axis:alt f="axislist006" c="FINI" lit="104095"/>'/><img id="SEL_FINI" src="images/calendar.gif"/>
													</td>
											  </axis:ocultar>
											  <axis:ocultar f="axislist006" c="FFIN">
													<td class="campocaja">
														  <input type="text" class="campowidthinput campo campotexto" size="10"
																 value='<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FFIN}"/>'
																 name="FFIN"
																 id="FFIN"
																 style="width:60px;"
																 <axis:atr f="axislist006" c="FFIN" a="modificable=true&formato=fecha"/>
																 title='<axis:alt f="axislist006" c="FFIN" lit="103051"/>'/>
														  <img id="SEL_FFIN" src="images/calendar.gif"/>
													</td>
											  </axis:ocultar>
											  <axis:ocultar f="axislist006"
															c="CBATCH">
													<td class="campocaja">
														  <select name="CBATCH" id="CBATCH" class="campowidthinput campo campotexto" title='<axis:alt f="axislist006" c="CBATCH" lit="9905675"/>' <axis:atr f="axislist006" c="CBATCH" a="modificable=true&isInputText=false"/>>
																<option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axislist006" c="SNV_COMBO" lit="108341"/> -
																</option>
                                                                <!-- No-->
                                                                 <option value="0" <c:if test="${(!empty __formdata.CBATCH)&& 0 == __formdata.CBATCH}"> selected </c:if>> <axis:alt f="axislist006" c="CESTADO_0" lit="101779"/></option>
																<!-- Si -->
																<option value="1" <c:if test="${(!empty __formdata.CBATCH)&& 1 == __formdata.CBATCH}"> selected </c:if>> <axis:alt f="axislist006" c="CESTADO_1" lit="9902445"/></option>
														  </select>
													</td>
											  </axis:ocultar>                                              
										</tr>
                                        <tr>
											  <axis:ocultar f="axislist006" c="CUSER">
													<td class="titulocaja">
														  <b id="label_CUSER"><axis:alt f="axislist006" c="CUSER" lit="9905522"/></b>
													</td>
											  </axis:ocultar>         
                                        </tr>                                        
                                        <tr>
											  <axis:ocultar f="axislist006"
															c="CUSER">
													<td class="campocaja">
														  <select name="CUSER" id="CUSER"   class="campowidthinput campo campotexto" title='<axis:alt f="axislist006" c="CUSER" lit="9905522"/>' <axis:atr f="axislist006" c="CUSER" a="modificable=true&isInputText=false"/>>
																<option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axislist006" c="SNV_COMBO" lit="108341"/> - </option>
                                                                <c:forEach var="usuarios" items="${USUARIOS}">
                                                                    <option value = "${usuarios.CUSER}">
                                                                        ${usuarios.TUSUNOM}
                                                                    </option>
                                                                </c:forEach>                                                                
														  </select>
													</td>
											  </axis:ocultar>       
	                                           </tr>
									</table>

							</td></tr></table>
	                        
							<div class="separador">&nbsp;</div>
								
							<div class="titulo"><img src="images/flecha.gif"/><b><axis:alt f="axislist006" c="TIT_INFORMES" lit="9905676"/></b></div>
                            <div class="displayspacePersonas">
								<c:set var="CESTADO_0_COLOR">#00AA00</c:set>
								<c:set var="CESTADO_1_COLOR">orange</c:set>
								<c:set var="CESTADO_99_COLOR">#AA0000</c:set>
								<c:set var="title1"><axis:alt f="axislist006" c="DSPTAG_CMAP" lit="9901582"/></c:set>
								<c:set var="title2"><axis:alt f="axislist006" c="DSPTAG_CEMPRES" lit="101619"/></c:set>
								<c:set var="title4"><axis:alt f="axislist006" c="DSPTAG_CESTADO" lit="100587"/></c:set>
								<c:set var="title5"><axis:alt f="axislist006" c="DSPTAG_TERROR" lit="9902104"/></c:set>
								<c:set var="title6"><axis:alt f="axislist006" c="DSPTAG_TFICHERO" lit="1000574"/></c:set>
								<c:set var="title9"><axis:alt f="axislist006" c="DSPTAG_FINI" lit="104095"/></c:set>
								<c:set var="title10"><axis:alt f="axislist006" c="DSPTAG_FFIN" lit="103051"/></c:set>
								<c:set var="title11"><axis:alt f="axislist006" c="DSPTAG_CBATCH" lit="9905675"/></c:set>
                                <c:set var="title12"><axis:alt f="axislist006" c="DSPTAG_CSER" lit="9905522"/></c:set>
                                <c:set var="title13"><axis:alt f="axislist006" c="DSPTAG_CEMAIL" lit="9905728"/></c:set>
                                <%int total=0;%>                                         
                                                                        <display:table name="${sessionScope.INFORMES}"
                                                                                       id="miINFORMES"
                                                                                       export="false"
                                                                                       class="dsptgtable"
                                                                                       pagesize="50"
                                                                                       defaultsort="1"
                                                                                       defaultorder="ascending"
                                                                                       sort="list"
                                                                                       cellpadding="0"
                                                                                       cellspacing="0"
                                                                                       requestURI="axis_axislist006.do?paginar=true">
                                                                              <%@ include file="../include/displaytag.jsp"%>
                                                                              <%total++;%>
                                                                              <display:column headerClass="headwidth5 sortable"
                                                                                              sortable="true"
                                                                                              sortProperty="CESTADO"
                                                                                              title="${title4}"
                                                                                              style="width:5%;"
                                                                                              media="html"
                                                                                              autolink="false">
                                                                                    <div class="dspText">
                                                                                          <c:choose>
																							<c:when test="${miINFORMES.CESTADO==0}">
                                                                                                      <span style="color:${CESTADO_0_COLOR}">
                                                                                                            <axis:alt f="axislist006" c="CESTADO_0" lit="9901094"/>
                                                                                                      </span>
                                                                                                </c:when>
                                                                                                <c:when test="${miINFORMES.CESTADO==99}">
                                                                                                      <span style="color:${CESTADO_99_COLOR}">
                                                                                                            <axis:alt f="axislist006" c="CESTADO_99" lit="108953"/>
                                                                                                      </span>
                                                                                                </c:when>
                                                                                                <c:otherwise>
                                                                                                      <span style="color:${CESTADO_1_COLOR}">
                                                                                                            <axis:alt f="axislist006" c="CESTADO_1" lit="9905454"/>
                                                                                                      </span>
                                                                                                </c:otherwise>
                                                                                          </c:choose>
                                                                                    </div>
                                                                                    <!-- dspIcon, dspNumber -->
                                                                              </display:column>
                                                                              <display:column headerClass="headwidth5 sortable"
                                                                                              sortable="true"
                                                                                              sortProperty="CMAP"
                                                                                              title="${title1}"
                                                                                              style="width:5%;"
                                                                                              media="html"
                                                                                              autolink="false">
                                                                                    <div class="dspText">
                                                                                          ${miINFORMES.CMAP}
                                                                                    </div>
                                                                                    <!-- dspIcon, dspNumber -->
                                                                              </display:column>
                                                                              <display:column headerClass="headwidth5 sortable"
                                                                                              sortable="true"
                                                                                              sortProperty="TFICHERO"
                                                                                              title="${title6}"
                                                                                              style="width:5%;"
                                                                                              media="html"
                                                                                              autolink="false">
                                                                                    <div class="dspText">
                                                                                     <c:set var="stringfichero" value="${miINFORMES.TFICHERO}"/>
                                                                                     <c:set var="start1" value="\\"/>
                                                                                     <c:set var="end1" value="/"/>     
                                                                                     <c:set var="fichero" value="${fn:replace(stringfichero,start1, end1)}"/>  
                                                                                     
                                                                                          <a href="javascript:f_imprimir_fitxer('${fichero}')">
                                                                                           <div class="dspText" id="fichero<%=total%>" name="fichero<%=total%>">
                                                                                        <script>
                                                                                            <c:set var="string3" value="${miINFORMES.TFICHERO}"/>
                                                                                            <c:set var="start" value="\\"/>
                                                                                            <c:set var="end" value="/"/>
                                                                                            <c:set var="ruta" value="${fn:replace(string3,start,end)}"/>                                                                                          
                                                                                             var odiv_OBFICHERO=document.getElementById("fichero<%=total%>");
                                                                                              odiv_OBFICHERO.innerHTML="";
                                                                                              var div_OBFICHEROcontenido="";
                                                                                              var contenido = '${ruta}';
                                                                                            
                                                                                              var totales = contenido.split("/");
                                                                                              if (totales.length>0){
                                                                                                div_OBFICHEROcontenido=div_OBFICHEROcontenido+ totales[totales.length-1];
                                                                                              }else{
                                                                                                div_OBFICHEROcontenido=div_OBFICHEROcontenido+ contenido;
                                                                                              }
                                                                                              odiv_OBFICHERO.innerHTML=div_OBFICHEROcontenido;                                                                                              
                                                                                            </script>                                                                                          
                                                                                                  </div>
                                                                                          </a>
                                                                                    </div>
                                                                                    <!-- dspIcon, dspNumber -->
                                                                              </display:column>
                                                                              <display:column headerClass="headwidth5 sortable"
                                                                                              sortable="true"
                                                                                             sortProperty="TERROR"
                                                                                              title="${title5}"
                                                                                              style="width:5%;"
                                                                                              media="html"
                                                                                              autolink="false">
                                                                                    <div class="dspText">
                                                                                        <c:set var="string1" value="${miINFORMES.TERROR}"/>
                                                                                        <c:set var="string2" value="${fn:replace(string1,';', '; ')}" />
                                                                                            ${string2}                                                                              
                                                                                    </div>
                                                                                    <!-- dspIcon, dspNumber -->
                                                                              </display:column>
                                                                              <display:column headerClass="headwidth5 sortable"
                                                                                              sortable="true"
                                                                                              sortProperty="FINI"
                                                                                              title="${title9}"
                                                                                              style="width:5%;"
                                                                                              media="html"
                                                                                              autolink="false">
                                                                                    <div class="dspText">
                                                                                          <!--<fmt:formatDate value="${miINFORMES.FINI}"
                                                                                                          pattern="dd/MM/yyyy HH:mm:ss"/>-->
                                                                                           ${miINFORMES.FECHAINICIO}               
                                                                                    </div>
                                                                              </display:column>
                                                                              <display:column headerClass="headwidth5 sortable"
                                                                                              sortable="true"
                                                                                              sortProperty="FFIN"
                                                                                              title="${title10}"
                                                                                              style="width:5%;"
                                                                                              media="html"
                                                                                              autolink="false">
                                                                                    <div class="dspText">
                                                                                          <!--<fmt:formatDate value="${miINFORMES.FFIN}"
                                                                                                          pattern="dd/MM/yyyy"/>-->
                                                                                          ${miINFORMES.FECHAFIN}                     
                                                                                    </div>

                                                                              </display:column>
                                                                              <display:column headerClass="headwidth5 sortable"
                                                                                              sortable="true"
                                                                                              sortProperty="CBATCH"
                                                                                              title="${title11}"
                                                                                              style="width:1%;"
                                                                                              media="html"
                                                                                              autolink="false">
                                                                                    <div class="dspText">
                                                                              <c:choose>
																							<c:when test="${miINFORMES.CBATCH==0}">
                                                                                                    <axis:alt f="axislist006" c="CESTADO_0" lit="101779"/>
                                                                                                </c:when>
                                                                                                <c:when test="${miINFORMES.CBATCH==1}">
                                                                                                    <axis:alt f="axislist006" c="CESTADO_0" lit="9902445"/>
                                                                                                </c:when>
                                                                                                <c:otherwise>
                                                                                                        ${miINFORMES.CBATCH}
                                                                                                </c:otherwise>
                                                                                          </c:choose>
                                                                                    </div>
                                                                                    <!-- dspIcon, dspNumber -->
                                                                              </display:column>    
                                                                              <display:column headerClass="headwidth5 sortable"
                                                                                              sortable="true"
                                                                                              sortProperty="CUSER"
                                                                                              title="${title12}"
                                                                                              style="width:5%;"
                                                                                              media="html"
                                                                                              autolink="false">
                                                                                    <div class="dspText">
                                                                                          ${miINFORMES.CUSER}
                                                                                    </div>
                                                                                    <!-- dspIcon, dspNumber -->
                                                                              </display:column>         
                                                                              <display:column headerClass="headwidth5 sortable"
                                                                                              sortable="true"
                                                                                              sortProperty="CEMAIL"
                                                                                              title="${title13}"
                                                                                              style="width:5%;"
                                                                                              media="html"
                                                                                              autolink="false">
                                                                                    <div class="dspText">
                                                                                          ${miINFORMES.CEMAIL}
                                                                                    </div>
                                                                                    <!-- dspIcon, dspNumber -->
                                                                              </display:column>                                                                                
                                                                        </display:table>

							</div>


							</td>
                        </tr>
                  </table>

            <div class="separador">&nbsp;</div>
            <c:import url="../include/botonera_nt.jsp"><c:param name="f">axislist006</c:param>
             <c:param name="__botones">salir,buscar</c:param>
            </c:import>

		  </form>
<script type="text/javascript">
Calendar.setup({
	inputField     :    "FFIN",     
	ifFormat       :    "%d/%m/%Y",      
	button         :    "SEL_FFIN", 
	singleClick    :    true,
	firstDay       :    1
});    
Calendar.setup({
	inputField     :    "FINI",     
	ifFormat       :    "%d/%m/%Y",      
	button         :    "SEL_FINI", 
	singleClick    :    true,
	firstDay       :    1
});
</script>
<c:import url="../include/mensajes.jsp"/>
</body>
</html>