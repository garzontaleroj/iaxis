<%/*
*  Fichero: axisrea001.jsp
*
*  @author <a href = "mailto:jtorres@csi-ti.com">Jorge Torres</a>
*  Fecha: 29/10/2008
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
    <script language="Javascript">
    function f_but_cancelar() {
       parent.f_cerrar_axisrea001();
    }
    
    function f_but_aceptar() {
       var hayChecked = objUtiles.f_GuardaCasillasChecked("radioSCONTRA");
       if(typeof hayChecked == 'boolean') {
           alert(objJsMessages.jslit_error_de_seleccion);
       }else{
           f_seleccionar (hayChecked);
       }
    }
    
   function f_but_nuevo() {        
        parent.f_nuevo_axisrea003(1);  
    }
    
    function f_seleccionar(pSCONTRA){
        parent.f_aceptar_axisrea001(pSCONTRA);
     }        

    function f_but_buscar() {
        // BUG 22887 - 20120716 -JLTS Se quita el comentario de objValidador.validaEntrada()
        if (objValidador.validaEntrada()) {
            objUtiles.ejecutarFormulario ("modal_axisrea001.do", "buscar", document.miForm, "_self", objJsMessages.jslit_cargando);                
        }
    }

    function f_onload() {
         revisarEstilos();
         document.getElementById("SCONTRA").focus();
         
         //Como el select está hardcodeado, ponemos el valor del cdevento por jquery
         var CDEVENTO = '${__formdata.CDEVENTO}';
         if(!objUtiles.estaVacio(CDEVENTO)){
            $('#CDEVENTO option[value='+CDEVENTO+']').attr('selected',true);
         }
         f_cargar_propiedades_pantalla();
    }
    </script>
  </head>
  <body onload="f_onload()" onkeypress="if (event.keyCode==13)  { f_but_buscar() }">
  <c:import url="../include/precargador_ajax.jsp"><c:param name="imagen" value="images/ajax-loader.gif"></c:param></c:import>

  <form name="miForm" action="modal_axisrea001.do" method="POST"> 
  
    <c:import url="../include/titulo_nt.jsp">
        <c:param name="formulario"><axis:alt f="axisrea001" c="LIT_NOMBRE_PANTALLA" lit="9000575" /></c:param>
        <c:param name="form">axisrea001</c:param>
    </c:import>
    <input type="hidden" name="operation" value="" />

<table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
    <tr>
        <td>
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
                                            <axis:ocultar f="axisrea001" c="SCONTRA" dejarHueco="false">
                                                <td class="titulocaja" ><!-- NUM CONTRATO -->
                                                    <b><axis:alt f="axisrea001" c="LIT_SCONTRA" lit="9000536"/></b>
                                                </td>
                                            </axis:ocultar>
                                            <axis:ocultar f="axisrea001" c="CMONEDA" dejarHueco="false">
                                                <td class="titulocaja" ><!-- MONEDA -->
                                                    <b><axis:alt f="axisrea001" c="LIT_CMONEDA" lit="108645"/></b>
                                                </td>    
                                            </axis:ocultar>
                                            <axis:ocultar f="axisrea001" c="CEMPRES" dejarHueco="false">
                                                <td class="titulocaja" ><!-- EMPRESA -->
                                                    <b><axis:alt f="axisrea001" c="LIT_CEMPRES" lit="101619"/></b>
                                                </td>
                                            </axis:ocultar>
                                            <!-- INI - CJAD - 21/JUNIO2019 - IAXIS4427 - Cambio de producto a ramo -->
                                            <axis:ocultar f="axisrea001" c="SRAMO" dejarHueco="false">
                                                <td class="titulocaja"><!-- RAMO -->
                                                    <b><axis:alt f="axisrea001" c="LIT_CRAMO" lit="100784"/></b>
                                                </td>
                                            </axis:ocultar>
                                            <!-- FIN - CJAD - 21/JUNIO2019 - IAXIS4427 - Cambio de producto a ramo -->
                                        </tr>
                                        <tr>
                                            <axis:ocultar f="axisrea001" c="SCONTRA" dejarHueco="false">
                                                <td class="campocaja" ><!-- NUM CONTRATO -->
                                                <input  type="text" class="campowidth campo campotexto" id="SCONTRA" name="SCONTRA" size="15"
                                                title="<axis:alt f="axisrea001" c="LIT_SCONTRA" lit="9000536"/>" <%-- BUG 22887 - 20120716 -JLTS Se adiciona el titulo para que lo muestr en caso de error--%>
                                                value="${__formdata.SCONTRA}" <axis:atr f="axisrea001" c="SCONTRA" a="modificable=true&obligatorio=false&formato=entero"/>/>
                                                </td>
                                             </axis:ocultar>
                                             
                                            <axis:ocultar f="axisrea001" c="CMONEDA" dejarHueco="false">
                                            <td class="campocaja" >  
                                                <select name="CMONEDA" id="CMONEDA" size="1" class="campowidthselect campo campotexto" style="width:82.5%;">
                                                    <option value=""> - <axis:alt f="axisrea001" c="ALT_CMONEDA" lit="108645"/> - </option>
                                                    <c:forEach var="element" items="${__formdata.listaMonedas}">
                                                       <option value = "${element.CMONEDA}" 
                                                           <c:if test="${element.CMONEDA == __formdata.CMONEDA}"> selected </c:if> />
                                                           ${element.TMONEDA} 
                                                       </option>
                                                    </c:forEach>
                                                </select>
                                            </td>
                                            </axis:ocultar>
                                            <axis:ocultar f="axisrea001" c="CEMPRES" dejarHueco="false">
                                                <td class="campocaja" ><!-- EMPRESA --> 
                                                    <select name="CEMPRES" id="CEMPRES" size="1" class="campowidthselect campo campotexto" style="width:82.5%;">
                                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisrea001" c="ALT_CEMPRES" lit="101619"/> - </option>
                                                        <c:forEach var="element" items="${__formdata.listaEmpresas}">
                                                           <option value = "${element.CEMPRES}" 
                                                               <c:if test="${element.CEMPRES == __formdata.CEMPRES}"> selected </c:if> />
                                                               ${element.TEMPRES} 
                                                           </option>
                                                        </c:forEach>
                                                    </select>
                                                </td>
                                            </axis:ocultar>
                                            <!-- INI - CJAD - 21/JUNIO2019 - IAXIS4427 - Cambio de producto a ramo -->
                                            <axis:ocultar f="axisrea001" c="SRAMO" dejarHueco="false">
                                            <td class="campocaja"><!-- RAMO -->
                                                <select name="SRAMO" id="SRAMO" size="1" class="campowidthselect campo campotexto" >
                                                    <option value=""> - <axis:alt f="axisrea001" c="ALT_SRAMO" lit="100784"/> - </option>
                                                    <c:forEach var="element" items="${__formdata.listaRamos}">
                                                       <option value = "${element.CRAMO}" 
                                                           <c:if test="${element.CRAMO == __formdata.SPRODUC}"> selected </c:if> />
                                                           ${element.TRAMO} 
                                                       </option>
                                                    </c:forEach>
                                                </select>
                                            </td>
                                            </axis:ocultar>
                                            <!-- FIN - CJAD - 21/JUNIO2019 - IAXIS4427 - Cambio de producto a ramo -->
                                        </tr>
                                        
                                        <tr>
                                            <axis:ocultar f="axisrea001" c="CCOMPANI" dejarHueco="false">
                                                <td class="titulocaja" ><!-- COMPAÑIA REASEGURADORA -->
                                                    <b><axis:alt f="axisrea001" c="LIT_CCOMPANI" lit="9000600"/></b>
                                                </td>
                                            </axis:ocultar>
                                            <axis:ocultar f="axisrea001" c="CACTIVI" dejarHueco="false">
                                                <td class="titulocaja" ><!-- ACTIVIDAD -->
                                                    <b><axis:alt f="axisrea001" c="LIT_CACTIVI" lit="103481" /></b>
                                                </td>
                                            </axis:ocultar>
                                            <axis:ocultar f="axisrea001" c="CGARANT" dejarHueco="false">
                                                <td class="titulocaja" ><!-- GARANTIA -->
                                                    <b><axis:alt f="axisrea001" c="LIT_CGARANT" lit="100561"/></b>
                                                </td>
                                            </axis:ocultar>
                                        </tr>
                                        <tr>
                                        <axis:ocultar f="axisrea001" c="CCOMPANI" dejarHueco="false">
                                            <td class="campocaja"><!-- COMPAÑIA REASEGURADORA -->                                           
                                                <select name="CCOMPANI" id="CCOMPANI" size="1" class="campowidthselect campo campotexto" style="width:82.5%;">
                                                    <!--option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisrea001" c="ALT_CCOMPANI1" lit="101619"/> - </option-->
                                                    <option value=""> - <axis:alt f="axisrea001" c="ALT_CCOMPANI" lit="9000600"/> - </option-->
                                                    <c:forEach var="element" items="${__formdata.listaCompReaseg}">
                                                       <option value = "${element.CCOMPANI}" 
                                                           <c:if test="${(!empty __formdata.CCOMPANI) && element.CCOMPANI == __formdata.CCOMPANI}"> selected </c:if> />
                                                           ${element.TCOMPANI} 
                                                       </option>
                                                    </c:forEach>
                                                </select>                                            
                                            </td>
                                         </axis:ocultar>
                                        <axis:ocultar f="axisrea001" c="CACTIVI" dejarHueco="false">
                                            <td class="campocaja">
                                                <input  type="text" class="campowidth campo campotexto" id="CACTIVI" name="CACTIVI" size="15" value="${__formdata.CACTIVI}"/><!-- ACTIVIDAD -->
                                            </td>
                                        </axis:ocultar>
                                        <axis:ocultar f="axisrea001" c="CGARANT" dejarHueco="false">
                                            <td class="campocaja">
                                                <input  type="text" class="campowidth campo campotexto" id="CGARANT" name="CGARANT" size="15" value="${__formdata.CGARANT}"/><!-- GARANTÍA -->
                                            </td>
                                        </axis:ocultar>   
                                        </tr>
                                        
                                        <tr>
                                        <axis:ocultar f="axisrea001" c="CTIPREA" dejarHueco="false">
                                            <td class="titulocaja" ><!-- TIPO CONTRATO -->
                                                <b><axis:alt f="axisrea001" c="LIT_CTIPREA" lit="9903954"/></b>  <%-- BUG 22887 - 20120713 -JLTS Se cambia en numero de literal --%>
                                            </td>
                                        </axis:ocultar>   
                                        <axis:ocultar f="axisrea001" c="SCONAGR" dejarHueco="false">
                                            <td class="titulocaja" ><!-- AGRUPACION DE CONTRATO -->
                                                <b><axis:alt f="axisrea001" c="LIT_SCONAGR" lit="111471" /></b>
                                            </td>
                                         </axis:ocultar>         
                                         <axis:ocultar f="axisrea001" c="CDEVENTO" dejarHueco="false">
                                            <td class="titulocaja" >
                                                <b><axis:alt f="axisrea001" c="LIT_CDEVENTO" lit="9906253" /></b>
                                            </td>
                                         </axis:ocultar>
                                         
                                        </tr>
                                        <tr>
                                        <axis:ocultar f="axisrea001" c="CTIPREA" dejarHueco="false">
                                            <td class="campocaja"><!-- TIPO CONTRATO -->
                                                <select name="CTIPREA" id="CTIPREA" size="1" class="campowidthselect campo campotexto" style="width:82.5%;">                                                    
                                                    <option value=""> - <axis:alt f="axisrea001" c="ALT_CTIPREA" lit="9903954"/> - </option> <%-- BUG 22887 - 20120713 -JLTS Se cambia en numero de literal --%>
                                                    <c:forEach var="element" items="${__formdata.listaTipReaseg}">
                                                       <option value = "${element.CATRIBU}" 
                                                           <c:if test="${element.CATRIBU == __formdata.CTIPREA}"> selected </c:if> />
                                                           ${element.TATRIBU} 
                                                       </option>
                                                    </c:forEach>
                                                </select>                                            
                                            </td>
                                        </axis:ocultar>   
                                        <axis:ocultar f="axisrea001" c="SCONAGR" dejarHueco="false">
                                            <td class="campocaja"><!-- AGRUPACION DE CONTRATO -->
                                                <select name="SCONAGR" id="SCONAGR" size="1" class="campowidthselect campo campotexto" style="width:82.5%;">
                                                   
                                                    <option value=""> - <axis:alt f="axisrea001" c="ALT_SCONAGR" lit="111471"/> - </option>
                                                    <c:forEach var="element" items="${__formdata.listaAgrReaseg}">
                                                       <option value = "${element.SCONAGR}" 
                                                           <c:if test="${element.SCONAGR == __formdata.SCONAGR}"> selected </c:if> />
                                                           ${element.TCONAGR} 
                                                       </option>
                                                    </c:forEach>
                                                </select>                                            
                                            </td>
                                        </axis:ocultar>   
                                         <axis:ocultar f="axisrea001" c="CDEVENTO" dejarHueco="false">
                                            <td class="campocaja">
                                                <select name="CDEVENTO" id="CDEVENTO" size="1" class="campowidthselect campo campotexto" style="width:82.5%;">
                                                    <option value=""> - <axis:alt f="axisrea001" c="ALT_CDEVENTO" lit="9906253"/> -</option>
                                                    <option value="0">Por Riesgo</option>
                                                    <option value="1">Por Evento</option>
                                                   <!-- <option value="2">Ambos</option>-->
                                                </select>                                            
                                            </td>
                                        </axis:ocultar>
                                            
                                        </tr>
                                    </table>
                             </td>
                        </tr>
                       <axis:ocultar f="axisrea001" c="DSP_CONTRATOS" dejarHueco="false"> 
                        <tr>
                            <td>
                                 <table>
                                        <tr>
                                            <td>
                                                <c:set var="title1"><axis:alt f="axisrea001" c="LITMENU_NCONTRATO" lit="9000536"/></c:set>  <%-- Num. contrato --%>
                                                <c:set var="title2"><axis:alt f="axisrea001" c="LITMENU_CEMPRES" lit="101619"/></c:set>   <%-- Empresa --%>
                                                <!-- INI - CJAD - 21/JUNIO2019 - IAXIS4427 - Cambio de producto a ramo -->
                                                <c:set var="title3"><axis:alt f="axisrea001" c="LITMENU_SRAMO" lit="100784"/></c:set>   <%-- RAMO --%>
                                                <!-- FIN - CJAD - 21/JUNIO2019 - IAXIS4427 - Cambio de producto a ramo -->   
                                                <c:set var="title4"><axis:alt f="axisrea001" c="LITMENU_CACTIVI" lit="103481"/></c:set>   <%-- Actividad --%>
                                                <c:set var="title5"><axis:alt f="axisrea001" c="LITMENU_CGARANT" lit="100561"/></c:set>   <%-- Garantía --%>
                                                <c:set var="title6"><axis:alt f="axisrea001" c="LITMENU_TCONTRATO" lit="9903954"/></c:set>  <%-- Tipo Contrato --%> <%-- BUG 22887 - 20120713 -JLTS Se cambia en numero de literal --%>
                                                <c:set var="title7"><axis:alt f="axisrea001" c="LITMENU_CAGRUPA" lit="111471"/></c:set>   <%-- Agrupación --%>
                                                <c:set var="title8"><axis:alt f="axisrea001" c="LITMENU_CMONEDA" lit="108645"/></c:set>   <%-- Moneda --%>
                                                <c:set var="title9"><axis:alt f="axisrea001" c="LITMENU_RFECHAS" lit="9902163"/></c:set>   <%-- Rango fechas --%>
               
                                                <div class="displayspace">
                                                
                                                    <display:table name="${requestScope.T_IAX_CODICONTRATO_REA}" id="T_IAX_CODICONTRATO_REA" export="false" class="dsptgtable" 
                                                    pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"   style="width:98.5%"
                                                    requestURI="modal_axisrea001.do?operation=form&paginar=true">                                                    
                                                    
                                                        <%@ include file="../include/displaytag.jsp"%>
                                                        <display:column title="" sortable="true" sortProperty="" headerClass="sortable fixed"  media="html" autolink="false" >
                                                            <div class="dspIcons">
                                                                <input value="${T_IAX_CODICONTRATO_REA.SCONTRA}" <c:if test="${T_IAX_CODICONTRATO_REA['radioSCONTRA']}">checked</c:if> type="radio" id="radioSCONTRA" name="radioSCONTRA" selected="true"/>
                                                            </div>
                                                        </display:column>
                                                        <display:column title="${title1}" sortable="true" sortProperty="SCONTRA" headerClass="sortable fixed"  media="html" autolink="false" >                                    
                                                            <div class="dspText"><a href="javascript:f_seleccionar('${T_IAX_CODICONTRATO_REA.SCONTRA}')">${T_IAX_CODICONTRATO_REA.SCONTRA}</div>
                                                        </display:column>   
                                                        <display:column title="${title2}" sortable="true" sortProperty="TEMPRES" headerClass="sortable fixed"  media="html" autolink="false" >                                    
                                                            <div class="dspText"><a href="javascript:f_seleccionar('${T_IAX_CODICONTRATO_REA.SCONTRA}')">${T_IAX_CODICONTRATO_REA.TEMPRES}</div>
                                                        </display:column>
                                                        <display:column title="${title3}" sortable="true" sortProperty="TPRODUCT" headerClass="sortable fixed"   media="html" autolink="false" >                                    
                                                            <div class="dspText"><a href="javascript:f_seleccionar('${T_IAX_CODICONTRATO_REA.SCONTRA}')">${T_IAX_CODICONTRATO_REA.TPRODUC}</div>
                                                        </display:column>
                                                        <display:column title="${title4}" sortable="true" sortProperty="TACTIVI" headerClass="sortable fixed"   media="html" autolink="false" >                                    
                                                            <div class="dspText"><a href="javascript:f_seleccionar('${T_IAX_CODICONTRATO_REA.SCONTRA}')">${T_IAX_CODICONTRATO_REA.TACTIVI}</div>
                                                        </display:column>                                        
                                                        <display:column title="${title5}" sortable="true" sortProperty="TGARANT" headerClass="sortable fixed"  media="html" autolink="false" >                                    
                                                            <div class="dspText"><a href="javascript:f_seleccionar('${T_IAX_CODICONTRATO_REA.SCONTRA}')">${T_IAX_CODICONTRATO_REA.TGARANT}</div>
                                                        </display:column>                                        
                                                        <display:column title="${title6}" sortable="true" sortProperty="TTIPREA" headerClass="sortable fixed"  media="html" autolink="false" >                                    
                                                            <div class="dspText"><a href="javascript:f_seleccionar('${T_IAX_CODICONTRATO_REA.SCONTRA}')">${T_IAX_CODICONTRATO_REA.TCTIPREA}</div>
                                                        </display:column>
                                                        <display:column title="${title7}" sortable="true" sortProperty="SCONAGR" headerClass="sortable fixed"  media="html" autolink="false" >                                    
                                                            <div class="dspText"><a href="javascript:f_seleccionar('${T_IAX_CODICONTRATO_REA.SCONTRA}')">${T_IAX_CODICONTRATO_REA.TCONAGR}</div>
                                                        </display:column> 
                                                        <axis:visible f="axisrea001" c="CMONEDA">
                                                        <display:column title="${title8}" sortable="true" sortProperty="SCONAGR" headerClass="sortable fixed"  media="html" autolink="false" >                                    
                                                            <div class="dspText"><a href="javascript:f_seleccionar('${T_IAX_CODICONTRATO_REA.SCONTRA}')">${T_IAX_CODICONTRATO_REA.CMONEDA}</div>
                                                        </display:column>
                                                        </axis:visible>
                                                        <%--display:column title="${title9}" sortable="true" sortProperty="SCONAGR" headerClass="sortable fixed"  media="html" autolink="false" >                                    
                                                            <div class="dspText"><a href="javascript:f_seleccionar('${T_IAX_CODICONTRATO_REA.SCONTRA}')">${T_IAX_CODICONTRATO_REA.FECHA_INI}-${T_IAX_CODICONTRATO_REA.FECHA_FIN}</div>
                                                        </display:column--%>  
                                                     
                                                    </display:table>
                                                </div>                       
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </axis:ocultar>
            </table>
        </td>
    </tr>
</table>
<c:import url="../include/botonera_nt.jsp"><c:param name="f">axisrea001</c:param><c:param name="f">axisrea001</c:param><c:param name="__botones">cancelar,buscar<axis:visible f="axisrea001" c="BT_NUEVO">,nuevo</axis:visible>,aceptar</c:param></c:import>

</form>
<c:import url="../include/mensajes.jsp" />
</body>
</html>