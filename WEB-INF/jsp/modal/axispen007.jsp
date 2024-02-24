<%/*
*  Fichero: axispen007.jsp
*
*  Fecha: 15/12/2009
*/
%>

<%@ page contentType="text/html;charset=iso-8859-15" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
    <title><axis:alt c="title" f="axispen007" lit="9900864"/></title> <%-- Buscador de gestores --%>
    <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
    <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
    <link rel="stylesheet" href="styles/displaytag.css">
    <c:import url="../include/carga_framework_js.jsp"/>  
   
    <script type="text/javascript">
    
        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/
        
        function f_onload() {                                 
            f_cargar_propiedades_pantalla();        
            document.getElementById("CCODGES").focus();
        }
        
        function f_but_cancelar() {
            parent.f_cerrar_modal('axispen007');
        }
        
        function f_but_buscar() {            
            if (objValidador.validaEntrada()) {
                objUtiles.ejecutarFormulario("modal_axispen007.do", "buscar", document.miForm, "_self", objJsMessages.jslit_cargando);
            
            }
        }        
      
      function f_seleccionar_gestora(CGESDGS,CCODGES,TCODGES){
            objDom.setValorPorId("CGESDGS",CGESDGS );
            objDom.setValorPorId("CCODGES",CCODGES );
            objDom.setValorPorId("TCODGES",TCODGES );
      }
       
      function f_but_aceptar() {
        if (objUtiles.estaVacio (objDom.getValorPorId("CCODGES"))) {
            alert(objJsMessages.jslit_selecciona_registro);
        }else{
            parent.f_aceptar_axispen007(objDom.getValorPorId("CCODGES"),objDom.getValorPorId("CGESDGS"), objDom.getValorPorId("TCODGES"));       
        } 
    }
    
     function f_cerrar_modal(cual) {
            objUtiles.cerrarModal(cual);
    }
    function f_abrir_modal(cual, noXButton, optionalQueryString) {         
        if (objUtiles.estaVacio(optionalQueryString))                
            optionalQueryString = "";                    
        if (noXButton) 
            objDom.setVisibilidadPorId("but_cerrar_modal_" + cual, "hidden");             
        objUtiles.abrirModal(cual, "src", "modal_" + cual + ".do?operation=form" + optionalQueryString);        
    }
    
    function f_but_nuevo(){
        f_abrir_modal("axispen012",null,"&parametro=alta");            
    }
   
    function f_aceptarAxispen012(CCODGES){
        f_cerrar_modal("axispen012");
        parent.f_aceptar_axispen007(CCODGES,"","");          
    }
    
    </script>    
</head>

<body onunload="try { f_clear_resources(document.body) } catch (e) {}" onload="f_onload()" onkeypress="if (event.keyCode==13)  { f_but_buscar() }">
    
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
    
    <form name="miForm" action="" method="POST">         
    
        <c:import url="../include/titulo_nt.jsp">
                <c:param name="titulo"><axis:alt c="titulo" f="axispen007" lit="9900864"/></c:param>     <%-- Buscador de gestores --%>
                <c:param name="formulario"><axis:alt c="formulario" f="axispen007" lit="9900864"/></c:param> <%-- Buscador de gestores --%>
                <c:param name="form">axispen007</c:param>
        </c:import>
        <c:import url="../include/modal_estandar.jsp">
                <c:param name="nid_y_titulo">
                    axispen012|<axis:alt c="TITULO_012" f="axispen007" lit="9900904"/><%-- alta/mod Gestoras --%>
                </c:param>
            </c:import>     
        <input type="hidden" name="operation" value=""/>
        <input type="hidden" id="CCODGES" name="CCODGES" value="${__formdata.CCODGES}"/>       
        <input type="hidden" id="CGESDGS" name="CGESDGS" value="${__formdata.CGESDGS}"/>       
        <input type="hidden" id="TCODGES" name="TCODGES" value="${__formdata.TCODGES}"/>
        
        <table class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td>
                    <div class="separador">&nbsp;</div>
                    <table class="seccion" cellpadding="0" cellspacing="0">
                        <tr>
                            <td align="left">
                                <div class="separador">&nbsp;</div>
                                <table class="area" align="center">
                                    <tr>
                                        <th style="width:10%;height:0px"></th>
                                        <th style="width:20%;height:0px"></th>
                                        <th style="width:10%;height:0px"></th>
                                        <th style="width:60%;height:0px"></th>                                        
                                    </tr>
                                    <tr>
                                        <axis:visible f="axisrea021" c="CODDGS">
                                            <td class="titulocaja"> 
                                                <b id="label_CODDGS"><axis:alt c="CODDGS" f="axispen007" lit="1000109"/></b> <%-- Codi Gestora--%>
                                            </td>
                                        </axis:visible>
                                        <axis:visible f="axisrea021" c="TNOMGES">
                                            <td class="titulocaja" >
                                                <b id="label_TNOMGES"><axis:alt c="TNOMGES" f="axispen007" lit="105940"/></b> <%-- Nom Gestora --%>
                                            </td>
                                        </axis:visible>
                                    </tr>
                                    <tr>
                                      <axis:visible f="axispen007" c="CODDGS">
                                             <td class="campocaja" >
                                                <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.CODDGS}" name="CODDGS" id="CODDGS" style="width:100%;"
                                            </td>
                                        </axis:visible>

                                        <axis:visible f="axispen007" c="TNOMGES">
                                             <td class="campocaja" >
                                                <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.TNOMGES}" name="TNOMGES" id="TNOMGES" style="width:100%;"
                                            </td>
                                        </axis:visible>                                        
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <table class="area" align="center"> 
                                    <tr>
                                        <td>
                                            <c:set var="title0">&nbsp;</c:set>
                                            <c:set var="title1">
                                                 <axis:alt c="GESTORA" f="axispen007" lit="1000109"/><!-- Gestora -->
                                            </c:set>
                                            <c:set var="title2">
                                                <axis:alt c="NOMBRE" f="axispen007" lit="105940"/><!-- Nombre -->
                                            </c:set>
                                            <c:set var="title3">
                                                <axis:alt c="FALTA" f="axispen007" lit="9001192"/><!-- Fecha alta -->
                                            </c:set>
                                            <c:set var="title4">
                                                <axis:alt c="FBAJA" f="axispen007" lit="9001510"/><!-- Fecha baja -->
                                            </c:set>
                                            <% int contador = 0;%>                                       
                                            <div class="seccion displayspace">
                                                <display:table name="${__formdata.AXIS_GESTORAS}"
                                                               id="miListaGestoras"
                                                               export="false"
                                                               class="dsptgtable"
                                                               pagesize="-1"
                                                               defaultsort="2"
                                                               defaultorder="ascending"
                                                               requestURI="axis_axispen002.do?paginar=true"
                                                               sort="list"
                                                               cellpadding="0"
                                                               cellspacing="0">
                                                    <%@ include file="../include/displaytag.jsp"%>
                                                    <c:set var="contador"><%=contador%></c:set>                                                                                        
                                                  <display:column headerClass="sortable fixed"
                                                                    title=""
                                                                    media="html"
                                                                    autolink="false"
                                                                    style="width:2%">
                                                        <div class="dspIcons">
                                                            <input value="${miListaGestoras.OB_IAX_GESTORAS['CCODGES']}"
                                                                   type="radio"
                                                                   onclick="f_seleccionar_gestora('${miListaGestoras.OB_IAX_GESTORAS.FONPENSIONES[0].OB_IAX_FONPENSIONES.PLANPENSIONES[0].OB_IAX_PLANPENSIONES.CGESDGS}','${miListaGestoras.OB_IAX_GESTORAS['CCODGES']}', '${miListaGestoras.OB_IAX_GESTORAS.PERSONA['TNOMBRE']} ${miListaGestoras.OB_IAX_GESTORAS.PERSONA['TAPELLI1']}&nbsp;${miListaGestoras.OB_IAX_GESTORAS.PERSONA['TAPELLI2']}');"
                                                                   <c:if test="${__formdata.NCONTADOR == contador}"> checked </c:if>
                                                                   id="radioGestora"
                                                                   name="radioGestora"/>
                                                                   
                                                        </div>
                                                    </display:column>                                            
                                                    <display:column title="${title1}"
                                                                    sortable="true"
                                                                    sortProperty="CCODGES"
                                                                    headerClass="sortable fixed"
                                                                    media="html"
                                                                    autolink="false"
                                                                    style="width:5%">
                                                       <div class="dspText">
                                                                ${miListaGestoras.OB_IAX_GESTORAS.CODDGS} 
                                                                <%-- ${miListaGestoras.OB_IAX_GESTORAS['CCODGES']} --%>
                                                        </div>                                                            
                                                    </display:column>
                                                    <display:column title="${title2}"
                                                                    sortable="true"
                                                                    sortProperty="TNOMBRE"
                                                                    headerClass="sortable fixed"
                                                                    media="html"
                                                                    autolink="false"
                                                                    style="width:40%">
                                                       <div class="dspText">
                                                                ${miListaGestoras.OB_IAX_GESTORAS.PERSONA['TNOMBRE']}
                                                                ${miListaGestoras.OB_IAX_GESTORAS.PERSONA['TAPELLI1']}&nbsp;
                                                                ${miListaGestoras.OB_IAX_GESTORAS.PERSONA['TAPELLI2']}
                                                        </div>                                               
                                                    </display:column>
                                                    <display:column title="${title3}"
                                                                    sortable="true"
                                                                    sortProperty="FALTA"
                                                                    headerClass="sortable fixed"
                                                                    media="html"
                                                                    autolink="false"
                                                                    style="width:5%">
                                                    <div class="dspText"><fmt:formatDate value="${miListaGestoras.OB_IAX_GESTORAS['FALTA']}" pattern="dd/MM/yy" />
                                                    </div>                                                 
                                                    </display:column>
                                                    <display:column title="${title4}"
                                                                    sortable="true"
                                                                    sortProperty="FBAJA"
                                                                    headerClass="sortable fixed"
                                                                    media="html"
                                                                    autolink="false"
                                                                    style="width:5%">
                                                    <div class="dspText"><fmt:formatDate value="${miListaGestoras.OB_IAX_GESTORAS['FBAJA']}" pattern="dd/MM/yy" />
                                                    </div>                                                 
                                                    </display:column>

                                                    
                                                <%contador++;%>                                                                                 
                                                </display:table>
                                                 
                                                <c:choose>
                                                    <c:when test="${!empty  sessionScope.AXIS_GESTORAS}">
                                                        <script language="javascript">//objUtiles.retocarDsptagtable("miListaGestoras");</script>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <script language="javascript">
                                                        //objLista.esconderListaSpans();
                                                        //objLista.esconderListaLinks();     
                                                        </script>
                                                    </c:otherwise>
                                                </c:choose>
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                    
                </td>
            </tr>
        </table>
                
        <c:import url="../include/botonera_nt.jsp">
            <c:param name="f">axispen007</c:param>
            <c:param name="__botones">cancelar,aceptar,buscar,nuevo</c:param> 
        </c:import>    
    </form>    
    <c:import url="../include/mensajes.jsp"/>   
</body>
</html>