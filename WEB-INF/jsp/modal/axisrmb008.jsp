<%
/**
*  Fichero: axisctr019.jsp
*  @author <a href = "mailto:xpastor@csi-ti.com">Xavi Pastor</a>
*  Fecha: 26/09/2008
*/
%>
<%@ page contentType="text/html;charset=windows-1252" errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>

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
            /*s
            if (!document.miForm.tomador.checked && !document.miForm.asegurado.checked)  document.miForm.tomador.checked = true;
            */            
            revisarEstilos();
            try{
            document.miForm.NNUMIDE.focus();
            }catch(e){}
            // Retocar tabla en IE
            if (document.all) // ES Explorer
                document.getElementById("tabla1").style.marginLeft="1.3%";
                
              <c:if test="${!empty sessionScope.axisctr_listaPolizas && fn:length(sessionScope.axisctr_listaPolizas) == 1}">  
                    var SSEGURO = "${sessionScope.axisctr_listaPolizas[0].SSEGURO}";
                    var NRIESGO = "${sessionScope.axisctr_listaPolizas[0].NUM_RIESGO}";
                    objUtiles.ejecutarFormulario("modal_axisrmb003.do?SALTAR=1&SSEGURO="+SSEGURO+"&NRIESGO="+NRIESGO,"alta_reembolso",document.miForm, "_self", objJsMessages.jslit_cargando);   
              </c:if>
            f_cargar_propiedades_pantalla();
        }
        
        function f_but_cancelar() {
            parent.f_cerrar_modal ("axisrmb008");
        }   
        
        function f_but_buscar() {
            /*
            if (!document.miForm.tomador.checked && !document.miForm.asegurado.checked)
                alert(objJsMessages.jslit_seleccionar_tomador_o_asegurado);
            else{
                if (objValidador.validaEntrada())
                    objUtiles.ejecutarFormulario("modal_axisctr019.do", "buscar", document.miForm, "_self", objJsMessages.jslit_buscando_polizas);
            }
            */
            if (objValidador.validaEntrada()) objUtiles.ejecutarFormulario("modal_axisrmb008.do", "buscar", document.miForm, "_self", objJsMessages.jslit_buscando_polizas);
            
        }
        
          function f_but_aceptar() {
            var hayChecked = objUtiles.f_GuardaCasillasChecked ("checked_poliza");
            
            if (typeof hayChecked == 'boolean') {
                    alert(objJsMessages.jslit_selecciona_registro);
            } else {
                var splitted = objUtiles.utilSplit(hayChecked, "/");
                var SSEGURO = splitted[0];
                var NRIESGO = splitted[1];
                f_but_ok(SSEGURO,NRIESGO);
            }
        }
         
        function f_but_ok(cual,NRIESGO) {
            var SSEGURO = "";
            if (!objUtiles.estaVacio(cual)) 
                // Seleccionada por el hipervínculo
                SSEGURO = cual;
            else if (!objUtiles.estaVacio(document.miForm.checked_poliza)) {
                // Checkeada por el radio button
                SSEGURO = objUtiles.f_GuardaCasillasChecked("checked_poliza");
            } 
            
            if (typeof SSEGURO == 'boolean' || objUtiles.estaVacio (SSEGURO)) 
                alert(objJsMessages.jslit_selecciona_una_poliza);
            else
                // Si hay una seleccionada, llamar al Action.
                objUtiles.ejecutarFormulario("modal_axisrmb003.do?SALTAR=1&SSEGURO="+SSEGURO+"&NRIESGO="+NRIESGO,"alta_reembolso",document.miForm, "_self", objJsMessages.jslit_cargando);   
                //parent.f_aceptar_axisrmb008(SSEGURO);
         }
         
         
         
    </script>
  </head>
    <body class=" " onload="f_onload()" onkeypress="if (event.keyCode==13)  { f_but_buscar() }">
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
        <form name="miForm" action="" method="POST">
            <input type="hidden" id="operation" name="operation" value=""/>
            
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt f="axisrmb008" c="formulario" lit="1000188"/></c:param>
                <c:param name="producto"><axis:alt f="axisrmb008" c="producto" lit="1000188"/></c:param>
                <c:param name="form">axisrmb008</c:param>
            </c:import>
            <!-- Area de campos  -->
            <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <!--campos-->
                        <table class="seccion">
                            <tr>
                                <th style="width:25%;height:0px"></th>
                                <th style="width:25%;height:0px"></th>
                                <th style="width:25%;height:0px"></th>
                                <th style="width:25%;height:0px"></th>
                                <th style="width:25%;height:0px"></th>
                            </tr>
                            <tr>
                                <td class="titulocaja">
                                    <b><axis:alt f="axisrmb008" c="SPRODUC" lit="100829"/></b>
                                </td>
                                <td class="titulocaja">
                                    <b><axis:alt f="axisrmb008" c="NPOLIZA" lit="100836"/></b>
                                </td>
                                <td class="titulocaja">
                                    <b><axis:alt f="axisrmb008" c="NCERT" lit="101300"/></b>
                                </td>
                            </tr>
                            <tr>
                                <td class="campocaja">
                                    <select name = "SPRODUC" id ="SPRODUC" size="1" onchange="" class="campowidthselect campo campotexto">
                                        <option value=""> - <axis:alt f="axisrmb008" c="SPRODUC" lit="108341"/> - </option>
                                        <c:forEach items="${productos}" var="item">
                                            <option value = "${item.SPRODUC}" <c:if test="${__formdata['SPRODUC']==item.SPRODUC}">selected</c:if> >${item.TTITULO}</option>
                                        </c:forEach>
                                    </select>
                                </td>
                                <td class="campocaja">
                                    <input type="text" class="campowidthinput campo campotexto" value="${__formdata.NPOLIZA}" name="NPOLIZA" id="NPOLIZA" title="<axis:alt f="axisrmb008" c="NPOLIZA" lit="100836"/>" size="15" 
                                    formato="entero" title="<axis:alt f="axisrmb008" c="NPOLIZA" lit="100836"/>"/>
                                </td>
                                <td class="campocaja">
                                    <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.NCERT}" name="NCERT" id="NCERT"
                                    formato="entero" title="<axis:alt f="axisrmb008" c="NCERT" lit="101096"/>"/>
                                </td>
                            </tr>
                        </table>
                        <div class="separador">&nbsp;</div>
                        <table class="seccion">
                            <tr>
                                <th style="width:25%;height:0px"></th>
                                <th style="width:25%;height:0px"></th>
                                <th style="width:25%;height:0px"></th>
                                <th style="width:25%;height:0px"></th>
                            </tr>
                            <tr>
                                <td class="titulocaja">
                                    <b><axis:alt f="axisrmb008" c="TIPOPERSONA" lit="105330"/></b>
                                </td>
                                <td class="titulocaja">
                                    <b><axis:alt f="axisrmb008" c="NNUMIDE" lit="105940"/></b>
                                </td>
                                <td class="titulocaja">
                                    <b><axis:alt f="axisrmb008" c="BUSCAR" lit="1000088"/></b>
                                </td>
                                <td class="titulocaja">
                                    <b><axis:alt f="axisrmb008" c="TIPOPERSONA" lit="101027"/>?</b>
                                    <input type="radio" id="TIPOPERSONA" name="TIPOPERSONA" value="1" <c:if test="${__formdata['TIPOPERSONA'] == '1'}">checked</c:if> />
                                </td>
                            </tr>
                            <tr>
                                 <td class="campocaja">
                                    <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata['NNUMIDE']}" name="NNUMIDE" id="NNUMIDE"/>
                                </td>
                                <td class="campocaja">
                                    <input type="text" class="campowidthinput campo campotexto" value="${__formdata['BUSCAR']}" name="BUSCAR" id="BUSCAR" size="15"/>
                                </td>
                                <td class="campocaja">
                                    <input type="text" class="campowidthinput campo campotexto" value="${__formdata['SNIP']}" name="SNIP" id="SNIP" size="15"
                                    formato="entero" title="<axis:alt f="axisrmb008" c="BUSCAR" lit="1000088"/>"/>
                                </td>                                
                               
                                <td class="titulocaja">
                                    <b><axis:alt f="axisrmb008" c="TIPOPERSONA" lit="1000078"/></b>
                                    <input type="radio" id="TIPOPERSONA" name="TIPOPERSONA" value="2" <c:if test="${__formdata['TIPOPERSONA'] == '2' || empty __formdata['TIPOPERSONA']}">checked</c:if> />
                                </td>
                            </tr>
                        </table>
                        <div class="separador">&nbsp;</div>
                            <!-- DisplayTag Pólizas -->
                            <c:set var="title1"><axis:alt f="axisrmb008" c="title1" lit="151463"/></c:set>
                            <c:set var="title2"><axis:alt f="axisrmb008" c="title2" lit="101027"/></c:set>
                            <c:set var="title22"><axis:alt f="axisrmb008" c="titl221" lit="101028"/></c:set>
                            <c:set var="title3"><axis:alt f="axisrmb008" c="title3" lit="100874"/></c:set>
                            <c:set var="title4"><axis:alt f="axisrmb008" c="title4" lit="100829"/></c:set>
                            <c:set var="title5"><axis:alt f="axisrmb008" c="title5" lit="101168"/></c:set>               
               
                            <div class="seccion displayspaceGrande">
                                <display:table name="${sessionScope.axisctr_listaPolizas}" id="miListaId" export="false" class="dsptgtable" pagesize="8" defaultsort="1" defaultorder="ascending" requestURI="modal_axisrmb008.do?paginar=true" sort="list" cellpadding="0" cellspacing="0">
                                    <%@ include file="../include/displaytag.jsp"%>
                                    <display:column title="" sortable="false" headerClass="headwidth5 sortable"  media="html" autolink="false" >    
                                        <div class="dspIcons"><input <c:if test="${miListaId['checkedPoliza']}">checked</c:if> type="radio" id="checked_poliza" name="checked_poliza" value="${miListaId['SSEGURO']}/${miListaId['NUM_RIESGO']}"/></div>
                                    </display:column>
                                    <display:column title="${title1}" sortable="true" sortProperty="NPOLIZA" headerClass="headwidth5 sortable"  media="html" autolink="false" >    
                                        <div class="dspNumber">${miListaId['NPOLIZA']}</div>
                                    </display:column>
                                    <display:column title="${title5}" sortable="true" sortProperty="NCERTIF" headerClass="headwidth5 sortable"  media="html" autolink="false" >    
                                        <div class="dspNumber">${miListaId['NCERTIF']}</div>
                                    </display:column>
                                    <display:column title="${title2}" sortable="true" sortProperty="NOMBRE" headerClass="headwidth25 sortable" style="width:22%"  media="html" autolink="false" >
                                        <div class="dspText"><a href="javascript:f_but_ok('${miListaId['SSEGURO']}','${miListaId['NUM_RIESGO']}')">${miListaId['NOMBRE']}</a></div>
                                    </display:column>
                                    <display:column title="${title22}" sortable="true" sortProperty="NOMBRE_ASEGURADO" headerClass="headwidth25 sortable" style="width:22%"  media="html" autolink="false" >
                                        <div class="dspText"><a href="javascript:f_but_ok('${miListaId['SSEGURO']}','${miListaId['NUM_RIESGO']}')">${miListaId['NOMBRE_ASEGURADO']}</a></div>
                                    </display:column>
                                    <display:column title="${title3}" sortable="true" sortProperty="SITUACION" headerClass="headwidth10 sortable" style="width:10%"  media="html" autolink="false" >
                                        <div class="dspText"><a href="javascript:f_but_ok('${miListaId['SSEGURO']}','${miListaId['NUM_RIESGO']}')">${miListaId['SITUACION']}</a></div>
                                    </display:column>
                                    <display:column title="${title4}" sortable="true" sortProperty="DESPRODUCTO" headerClass="headwidth20 sortable" style="width:26%"  media="html" autolink="false" >
                                        <div class="dspText"><a href="javascript:f_but_ok('${miListaId['SSEGURO']}','${miListaId['NUM_RIESGO']}')">${miListaId['DESPRODUCTO']}</a></div>
                                    </display:column>
                                </display:table>
                                <c:choose>
                                <c:when test="${!empty sessionScope.axisctr_listaPolizas}">
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
            <c:import url="../include/botonera_nt.jsp">
                <c:param name="f">axisrmb008</c:param>
                <c:param name="__botones">cancelar,buscar,aceptar</c:param>
            </c:import>
     </form>
    <c:import url="../include/mensajes.jsp" />
    </body>
</html>

