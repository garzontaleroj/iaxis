<%--
/**
*  Fichero: axispro004.jsp
*  @author <a href = "mailto:xgallego@csi-ti.com">Xavier Gallego</a>
*  
*  T?tulo: Modal datos administración
*
*  Fecha: 21/04/2008
*/
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ page import="java.util.*" %>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>
<%@ page contentType="text/html;charset=iso-8859-15" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
    <title><axis:alt f="axispro004" c="LITERAL" lit="151090"/></title>
    <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
    <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
    <link rel="stylesheet" href="styles/displaytag.css">
    <c:import url="../include/carga_framework_js.jsp"/>
    <script type="text/javascript">
        function f_onload() { 
            revisarEstilos();
            var val1 = "<%=request.getAttribute("OK")%>"; 
            if (val1=="OK"){
                parent.f_aceptar_axispro002(${mntproducto.SPRODUC});
                this.f_but_cancelar();
            }
             f_cargar_propiedades_pantalla();    
       }
        
        function f_but_aceptar(){
          //  parent.f_aceptar_axispro004();
            if (objValidador.validaEntrada())
                document.miForm.submit()
        }
        
        function f_but_cancelar(){
            parent.f_cerrar_modal("axispro004");
        }
        
    </script>
</head>
<body onload="javascript:f_onload()">
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
    <form name="miForm" action="modal_axispro004.do" method="POST">
    <input type="hidden" name="operation" value="guardar" />
    <input type="hidden" name="SPRODUC" value="${mntproducto.SPRODUC}"/>
    <input type="hidden" name="subpantalla" value="administracion"/>
    
    <c:import url="../include/titulo_nt.jsp">
        <c:param name="titulo"><axis:alt f="axispro004" c="LITERAL" lit="1000220"/></c:param>
        <c:param name="formulario"><axis:alt f="axispro004" c="LITERAL" lit="1000220"/></c:param>
        <c:param name="form">axispro004</c:param>
    </c:import>
    <div class="separador">&nbsp;</div>
    <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
        <tr>
            <td>
                <table class="seccion">
                    <tr>
                        <th style="width:25%;height:0px"></th>
                        <th style="width:25%;height:0px"></th>
                        <th style="width:25%;height:0px"></th>
                        <th style="width:25%;height:0px"></th>
                    </tr>
                    <tr>
                        <td class="titulocaja">
                            <b><axis:alt f="axispro004" c="LITERAL" lit="1000478"/></b>
                        </td>
                        <c:choose>
                       <c:when test="${OB_IAX_PRODADMINISTRACION.TRECCOB != null }"> 
                            <td class="titulocaja">
                                <b><axis:alt f="axispro004" c="LITERAL" lit="1000484"/></b>
                            </td>
                        </c:when>
                        <c:otherwise> 
                        <input type="hidden" name="CRECCOB" value="${OB_IAX_PRODADMINISTRACION.CRECCOB}" />
                        </c:otherwise> 
                        </c:choose>
                        <td class="titulocaja">
                            <b><axis:alt f="axispro004" c="LITERAL" lit="1000479"/></b>
                        </td>
                        <td class="titulocaja">
                            <b><axis:alt f="axispro004" c="LITERAL" lit="1000480"/></b>
                        </td>
                    </tr>
                    <tr>
                        <td class="campocaja">
                            <select name="TTIPGES"  id="TTIPGES" size="1" onchange="javascript:void(0)" class="campowidthselect campo campotexto" style="width:93%;">                                        
                                <option value="null"> - <axis:alt f="axispro004" c="LITERAL" lit="108341"/> - </option>
                                <c:forEach var="TTIPGES" items="${axispro001_listaCtipges}" varStatus="status">
                                    <option <c:if test="${TTIPGES.TATRIBU == OB_IAX_PRODADMINISTRACION.TTIPGES}">selected</c:if> 
                                        value = "${TTIPGES.CATRIBU}">
                                        ${TTIPGES.TATRIBU}
                                    </option>
                                </c:forEach>
                            </select>
                        </td>
                        <c:choose>
                       <c:when test="${OB_IAX_PRODADMINISTRACION.TRECCOB != null }"> 
                            <td class="campocaja">
                                <select name="CRECCOB"  id="CRECCOB" size="1" onchange="javascript:void(0)" class="campowidthselect campo campotexto" style="width:93%;">                                        
                                    <option value="null"> - <axis:alt f="axispro004" c="LITERAL" lit="108341"/> - </option>
                                    <c:forEach var="TRECCOB" items="${axispro001_listaCreccob}" varStatus="status">
                                        <option <c:if test="${TRECCOB.CATRIBU == OB_IAX_PRODADMINISTRACION.CRECCOB}">selected</c:if> 
                                            value = "${TRECCOB.CATRIBU}">
                                            ${TRECCOB.TATRIBU}
                                        </option>
                                    </c:forEach>
                                </select>
                            </td>
                        </c:when>
                        <c:otherwise> 
                        </c:otherwise> 
                        </c:choose>
                        <td class="campocaja">
                            <select name="TTIPREB"  id="TTIPREB" size="1" onchange="javascript:void(0)" class="campowidthselect campo campotexto" style="width:93%;">                                        
                                <option value="null"> - <axis:alt f="axispro004" c="LITERAL" lit="108341"/> - </option>
                                <c:forEach var="TTIPREB" items="${axispro001_listaCtipreb}" varStatus="status">
                                    <option <c:if test="${TTIPREB.TATRIBU == OB_IAX_PRODADMINISTRACION.TTIPREB}">selected</c:if> 
                                        value = "${TTIPREB.CATRIBU}">
                                        ${TTIPREB.TATRIBU}
                                    </option>
                                </c:forEach>
                            </select>
                        </td>
                        <td class="campocaja">
                             <select name="TCALCOM"  id="TCALCOM" size="1" onchange="javascript:void(0)" class="campowidthselect campo campotexto" style="width:93%;">                                        
                                <option value="null"> - <axis:alt f="axispro004" c="LITERAL" lit="108341"/> - </option>
                                <c:forEach var="TCALCOM" items="${axispro001_listaCcalcom}" varStatus="status">
                                    <option <c:if test="${TCALCOM.TATRIBU == OB_IAX_PRODADMINISTRACION.TCALCOM}">selected</c:if> 
                                        value = "${TCALCOM.CATRIBU}">
                                        ${TCALCOM.TATRIBU}
                                    </option>
                                </c:forEach>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td class="titulocaja">
                            <b><axis:alt f="axispro004" c="LITERAL" lit="111136"/></b>
                        </td>
                        <td class="titulocaja">
                            <b><axis:alt f="axispro004" c="LITERAL" lit="1000481"/></b>
                        </td>
                        <td class="titulocaja">
                            <b><axis:alt f="axispro004" c="LITERAL" lit="1000482"/></b>
                            <input type="checkbox" name="CMOVDOM" value="${OB_IAX_PRODADMINISTRACION.CMOVDOM}" 
                            <c:if test="${OB_IAX_PRODADMINISTRACION.CMOVDOM == 1}">checked</c:if>
                            <axis:atr f="axispro001" c="CMOVDOM" a="modificable=false"/> />
                        </td>
                    </tr>
                     <tr>
                        <td class="campocaja">
                            <select name="TTIPPAG"  id="TTIPPAG" size="1" onchange="javascript:void(0)" class="campowidthselect campo campotexto" style="width:93%;"
                            obligatorio="true" title="<axis:alt f="axispro004" c="LITERAL" lit="111136"/>">                                        
                                <option value="null"> - <axis:alt f="axispro004" c="LITERAL" lit="108341"/> - </option>
                                <c:forEach var="TTIPPAG" items="${axispro001_listaCtippag}" varStatus="status">
                                    <option <c:if test="${TTIPPAG.TATRIBU == OB_IAX_PRODADMINISTRACION.TTIPPAG}">selected</c:if> 
                                        value = "${TTIPPAG.CATRIBU}">
                                        ${TTIPPAG.TATRIBU}
                                    </option>
                                </c:forEach>
                            </select>
                        </td>
                        <td class="campocaja">
                            <input type="text" name="NDIASPRO" value="${OB_IAX_PRODADMINISTRACION.NDIASPRO}" class="campowidthinput campo campotexto" style="width:90%"
                            <axis:atr f="axispro001" c="NDIASPRO" a="modificable=true"/> />
                        </td>
                        <td class="titulocaja">
                            <b><axis:alt f="axispro004" c="LITERAL" lit="140335"/></b>
                            <input type="checkbox" name="CFECCOB" value="${OB_IAX_PRODADMINISTRACION.CFECCOB}" 
                            <c:if test="${OB_IAX_PRODADMINISTRACION.CFECCOB == 1}">checked</c:if>
                            <axis:atr f="axispro001" c="CFECCOB" a="modificable=false"/>/>
                        </td>
                        <td class="titulocaja">
                            <b><axis:alt f="axispro004" c="LITERAL" lit="1000483"/></b>
                            <input type="checkbox" name="CRECFRA" value="${OB_IAX_PRODADMINISTRACION.CRECFRA}" 
                            <c:if test="${OB_IAX_PRODADMINISTRACION.CRECFRA == 1}">checked</c:if>
                            <axis:atr f="axispro001" c="CRECFRA" a="modificable=false"/> />
                        </td>
                    </tr>
                    <tr>
                        <td class="titulocaja">
                            <b><axis:alt f="axispro004" c="LITERAL" lit="1000334"/></b>
                        </td>
                         <td class="titulocaja">
                            <b><axis:alt f="axispro004" c="LITERAL" lit="9905956"/></b>
                        </td>
                    </tr>
                    <tr>
                        <td align="left">
                            <input type="text" name="IMINEXT" value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONEDAPROD]}' value='${OB_IAX_PRODADMINISTRACION.IMINEXT}'/>" class="campowidthinput campo campotexto" style="width:90%"
                            <axis:atr f="axispro001" c="IMINEXT" a="modificable=true"/> />
                        </td>
                        
                           <td align="left">
                            <input type="text" name="CNV_SPR" value="${OB_IAX_PRODADMINISTRACION.CNV_SPR}" class="campowidthinput campo campotexto" style="width:90%"
                            <axis:atr f="axispro001" c="CNV_SPR" a="modificable=true"/> />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <c:import url="../include/botonera_nt.jsp">
    <c:param name="f">axispro004</c:param>
    <c:param name="__botones">cancelar,aceptar</c:param></c:import>
    </form>
  <c:import url="../include/mensajes.jsp" />
</body>
</html>