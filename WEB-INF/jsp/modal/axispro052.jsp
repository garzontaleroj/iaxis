<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ page import="java.util.*" %>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>
<%@ page contentType="text/html;charset=iso-8859-15" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
    <title><axis:alt f="axispro052" c="TITLE" lit="151090"/></title>
    <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
    <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
    <link rel="stylesheet" href="styles/displaytag.css">
    <c:import url="../include/carga_framework_js.jsp"/>
    <script type="text/javascript">
        function f_onload() { 
            f_cargar_propiedades_pantalla();
            var val1 = "<%=request.getAttribute("OK")%>"; 
            if (val1=="OK"){
                parent.f_aceptar_axispro002(${mntproducto.SPRODUC});
                this.f_but_cancelar();
            }
       }
        
        function f_but_aceptar(){
            if (objValidador.validaEntrada())
                document.miForm.submit()
        }
        
        function f_but_cancelar(){
            parent.f_cerrar_modal("axispro052");
        }
        
    </script>
</head>
<body onload="javascript:f_onload()">
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
    <form name="miForm" action="modal_axispro052.do" method="POST">
    <input type="hidden" name="operation" value="guardar" />
    <input type="hidden" name="subpantalla" value="administracion"/>
    
    <c:import url="../include/titulo_nt.jsp">
        <c:param name="titulo"><axis:alt f="axispro052" c="TITULO" lit="9906236"/></c:param>
        <c:param name="formulario"><axis:alt f="axispro052" c="TITULO" lit="110251"/></c:param>
        <c:param name="form">axispro052</c:param>
    </c:import>
    <div class="separador">&nbsp;</div>
    <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
        <tr>
            <td>
                <div class="separador">&nbsp;</div>
                <!-- Primera seccion -->
                <table class="seccion">
                    <tr>
                        <th style="width:20%;height:0px"></th>
                        <th style="width:20%;height:0px"></th>
                        <th style="width:20%;height:0px"></th>
                        <th style="width:20%;height:0px"></th>
                        <th style="width:20%;height:0px"></th>
                    </tr>
                    <tr>
                        <td class="titulocaja">
                            <b><axis:alt f="axispro052" c="CCODIGO" lit="1000109"/></b><!--Código-->
                        </td>
                        <td class="titulocaja">
                            <b><axis:alt f="axispro052" c="CVALAXIS" lit="9906215"/></b><!--Val. Axis-->
                        </td>
                        <td class="titulocaja">
                           <b><axis:alt f="axispro052" c="CVALAXISDEF" lit="9906217"/></b><!--Val. Defecto Axis-->
                        </td>
                        <td class="titulocaja">
                          <b><axis:alt f="axispro052" c="CVALEMP" lit="9906216"/></b><!--Val. Empresa-->
                        </td>
                        <td class="titulocaja">
                          <b><axis:alt f="axispro052" c="CVALDEF" lit="9906218"/></b><!--Val. Defecto Empresa-->
                        </td>
                    </tr>
                    <tr>
                        <axis:visible f="axispro052" c="CCODIGO">
                        <td class="campocaja">
                            <input type="text" name="CCODIGO" id="CCODIGO" value="${__formdata.CCODIGO}" 
                            alt="<axis:alt f="axispro052" c="CCODIGO" lit="1000109"/>" title="<axis:alt f="axissin040" c="CCODIGO" lit="1000109"/>"
                            class="campowidthinput campo campotexto"
                            <c:if test="${__formdata.CCODIGO eq null}">
                               class="campowidthinput campo campotexto"
                            </c:if>
                            <c:if test="${__formdata.CCODIGO ne null}">
                               readonly class="campowidthinput campo campotexto campodisabled" obligatorio
                            </c:if>
                            style="width:90%" <axis:atr f="axispro052" c="CCODIGO" a="modificable=true&obligatorio=true"/> /> 
                        </td>
                        </axis:visible>
                        <axis:visible f="axispro052" c="CVALAXIS">
                        <td class="campocaja">
                            <input type="text" name="CVALAXIS" id="CVALAXIS" 
                            alt="<axis:alt f="axispro052" c="CVALAXIS" lit="9906215"/>" title="<axis:alt f="axissin040" c="CVALAXIS" lit="9906215"/>"
                            <c:if test="${__formdata.CVALAXIS eq null}">
                               <c:if test="${__formdata.SPRODUC eq null}">
                                class="campowidthinput campo campotexto" value=""
                               </c:if>
                               <c:if test="${__formdata.SPRODUC ne null}">
                                readonly class="campowidthinput campo campotexto campodisabled" obligatorio value="${__formdata.SPRODUC}"
                               </c:if>
                            </c:if>
                            <c:if test="${__formdata.CVALAXIS ne null}">
                               readonly class="campowidthinput campo campotexto campodisabled" obligatorio value="${__formdata.CVALAXIS}"
                            </c:if>
                            style="width:90%"
                            <axis:atr f="axispro052" c="CVALAXIS" a="modificable=true&obligatorio=true"/> /> 
                        </td>
                        </axis:visible>
                        <axis:visible f="axispro052" c="CVALAXISDEF">
                        <td class="campocaja">
                            <input type="text" name="CVALAXISDEF" id="CVALAXISDEF" value="${__formdata.CVALAXISDEF}" 
                            alt="<axis:alt f="axispro052" c="CVALAXISDEF" lit="9906217"/>" title="<axis:alt f="axissin040" c="CVALAXISDEF" lit="9906217"/>"
                            class="campowidthinput campo campotexto" style="width:90%"
                            <axis:atr f="axispro052" c="CVALAXISDEF" a="modificable=true&obligatorio=false"/> /> 
                        </td>
                        </axis:visible>
                        <axis:visible f="axispro052" c="CVALEMP">
                        <td class="campocaja">
                            <input type="text" name="CVALEMP" id="CVALEMP" value="${__formdata.CVALEMP}" 
                            alt="<axis:alt f="axispro052" c="CVALEMP" lit="9906216"/>" title="<axis:alt f="axissin040" c="CVALEMP" lit="9906216"/>"
                            class="campowidthinput campo campotexto campotexto_ob" style="width:90%"
                            <axis:atr f="axispro052" c="CVALEMP" a="modificable=true&obligatorio=true"/> /> 
                        </td>
                        </axis:visible>
                        <axis:visible f="axispro052" c="CVALDEF">
                        <td class="campocaja">
                            <input type="text" name="CVALDEF" id="CVALDEF" value="${__formdata.CVALDEF}" 
                            alt="<axis:alt f="axispro052" c="CVALDEF" lit="9906218"/>" title="<axis:alt f="axissin040" c="CVALDEF" lit="9906218"/>"
                            class="campowidthinput campo campotexto" style="width:90%"
                            <axis:atr f="axispro052" c="CVALDEF" a="modificable=true&obligatorio=false"/> /> 
                        </td>
                        </axis:visible>
                  </tr>
                </table>
            </td>
        </tr>
    </table>
    <c:import url="../include/botonera_nt.jsp"><c:param name="f">axispro052</c:param><c:param name="__botones">cancelar,aceptar</c:param></c:import>
    </form>
  <c:import url="../include/mensajes.jsp" />
</body>
</html>