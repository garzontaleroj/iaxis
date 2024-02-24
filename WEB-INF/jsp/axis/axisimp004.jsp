<%/**
*  Fichero: axisimp004.jsp
*  Pantalla de impuestos por empresa.
*  @author <a href = "mailto:rkirchner@csi-ti.com">Roger Kirchner</a>
*
*  Fecha: 19/12/2008
*/
%>
<%@ page contentType="text/html;charset=windows-1252"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">

<html>
    <head>
        <title><fmt:message key="1000233"/></title>
        <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>

        <style type="text/css">
            .displayspaceMaximo {
                width:99.8%;
                height: expression( this.scrollHeight > 349 ? "350px" : "auto" );
                max-height:350px;
                overflow-x: hidden;
                overflow-y: auto;
                border: 1px solid #DDDDDD;
            }
        </style>

        <c:import url="../include/carga_framework_js.jsp" />

        <script type="text/javascript">

            /****************************************************************************************/
            /*********************************** NAVEGACION *****************************************/
            /****************************************************************************************/

            function f_onload() {
                revisarEstilos();
                if (objUtiles.estaVacio("${sessionScope.IMP_LSTIMPUESTOS}"))
                    f_but_buscar();
            }

            function f_but_buscar() {
                objDom.setVisibilidadPorId("but_cerrar_modal_axisimp003", "hidden");
                objUtiles.abrirModal("axisimp003", "src", "modal_axisimp003.do?operation=form");
            }

            function f_but_salir() {
                objAjax.invokeAsyncCGI("modal_axisimp003.do", callbackCancelar, "operation=cancelar", this);
            }

            function f_but_nuevo() {
                objUtiles.abrirModal("axisimp005", "src", "modal_axisimp005.do?operation=form&isNew=true");
            }

            /****************************************************************************************/
            /********************************* MODAL AXISIMP005 *************************************/
            /****************************************************************************************/

            function f_cerrar_modal(cual) {
                objUtiles.cerrarModal(cual);
            }

            function f_aceptar_modal(cual, params) {
                f_cerrar_modal(cual);
                if (cual == "axisimp003" || cual == "axisimp005")
                    // Recargar AXISIMP004
                    objUtiles.ejecutarFormulario ("axis_axisimp004.do" + (!objUtiles.estaVacio(params) ? params : ""),
                        "form", document.miForm, "_self", objJsMessages.jslit_cargando);
            }

            function f_selecciona_impuesto(CFRACCID,CBONIFID,CRECFRAD,CTIPCON,NVALCON,obj){
             if(CFRACCID=="1"){
                document.miForm.CFRACCI.checked = true;
                }
             else{
               document.miForm.CFRACCI.checked = false;
             }
             if(CBONIFID=="1"){
                document.miForm.CBONIFI.checked = true;
                }
             else{
               document.miForm.CBONIFI.checked = false;
             }
             if(CRECFRAD=="1"){
                document.miForm.CRECFRA.checked = true;
                }
             else{
               document.miForm.CRECFRA.checked = false;
             }
              Select_Value_Set("CTIPCON", CTIPCON);
           //   document.miForm.CTIPCON.setAttribute('value',CTIPCON);
              //objDom.setValorPorId("CTIPCON", CATRIBU);
              objDom.setValorPorId("NVALCON", NVALCON);
            }

            function Select_Value_Set(SelectName, Value) {
              eval('SelectObject = document.miForm.' +
                SelectName + ';');
              for(index = 0;
                index < SelectObject.length;
                index++) {
               if(SelectObject[index].value == Value)
                 SelectObject.selectedIndex = index;
               }
            }


            /****************************************************************************************/
            /******************************* CALLBACKS AJAX *****************************************/
            /****************************************************************************************/

            function callbackCancelar() {
                objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axisimp004", "cancelar", document.miForm, "_self");
            }

        </script>
    </head>

    <body onunload="try { f_clear_resources(document.body) } catch (e) {}" onload="f_onload()" onkeypress="if (event.keyCode==13)  { f_but_buscar() }">

        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>

        <form name="miForm" action="" method="POST">
            <input type="hidden" name="operation" value=""/>

            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><fmt:message key="9000694"/></c:param> <%-- Mantenimiento de impuestos --%>
                <c:param name="titulo"><fmt:message key="9000694"/></c:param> <%-- Mantenimiento de impuestos --%>
                <c:param name="form">axisimp004</c:param>
            </c:import>

            <c:import url="../include/modal_estandar.jsp">
                <c:param name="nid_y_titulo">axisimp003|<fmt:message key="9000696"/><%-- Búsqueda de impuestos --%>#axisimp005|<fmt:message key="9000695"/><%-- Modificación de impuestos --%></c:param>
            </c:import>


            <!-- Área de campos  -->
            <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <div class="separador">&nbsp; </div>
                        <!-- Sección 1 -->
                        <table class="seccion">
                            <tr>
                                <td>
                                    <!-- Área 1 -->
                                    <table class="area" align="center">
                                        <tr>
                                            <th style="width:25%;height:0px"></th>
                                            <th style="width:25%;height:0px"></th>
                                            <th style="width:25%;height:0px"></th>
                                            <th style="width:25%;height:0px"></th>
                                        </tr>
                                        <tr>
                                            <td class="titulocaja">
                                                <b><fmt:message key="101619"/></b>   <%-- Empresa --%>
                                            </td>
                                            <td class="titulocaja">
                                                &nbsp;
                                            </td>
                                        </tr>
                                        <tr>
                                            <%-- Empresa --%>
                                            <td class="campocaja">
                                                ${__formdata.TEMPRES}
                                            </td>
                                        <tr>
                                            <td colspan = "4">
                                                <div class="separador">&nbsp; </div>
                                                <div class="separador">&nbsp; </div>
                                                <%-- DisplayTag Impuestos --%>
                                                <c:set var="title0"><fmt:message key="9000715"/></c:set>  <%-- Concepto --%>
                                                <c:set var="title1"><fmt:message key="100784"/></c:set>  <%-- Ramo --%>
                                                <c:set var="title2"><fmt:message key="100829"/></c:set>  <%-- Producte. --%>
                                                <c:set var="title3"><fmt:message key="103481"/></c:set>  <%-- Actividad --%>
                                                <c:set var="title4"><fmt:message key="100561"/></c:set>  <%-- Garantía --%>
                                                <c:set var="title5"><fmt:message key="100712"/></c:set>  <%-- Forma de pago --%>
                                                <c:set var="title6"><fmt:message key="9000716"/></c:set>  <%-- F.Inicio Vigencia --%>
                                                <c:set var="title7"><fmt:message key="9000717"/></c:set>  <%-- F.Fi Vigencia --%>

                                                <div class="displayspaceMaximo">
                                                    <display:table name="${sessionScope.IMP_LSTIMPUESTOS}" id="LSTIMPUESTOS" export="false" class="dsptgtable" pagesize="-1" cellpadding="0" cellspacing="0" sort="list"
                                                         requestURI="axis_axisimp004.do?paginar=true">
                                                        <%@ include file="../include/displaytag.jsp"%>
                                                        <display:column title=" " sortable="false" headerClass="headwidth5 sortable fixed"  media="html" autolink="false" >
                                                             <div class="dspIcons"><input type="radio" id="checked_poliza" name="checked_poliza" onClick="javascript:f_selecciona_impuesto('${LSTIMPUESTOS.CFRACCI}','${LSTIMPUESTOS.CBONIFI}','${LSTIMPUESTOS.CRECFRA}','${LSTIMPUESTOS.CTIPCON}','${LSTIMPUESTOS.NVALCON}',this)" /></div>
                                                        </display:column>
                                                        <display:column title="${title0}" sortable="true" sortProperty="DESCCONCEP" headerClass="sortable fixed"  media="html" autolink="false" >
                                                            <div class="dspText">
                                                                ${LSTIMPUESTOS.DESCCONCEP}
                                                            </div>
                                                        </display:column>
                                                        <display:column title="${title1}" sortable="true" sortProperty="DESCRAMO" headerClass="sortable fixed"  media="html" autolink="false" >
                                                            <div class="dspText">
                                                                ${LSTIMPUESTOS.DESCRAMO}
                                                            </div>
                                                        </display:column>
                                                        <display:column title="${title2}" sortable="true" sortProperty="DESC_PROD" headerClass="sortable fixed"  media="html" autolink="false" >
                                                            <div class="dspText">
                                                                ${LSTIMPUESTOS.DESC_PROD}
                                                            </div>
                                                        </display:column>
                                                        <display:column title="${title3}" sortable="true" sortProperty="DESCACTIVI" headerClass="sortable fixed"  media="html" autolink="false" >
                                                            <div class="dspText">
                                                                ${LSTIMPUESTOS.DESCACTIVI}
                                                            </div>
                                                        </display:column>
                                                        <display:column title="${title4}" sortable="true" sortProperty="DESCGARANT" headerClass="sortable fixed"  media="html" autolink="false" >
                                                            <div class="dspText">
                                                                ${LSTIMPUESTOS.DESCGARANT}
                                                            </div>
                                                        </display:column>
                                                        <display:column title="${title5}" sortable="true" sortProperty="DESCFORPAG" headerClass="sortable fixed"  media="html" autolink="false" >
                                                            <div class="dspText">
                                                                ${LSTIMPUESTOS.DESCFORPAG}
                                                            </div>
                                                        </display:column>
                                                        <display:column title="${title6}" sortable="true" sortProperty="FINIVIG" headerClass="sortable fixed"  media="html" autolink="false" >
                                                            <div class="dspDate"><fmt:formatDate value="${LSTIMPUESTOS.FINIVIG}" pattern="dd/MM/yyyy"/></div>
                                                        </display:column>
                                                        <display:column title="${title7}" sortable="true" sortProperty="FFINVIG" headerClass="sortable fixed"  media="html" autolink="false" >
                                                            <div class="dspDate"><fmt:formatDate value="${LSTIMPUESTOS.FFINVIG}" pattern="dd/MM/yyyy"/></div>
                                                        </display:column>
                                                        <display:column title="" sortable="true" sortProperty="" headerClass="headwidth5 sortable fixed"  media="html" autolink="false" >
                                                             <div class="dspIcons">
                                                                <a href="javascript:objUtiles.abrirModal('axisimp005', 'src', 'modal_axisimp005.do?operation=form&isNew=false&CEMPRES=${LSTIMPUESTOS.CEMPRES}&CRAMO=${LSTIMPUESTOS.CRAMO}&SPRODUC=${LSTIMPUESTOS.SPRODUC}&CACTIVI=${LSTIMPUESTOS.CACTIVI}&CGARANT=${LSTIMPUESTOS.CGARANT}&CCONCEP=${LSTIMPUESTOS.CCONCEP}&CFORPAG=${LSTIMPUESTOS.CFORPAG}&NCONCEP=${LSTIMPUESTOS.NCONCEP}&CTIPCON=${LSTIMPUESTOS.CTIPCON}&NVALCON=${LSTIMPUESTOS.NVALCON}&FINIVIG=<fmt:formatDate value="${LSTIMPUESTOS.FINIVIG}" pattern="dd/MM/yyyy"/>&FFINVIG=<fmt:formatDate value="${LSTIMPUESTOS.FFINVIG}" pattern="dd/MM/yyyy"/>&CFRACCI=${LSTIMPUESTOS.CFRACCI}&CBONIFI=${LSTIMPUESTOS.CBONIFI}&CRECFRA=${LSTIMPUESTOS.CRECFRA}')"><img border="0" alt="<fmt:message key='100002'/>"
                                                                title="<fmt:message key='100002'/>" src="images/lapiz.gif"/></a></div>
                                                            </div>
                                                        </display:column>
                                                    </display:table>
                                                </div>
                                                <div class="separador">&nbsp; </div>
                                                <div class="separador">&nbsp; </div>
                                                <table class="seccion" align="center">
                                                    <tr>
                                                        <th style="width:2%;height:0px"></th>
                                                        <th style="width:33%;height:0px"></th>
                                                        <th style="width:33%;height:0px"></th>
                                                        <th style="width:31%;height:0px"></th>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            &nbsp;
                                                        </td>

                                                        <td class="titulocaja">
                                                            <b><fmt:message key="9000720"/></b>   <%-- Tipo concepto --%>
                                                        </td>
                                                        <td class="titulocaja">
                                                            <b><fmt:message key="9000723"/></b>   <%-- Valor concepto --%>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            &nbsp;
                                                        </td>
                                                        <%-- Tipo concepto --%>
                                                        <td class="campocaja">
                                                            <select name="CTIPCON" id="CTIPCON" size="1" class="campo campotexto" style="width:90%" disabled="disabled"
                                                            title="<fmt:message key="9000720"/>" onchange="">
                                                                <option value="null"></option>
                                                                <c:forEach items="${sessionScope.IMP_LSTTIPOSCONCEPTO}" var="item">
                                                                    <option value = "${item.CATRIBU}" <c:if test="${__formdata.CTIPCON != 'null' && __formdata.CTIPCON == item.CATRIBU}"> selected </c:if>>${item.TATRIBU}</option>
                                                                </c:forEach>
                                                            </select>
                                                        </td>
                                                        <%-- Valor concepto --%>
                                                        <td class="campocaja">
                                                            <input type="text" class="campowidthinput campo campotexto" size="15" style="width:25%;" disabled="disabled"
                                                            value="${__formdata.NVALCON}" name="NVALCON" id="NVALCON"
                                                            alt="<fmt:message key="9000723"/>" title="<fmt:message key="9000723"/>"/>
                                                            <a style="vertical-align:middle;">
                                                        </td>
                                                    </tr>
                                                </table>
                                                <div class="separador">&nbsp; </div>
                                                <table class="seccion" align="center">
                                                    <tr>
                                                        <th style="width:2%;height:0px"></th>
                                                        <th style="width:98%;height:0px"></th>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            &nbsp;
                                                        </td>
                                                        <td class="titulocaja">
                                                            <b><fmt:message key="9000810"/></b>   <%-- Fraccionado --%>
                                                            <input type="checkbox" id="CFRACCI" name="CFRACCI" onclick="this.checked ? this.value = 1 : this.value = 0"
                                                            value="${__formdata.CFRACCI}" disabled="disabled"
                                                            <c:if test="${__formdata.CFRACCI == '1'}"> checked="checked" </c:if> />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            &nbsp;
                                                        </td>
                                                        <td class="titulocaja">
                                                            <b><fmt:message key="9000811"/></b>   <%-- Bonifi. --%>
                                                            <input type="checkbox" id="CBONIFI" name="CBONIFI" onclick="this.checked ? this.value = 1 : this.value = 0"
                                                            value="${__formdata.CBONIFI}" disabled="disabled"
                                                            <c:if test="${__formdata.CBONIFI == '1'}"> checked="checked" </c:if> />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            &nbsp;
                                                        </td>
                                                        <td class="titulocaja">
                                                            <b><fmt:message key="9000812"/></b>   <%-- Rec. Fracc. --%>
                                                            <input type="checkbox" id="CRECFRA" name="CRECFRA" onclick="this.checked ? this.value = 1 : this.value = 0"
                                                            value="${__formdata.CRECFRA}" disabled="disabled"
                                                            <c:if test="${__formdata.CRECFRA == '1'}"> checked="checked" </c:if> />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                        <div class="separador">&nbsp; </div>
                        <c:import url="../include/botonera_nt.jsp">
                            <c:param name="f">axisimp004</c:param>
                            <c:param name="__botones">salir,buscar,nuevo</c:param>
                        </c:import>
                    </td>
                </tr>
            </table>
        </form>
        <c:import url="../include/mensajes.jsp" />
    </body>
</html>
