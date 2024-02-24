<%--
*  Fichero: axisgfi031.jsp
*  @author <a href = "mailto:xjrodriguez@csi-ti.com">Jonny Rodriguez</a>
*
*  Fecha: 29/03/2012
*/
--%>
<%@ page contentType="text/html;charset=windows-1252" errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%> 
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ page import="axis.util.Constantes" %>
<%@ page import="java.util.*" %>
<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<html>
  <head>
    <link rel="stylesheet" href="styles/genericosHtml.css" type="text/css">
    <link rel="stylesheet" href="styles/axisnt.css" type="text/css">
    <c:import url="../include/carga_framework_js.jsp" />
    <script language="Javascript" type="text/javascript">

        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/

        function f_onload() {
            <c:if test="${!empty loading}" >
            sclave = "${__formdata.CLAVE_OUT}";
            parent.f_aceptar_axisgfi031(sclave);
            </c:if>
            f_cargar_propiedades_pantalla();
        }
        
        function f_but_cancelar() {
            parent.f_cerrar_axisgfi031();
        }
        
        function f_but_aceptar() {
          if (objValidador.validaEntrada()){
            document.axisgfi031Form.PCLAVE.value=document.axisgfi031Form.CLAVE.value;
            objUtiles.ejecutarFormulario ("modal_axisgfi031.do", "grabar_formula", document.axisgfi031Form, "_self", objJsMessages.jslit_cargando);
         }
        }
        
        function f_check(check){
            check.value = check.checked ? 1 : 0;
        }
                
        /****************************************************************************************/
        /************************************** MODAL *******************************************/
        /****************************************************************************************/
                

        
        /****************************************************************************************/
        /*********************************** CALLBACK AJAX **************************************/
        /****************************************************************************************/      
          
    </script>
  </head>
  <body onload="f_onload()" onkeypress="if (event.keyCode==13)  { f_but_aceptar() }" >
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
        
        <form name="axisgfi031Form" action="modal_axisgfi031.do" method="POST">
            <input type="hidden" name="operation" value=""/>
            <input type="hidden" name="loading" value="0"/>
            <input type="hidden" name="PCLAVE" value=""/>
            <c:if test="${empty last_operation}">
                <input type="hidden" name="CLAVE" value=""/>        
            </c:if>
        
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt f="axisgfi031" c="TITULO_AXISGFI031" lit="1000018" /></c:param>
                <c:param name="producto"><axis:alt f="axisgfi031" c="TITULO_AXISGFI031" lit="1000018" /></c:param>
                <c:param name="form">axisgfi031</c:param>
            </c:import>
            <c:import url="../include/modal_estandar.jsp">
                    <c:param name="titulo"></c:param>
                    <c:param name="nid" value="axisgfi031" />
            </c:import>
            
            <!-- Area de campos  -->
            <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0" style="height:130px">
                <div class="separador">&nbsp;</div>
                <tr>
                    <td>
              <table>
                <tr>
                    <th style="width:33%;height:0px">&nbsp;</th>
                    <th style="width:33%;height:0px">&nbsp;</th>
                    <th style="width:33%;height:0px">&nbsp;</th>
                </tr>
                <tr>
                    <c:if test="${!empty last_operation}">
                    <td class="titulocaja">
                        <b><axis:alt f="axisgfi031" c="CLAVE" lit="1000085"/></b>
                    </td>
                    </c:if>
                    <axis:visible f="axisgfi031" c="CRASTRO">
                    <td class="titulocaja">
                        <b><axis:alt f="axisgfi031" c="CRASTRO" lit="1000105"/></b>
                    </td>
                  </axis:visible>
                  <axis:visible f="axisgfi031" c="SUMATORIO">
                    <td class="titulocaja">
                        <b><axis:alt f="axisgfi031" c="SUMATORIO" lit="151750"/></b>
                        <input onclick="f_check(this)" type="checkbox"
                               id="SUMATORIO" name="SUMATORIO"
                               <c:if test="${__formdata.SUMATORIO == 1}">checked</c:if>
                               value="${__formdata.SUMATORIO}" />
                    </td>
                  </axis:visible>
                </tr>
                <tr>
                    <c:if test="${!empty last_operation}">
                    <td class="campocaja">
                        <input type="text" style="width:75%"
                               class="campowidthinput campo campotexto"
                               id="CLAVE" name="CLAVE" size="15"
                               value="${__formdata.CLAVE}"
                                <axis:atr f="axisgfi031" c="CLAVE" a="obligatorio=true&modificable=false"/> />
                    </td>
                    </c:if>
                    <axis:visible f="axisgfi031" c="CRASTRO">
                    <td class="campocaja">
                                <select name="CRASTRO" style="width:93%"
                                        id="CRASTRO" size="1" onchange=""
                                        class="campowidthselect campo campotexto">&nbsp;
                                      <option value="null">
                                            - <axis:alt f="axisgfi031" c="BLANCO" lit="108341"/> -
                                      </option>
                                      <c:forEach var="rastro"
                                                 items="${axisgfi002_datos_formula.RASTRO}"
                                                 varStatus="status">
                                            <option value="${rastro.CATRIBU}"
                                                    <c:if test="${__formdata.CRASTRO == rastro.CATRIBU}">selected</c:if>>
                                                  ${rastro.TATRIBU}
                                            </option>
                                      </c:forEach>
                                </select>
                    </td>
                  </axis:visible>
                </tr>
                <tr>
                    <td class="titulocaja">
                        <b><axis:alt f="axisgfi031" c="CODIGO" lit="1000109"/></b>
                    </td>
                    <td class="titulocaja">
                            <b><axis:alt f="axisgfi031" c="DESCRIPCION" lit="100588"/></b>
                      </td>
                </tr>
                <tr>
                  <td class="campocaja" colspan="1">
                        <input type="text" style="width:75%"
                               class="campowidthinput campo campotexto"
                                <axis:atr f="axisgfi031" c="CODIGO" a="obligatorio=true"/>
                               id="CODIGO" name="CODIGO" size="15"
                               title="<axis:alt f="axisgfi031" c="CODIGO" lit="1000109"/>"
                               value="${__formdata.CODIGO}" />
                  </td>
                  <td class="campocaja" colspan="2">
                            <input type="text" style="width:93%"
                                <axis:atr f="axisgfi031" c="DESCRIPCION" a="obligatorio=true"/>
                                 title="<axis:alt f="axisgfi031" c="DESCRIPCION" lit="100588"/>"
                                   class="campowidthinput campo campotexto"
                                   id="DESCRIPCION" name="DESCRIPCION"
                                   size="15"
                                   value="${__formdata.DESCRIPCION}"
                                   maxsize="50"/>
                      </td>
                </tr>
                <tr>
                      <td class="titulocaja">
                            <b id="label_FORMULA"><axis:alt f="axisgfi031" c="FORMULA" lit="149926"/></b>
                      </td>
                </tr>
                <tr>
                      <td class="campocaja" colspan="3">
                            <textarea class="campo campotexto" 
                            <axis:atr f="axisgfi031" c="FORMULA" a="obligatorio=true&isInputText=false"/>
                            title="<axis:alt f="axisgfi031" c="FORMULA" lit="149926"/>"
                            style="width:95%;height:40px;font-size:11px;font-family:Arial;" name="FORMULA" id="FORMULA">${__formdata.FORMULA}</textarea>
                      </td>
                </tr>
                <tr>
                    <td class="titulocaja">
                        <b><axis:alt f="axisgfi031" c="CRAMO" lit="100784"/></b>
                    </td>
                    <td class="titulocaja">
                                <b><axis:alt f="axisgfi031" c="CUTILI" lit="108616"/></b>
                    </td>
                </tr>
                <tr>
                      <td class="campocaja">
                            <select name="CRAMO" style="width:93%"
                                    id="CRAMO" size="1" onchange=""
                                    class="campowidthselect campo campotexto">&nbsp;
                                  <option value="null">
                                        - <axis:alt f="axisgfi031" c="BLANCO" lit="108341"/> -
                                  </option>
                                  <c:forEach var="ramo"
                                             items="${axisgfi002_datos_formula.RAMO}"
                                             varStatus="status">
                                        <option value="${ramo.CRAMO}"
                                                <c:if test="${__formdata.CRAMO == ramo.CRAMO}">selected</c:if>>
                                              ${ramo.TRAMO}-${ramo.CRAMO}
                                        </option>
                                  </c:forEach>
                            </select>
                      </td>
                      <td class="campocaja" colspan="2">
                                <select name="CUTILI" style="width:93%"
                                        id="CUTILI" size="1" onchange=""
                                        class="campowidthselect campo campotexto">&nbsp;
                                      <option value="null">
                                            - <axis:alt f="axisgfi031" c="BLANCO" lit="108341"/> -
                                      </option>
                                      <c:forEach var="util"
                                                 items="${axisgfi002_datos_formula.UTIL}"
                                                 varStatus="status">
                                            <option value="${util.CATRIBU}"
                                                    <c:if test="${__formdata.CUTILI == util.CATRIBU}">selected</c:if>>
                                                  ${util.TATRIBU}
                                            </option>
                                      </c:forEach>
                                </select>
                        </td>
                </tr>
              </table>
            
            <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisgfi031</c:param>
                <c:param name="__botones">cancelar,aceptar</c:param>
            </c:import>
            <c:import url="../include/mensajes.jsp" />
        </form>
  </body>
</html>