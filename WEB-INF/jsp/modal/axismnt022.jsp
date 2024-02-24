<%/**
*  Fichero: axismnt022.jsp (modal)
*/
%>
<%@ page contentType="text/html;charset=windows-1252"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>    

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
    <head>
        <title><axis:alt f="axismnt022" c="TITULO" lit="9001844"/></title> <!--Gestió Transferències-->
        <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>          


        <c:import url="../include/carga_framework_js.jsp" />
    
        <!--********** CALENDARIO ************************* -->
        <!-- Hoja de estilo del Calendario -->
        <link rel="stylesheet" type="text/css" media="all" href="styles/calendar-green.css" title="green" />
        <!-- Script principal del calendario -->
        <script type="text/javascript" src="scripts/calendar.js"></script>
        <!-- Idioma del calendario, en función del Locale -->
        <script type="text/javascript" src="scripts/calendar-${sessionScope.__locale}.js"></script>
        <!-- Setup del calendario -->
        <script type="text/javascript" src="scripts/calendar-setup.js"></script>
        <!--*********************************** -->  

     <script type="text/javascript">        
        
        function f_onload() {
            f_cargar_propiedades_pantalla();
              
        }
              
            function f_but_salir() {
                parent.f_cerrar_axismnt022();
            } 
            
            function f_cerrar_axismnt023(button){
                objUtiles.cerrarModal("axismnt023");
                
                if(button == 'f_but_guardar'){
                    f_recarga();
                }
            }
            
            function f_recarga(){
                 objUtiles.ejecutarFormulario("modal_axismnt022.do", "form", document.miForm, "_self");
            }
            
         function f_modify_cenviosap(CCOMPANI,CTIPIND,FINIVIG,thiss){
            
             thiss.value =  (thiss.checked)?1:0;
             var CENVIOSAP = thiss.value;
              
             objAjax.invokeAsyncCGI("modal_axismnt022.do", callbackModif, "operation=edit&CCOMPANI="+CCOMPANI+"&CTIPIND="+CTIPIND+"&FINIVIG="+FINIVIG+"&CENVIOSAP="+CENVIOSAP, this, objJsMessages.jslit_cargando);
         }
         
         function f_delete(CCOMPANI,CTIPIND,FINIVIG) {
            // Borrar parámetros de session en servidor
            objAjax.invokeAsyncCGI("modal_axismnt022.do", callbackModif, "operation=delete&CCOMPANI="+CCOMPANI+"&CTIPIND="+CTIPIND+"&FINIVIG="+FINIVIG, this, objJsMessages.jslit_cargando);
        }
         
        function callbackModif(){
            f_recarga();
        }
         
      
       
         
          function f_abrir_axismnt023(CCOMPANI){
                var params = "";
                
                if(!objUtiles.estaVacio(CCOMPANI)){
                    params = "&CCOMPANI=" + CCOMPANI;
                }
                objUtiles.abrirModal("axismnt023","src","modal_axismnt023.do?operation=form"+params); 
                
            }
        </script>
    </head>
    
    <body onload="f_onload()">
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
        <form name="miForm" action="" method="POST">
        <input type="hidden" name="operation" value=""/>
             
        <input type="hidden" name="CCOMPANI" id="CCOMPANI" value="${__formdata.CCOMPANI}" />
        
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="titulo"><axis:alt c="LIT_MODAL_AXISMNT022" f="axismnt022" lit="9000570"/> <axis:alt c="LIT_MODAL_AXISMNT022" f="axismnt022" lit="9906474"/></c:param>
                <c:param name="form">axismnt022</c:param>
            </c:import>
            
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="nid_y_titulo">axismnt023|<axis:alt c="LIT_MODAL_AXISMNT023" f="axismnt023" lit="9906474"/></c:param>
            </c:import>
           
        <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td>
                  <table class="seccion">
                      <tr>
                        <td>
                        
                        
                          <table class="area" align="center">
                                    <tr>
                                        <td class = "campocaja" colspan="9" >
                                            <axis:visible f="axismnt022" c="ALTA_INDIC">
                                                <div class="separador">&nbsp;</div>  
                                                
                                                  <div class="titulo">
                                                  <div style="float:left;">
						  <%--  TCS_1569B - ACL - 31/01/2019 - No se utilizará el botón nuevo--%>  
                                                   <%--    <img src="images/flecha.gif"/> --%>
                                                  <axis:alt f="axismnt022" c="ALTA" lit="9906474"/>
                                                  </div>
                                               <%--   <div style="float:right;">  --%>
                                                     <%--    <a href="javascript:f_abrir_axismnt023('${__formdata.CCOMPANI}')">  <img border="0" title="<axis:alt c="form_lit" f="axismnt022" lit="1000428"/>" src="images/new.gif"/></a>  --%>
                                                 <%--  </div>  --%>
                                                </div>
                                            </axis:visible>
                                        </td>
                                     </tr>

                                         <tr>
                                            <td class = "campocaja" colspan="9">
                                            
                                            <c:set var="title0"><axis:alt f="axismnt022" c="TINDICADOR" lit="9906486"/></c:set>
                                            <c:set var="title1"><axis:alt f="axismnt022" c="FINIVIG" lit="9000572"/></c:set>
                                            <c:set var="title2"><axis:alt f="axismnt022" c="FFINVIG" lit="9905543"/></c:set>                                            
                                            <c:set var="title3"><axis:alt f="axismnt022" c="TAPLICA" lit="9906475"/></c:set>
                                            <c:set var="title4"><axis:alt f="axismnt022" c="CENVIOSAP" lit="9906476"/></c:set>
                                            <c:set var="title5"><axis:alt f="axismnt022" c="NVALOR" lit="101159"/></c:set>
                                            <%-- Total filas multirregistro --%>
                                            <% int x = 0; %>   
                                            <% int sumatorio = 1; %>  
                                            <div class="displayspaceMaximo">
                                               <display:table name="${listaIndicadoresCta}" id="LSTIND" export="false" style="width:98%;" class="dsptgtable" pagesize="-1"  sort="list" cellpadding="0" cellspacing="0"
                                                 requestURI="modal_axismnt022.do?paginar=true">
                                                 <c:set var="prueba"><%=x%></c:set>
                                                    <%@ include file="../include/displaytag.jsp"%>
                                                                                                   
                                                    <axis:visible c="TINDICADOR" f="axismnt022">
                                                        <display:column title="${title0}" sortable="true" style="width:12%;" sortProperty="TINDICADOR" headerClass="sortable fixed"  media="html" autolink="false" >
                                                             <div class="dspText">${LSTIND.OB_IAX_INDICADORES_CIAS.TINDICADOR}</div>
                                                        </display:column>
                                                    </axis:visible>             
                                                    
                                                     <axis:visible c="FINIVIG" f="axismnt022">
                                                        <display:column title="${title1}" sortable="true" style="width:4%;" sortProperty="FINIVIG" headerClass="sortable fixed"  media="html" autolink="false" >
                                                            <div class="dspText"><fmt:formatDate pattern="dd/MM/yyyy" value="${LSTIND.OB_IAX_INDICADORES_CIAS.FINIVIG}"/></div>    
                                                        </display:column>
                                                     </axis:visible> 

                                                    <axis:visible c="FFINVIG" f="axismnt022">
                                                        <display:column title="${title2}" sortable="true" style="width:4%;" sortProperty="FFINVIG" headerClass="sortable fixed"  media="html" autolink="false" >
                                                            <div class="dspText"><fmt:formatDate pattern="dd/MM/yyyy" value="${LSTIND.OB_IAX_INDICADORES_CIAS.FFINVIG}"/></div>  
                                                        </display:column>
                                                     </axis:visible>   
                                                     
                                                                                                          
                                                     <axis:visible c="TAPLICA" f="axismnt022">
                                                         <display:column title="${title3}" sortable="true" style="width:4%;" sortProperty="CAPLICA" headerClass="sortable fixed"  media="html" autolink="false" >
                                                              <div class="dspText">${LSTIND.OB_IAX_INDICADORES_CIAS.TAPLICA}</div>
                                                         </display:column>
                                                     </axis:visible>
                                                     
                                                     <axis:visible c="CENVIOSAP" f="axismnt022">
                                                         <display:column title="${title4}" sortable="true" style="width:4%;" sortProperty="CENVIOSAP" headerClass="sortable fixed"  media="html" autolink="false" >
                                                              <div class="dspText">                                                              
                                                                  <input type="checkbox" id="CENVIOSAP" name="CENVIOSAP"  onclick="f_modify_cenviosap('${LSTIND.OB_IAX_INDICADORES_CIAS.CCOMPANI}','${LSTIND.OB_IAX_INDICADORES_CIAS.CTIPIND}','<fmt:formatDate pattern='dd/MM/yyyy' value='${LSTIND.OB_IAX_INDICADORES_CIAS.FINIVIG}'/>',this);"
                                                                    <c:if test="${LSTIND.OB_IAX_INDICADORES_CIAS.FFINVIG == null}">
                                                                        <axis:atr f="axismnt022" c="CENVIOSAP" a="isInputText=false&modificable=true" /> 
                                                                    </c:if>
                                                                    <c:if test="${LSTIND.OB_IAX_INDICADORES_CIAS.FFINVIG != null}">
                                                                        <axis:atr f="axismnt022" c="CENVIOSAP" a="isInputText=false&modificable=false" /> 
                                                                    </c:if>
                                                                    <c:if test="${LSTIND.OB_IAX_INDICADORES_CIAS.CENVIOSAP == 1}">checked</c:if>  value="${LSTIND.OB_IAX_INDICADORES_CIAS.CENVIOSAP}"/>  
                                                                </div>
                                                         </display:column>
                                                     </axis:visible>
                                                     
                                                      <axis:visible c="NVALOR" f="axismnt022">
                                                         <display:column title="${title5}" sortable="true" style="width:4%;" sortProperty="NVALOR" headerClass="sortable fixed"  media="html" autolink="false" >
                                                              <div class="dspText">${LSTIND.OB_IAX_INDICADORES_CIAS.NVALOR}</div>
                                                         </display:column>
                                                     </axis:visible>
                                                     
                                                     <%--  TCS_1569B - ACL - 31/01/2019 - No se utilizará el botón borrar--%>  
                                                    <%--     <axis:visible f="axismnt022" c="BT_SIN_DELETE"> 
                                                            <display:column title="" headerClass="sortable fixed" media="html" style="width:2%;" autolink="false" >
                                                                 <div class="dspIcons">
                                                                 <c:if test="${LSTIND.OB_IAX_INDICADORES_CIAS.FFINVIG == null}">
                                                                 <img border="0" title="<axis:alt f='axismnt022' c='LIT_BO_BO' lit='9001333'/>" alt="<axis:alt f="axismnt022" c="DEL" lit="1000127"/>" title1="<axis:alt f="axismnt022" c="DEL" lit="1000127"/>" src="images/delete.gif" width="15px" height="15px"
                                                                style="cursor:pointer;" onclick="javascript:f_delete('${LSTIND.OB_IAX_INDICADORES_CIAS.CCOMPANI}','${LSTIND.OB_IAX_INDICADORES_CIAS.CTIPIND}','<fmt:formatDate pattern='dd/MM/yyyy' value='${LSTIND.OB_IAX_INDICADORES_CIAS.FINIVIG}'/>');"/>
                                                                </c:if>
                                                                </div>
                                                            </display:column>
                                                        </axis:visible> --%> 
                                                    
                                                    <% x=x+sumatorio; %>
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
            <% System.out.println("*************************************************************************** 10"); %>
            <c:import url="../include/botonera_nt.jsp"><c:param name="f">axismnt022</c:param><c:param name="f">axismnt022</c:param>
            <c:param name="f">axismnt022</c:param>
            <c:param name="__botones">salir</c:param>
            </c:import>
                
       </form>
     <c:import url="../include/mensajes.jsp"/>
    
    </body>

</html>
