
<%/*
*  Fichero: axiscob001a.jsp
*  @author <a href = "mailto:jpacheco@csi-ti.com">Juan Carlos PAcheco</a> 
*     

*/
%>
<%@ page contentType="text/html;charset=windows-1252" errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page import="java.util.List" %>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<html>
  <head>
    <link rel="stylesheet" href="styles/genericosHtml.css" type="text/css">
    <link rel="stylesheet" href="styles/axisnt.css" type="text/css">
    <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>
    <%-- Especial per controlar els scroll amb iPad --%>
        <link type="text/css" href="styles/jquery.jscrollpane.css" rel="stylesheet" media="only screen and (min-device-width: 768px) and (max-device-width: 1024px)" />
        <style type="text/css" id="page-css"> </style>
    <%-- FI Especial per controlar els scroll amb iPad --%>
    <c:import url="../include/carga_framework_js.jsp" />
    <script language="Javascript" type="text/javascript">

        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/

        function f_onload() {
        
            try{
                document.miForm.NOMBRE.focus();
            } catch (e) {	
                try{
                document.miForm.NOMBRECOMP.focus();
            }catch(e){ }
            }
            
            if (document.all) // ES Explorer
                document.getElementById("tabla1").style.marginLeft="1.3%";
            
            f_cargar_propiedades_pantalla();
        }
        
        function f_but_9908116(){        
            var SPERSON=objDom.getValorPorId("SPERSON");
            var SSEGURO=objDom.getValorPorId("SSEGURO");         
            
            if (!objUtiles.estaVacio(SSEGURO)) {
            objUtiles.ejecutarFormulario("modal_axiscob001a.do", "aplicar_caja", document.miForm, "_self", objJsMessages.jslit_cargando);
            }
        }
        
        function f_delete_caja(SSEGURO, SEQCAJA, NUMLIN){
        
            objDom.setValorPorId("SEQCAJA", SEQCAJA);
            objDom.setValorPorId("NNUMLIN", NUMLIN);
            
            if(confirm('<axis:alt f="axiscob001a" c="MSG_CONFIRMACION" lit="9902586"/>')){
                if (!objUtiles.estaVacio(SEQCAJA)){
                    objUtiles.ejecutarFormulario("modal_axiscob001a.do", "delete_caja", document.miForm, "_self", objJsMessages.jslit_actualizando_registro);                
                }
            }        
        }
         
         function f_abrir_axiscob001b(){           
            var SPERSON=objDom.getValorPorId("SPERSON");
            var SSEGURO=objDom.getValorPorId("SSEGURO");
            var NOMBRE = objDom.getValorPorId("NOMBRE");
            var TRANS_SPL = objDom.getValorPorId("TRANS_SPL");
            var NPOLIZA = objDom.getValorPorId("NPOLIZA_D");
            
            if(!objUtiles.estaVacio(SPERSON) || !objUtiles.estaVacio(SSEGURO)){
                objUtiles.abrirModal("axiscob001b", "src", "modal_axiscob001b.do?operation=form&METODO=INS&SSEGURO="+SSEGURO+"&TRANS_SPL="+TRANS_SPL+"&SPERSON="+SPERSON+"&NPOLIZA="+NPOLIZA+"&NOMBRE="+NOMBRE);  
            }else{
                alert("<axis:alt f='axiscob001a' c='ADVERTENCIA' lit='9905104'/>");
            }
         }
        
        function f_aceptar_axiscob001b(){            
            f_but_cerrar_axiscob001b();
            objUtiles.ejecutarFormulario("modal_axiscob001a.do", "form", document.miForm, "_self", objJsMessages.jslit_actualizando_registro);
        }
        
        function f_but_cancelar() {
            parent.f_cerrar_modal("axiscob001a");
        }        
        
        function f_but_cerrar_axiscob001b(){
            objUtiles.cerrarModal("axiscob001b");
        }
  
        function f_but_buscar() {
            if (objValidador.validaEntrada()) {
                objDom.setValorPorId ("MODO_BUSQUEDA","NORMAL");
                objUtiles.ejecutarFormulario("modal_axiscob001a.do", "busqueda_persona", document.miForm, "_self", objJsMessages.jslit_buscando_personas);   
            }
        }
        
        /****************************************************************************************/
        /************************************* MODAL ********************************************/
        /****************************************************************************************/
    
        function f_but_nueva_persona() {
           parent.f_nova_persona();
        }
        
    </script>
  </head>
    <body class=" " onload="f_onload()" onkeypress="if (event.keyCode==13)  { f_but_buscar() }">
             <c:import url="../include/titulo_nt.jsp">
        <c:param name="titulo">
          <axis:alt f="axiscob001" c="TITULO" lit="9907908"/>
        </c:param>
        <c:param name="formulario">
          <axis:alt f="axiscob001" c="FORM" lit="9907908"/>
        </c:param>
        <c:param name="form">axiscob001a</c:param>
      </c:import>
         <c:import url="../include/modal_estandar.jsp">
        <c:param name="nid_y_titulo">
          axiscob001b
          <axis:alt f="axiscob001a" c="TIT_007" lit="9907904"/>
        </c:param>
      </c:import>
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
        <form name="miForm" action="" method="POST">
            <input type="hidden" name="operation" value=""/>
            <input type="hidden" name="SPERSON" id="SPERSON" value="${__formdata.SPERSON}" />
            <input type="hidden" name="SNIP" id="SNIP" value="${__formdata.SNIP}" />
            <input type="hidden" name="CAGENTE" id="CAGENTE" value="${__formdata.CAGENTE}" />
            <input type="hidden" name="SSEGURO" id="SSEGURO" value="${__formdata.SSEGURO}" />
            <input type="hidden" name="MODO_SWPUBLI" id="MODO_SWPUBLI" value="${__formdata.MODO_SWPUBLI}" />
            <input type="hidden" name="MODO_BUSQUEDA" id="MODO_BUSQUEDA" value="${__formdata.MODO_BUSQUEDA}" />
            <input type="hidden" name="ORIGEN" id="ORIGEN" value="${__formdata.ORIGEN}" />
            <input type="hidden" name="CONDICION" id="CONDICION" value="${__formdata.CONDICION}" />
            <input type="hidden" name="SEQCAJA" id="SEQCAJA" value="${__formdata.SEQCAJA}" />
            <input type="hidden" name="PAMOUNT" id="PAMOUNT" value="${__formdata.PAMOUNT}" />
            <input type="hidden" name="ACCOUNT" id="ACCOUNT" value="${__formdata.ACCOUNT}" />
            <input type="hidden" name="RFREIMBURSING" id="RFREIMBURSING" value="${__formdata.RFREIMBURSING}" />
               <input type="hidden" name="SSEGURO_D" id="SSEGURO_D" value="${__formdata.SSEGURO_D}" />
                <input type="hidden" name="NNUMLIN" id="NNUMLIN" value="${__formdata.NNUMLIN}" />
            
            
        
           <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo">
                <axis:alt f="axiscob001b" c="TITULO" lit="9907904"/>
                </c:param>
                <c:param name="nid" value="axiscob001b"/>
            </c:import>
            
             <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0" style="height:10px;">
            <tr>
            <td>
                <div class="separador">&nbsp;</div>
                <div class="titulo">
                    <img src="images/flecha.gif"/>
                    <b><axis:alt f="axiscob001a" c="LIT32" lit="9907908"/></b>
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
                        <axis:ocultar f="axiscob001a" c="POLICY" dejarHueco="false"> 
                        <td class="titulocaja">
                            <b><axis:alt f="axiscob001a" c="POLICY" lit="9001875" /></b>
                        </td>                                            
                        </axis:ocultar>
                        
                        <axis:ocultar f="axiscob001a" c="HOLDER" dejarHueco="false"> 
                        <td class="titulocaja">
                            <b><axis:alt f="axiscob001a" c="HOLDER" lit="9907907" /></b>
                        </td>                                            
                        </axis:ocultar>     
                        <axis:ocultar f="axiscob001a" c="BALANCE" dejarHueco="false"> 
                        <td class="titulocaja">
                            <b><axis:alt f="axiscob001a" c="BALANCE" lit="9905069" /></b>
                        </td>                                            
                        </axis:ocultar>
                    </tr>
                    
                    <tr>
                        <axis:visible f="axiscob001a" c="POLICY">
                        <td class="campocaja">
                            <input type="hidden" style="width:300px;" class="campo campotexto" value="${__formdata.SSEGURO}" name="SSEGURO" id="SSEGURO" size="15" disabled="true"
                                   <axis:atr f="axiscob001a" c="TSITUAC" a="modificable=true"/>/>
                            <input type="text" style="width:300px;" class="campowidthinput campo campotexto" value="${__formdata.NPOLIZA_D}" name="NPOLIZA_D" id="NPOLIZA_D" size="15" 
                                   <axis:atr f="axiscob001a" c="NPOLIZA_D" a="modificable=false"/>/>
                        </td>
                        </axis:visible>  
                        
                        <axis:visible f="axiscob001a" c="HOLDER">
                        <td class="campocaja">
                            <input type="text" style="width:300px;" class="campowidthinput campo campotexto" value="${__formdata.NOMBRE}" name="NOMBRE" id="NOMBRE" size="15" 
                                   <axis:atr f="axiscob001a" c="NOMBRE" a="modificable=false"/>/>
                        </td>
                        </axis:visible>
                        
                        <axis:visible f="axiscob001a" c="HOLDER">
                        <td class="campocaja">
                             <input type="text" style="width:300px;" class="campo campotexto" value="<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${__formdata.TRANS_SPL}"/>" name="TRANS_SPL" id="TRANS_SPL" size="15" 
                                    <axis:atr f="axiscob001a" c="TRANS_SPL" a="modificable=false"/>/>
                        </td>
                        </axis:visible>
                    </tr>
                    </table>
                
                 </td>                        
                </tr>
                </table>
                <div class="separador">&nbsp;</div>
                <div style="float:right;">
                    <a href="javascript:f_abrir_axiscob001b();">
                        <img border="0" src="images/agenda.gif" onclick="f_abrir_axiscob001b();" style="cursor:pointer" alt="<axis:alt f="axisadm090" c="OPEN_COB001b" lit="104825"/>" 
                             title="<axis:alt f="axisadm090" c="OPEN_COB001b" lit="104825"/>"/>
                    </a>
                </div>
                <div class="separador"></div>
                <div class="separador"></div>
                <div style="clear:both;">
                    <hr class="titulo"/>
                </div>
                <c:set var="title3"><axis:alt f="axiscob001a" c="POLICY_T" lit="9001875"/></c:set>
                <c:set var="title2"><axis:alt f="axiscob001a" c="HOLDER_T" lit="9907907"/></c:set>
                <c:set var="title1"><axis:alt f="axiscob001a" c="PREMIUM_T" lit="101368"/></c:set>
                <c:set var="title0"><axis:alt f="axiscob001a" c="DESTINY_T" lit="9907906"/></c:set>
                <div class="seccion displayspacePersonas"> 
                <display:table name="${listaPolizas}" 
                                id="miListaId"
                                export="false" 
                                class="dsptgtable" 
                                pagesize="10" 
                                defaultsort="1"
                                defaultorder="ascending" 
                                requestURI="modal_axiscob001a.do?paginar=true" 
                                sort="list" 
                                cellpadding="0" 
                                cellspacing="0">
                                
                <%@ include file="../include/displaytag.jsp"%>
                
                <!-- RAMIRO INICIO -->
                <display:column title="${title3}" 
                    sortable="true" style="width:10%;" 
                    sortProperty="miListaId.NPOLIZA" 
                    headerClass="headwidth5 sortable"  
                    media="html"
                    autolink="false" >
                <div class="dspNumber">                                        
                    ${miListaId.NPOLIZA}
                </div>
                </display:column>                
                <!-- RAMIRO FIN -->
                
                <display:column title="${title2}" 
                    sortable="true" 
                    style="width:50%;" 
                    sortProperty="miListaId.TNOMBRE"
                    headerClass="sortable" 
                    media="html" autolink="false" >
                <div class="dspText">
                    ${miListaId.TNOMBRE}
                </div>
                </display:column>
                
                <display:column 
                    title="${title1}" 
                    sortable="true" 
                    style="width:5%;" 
                    sortProperty="miListaId.IMOVIMI"
                    headerClass="headwidth5 
                    sortable"  media="html" 
                    autolink="false" >                
                <!-- RAMIRO INICIO -->                                    
                <div class="dspNumber">
                    <fmt:formatNumber pattern="${applicationScope.__formatNumberPatterns[__defaultCMONINT]}" value="${miListaId.IMOVIMI}"/> 
                </div>
                </display:column>
                <!-- RAMIRO FIN -->    
                
                <display:column title="${title0}" 
                    sortable="true" style="width:30%;" 
                    sortProperty="TMEDMOV" headerClass="sortable"  
                    media="html" autolink="false" >
                <div class="dspText">
                    ${miListaId.TMEDMOV}
                </div>
                </display:column>
                
                <display:column title="" 
                    sortable="true" style="width:30%;" 
                    sortProperty="DELETE" headerClass="sortable"  
                    media="html" autolink="false" >
                <div class="dspText">    
                    <input type="hidden" id="SEQCAJA_l" name="SEQCAJA_l" value="${miListaId.SEQCAJA}"/> 
                    <input type="hidden" id="NNUMLIN_l" name="NNUMLIN_l" value="${miListaId.NNUMLIN}"/> 
                    <img border="0" src="images/delete.gif" onclick="javascript:f_delete_caja('${miListaId.SSEGURO}','${miListaId.SEQCAJA}','${miListaId.NNUMLIN}')" style="cursor:pointer" alt="Delete" title="Detele">
                </div>
                </display:column>
                
                </display:table>
                
                </div>
                
                <div class="separador">&nbsp;</div>
                <div style="float:right;" class="titulocaja">
                    <axis:visible f="axiscob001a" c="SUM">
                        <b><axis:alt f="axiscob001a" c="SUM" lit="9907939" /></b>
                        <input type="text" style="width:100px" class="campowidthinput campo campotexto" value="<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${__formdata['SUM']}"/>" name="SUM" id="SUM" size="15" 
                               <axis:atr f="axiscob001a" c="SUM" a="modificable=false"/>/>
                    </axis:visible>
                </div>
                
            </td>
            </tr>            
            </table>
            
            <div class="separador">&nbsp;</div>
            <c:import url="../include/botonera_nt.jsp"><c:param name="f">axiscob001a</c:param><c:param name="f">axiscob001a</c:param>
                <c:param name="f">axiscob001a</c:param>
                <c:param name="__botones">cancelar,9908116</c:param>
            </c:import>
        </form>
    <c:import url="../include/mensajes.jsp" />
    </body>
    <c:if test="${ (fn:containsIgnoreCase(header['User-Agent'],'ipad') )   }">
      <script language="Javascript" type="text/javascript">  
        retocarPAGE_CSS('axiscob001a');
      </script>                   
    </c:if>
</html>

