<%-- 
NOMBRE: axislist005.jsp 
Fecha: 
PROPÓSITO (descripción pantalla):     ANT__REFERENCIA 
Ejemplo : 
REVISIONES: 
Ver       Fecha      Autor           Descripción 
--------- ---------- --------------- ------------------------------------ 
1.0                                                                        
--%>
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
            <c:import url="../include/carga_framework_js.jsp"/>
            <script type="text/javascript">
        function f_but_cancelar() {
           parent.f_cerrar_axislist005();
        }
        
        function f_but_buscar() {
            if (objValidador.validaEntrada()) {
                objUtiles.ejecutarFormulario("modal_axislist005.do", "buscar", document.miForm, "_self", objJsMessages.jslit_cargando);
            }
        }

        function f_seleccionar(identificador) {
            //alert("f_seleccionar:"+identificador)
			//TODO: lo que pasamos como identificador debe ser justamente lo que se necesita para identificar un registro
			//TODO: este identificador es la concadenacion de los valores de las claves para identificar el regsitro
            parent.f_recuperar(identificador);
        }

        function f_but_aceptar() {
            var identificador=document.miForm.IDENTIFICADOR.value;
            if (identificador!=null && identificador!='') {
                f_seleccionar(identificador) ;
            } 
            else {
                alert("<axis:alt f="axislist005" c="ERRORSINMARCAR" lit="9905669"/>");
            }
        }
        
        function f_onload() {
            f_cargar_propiedades_pantalla(); 
            document.getElementById("CEMPRES").focus();
        }
        
        function f_onchange(itemid, itemvalue) {
            f_but_buscar();
        }        
        function guardar(elemento){
            var identificador = elemento.value;
             if (identificador!=undefined&&identificador!=null) {
                document.miForm.IDENTIFICADOR.value = identificador;
             }
        }

    </script>
      </head>
      <body onunload="try { f_clear_resources(document.body) } catch (e) {}" onload="f_onload()" onkeypress="if (event.keyCode==13)  { f_but_buscar() }">
<c:import url="../include/precargador_ajax.jsp">
    <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
</c:import>
        <form name="miForm" action="modal_axislist005.do" method="POST">
<c:import url="../include/titulo_nt.jsp">
    <c:param name="titulo"><axis:alt f="axislist005" c="TITULO" lit="9905661"/></c:param>
    <c:param name="formulario"><axis:alt f="axislist005" c="TITULO" lit="9905661"/></c:param>
    
    <c:param name="form">axislist005</c:param>
</c:import>
                  <input type="hidden" id="operation" name="operation"  value=""/>
                  <input type="hidden" id="IDENTIFICADOR" name="IDENTIFICADOR"  value=""/>
                  <input type="hidden" id="CFORM" name="CFORM"  value="${__formdata.CFORM}"/>
                  <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="3">
                        <tr>
                              <td>
                                    <div class="separador">&nbsp;</div>
                                    <table class="seccion">
                                          <tr>
                                                <td>
                                                      <table class="area" align="center">
                                                            <tr>
                                                                  <th style="width:25%;height:0%;"></th>
                                                                  <th style="width:25%;height:0%;"></th>
                                                                  <th style="width:25%;height:0%;"></th>
                                                                  <th style="width:25%;height:0%;"></th>
                                                            </tr>
                                                            <tr>
                                                                  <axis:ocultar f="axislist005" c="CEMPRES">
                                                                        <td class="titulocaja" >
                                                                              <b><axis:alt f="axislist005" c="CEMPRES" lit="101619"/></b>
                                                                        </td>
                                                                  </axis:ocultar>
                                                                  <axis:ocultar f="axislist005" c="CMAP">
                                                                        <td class="titulocaja" >
                                                                              <b><axis:alt f="axislist005" c="CMAP" lit="9905639"/></b>
                                                                        </td>
                                                                  </axis:ocultar>
                                                            </tr>
                                                            <tr>
                                                                  <axis:ocultar f="axislist005" c="CEMPRES">
                                                                        <td class="campocaja" >
                                                                              <select name="CEMPRES" id="CEMPRES" size="1" onchange="f_onchange('CEMPRES', this.value)" class="campowidthselect campo campotexto" title="<axis:alt f="axislist005" c="CEMPRES" lit="101619"/>" alt="<axis:alt f="axislist005" c="CEMPRES" lit="101619"/>">
                                                                                    <option value="<%= Integer.MIN_VALUE %>"> -  <axis:alt f="axislist005" c="SELECC" lit="108341"/>  - </option>
                                                                                    <c:forEach var="item" items="${EMPRESAS}">
                                                                                          <option value="${item.CEMPRES}" <c:if test="${__formdata.CEMPRES == item.CEMPRES || fn:length(LSTEMPRESAS) == 1}">selected</c:if>>${item.TEMPRES}</option>
                                                                                    </c:forEach>
                                                                              </select>
                                                                        </td>
                                                                  </axis:ocultar>
                                                                  <axis:ocultar f="axislist005" c="CMAP">
                                                                        <td class="campocaja" >
                                                                            <input type="text" name="CMAP" id="CMAP" value="${__formdata.CMAP}" class="campo campotexto"  />
                                                                        </td>
                                                                  </axis:ocultar>
                                                            </tr>
                                                      </table>
                                                </td>
                                          </tr>
                                          
                                          <tr>
                                                <td class="titulocaja"
                                                    colspan="5">
                                                      <div class="separador">&nbsp;</div>
                                                      <div class="displayspaceGrande">
                                                            <c:set var="title0"><axis:alt f="axislist005" c="DSPTAG_CEMPRES"  lit="101619"  /></c:set>
                                                            <c:set var="title1"><axis:alt f="axislist005" c="DSPTAG_CLITERA"     lit="9905640"     /></c:set>
                                                            <c:set var="title2"><axis:alt f="axislist005" c="DSPTAG_CMAP"     lit="9905639"     /></c:set>
                                                            <c:set var="title4"><axis:alt f="axislist005" c="DSPTAG_LEXPORT" lit="9905641" /></c:set>
                                                                                                                      <%int x=0;%>
                                                            <display:table name="${sessionScope.LISTA_INFORMES}" id="LISTA_INFORMES" export="false" class="dsptgtable" pagesize="20" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0" requestURI="modal_axislist005.do?paginar=true">
                                                            
                                                                  <%@ include file="../include/displaytag.jsp"%>
                                                                  <%x++;%>
<%--			//TODO: este identificador es la concadenacion de los valores de las claves para identificar el regsitro --%>
<%--			//TODO: de forma ejemplar, concadenamos aqui soo empresa, cmap y idioma. seguramente falta concadenar mas cosas --%>
                                                                  <c:set var="IDENTIFICADOR">${LISTA_INFORMES['CCODPLAN']}|${LISTA_INFORMES['CEMPRES']}|${LISTA_INFORMES['CFORM']}|${LISTA_INFORMES['CMAP']}|${LISTA_INFORMES['TEVENTO']}|${LISTA_INFORMES['SPRODUC']}|${LISTA_INFORMES['CCFGFORM']}|${LISTA_INFORMES['CTIPO']}</c:set>
                                                                  <display:column title="" sortable="false" headerClass="sortable headwidth5 fixed" media="html" autolink="false">
                                                                        <div class="dspIcons">
                                                                              <input type="radio" name="selCta" id="selCta_<%=x%>" value="${IDENTIFICADOR}" onclick="guardar(this);"/>
                                                                        </div>
                                                                  </display:column>

																<display:column title="${title0}" sortable="true" sortProperty="TEMPRES"  headerClass="sortable fixed" media="html" autolink="false"><div class="dspText"><span style="text-decoration:underline;cursor:pointer" onclick="f_seleccionar('${IDENTIFICADOR}' )">${LISTA_INFORMES['TEMPRES']}</span></div></display:column>
                                                                <display:column title="${title1}" sortable="true" sortProperty="SLITERA"     headerClass="sortable fixed" media="html" autolink="false"><div class="dspText"><span style="text-decoration:underline;cursor:pointer" onclick="f_seleccionar('${IDENTIFICADOR}' )">${LISTA_INFORMES['TLITERA']}</span></div></display:column>
																<display:column title="${title2}" sortable="true" sortProperty="CMAP"     headerClass="sortable fixed" media="html" autolink="false"><div class="dspText"><span style="text-decoration:underline;cursor:pointer" onclick="f_seleccionar('${IDENTIFICADOR}' )">${LISTA_INFORMES['CMAP']}</span></div></display:column>
                                                                <display:column title="${title4}" sortable="true" sortProperty="LEXPORT"     headerClass="sortable fixed" media="html" autolink="false"><div class="dspText"><span style="text-decoration:underline;cursor:pointer" onclick="f_seleccionar('${IDENTIFICADOR}' )">${LISTA_INFORMES['LEXPORT']}</span></div></display:column>

                                                            </display:table>
                                                      </div>
                                                      <div class="separador">&nbsp;</div>
                                                </td>
                                          </tr>
                                    </table>
                              </td>
                        </tr>
                  </table>
<c:import url="../include/botonera_nt.jsp">
    <c:param name="f">axislist005</c:param>
    <c:param name="__botones">cancelar,buscar,aceptar</c:param>
</c:import>
                  <div class="separador">&nbsp;</div>
            </form>
<c:import url="../include/mensajes.jsp"/>
        </body>
</html>