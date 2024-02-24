<%/*
*  Fichero: axiscom001.jsp
*
*  @author <a href = "mailto:xgallego@csi-ti.com">Xavi Gallego</a>
*
*
*  Fecha: 29/04/2008
*/
%>

<%@ page contentType="text/html;charset=windows-1252" errorPage="/WEB-INF/jsp/axiserror.jsp" import="java.util.*"%>
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
    <c:import url="../include/carga_framework_js.jsp" />
    <script language="Javascript" type="text/javascript">
            
        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/

        function f_onload() {
            f_cargar_propiedades_pantalla();
        }
        
        function f_but_aceptar() {
            if(typeof document.miForm.seleccionaRegistro == 'undefined' || typeof document.miForm.seleccionaRegistro == 'null')
                alert(objJsMessages.jslit_selecciona_registro);
            else{
                var hayChecked = objUtiles.f_GuardaCasillasChecked ("seleccionaRegistro");
                if (!hayChecked) 
                    alert(objJsMessages.jslit_selecciona_registro);
                else 
                    
                    f_seleccionar (objUtiles.utilSplit(hayChecked, "/")[0], objUtiles.utilSplit(hayChecked, "/")[1],document.getElementById('cprovin-'+objUtiles.utilSplit(hayChecked, "/")[0]).value);
            }
        }
        
        function f_but_cancelar() {
            //Crear este mtodo en el padre
            parent.f_cerrar_axiscom001();
        }        
        
        function f_but_buscar() {
            //Si la validacin es correcta, ejecutamos la accin
            objUtiles.ejecutarFormulario("modal_axiscom001.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
        
        function f_seleccionar (CODIGO, TEXTO,CPROVIN){
            if (objUtiles.estaVacio(CODIGO))
                alert (objJsMessages.jslit_selecciona_registro);
            else
                //Crear este mtodo en el padre
                parent.f_aceptar_axiscom001 (CODIGO, TEXTO, '${__formdata.CODIGO_CONSULTA}',CPROVIN);
            //INI TCS 309 08/03/2019 AP
            var CONSULTA = '${__formdata.CODIGO_CONSULTA}';
            
            if (CONSULTA == 'LISTA_POBLACION_GARAN1'){
            	parent.f_onchange_axiscga002 ();
            }else if (CONSULTA == 'LISTA_POBLACION_GARAN2'){
            	parent.f_onchange_partes ();
            } else if (CONSULTA == 'LISTA_POBLACION_GARAN3'){
            	parent.f_onchange_firma ();
            }
          //FIN TCS 309 08/03/2019 AP
        }
         
    </script>
  </head>
    <body class=" " onload="f_onload()" onkeypress="if (event.keyCode==13)  { f_but_buscar() }">
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
        <form name="miForm" action="" method="POST">
            <input type="hidden" name="operation" value=""/>
            <input type="hidden" id="CODIGO_LITERAL" name="CODIGO_LITERAL" value="${__formdata.CODIGO_LITERAL}"/>
            <input type="hidden" id="CODIGO_CONSULTA" name="CODIGO_CONSULTA" value="${__formdata.CODIGO_CONSULTA}"/>
            <input type="hidden" id="CODIGO_GARANTIA" name="CODIGO_GARANTIA" value="${__formdata.CODIGO_GARANTIA}"/>
            <input type="hidden" id="CODIGO_AGR" name="CODIGO_AGR" value="${__formdata.CODIGO_AGR}"/>
            
            <%
            HashMap formdata=(HashMap)request.getAttribute("__formdata");
            if (formdata.get("CODIGO_CONDICION")!=null && formdata.get("CODIGO_CONDICION") instanceof java.util.Date) {
            %>
            <input type="hidden" id="CODIGO_CONDICION" name="CODIGO_CONDICION" value="<fmt:formatDate value="${__formdata.CODIGO_CONDICION}" pattern="dd/MM/yyyy" />"/>
            <%
            }
            else {
            %>
            <input type="hidden" id="CODIGO_CONDICION" name="CODIGO_CONDICION" value="${__formdata.CODIGO_CONDICION}"/>
            <%
            }
            %>
            
            <c:choose>
                <c:when test="${!empty __formdata.CODIGO_LITERAL}">
                    <c:set var="tituloModal"><axis:alt f="axiscom001" c="TITULO" lit="${__formdata.CODIGO_LITERAL}"/></c:set>
                </c:when>
                <c:otherwise>
                    <c:set var="tituloModal"><axis:alt f="axiscom001" c="TITULO" lit="1000108"/></c:set>
                </c:otherwise>
            </c:choose>
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario">${tituloModal}</c:param>
                <c:param name="producto">${tituloModal}</c:param>
                <c:param name="form">axiscom001</c:param>
            </c:import>
            <!-- Area de campos  -->
            <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <!--campos-->
                        <table class="seccion">
                            <tr>
                                <th style="width:14.7%;height:0%"/>
                                <th style="width:40%;height:0%"/>
                                <th style="width:45.3%;height:0%"/>
                            </tr>
                            <tr>
                                <td align="right" class="titulocaja">
                                    <b><axis:alt f="axiscom001" c="DESC" lit="100588"/></b>
                                </td>
                                <td align="left" class="campocaja">
                                    <input onBlur="javascript:f_but_buscar()" type="text" class="campowidthinput campo campotexto_ob" value="${__formdata.DESC}" name="DESC" id="DESC" size="15"
                                     style="width:90%" title="<axis:alt f="axiscom001" c="DESC" lit="100588"/>"/>
                                </td>
                            </tr>
                        </table>

                        <div class="separador">&nbsp;</div>
                        <!-- DisplayTag Agentes -->
                        <c:set var="title0"><axis:alt f="axiscom001" c="CODIGO" lit="1000109"/></c:set>
                        <c:set var="title1"><axis:alt f="axiscom001" c="DESC" lit="100588"/></c:set>
                        <div class="seccion displayspaceModalGenerico">
                            <display:table name="${T_IAX_GETCONSULTA}" id="T_IAX_GETCONSULT" export="false" class="dsptgtable" pagesize="11" defaultsort="3" defaultorder="ascending" requestURI="modal_axiscom001.do?paginar=true" sort="list" cellpadding="0" cellspacing="0">
                                <%@ include file="../include/displaytag.jsp"%>
                                <c:set var="quote">'</c:set>
                                <c:set var="TEXTO">
                                    ${empty T_IAX_GETCONSULT ? "" : fn:replace(T_IAX_GETCONSULT.TEXTO, quote, '-quote-')}
                                </c:set>
                                <display:column title="" sortable="false" headerClass="headwidth5 sortable"  media="html" autolink="false" >    
                                    <div class="dspIcons"><input type="radio" id="seleccionaRegistro" name="seleccionaRegistro" value="${T_IAX_GETCONSULT.CODIGO}/${TEXTO}"/></div>
                                </display:column>
                                <display:column title="${title0}" sortable="true" sortProperty="CODIGO" headerClass="headwidth10 sortable"  media="html" autolink="false" >
                                    <div class="dspNumber"><a href="javascript:f_seleccionar('${T_IAX_GETCONSULT.CODIGO}', '${TEXTO}','${T_IAX_GETCONSULT.CPROVIN}')">${T_IAX_GETCONSULT.VALOR}</a></div>
                                    <c:if test="${!empty T_IAX_GETCONSULT.CODIGO}">
                                        <input type='hidden' id='cprovin-${T_IAX_GETCONSULT.CODIGO}' value='${T_IAX_GETCONSULT.CPROVIN}'/>
                                    </c:if>
                                
                                </display:column>
                                <display:column title="${title1}" sortable="true" sortProperty="TEXTO" headerClass="sortable"  media="html" autolink="false" >
                                    <div class="dspText"><a href='javascript:f_seleccionar("${T_IAX_GETCONSULT.CODIGO}", "${TEXTO}","${T_IAX_GETCONSULT.CPROVIN}")'>${T_IAX_GETCONSULT.TEXTO}</a></div>
                                </display:column>
                                
                            </display:table>
                            <c:choose>
                            <c:when test="${!empty T_IAX_GETCONSULTA}">
                                <c:if test="${ !(fn:containsIgnoreCase(header['User-Agent'],'ipad') ) }">
                                    <script language="javascript">objUtiles.retocarDsptagtable("T_IAX_GETCONSULT");</script>
                                </c:if>
                            </c:when>
                            <c:otherwise>
                                <script language="javascript">
                                   objLista.esconderListaSpans();
                                   objLista.esconderListaLinks();     
                                </script>
                            </c:otherwise>
                            </c:choose>
                        </div>
                    </td>
                </tr>
            </table>
            <!-- Botonera -->
            <c:import url="../include/botonera_nt.jsp">
                <c:param name="f">axiscom001</c:param>
                <c:param name="__botones">cancelar,buscar,aceptar</c:param>
            </c:import>
        </form>
        <c:import url="../include/mensajes.jsp" />
    </body>
</html>
