<%/*
*  Fichero: axismap003.jsp
*  @author <a href = "mailto:lcalvo@csi-ti.com">Luz Calvo</a>
*
*  Fecha: 22/10/2010
*/
%>
<%@ page contentType="text/html;charset=windows-1252" errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ page import="java.util.List" %>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<html>
  <head>
    <link rel="stylesheet" href="styles/genericosHtml.css" type="text/css">
    <link rel="stylesheet" href="styles/axisnt.css" type="text/css">
    <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>
    
    
    <c:import url="../include/carga_framework_js.jsp" />
    <script language="Javascript" type="text/javascript">

        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/

        function f_onload() {
          revisarEstilos();
          
          CMAPEAD_SALIDA = "${__formdata.CMAPEAD_SALIDA}";
          
            if (!objUtiles.estaVacio(CMAPEAD_SALIDA)) 
                parent.f_aceptar_axismap003('axismap003',CMAPEAD_SALIDA);
        }
        
      function  f_cerrar_modal(pantalla){
       objUtiles.cerrarModal(pantalla);
          
      }
      
      function f_aceptar_axismap009(){
            objUtiles.cerrarModal('axismap009');
            objUtiles.ejecutarFormulario("modal_axismap003.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);
         
      }
      
       function f_aceptar_axismap010(){
            objUtiles.cerrarModal('axismap010');
            objUtiles.ejecutarFormulario("modal_axismap003.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);
          
      }
        

       function f_but_cancelar() {
                parent.f_cerrar_modal('axismap003');
      }
        function f_but_aceptar() {          
             objUtiles.ejecutarFormulario("modal_axismap003.do", "guardar", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
          
          function f_axismap009_editar(CMAPEAD,CMAPCOM){
            objUtiles.abrirModal("axismap009", "src", "modal_axismap009.do?operation=form&CMAPEAD=" + CMAPEAD+"&CMAPCOM="+CMAPCOM ,600,300);
          }
          
          
          function f_del_mapcomodin(CMAPEAD,CMAPCOM){
            objUtiles.ejecutarFormulario("modal_axismap003.do?CMAPCOM="+CMAPCOM, "borrar", document.miForm, "_self", objJsMessages.jslit_cargando);
          }
          
          function f_axismap010_editar(CMAPEAD,CTABLA,NVECES){
            objUtiles.abrirModal("axismap010", "src", "modal_axismap010.do?operation=form&CMAPEAD=" + CMAPEAD+"&CTABLA="+CTABLA+"&NVECES="+NVECES);
          }
          
          
          function f_del_mapcabtratar(CMAPEAD,CTABLA,NVECES){
            objUtiles.ejecutarFormulario("modal_axismap003.do?CTABLA="+CTABLA+"&NVECES="+NVECES, "borrar_cabtratar", document.miForm, "_self", objJsMessages.jslit_cargando);
          }

                
    </script>
  </head>
    <body class=" " onload="f_onload()"  >
     
              <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
 
        
        <c:import url="../include/modal_estandar.jsp">
          <c:param name="titulo">
           <axis:alt f="axismap003" c="TIT_MDL009" lit="9903579"/>
          </c:param>
          <c:param name="nid" value="axismap009"/>
        </c:import>
         <c:import url="../include/modal_estandar.jsp">
          <c:param name="titulo">
           <axis:alt f="axismap003" c="TIT_MDL010" lit="9903583"/>
          </c:param>
          <c:param name="nid" value="axismap010"/>
        </c:import>
         <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt f="axismap003" c="TITULO" lit="9901577"/></c:param>
                <c:param name="producto"><axis:alt f="axismap003" c="TITULO" lit="9901577"/></c:param>
                <c:param name="form">axismap003</c:param>
            </c:import>
        <form name="miForm" action="" method="POST">
            <input type="hidden" name="operation" value=""/>
            <input type="hidden" name="SPERSON" id="SPERSON" value="" />
            <input type="hidden" name="SNIP" id="SNIP" value="" />
          

            <!-- Area de campos  -->
            <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <!--campos-->
                        <table class="seccion">
                            <tr>
                                <td>
                                    <!-- Área 1 -->
                                    <table class="area" align="center">
                                        <tr>
                <th style="width:33%;height:0px"></th>
                <th style="width:33%;height:0px"></th>
                <th style="width:33%;height:0px"></th>

                    <tr>
                         <c:if test="${!empty __formdata.CMAPEAD}">
                          <td class="titulocaja"><b><axis:alt f="axismap003" c="CMAPEAD" lit="9901582"/></b></td> <%-- Map --%>
                         </c:if>
                          <td class="titulocaja"><b><axis:alt f="axismap003" c="TRACTAMENT" lit="9002150"/></b></td><%-- Tratamiento --%>
                    </tr>
                     <tr>
                     <c:if test="${!empty __formdata.CMAPEAD}">
                          <td class="campocaja">
                             <input type="text" class="campowidthinput campo campotexto" size="15" style="width:90%;"
                              <axis:atr f="axisctr019" c="CMAPEAD" a="modificable=false"/>
                            value="${__formdata.CMAPEAD}" name="CMAPEAD" id="CMAPEAD" />
                        </td>
                    </c:if>
                      <td class="campocaja">
                       <select name="TTIPOTRAT" style="width:93%" 
                                    id="TTIPOTRAT" size="1" onchange=""
                                     <axis:atr f="axisctr019" c="TRACTAMENT" a="isInputText=false"/>
                                    class="campowidthselect campo campotexto">&nbsp;
                                  <option value="null">
                                        - <axis:alt f="axismap003" c="SNV_COMBO" lit="108341"/> -
                                  </option>
                                  <c:forEach var="ramo"
                                             items="${__formdata.lstTractament}">
                                        <option value="${fn:substring(ramo.TATRIBU,0,1)}"
                                                <c:if test="${!empty __formdata.TTIPOTRAT && __formdata.TTIPOTRAT == fn:substring(ramo.TATRIBU,0,1)}">selected</c:if>>
                                             ${ramo.TATRIBU}
                                        </option>
                                  </c:forEach>
                            </select>
                      </td>
                      </tr>
                      <tr>
                      <td class="titulocaja" colspan="2"><b><axis:alt f="axismap003" c="TDESMAP" lit="101761"/></b></td><%-- Descripción  --%>
                      <td class="titulocaja"><b><axis:alt f="axismap003" c="TPARPATH" lit="9901583"/></b></td><%-- Path --%>
                    </tr>
                    <tr>
                      <td class="campocaja" colspan="2">
                       <input type="text" class="campowidthinput campo campotexto" size="15" style="width:95%;"
                    value="${__formdata.TDESMAP}" name="TDESMAP" id="TDESMAP"
                    <axis:atr f="axisctr019" c="TDESMAP" a="modificable=true"/>
                    />
                      </td>
                       <td class="campocaja">
                       <input type="text" class="campowidthinput campo campotexto" size="15" style="width:90%;"
                       <axis:atr f="axisctr019" c="TPARPATH" a="modificable=true"/>
                       value="${__formdata.TPARPATH}" name="TPARPATH" id="TPARPATH" />
                    
                       </td>
                    </tr>
                    <tr>
                      <td class="titulocaja"><b><axis:alt f="axismap003" c="CMANTEN" lit="9901584"/></b></td> <%-- Mostrar --%>
                      <td class="titulocaja"><b><axis:alt f="axismap003" c="CSEPARADOR" lit="9901585"/></b></td> <%-- Separador --%>
                      <td class="titulocaja"><b><axis:alt f="axismap003" c="TTIPOMAP" lit="100565"/></b></td> <%-- Tipo --%>
                    </tr>
                    <tr>
                    <td class="campocaja">
                       <input type="text" class="campowidthinput campo campotexto" size="15" style="width:90%;"
                    value="${__formdata.CMANTEN}" name="CMANTEN" id="CMANTEN"   <axis:atr f="axisctr019" c="CMANTEN" a="modificable=true"/>/>
                    
                       </td>
                      <td class="campocaja">
                       <input type="text" class="campowidthinput campo campotexto" size="15" style="width:90%;"
                    value="${__formdata.CSEPARADOR}" name="CSEPARADOR" id="CSEPARADOR" <axis:atr f="axisctr019" c="CSEPARADOR" a="modificable=true"/>/>
                    
                      </td>
                       <td class="campocaja">
                       <select name="TTIPOMAP" style="width:93%" <axis:atr f="axisctr019" c="TTIPOMAP" a="isInputText=false"/>
                                    id="TTIPOMAP" size="1" onchange=""
                                    class="campowidthselect campo campotexto">&nbsp;
                                  <option value="null">
                                        - <axis:alt f="axismap003" c="SNV_COMBO" lit="108341"/> -
                                  </option>
                                  <c:forEach var="ramo"
                                             items="${__formdata.lstTipus}">
                                        <option value="${ramo.CATRIBU}"
                                                <c:if test="${!empty __formdata.TTIPOMAP && __formdata.TTIPOMAP == ramo.CATRIBU}">selected</c:if>>
                                             ${ramo.TATRIBU}
                                        </option>
                                  </c:forEach>
                            </select>
                      </td>
                       
                    </tr>
                    <tr>
                      <td class="titulocaja" colspan="3"><b><axis:alt f="axismap003" c="TCOMENTARIO" lit="9901586"/></b></td><%-- Comentarios --%>
                    </tr>
                    <tr>
                      <td class="campocaja" colspan="3">
                      <textarea class="campo campotexto" <axis:atr f="axisctr019" c="TCOMENTARIO" a="isInputText=false"/> style="width:100%;" name="TCOMENTARIO" id="TCOMENTARIO">${__formdata.TCOMENTARIO}</textarea>
                       </td>
                    </tr>
                     <tr>
                      <td class="titulocaja"  colspan="3"><b><axis:alt f="axismap003" c="TPARAMETROS" lit="103694"/></b></td><%-- Parámetros --%>
                    </tr>
                    <tr>
                      <td class="campocaja" colspan="3">
                      <textarea class="campo campotexto"  <axis:atr f="axisctr019" c="TPARAMETROS" a="isInputText=false"/> style="width:100%;" name="TPARAMETROS" id="TPARAMETROS">${__formdata.TPARAMETROS}</textarea>
                       </td>
                    </tr>
                    
 <c:if test="${!empty __formdata.CMAPEAD}">
                    
                    <tr>
                      <td class="campocaja">
                      <div  style="float:right;">
                        <axis:visible f="axismap003" c="BT_NUEVOMAP">
                            <img border="0"
                                 alt='<axis:alt f="axismap001" c="BT_NUEVOMAP" lit="1000428"/>'
                                 title='<axis:alt f="axismap001" c="BT_NUEVOMAP" lit="1000428"/>'
                                 src="images/new.gif"
                                 onclick="f_axismap009_editar('${__formdata.CMAPEAD}','')"/>
                          </axis:visible>
                      </div>
                      <c:set var="title01"><axis:alt f="axisctr019" c="CMAPCOM" lit="9903579"/></c:set>  
                        <div class="displayspace">
                                      <display:table name="${__formdata.comodin}"
                                                     id="miListaId"
                                                     export="false"
                                                     class="dsptgtable"
                                                     cellpadding="0"
                                                     cellspacing="0" 
                                                     requestURI="">
                                            <%@ include file="../include/displaytag.jsp"%>


                                            <display:column title="${title01}"
                                                            sortProperty=""
                                                            headerClass="headwidth20 sortable"
                                                            media="html" style="width:90%"
                                                            autolink="false">
                                                  <div class="dspText">
                                                        ${miListaId.CMAPCOM}
                                                  </div>
                                            </display:column> 
                                            <%--display:column title=""
                                                            sortProperty=""
                                                            headerClass="headwidth20 sortable"
                                                            media="html" style="width:10%"
                                                            autolink="false">
                                                  <div class="dspIcons">
                                                         <img border="0"
                                                           alt="<axis:alt f="axismap003" c="BT_EDITMAP" lit="9901356"/>"
                                                           title="<axis:alt f="axismap003" c="BT_EDITMAP" lit="9901356"/>"
                                                           src="images/lapiz.gif"
                                                           onclick="f_axismap009_editar('${__formdata.CMAPEAD}','${miListaId.CMAPCOM}')"/>
                                                  </div>
                                            </display:column--%> 
                                             <display:column title=""
                                                            sortProperty=""
                                                            headerClass="headwidth20 sortable"
                                                            media="html" style="width:10%"
                                                            autolink="false">
                                                  <div class="dspIcons">
                                                         <img border="0"
                                                           alt="<axis:alt f="axismap003" c="BT_DELMAP" lit="9901356"/>"
                                                           title="<axis:alt f="axismap003" c="BT_DELMAP" lit="9901356"/>"
                                                           src="images/delete.gif"
                                                           onclick="f_del_mapcomodin('${__formdata.CMAPEAD}','${miListaId.CMAPCOM}')"/>
                                                  </div>
                                            </display:column> 
                                            </display:table>
                       </td>
                    </tr>
                    
<tr>
                      <td class="campocaja" colspan="4">
                        <div  style="float:right;">
                        <axis:visible f="axismap003" c="BT_NUEVOMAP">
                            <img border="0"
                                 alt='<axis:alt f="axismap001" c="BT_NUEVOMAP" lit="1000428"/>'
                                 title='<axis:alt f="axismap001" c="BT_NUEVOMAP" lit="1000428"/>'
                                 src="images/new.gif"
                                 onclick="f_axismap010_editar('${__formdata.CMAPEAD}','','')"/>
                          </axis:visible>
                      </div>                
                      
                                  <c:set var="title01"><axis:alt f="axisctr019" c="CTABLA" lit="9903578"/></c:set>  
                                  <c:set var="title02"><axis:alt f="axisctr019" c="NVECES" lit="9901593"/></c:set>  
                                  <c:set var="title03"><axis:alt f="axisctr019" c="TRACTAMENT" lit="100565"/></c:set>  
                                  <c:set var="title04"><axis:alt f="axisctr019" c="CPARAM" lit="9903575"/></c:set>  
                                  <c:set var="title05"><axis:alt f="axisctr019" c="CPRAGMA" lit="9903576"/></c:set>  
                                  
                                          
                        <div class="displayspace">
                                      <display:table name="${__formdata.cabtratar}"
                                                     id="miListaId"
                                                     export="false"
                                                     class="dsptgtable"
                                                     cellpadding="0"
                                                     cellspacing="0"
                                                     requestURI="">
                                            <%@ include file="../include/displaytag.jsp"%>


                                            <display:column title="${title01}"
                                                            sortProperty=""
                                                            headerClass="headwidth20 sortable"
                                                            media="html"
                                                            autolink="false">
                                                  <div class="dspText">
                                                        ${miListaId.CTABLA}
                                                  </div>
                                            </display:column>
                                            <display:column title="${title02}"
                                                            sortProperty=""
                                                            headerClass="headwidth20 sortable"
                                                            media="html"
                                                            autolink="false">
                                                  <div class="dspText">
                                                        ${miListaId.NVECES}
                                                  </div>
                                            </display:column>
                                            <display:column title="${title03}"
                                                            sortProperty=""
                                                            headerClass="headwidth20 sortable"
                                                            media="html"
                                                            autolink="false">
                                                  <div class="dspText">
                                                  <select name="TRACTAMENT" style="width:93%" disabled
                                    id="TRACTAMENT" size="1" onchange=""
                                    class="campowidthselect campo campotexto">&nbsp;
                                  <option value="null">
                                        - <axis:alt f="axismap003" c="SNV_COMBO" lit="108341"/> -
                                  </option>
                                  <c:forEach var="tractament"
                                             items="${__formdata.lstQuery}">
                                        <option value="${tractament.CATRIBU}"
                                                <c:if test="${!empty  miListaId.TSENTEN && miListaId.TSENTEN == fn:substring(tractament.TATRIBU,0,1)}">selected</c:if>>
                                             ${tractament.TATRIBU}
                                        </option>
                                  </c:forEach>
                            </select>
                                                       
                                                  </div>
                                            </display:column>
                                            <display:column title="${title04}"
                                                            sortProperty=""
                                                            headerClass="headwidth20 sortable"
                                                            media="html"
                                                            autolink="false">
                                                  <div class="dspText">
                                                        ${miListaId.CPARAM}
                                                  </div>
                                            </display:column>
                                            <display:column title="${title05}"
                                                            sortProperty=""
                                                            headerClass="headwidth20 sortable"
                                                            media="html"
                                                            autolink="false">
                                                  <div class="dspText">
                                                        ${miListaId.CPRAGMA}
                                                  </div>
                                            </display:column>
                                             <display:column title=""
                                                            sortProperty=""
                                                            headerClass="headwidth20 sortable"
                                                            media="html" style="width:10%"
                                                            autolink="false">
                                                  <div class="dspIcons">
                                                         <img border="0"
                                                           alt="<axis:alt f="axismap003" c="BT_DELMAP" lit="9901356"/>"
                                                           title="<axis:alt f="axismap003" c="BT_DELMAP" lit="9901356"/>"
                                                           src="images/lapiz.gif"
                                                           onclick="f_axismap010_editar('${__formdata.CMAPEAD}','${miListaId.CTABLA}','${miListaId.NVECES}')"/>
                                                  </div>
                                            </display:column> 
                                            <display:column title=""
                                                            sortProperty=""
                                                            headerClass="headwidth20 sortable"
                                                            media="html" style="width:10%"
                                                            autolink="false">
                                                  <div class="dspIcons">
                                                         <img border="0"
                                                           alt="<axis:alt f="axismap003" c="BT_DELMAP" lit="9901356"/>"
                                                           title="<axis:alt f="axismap003" c="BT_DELMAP" lit="9901356"/>"
                                                           src="images/delete.gif"
                                                           onclick="f_del_mapcabtratar('${__formdata.CMAPEAD}','${miListaId.CTABLA}','${miListaId.NVECES}')"/>
                                                  </div>
                                            </display:column> 
                                            </display:table>
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
            
            <div class="separador">&nbsp;</div>
            <c:import url="../include/botonera_nt.jsp"><c:param name="f">axismap003</c:param>
                    <c:param name="__botones">cancelar,aceptar</c:param>
            </c:import>
        </form>
    <c:import url="../include/mensajes.jsp" />
    </body>
</html>

