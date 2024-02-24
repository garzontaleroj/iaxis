<%--
/**
*  Fichero: axissin031.jsp
*  @author <a href = "mailto:lcalvo@csi-ti.com">Luz Calvo</a>
* 
*  
*  T?tulo: Modal Búsqueda Causas Estado
*
*  Fecha: 10/08/2009
*/
--%>


<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ page import="java.util.*" %>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>
    <c:set var="linea_trami" value="${__formdata.indexTramitacio}"/> <!-- ${LINEATRAM} -->
<%@ page contentType="text/html;charset=iso-8859-15" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
    <title><fmt:message key="151090"/></title>
    <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
    <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
    <link rel="stylesheet" href="styles/displaytag.css">
    <c:import url="../include/carga_framework_js.jsp"/>
    <script type="text/javascript">
       
        function f_onload() { 
        revisarEstilos();
        
        var val1 = "<%=request.getAttribute("OK")%>"; 
      
            if (val1=="OK"){
                //this.f_but_cancelar();
                //alert("Antes de llamada");
                parent.f_aceptar_axissin031();
            }
        
        }
      
        function f_but_aceptar(){
            if (objValidador.validaEntrada()) {
            objUtiles.ejecutarFormulario ("modal_axissin031.do", "guardar", document.miForm, "_self", objJsMessages.jslit_cargando);   
            }
        }
        
        function f_but_cancelar(){
            parent.f_cerrar_modal("axissin031");
        }
      
      
    </script>
</head>
<body onload="javascript:f_onload()">
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
          
          
    <form name="miForm" action="" method="POST">
        <input type="hidden" name="operation" value="guardar" />
        <input type="hidden" name="NSINIES" value="${__formdata.NSINIES}"/>
      
    
    <c:import url="../include/titulo_nt.jsp">
        <c:param name="titulo"><fmt:message key="9002098"/></c:param> 
        <c:param name="formulario"><fmt:message key="9002098"/></c:param>
        <c:param name="form">axissin031</c:param>
    </c:import>
    <div class="separador">&nbsp;</div>
    <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
        <tr>
            <td>
                     
                <!-- Primera Seccion -->
                <div class="separador">&nbsp;</div>
                <!-- Segunda seccion -->
                <table class="seccion">
                    <tr>
                        <th style="width:25%;height:0px"></th>
                        <th style="width:25%;height:0px"></th>
                        <th style="width:25%;height:0px"></th>
                        <th style="width:25%;height:0px"></th>
                    </tr>
                    <tr>
                        
                        <td class="titulocaja">
                           <b><fmt:message key="9002095"/></b><!-- Causas estado -->
                        </td>
                        <td class="titulocaja">
                           <b><fmt:message key="100587"/></b><!-- Estado -->
                        </td>
                        <td class="titulocaja">
                          <b><fmt:message key="100588"/></b><!-- Descripcion -->
                        </td>
                        <td class="titulocaja">
                          
                        </td>
                    </tr>
                    
                    <tr>
                       
                       
                        <td class="campocaja" >
                           <input type="text" name="CCAUEST" value="${__formdata.CCAUEST}" class="campodisabled campo campotexto" style="width:90%"
                            <axis:atr f="axissin031" c="CCAUEST" a="modificable=true&obligatorio=true"/> />
                       
                        </td>
                        
                        <td class="campocaja">
                             <select name="CESTSIN" id="CESTSIN"  size="1" <axis:atr f="axissin031" c="CESTSIN" a="modificable=true&obligatorio=true"/> class="campowidthselect campo campotexto_ob" <c:if test="${__formdata.MOD_TRAM=='MOD'||__formdata.MOD_TRAM=='CONS'}">disabled</c:if> style="width:90%;"><!-- onchange="javascript:f_cambia_estado();" -->
                                <option value = "null"> - <fmt:message key="1000348"/> - </option>
                                <c:forEach var="estado" items="${__formdata.listvalores.lst_estados}">
                                    <option value = "${estado.CATRIBU}" 
                                    <c:if test="${estado.CATRIBU == __formdata.CESTSIN  }"> selected </c:if> />
                                        ${estado.TATRIBU} 
                                    </option>
                                </c:forEach>
                            </select>
                       
                        </td>
                        
                        
                        <td class="campocaja" colspan="2">
                        <!--tabla-->
                        
                            <table>
                                    <td>
                                   
                                        <%--c:if test="{edicion==0}"--%>  
                                        <c:set var="title0"><fmt:message key="1000246"/></c:set>   <%-- CIDIOMA --%>
                                        <c:set var="title1"><fmt:message key="100588"/></c:set>   <%-- Descripcion --%>
                                       
                                        <div id="dt_recibos" class="seccion displayspaceMaximo">
                                            <display:table name="${lista_idiomas}" id="LSTIDIOMAS" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                                                 requestURI="axis_axissin031.do?paginar=true">
                                                <%@ include file="../include/displaytag.jsp"%>
                                                <display:column title="${title0}" sortable="false" sortProperty="CAUSA" headerClass="sortable"  media="html" autolink="false" >
                                                    <div class="dspText">
                                                             ${LSTIDIOMAS.TIDIOMA}
                                                             <input type="hidden" id="IDIOMA_${LSTIDIOMAS.CIDIOMA}" name="IDIOMA_${LSTIDIOMAS.CIDIOMA}" value="${LSTIDIOMAS.CIDIOMA}" class="campodisabled campo campotexto" style="width:90%"
                                                             />
                                                    </div>
                                                </display:column>
                                                <display:column title="${title1}" sortable="false" sortProperty="CESTSIN" headerClass="sortable"  media="html" autolink="false" >
                                                     <div class="dspText">
                                                            <input type="text" id="DESCRIPCION_${LSTIDIOMAS.CIDIOMA}" name="DESCRIPCION_${LSTIDIOMAS.CIDIOMA}" value="${LSTIDIOMAS.TCAUEST}" class="campodisabled campo campotexto" style="width:90%"
                                                            <axis:atr f="axissin031" c="CCAUEST" a="modificable=true"/> />
                                                     </div>
                                                </display:column>
                                                
                                                
                                                <!-- ICONOS -->
                                               
                                                
                                                <%--display:column title=" " sortable="true" sortProperty="TESTREC" headerClass="headwidth5 sortable"  media="html" autolink="false" >
                                                    <div class="dspIcons">
                                                        <img border="0" alt="<fmt:message key="1000564"/>" title="<fmt:message key="1000564"/>" src="images/delete.gif" width="11px" height="14px"
                                                        style="vertical-align:middle;cursor:pointer;" 
                                                        onclick="javascript:f_borrar_causa('${LSTCAUSAS.CCAUEST}','${LSTCAUSAS.CESTSIN}')"/>
                                                    </div>
                                                </display:column--%>
                                               
                                            </display:table>
                                        </div>
                                        
                                        <%--/c:if--%>
                                        
                                    </td>
                                </table>
                       
                        
                                           
                        </td>
        </tr>
    </table>
    </td>
    </tr>
    </table>
    <c:import url="../include/botonera_nt.jsp"><c:param name="__botones">cancelar,aceptar</c:param></c:import>
    </form>
  <c:import url="../include/mensajes.jsp" />
</body>
</html>