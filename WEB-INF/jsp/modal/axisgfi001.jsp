<%/*
*  Fichero: axisgfi001.jsp
*
*  @author <a href = "mailto:xgallego@csi-ti.com">Xavier Gallego</a>
*
*  Fecha: 15/04/2008
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
        parent.f_cerrar_axisgfi001();
    }
    
    function f_but_buscar() {
        var CLAVE = objDom.getValorPorId("clave");
        var CODIGO = objDom.getValorPorId("codigo");
        var FORMULA = objDom.getValorPorId("formula");
        var RAMO = objDom.getValorPorId("lista_ramos");
        var RASTRO = objDom.getValorPorId("lista_rastros");
        var UTILIDAD = objDom.getValorPorId("lista_utilis");
        
        if (objValidador.validaEntrada())
            parent.f_aceptar_axisgfi001(CLAVE, CODIGO, FORMULA, RAMO, RASTRO, UTILIDAD);
    }
    
    function f_but_nuevo() {
        parent.f_nuevo_axisgfi001();
    }
    
    function f_onload() {
        revisarEstilos();
        document.miForm.lista_clave.focus();
        
        f_cargar_propiedades_pantalla();
    }
    
    function f_actualiza_clave(obj){
        if(!objUtiles.utilEquals(obj.value, "null"))
            objDom.setValorPorId("clave", obj.value);
        else objDom.setValorPorId("clave", "");
    }
    </script>
  </head>
  <body onload="f_onload()" onkeypress="if (event.keyCode==13)  { f_but_aceptar() }">
  <c:import url="../include/precargador_ajax.jsp"><c:param name="imagen" value="images/ajax-loader.gif"></c:param></c:import>
<form name="miForm" action="modal_axisgfi001.do" method="POST"> 
<input type="hidden" name="operation" value="aceptar" />

<c:import url="../include/titulo_nt.jsp">
    <c:param name="formulario"><axis:alt f="axisgfi001" c="axisgfi001" lit="1000202" /></c:param>
    <c:param name="form">axisgfi001</c:param>
</c:import>
<table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
    <tr>
        <td>
            <!--campos-->
            <table class="seccion">
                <tr>
                    <th style="height:0px;width:2%"></th>
                    <th style="height:0px;width:20%"></th>
                    <th style="height:0px;width:20%"></th>
                    <th style="height:0px;width:20%"></th>
                    <th style="height:0px;width:20%"></th>
                </tr>
                <tr>
                    <td>
                        &nbsp;
                    </td>
                    <axis:visible f="axisgfi001" c="CLAVE">
                        <td class="titulocaja">
                            <b><axis:alt f="axisgfi001" c="CLAVE" lit="1000085" /></b>
                        </td>
                    </axis:visible>
                </tr>
                <tr>
                    <td>
                        &nbsp;
                    </td>
                    <axis:visible f="axisgfi001" c="CLAVE">
                        <td class="campocaja" colspan="4">
                            <input type="text" class="campowidthinput campo campotexto" id="clave" name="clave" style="width:7%"
                            size="15" value="" title="<axis:alt f="axisgfi001" c="CLAVE" lit="1000085"/>" <axis:atr f="axisgfi001" c="CLAVE" a="modificable=true"/>/>
                            &nbsp;&nbsp;&nbsp;
                            <select style="width:35.3%;" name = "lista_clave" id ="lista_clave" size="1" onchange="f_actualiza_clave(this)" 
                                class="campowidthselect campo campotexto">&nbsp;
                                <option value = "null"> - <axis:alt f="axisgfi001" c="BLANCO" lit="108341"/> - </option>
                                <c:forEach var="claves" items="${requestScope.axisgfi_listaClaves}">
                                    <option value = "${claves.CLAVE}">${claves.CLAVE_CODIGO} </option>
                                </c:forEach>
                            </select>
                        </td>
                    </axis:visible>
                </tr>
                <tr>
                    <td>
                        &nbsp;
                    </td>
                    <axis:visible f="axisgfi001" c="CODIGO">                
                        <td class="titulocaja">
                            <b><axis:alt f="axisgfi001" c="CODIGO" lit="1000109" /></b>
                        </td>                
                    </axis:visible>
                    <axis:visible f="axisgfi001" c="CRAMO">
                        <td class="titulocaja">
                            <b><axis:alt f="axisgfi001" c="CRAMO" lit="100784" /></b>
                        </td>
                    </axis:visible>
                    <axis:visible f="axisgfi001" c="CRASTRO">
                        <td class="titulocaja">
                            <b><axis:alt f="axisgfi001" c="CRASTRO" lit="1000105" /></b>
                        </td>
                    </axis:visible>
                    <axis:visible f="axisgfi001" c="CUTILI">
                        <td class="titulocaja">
                            <b><axis:alt f="axisgfi001" c="CUTILI" lit="108616" /></b>
                        </td>
                    </axis:visible>
                </tr>
                <tr>
                    <td>
                        &nbsp;
                    </td>
                    <axis:visible f="axisgfi001" c="CODIGO">                
                        <td class="campocaja" colspan="1">
                            <input style="width:30.6%;" type="text" class="campowidthinput campo campotexto" id="codigo" name="codigo" 
                            size="15" value="" title="<axis:alt f="axisgfi001" c="CODIGO" lit="1000109"/>" <axis:atr f="axisgfi001" c="CODIGO" a="modificable=true"/>/>
                        </td>
                    </axis:visible>
                    <axis:visible f="axisgfi001" c="CRAMO">
                        <td class="campocaja" >
                            <select style="width:85%;" name = "lista_ramos" id ="lista_ramos" size="1" 
                                class="campowidthselect campo campotexto">&nbsp;
                                <option value = "null"> - <axis:alt f="axisgfi001" c="CRAMO" lit="108341"/> - </option>
                                <c:forEach var="ramos" items="${requestScope.axisgfi_listaRamos}">
                                    <option value = "${ramos.CRAMO}">${ramos.TRAMO} </option>
                                </c:forEach>
                            </select>
                        </td>
                    </axis:visible>
                    <axis:visible f="axisgfi001" c="CRASTRO">
                        <td class="campocaja">
                            <select style="width:55%;" name = "lista_rastros" id ="lista_rastros" size="1" 
                                class="campowidthselect campo campotexto">&nbsp;
                                <option value = "null"> - <axis:alt f="axisgfi001" c="CRASTRO" lit="108341"/> - </option>
                                <c:forEach var="rastros" items="${requestScope.axisgfi_listaRastros}">
                                    <option value = "${rastros.CATRIBU}">${rastros.TATRIBU} </option>
                                </c:forEach>
                            </select>
                        </td>
                    </axis:visible>
                    <axis:visible f="axisgfi001" c="CUTILI">
                        <td class="campocaja" >
                            <select style="width:55%;" name = "lista_utilis" id ="lista_utilis" size="1" 
                                class="campowidthselect campo campotexto">&nbsp;
                                <option value = "null"> - <axis:alt f="axisgfi001" c="CUTILI" lit="108341"/> - </option>
                                <c:forEach var="utilis" items="${requestScope.axisgfi_listaUtilis}">
                                    <option value = "${utilis.CATRIBU}" >${utilis.TATRIBU} </option>
                                </c:forEach>
                            </select>
                        </td>
                    </axis:visible>
                </tr>
                <axis:visible f="axisgfi001" c="FORMULA">
                <tr>
                    <td>
                        &nbsp;
                    </td>
                    <td class="titulocaja">
                        <b><axis:alt f="axisgfi001" c="FORMULA" lit="108347" /></b>
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;
                    </td>
                    <td class="campocaja" colspan="4">
                        <textarea class="campo campotexto" name="formula" id="formula"></textarea>
                    </td>
                </tr>
                </axis:visible>                
            </table>
        </td>
    </tr>
</table>
<c:import url="../include/botonera_nt.jsp"><c:param name="f">axisgfi001</c:param><c:param name="f">axisgfi001</c:param><c:param name="__botones">cancelar<axis:visible f="axisgfi001" c = "BT_NUEVO">,nuevo</axis:visible>,buscar</c:param></c:import>

</form>
<c:import url="../include/mensajes.jsp" />
</body>
</html>
