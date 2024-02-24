<%--
/**
*  Fichero: axissin029.jsp
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
        }
      
        function f_but_aceptar(){
            if (objValidador.validaEntrada()) {
                 parent.aceptar_axissin029(document.miForm.CCAUEST.value,document.miForm.TCAUEST.value,document.miForm.CESTSIN.value);
            }
        }
        
        function f_but_cancelar(){
            parent.f_cerrar_modal("axissin029");
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
        <c:param name="titulo"><fmt:message key="9002097"/></c:param>
        <c:param name="formulario"><fmt:message key="9002097"/></c:param>
        <c:param name="form">axissin029</c:param>
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
                        
                        <td class="titulocaja" >
                           <b><fmt:message key="9002094"/></b><!-- Causas estado -->
                        </td>
                        <td class="titulocaja" >
                           <b><fmt:message key="100587"/></b><!-- Estado -->
                        </td>
                        
                        <td class="titulocaja">
                          
                        </td>
                    </tr>
                    
                    <tr>
                       
                        <td class="campocaja" >
                            <select name="CCAUEST" id="CCAUEST" size="1" title="<fmt:message key="9002094"/>" <axis:atr f="axissin007" c="CAUSAS" a="modificable=true&isInputText=false"/> class="campowidthselect campo campotexto_ob" <c:if test="${__formdata.MOD_TRAM=='MOD'||__formdata.MOD_TRAM=='CONS'}">disabled</c:if> style="width:90%;">
                                <option value = "null"> - <fmt:message key="1000348"/> - </option>
                                <c:forEach var="causa" items="${__formdata.listvalores.lst_causas}">
                                    <option value = "${causa.CCAUEST}" 
                                    <c:if test="${ causa.CCAUEST == __formdata.CCAUEST  }"> selected </c:if> />
                                        ${causa.TCAUEST} 
                                    </option>
                                </c:forEach>
                            </select>
                        </td>
                        
                        <td class="campocaja" >
                             <select name="CESTSIN" id="CESTSIN" title="<fmt:message key="100587"/>" size="1" <axis:atr f="axissin007" c="CESTTRA" a="modificable=true&isInputText=false"/> class="campowidthselect campo campotexto_ob" <c:if test="${__formdata.MOD_TRAM=='MOD'||__formdata.MOD_TRAM=='CONS'}">disabled</c:if> style="width:90%;"><!-- onchange="javascript:f_cambia_estado();" -->
                                <option value = "null"> - <fmt:message key="1000348"/> - </option>
                                <c:forEach var="estado" items="${__formdata.listvalores.lst_estados}">
                                    <option value = "${estado.CATRIBU}" 
                                    <c:if test="${estado.CATRIBU == __formdata.MOVIMIENTO.CESTTRA  }"> selected </c:if> />
                                        ${estado.TATRIBU} 
                                    </option>
                                </c:forEach>
                            </select>
                       
                            <input type="hidden" name="TCAUEST" value="${__formdata.DESCRIPCION}" class="campodisabled campo campotexto" style="width:90%"
                            <axis:atr f="axissin029" c="DESCRIPCION" a="modificable=true"/> />
                       
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