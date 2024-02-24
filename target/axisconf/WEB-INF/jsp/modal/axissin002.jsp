<%/**
*  Fichero: axissin003.jsp
*   
*  Primera pantalla del flujo de trabajo "Consulta de Siniestro". En ella:
*
* Descripción de pantalla
*
*  Fecha: 19/10/2007
*/
%>

<%@ page contentType="text/html;charset=windows-1252" errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>

<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>



<html>
  <head>
    <link rel="stylesheet" href="styles/genericosHtml.css" type="text/css">
    <link rel="stylesheet" href="styles/axisnt.css" type="text/css">
    <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>
    <c:import url="../include/carga_framework_js.jsp" />

    <script language="Javascript" type="text/javascript">
        function f_onload() {
            document.miForm.NSINIES.focus();    
            f_cargar_propiedades_pantalla();
        }
       
        // Primero miramos si hay alguna opción de la lista seleccionada
        function f_but_aceptar() {      
            var hayChecked = objUtiles.f_GuardaCasillasChecked("radioSiniestro");
            if(typeof hayChecked == 'boolean') {
                alert(objJsMessages.jslit_seleccione_un_siniestro);
            }else{
                var NSINIES = objUtiles.utilSplit(hayChecked, "/")[0]; // NSINIES
                var SSEGURO = objUtiles.utilSplit(hayChecked, "/")[1]; // SSEGURO
                f_seleccionar_siniestro (NSINIES, SSEGURO);
            }
        }
        
        function f_but_cancelar() {
            parent.f_cerrar_axissin002();
        }
        
        function f_but_buscar(){
        
         //   if (!document.miForm.tomador.checked && !document.miForm.asegurado.checked)
           /*     alert(objJsMessages.jslit_seleccionar_tomador_o_asegurado);
                 if (!document.miForm.tomador.checked && !document.miForm.asegurado.checked)
                 null;
            else{*/
                if (objValidador.validaEntrada()) {
                    if(!objUtiles.estaVacio(document.getElementById("but_aceptar"))) 
                        objDom.setDisabledPorId("but_aceptar", true);
                    objUtiles.ejecutarFormulario("modal_axissin002.do", "busqueda_siniestro", document.miForm, "_self", objJsMessages.jslit_cargando);
               // }
            }
         }
        
        function f_seleccionar_siniestro(NSINIES, SSEGURO){
            // if (objUtiles.estaVacio(NSINIES) || objUtiles.estaVacio(SSEGURO))
            if (objUtiles.estaVacio(NSINIES))
               alert (objJsMessages.jslit_error_de_seleccion);
            else
                parent.f_aceptar_axissin002(NSINIES, SSEGURO);
         }        
        
        function f_habilitar_boton_aceptar(){
            objDom.setDisabledPorId("but_aceptar", false);
        }
        
    </script>
  </head>
    <body class=" " onload="f_onload()" onkeypress="if (event.keyCode==13)  { f_but_buscar() }">
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
        <form name="miForm" action="" method="POST">
            <input type="hidden" name="operation" value=""/>
            <input type="hidden" name="radioSiniestro" value=""/>
            <input type="hidden" name="SPERSON" id="SPERSON" value="12345" />
            <input type="hidden" name="SIDENTIFICADOREXTERNO" id="SIDENTIFICADOREXTERNO" value="12345" />
            <input type="hidden" name="SDOCUMENTO" id="SDOCUMENTO" value="12345" />
            <input type="hidden" name="MODO" id="MODO" value="<c:if test="${!empty __formdata['MODO'] && __formdata['MODO']=='APERTURASINIESTROS'}">${__formdata['MODO']}</c:if>" />
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt f="axissin002" c="formulario" lit="1000230"/></c:param>
                <c:param name="producto"><axis:alt f="axissin002" c="producto" lit="1000230"/></c:param>
                <c:param name="form">axissin002</c:param>
            </c:import>
            <!-- Area de campos  -->
            <table class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <!-- Situacion -->
                        <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axissin002" c="titulo" lit="103593"/></div>
                        <!--campos-->
                        <table class="seccion">
                            <tr>
                                <th style="width:20%;height:0px"></th>
                                <th style="width:20%;height:0px"></th>
                                <th style="width:20%;height:0px"></th>
                                <th style="width:20%; height:0px"></th>
                                <th style="width:20%; height:0px"></th>
                            </tr>
                            <tr>
                                <!-- Póliza -->
                                <td class="titulocaja">
                                    <b><axis:alt f="axissin002" c="NPOLIZA" lit="9001514"/></b>
                                </td>
                                <!-- Certificado -->
                                <td class="titulocaja">
                                  <b><axis:alt f="axissin002" c="NPOLIZA" lit="101300"/></b>
                                </td>
                                <!-- Siniestro -->
                                <td class="titulocaja">
                                  <b><axis:alt f="axissin002" c="NCERTIF" lit="101298"/></b>
                                </td>
                                <!-- Situación / Estado siniestro -->                                      
                                <td class="titulocaja">
                                  <b><axis:alt f="axissin002" c="NSINIES" lit="112259"/></b>
                                </td>
                                <!-- Subestado siniestro -->
                                <td class="titulocaja">
                                  <b><axis:alt f="axissin002" c="CESTSIN" lit="9000851"/></b>
                                </td>
                            </tr>
                            <tr>
                                <!-- Póliza -->
                                <td class="campocaja">
                                  <input type="text" class="campowidthinput campo campotexto" value="${__formdata['NPOLIZA']}" name="NPOLIZA" id="NPOLIZA" 
                                  size="15" formato="entero" title="<axis:alt f="axissin002" c="NPOLIZA" lit="800242"/>" <c:if test="${!empty __formdata['MODO'] && __formdata['MODO']=='APERTURASINIESTROS'}">readonly</c:if>/>
                                </td>
                                <!-- Certificado -->
                                <td class="campocaja">
                                  <input type="text" class="campowidthinput campo campotexto" id="NCERTIF" name="NCERTIF" size="15" style="width:35%;"
                                   value="${__formdata['NCERTIF']}" formato="entero" title="<axis:alt f="axissin002" c="NCERTIF" lit="101096"/>" <c:if test="${!empty __formdata['MODO'] && __formdata['MODO']=='APERTURASINIESTROS'}">readonly</c:if>/>
                                </td>
                                <!-- Siniestro -->
                                <td class="campocaja">
                                  <input type="text" class="campowidthinput campo campotexto" value="${__formdata['NSINIES']}" name="NSINIES" id="NSINIES" size="15"
                                  formato="entero" title="<axis:alt f="axissin002" c="NSINIES" lit="101298"/>"/>
                                </td>
                                <!-- Situación / Estado siniestro -->                                      
                                <td class="campocaja">
                                  <select name= "CESTSIN" id ="CESTSIN" size="1" class="campowidthselect campo campotexto"
                                        <c:if test="${!empty __formdata['MODO'] && __formdata['MODO']=='APERTURASINIESTROS'}">readonly</c:if>>
                                        <option value="null"> - <axis:alt f="axissin002" c="CESTSIN" lit="108341"/> - </option>
                                        <c:forEach var="estado" items="${sessionScope.AXISSIN_ESTADOSSINI}">
                                            <option value="${estado.CATRIBU}" <c:if test="${__formdata['CESTSIN'] == estado.CATRIBU}">selected</c:if>>${estado.TATRIBU}</option>
                                        </c:forEach>
                                    </select>
                                 
                                </td>
                                <!-- Subestado siniestro -->
                                <td class="campocaja">
                                  <select name= "CSUBEST" id ="CSUBEST" size="1" class="campowidthselect campo campotexto"
                                        <c:if test="${!empty __formdata['MODO'] && __formdata['MODO']=='APERTURASINIESTROS'}">readonly</c:if>>
                                        <option value="null"> - <axis:alt f="axissin002" c="CSUBEST" lit="108341"/>- </option>
                                        <c:forEach var="estado" items="${sessionScope.AXISSIN_SUBESTADOSSINI}">
                                            <option value="${estado.CATRIBU}" <c:if test="${__formdata['CSUBEST'] == estado.CATRIBU}">selected</c:if>>${estado.TATRIBU}</option>
                                        </c:forEach>
                                    </select>
                                 
                                </td> 
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axissin002" c="titulocaja" lit="110275"/></div > 
                        <table class="seccion">
                            <tr>
                                <th style="width:25%;height:0px"></th>
                                <th style="width:25%;height:0px"></th>
                                <th style="width:25%;height:0px"></th>
                                <th style="width:25%; height:0px"></th>
                            </tr>
                            <tr>
                                <!-- Número de documento -->
                                <td class="titulocaja">
                                  <b><axis:alt f="axissin002" c="TIPOPERSONA" lit="105330"/></b>
                                </td>
                                <!-- Nombre -->
                                <td class="titulocaja">
                                    <b><axis:alt f="axissin002" c="NNUMIDE" lit="105940"/></b>
                                </td>
                                <!-- Identificador externo -->
                                <td class="titulocaja">
                                  <b><axis:alt f="axissin002" c="BUSCAR" lit="1000088"/></b>
                                </td>
                                <td class="titulocaja">
                                    <b><axis:alt f="axissin002" c="TIPOPERSONA" lit="101027"/>?</b>
                                    <input type="radio" id="TIPOPERSONA" name="TIPOPERSONA" value="1" <c:if test="${__formdata['TIPOPERSONA'] == '1' || empty __formdata['TIPOPERSONA']}">checked</c:if> />
                                </td>
                            </tr>
                            <tr>
                                <!-- Número de documento -->
                                <td class="campocaja">
                                  <input type="text" class="campowidthinput campo campotexto" value="${__formdata['NNUMIDE']}" name="NNUMIDE" id="NNUMIDE" 
                                  size="15"/>
                                </td>
                                 <!-- Nombre -->
                                <td class="campocaja">
                                    <input type="text" class="campowidthinput campo campotexto" name="BUSCAR" id="BUSCAR" size="15" value="${__formdata['BUSCAR']}"/>
                                </td>
                                <!-- Identificador externo -->
                                <td class="campocaja">
                                  <input type="text" class="campowidthinput campo campotexto" name="SNIP" id="SNIP" size="15" value="${__formdata['SNIP']}"
                                   formato="entero" title="<axis:alt f="axissin002" c="SNIP" lit="1000088"/>"/>
                                </td>
                                <td class="titulocaja">
                                    <b><axis:alt f="axissin002" c="TIPOPERSONA" lit="1000078"/></b>
                                    <input type="radio" id="TIPOPERSONA" name="TIPOPERSONA" value="2" <c:if test="${__formdata['TIPOPERSONA'] == '2'}">checked</c:if> />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>    
            <tr>
            </tr>
                        <!-- Lista de siniestros encontrados tran la busqueda -->        

                                 <tr>
                                    <td>
                                    <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axissin002" c="titulocaja" lit="102163"/></div>
                                        <table class="seccion">
                                            <tr>
                                                <td>
                                                    <c:set var="title0">&nbsp;</c:set>
                                                    <c:set var="title1"><axis:alt f="axissin002" c="title1" lit="9001514"/></c:set>
                                                    <c:set var="title2"><axis:alt f="axissin002" c="title2" lit="101298"/></c:set>
                                                    <c:set var="title3"><axis:alt f="axissin002" c="title3" lit="102524"/></c:set>
                                                    <c:set var="title4"><axis:alt f="axissin002" c="title4" lit="112259"/></c:set>
                                                    <c:set var="title5"><axis:alt f="axissin002" c="title5" lit="1000111"/></c:set>
                                                    <div class="seccion displayspaceGrande">
                                                    <display:table name="${sessionScope.AXISSIN_LISTASINIESTROS}" id="miListaId" export="false" class="dsptgtable" pagesize="8" defaultsort="2" defaultorder="ascending" requestURI="modal_axissin002.do?paginar=true" sort="list" cellpadding="0" cellspacing="0">
                                                    <%@ include file="../include/displaytag.jsp"%>
                                                    <display:column headerClass="headwidth5 sortable" title="" media="html" autolink="false" >
                                                        <div class="dspIcons">
                                                        <input value="${miListaId['NSINIES']}/${miListaId['SSEGURO']}" type="radio" onclick="f_habilitar_boton_aceptar()" id="radioSiniestro" name="radioSiniestro"
                                                           <c:if test="${!empty __formdata['MODO'] && __formdata['MODO']=='APERTURASINIESTROSS'}">disabled</c:if>/></div>
                                                    </display:column>
                                                    <display:column title="${title1}" sortable="true" sortProperty="NPOLIZA" headerClass="headwidth10 sortable"  media="html" autolink="false" >
                                                        <div class="dspNumber"><a href="javascript:f_seleccionar_siniestro('${miListaId.NSINIES}', '${miListaId['SSEGURO']}')">${miListaId['NPOLIZA']}</a></div>
                                                    </display:column>
                                                    <display:column title="${title2}" sortable="true" sortProperty="NSINIES" headerClass="headwidth10 sortable"  media="html" autolink="false" >
                                                        <div class="dspNumber"><a href="javascript:f_seleccionar_siniestro('${miListaId.NSINIES}', '${miListaId['SSEGURO']}')">${miListaId['NSINIES']}</a></div>
                                                    </display:column>
                                                    <display:column title="${title3}" sortable="true" sortProperty="TRIESGO" headerClass="sortable"  media="html" autolink="false" >
                                                        <div class="dspText"><a href="javascript:f_seleccionar_siniestro('${miListaId.NSINIES}', '${miListaId['SSEGURO']}')">${miListaId['TRIESGO']}</a></div>
                                                    </display:column>
                                                    <display:column title="${title4}" sortable="true" sortProperty="TESTSIN" headerClass="headwidth10 sortable"  media="html" autolink="false" >
                                                            <div class="dspText"><a href="javascript:f_seleccionar_siniestro('${miListaId.NSINIES}', '${miListaId['SSEGURO']}')">${miListaId['TESTSIN']}</a></div>
                                                    </display:column>
                                                    <display:column title="${title5}" sortable="true" sortProperty="TPRODUC" headerClass="sortable"  media="html" autolink="false" >
                                                            <div class="dspText"><a href="javascript:f_seleccionar_siniestro('${miListaId.NSINIES}', '${miListaId['SSEGURO']}')">${miListaId['TPRODUC']}</a></div>
                                                    </display:column>
                                                    </display:table>
                                                    <c:choose>
                                                    <c:when test="${!empty sessionScope.AXISSIN_LISTASINIESTROS}">
                                                        <c:if test="${ !(fn:containsIgnoreCase(header['User-Agent'],'ipad') ) }">
                                                            <script language="javascript">objUtiles.retocarDsptagtable("miListaId");</script>
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
                                    </td>
                                      </tr>
                        <!-- Fin lista siniestros encontrados -->								
		</td>
		</tr>
            </table>
		
<!-- Area lista de siniestros -->              
                
            
    </table>
       <!-- Botonera -->
        <c:import url="../include/botonera_nt.jsp">
            <c:param name="f">axissin002</c:param>
            <c:param name="__botones">cancelar,buscar,aceptar</c:param>
        </c:import>
     </form>
        <c:import url="../include/mensajes.jsp" />
    </body>
</html>





