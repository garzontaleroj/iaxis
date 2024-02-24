
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>    

<%@ page contentType="text/html;charset=iso-8859-15" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">

<html>
    <head>
    
        <title><axis:alt c="titulo" f="axisadm053" lit="formulario.axisnombrepantalla"/></title>
        <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>          
        <c:import url="../include/carga_framework_js.jsp" />
        <script type="text/javascript">        
            
            /****************************************************************************************/
            /*********************************** NAVEGACION *****************************************/
            /****************************************************************************************/
            
            function f_onload() {
                 f_cargar_propiedades_pantalla(); 
                
            }
            
             function f_but_1000439() {     
             
             
                objUtiles.ejecutarFormulario ("modal_axisadm053.do", "consultar", document.miForm, "_self", objJsMessages.jslit_cargando);
          } 
          
          
          function f_but_108525()
          {
            //var FCONTAB = objDom.getValorPorId("FCONTAB_aux");
            //var CEMPRES = objDom.getValorPorId("CEMPRES");            
            //alert(FCONTAB);            
            //?FCONTAB="+FCONTAB+"&CEMPRES="+CEMPRES          
            <c:if test="${!empty sessionScope.LISTA_CONT}">
            objUtiles.ejecutarFormulario("modal_axisadm053.do", "montarfichero_detalle", document.miForm, "_self", objJsMessages.jslit_cargando);
            //alert("bien");
            </c:if>
            <c:if test="${empty sessionScope.LISTA_CONT}">
            alert("<axis:alt c='alert1' f='axisadm053' lit="9901229"/>");
            </c:if>
          }
          
            function f_imprimir_fitxer(pfitxer){
                objUtiles.abrirModal("axisimprimir", "src", "modal_axisimprimir.do?mantenerExtension=mantenerExtension&mimetype="+escape("text/xml")+"&operation=tunnel&file="+pfitxer,600,200);
            }  

                       
            /* ************************************************************************************** */
            /* ****************************** CALLBACKS AJAX **************************************** */
            /* ************************************************************************************** */    

            function callbackAjaxGenerarResultado_map (ajaxResponseText) {
                                     
                 objDom.setValorPorId("SORTIDA", "");   
                 objDom.setValorPorId("CXML", "");  
                var doc = objAjax.domParse(ajaxResponseText);
                
                
                
                if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
                    var fichero = objUtiles.hayValorElementoXml(doc.getElementsByTagName("RETURN")[0]) ? 
                            objDom.getValorNodoDelComponente(doc.getElementsByTagName("RETURN"), 0, 0) : "";               
                    var resultado = objUtiles.hayValorElementoXml(doc.getElementsByTagName("VALOR")[0]) ? 
                            objDom.getValorNodoDelComponente(doc.getElementsByTagName("VALOR"), 0, 0) : "-1";
                    
                 
                    if(objUtiles.utilEquals(fichero, "-0.csv")){
                        alert("<axis:alt c='alert2' f='axisadm053' lit='9000620' />");
                        document.miForm.CFICHERO.focus();
                    }else{
                        //Lo imprimo por axisimprimir
                              //objDom.setValorPorId("SORTIDA", fichero); 
                              objUtiles.abrirModal("axisimprimir", "src", "modal_axisimprimir.do?operation=tunnel&file="+fichero);
                         }
                   }                
            }        

/* ***************** */          

            function f_but_cancelar() {
                //objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axisadm053", "cancelar", document.miForm, "_self");
                parent.f_cerrar_axisadm053();
            }
              
            // TODO Implementar CallBack Ajax

            /*******************************************************************************************/
            /************************************** AJAX ***********************************************/
            /*******************************************************************************************/
            
            /****************************************************************************************/
            /*********************************** CALLBACK AJAX **************************************/
            /****************************************************************************************/
        
            
        </script>
    </head>
    <body  onload="f_onload()">
        <c:import url="../include/precargador_ajax.jsp"><c:param name="imagen" value="images/ajax-loader.gif"></c:param></c:import>
        <form name="miForm" action="" method="POST">
            <input type="hidden" name="operation" value=""/> 
            <input type="hidden" name="tipo_listado" value="${__formdata.tipo_listado}"/> 
            <input type="hidden" name="CCUENTA_i" value="${__formdata.CCUENTA}"/> 
            <input type="hidden" name="NLINEA" value="${__formdata.NLINEA}"/>        
            <input type="hidden" name="NASIENT" value="${__formdata.NASIENT}"/>   
            <input type="hidden" name="CPROCES" value="${__formdata.CPROCES}"/>   
            <input type="hidden" id="FEFEADM" name="FEFEADM" value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FEFEADM}"/>"/>
            <input type="hidden" name="CPAIS" value="${__formdata.CPAIS}"/>                                       
            <input type="hidden" name="CEMPRES" value="${__formdata.CEMPRES}"/>     
            <input type="hidden" id="FCONTAB" name="FCONTAB" value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FCONTAB}"/>"/>
            <input type="hidden" id="FCONTABINI" name="FCONTABINI" value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FCONTABINI}"/>"/>
            <input type="hidden" id="FCONTABFIN" name="FCONTABFIN" value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FCONTABFIN}"/>"/>
            
            
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="titulo"><axis:alt c="titulo1" f="axisadm053" lit="9901435" /></c:param>
                <c:param name="formulario"><axis:alt c="form" f="axisadm053" lit="9901435" /></c:param>
                <c:param name="form">axisadm053</c:param>
            </c:import>
        
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="nid_y_titulo">axisimprimir|<axis:alt c="titulo_axisimp" f="axisadm053" lit="1000205" />|true</c:param>
            </c:import>              
            <!-- Área de campos  -->
            <table class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <div class="separador">&nbsp;</div>
                        <div class="titulo">
                        <img src="images/flecha.gif"/><axis:alt c="flecha" f="axisadm053" lit="103593"/>
                         </div>
                        <!-- Sección 1 -->                        
                        <table class="seccion">
                            <tr>
                                <td >
                                    <!-- Área 1 -->
                                    <table class="area" align="center">
                                     <tr>
                                            <tr>
                                            <th style="width:30%;height:0px"></th>
                                            
                                            </tr>
                                     <tr>
                                        <td class="titulocaja" ><b><axis:alt c="LIT_CUENTAS" f="axisadm053" lit="1000092"/></b></td><!--Cuenta -->
                                       
                                     </tr>
                                     
                                     <tr>
                                      <td class="campocaja">
                                            <axis:ocultar f="axisadm053" c="CCUENTA"> 
                                                <input type="text"  class="campowidth campo campotexto" id="CCUENTA" name="CCUENTA" size="15"
                                                value="${__formdata.CCUENTA}" <axis:atr f="axisadm007" c="CCUENTA" a="modificable=false"/> />  
                                            </axis:ocultar>
                                            </td>
                                     </tr>
                             
                                     
                                    </tr>    
                                    <!-- Inicio Lista -->
                                    <table class="area" align="center">
                                    <tr>
                                        <td>
                                        <%-- DisplayTag contabilidades --%>
                                            <c:set var="title0"><axis:alt c="SPRODUC" f="axisadm053" lit="100829"/></c:set> <%-- Producto --%> 
                                            <c:set var="title1"><axis:alt c="POLIZA" f="axisadm053" lit="100836"/></c:set>  <%-- Póliza --%>
                                            <c:set var="title2"><axis:alt c="RECIBO" f="axisadm053" lit="100895"/></c:set> <%-- Recibo --%>                                                                                      
                                            <c:set var="title3"><axis:alt c="FEC_EFECTOREC" f="axisadm053" lit="100883"/></c:set> <%-- Fecha Efecto --%>                                                                                      
                                            <c:set var="title4"><axis:alt c="FEC_ESTADOREC" f="axisadm053" lit="9000450"/></c:set> <%-- Fecha Estado --%>                                                                                      
                                            <c:set var="title5"><axis:alt c="IMPORTE" f="axisadm053" lit="100563"/></c:set> <%-- Importe --%>                                                                                      
                                            
                                           
                                            <div class="displayspaceGrande">
                                                <display:table name="${sessionScope.LISTA_CONT}" id="LISTA_CONT" export="false" class="dsptgtable" pagesize="-1" cellpadding="0" cellspacing="0"
                                                     requestURI="modal_axisadm053.do?paginar=true">
                                                    <%@ include file="../include/displaytag.jsp"%>
                                                    <axis:visible f="axisadm053" c="SPRODUC"> 
                                                        <display:column title="${title0}" sortable="true" sortProperty="SPRODUC" headerClass="sortable fixed"  media="html" autolink="false">
                                                            <div class="dspText">
                                                                ${LISTA_CONT.SPRODUC}
                                                            </div>
                                                        </display:column>
                                                    </axis:visible>
                                                    <axis:visible f="axisadm053" c="POLIZA"> 
                                                        <display:column title="${title1}"  sortable="true" sortProperty="POLIZA" headerClass="sortable fixed"  media="html" autolink="false" >
                                                            <div class="dspText">
                                                                ${LISTA_CONT.POLIZA}
                                                            </div>
                                                        </display:column>   
                                                    </axis:visible>
                                                    <axis:visible f="axisadm053" c="RECIBO"> 
                                                        <display:column title="${title2}"  sortable="true" sortProperty="RECIBO" headerClass="sortable fixed"  media="html" autolink="false">
                                                            <div class="dspText">
                                                                ${LISTA_CONT.RECIBO}
                                                            </div>
                                                        </display:column>      
                                                     </axis:visible>
                                                     <axis:visible f="axisadm053" c="FEC_EFECTOREC"> 
                                                         <display:column title="${title3}" sortable="true" sortProperty="FEC_EFECTOREC" headerClass="sortable fixed" media="html" autolink="false" >
                                                                   <div class="dspText"><fmt:formatDate value="${LISTA_CONT.FEC_EFECTOREC}" pattern="dd/MM/yy" />
                                                                    </div>             
                                                         </display:column>      
                                                      </axis:visible>
                                                      <axis:visible f="axisadm053" c="FEC_ESTADOREC"> 
                                                          <display:column title="${title4}" sortable="true" sortProperty="FEC_ESTADOREC" headerClass="sortable fixed" media="html" autolink="false"  >
                                                                   <div class="dspText"><fmt:formatDate value="${LISTA_CONT.FEC_ESTADOREC}" pattern="dd/MM/yy" />
                                                                    </div>             
                                                         </display:column>  
                                                     </axis:visible>
                                                     <axis:visible f="axisadm053" c="IMPORTE"> 
                                                         <display:column title="${title5}" sortable="true" sortProperty="IMPORTE" headerClass="sortable fixed" media="html" autolink="false"  >
                                                                   <div class="dspText"><fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${LISTA_CONT.IMPORTE}"/>
                                                                    </div>             
                                                         </display:column> 
                                                     </axis:visible>                                                    
                                                </display:table>                                                 
                                            </div>
                                        </td>
                                    </tr>        
                                    
                                 <!-- Seccion 4 Informes-->
                                <div class="separador">&nbsp;</div>
                                <table class="area" align="center">  
                                         <tr>
                                                <th style="width:50%;height:0px"></th>        
                                                <th style="width:50%;height:0px"></th>
                                         </tr>       
                                         <c:if test="${!empty __formdata.LINK_INFORME}">
                                            <tr>
                                                <axis:ocultar f="axisadm053" c="LINKS" dejarHueco="false">
                                                    <td class="titulocaja">
                                                        <b id="label_LINKS"><axis:alt c="label_LINKS" f="axisadm053" lit="107913"/></b> <%-- Links fitxers generats --%>
                                                    </td>
                                                </axis:ocultar>
                                            </tr>
                                        </c:if>                                       
                                        <c:if test="${!empty __formdata.LINK_INFORME}">                                   
                                            <tr>
                                                <axis:ocultar f="axisadm053" c="LINK_INFORME" dejarHueco="false">
                                                    <td class="campocaja" id="fichero">
                                                          <input type="text" readonly 
                                                       style="text-decoration:underline;background-color:transparent;border:0;cursor:pointer" 
                                                       onclick="javascript:f_imprimir_fitxer(this.value)" class="campowidthinput campo campotexto_ob" size="15"  name="LINK_INFORME" id="LINK_INFORME"
                                                       title="<axis:alt c="LABE_LINKS" f="axisadm053" lit="107913"/>" value="${__formdata.LINK_INFORME}"/>                                                                                                        
                                                    </td>                                          
                                                </axis:ocultar>
                                                <td>                                            
                                            </tr>
                                           </c:if>                                       
                                    </table>    
                                    
                                </table>         
                                
                                 
                                              
                        </table>
                        <div class="separador">&nbsp;</div>
                        
             <div class="separador">&nbsp;</div>
            <c:import url="../include/botonera_nt.jsp">
            <c:param name="f">axisadm053</c:param>        
            <c:param name="__botones">cancelar,108525</c:param></c:import>
            <%--c:import url="../include/botonera_nt.jsp"><c:param name="__botones">cancelar,1000439,108525</c:param></c:import --%>
        </form>
        
        <c:import url="../include/mensajes.jsp" />
        
    </body>
</html>