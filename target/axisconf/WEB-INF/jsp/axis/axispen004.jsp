<%/**
*  Fichero: axispen014.jsp
* 
*  Busqueda de Depositarias
*	
*
*
*  Fecha: 14/12/2009
*/
%>
<%@ page contentType="text/html;charset=windows-1252" errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
    <head>
        <title><axis:alt c="TITLE" f="axispen004" lit="151501"/></title>
        <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
        <link rel="stylesheet" href="styles/displaytag.css">
        <c:import url="../include/carga_framework_js.jsp" />
        <script language="Javascript" type="text/javascript">
            /****************************************************************************************/
            /*********************************** NAVEGACION *****************************************/
            /****************************************************************************************/
             function f_onload(){
                f_cargar_propiedades_pantalla();
                var borrat   = "${__formdata.okk}"
                
                if (!objUtiles.estaVacio(borrat)) f_buscar_planes();
                
                //Si la selecció es buida, obrim cercador automàticament
                var hayErrores = ${!empty requestScope.__mensajes.m__clave};
                if (${empty __formdata.AXIS_PLANES} 
                    //&& !hayErrores
                    ) f_but_buscar_planes();
             }         

            function f_modificar_pla_pensio(ccodpla) {
                f_abrir_modal("axispen014",null,"&parametro=mod&CCODPLA="+ccodpla);
            }     

            function f_alta_plan() {
                f_abrir_modal("axispen014",null,"&parametro=ALTA");
                
            }                 
            
             function f_cerrar_modal(cual) {
                objUtiles.cerrarModal(cual); 
               }

             function f_cerrar_modal2(cual) {
                objUtiles.cerrarModal(cual); 
                 f_buscar_planes();                 
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
            
             
             function f_buscar_planes(){    
                objUtiles.ejecutarFormulario("axis_axispen004.do", "busqueda_plans", document.miForm, "_self", objJsMessages.jslit_cargando);
                    }

             function f_borrar_pla_pensio(CODDGS){
             objUtiles.ejecutarFormulario("axis_axispen004.do?codig="+CODDGS, "borrado_plans", document.miForm, "_self", objJsMessages.jslit_cargando);
             }
                    
             function f_seleccionar_plan(CCODPLA){
               f_buscar_planes();
            }
           
        
            function f_but_salir() {
                objUtiles.ejecutarFormulario ("main.do", "trabajo", document.miForm, "_self");
            }
                    
            function f_aceptar_axispen009(CCODPLAN) {
                objUtiles.cerrarModal("axispen009");            
                objDom.setValorPorId("CCODPLA", CCODPLAN); 
                f_buscar_planes();            
            }
        
            function f_but_salir() {
                    objUtiles.ejecutarFormulario ("main.do", "trabajo", document.miForm, "_self");
            }
            function f_aceptarAxispen014(CCODPLA){
                objUtiles.cerrarModal("axispen014");
                objDom.setValorPorId("CCODPLA", CCODPLA); 
                f_buscar_planes();
            }
        </script>
    </head>
    <body onload="f_onload()">
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
    <form name="miForm" action="" method="POST">
        <input type="hidden" name="operation"/>
        <input type="hidden" name="radioPlanes" value=""/>                
        <input type="hidden" name="NCONTADOR" id = "NCONTADOR" value="${__formdata.NCONTADOR}" /> 
        
        <input type="hidden" id="CCODPLA" name="CCODPLA" value="${__formdata.CCODPLA}"/>
        <input type="hidden" id="TCODPLA" name="TCODPLA" value="${__formdata.TCODPLA}"/>
        <input type="hidden" id="CCODFON2" name="CCODFON2" value="${__formdata.CCODFON2}"/>        
        <input type="hidden" id="CTIPIDE" name="CTIPIDE" value="${__formdata.CTIPIDE}"/>        
        <input type="hidden" id="NNUMIDE" name="NNUMIDE" value="${__formdata.NNUMIDE}"/>        
        
        
        <c:import url="../include/titulo_nt.jsp">
                <c:param name="modalidad"><axis:alt c="MODALIDAD" f="axispen004" lit="9900820"/></c:param>
                <c:param name="formulario"><axis:alt c="FORMULARIO" f="axispen004" lit="9900820"/></c:param>
                <c:param name="form">axispen004</c:param>
        </c:import>
        
        <c:import url="../include/modal_estandar.jsp">
                <c:param name="nid_y_titulo">
                    axispen009|<axis:alt c="TITLE_AXISPEN009" f="axispen004" lit="9900850"/><%-- Cercador de plans de pensions --%>
                </c:param>
         </c:import>
        
        <c:import url="../include/modal_estandar.jsp">
                <c:param name="nid_y_titulo">
                    axispen014|<axis:alt c="TITLE_AXISPEN014" f="axispen004" lit="9900722"/><%-- Cercador de plans de pensions --%>
                </c:param>
         </c:import>         
                        
        
         
    <!-- Area de campos  -->
    <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
      <tr>
         <td>
               <div class="separador">&nbsp;</div>
               <div class="separador">&nbsp;</div>  
               <div class="titulo">
                  <img src="images/flecha.gif"/><axis:alt c="BUSCAR" f="axispen004" lit="9900825"/> <img border="0" src="images/find.gif" onclick="f_but_buscar_planes()" style="cursor:pointer" alt="<axis:alt c="BUSCAR2" f="axispen004" lit="9000508"/>" title="<axis:alt c="BUSCAR2" f="axispen004" lit="9000508"/>"/>
               </div>
                <!-- Lista de Planes de pensión -->
               <table class="seccion">
                    <tr>
                      <td>
                        <c:set var="title0">&nbsp;</c:set>
                        <c:set var="title1">
                            <axis:alt c="CODPLANPEN" f="axispen004" lit="1000109"/><!-- Código plan pensión -->
                        </c:set>
                        <c:set var="title2">
                            <axis:alt c="NOMBRE" f="axispen004" lit="105940"/>><!-- Nombre -->
                        </c:set>
                        <c:set var="title3">
                            <axis:alt c="MODALIDAD" f="axispen004" lit="100943"/><!-- Modalidad -->
                        </c:set>
                        <c:set var="title4">
                            <axis:alt c="SISTEMA" f="axispen004" lit="9900821"/><!-- Sistema -->
                        </c:set>                                    
                        <c:set var="title5">
                            <axis:alt c="FALTA" f="axispen004" lit="9001192"/><!-- Fecha alta -->
                        </c:set>
                        <c:set var="title6">
                            <axis:alt c="COMERCIAL" f="axispen004" lit="9900822"/><!-- Comercial -->
                        </c:set>    
                        <!--Imatge nou registre-->
                         <div style="float:right;">
                            <a href="javascript:f_alta_plan()"><img border="0" alt="<axis:alt c="ALTPLAN" f="axispen004" lit="104825"/>" title="<axis:alt c="ALTPLAN" f="axispen004" lit="104825"/>" src="images/new.gif"/></a>
                        </div>                                    
                        <!--Fi imatge nou registre-->    
                        
                        <% int contador = 0;%>                                    
                        <div class="seccion  displayspace">
                            <display:table name="${__formdata.AXIS_PLANES}"
                                           id="miListaPlanes"
                                           export="false"
                                           class="dsptgtable"
                                           pagesize="-1"
                                           requestURI="axis_axispen004.do?paginar=true"
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
                           
                                
                                 <display:column title="" sortable="false" sortProperty=""  style="width:10%" headerClass="headwidth5 sortable" media="html" autolink="false" >
                                   <div class="dspIcons"><a href="javascript:f_modificar_pla_pensio('${miListaPlanes.OB_IAX_PLANPENSIONES['CCODPLA']}');"><img border="0" alt="<axis:alt c="MODPLAN" f="axispen004" lit="9900815"/>" title="<axis:alt c="MODPLAN" f="axispen004" lit="9900815"/>" src="images/lapiz.gif"/></a></div>
                                </display:column>                                    
                                <display:column title="" sortable="false" sortProperty=""  style="width:10%" headerClass="headwidth5 sortable" media="html" autolink="false" >
                                   <div class="dspIcons"><a href="javascript:f_borrar_pla_pensio('${miListaPlanes.OB_IAX_PLANPENSIONES['CCODPLA']}')"><img border="0" alt="<axis:alt c="DELPLAN" f="axispen004" lit="1000127"/>" title="<axis:alt c="DELPLAN" f="axispen004" lit="1000127"/>" src="images/delete.gif"/></a></div>
                                </display:column>
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
                                       <b><axis:alt c="DSP_DATOS_PLAN_parent" f="axispen004" lit="9901048"/></b>&nbsp;&nbsp;
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
                                            <axis:ocultar f="axispen00" c="CCODFON"> 
                                                <td class="titulocaja">
                                                     <b><axis:alt c="CCODFON" f="axispen004" lit="1000179"/></b>
                                                </td>
                                            </axis:ocultar>
                                        </tr>
                                        <tr>
                                            <axis:ocultar f="axispen00" c="CCODFON"> 
                                                <td class="campocaja">
                                                    <input  type="text" style="width:10%" name="CCODFON" id="CCODFON" value="${__formdata.AXIS_PLANES[__formdata.NCONTADOR].OB_IAX_PLANPENSIONES.CFONDGS}" class="campowidthinput campo" readonly="true"/>                                             
                                                    <input  type="text" style="width:80%" name="TENTIDAD" id="TENTIDAD" value="${__formdata.AXIS_PLANES[__formdata.NCONTADOR].OB_IAX_PLANPENSIONES.TFONDO}" class="campowidthinput campo" readonly="true"/>
                                                </td>
                                            </axis:ocultar>  
                           
                                        </tr>
                                        <tr>                            
                                            <axis:ocultar f="axispen004" c=""> 
                                                <td class="titulocaja">
                                                    <b><axis:alt c="CCODGESA" f="axispen004" lit="9001782"/></b>
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
    <c:import url="../include/botonera_nt.jsp">
        <c:param name="f">axispen004</c:param>
        <c:param name="__botones">salir</c:param>
    </c:import>
</form>
<c:import url="../include/mensajes.jsp" />
</body>
</html>

