<%
/*
*  Fichero: axisadm095.jsp
*  @author <a href = "mailto:mnustes@csi-ti.com">Marlon Nustes</a> 
*  Fecha: 29/04/2015
*/
%>

<%@ page contentType="text/html;charset=windows-1252" errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
    <head>
      
        <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
        <link rel="stylesheet" href="styles/displaytag.css"/>
        
        <%-- Especial para controlar los scroll con iPad --%>
        <link type="text/css" href="../modal/styles/jquery.jscrollpane.css" rel="stylesheet" media="only screen and (min-device-width: 768px) and (max-device-width: 1024px)" />
        <style type="text/css" id="page-css"> </style>
        <%-- Especial para controlar los scroll con iPad --%>
        <c:import url="../include/carga_framework_js.jsp" />   
        
        <script language="Javascript" type="text/javascript">
        
        function f_onload() {  
            if (document.all) // ES Explorer
                document.getElementById("tabla1").style.marginLeft="1.3%";
            f_cargar_propiedades_pantalla();
            <c:if test="${empty __formdata.CPOLICY}">                 
                
                        f_abrir_axisctr019();                      
            </c:if>
        }
        
        function f_abrir_modal(cual, noXButton, optionalQueryString) {              
            if (objUtiles.estaVacio(optionalQueryString))                
                optionalQueryString = "";
            
            if (noXButton) 
                objDom.setVisibilidadPorId("but_cerrar_modal_" + cual, "hidden");    
    
            objUtiles.abrirModal(cual, "src", "modal_" + cual + ".do?operation=init" + optionalQueryString); 
        }
        
        function f_but_buscar() {
            if (objValidador.validaEntrada()) {
                objUtiles.ejecutarFormulario("axis_axisadm095.do","busqueda",document.miForm, "_self", objJsMessages.jslit_cargando);   
            }
        }
        
        function f_abrir_axisctr019 () {
            objUtiles.abrirModal("axisctr019", "src", "modal_axisctr019.do?operation=form");
        }
        
        function f_cerrar_axisctr019() {
            objUtiles.cerrarModal("axisctr019");
        } 
        
        function f_aceptar_axisctr019 (SSEGURO) {
            objUtiles.cerrarModal("axisctr019");
            document.miForm.SSEGURO.value = SSEGURO;
            objUtiles.ejecutarFormulario ("axis_axisadm095.do", "recargar", document.miForm, "_self", objJsMessages.jslit_cargando);    
        }
        
        function f_sel_pol_abre_modal(cempres, sperson, sseguro, nnumlin, sproduc, nreembo, npoliza){   
            objDom.setValorPorId ("HCEMPRES", cempres);
            objDom.setValorPorId ("HSPERSON", sperson);
            objDom.setValorPorId ("HSSEGURO", sseguro);
            objDom.setValorPorId ("HNNUMLIN", nnumlin);
            objDom.setValorPorId ("HSPRODUC", sproduc);
            objDom.setValorPorId ("HNREEMBO", nreembo);
            objDom.setValorPorId ("HNPOLIZA", npoliza);
            
            if (!objUtiles.estaVacio($("#HSSEGURO").val()))
            {
                var query= "CEMPRES="+$("#HCEMPRES").val()+
                           "&SPERSON="+$("#HSPERSON").val()+
                           "&SSEGURO="+$("#HSSEGURO").val()+
                           "&NNUMLIN="+$("#HNNUMLIN").val()+
                           "&SPRODUC="+$("#HSPRODUC").val()+
                           "&NREEMBO="+$("#HNREEMBO").val()+  
                           "&NPOLIZA="+$("#HNPOLIZA").val();
                objUtiles.abrirModal("axisadm095a", "src", "modal_axisadm095a.do?operation=form&" + query );                  
            }
        }
        
        function f_post_cierre_modalaxisadm095a(){
            objUtiles.cerrarModal("axisadm095a");
            f_but_buscar();
        }
        
        function f_cerrar_modal(pantalla){
            objUtiles.cerrarModal(pantalla);
        } 
        
        function f_but_cancelar() {
            objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axisadm095", "cancelar", document.miForm, "_self"); 
        } 
        </script>
        
        
    </head>
    <body onload="f_onload()" onkeypress="if (event.keyCode==13)  { f_but_buscar() }">

            <c:import url="../include/precargador_ajax.jsp">
                <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
            </c:import>
            
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="nid_y_titulo">axisctr019|<axis:alt c="axisctr019_TITULO" f="axisadm095" lit="1000188"/></c:param>
            </c:import>
            
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="nid_y_titulo">axisadm095a|<axis:alt c="axisadm095a_TITULO" f="axisadm095" lit="9908009"/></c:param>
            </c:import>
            
            <form name="miForm" action="" method="POST">
                
                <input type="hidden" name="operation" value=""/>
                <input type="hidden" name="SSEGURO" value="${__formdata.SSEGURO}"/>
                <input type="hidden" id="HCEMPRES" name="HCEMPRES" value=""/>
                <input type="hidden" id="HSPERSON" name="HSPERSON" value=""/>
                <input type="hidden" id="HSSEGURO" name="HSSEGURO" value=""/>
                <input type="hidden" id="HNNUMLIN" name="HNNUMLIN" value=""/>
                <input type="hidden" id="HSPRODUC" name="HSPRODUC" value=""/>
                <input type="hidden" id="HNREEMBO" name="HNREEMBO" value=""/>
                <input type="hidden" id="HNPOLIZA" name="HNPOLIZA" value=""/>
                <!-- Area de Titulo  -->
                <c:import url="../include/titulo_nt.jsp">
                    <c:param name="formulario"><axis:alt f="axisadm095" c="FORM" lit="9908009" /></c:param>
                    <c:param name="producto"><axis:alt f="axisadm095" c="FORM" lit="9908009" /></c:param>
                    <c:param name="form">axisadm095</c:param>
                </c:import>
                
                <table id="tabla1" class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
                    <tr>
                    <td>
                        <div class="separador">&nbsp;</div>
                        <div class="titulo">
                            <img src="images/flecha.gif"/>
                            <b><axis:alt f="axisadm095" c="LIT32" lit="1000188"/></b>
                        </div>
                        
                        <table class="seccion" >
                            <tr>                        
                            <td align="left">
                                <table class="area" align="center">
                                    <tr> 
                                    <th style="width:25%;height:0px"></th>
                                    <th style="width:25%;height:0px"></th>
                                    <th style="width:25%;height:0px"></th>
                                    <th style="width:25%;height:0px"></th>
                                    </tr> 
                                    
                                    <tr>
                                        <axis:ocultar f="axisadm095" c="CPOLICY" dejarHueco="false"> 
                                            <td class="titulocaja" colspan = "2">
                                                <b><axis:alt f="axisadm095" c="CPOLICY" lit="101273"/></b>
                                            </td>                                            
                                        </axis:ocultar>
                                    </tr>
                                    
                                    <tr>
                                        <axis:visible f="axisadm095" c="CPOLICY">
                                            <td class="campocaja">
                                                <input type="text" class="campowidthinput campo campotexto" value="${__formdata.CPOLICY}" name="CPOLICY" id="CPOLICY" size="10" />
                                            </td>
                                        </axis:visible>      
                                        
                                        <td>
                                            <img id="findPolicy" border="0" src="images/find.gif" onclick="f_abrir_axisctr019();" style="cursor:pointer" alt=""/>
                                        </td>
                                    </tr>
                                    
                                </table>
                            </td>                        
                            </tr>
                        </table> 
                        
                     
                        <c:import url="../include/botonera_nt.jsp"> 
                            <c:param name="__botones">
                                <axis:ocultar f="axisadm095" c = "BT_BUSCAR" dejarHueco="false">buscar</axis:ocultar>	
                            </c:param>
                        </c:import>                                    
                              
                        <div class="separador">&nbsp;</div>
                        <div class="titulo">
                            <img src="images/flecha.gif"/>
                            <b><axis:alt f="axisadm095" c="flecha" lit="9902164"/></b>
                        </div> 
                        
                        <table class="seccion" align="center">
                            <tr>
                            <td>
                                <table class="area" align="center"> 
                                    <tr>                        
                                    <td>
                                        <c:set var="title0"><axis:alt f="axisadm095" c="CPOLICY" lit="101273"/></c:set>
                                        <c:set var="title1"><axis:alt f="axisadm095" c="CHOLDER" lit="9000566"/></c:set>
                                        <c:set var="title2"><axis:alt f="axisadm095" c="NRECIDI" lit="9908004"/></c:set>
                                        <c:set var="title3"><axis:alt f="axisadm095" c="BT_EDIT_RECIDI" lit="9000552"/></c:set>
                                        <c:set var="title4"><axis:alt f="axisadm095" c="BT_BRR_RECIDI" lit="9001333"/></c:set>
                                        
                                        <div class="displayspace"> 
                                            <display:table name="${sessionScope.axisadm095_listaRecidi}"
                                                            id="miListaId" export="false"
                                                            class="dsptgtable" pagesize="15"
                                                            defaultsort="1"
                                                            defaultorder="ascending"
                                                            sort="list" cellpadding="0"
                                                            cellspacing="0"
                                                            requestURI="axis_axisadm095.do?paginar=true">                                 
                                             
                                             
                                             <%@ include file="../include/displaytag.jsp"%>
                                            
                                             <display:column title="${title0}"
                                                             sortable="true"
                                                             sortProperty="NPOLIZA"
                                                             headerClass="sortable fixed"
                                                             media="html" autolink="false">
                                                <div class="dspText">
                                                ${miListaId['NPOLIZA']}
                                                </div>
                                      
                                             </display:column> 
                                             
                                             <display:column title="${title1}"
                                                             sortable="true"
                                                             sortProperty="NOMBRE"
                                                             headerClass="sortable fixed"
                                                             media="html" autolink="false">
                                                <div class="dspText">
                                                ${miListaId['NOMBRE']}
                                                </div>
                                      
                                              </display:column>
                                              
                                              <display:column title="${title2}"
                                                              sortable="true"
                                                              sortProperty="NREEMBO"
                                                              headerClass="sortable fixed"
                                                              media="html" autolink="false">
                                                <div class="dspText">
                                                ${miListaId['NREEMBO']}
                                                </div>
                                      
                                              </display:column>
                                           
                                              <display:column title="${title3}"
                                                              headerClass="sortable fixed"
                                                              media="html" 
                                                              autolink="false">
                                                <div class="dspIcons" align="left">
                                                <img border="0" alt="" src="images/lapiz.gif" style="cursor:pointer" 
                                                onclick='javascript:f_sel_pol_abre_modal("${miListaId['CEMPRES']}","${miListaId['SPERSON']}","${miListaId['SSEGURO']}","${miListaId['NNUMLIN']}","${miListaId['SPRODUC']}","${miListaId['NREEMBO']}","${miListaId['NPOLIZA']}")'/>
                                                </div>
                                      
                                              </display:column>
                                                                                          
                                              </display:table> 
                                          </div> 
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
                <div class="separador">&nbsp;</div>
                <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisadm095</c:param>
                    <c:param name="__botones"><axis:visible f="axisadm095" c="BT_CANCELAR">cancelar</axis:visible></c:param>
                </c:import>
            </form>            
            
            <c:import url="../include/mensajes.jsp" />
        
    </body>
    
    <c:if test="${ (fn:containsIgnoreCase(header['User-Agent'],'ipad') )   }">
      <script language="Javascript" type="text/javascript">  
        retocarPAGE_CSS('axisadm095');
      </script>                   
    </c:if>
    
</html>