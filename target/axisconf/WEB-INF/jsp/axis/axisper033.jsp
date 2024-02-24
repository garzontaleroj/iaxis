<%-- * Fichero: axisper033.jsp * @author <a href =
     "mailto:xpastor@csi-ti.com">Xavi Pastor</a> * * Fecha: 23/07/2008 */--%>
<%@ page contentType="text/html;charset=windows-1252"
         errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page import="axis.util.Constantes"%>
<%@ page import="java.util.*"%>
<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
  <head>
    <link rel="stylesheet" href="styles/genericosHtml.css" type="text/css"></link>
    <link rel="stylesheet" href="styles/axisnt.css" type="text/css"></link>
    <link rel="stylesheet" href="styles/displaytag.css"></link>
    <c:import url="../include/carga_framework_js.jsp"/>
    <script language="Javascript" type="text/javascript">

        function f_onload() {
            
            f_cargar_propiedades_pantalla();
            var ok ="${__formdata.OK}";
            if (!objUtiles.estaVacio(ok)&& ok == 1){
                alert('<axis:alt f="axisper033" c="LIT_OK" lit="9903300"/>');
            }
            
            var MISMAPER ="${__formdata.MISMAPER}";
            if (!objUtiles.estaVacio(MISMAPER)&& MISMAPER == 1){
                alert('<axis:alt f="axisper033" c="LIT_OK" lit="9903321"/>');
            }
            
            var PERSONA1 = "${persona1}";
            if (objUtiles.estaVacio(PERSONA1)) {
                f_abrir_axisper032(1);
            }
            else
                objEstilos.toggleDisplay("datosgenerales", document.getElementById("datosgenerales_parent"));
            
        }
        
        function f_but_salir() {
            objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axisage009", "cancelar", document.miForm, "_self");                   
        }   
        
        function f_abrir_axisper032(persona) {
            var numide1 =  "${persona1.NNUMIDE}";
            objUtiles.abrirModal("axisper032","src","modal_axisper032.do?operation=form&PERSONA="+persona+"&NNUMIDE1="+numide1);
        }
        
        function f_cerrar_axisper032(){
            objUtiles.cerrarModal("axisper032");
        }
        
     /*   function f_aceptar_mtn_axisper033 (selectedPerson,selectedAgente){
            f_cerrar_axisper032();
            document.miForm.CAGENTE.value = selectedAgente;
            objUtiles.ejecutarFormulario("axis_axisper033.do?SPERSON="+selectedPerson, "form", document.miForm, "_self", objJsMessages.jslit_cargando);
        } */
        
        function f_aceptar_axisper032(SPERSON,CAGENTE,PERSONA){
        
         objUtiles.cerrarModal("axisper032");
                   
             if (!objUtiles.estaVacio(SPERSON)){
                   if(PERSONA == 1){
                    document.miForm.SPERSON1.value=SPERSON;
                    //document.miForm.CAGENTE1.value=CAGENTE;
                   } 
                   if(PERSONA == 2) {
                    document.miForm.SPERSON2.value=SPERSON;
                    //document.miForm.CAGENTE2.value=CAGENTE;
                   } 
                   
                    f_cargarPersona();
            }
                        
        }
        
        function f_cargarPersona(){
            if (objValidador.validaEntrada()) {
                objUtiles.ejecutarFormulario("axis_axisper033.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);   
            }
        }
        
        function f_but_9903299(){
            objUtiles.ejecutarFormulario("axis_axisper033.do", "aceptar", document.miForm, "_self", objJsMessages.jslit_cargando);   
        }
         
    </script>
  </head>
  <body onload="f_onload()">
    <c:import url="../include/precargador_ajax.jsp">
      <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
    
    <c:import url="../include/modal_estandar.jsp">
      <c:param name="titulo"><axis:alt f="axisper033" c="MODPER032" lit="9901871"/></c:param>
      <c:param name="nid" value="axisper032"/>
    </c:import>

    <form name="miForm" action="" method="POST">
      <input type="hidden" name="operation" value=""/>
      <input type="hidden" name="faceptar" value="${persona1.faceptar}"/>
      <input type="hidden" name="isNew" value="${persona1.isNew}"/>
      <input type="hidden" name="SPERSON1" value="${__formdata.SPERSON1}"/>  
      <input type="hidden" name="SPERSON2" value="${__formdata.SPERSON2}"/>
      <input type="hidden" name="SPEREAL" value="${persona1.SPEREAL}"/>
      <input type="hidden" name="CESTPER" value="${persona1.CESTPER}"/>
      <input type="hidden" name="CAGENTE1" value="${__formdata.CAGENTE1}"/>
      <input type="hidden" name="CAGENTE2" value="${__formdata.CAGENTE2}"/>
      <input type="hidden" name="CTIPPER" id="CTIPPER" value="${persona1.CTIPPER}"/>
      <input type="hidden" name="CTIPIDE" id="CTIPIDE"  value="${persona1.CTIPIDE}"/>
       
      <c:import url="../include/titulo_nt.jsp">
        <c:param name="formulario">
          <axis:alt f="axisper033" c="LIT_PARAM1" lit="9903265"/>
        </c:param>
        <c:param name="producto">
          <axis:alt f="axisper033" c="LIT_PARAM2" lit="9903265"/>
        </c:param>
        <c:param name="form">axisper033</c:param>
      </c:import>
      
      <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td>         
            <div class="titulo">
             <b><axis:alt f="axisper033" c="PERDESTINO" lit="9904482"/></b>
            </div>
            <table class="seccion">
              <tr>
                <td align="left">
                  <table class="area" align="center">
                    <tr id="DSP_AGENTES_children">
                      <td class="campocaja">
                      	  <axis:visible f="axisper033" c="DSP_AGENTE">
                        <div class="displayspace">
                          <c:set var="title1"><axis:alt f="axisper033" c="COD_LIT" lit="105330"/></c:set>
                          <c:set var="title2"> <axis:alt f="axisper033" c="AGENTE_LIT" lit="105330"/> </c:set>
                          <c:set var="title0"> <axis:alt f="axisper033" c="TAGENTE_LIT" lit="100584"/></c:set>
                         
                          <display:table name="${agents_visio}" id="agentes" export="false" class="dsptgtable"
                                         pagesize="-1" defaultsort="1" cellpadding="0" cellspacing="0"
                                         requestURI="axis_axisper033.do?paginar=true&subpantalla=datosgenerales">
                            <%@ include file="../include/displaytag.jsp"%>
                            <display:column title=" " sortable="false" sortProperty="" headerClass="headwidth5 sortable fixed"
                                            style="width:5%;" media="html" autolink="false">
                              <div class="dspIcons">
                                <input <c:if test="${agentes.CAGENTE == __formdata.CAGENTE}">checked</c:if>
                                       type="radio" onclick="seleccionarLista('${agentes.CODI}','${agentes.CAGENTE}')"
                                       id="seleccionaAgente" name="seleccionaAgente" value="${agentes.CAGENTE}"/>
                              </div>
                            </display:column>
                            <display:column title="${title0}" sortable="true" style="width:10%;" sortProperty="CAGENTEs"
                                            headerClass="sortable fixed" media="html" autolink="false">
                              <div class="dspText">
                                    ${agentes.CAGENTE}
                              </div>
                            </display:column>
                            <display:column title="${title1}" sortable="true" style="width:90%;" sortProperty="TAGENTE"
                                            headerClass="headwidth5 sortable fixed" media="html" autolink="false">
                              <div class="dspText">
                                ${agentes.TAGENTE}
                              </div>
                            </display:column>
                          </display:table>
                       </div>
                          </axis:visible>
                        <div class="separador">&nbsp;</div>
                        <table class="area" align="center">
                          <c:if test="${empty persona1.CTIPPER || persona1.CTIPPER != -1}">
                            <tr>
                              <td class="campocaja">
                                <div style="float:left;">
                                  <img id="datosgenerales_parent" src="images/mes.gif" onclick="objEstilos.toggleDisplay('datosgenerales', this)"
                                       style="cursor:pointer"/>
                                   <b><axis:alt f="axisper033" c="LIT_DAT" lit="103593"/></b>
                                </div>                              
                                <div style="clear:both;">
                                  <hr class="titulo"></hr>
                                </div>
                              </td>
                            </tr>
                            <tr id="datosgenerales_children" style="display:none">
                              <td align="left">
                                <table class="seccion">
                                  <tr>
                                    <th style="width:2%;height:0px">&nbsp;</th>
                                    <th style="width:17%;height:0px">&nbsp;</th>
                                    <th style="width:17%;height:0px">&nbsp;</th>
                                    <th style="width:17%;height:0px">&nbsp;</th>
                                    <th style="width:16%;height:0px">&nbsp;</th>
                                    <th style="width:16%;height:0px">&nbsp;</th>
                                    <th style="width:11%;height:0px">&nbsp;</th>
                                    <th style="width:2%;height:0px">&nbsp;</th>
                                  </tr>
                                  <tr>
                                    <td>&nbsp;</td>
                                    <td class="titulocaja">
                                      <b><axis:alt f="axisper033" c="TIT1" lit="102844"/></b>
                                    </td>
                                    <td class="titulocaja">
                                      <b><axis:alt f="axisper033" c="TIT2" lit="109774"/></b>
                                    </td>
                                    <td class="titulocaja">
                                      <b><axis:alt f="axisper033" c="TIT3" lit="105330"/></b>
                                     <c:if test="${persona1.CTIPPER != 2}">
                                      <td class="titulocaja">
                                        <b><axis:alt f="axisper033" c="TIT4" lit="100962"/></b>
                                      </td>
                                      <td class="titulocaja">
                                        <b><axis:alt f="axisper033" c="TIT5" lit="1000064"/></b>
                                      </td>
                                    </c:if>
                                     <c:if test="${persona1.CTIPPER == 2}">                             
                                  <axis:ocultar c="FNACIMI" f="axisper033" dejarHueco="false">
                                      <td class="titulocaja" id="tit_FNACIMI">
                                        <b  id="label_FNACIMI"><axis:alt f="axisper033" c="FNACIMI" lit="1000064"/></b>
                                      </td>
                                      </axis:ocultar>
                                      </c:if>
                                      <td class="titulocaja">
                                      <b><axis:alt f="axisper033" c="TIT6" lit="9000792"/></b>
                                    </td>
                                  </tr>
                                  <tr>                     
                                    <td>&nbsp;</td>
                                    <td class="campocaja">
                                      <input type="text" name="DESCIDENT" value="${persona1.DESCIDENT}"
                                             class="campowidthinput campo campotexto" style="width:90%"
                                             <axis:atr f="axisper033" c="DESCIDENT" a="modificable=false"/>/>
                                    </td>
                                    <td class="campocaja">
                                      <input type="text" name="TTIPIDE" value="${persona1.TTIPIDE}"
                                             class="campowidthinput campo campotexto" style="width:90%"
                                             <axis:atr f="axisper033" c="TTIPIDE" a="modificable=false"/>/>
                                    </td>
                                    <td class="campocaja">
                                      <input type="text" name="NNUMIDE" id="NNUMIDE" value="${persona1.NNUMIDE}"
                                             class="campowidthinput campo campotexto" style="width:50%"
                                             <axis:atr f="axisper033" c="NNUMIDE" a="modificable=false"/>/>
                                    </td>
                                    <c:if test="${persona1.CTIPPER == 2}">
                                       <axis:ocultar c="FNACIMI" f="axisper033" dejarHueco="false">
                                    <td class="campocaja" id="td_FNACIMI">
                                     <input type="text" name="FNACIMI" id="FNACIMI"
                                            value='<fmt:formatDate pattern="dd/MM/yyyy" value="${persona1.FNACIMI}"/>'
                                            class="campowidthinput campo campotexto" style="width:70%"
                                            <axis:atr f="axisper033" c="FNACIMI" a="modificable=false&formato=fecha"/>
                                            title='<axis:alt f="axisper033" c="FNACIMI_ALT" lit="100959"/>'/>
                                    </td>
                                    </axis:ocultar>
                                      <td class="campocaja">
                                        <input onclick="" type="checkbox" id="SWPUBLI"
                                               name="SWPUBLI" <c:if test="${persona1.SWPUBLI == 1}">checked="true"</c:if>
                                               value="persona1.SWPUBLI" disabled="disabled"/>
                                      </td>
                                    </c:if>
                                    <td class="campocaja">
                                      <c:if test="${persona1.CTIPPER != 2}">
                                        <input type="text" name="TSEXPER" id="TSEXPER" value="${persona1.TSEXPER}"
                                               class="campowidthinput campo campotexto" style="width:50%"
                                               <axis:atr f="axisper033" c="TSEXPER" a="modificable=false"/>/>
                                      </c:if>
                                    </td>
                                <td class="campocaja">
                                      <c:if test="${persona1.CTIPPER != 2}">
                                        <input type="text" name="FNACIMI" id="FNACIMI"
                                               value='<fmt:formatDate pattern="dd/MM/yyyy" value="${persona1.FNACIMI}"/>'
                                               class="campowidthinput campo campotexto" style="width:70%"
                                               <axis:atr f="axisper033" c="FNACIMI" a="modificable=false&formato=fecha"/>
                                               title='<axis:alt f="axisper033" c="FNACIMI_ALT" lit="100959"/>'/>
                                      </c:if>
                               <c:if test="${persona1.CTIPPER != 2}">
                                      <td class="campocaja" align="center">
                                        <input onclick="javascript:void(0)" type="checkbox" id="SWPUBLI" name="SWPUBLI"
                                               <c:if test="${persona1.SWPUBLI == 1}">checked="true"</c:if>
                                               value="persona1.SWPUBLI" disabled="disabled"/>
                                      </td>
                                    </c:if>
                                </tr>
                                  <c:if test="${!empty persona1.TDIGITOIDE}">
                                  <tr>
                            <td></td>
                            <axis:ocultar c="SWRUT" f="axisper033"  dejarHueco="false">
                             <td colspan="2" id="tit_SWRUT">
                               <table  cellpadding="0" cellspacing="0">
                               <tr>
                                    <th style="width:20%;height:0px"></th>
                                    <th style="width:80%;height:0px"></th>                                
                                </tr>
                                <tr>
                                 <td class="titulocaja" >
                                    <b id="label_SWRUT"><axis:alt f="axisper033" c="SWRUT" lit="9903067"/></b>
                                 </td>
                                <td class="titulocaja" id="tit_TDIGITOIDE">
                                    <b id="label_TDIGITOIDE"><axis:alt f="axisper033" c="TDIGITOIDE" lit="9903068"/></b>
                                </td>
                               </tr>
                               </table>
                             </td>
                            </axis:ocultar>
                            </tr>
                            <tr>
                            <td></td>
                             <axis:ocultar c="SWRUT" f="axisper033"  dejarHueco="false">
                                <td id="td_SWRUT" colspan="2">
                                <table style="height:0px">
                                <tr>
                                    <th style="width:20%;height:0px"></th>
                                    <th style="width:80%;height:0px"></th>                                
                                </tr>
                                <tr>
                                <td class="campocaja">
                                      <input  type="checkbox" id="SWRUT" name="SWRUT"  <axis:atr f="axisper033" c="SWRUT" a="modificable=false&isInputText=false"/> 
                                      <c:if test="${persona1.SWRUT == 1}">checked="true"</c:if>  value="${persona1.SWRUT}"/>
                                </td>
                                <td class="campocaja" id="td_TDIGITOIDE">
                                   <input type="text" class="campowidthinput campo campotexto" size="50" 
                                    value="${persona1.TDIGITOIDE}" name="TDIGITOIDE" id="TDIGITOIDE"  style="width:25%;"
                                    <axis:atr f="axisper033" c="TDIGITOIDE" a="modificable=false"/>>
                                </td>
                                </tr>
                                </table>
                                </td>
                                </axis:ocultar>
                            </tr>
                            </c:if>
                                  <tr>
                                    <td>&nbsp;</td>
                                    <td colspan="6"><hr></hr></td>
                                  </tr>
                                  <tr>
                                    <td>&nbsp;</td>
                                    <axis:ocultar f="axisper033" c="TNOMBRE" dejarHueco="false">
                                         <td class="titulocaja" colspan="2" id="tit_TNOMBRE">
                                          <b id="label_TNOMBRE"><axis:alt f="axisper033" c="TNOMBRE" lit="105940"/></b>
                                        </td>
                                    </axis:ocultar>
                                    <axis:ocultar f="axisper033" c="TNOMBRE1" dejarHueco="false">
                                        <td class="titulocaja" id="tit_TNOMBRE1">
                                          <b id="label_TNOMBRE1"><axis:alt f="axisper033" c="TNOMBRE1" lit="105940"/></b>
                                        </td>
                                    </axis:ocultar>
                                     <axis:ocultar f="axisper033" c="TNOMBRE2" dejarHueco="false">
                                        <td class="titulocaja" id="tit_TNOMBRE2">
                                          <b id="label_TNOMBRE2"><axis:alt f="axisper033" c="TNOMBRE2" lit="9902260"/></b>
                                        </td>
                                    </axis:ocultar>
                                    <axis:ocultar f="axisper033" c="TAPELLI1" dejarHueco="false">
                                      <td class="titulocaja" colspan="2" id="tit_TAPELLI1">
                                        <b id="label_TAPELLI1"><axis:alt f="axisper033" c="TAPELLI1" lit="108243"/></b>
                                      </td>
                                      </axis:ocultar>
                                 <c:if test="${!empty persona1.CTIPPER && persona1.CTIPPER == 2}">
                                      <td class="titulocaja">
                                        <b><axis:alt f="axisper033" c="TESTPER" lit="9000793"/></b>
                                      </td>
                                      <td class="titulocaja">
                                        <b><axis:alt f="axisper033" c="TPAIS" lit="9000789"/></b>
                                      </td>
                                </c:if>
                                <c:if test="${empty persona1.CTIPPER || persona1.CTIPPER != 2}">
                                      <td class="titulocaja" colspan="2" id="tit_TAPELLI2">
                                        <b><axis:alt f="axisper033" c="TAPELLI2" lit="108246"/></b>
                                      </td>
                                    </c:if>
                                  </tr>
                                  <tr>
                                    <axis:ocultar f="axisper033" c="td_TNOMBRE" dejarHueco="false">
                                    <td  id="td_TNOMBRE">&nbsp;</td>
                                    </axis:ocultar>
                                    <axis:ocultar f="axisper033" c="TNOMBRE"  dejarHueco="false">
                                    <td class="campocaja" colspan="2"  id="td_TNOMBRE">
                                   
                                      <input type="text" name="TNOMBRE" id="TNOMBRE" value="${persona1.TNOMBRE}"
                                             class="campowidthinput campo campotexto" style="width:95%"
                                             <axis:atr f="axisper033" c="TNOMBRE" a="modificable=false"/>/>
                                    </td>
                                    </axis:ocultar>
                                    <axis:ocultar f="axisper033" c="TNOMBRE1" dejarHueco="false">
                                        <td class="campocaja" colspan="1" id="td_TNOMBRE1">
                                          <input type="text" name="TNOMBRE1" id="TNOMBRE1" value="${persona1.TNOMBRE1}"
                                                 class="campowidthinput campo campotexto" style="width:95%"
                                                 <axis:atr f="axisper033" c="TNOMBRE1" a="modificable=false"/>/>
                                        </td>
                                    </axis:ocultar>
                                    <axis:ocultar f="axisper033" c="TNOMBRE2" dejarHueco="false">
                                        <td class="campocaja" colspan="1" id="td_TNOMBRE2">
                                          <input type="text" value="${persona1.TNOMBRE2}"
                                                 name="TNOMBRE2" id="TNOMBRE2" class="campowidthinput campo campotexto"
                                                 style="width:95%" title="<axis:alt f="axisper033" c="TNOMBRE2" lit="9902260"/>"
                                                 <axis:atr f="axisper033" c="TNOMBRE2" a="modificable=false"/>/>
                                        </td>
                                     </axis:ocultar>
                                     <axis:ocultar f="axisper033" c="TAPELLI1" dejarHueco="false">
                                       <td class="campocaja" colspan="2" id="td_TAPELLI1">
                                        <input type="text" name="TAPELLI1" id="TAPELLI1" value="${persona1.TAPELLI1}"
                                               class="campowidthinput campo campotexto" style="width:94%"
                                               <axis:atr f="axisper033" c="TAPELLI1" a="modificable=false"/>/>
                                      </td>
                                    </axis:ocultar>
                                    <c:if test="${!empty persona1.CTIPPER && persona1.CTIPPER == 2}">
                                      <axis:ocultar c="TESTPER" f="axisper033" dejarHueco="false">
                                        <td class="campocaja">
                                          <input type="text" name="TESTPER" value="${persona1.TESTPER}"
                                                 class="campowidthinput campo campotexto" style="width:95%"
                                                 <axis:atr f="axisper033" c="TESTPER" a="modificable=false"/>/>
                                        </td>
                                      </axis:ocultar>
                                      <axis:ocultar c="TPAIS" f="axisper033" dejarHueco="false">
                                        <td class="campocaja" colspan="2">
                                          <input type="text" name="TPAIS" id="TPAIS" value="${persona1.TPAIS}"
                                                 class="campowidthinput campo campotexto" style="width:95%"
                                                 <axis:atr f="axisper033" c="TPAIS" a="modificable=false"/>/>
                                        </td>
                                      </axis:ocultar>
                                      <td>&nbsp;</td>
                                    </c:if>
                                    <c:if test="${empty persona1.CTIPPER || persona1.CTIPPER != 2}">
                                      <td class="campocaja" colspan="2" id="td_TAPELLI2">
                                        <input type="text" name="TAPELLI2" id="TAPELLI2" value="${persona1.TAPELLI2}"
                                               class="campowidthinput campo campotexto" style="width:95%"
                                               <axis:atr f="axisper033" c="TAPELLI2" a="modificable=false"/>/>
                                      </td>
                                    </c:if>
                                  </tr>
                                  <tr>
                                    <td>&nbsp;</td>
                                    <c:if test="${persona1.CTIPPER != 2}">
                                      <td class="titulocaja" colspan="2">
                                        <b><axis:alt f="axisper033" c="TPROFES" lit="110978"/></b>
                                      </td>
                                      </c:if>
                                      <axis:visible c="CIDIOMA" f="axisper033">
                                      <c:if test="${__formdata.CTIPPER != 2 || __configform.axisper033__CIDIOMA__visible == 'true'}"> 
                                      <td class="titulocaja">
                                        <b><axis:alt f="axisper033" c="LIT3" lit="1000246"/></b>
                                      </td>
                                      </c:if>
                                    </axis:visible>
                                     <axis:ocultar c="SNIP" f="axisper033" dejarHueco="false">
                                    <td class="titulocaja">
                                      <b><axis:alt f="axisper033" c="LIT4" lit="1000088"/></b>
                                    </td>
                                    </axis:ocultar>
                                    <c:if test="${empty persona1.CTIPPER || persona1.CTIPPER != 2}">
                                      <td class="titulocaja" colspan="2">
                                        <b><axis:alt f="axisper033" c="TPAIS" lit="9000789"/></b>
                                      </td>
                                    </c:if>
                                  </tr>
                                  <tr>
                                    <td>&nbsp;</td>
                                    <c:if test="${persona1.CTIPPER != 2}">
                                      <td class="campocaja" colspan="2">
                                        <input type="text" name="TPROFES" id="TPROFES" value="${persona1.TPROFES}"
                                               class="campowidthinput campo campotexto" style="width:95%"
                                               <axis:atr f="axisper033" c="TPROFES" a="modificable=false"/>/>
                                      </td>
                                      </c:if>
                                      <axis:visible c="CIDIOMA" f="axisper033">
                                      <c:if test="${__formdata.CTIPPER != 2 || __configform.axisper033__CIDIOMA__visible == 'true'}"> 
                                      <td class="campocaja">
                                        <input type="text" name="TIDIOMA" id="TIDIOMA" value="${persona1.TIDIOMA}"
                                               class="campowidthinput campo campotexto" style="width:90%"
                                               <axis:atr f="axisper033" c="TIDIOMA" a="modificable=false"/>/>
                                      </td>
                                      </c:if>
                                      </axis:visible>
                                     <axis:ocultar c="SNIP" f="axisper033" dejarHueco="false">
                                    <td class="campocaja">
                                      <input type="text" name="SNIP" id="SNIP" value="${persona1.SNIP}"
                                             class="campowidthinput campo campotexto" style="width:89%"
                                             <axis:atr f="axisper033" c="SNIP" a="modificable=false"/>/>
                                    </td>
                                    </axis:ocultar>
                                    <c:if test="${empty persona1.CTIPPER || persona1.CTIPPER != 2}">
                                      <td class="campocaja" colspan="2">
                                        <input type="text" name="TPAIS" id="TPAIS" value="${persona1.TPAIS}"
                                               class="campowidthinput campo campotexto" style="width:95%"
                                               <axis:atr f="axisper033" c="TPAIS" a="modificable=false"/>/>
                                      </td>
                                    </c:if>
                                  </tr>
                                  <tr>
                                    <td>&nbsp;</td>
                                    <c:if test="${empty persona1.CTIPPER || persona1.CTIPPER != 2}">
                                      <td class="titulocaja">
                                        <b><axis:alt f="axisper033" c="LIT5" lit="9000793"/></b>
                                      </td>
                                    </c:if>
                                    <c:if test="${persona1.CESTPER == 2 && persona1.CTIPPER != 2}">
                                      <td class="titulocaja">
                                        <b><axis:alt f="axisper033" c="LIT6" lit="9000794"/></b>
                                      </td>
                                    </c:if>
                                    <c:if test="${persona1.CTIPPER != 2}">
                                      <td class="titulocaja">
                                        <b><axis:alt f="axisper033" c="LIT7" lit="1000067"/></b>
                                      </td>
                                    </c:if>
                                     <c:if test="${persona1.CTIPPER != 2}">
                                      <axis:ocultar c="CESTCIV" f="axisper033" dejarHueco="false">   
                                      <td class="titulocaja">
                                        <b><axis:alt f="axisper033" c="LIT8" lit="9900955"/></b>
                                      </td>
                                      </axis:ocultar>
                                    </c:if>
                                  </tr>
                                  <tr>
                                    <td>&nbsp;</td>
                                    <axis:ocultar c="TESTPER" f="axisper033" dejarHueco="false">
                                      <c:if test="${empty persona1.CTIPPER || persona1.CTIPPER != 2}">
                                        <td class="campocaja">
                                          <input type="text" name="TESTPER" value="${persona1.TESTPER}"
                                                 class="campowidthinput campo campotexto" style="width:95%"
                                                 <axis:atr f="axisper033" c="TESTPER" a="modificable=false"/>/>
                                        </td>
                                      </c:if>
                                    </axis:ocultar>
                                    <c:if test="${persona1.CESTPER == 2 && persona1.CTIPPER != 2}">
                                      <axis:ocultar c="FDEFUNC" f="axisper033" dejarHueco="false">
                                        <td class="campocaja">
                                          <input type="text" name="FDEFUNC"
                                                 value='<fmt:formatDate pattern="dd/MM/yyyy" value="${persona1.FDEFUNC}"/>'
                                                 class="campowidthinput campo campotexto" style="width:95%"
                                                 <axis:atr f="axisper033" c="FDEFUNC" a="modificable=false"/>/>
                                        </td>
                                      </axis:ocultar>
                                    </c:if>
                                    <c:if test="${persona1.CTIPPER != 2}">
                                      <axis:ocultar c="FJUBILA" f="axisper033" dejarHueco="false">
                                        <td class="campocaja">
                                          <input type="text" name="FJUBILA"
                                                 value='<fmt:formatDate pattern="dd/MM/yyyy" value="${persona1.FJUBILA}"/>'
                                                 class="campowidthinput campo campotexto" style="width:95%"  
                                                 <axis:atr f="axisper033" c="FJUBILA" a="modificable=false"/>/>
                                        </td>
                                      </axis:ocultar>
                                    </c:if>                                    
                                      <c:if test="${persona1.CTIPPER != 2}">
                                       <axis:ocultar c="CESTCIV" f="axisper033" dejarHueco="false">  
                                            <td class="campocaja">
                                              <input type="text" name="TESTCIV" value="${persona1.TESTCIV}"
                                                     class="campowidthinput campo campotexto" style="width:95%"
                                                     <axis:atr f="axisper033" c="TESTCIV" a="modificable=false"/>/>
                                            </td>                                    
                                        </axis:ocultar>
                                      </c:if>
                                  </tr>
                                </table>
                              </td>
                            </tr>
                          </c:if>
                          </table>  
                        </td>
                    </tr>
                  </table>
                </td>
              </tr>
            </table>
          </td>
        </tr>
        <%-- Persona 2 --%>
        <tr>
          <td>         
            <div class="titulo">
                <b><axis:alt f="axisper033" c="PERORIGEN" lit="9904481"/></b>
                <img id="find" border="0" src="images/find.gif" onclick="f_abrir_axisper032(2)" style="cursor:pointer"/>
            </div>
            <table class="seccion">
              <tr>
                <td align="left">
                  <table class="area" align="center">
                   <tr id="DSP_AGENTES_children">
                      <td class="campocaja">
                      	  <axis:visible f="axisper033" c="DSP_AGENTE2">
                        <div class="displayspace">
                          <c:set var="title1"><axis:alt f="axisper033" c="COD_LIT" lit="105330"/></c:set>
                          <c:set var="title2"> <axis:alt f="axisper033" c="AGENTE_LIT" lit="105330"/> </c:set>
                          <c:set var="title0"> <axis:alt f="axisper033" c="TAGENTE_LIT" lit="100584"/></c:set>
                        
                          <display:table name="${agents_visio2}" id="agentes2" export="false" class="dsptgtable"
                                         pagesize="-1" defaultsort="1" cellpadding="0" cellspacing="0"
                                         requestURI="axis_axisper033.do?paginar=true&subpantalla=datosgenerales">
                            <%@ include file="../include/displaytag.jsp"%>
                            <display:column title=" " sortable="false" sortProperty="" headerClass="headwidth5 sortable fixed"
                                            style="width:5%;" media="html" autolink="false">
                              <div class="dspIcons">
                                <input <c:if test="${agentes2.CAGENTE == __formdata.CAGENTE2}">checked</c:if>
                                       type="radio" onclick="seleccionarLista('${agentes2.CODI}','${agentes2.CAGENTE}')"
                                       id="seleccionaAgente2" name="seleccionaAgente2" value="${agentes2.CAGENTE}"/>
                              </div>
                            </display:column>
                            <display:column title="${title0}" sortable="true" style="width:10%;" sortProperty="CAGENTEs"
                                            headerClass="sortable fixed" media="html" autolink="false">
                              <div class="dspText">
                                ${agentes2.CAGENTE}
                              </div>
                            </display:column>
                            <display:column title="${title1}" sortable="true" style="width:90%;"
                                            sortProperty="TAGENTE" headerClass="headwidth5 sortable fixed"
                                            media="html" autolink="false">
                              <div class="dspText">
                                ${agentes2.TAGENTE}
                              </div>
                            </display:column>
                          </display:table>
                       </div>
                          </axis:visible>
                        <div class="separador">&nbsp;</div>
                        <table class="area" align="center">
                          <c:if test="${empty persona2.CTIPPER || persona2.CTIPPER != -1}">
                            <tr>
                              <td class="campocaja">
                                <div style="float:left;">
                                  <img id="datosgenerales2_parent" src="images/mes.gif"
                                       onclick="objEstilos.toggleDisplay('datosgenerales2', this)"
                                       style="cursor:pointer"/>
                                   <b><axis:alt f="axisper033" c="LIT_DAT" lit="103593"/></b>
                                </div>                              
                                <div style="clear:both;">
                                  <hr class="titulo"></hr>
                                </div>
                              </td>
                            </tr>
                            <tr id="datosgenerales2_children" style="display:none">
                              <td align="left">
                                <table class="seccion">
                                  <tr>
                                    <th style="width:2%;height:0px">&nbsp;</th>
                                    <th style="width:17%;height:0px">&nbsp;</th>
                                    <th style="width:17%;height:0px">&nbsp;</th>
                                    <th style="width:17%;height:0px">&nbsp;</th>
                                    <th style="width:16%;height:0px">&nbsp;</th>
                                    <th style="width:16%;height:0px">&nbsp;</th>
                                    <th style="width:11%;height:0px">&nbsp;</th>
                                    <th style="width:2%;height:0px">&nbsp;</th>
                                  </tr>
                                  <tr>
                                    <td>&nbsp;</td>
                                    <td class="titulocaja">
                                      <b><axis:alt f="axisper033" c="TIT1" lit="102844"/></b>
                                    </td>
                                    <td class="titulocaja">
                                      <b><axis:alt f="axisper033" c="TIT2" lit="109774"/></b>
                                    </td>
                                    <td class="titulocaja">
                                      <b><axis:alt f="axisper033" c="TIT3" lit="105330"/></b>
                                     <c:if test="${persona2.CTIPPER != 2}">
                                      <td class="titulocaja">
                                        <b><axis:alt f="axisper033" c="TIT4" lit="100962"/></b>
                                      </td>
                                      <td class="titulocaja">
                                        <b><axis:alt f="axisper033" c="TIT5" lit="1000064"/></b>
                                      </td>
                                    </c:if>
                                    <c:if test="${persona2.CTIPPER == 2}">                             
                                        <axis:ocultar c="FNACIMI" f="axisper033" dejarHueco="false">
                                            <td class="titulocaja" id="tit_FNACIMI">
                                                <b  id="label_FNACIMI"><axis:alt f="axisper033" c="FNACIMI" lit="1000064"/></b>
                                            </td>
                                        </axis:ocultar>
                                    </c:if>
                                      <td class="titulocaja">
                                      <b><axis:alt f="axisper033" c="TIT6" lit="9000792"/></b>
                                    </td>
                                  </tr>
                                  <tr>                     
                                    <td>&nbsp;</td>
                                    <td class="campocaja">
                                      <input type="text" name="DESCIDENT" value="${persona2.DESCIDENT}"
                                             class="campowidthinput campo campotexto" style="width:90%"
                                             <axis:atr f="axisper033" c="DESCIDENT" a="modificable=false"/>/>
                                    </td>
                                    <td class="campocaja">
                                      <input type="text" name="TTIPIDE" value="${persona2.TTIPIDE}"
                                             class="campowidthinput campo campotexto" style="width:90%"
                                             <axis:atr f="axisper033" c="TTIPIDE" a="modificable=false"/>/>
                                    </td>
                                    <td class="campocaja">
                                      <input type="text" name="NNUMIDE" id="NNUMIDE" value="${persona2.NNUMIDE}"
                                             class="campowidthinput campo campotexto" style="width:50%"
                                             <axis:atr f="axisper033" c="NNUMIDE" a="modificable=false"/>/>
                                    </td>
                                    <c:if test="${persona2.CTIPPER == 2}">
                                       <axis:ocultar c="FNACIMI" f="axisper033" dejarHueco="false">
                                    <td class="campocaja" id="td_FNACIMI">
                                     <input type="text" name="FNACIMI" id="FNACIMI"
                                            value='<fmt:formatDate pattern="dd/MM/yyyy" value="${persona2.FNACIMI}"/>'
                                            class="campowidthinput campo campotexto" style="width:70%"
                                            <axis:atr f="axisper033" c="FNACIMI" a="modificable=false&formato=fecha"/>
                                            title='<axis:alt f="axisper033" c="FNACIMI_ALT" lit="100959"/>'/>
                                     </td>
                                    </axis:ocultar>
                                      <td class="campocaja">
                                        <input onclick="javascript:void(0)" type="checkbox" id="SWPUBLI" name="SWPUBLI"
                                               <c:if test="${persona2.SWPUBLI == 1}">checked="true"</c:if>
                                               value="persona2.SWPUBLI" disabled="disabled"/>
                                      </td>
                                    </c:if>
                                    <td class="campocaja">
                                      <c:if test="${persona2.CTIPPER != 2}">
                                        <input type="text" name="TSEXPER" id="TSEXPER" value="${persona2.TSEXPER}"
                                               class="campowidthinput campo campotexto" style="width:50%"
                                               <axis:atr f="axisper033" c="TSEXPER" a="modificable=false"/>/>
                                      </c:if>
                                    </td>
                                <td class="campocaja">
                                      <c:if test="${persona2.CTIPPER != 2}">
                                        <input type="text" name="FNACIMI" id="FNACIMI"
                                               value='<fmt:formatDate pattern="dd/MM/yyyy" value="${persona2.FNACIMI}"/>'
                                               class="campowidthinput campo campotexto" style="width:70%"
                                               <axis:atr f="axisper033" c="FNACIMI" a="modificable=false&formato=fecha"/>
                                               title='<axis:alt f="axisper033" c="FNACIMI_ALT" lit="100959"/>'/>
                                      </c:if>
                               <c:if test="${persona2.CTIPPER != 2}">
                                      <td class="campocaja" align="center">
                                        <input onclick="" type="checkbox" id="SWPUBLI" name="SWPUBLI"
                                               <c:if test="${persona2.SWPUBLI == 1}">checked="true"</c:if>
                                               value="persona2.SWPUBLI" disabled="disabled"/>
                                      </td>
                                    </c:if>
                                   </tr>
                                  <c:if test="${!empty persona2.TDIGITOIDE}">
                                  <tr>
                            <td></td>
                            <axis:ocultar c="SWRUT" f="axisper033"  dejarHueco="false">
                             <td colspan="2" id="tit_SWRUT">
                               <table  cellpadding="0" cellspacing="0">
                               <tr>
                                    <th style="width:20%;height:0px"></th>
                                    <th style="width:80%;height:0px"></th>                                
                                </tr>
                                <tr>
                                 <td class="titulocaja" >
                                    <b id="label_SWRUT"><axis:alt f="axisper033" c="SWRUT" lit="9903067"/></b>
                                 </td>
                                 <td class="titulocaja" id="tit_TDIGITOIDE">
                                    <b id="label_TDIGITOIDE"><axis:alt f="axisper033" c="TDIGITOIDE" lit="9903068"/></b>
                                 </td>
                                </tr>
                                </table>
                              </td>
                             </axis:ocultar>
                            </tr>
                            <tr>
                            <td></td>
                             <axis:ocultar c="SWRUT" f="axisper033"  dejarHueco="false">
                                <td id="td_SWRUT" colspan="2">
                                <table style="height:0px">
                                <tr>
                                    <th style="width:20%;height:0px"></th>
                                    <th style="width:80%;height:0px"></th>                                
                                </tr>
                                <tr>
                                <td class="campocaja">
                                      <input  type="checkbox" id="SWRUT" name="SWRUT"  <axis:atr f="axisper033" c="SWRUT" a="modificable=false&isInputText=false"/> 
                                      <c:if test="${persona2.SWRUT == 1}">checked="true"</c:if>  value="${persona2.SWRUT}"/>
                                </td>
                                <td class="campocaja" id="td_TDIGITOIDE">
                                   <input type="text" class="campowidthinput campo campotexto" size="50" 
                                    value="${persona2.TDIGITOIDE}" name="TDIGITOIDE" id="TDIGITOIDE"  style="width:25%;"
                                    <axis:atr f="axisper033" c="TDIGITOIDE" a="modificable=false"/>>
                                </td>
                                </tr>
                                </table>
                                </td>
                                </axis:ocultar>
                            </tr>
                            </c:if>
                                  <tr>
                                    <td>&nbsp;</td>
                                    <td colspan="6">
                                      <hr></hr>
                                    </td>
                                  </tr>
                                  <tr>
                                    <td>&nbsp;</td>
                                    <axis:ocultar f="axisper033" c="TNOMBRE" dejarHueco="false">
                                         <td class="titulocaja" colspan="2" id="tit_TNOMBRE">
                                          <b id="label_TNOMBRE"><axis:alt f="axisper033" c="TNOMBRE" lit="105940"/></b>
                                        </td>
                                    </axis:ocultar>
                                    <axis:ocultar f="axisper033" c="TNOMBRE1" dejarHueco="false">
                                        <td class="titulocaja" id="tit_TNOMBRE1">
                                          <b id="label_TNOMBRE1"><axis:alt f="axisper033" c="TNOMBRE1" lit="105940"/></b>
                                        </td>
                                    </axis:ocultar>
                                     <axis:ocultar f="axisper033" c="TNOMBRE2" dejarHueco="false">
                                        <td class="titulocaja" id="tit_TNOMBRE2">
                                          <b id="label_TNOMBRE2"><axis:alt f="axisper033" c="TNOMBRE2" lit="9902260"/></b>
                                        </td>
                                    </axis:ocultar>
                                    <axis:ocultar f="axisper033" c="TAPELLI1" dejarHueco="false">
                                      <td class="titulocaja" colspan="2" id="tit_TAPELLI1">
                                        <b id="label_TAPELLI1"><axis:alt f="axisper033" c="TAPELLI1" lit="108243"/></b>
                                      </td>
                                      </axis:ocultar>
                                 <c:if test="${!empty persona2.CTIPPER && persona2.CTIPPER == 2}">
                                      <td class="titulocaja">
                                        <b><axis:alt f="axisper033" c="TESTPER" lit="9000793"/></b>
                                      </td>
                                      <td class="titulocaja">
                                        <b><axis:alt f="axisper033" c="TPAIS" lit="9000789"/></b>
                                      </td>
                                </c:if>
                                <c:if test="${empty persona2.CTIPPER || persona2.CTIPPER != 2}">
                                      <td class="titulocaja" colspan="2" id="tit_TAPELLI2">
                                        <b><axis:alt f="axisper033" c="TAPELLI2" lit="108246"/></b>
                                      </td>
                                    </c:if>
                                  </tr>
                                  <tr>
                                    <axis:ocultar f="axisper033" c="td_TNOMBRE" dejarHueco="false">
                                    <td  id="td_TNOMBRE">&nbsp;</td>
                                    </axis:ocultar>
                                    <axis:ocultar f="axisper033" c="TNOMBRE"  dejarHueco="false">
                                    <td class="campocaja" colspan="2"  id="td_TNOMBRE">
                                        <input type="text" name="TNOMBRE" id="TNOMBRE" value="${persona2.TNOMBRE}"
                                             class="campowidthinput campo campotexto" style="width:95%"
                                             <axis:atr f="axisper033" c="TNOMBRE" a="modificable=false"/>/>
                                    </td>
                                    </axis:ocultar>
                                    <axis:ocultar f="axisper033" c="TNOMBRE1" dejarHueco="false">
                                        <td class="campocaja" colspan="1" id="td_TNOMBRE1">
                                          <input type="text" name="TNOMBRE1" id="TNOMBRE1" value="${persona2.TNOMBRE1}"
                                                 class="campowidthinput campo campotexto" style="width:95%"
                                                 <axis:atr f="axisper033" c="TNOMBRE1" a="modificable=false"/>/>
                                        </td>
                                    </axis:ocultar>
                                    <axis:ocultar f="axisper033" c="TNOMBRE2" dejarHueco="false">
                                        <td class="campocaja" colspan="1" id="td_TNOMBRE2">
                                          <input type="text" value="${persona2.TNOMBRE2}" name="TNOMBRE2" id="TNOMBRE2"
                                                 class="campowidthinput campo campotexto"
                                                 style="width:95%" title="<axis:alt f="axisper033" c="TNOMBRE2" lit="9902260"/>"
                                                 <axis:atr f="axisper033" c="TNOMBRE2" a="modificable=false"/>/>
                                        </td>
                                     </axis:ocultar>
                                    <axis:ocultar f="axisper033" c="TAPELLI1" dejarHueco="false">
                                       <td class="campocaja" colspan="2" id="td_TAPELLI1">
                                        <input type="text" name="TAPELLI1" id="TAPELLI1" value="${persona2.TAPELLI1}"
                                               class="campowidthinput campo campotexto" style="width:94%"
                                               <axis:atr f="axisper033" c="TAPELLI1" a="modificable=false"/>/>
                                      </td>
                                    </axis:ocultar>
                                      
                                    <c:if test="${!empty persona2.CTIPPER && persona2.CTIPPER == 2}">
                                      <axis:ocultar c="TESTPER" f="axisper033" dejarHueco="false">
                                        <td class="campocaja">
                                          <input type="text" name="TESTPER" value="${persona2.TESTPER}"
                                                 class="campowidthinput campo campotexto"  style="width:95%"
                                                 <axis:atr f="axisper033" c="TESTPER" a="modificable=false"/>/>
                                        </td>
                                      </axis:ocultar>
                                      <axis:ocultar c="TPAIS" f="axisper033" dejarHueco="false">
                                        <td class="campocaja" colspan="2">
                                          <input type="text" name="TPAIS" id="TPAIS" value="${persona2.TPAIS}"
                                                 class="campowidthinput campo campotexto" style="width:95%"
                                                 <axis:atr f="axisper033" c="TPAIS" a="modificable=false"/>/>
                                        </td>
                                      </axis:ocultar>
                                      <td>&nbsp;</td>
                                    </c:if>
                                    <c:if test="${empty persona2.CTIPPER || persona2.CTIPPER != 2}">
                                      <td class="campocaja" colspan="2" id="td_TAPELLI2">
                                        <input type="text" name="TAPELLI2" id="TAPELLI2" value="${persona2.TAPELLI2}"
                                               class="campowidthinput campo campotexto" style="width:95%"
                                               <axis:atr f="axisper033" c="TAPELLI2" a="modificable=false"/>/>
                                      </td>
                                    </c:if>
                                  </tr>
                                  <tr>
                                    <td>&nbsp;</td>
                                    <c:if test="${persona2.CTIPPER != 2}">
                                      <td class="titulocaja" colspan="2">
                                        <b><axis:alt f="axisper033" c="TPROFES" lit="110978"/></b>
                                      </td>
                                      </c:if>
                                      <axis:visible c="CIDIOMA" f="axisper033">
                                      <c:if test="${__formdata.CTIPPER != 2 || __configform.axisper033__CIDIOMA__visible == 'true'}"> 
                                      <td class="titulocaja">
                                        <b><axis:alt f="axisper033" c="LIT3" lit="1000246"/></b>
                                      </td>
                                      </c:if>
                                    </axis:visible>
                                     <axis:ocultar c="SNIP" f="axisper033" dejarHueco="false">
                                    <td class="titulocaja">
                                      <b><axis:alt f="axisper033" c="LIT4" lit="1000088"/></b>
                                    </td>
                                    </axis:ocultar>
                                    <c:if test="${empty persona2.CTIPPER || persona2.CTIPPER != 2}">
                                      <td class="titulocaja" colspan="2">
                                        <b><axis:alt f="axisper033" c="TPAIS" lit="9000789"/></b>
                                      </td>
                                    </c:if>
                                  </tr>
                                  <tr>
                                    <td>&nbsp;</td>
                                    <c:if test="${persona2.CTIPPER != 2}">
                                      <td class="campocaja" colspan="2">
                                        <input type="text" name="TPROFES" id="TPROFES" value="${persona2.TPROFES}"
                                               class="campowidthinput campo campotexto" style="width:95%"
                                               <axis:atr f="axisper033" c="TPROFES" a="modificable=false"/>/>
                                      </td>
                                      </c:if>
                                      <axis:visible c="CIDIOMA" f="axisper033">
                                      <c:if test="${__formdata.CTIPPER != 2 || __configform.axisper033__CIDIOMA__visible == 'true'}"> 
                                      <td class="campocaja">
                                        <input type="text" name="TIDIOMA" id="TIDIOMA" value="${persona2.TIDIOMA}"
                                               class="campowidthinput campo campotexto" style="width:90%"
                                               <axis:atr f="axisper033" c="TIDIOMA" a="modificable=false"/>/>
                                      </td>
                                      </c:if>
                                      </axis:visible>
                                     <axis:ocultar c="SNIP" f="axisper033" dejarHueco="false">
                                    <td class="campocaja">
                                      <input type="text" name="SNIP" id="SNIP" value="${persona2.SNIP}"
                                             class="campowidthinput campo campotexto" style="width:89%"
                                             <axis:atr f="axisper033" c="SNIP" a="modificable=false"/>/>
                                    </td>
                                    </axis:ocultar>
                                    <c:if test="${empty persona2.CTIPPER || persona2.CTIPPER != 2}">
                                      <td class="campocaja" colspan="2">
                                        <input type="text" name="TPAIS" id="TPAIS" value="${persona2.TPAIS}"
                                               class="campowidthinput campo campotexto" style="width:95%"
                                               <axis:atr f="axisper033" c="TPAIS" a="modificable=false"/>/>
                                      </td>
                                    </c:if>
                                  </tr>
                                  <tr>
                                    <td>&nbsp;</td>
                                    <c:if test="${empty persona2.CTIPPER || persona2.CTIPPER != 2}">
                                      <td class="titulocaja">
                                        <b><axis:alt f="axisper033" c="LIT5" lit="9000793"/></b>
                                      </td>
                                    </c:if>
                                    <c:if test="${persona2.CESTPER == 2 && persona2.CTIPPER != 2}">
                                      <td class="titulocaja">
                                        <b><axis:alt f="axisper033" c="LIT6" lit="9000794"/></b>
                                      </td>
                                    </c:if>
                                    <c:if test="${persona2.CTIPPER != 2}">
                                      <td class="titulocaja">
                                        <b><axis:alt f="axisper033" c="LIT7" lit="1000067"/></b>
                                      </td>
                                    </c:if>
                                     <c:if test="${persona2.CTIPPER != 2}">
                                      <axis:ocultar c="CESTCIV" f="axisper033" dejarHueco="false">   
                                      <td class="titulocaja">
                                        <b><axis:alt f="axisper033" c="LIT8" lit="9900955"/></b>
                                      </td>
                                      </axis:ocultar>
                                    </c:if>
                                  </tr>
                                  <tr>
                                    <td>&nbsp;</td>
                                    <axis:ocultar c="TESTPER" f="axisper033" dejarHueco="false">
                                      <c:if test="${empty persona2.CTIPPER || persona2.CTIPPER != 2}">
                                        <td class="campocaja">
                                          <input type="text" name="TESTPER" value="${persona2.TESTPER}"
                                                 class="campowidthinput campo campotexto" style="width:95%"
                                                 <axis:atr f="axisper033" c="TESTPER" a="modificable=false"/>/>
                                        </td>
                                      </c:if>
                                    </axis:ocultar>
                                    <c:if test="${persona2.CESTPER == 2 && persona2.CTIPPER != 2}">
                                      <axis:ocultar c="FDEFUNC" f="axisper033" dejarHueco="false">
                                        <td class="campocaja">
                                          <input type="text" name="FDEFUNC" class="campowidthinput campo campotexto"
                                                 value='<fmt:formatDate pattern="dd/MM/yyyy" value="${persona2.FDEFUNC}"/>'
                                                 style="width:95%" <axis:atr f="axisper033" c="FDEFUNC" a="modificable=false"/>/>
                                        </td>
                                      </axis:ocultar>
                                    </c:if>
                                    <c:if test="${persona2.CTIPPER != 2}">
                                      <axis:ocultar c="FJUBILA" f="axisper033" dejarHueco="false">
                                        <td class="campocaja">
                                          <input type="text" name="FJUBILA"
                                                 value='<fmt:formatDate pattern="dd/MM/yyyy" value="${persona2.FJUBILA}"/>'
                                                 class="campowidthinput campo campotexto" style="width:95%"
                                                 <axis:atr f="axisper033" c="FJUBILA" a="modificable=false"/>/>
                                        </td>
                                      </axis:ocultar>
                                    </c:if>                                    
                                      <c:if test="${persona2.CTIPPER != 2}">
                                       <axis:ocultar c="CESTCIV" f="axisper033" dejarHueco="false">  
                                            <td class="campocaja">
                                              <input type="text" name="TESTCIV" value="${persona2.TESTCIV}"
                                                     class="campowidthinput campo campotexto" style="width:95%"
                                                     <axis:atr f="axisper033" c="TESTCIV" a="modificable=false"/>/>
                                            </td>                                    
                                        </axis:ocultar>
                                      </c:if>
                                  </tr>
                                </table>
                              </td>
                            </tr>
                          </c:if>
                         </table>  
                        </td>
                    </tr>
                  </table>
                </td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
      <div class="separador">&nbsp;</div>
      <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisper033</c:param><c:param name="f">axisper033</c:param>
       <c:param name="f">axisper033</c:param>
        <c:param name="__botones">salir,9903299</c:param>
      </c:import>
    </form><c:import url="../include/mensajes.jsp"/></body>
</html>