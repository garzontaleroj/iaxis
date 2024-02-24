<%/**
*  Fichero: axisdesc014.jsp
* 
*  Master/detail descuentos
*	
*
*
*  Fecha: 08/05/2013
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
                <%  
                String prevPagina = request.getParameter("d-1525688-p");            
                String ncont = request.getParameter("NCONTADOR");            
                int pagina;           
                if (prevPagina == null){                  
                  if (!(ncont==null) && !ncont.equals("")) pagina = (int) (Math.floor(Integer.parseInt(ncont)/10)+1);
                  else pagina = 1;                                          
                }
                else pagina = (int) Integer.parseInt(prevPagina);
                %>  
                //revisarEstilos();                
                //Si la selecció es buida, obrim cercador automàticament
                var hayErrores = ${!empty requestScope.__mensajes.m__clave};
                if (${empty sessionScope.AXIS_DESCUENTOS} && !hayErrores)
                    f_but_buscar_desc();
                    
             }         
           
             function f_cerrar_modal(cual) {
                objUtiles.cerrarModal(cual);
               }
            
            function f_aceptar_axisdesc015(CCAMPANYA,FINICIO,FFIN) {
                objUtiles.cerrarModal("axisdesc015");
                objDom.setValorPorId("CCAMPANYA", CCAMPANYA);            
                objDom.setValorPorId("FINICIO", FINICIO);
                objDom.setValorPorId("FFIN", FFIN);
                
                objUtiles.ejecutarFormulario("axis_axisdesc014.do", "busqueda_descuentos", document.miForm, "_self", objJsMessages.jslit_cargando);          
            }
            
            function f_aceptar_axisdesc016(CCAMPANYA) {
                objUtiles.cerrarModal("axisdesc016");
                objDom.setValorPorId("CCAMPANYA", CCAMPANYA);
                objUtiles.ejecutarFormulario("axis_axisdesc014.do", "busqueda_descuentos", document.miForm, "_self", objJsMessages.jslit_cargando);          
            }     

                        
           function f_abrir_axisdesc016(){
                f_abrir_modal("axisdesc016",null,"&CMODO=NEW&CCAMPANYA="+document.miForm.CCAMPANYA.value+"&TCAMPANYA="+document.miForm.TCAMPANYA.value);
               // objUtiles.abrirModal("axisdesc016", "src", "modal_axisdesc016.do?operation=init&CCAMPANYA="+CCAMPANYA+"&CMODO="+MODO); 
            }   
            
           function f_modif_desclin(SPRODUC,CPAIS,TPAIS,CDPTO,TDPTO,CCIUDAD,TCIUDAD,CAGRUPACION,CSUCURSAL,TSUCURSAL,CINTERMEDIARIO,TINTERMEDIARIO,PDTO){
                var CCAMPANYA = objDom.getValorPorId("CCAMPANYA");
                objUtiles.abrirModal("axisdesc016", "src", "modal_axisdesc016.do?operation=init&CCAMPANYA="+CCAMPANYA+"&CMODO=MODIF"+
                                                           "&TCAMPANYA="+document.miForm.TCAMPANYA.value+ 
                                                           "&SPRODUC="+SPRODUC+"&CPAIS="+CPAIS+"&TPAIS="+TPAIS+
                                                           "&CDPTO="+CDPTO+"&TDPTO="+TDPTO+"&CCIUDAD="+CCIUDAD+"&TCIUDAD="+TCIUDAD+
                                                           "&CAGRUPACION="+CAGRUPACION+"&CSUCURSAL="+CSUCURSAL+"&TSUCURSAL="+TSUCURSAL+
                                                           "&CINTERMEDIARIO="+CINTERMEDIARIO+"&TINTERMEDIARIO="+TINTERMEDIARIO+"&PDTO="+PDTO); 
           }
            
            function f_abrir_axisdesc017(CCAMPANYA,MODO){
                objUtiles.abrirModal("axisdesc017", "src", "modal_axisdesc017.do?operation=init&CCAMPANYA="+CCAMPANYA+"&CMODO="+MODO); 
            }
            
            function f_aceptar_axisdesc017(CCAMPANYA) {
                objUtiles.cerrarModal("axisdesc017");
                objDom.setValorPorId("CCAMPANYA", CCAMPANYA);
                objDom.setValorPorId("d-1525688-p", "1");
                objUtiles.ejecutarFormulario("axis_axisdesc014.do", "busqueda_descuentos", document.miForm, "_self", objJsMessages.jslit_cargando);          
            } 
             
             function f_but_buscar_desc() {
                f_abrir_modal("axisdesc015");                
             }       
           
            
             function f_abrir_modal(cual, noXButton, optionalQueryString) {         
                if (objUtiles.estaVacio(optionalQueryString))                
                    optionalQueryString = "";                    
                if (noXButton) 
                    objDom.setVisibilidadPorId("but_cerrar_modal_" + cual, "hidden");             
                objUtiles.abrirModal(cual, "src", "modal_" + cual + ".do?operation=form" + optionalQueryString);        
                }
            
                  
             function f_seleccionar_descuento(CCAMPANYA,contador){
               //Marcar el registro de la garantía selecccionada                              
                objDom.setValorPorId("CCAMPANYA", CCAMPANYA);
                objDom.setValorPorId("NCONTADOR", contador);
                objUtiles.ejecutarFormulario("axis_axisdesc014.do", "busqueda_detalle", document.miForm, "_self", objJsMessages.jslit_cargando);         
            
                //var strURL="axis_axisdesc014.do?operation=busqueda_detalle_json&CCAMPANYA="+CCAMPANYA;
                //var ajaxTexto=objJsMessages.jslit_cargando;
                //objAjax.invokeAsyncCGI_JSON(strURL, callbackjsonRecuperarCampanya, ajaxTexto)
            
            }
        
            function f_but_salir() {
               objUtiles.ejecutarFormulario ("main.do", "trabajo", document.miForm, "_self");
            }
                    
            function f_borrar_descuentos(codigo){
               objDom.setValorPorId("CCAMPANYA", codigo);
               var answer = confirm(objJsMessages.jslit_confirma_borrar);
               if (answer)
                  objUtiles.ejecutarFormulario("axis_axisdesc014.do", "borrarDescuento", document.miForm, "_self", objJsMessages.jslit_borrando_registro);
            }    
            
            function f_borrar_desclin(SPRODUC,CPAIS,CDPTO,CCIUDAD,CAGRUPACION,CSUCURSAL,CINTERMEDIARIO){
            
               
               var answer = confirm(objJsMessages.jslit_confirma_borrar);
               if (answer)
                  objUtiles.ejecutarFormulario("axis_axisdesc014.do?SPRODUC="+SPRODUC+"&CPAIS="+CPAIS+
                                                           "&CDPTO="+CDPTO+"&CCIUDAD="+CCIUDAD+"&CAGRUPACION="+CAGRUPACION+"&CSUCURSAL="+CSUCURSAL+
                                                           "&CINTERMEDIARIO="+CINTERMEDIARIO, "borrarDescuentoLin", document.miForm, "_self", objJsMessages.jslit_borrando_registro);
            }  
            
           
            
        </script>
    </head>
    <body onload="f_onload()">
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
    <form name="miForm" action="" method="POST">
        <input type="hidden" name="operation"/>
        <input type="hidden" name="radioFondos" value=""/>                
        
        <c:import url="../include/titulo_nt.jsp">
                <c:param name="modalidad"><axis:alt f="axispro047_mod" c="modalidad" lit="9905599"/></c:param>
                <c:param name="formulario"><axis:alt f="axispro047_frm" c="formul" lit="9905599"/></c:param>
                <c:param name="form">axisdesc014</c:param>
        </c:import>       
      
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">
                axisdesc015|<axis:alt f="axisdesc14_15" c="tit15" lit="9905598"/>
            </c:param>
        </c:import>
        
           <c:import url="../include/modal_estandar.jsp">
                <c:param name="nid_y_titulo">
                    axisdesc016|<axis:alt f="axisdesc14_16" c="tit16" lit="9905600"/>
                </c:param>
            </c:import> 
           <c:import url="../include/modal_estandar.jsp">
                <c:param name="nid_y_titulo">
                    axisdesc017|<axis:alt f="axisdesc14_17" c="tit17" lit="9905600"/>
                </c:param>
            </c:import>             
        <input type="hidden" name="NCONTADOR" id = "NCONTADOR" value="${__formdata.NCONTADOR}" />  
        <input type="hidden" id="CCAMPANYA" name="CCAMPANYA" value="${__formdata.CCAMPANYA}"/> 
        <input type="hidden" id="TCAMPANYA" name="TCAMPANYA" value="${__formdata.TCAMPANYA}"/> 
        <input type="hidden" id="FINICIO" name="FINICIO" value="${__formdata.FINICIO}"/>  
        <input type="hidden" id="FFIN" name="FFIN" value="${__formdata.FFIN}"/>
        <input type="hidden" id="CIDIOMA" name="CIDIOMA" value="${__formdata.CIDIOMA}"/>     
        <input type="hidden" name="ORIGEN" id="ORIGEN" value="${__formdata.ORIGEN}" />
        <input type="hidden" name="CIDIOMA_USU" id="CIDIOMA_USU" value="${__formdata.CIDIOMA_USU}">
        <input type="hidden" name="d-1525688-p" id="d-1525688-p" value="<%=pagina%>">
        <!-- Area de campos  -->
        <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">       
                    <tr>
                        <td> 
                          <table class="seccion">  
                           <tr>
                            <td>
                             <div class="separador">&nbsp;</div>
                             <div class="separador">&nbsp;</div>  
                          
                             <div class="titulo">
                                 <img src="images/flecha.gif"/><axis:alt f="BCamp" c="BCamp" lit="9905583"/> <img border="0" src="images/find.gif" onclick="f_but_buscar_desc()" style="cursor:pointer" alt="<axis:alt f="BGarA1" c="BGarA1" lit="9000508"/>" title="<axis:alt f="BGarT1" c="BGarT1" lit="9000508"/>"/>
                             </div>
                             <!-- Lista de Garantías -->                           
                              <table class="area" align="center">     
                                <tr>
                                    <td>
                                        <c:set var="title0">&nbsp;</c:set>
                                        <c:set var="title1"><axis:alt f="axisdesc014" c="CGar" lit="103465"/></c:set>
                                        <c:set var="title2"> <axis:alt f="axisdesc014" c="CDGS" lit="9900734"/></c:set>
                                        <c:set var="title3"> <axis:alt f="axisdesc014" c="FINICIO" lit="9000526"/></c:set>
                                        <c:set var="title4"> <axis:alt f="axisdesc014" c="FFIN" lit="9000527"/></c:set>
                                          <!--Imatge nou registre-->
                                         <div style="float:right;">
                                            <a href="javascript:f_abrir_axisdesc017('','NUEVO')"><img border="0" alt="<axis:alt f="NGar" c="NGar" lit="104825"/>" title="<axis:alt f="NGarA" c="NGarA" lit="104825"/>" src="images/new.gif"/></a>
                                        </div>                                    
                                        <!--Fi imatge nou registre--> 
                                        <% int contador = 0;%>                                     
                                        <div class="seccion  displayspaceGrande" >
                                            <display:table name="${sessionScope.AXIS_DESCUENTOS}"
                                                           id="miListaDescuentos"
                                                           export="false"
                                                           class="dsptgtable"
                                                           pagesize="10"
                                                           requestURI="axis_axisdesc014.do?paginar=true"
                                                           sort="list"
                                                           cellpadding="0"
                                                           cellspacing="0">
                                                <%@ include file="../include/displaytag.jsp"%>
                                                <c:set var="contador"><%=contador%></c:set>                                            
                                              <display:column headerClass="sortable"
                                                                title=""
                                                                media="html"
                                                                autolink="false" style="width:3%">
                                                    <% 
                                                    //Inici Bug 0028012 - 10/10/2013 - RCL - Validación Campos Campañas/Dtos especiales
                                                    String sMinValue = (String) request.getParameter(new org.displaytag.util.ParamEncoder("miListaDescuentos").encodeParameterName(org.displaytag.tags.TableTagParameters.PARAMETER_PAGE));
                                                    Integer minValue = 0;
                                                    Integer maxValue = 9;
                                                    if (sMinValue != null)
                                                    {
                                                        minValue = Integer.parseInt(sMinValue);
                                                        minValue = (minValue - 1) * 10;
                                                        maxValue = (minValue - 1) + 10;
                                                    }
                                                    %>
                                                    <c:set var="minValue"><%=minValue%></c:set>
                                                    <c:set var="maxValue"><%=maxValue%></c:set>
                                                    <div class="dspIcons">
                                                        <input type="radio" id="radioDescuentos_${miListaDescuentos.OB_IAX_DTOSESPECIALES.CCAMPANYA}" 
                                                               name="radioDescuentos" value="${miListaDescuentos.OB_IAX_DTOSESPECIALES.CCAMPANYA}"
                                                               onclick="f_seleccionar_descuento('${miListaDescuentos.OB_IAX_DTOSESPECIALES.CCAMPANYA}','${contador}');"
                                                               <c:if test="${__formdata.CCAMPANYA == miListaDescuentos.OB_IAX_DTOSESPECIALES.CCAMPANYA}"> checked="checked" </c:if>
                                                               <c:if test="${__formdata.CCAMPANYA != miListaDescuentos.OB_IAX_DTOSESPECIALES.CCAMPANYA}">
                                                                    <c:if test="${__formdata.NCONTADOR < minValue || __formdata.NCONTADOR > maxValue}">
                                                                        <c:if test="${minValue == contador}">
                                                                            checked="checked" 
                                                                        </c:if>
                                                                    </c:if>
                                                               </c:if>
                                                        />
                                                        <c:if test="${__formdata.NCONTADOR < minValue || __formdata.NCONTADOR > maxValue}">
                                                            <c:if test="${minValue == contador}">
                                                                <script language="Javascript">
                                                                    f_seleccionar_descuento('${miListaDescuentos.OB_IAX_DTOSESPECIALES.CCAMPANYA}','${contador}');
                                                                </script>
                                                            </c:if>
                                                        </c:if>
                                                    </div>
                                                </display:column>                                            
                                                <display:column title="${title1}"
                                                                sortable="true"
                                                                sortProperty="CCAMPANYA"
                                                                headerClass="sortable"
                                                                media="html"
                                                                autolink="false"  style="width:5%">
                                                   <div class="dspText">
                                                           ${miListaDescuentos.OB_IAX_DTOSESPECIALES.CCAMPANYA}
                                                    </div>                                                            
                                                </display:column>
                                                <display:column title="${title2}"
                                                                sortable="true"
                                                                sortProperty="TCAMPANYA"
                                                                headerClass="sortable"
                                                                media="html"
                                                                autolink="false"   style="width:30%">
                                                   <div class="dspText">
                                                            ${miListaDescuentos.OB_IAX_DTOSESPECIALES.TCAMPANYA}
                                                    </div>                                               
                                                </display:column> 
                                                <display:column title="${title3}"
                                                                sortable="true"
                                                                sortProperty="FINICIO"
                                                                headerClass="sortable"
                                                                media="html"
                                                                autolink="false"   style="width:5%">
                                                   <div class="dspText">
                                                   <fmt:formatDate pattern="dd/MM/yyyy" value="${miListaDescuentos.OB_IAX_DTOSESPECIALES.FINICIO}"/>
                                                    </div>                                               
                                                </display:column> 
                                                <display:column title="${title4}"
                                                                sortable="true"
                                                                sortProperty="FFIN"
                                                                headerClass="sortable"
                                                                media="html"
                                                                autolink="false"   style="width:5%">
                                                   <div class="dspText">
                                                            <fmt:formatDate pattern="dd/MM/yyyy" value="${miListaDescuentos.OB_IAX_DTOSESPECIALES.FFIN}"/>
                                                    </div>                                               
                                                </display:column> 
                                                <display:column title="" sortable="false" sortProperty=""  style="width:5%" headerClass="headwidth5 sortable" media="html" autolink="false" >
                                                   <div class="dspIcons"><a href="javascript:f_abrir_axisdesc017('${miListaDescuentos.OB_IAX_DTOSESPECIALES.CCAMPANYA}','MODIF');"><img border="0" alt="<axis:alt f="BGarB1" c="BGarB1" lit="9000552"/>" title="<axis:alt f="BGarB1" c="BGarB1" lit="9000552"/>" src="images/lapiz.gif"/></a></div>
                                                </display:column>
                                                <display:column title="" sortable="false" sortProperty=""  style="width:5%" headerClass="headwidth5 sortable" media="html" autolink="false" >
                                                   <div class="dspIcons"><a href="javascript:f_borrar_descuentos('${miListaDescuentos.OB_IAX_DTOSESPECIALES.CCAMPANYA}');"><img border="0" alt="<axis:alt f="BGarB1" c="BGarB1" lit="1000127"/>" title="<axis:alt f="BGarB1" c="BGarB1" lit="1000127"/>" src="images/delete.gif"/></a></div>
                                                </display:column>
                                            <%contador++;%>                                         
                                            </display:table>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>     
                    <tr>
                        <td>
                         <div class="separador">&nbsp;</div>
                          <div class="separador">&nbsp;</div>                    
                            
                             </td> 
                            </tr>  
                            <div class="separador">&nbsp;</div>                   
                        <!--Tercera part Planes Pensiones -->                    
                            <tr>
                              <td>
                            <!-- Lista de Fons -->
                              <div class="separador">&nbsp;</div>
                              <div class="separador">&nbsp;</div>   
                              <table class="area" align="center" id="tablaPla">                       
                                <tr>
                                  <th style="width:100%;height:0px"></th>                                                     
                                </tr>
                                <tr>
                                  <td>
                                      <div class="titulo">
                                        <img src="images/flecha.gif"/><axis:alt f="CampTT" c="CampTT" lit="9905601"/><!-- tit -->
                                      </div>                                
                                        <c:set var="title0">&nbsp;</c:set>
                                        <c:set var="title1"><axis:alt f="axisdesc014" c="COD" lit="9902610"/></c:set>
                                        <c:set var="title2"><axis:alt f="axisdesc014" c="DES" lit="9903660"/></c:set>
                                        <c:set var="title3"><axis:alt f="axisdesc014" c="IDI" lit="180009"/></c:set> 
                                        <c:set var="title4"><axis:alt f="axisdesc014" c="COD" lit="100829"/></c:set>
                                        <c:set var="title5"><axis:alt f="axisdesc014" c="DES" lit="9902363"/></c:set>
                                        <c:set var="title6"><axis:alt f="axisdesc014" c="IDI" lit="1000119"/></c:set> 
                                        
                                        <!--Imatge nou registre-->
                                        <div style="float:right;">
                                           <a href="javascript:f_abrir_axisdesc016();"><img border="0" alt="<axis:alt f="MDGAR" c="MDGAR" lit="104825"/>" title="<axis:alt f="MDGAR" c="MDGAR" lit="104825"/>" src="images/new.gif"/></a>
                                        </div>                                    
                                        <!--Fi imatge nou registre--> 
                                        <div class="seccion  displayspaceGrande">  
                                            <display:table name="${listaDetDescuentos}"
                                                           id="miListaId"
                                                           export="false"
                                                           class="dsptgtable"
                                                           pagesize="10"
                                                           requestURI="axis_axisdesc014.do?paginar=true"
                                                           sort="list"
                                                           cellpadding="0"
                                                           cellspacing="0">
                                                <%@ include file="../include/displaytag.jsp"%>
                                                <display:column title="${title1}"
                                                                sortable="true"
                                                                sortProperty="CCAMPANYA"
                                                                headerClass="sortable fixed"
                                                                media="html"
                                                                autolink="false" style="width:10%">
                                                               
                                                   <div class="dspText">
                                                            ${miListaId.OB_IAX_DTOSESPECIALES_DET['TDPTO']}
                                                    </div>   
                                                </display:column>
                                                <display:column title="${title2}"
                                                                sortable="true"
                                                                sortProperty="TCAMPANYA"
                                                                headerClass="sortable fixed"
                                                                media="html"
                                                                autolink="false"
                                                                style="width:20%">
                                                   <div class="dspText">
                                                            ${miListaId.OB_IAX_DTOSESPECIALES_DET['TCIUDAD']}
                                                    </div>                                               
                                                </display:column>
                                                <display:column title="${title3}"
                                                                sortable="true"
                                                                sortProperty="CIDIOMA"
                                                                headerClass="sortable fixed"
                                                                media="html"
                                                                autolink="false"  style="width:10%">
                                                   <div class="dspText">
                                                       ${miListaId.OB_IAX_DTOSESPECIALES_DET['CAGRUPACION']}
                                                   </div>                                                                  
                                                </display:column> 
                                                <display:column title="${title4}"
                                                                sortable="true"
                                                                sortProperty="CIDIOMA"
                                                                headerClass="sortable fixed"
                                                                media="html"
                                                                autolink="false"  style="width:20%">
                                                   <div class="dspText">
                                                       ${miListaId.OB_IAX_DTOSESPECIALES_DET['TPRODUC']}
                                                   </div>                                                                  
                                                </display:column>
                                                <display:column title="${title5}"
                                                                sortable="true"
                                                                sortProperty="CIDIOMA"
                                                                headerClass="sortable fixed"
                                                                media="html"
                                                                autolink="false"  style="width:25%">
                                                   <div class="dspText">
                                                       ${miListaId.OB_IAX_DTOSESPECIALES_DET['TINTERMEDIARIO']}
                                                   </div>                                                                  
                                                </display:column>
                                                <display:column title="% ${title6}"
                                                                sortable="true"
                                                                sortProperty="CIDIOMA"
                                                                headerClass="sortable fixed"
                                                                media="html"
                                                                autolink="false"  style="width:5%">
                                                   <div class="dspText">
                                                       ${miListaId.OB_IAX_DTOSESPECIALES_DET['PDTO']}
                                                   </div>                                                                  
                                                </display:column>
                                                <display:column title="" sortable="false" sortProperty=""  style="width:5%" headerClass="headwidth5 sortable fixed" media="html" autolink="false" >
                                                   
                                                   
                                                   <div class="dspIcons"><a href="javascript:f_modif_desclin('${miListaId.OB_IAX_DTOSESPECIALES_DET['SPRODUC']}',
                                                                                                                '${miListaId.OB_IAX_DTOSESPECIALES_DET['CPAIS']}','${miListaId.OB_IAX_DTOSESPECIALES_DET['TPAIS']}',
                                                                                                                '${miListaId.OB_IAX_DTOSESPECIALES_DET['CDPTO']}','${miListaId.OB_IAX_DTOSESPECIALES_DET['TDPTO']}',
                                                                                                                '${miListaId.OB_IAX_DTOSESPECIALES_DET['CCIUDAD']}','${miListaId.OB_IAX_DTOSESPECIALES_DET['TCIUDAD']}',
                                                                                                                 '${miListaId.OB_IAX_DTOSESPECIALES_DET['CAGRUPACION']}',
                                                                                                                 '${miListaId.OB_IAX_DTOSESPECIALES_DET['CSUCURSAL']}','${miListaId.OB_IAX_DTOSESPECIALES_DET['TSUCURSAL']}',
                                                                                                                 '${miListaId.OB_IAX_DTOSESPECIALES_DET['CINTERMEDIARIO']}','${miListaId.OB_IAX_DTOSESPECIALES_DET['TINTERMEDIARIO']}',
                                                                                                                 '${miListaId.OB_IAX_DTOSESPECIALES_DET['PDTO']}')">
                                                        
                                                        <img border="0" alt="<axis:alt f="BDGAR" c="BDGAR" lit="9000552"/>" title="<axis:alt f="BDGAR" c="BDGAR" lit="9000552"/>" src="images/lapiz.gif"/></a></div>
                                                   
                                                </display:column>    
                                                <display:column title="" sortable="false" sortProperty=""  style="width:5%" headerClass="headwidth5 sortable fixed" media="html" autolink="false" >
                                                   <div class="dspIcons"><a href="javascript:f_borrar_desclin('${miListaId.OB_IAX_DTOSESPECIALES_DET['SPRODUC']}','${miListaId.OB_IAX_DTOSESPECIALES_DET['CPAIS']}',
                                                                                                                '${miListaId.OB_IAX_DTOSESPECIALES_DET['CDPTO']}', '${miListaId.OB_IAX_DTOSESPECIALES_DET['CCIUDAD']}',
                                                                                                                 '${miListaId.OB_IAX_DTOSESPECIALES_DET['CAGRUPACION']}','${miListaId.OB_IAX_DTOSESPECIALES_DET['CSUCURSAL']}',
                                                                                                                 '${miListaId.OB_IAX_DTOSESPECIALES_DET['CINTERMEDIARIO']}')">
                                                       <img border="0" alt="<axis:alt f="BDGAR" c="BDGAR" lit="1000127"/>" title="<axis:alt f="BDGAR" c="BDGAR" lit="1000127"/>" src="images/delete.gif"/></a></div>
                                                   
                                                </display:column> 
                                                </display:table>                                         
                                                
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>                     
                        
                </table>
         </td>
        </tr>
    </table>
    <c:import url="../include/botonera_nt.jsp"><c:param name="f">axispro047</c:param>
      <c:param name="__botones">salir</c:param>
    </c:import>
</form><c:import url="../include/mensajes.jsp" />
</body>
</html>

