<%
/**
*  Fichero: axisgfi023.jsp
*  @author <a href = "mailto:amartinez@csi-ti.com">Alex Martinez</a>
*  Fecha: 06/07/2009
*/
%>
<%@ page contentType="text/html;charset=windows-1252" errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<html>
  <head>
    <link rel="stylesheet" href="styles/genericosHtml.css" type="text/css">
    <link rel="stylesheet" href="styles/axisnt.css" type="text/css">
    <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>
    <c:import url="../include/carga_framework_js.jsp" />
    
    <script language="Javascript" type="text/javascript">
        function f_onload() {
            f_cargar_propiedades_pantalla();
        }
                
        function f_but_aceptar() {  
            parent.f_cerrar_axisgfi023();
        }
        
        function f_abrir_axisgfi024(TERMINO,CODIGO){
            objUtiles.abrirModal("axisgfi024", "src", "modal_axisgfi024.do?operation=form&TERMINO="+TERMINO+"&CODIGO="+CODIGO,800,500);
        }
        
        function f_cerrar_axisgfi024() {
                objUtiles.cerrarModal("axisgfi024");
            }
            
        function f_aceptar_axisgfi012(){
            f_cerrar_axisgfi024();
            objUtiles.ejecutarFormulario ("modal_axisgfi023.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
        
        function f_borrar_vigencia(CODIGO){
            var answer = confirm(objJsMessages.jslit_confirma_borrar);
        
            if (answer){
                objUtiles.ejecutarFormulario ("modal_axisgfi023.do?CODIGO="+CODIGO, "borrar", document.miForm, "_self", objJsMessages.jslit_cargando);
            }
        }
         
    </script>
  </head>
    <body class=" " onload="f_onload()" >
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="titulo"><axis:alt f="axisgfi023" c="TITULO_AXISGFI024" lit="9002011" /></c:param>
            <c:param name="nid" value="axisgfi024" />
        </c:import>
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
        <form name="miForm" action="" method="POST">
            <input type="hidden" id="operation" name="operation" value=""/>
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt f="axisgfi023" c="FORM" lit="9002003" /></c:param>
                <c:param name="producto"><axis:alt f="axisgfi023" c="SPRODUC" lit="9002003"/></c:param>
                <c:param name="form">axisgfi023</c:param>
            </c:import>
            <!-- Area de campos  -->
            <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <!--campos-->
                        <table class="seccion">
                            <tr>
                                <th style="width:10%;height:0px"></th>
                                <th style="width:70%;height:0px"></th>
                                <th style="width:25%;height:0px"></th>
                            </tr>
                            <tr>
                                <td></td>
                                <td class="titulocaja" >
                                    <b><axis:alt f="axisgfi023" c="TERMINO" lit="9001991" /></b>
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                                <td class="campocaja" >
                                    <input type="text" class="campowidthinput campo campotexto" value="${TERMINO}" name="TERMINO" id="TERMINO" title="<axis:alt f="axisgfi023" c="TERMINO" lit="9001991"/>" size="15" 
                                     style="width:30%" <axis:atr f="axisgfi023" c="TERMINO" a="modificable=false&obligatorio=true"/>/>
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                                <td>
                                    <div class="separador">&nbsp;</div>
                                    <div class="displayspaceMaximo">  
                                        <c:set var="title0"><axis:alt f="axisgfi023" c="CLAVE" lit="1000109"/></c:set>
                                        <c:set var="title1"><axis:alt f="axisgfi023" c="TERMINO" lit="9001991"/></c:set>
                                        <c:set var="title2"><axis:alt f="axisgfi023" c="FECHA_EFECTO" lit="100883"/></c:set>                               
                                        <c:set var="title3"><axis:alt f="axisgfi023" c="VALOR" lit="101159"/></c:set>
                                        
                                        <display:table name="${VIGENCIAS}" id="VIGENCIAS" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                                                      requestURI="modal_axisgfi023.do?operation=form&paginar=true" > 
                                            <%@ include file="../include/displaytag.jsp"%>
                                            <display:column title="${title0}" sortable="true" sortProperty="" headerClass="sortable fixed"  style="width:5%" media="html" autolink="false" >
                                                <div class="dspText">${VIGENCIAS.CLAVE} </div>
                                            </display:column>
                                            <display:column title="${title2}" sortable="true" sortProperty="" headerClass="sortable fixed"  media="html" style="width:10%" autolink="false" >
                                                <div class="dspText"><fmt:formatDate value="${VIGENCIAS.FECHA_EFECTO}" pattern="dd/MM/yyyy"/></div>
                                            </display:column>
                                            <display:column title="${title3}" sortable="true" sortProperty="" headerClass="sortable fixed" style="width:10%" media="html" autolink="false" >
                                                <div class="dspText"><fmt:formatNumber pattern='#,##0.##########' value='${VIGENCIAS.VALOR}'/></div>
                                            </display:column>                                   
                                            <display:column title="" sortable="true" sortProperty="" headerClass="sortable fixed" style="width:5%"  media="html" autolink="false" >
                                                <div class="dspIcons">
                                                            <img border="0"
                                                                 alt='<axis:alt f="axisgfi023" c="EDITAR" lit="9002010"/>'
                                                                 title1='<axis:alt f="axisgfi023" c="EDITAR" lit="9002010"/>'
                                                                 src="images/lapiz.gif"
                                                                 width="15px" height="15px"
                                                                 style="cursor:pointer;"
                                                                 onclick="f_abrir_axisgfi024(document.miForm.TERMINO.value,${VIGENCIAS.CLAVE})"/>
                                                </div>
                                            </display:column>
                                            <display:column title="" sortable="true" sortProperty="" headerClass="sortable fixed" style="width:5%" media="html" autolink="false" >
                                                <div class="dspIcons">
                                                            <img border="0"
                                                                 alt='<axis:alt f="axisgfi023" c="BORRAR" lit="9002009"/>'
                                                                 title1='<axis:alt f="axisgfi023" c="BORRAR" lit="9002009"/>'
                                                                 src="images/delete.gif"
                                                                 width="15px" height="15px"
                                                                 style="cursor:pointer;"
                                                                onclick="f_borrar_vigencia(${VIGENCIAS.CLAVE})"/>
                                                </div>
                                            </display:column> 
                                        </display:table>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                                <td align="right"> 
                                    <div class="separador">&nbsp;</div>
                                    <input type="button" class="boton" id="but_añadir" value='<axis:alt f="axisgfi023" c="ANADIR" lit="104825" />' 
                                            onclick="f_abrir_axisgfi024(document.miForm.TERMINO.value,null)"/>
                                    <div class="separador">&nbsp;</div>
                                </td>
                            </tr>
                        </table>
                        
                    </td>
                </tr>
            </table>
            <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisgfi023</c:param><c:param name="__botones">aceptar</c:param></c:import>
     </form>
    <c:import url="../include/mensajes.jsp" />
    </body>
</html>

