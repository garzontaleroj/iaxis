<%/*
*  Fichero: axispro047.jsp
*
*  @author @Jordi Boixader
*  Fecha: 23/07/2013
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
           parent.f_aceptar_modal("axispro047");
        }
        
        function f_onload() {
            if (objDom.getValorPorId("GUARDAR")=="OK"){
                parent.f_aceptar_modal("axispro047");
            }  
            f_cargar_propiedades_pantalla();
        }
        function f_but_buscar_planes() {
            f_abrir_modal("axispen009",null,"&parametro=MANTENIMIENTO_PLANES");
        }
        function f_abrir_modal(cual, noXButton, optionalQueryString) {         
            if (objUtiles.estaVacio(optionalQueryString))                
                optionalQueryString = "";                    
            if (noXButton) 
                objDom.setVisibilidadPorId("but_cerrar_modal_" + cual, "hidden");             
            objUtiles.abrirModal(cual, "src", "modal_" + cual + ".do?operation=form" + optionalQueryString);        
        }
        
        function f_aceptar_axispen009(CCODPLAN) {
                objUtiles.cerrarModal("axispen009");            
                objDom.setValorPorId("CCODPLA", CCODPLAN); 
                //alert(CCODPLAN);
                objUtiles.ejecutarFormulario("modal_axispro047.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
        function f_but_guardar(){
            objUtiles.ejecutarFormulario("modal_axispro047.do", "guardar", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
        
        function f_cerrar_modal(cual){
            objUtiles.cerrarModal(cual); 
        }
    </script>
  </head>
  
  <body onload="f_onload()">
    <c:import url="../include/precargador_ajax.jsp"><c:param name="imagen" value="images/ajax-loader.gif"></c:param></c:import>
    
    <form name="miForm" action="modal_axispro047.do" method="POST">         
        <c:import url="../include/titulo_nt.jsp">
            <c:param name="formulario"></c:param>
            <c:param name="form">axispro047</c:param>
            <c:param name="titulo"><axis:alt c="CCODFON" f="axispro047" lit="9905800"/></c:param>
        </c:import>
        <c:import url="../include/modal_estandar.jsp">
                <c:param name="nid_y_titulo">
                    axispen009|<axis:alt c="TITLE_AXISPEN009" f="axispro047" lit="9900850"/><%-- Cercador de plans de pensions --%>
                </c:param>
         </c:import>
        <input type="hidden" id="SPRODUC" name="SPRODUC" value="${mntproducto.SPRODUC}"/>
        <input type="hidden" id="CCODPLA" name="CCODPLA" value="${__formdata.CCODPLA}"/>
        <input type="hidden" id="GUARDAR" name="GUARDAR" value="${__formdata.GUARDAR}"/>
        <input type="hidden" id="operation" name="operation" value=""/>
    
        <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td>
                    <div  style="color: #FF9900"><b>${mntproducto.SPRODUC} - ${mntproducto.TITULO[0].OB_IAX_PRODTITULO.TTITULO}</b></div>
                    
                    <table class="seccion">
                         <tr>
         <td>
               <div class="titulocaja">
                  <b><axis:alt c="BUSCAR" f="axispro047" lit="9900825"/></b> <img border="0" src="images/find.gif" onclick="f_but_buscar_planes()" style="cursor:pointer" alt="<axis:alt c="BUSCAR2" f="axispro047" lit="9000508"/>" title="<axis:alt c="BUSCAR2" f="axispro047" lit="9000508"/>"/>
               </div>
                <!-- Lista de Planes de pensión -->
               <table class="seccion">
                    <tr>
                      <td>
                        <c:set var="title0">&nbsp;</c:set>
                        <c:set var="title1">
                            <axis:alt c="CODPLANPEN" f="axispro047" lit="1000109"/><!-- Código plan pensión -->
                        </c:set>
                        <c:set var="title2">
                            <axis:alt c="NOMBRE" f="axispro047" lit="105940"/><!-- Nombre -->
                        </c:set>
                        <c:set var="title3">
                            <axis:alt c="MODALIDAD" f="axispro047" lit="100943"/><!-- Modalidad -->
                        </c:set>
                        <c:set var="title4">
                            <axis:alt c="SISTEMA" f="axispro047" lit="9900821"/><!-- Sistema -->
                        </c:set>                                    
                        <c:set var="title5">
                            <axis:alt c="FALTA" f="axispro047" lit="9001192"/><!-- Fecha alta -->
                        </c:set>
                        <c:set var="title6">
                            <axis:alt c="COMERCIAL" f="axispro047" lit="9900822"/><!-- Comercial -->
                        </c:set>    
                        <!--Imatge nou registre-->
                         <div style="float:right;">
                            <%--<a href="javascript:f_alta_plan()"><img border="0" alt="<axis:alt c="ALTPLAN" f="axispro047" lit="104825"/>" title="<axis:alt c="ALTPLAN" f="axispro047" lit="104825"/>" src="images/new.gif"/></a>
                            --%>
                        </div>                                    
                        <!--Fi imatge nou registre-->    
                        
                        <% int contador = 0;%>                                    
                        <div class="seccion  displayspace">
                            <display:table name="${__formdata.AXIS_PLANES}"
                                           id="miListaPlanes"
                                           export="false"
                                           class="dsptgtable"
                                           pagesize="-1"
                                           requestURI="axis_axispro047.do?paginar=true"
                                           sort="list"
                                           cellpadding="0"
                                           cellspacing="0">
                                <%@ include file="../include/displaytag.jsp"%>
                                <c:set var="contador"><%=contador%></c:set>
                              <display:column headerClass="sortable fixed"
                                                title=""
                                                media="html"
                                                autolink="false">
                                    <div class="dspIcons">
                                        <input value="${miListaPlanes['CCODPLA']}"
                                               type="radio"
                                               <c:if test="${!empty __formdata.AXIS_PLANES && __formdata.CCODPLA == miListaPlanes.OB_IAX_PLANPENSIONES['CCODPLA']}" >checked</c:if>
                                               id="radioPlanes" onclick="f_seleccionar_plan('${miListaPlanes.OB_IAX_PLANPENSIONES['CCODPLA']}')"
                                               name="radioPlanes"/>
                                    </div>
                                </display:column>                                            
                                <display:column title="${title1}"
                                                sortable="true"
                                                sortProperty="CCODPLA"
                                                headerClass="sortable fixed"
                                                media="html"
                                                autolink="false">
                                   <div class="dspText">
                                       ${miListaPlanes.OB_IAX_PLANPENSIONES['CODDGS']}
                                    </div>                                                            
                                </display:column>
                                <display:column title="${title2}"
                                                sortable="true"
                                                sortProperty="TNOMPLA"
                                                headerClass="sortable fixed"
                                                media="html"
                                                autolink="false">
                                   <div class="dspText">
                                            ${miListaPlanes.OB_IAX_PLANPENSIONES['TNOMPLA']}
                                    </div>                                               
                                </display:column>
                                <display:column title="${title3}"
                                                sortable="true"
                                                sortProperty="TMODALI"
                                                headerClass="sortable fixed"
                                                media="html"
                                                autolink="false">
                                   <div class="dspText">
                                            ${miListaPlanes.OB_IAX_PLANPENSIONES['TMODALI']}
                                    </div>                                               
                                </display:column>                                           

                                <display:column title="${title4}"
                                                sortable="true"
                                                sortProperty="TSISTEM"
                                                headerClass="sortable fixed"
                                                media="html"
                                                autolink="false">
                                   <div class="dspText">
                                            ${miListaPlanes.OB_IAX_PLANPENSIONES['TSISTEM']}
                                    </div>                                               
                                </display:column>                                           
                                <display:column title="${title5}"
                                                sortable="true"
                                                sortProperty="FALTARE"
                                                headerClass="sortable fixed"
                                                media="html"
                                                autolink="false">
                                   <div class="dspText"><fmt:formatDate value="${miListaPlanes.OB_IAX_PLANPENSIONES['FALTARE']}" pattern="dd/MM/yy" />
                                    </div>             
                                </display:column>
                                
                                <display:column title="${title6}"
                                                sortable="true"
                                                sortProperty="TCOMERC"
                                                headerClass="sortable fixed"
                                                media="html"
                                                autolink="false">
                                   <div class="dspText">
                                            ${miListaPlanes.OB_IAX_PLANPENSIONES['TCOMERC']}
                                    </div>                                               
                                </display:column>        
                           
                                <%--
                                 <display:column title="" sortable="false" sortProperty=""  style="width:10%" headerClass="headwidth5 sortable" media="html" autolink="false" >
                                   <div class="dspIcons"><a href="javascript:f_modificar_pla_pensio('${miListaPlanes.OB_IAX_PLANPENSIONES['CCODPLA']}');"><img border="0" alt="<axis:alt c="MODPLAN" f="axispro047" lit="9900815"/>" title="<axis:alt c="MODPLAN" f="axispro047" lit="9900815"/>" src="images/lapiz.gif"/></a></div>
                                </display:column>                                    
                                <display:column title="" sortable="false" sortProperty=""  style="width:10%" headerClass="headwidth5 sortable" media="html" autolink="false" >
                                   <div class="dspIcons"><a href="javascript:f_borrar_pla_pensio('${miListaPlanes.OB_IAX_PLANPENSIONES['CCODPLA']}')"><img border="0" alt="<axis:alt c="DELPLAN" f="axispro047" lit="1000127"/>" title="<axis:alt c="DELPLAN" f="axispro047" lit="1000127"/>" src="images/delete.gif"/></a></div>
                                </display:column>
                                --%>
                            <%contador++;%>                                        
                            </display:table>
                             
                            <c:choose>
                                <c:when test="${!empty  sessionScope.AXIS_PLAN}">
                                    <script language="javascript">//objUtiles.retocarDsptagtable("miListaPlanes");</script>
                                </c:when>
                                <c:otherwise>
                                    <script language="javascript">
  
                                    </script>
                                </c:otherwise>
                            </c:choose>
                        </div>
                   </td>
                </tr>
                <tr>
                   <td>                    
                     <div class="separador">&nbsp;</div>
                     <div class="separador">&nbsp;</div>                    
                        <!-- Lista de Gestoras -->
                         <table class="area" align="center">
                                <tr>
                                   <td class="campocaja" >
                                   <div style="float:left;">
                                       <img id="DSP_DATOS_PLAN_parent" src="images/mes.gif" onclick="objEstilos.toggleDisplay('DSP_DATOS_PLAN', this)" style="cursor:pointer"/> 
                                       <b><axis:alt c="DSP_DATOS_PLAN_parent" f="axispro047" lit="9901048"/></b>&nbsp;&nbsp;
                                   </div>
                                   <div style="clear:both;">
                                      <hr class="titulo">
                                   </div>
                                  </td>
                                 </tr>         
                                 <tr id="DSP_DATOS_PLAN_children" style="display:none">
                                    <td align="left" >
                                       <table class="area" align="center">
                                        <tr>
                                            <th style="width:60%;height:0px"></th>
                                            <th style="width:10%;height:0px"></th>
                                            <th style="width:15%;height:0px"></th>
                                            <th style="width:25%;height:0px"></th>                                                        
                                            <th style="width:20%;height:0px"></th>
                                        </tr>
                                                    <!-- Datos Gestión -->
                                        <tr>
                                            <axis:ocultar f="axispro047" c="CCODFON"> 
                                                <td class="titulocaja">
                                                     <b><axis:alt c="CCODFON" f="axispro047" lit="1000179"/></b>
                                                </td>
                                            </axis:ocultar>
                                        </tr>
                                        <tr>
                                            <axis:ocultar f="axispro047" c="CCODFON"> 
                                                <td class="campocaja">
                                                    <input  type="text" style="width:10%" name="CCODFON" id="CCODFON" value="${__formdata.AXIS_PLANES[__formdata.NCONTADOR].OB_IAX_PLANPENSIONES.CFONDGS}" class="campowidthinput campo" readonly="true"/>                                             
                                                    <input  type="text" style="width:80%" name="TENTIDAD" id="TENTIDAD" value="${__formdata.AXIS_PLANES[__formdata.NCONTADOR].OB_IAX_PLANPENSIONES.TFONDO}" class="campowidthinput campo" readonly="true"/>
                                                </td>
                                            </axis:ocultar>  
                           
                                        </tr>
                                        <tr>                            
                                            <axis:ocultar f="axispro047" c=""> 
                                                <td class="titulocaja">
                                                    <b><axis:alt c="CCODGESA" f="axispro047" lit="9001782"/></b>
                                                </td>
                                            </axis:ocultar>                                
                                        </tr>  
                                        <tr>
                                             <td class="campocaja">
                                                <input  type="text" style="width:10%" name="CCODGESA" id="CCODGESA" value="${__formdata.AXIS_PLANES[__formdata.NCONTADOR].OB_IAX_PLANPENSIONES.CGESDGS}" class="campowidthinput campo" readonly="true" style="width:10%"/>
                                                <input  type="text" style="width:80%" name="TCODGES" id="TCODGES" value="${__formdata.AXIS_PLANES[__formdata.NCONTADOR].OB_IAX_PLANPENSIONES.TNOMGES}" class="campowidthinput campo" readonly="true" style="width:80%"/>
                                            </td>
                                        </tr>                              
                                  </table>
                                </td> 
                            </tr>  
                          </table>
                        <div class="separador">&nbsp;</div>
                    </td>
                </tr>    
            </table>
         </td>
        </tr>
                    </table>
                </td>
            </tr>
        </table>
        
        <c:import url="../include/botonera_nt.jsp">
            <c:param name="f">axispro047</c:param>
            <c:param name="__botones">salir,guardar</c:param>
        </c:import>
        
    </form>
    <c:import url="../include/mensajes.jsp" />
</body>
</html>