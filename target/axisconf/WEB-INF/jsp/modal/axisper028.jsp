<%-- 
*  Fichero: axisper028.jsp
*  @author <a href = "mailto:amartinez@csi-ti.com">Alex Martinez</a>
*
*  Fecha: 08/02/2012
*/
--%>
<%@ page contentType="text/html;charset=windows-1252" errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ page import="axis.util.Constantes" %>
<%@ page import="java.util.*" %>
<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<html>
  <head>
    <link rel="stylesheet" href="styles/genericosHtml.css" type="text/css">
    <link rel="stylesheet" href="styles/axisnt.css" type="text/css">
    <link rel="stylesheet" href="styles/displaytag.css"></link>
    <c:import url="../include/carga_framework_js.jsp" />
    <script language="Javascript" type="text/javascript">

        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/

        function f_onload() {
            revisarEstilos();
            
            var grabarOK = '${__formdata.OK}';
            
            
            if (!objUtiles.estaVacio(grabarOK) && grabarOK == "ok"){
                
                parent.f_aceptar_axisper028("${__formdata.SPERSON}");
            }
            f_cargar_propiedades_pantalla();
           
        }
        
        function f_but_aceptar() {
            if (objValidador.validaEntrada()) {
                objUtiles.ejecutarFormulario("modal_axisper028.do", "guardar", document.miForm, "_self", objJsMessages.jslit_cargando);   
            }
        }
        function f_but_cancelar() {
            parent.f_cerrar_axisper028();
        }        
       
      
    </script>
  </head>
    <body onload="f_onload()">
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
        
        
        <!--*********************************** -->
        <form name="miForm" action="" method="POST">
            <input type="hidden" name="operation" value=""/>
            <input type="hidden" name="faceptar" value="${__formdata.faceptar}"/>
            <%-- Esto es necesario tenerlo como hidden para volverlo a enviar a servidor para grabar --%>
            <input type="hidden" name="isNew" value="${__formdata.isNew}"/>
            <input type="hidden" name="SPERSON" value="${__formdata.SPERSON}"/>
            <input type="hidden" name="CAGENTE" value="${__formdata.CAGENTE}"/>
            <input type="hidden" name="CDOMICI" value="${__formdata.CDOMICI}"/>
            <input type="hidden" name="NORDEN" value="${__formdata.NORDEN}"/>
            <input type="hidden" name="MODO" value="${__formdata.MODO}"/>

            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt f="axisper028" c="formulario" lit="9903260" /></c:param>
                <c:param name="producto"><axis:alt f="axisper028" c="producto" lit="9903260" /></c:param>
                <c:param name="form">axisper028</c:param>
            </c:import>

            <!-- Area de campos  -->
            <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <table class="seccion">
                            
                            <tr>
                                <td>
                                    <div class="titulo">
                                        <b><axis:alt f="axisper028" c="LIT10" lit="9903259"/></b>
                                    </div>
                                    <div class="separador">&nbsp;</div>
                                        <c:set var="title1"><axis:alt f="axisper028" c="CDOMICI" lit="1000082"/></c:set>
                                        <c:set var="title2"><axis:alt f="axisper028" c="TTIPDIR" lit="1000375"/> </c:set>
                                        <c:set var="title3"><axis:alt f="axisper028" c="TDOMICI" lit="101078"/></c:set>
                                        <c:set var="title4"><axis:alt f="axisper028" c="CPOSTAL" lit="100823"/></c:set>
                                        <c:set var="title5"><axis:alt f="axisper028" c="TPOBLAC" lit="100817"/></c:set>
                                        <c:set var="title6"><axis:alt f="axisper028" c="TPROVIN" lit="100756"/></c:set>
                                        <c:set var="title7"><axis:alt f="axisper028" c="TPAIS" lit="100816"/></c:set>
                                        <c:set var="title8"><axis:alt f="axisper028" c="CUSUMOD" lit="9903220"/></c:set>
                                        <c:set var="title9"><axis:alt f="axisper028" c="FBAJA" lit="9000447"/></c:set>
                                        <c:set var="title10"><axis:alt f="axisper028" c="FUSUMOD" lit="9903221"/></c:set>
                                       
                                        <div class="seccion displayspacePersonas">
                                                    <display:table name="${__formdata.DIRECCION}" id="AUTORIZACION" export="false" class="dsptgtable"
                                                               pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                                                               requestURI="axis_axisper028.do?paginar=true&subpantalla=datosgenerales">
                                                  <%@ include file="../include/displaytag.jsp"%>
                                                 <display:column title="${title1}" sortable="true" sortProperty="OB_IAX_DIRECCIONES.CDOMICI"
                                                                  headerClass="headwidth5 sortable fixed" media="html" autolink="false">
                                                    <div class="dspText"> ${AUTORIZACION.DIRECCION.CDOMICI}</div>
                                                  </display:column>
                                                   <display:column title="${title2}" sortable="true" sortProperty="OB_IAX_DIRECCIONES.TTIPDIR"
                                                                  headerClass="sortable fixed" media="html" autolink="false">
                                                    <div class="dspText">${AUTORIZACION.DIRECCION.TTIPDIR} </div>
                                                  </display:column>
                                                  <display:column title="${title3}" sortable="true" sortProperty="OB_IAX_DIRECCIONES.TDOMICI"
                                                                  headerClass="sortable fixed" media="html" autolink="false">
                                                    <div class="dspText"> ${AUTORIZACION.DIRECCION.TDOMICI}</div>
                                                  </display:column>
                                                  <display:column title="${title4}" sortable="true" sortProperty="OB_IAX_DIRECCIONES.CPOSTAL"
                                                                  headerClass="sortable fixed" media="html" autolink="false">
                                                    <div class="dspText"> ${AUTORIZACION.DIRECCION.CPOSTAL}</div>
                                                  </display:column>
                                                  <display:column title="${title5}" sortable="true" sortProperty="OB_IAX_DIRECCIONES.TPOBLAC"
                                                                  headerClass="sortable fixed" media="html" autolink="false">
                                                    <div class="dspText">${AUTORIZACION.DIRECCION.TPOBLAC}</div>
                                                  </display:column>
                                                  <display:column title="${title6}" sortable="true" sortProperty="OB_IAX_DIRECCIONES.TPROVIN"
                                                                  headerClass="sortable fixed" media="html" autolink="false">
                                                    <div class="dspText">${AUTORIZACION.DIRECCION.TPROVIN}</div>
                                                  </display:column>
                                                  <display:column title="${title7}" sortable="true" sortProperty="OB_IAX_DIRECCIONES.TPAIS"
                                                                  headerClass="sortable fixed" media="html" autolink="false">
                                                    <div class="dspText">${AUTORIZACION.DIRECCION.TPAIS} </div>
                                                  </display:column>
                                                   <display:column title="${title8}" sortable="true" sortProperty="OB_IAX_DIRECCIONES.CPOSTAL"
                                                                  headerClass="sortable fixed" media="html" autolink="false">
                                                    <div class="dspText"> ${AUTORIZACION.CUSUMOD}</div>
                                                  </display:column>
                                                  <display:column title="${title9}" sortable="true" sortProperty="OB_IAX_DIRECCIONES.TPOBLAC"
                                                                  headerClass="sortable fixed" media="html" autolink="false">
                                                    <div class="dspText"><fmt:formatDate pattern="dd/MM/yyyy" value="${AUTORIZACION.FBAJA}"/></div>
                                                  </display:column>
                                                  <display:column title="${title10}" sortable="true" sortProperty="OB_IAX_DIRECCIONES.TPROVIN"
                                                                  headerClass="sortable fixed" media="html" autolink="false">
                                                    <div class="dspText"><fmt:formatDate pattern="dd/MM/yyyy" value="${AUTORIZACION.FUSUMOD}"/></div>
                                                  </display:column>
                                                </display:table> 
                                                  </div>
                                    <!-- Área 1 -->
                                    <div class="separador">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
                                    <table class="area" align="center">
                                        <tr>
                                            <th style="width:20%;height:0px"></th>
                                            <th style="width:20%;height:0px"></th>   
                                            <th style="width:20%;height:0px"></th> 
                                            <th style="width:20%;height:0px"></th> 
                                            <th style="width:20%;height:0px"></th> 
                                        </tr>
                                        <tr>
                                            <td>
                                                <div class="titulocaja">
                                                    <b><axis:alt f="axisper028" c="CESTADO" lit="100587"/></b>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <select name="CESTADO" id="CESTADO" size="1" class="campowidthselect campo campotexto" style="width:90%;"
                                                    title="<axis:alt f="axisper028" c="CESTADO" lit="100587"/>" 
                                                    <axis:atr f="axisper011" c="CESTADO" a="obligatorio=true&modificable=true"/>
                                                    <c:if test="${ __formdata.MODO == 'MODIF'}">disabled="disabled"</c:if>>&nbsp;
                                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisper028" c="CESTADO_BLANCO" lit="1000348"/> - </option>
                                                        <c:forEach var="element" items="${__formdata.listValores.lstestados}">
                                                            <option value = "${element.CATRIBU}" 
                                                            <c:if test="${element.CATRIBU == __formdata.CESTADO}"> selected </c:if> />
                                                            ${element.TATRIBU} 
                                                            </option>
                                                        </c:forEach>
                                                </select>
                                            </td>
                                        </tr>
                                        <tr>
                                            
                                            <td>
                                                <div class="separador">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
                                                <div class="titulocaja">
                                                    <b><axis:alt f="axisper028" c="TOBSERVA" lit="101162"/></b>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="3">
                                                <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.TOBSERVA}" name="TOBSERVA" id="TOBSERVA" style="width:90%;"
                                                    title="<axis:alt f="axisper028" c="TOBSERVA" lit="101162"/>" <axis:atr f="axisper028" c="TOBSERVA" a="obligatorio=false"/> maxlength="200"
                                                    <c:if test="${ __formdata.MODO == 'MODIF'}">disabled="disabled"</c:if>/>
                                            </td>
                                        </tr>
                                        <div class="separador">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
                                        <tr>
                                            <td>
                                                <div class="separador">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
                                                <div class="titulocaja">
                                                    <b><axis:alt f="axisper028" c="CUSUAUT" lit="9903255"/></b>
                                                </div>
                                            </td>
                                            <td>
                                                <div class="separador">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
                                                <div class="titulocaja">
                                                    <b><axis:alt f="axisper028" c="FAUTORIZ" lit="9903221"/></b>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.CUSUAUT}" name="CUSUAUT" id="CUSUAUT" style="width:90%;"
                                                    title="<axis:alt f="axisper028" c="CUSUAUT" lit="9903255"/>" <axis:atr f="axisper011" c="CUSUAUT" a="obligatorio=false&modificable=false"/>/>
                                            </td>
                                            <td>
                                                <input type="text" class="campowidthinput campo campotexto" size="15" value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FAUTORIZ}"/>" name="FAUTORIZ" id="FAUTORIZ" style="width:50%;"
                                                    title="<axis:alt f="axisper028" c="FAUTORIZ" lit="9903221"/>" <axis:atr f="axisper011" c="FAUTORIZ" a="obligatorio=false&modificable=false"/>/>
                                            </td>
                                        </tr>
                                    </table>
                                    <div class="separador">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>			
            
            <div class="separador">&nbsp;</div>
            <div class="separador">&nbsp;</div>
            <div class="separador">&nbsp;</div>
            
            <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisper028</c:param><c:param name="f">axisper028</c:param>
                <c:param name="__botones">cancelar,<c:if test="${ __formdata.MODO != 'MODIF'}">aceptar</c:if></c:param>
            </c:import>
        </form>
        <c:import url="../include/mensajes.jsp" />
    </body>
</html>

