<%/*
*  Fichero: axispro033.jsp
*
*  @author <a href="mailto:amartinez@csi-ti.com">Alex Martinez</a>
*  Fecha: 31/03/2010
*/
%>

<%@ page contentType="text/html;charset=iso-8859-15" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <link rel="stylesheet" href="styles/genericosHtml.css" type="text/css">
    <link rel="stylesheet" href="styles/axisnt.css" type="text/css">
    <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>
    <c:import url="../include/carga_framework_js.jsp" />    
    <script type="text/javascript">
    
        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/
        
        function f_but_salir() {
           parent.f_aceptar_modal("axispro033");
        }
        
        function f_onload(){
        
            var modo = "${__formdata.VMODO}";
            
            if (modo == 'PROD') {
                objDom.setDisplayPorId("CCACTIVI","none");
                objDom.setDisplayPorId("TTACTIVI","none");
                objDom.setDisplayPorId("TACTIVIDAD","none");
                objDom.setDisplayPorId("CCGARANT","none");
                objDom.setDisplayPorId("TTGARANT","none");
                objDom.setDisplayPorId("TGARANTIA","none");
            }
            else if (modo == 'ACT'){
                objDom.setDisplayPorId("CCACTIVI","block");
                objDom.setDisplayPorId("TTACTIVI","block");
                objDom.setDisplayPorId("TACTIVIDAD","block");
                objDom.setDisplayPorId("CCGARANT","none");
                objDom.setDisplayPorId("TTGARANT","none");
                objDom.setDisplayPorId("TGARANTIA","none");
            }
            else if (modo == 'GAR'){
                objDom.setDisplayPorId("CCACTIVI","block");
                objDom.setDisplayPorId("TTACTIVI","block");
                objDom.setDisplayPorId("TACTIVIDAD","block");
                objDom.setDisplayPorId("CCGARANT","block");
                objDom.setDisplayPorId("TTGARANT","block");
                objDom.setDisplayPorId("TGARANTIA","block");
            }
            //revisarEstilos();
            f_cargar_propiedades_pantalla(); 
        }
        
        function f_abrir_modal() {
            objUtiles.abrirModal("axispro041", "src", "modal_axispro041.do?operation=form&MODO="+document.miForm.VMODO.value+"&SPRODUC="+document.miForm.VSPRODUC.value+"&CACTIVI="+document.miForm.VCACTIVI.value+"&CGARANT="+document.miForm.VCGARANT.value);        
        }
        
        function f_modificar_pregunta(cpregunta){
            objUtiles.abrirModal("axispro041", "src", "modal_axispro041.do?operation=form&MODO="+document.miForm.VMODO.value+"&SPRODUC="+document.miForm.VSPRODUC.value+"&CACTIVI="+document.miForm.VCACTIVI.value+"&CGARANT="+document.miForm.VCGARANT.value+"&CPREGUN="+cpregunta);  
        }
        
        function f_borrar_pregunta(cpregunta){
            objUtiles.ejecutarFormulario("modal_axispro033.do?CPREGUN="+cpregunta, "borrarpreg", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
      
        function f_cerrar_modal(cual) {
            objUtiles.cerrarModal(cual);
        }
        
        function f_aceptar_axispro041(){
            f_cerrar_modal('axispro041');
            objUtiles.ejecutarFormulario("modal_axispro033.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
           
    </script>
  </head>
  
  <body onload="f_onload()">
    <c:import url="../include/precargador_ajax.jsp"><c:param name="imagen" value="images/ajax-loader.gif"></c:param></c:import>
    
    <c:import url="../include/modal_estandar.jsp">
        <c:param name="nid_y_titulo">axispro041|<axis:alt f="axispro033" c="fm041" lit="9901125"/></c:param>
    </c:import>
    
    <form name="miForm" action="modal_axispro033.do" method="POST">         
        <c:import url="../include/titulo_nt.jsp">
            <c:param name="formulario"><axis:alt f="axispro033" c="form" lit="9901153"/></c:param>
            <c:param name="form">axispro033</c:param>
            <c:param name="titulo"><axis:alt f="axispro033" c="titulo" lit="9901153"/></c:param>
        </c:import>

        <input type="hidden" id="VSPRODUC" name="VSPRODUC" value="${mntproducto.SPRODUC}"/>
        <input type="hidden" id="VCACTIVI" name="VCACTIVI" value="${ACTIVIDAD}"/>
        <input type="hidden" id="VCGARANT" name="VCGARANT" value="${CGARANTIA}"/>
        <input type="hidden" id="operation" name="operation" value=""/>
        <input type="hidden" id="VMODO" name="VMODO" value="${__formdata.VMODO}"/>
    
        <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td>
                    <div class="separador">&nbsp;</div>
                    <table class="seccion">
                        <tr>
                            <th style="width:2%;height:0px"></th>
                            <th style="width:5%;height:0px"></th>
                            <th style="width:60%;height:0px"></th>
                            <th style="width:25%;height:0px"></th>
                            <th style="width:10%;height:0px"></th>
                        </tr>
                        <!-- Producto -->
                        <tr>
                            <td></td>
                            <td class="titulocaja">
                                <b><axis:alt f="axispro033" c="tproducto" lit="100829" /></b>
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td class="campocaja">
                                <input type="text" class="campowidthinput campo campotexto" value="${mntproducto.SPRODUC}" name="SPRODUC" id="SPRODUC" size="15" readonly="true"/>
                            </td>
                            <td class="campocaja">
                                <input type="text" class="campowidthinput campo campotexto" value="${mntproducto.TITULO[0].OB_IAX_PRODTITULO.TTITULO}" name="TPRODUC" id="TPRODUC" size="15" readonly="true"/>
                            </td>
                        </tr>
                        <!-- Actividad -->
                        <tr>
                            <td></td>
                            <td class="titulocaja" id="TACTIVIDAD">
                                <b ><axis:alt f="axispro033" c="tactivi" lit="103481" /></b>
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td class="campocaja" id="CACTIVI">
                                <input type="text" class="campowidthinput campo campotexto" value="${ACTIVIDAD}" name="CACTIVI" id="CACTIVI" size="15" readonly="true"/>
                            </td>
                            <td class="campocaja" id="TACTIVI">
                                <input type="text" class="campowidthinput campo campotexto" value="${TACTIVIDAD}" name="TACTIVI" id="TACTIVI" size="15" readonly="true"/>
                            </td>
                        </tr>
                        <!-- Garantia -->
                        <tr>
                            <td></td>
                            <td class="titulocaja"  >
                                <b id="TGARANTIA"><axis:alt f="axispro033" c="tgaran" lit="100561"/></b>
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td class="campocaja" id="CGARANT">
                                <input type="text" class="campowidthinput campo campotexto" value="${CGARANTIA}" name="CGARANT" id="CGARANT" size="15" readonly="true"/>
                            </td>
                            <td class="campocaja" id="TGARANT">
                                <input type="text" class="campowidthinput campo campotexto" value="${TGARANTIA}" name="TGARANT" id="TGARANT" size="15" readonly="true"/>
                            </td>
                        </tr>
                    </table>
                    <div class="separador">&nbsp;</div>
                    <div  class="" style="float:left;"><img src="images/flecha.gif"/><b><axis:alt f="axispro033" c="tflecha" lit="102299"/></b></div>
                    <div  style="float:right;"> <a href="javascript:f_abrir_modal()">  <img border="0" alt="<axis:alt f="axispro033" c="tabrir" lit="9901126"/>"   title="<axis:alt f="axispro033" c="tabrir" lit="9901126"/>" src="images/new.gif"/></a></div>    
                    <div style="clear:both;"><hr class="titulo"></div>
                    <table class="seccion">
                        <tr>
                            <th style="width:2%;height:0px"></th>
                            <th style="width:30%;height:0px"></th>
                            <th style="width:25%;height:0px"></th>
                            <th style="width:43%;height:0px"></th>
                            <th style="width:2%;height:0px"></th>
                        </tr>
                        <tr>
                            <td></td>
                            <%-- Dependiendo de a que nivel de preguntas estemos mostraremos un bloque de preguntas u otro
                                 por que el objeto que contiene las preguntas son diferentes --%>
                            <c:if test="${__formdata.VMODO=='PROD'}">
                                <td colspan="3">
                                    <c:set var="title9"><axis:alt f="axispro033" c="tbloc1" lit="1000109" /></c:set>
                                    <c:set var="title0"><axis:alt f="axispro033" c="tbloc2" lit="102738" /></c:set>
                                    <c:set var="title1"><axis:alt f="axispro033" c="tbloc3" lit="500102" /></c:set>
                                    <c:set var="title2"><axis:alt f="axispro033" c="tbloc3" lit="100565" /></c:set>
                                    
                                    <div>
                                    <display:table name="${PREGUNTAS}" id="miListaId_2" export="false" class="dsptgtable" pagesize="10" defaultsort="3" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                                                   requestURI="modal_axispro033.do?paginar=true&operation=preguntas">
                                        <%@ include file="../include/displaytag.jsp"%>
                                        <display:column title="${title9}" sortable="true" sortProperty="OB_IAX_PRODPREGUNTAS.CPREGUN" headerClass="sortable" media="html" autolink="false" >
                                            <div class="dspText">${miListaId_2.OB_IAX_PRODPREGUNTAS.CPREGUN }</div>
                                        </display:column>
                                        <display:column title="${title0}" sortable="true" sortProperty="OB_IAX_PRODPREGUNTAS.TPREGUN" headerClass="sortable" media="html" autolink="false" >
                                            <div class="dspText">${miListaId_2.OB_IAX_PRODPREGUNTAS.TPREGUN}</div>
                                        </display:column>
                                        <display:column title="${title1}" sortable="true" sortProperty="OB_IAX_PRODPREGUNTAS.NPREORD" headerClass="sortable" media="html" autolink="false" >
                                            <div class="dspIcon">${miListaId_2.OB_IAX_PRODPREGUNTAS.NPREORD}</div>
                                        </display:column>
                                        <display:column title="${title2}" sortable="true" headerClass="headwidth5 sortable" sortProperty="OB_IAX_PRODPREGUNTAS.CPRETIP" media="html" autolink="false" >
                                            <div class="dspText">${miListaId_2.OB_IAX_PRODPREGUNTAS.TPRETIP}</div>
                                        </display:column>
                                        <display:column title="" sortable="false" headerClass="sortable" media="html" autolink="false" >
                                            <div class="dspIcono"><img src="images/lapiz.gif" style="cursor:pointer" 
                                                                        alt="<axis:alt f='axispro033' c='modifpreg' lit='9000552'/>" title="<axis:alt f='axispro033' c='modifpreg' lit='9000552'/>"
                                                                        onclick="f_modificar_pregunta('${miListaId_2.OB_IAX_PRODPREGUNTAS.CPREGUN}')"/>
                                            </div>
                                        </display:column>
                                        <display:column title="" sortable="false" headerClass="sortable" media="html" autolink="false" >
                                            <div class="dspIcono"><img src="images/delete.gif" style="cursor:pointer" 
                                                                        alt="<axis:alt f='axispro033' c='borrarpreg' lit='9001333'/>" title="<axis:alt f='axispro033' c='borrarpreg' lit='9001333'/>"
                                                                        onclick="f_borrar_pregunta('${miListaId_2.OB_IAX_PRODPREGUNTAS.CPREGUN}')"/>
                                            </div>
                                        </display:column>
                                    </display:table>
                                    </div>
                                </td>
                            </c:if>
                            
                            <c:if test="${__formdata.VMODO=='ACT'}">
                                <td colspan="3">
                                    <c:set var="title9"><axis:alt f="axispro033" c="blocact1" lit="1000109" /></c:set>
                                    <c:set var="title0"><axis:alt f="axispro033" c="blocact2" lit="102738" /></c:set>
                                    <c:set var="title1"><axis:alt f="axispro033" c="blocact3" lit="500102" /></c:set>
                                    <c:set var="title2"><axis:alt f="axispro033" c="blocact4" lit="100565" /></c:set>
                                    
                                    <div>
                                        <display:table name="${PREGUNTAS}" id="T_IAX_ACTIVIDADES" export="false" class="dsptgtable" pagesize="6" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                                            requestURI="axis_axispro001.do?paginar=true&operation=actividades_preguntas">
                                            <%@ include file="../include/displaytag.jsp"%>
                                            <display:column title="${title9}" sortable="true" sortProperty="OB_IAX_PRODPREGUNACTI.CPREGUN" headerClass="sortable" media="html" autolink="false" >
                                                <div class="dspText">${T_IAX_ACTIVIDADES.OB_IAX_PRODPREGUNACTI.CPREGUN}</div>
                                            </display:column>
                                            <display:column title="${title0}" sortable="true" sortProperty="OB_IAX_PRODPREGUNACTI.TPREGUN" headerClass="sortable" media="html" autolink="false" >
                                                <div class="dspText">${T_IAX_ACTIVIDADES.OB_IAX_PRODPREGUNACTI.TPREGUN}</div>
                                            </display:column>
                                            <display:column title="${title1}" sortable="true" sortProperty="OB_IAX_PRODPREGUNACTI.NPREORD" headerClass="sortable" media="html" autolink="false" >
                                                <div class="dspIcon">${T_IAX_ACTIVIDADES.OB_IAX_PRODPREGUNACTI.NPREORD}</div>
                                            </display:column>
                                            <display:column title="${title2}" headerClass="headwidth5 sortable" sortProperty="OB_IAX_PRODPREGUNACTI.TPRETIP" media="html" autolink="false" >
                                                <div class="dspText">${T_IAX_ACTIVIDADES.OB_IAX_PRODPREGUNACTI.TPRETIP}</div>
                                            </display:column>
                                            <display:column title="" sortable="false" headerClass="sortable" media="html" autolink="false" >
                                                <div class="dspIcono"><img src="images/lapiz.gif" style="cursor:pointer" 
                                                                        alt="<axis:alt f='axispro033' c='mofifpre' lit='9000552'/>" title="<axis:alt f='axispro033' c='mofifpre' lit='9000552'/>"
                                                                        onclick="f_modificar_pregunta('${T_IAX_ACTIVIDADES.OB_IAX_PRODPREGUNACTI.CPREGUN}')"/>
                                                </div>
                                            </display:column>
                                            <display:column title="" sortable="false" headerClass="sortable" media="html" autolink="false" >
                                                <div class="dspIcono"><img src="images/delete.gif" style="cursor:pointer" 
                                                                        alt="<axis:alt f='axispro033' c='bpreg' lit='9001333'/>" title="<axis:alt f='axispro033' c='bpreg' lit='9001333'/>"
                                                                        onclick="f_borrar_pregunta('${T_IAX_ACTIVIDADES.OB_IAX_PRODPREGUNACTI.CPREGUN}')"/>
                                                </div>
                                            </display:column>
                                        </display:table>
                                    </div>
                                </td>
                            </c:if>
                            <c:if test="${__formdata.VMODO=='GAR'}">
                                <td colspan="3">
                                    <c:set var="title9"><axis:alt f="axispro033" c="blocgar1" lit="1000109" /></c:set>
                                    <c:set var="title0"><axis:alt f="axispro033" c="blocgar2" lit="102738" /></c:set>
                                    <c:set var="title1"><axis:alt f="axispro033" c="blocgar3" lit="500102" /></c:set>
                                    <c:set var="title2"><axis:alt f="axispro033" c="blocgar4" lit="100565" /></c:set>
                                    
                                    <div>
                                        <display:table name="${mntgaran.PREGUNTAS}" id="miListaId" export="false" class="dsptgtable" pagesize="6" defaultsort="3" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                                                    requestURI="modal_axispro033.do?paginar=true&subpantalla=garantias_preguntas">
                                            <%@ include file="../include/displaytag.jsp"%>
                                            <display:column title="${title9}" sortable="true" sortProperty="OB_IAX_PRODPREGUNPROGARAN.CPREGUN" headerClass="sortable" media="html" autolink="false" >
                                                <div class="dspText">${miListaId.OB_IAX_PRODPREGUNPROGARAN.CPREGUN }</div>
                                            </display:column>
                                            <display:column title="${title0}" sortable="true" sortProperty="OB_IAX_PRODPREGUNPROGARAN.TPREGUN" headerClass="sortable" media="html" autolink="false" >
                                                <div class="dspText">${miListaId.OB_IAX_PRODPREGUNPROGARAN.TPREGUN}</div>
                                            </display:column>
                                            <display:column title="${title1}" sortable="true" sortProperty="OB_IAX_PRODPREGUNPROGARAN.NPREORD" headerClass="sortable" media="html" autolink="false" >
                                                <div class="dspIcon">${miListaId.OB_IAX_PRODPREGUNPROGARAN.NPREORD}</div>
                                            </display:column>
                                            <display:column title="${title2}" sortable="true" headerClass="headwidth5 sortable" sortProperty="OB_IAX_PRODPREGUNPROGARAN.TPRETIP" media="html" autolink="false" >
                                                <div class="dspText">${miListaId.OB_IAX_PRODPREGUNPROGARAN.TPRETIP}</div>
                                            </display:column>
                                            <display:column title="" sortable="false" headerClass="sortable" media="html" autolink="false" >
                                                <div class="dspIcono"><img src="images/lapiz.gif" style="cursor:pointer" 
                                                                        alt="<axis:alt f='axispro033' c='bpregpro' lit='9000552'/>" title="<axis:alt f='axispro033' c='bpregpro' lit='9000552'/>"
                                                                        onclick="f_modificar_pregunta('${miListaId.OB_IAX_PRODPREGUNPROGARAN.CPREGUN}')"/>
                                                </div>
                                            </display:column>
                                            <display:column title="" sortable="false" headerClass="sortable" media="html" autolink="false" >
                                                <div class="dspIcono"><img src="images/delete.gif" style="cursor:pointer" 
                                                                        alt="<axis:alt f='axispro033' c='bprg' lit='9001333'/>" title="<axis:alt f='axispro033' c='bprg' lit='9001333'/>"
                                                                        onclick="f_borrar_pregunta('${miListaId.OB_IAX_PRODPREGUNPROGARAN.CPREGUN}')"/>
                                                </div>
                                            </display:column>
                                        </display:table>
                                    
                                    </div>
                                </td>
                            </c:if>
                        </tr>
                    </table>
                </td>
            </tr>
            
        </table>
        
        <c:import url="../include/botonera_nt.jsp"><c:param name="f">axispro033</c:param><c:param name="f">axispro033</c:param><c:param name="__botones">salir</c:param></c:import>
        
    </form>
    <c:import url="../include/mensajes.jsp" />
</body>
</html>