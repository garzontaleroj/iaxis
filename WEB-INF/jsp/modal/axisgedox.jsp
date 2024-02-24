<%/* Revision:# T35XCrCdBSJrjGl+myoF7A== # */%>
<%
/**
*  Fichero: axisgedox.jsp
*  @author <a href = "mailto:echristen@csi-ti.com">Elmar Christen</a>
*  Fecha: 07/01/2008
*
*/
%>
<%@ page contentType="text/html;charset=windows-1252" errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>
<html>
  <head>
    <link rel="stylesheet" href="styles/genericosHtml.css" type="text/css">
    <link rel="stylesheet" href="styles/axisnt.css" type="text/css">
    <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>
    <c:import url="../include/carga_framework_js.jsp" />
    <script type="text/javascript">
    
        var nuevaVentana      = null;
        var idVentanas        = new Array();
        var contadorVentanas  = 0;

        function f_onload() {
            var id = "${param.IDDOC_INIT}";
            var FICHERO = "${param.FICHERO_INIT}";
            if (!objUtiles.estaVacio(id))
            f_imprimir(id,FICHERO);
            
            f_cargar_propiedades_pantalla();
        }

        function f_imprimir(IDDOC,FICHERO) {
            document.miForm.IDDOC.value = IDDOC;
            nuevaVentana = window.open("modal_axisgedox.do?operation=tunnel&IDDOC=" + IDDOC +"&FICHERO="+FICHERO);    
                   
            // Abrir un proceso con setInterval para cerrar la ventana recién abierta
            if (document.all) {
                idVentanas[contadorVentanas] = setInterval("f_cerrar_nuevaVentana()", 100);
                contadorVentanas++;
            }            
        }  

        function f_cerrar_nuevaVentana() {
            try {
                if (nuevaVentana != null && nuevaVentana.document.readyState != 'loading') {
                    nuevaVentana.window.close();
                }
            } catch (e) {}
        }        

        function f_but_salir(){
            // Para IE, limpiar las funciones setInterval
            if (document.all) {
                for (var i=0; i < idVentanas.length; i++)
                    clearInterval(idVentanas[i]);
            }
            parent.f_cerrar_axisgedox();
        }

        
        function f_but_1000615() { // Añadir documentación   
        	// INI - IAXIS 3951 - ML - 9/5/2019 - ENVIO DE TIPO 
            f_abrir_modal("axisfileupload", true, "&SSEGURO=${__formdata.SSEGURO}&NMOVIMI=${__formdata.NMOVIMI}&CCOMPANI=${__formdata.CCOMPANI}&IDOBS=${__formdata.IDOBS}&TIPO=${__formdata.TIPO}");
         	// FIN - IAXIS 3951 - ML - 9/5/2019 - ENVIO DE TIPO
        }
        
        /****************************************************************************************/
        /************************************** MODAL *******************************************/
        /****************************************************************************************/
        
        function f_abrir_modal(cual, noXButton, optionalQueryString) {
            if (objUtiles.estaVacio(optionalQueryString))                
                optionalQueryString = "";
                
            if (noXButton) 
                objDom.setVisibilidadPorId("but_cerrar_modal_" + cual, "hidden");    
                
            objUtiles.abrirModal(cual, "src", "modal_" + cual + ".do?operation=form" + optionalQueryString);        
        }
		
		function f_cerrar_modal(cual) {
            if (cual == "axisfileupload"){
            	objUtiles.cerrarModal(cual);
            	objUtiles.ejecutarFormulario ("modal_axisgedox.do?SSEGURO=${__formdata.SSEGURO}&NMOVIMI=${__formdata.NMOVIMI}&CCOMPANI=${__formdata.CCOMPANI}&IDOBS=${__formdata.IDOBS}", "form", document.miForm, "_self", objJsMessages.jslit_cargando);
            }else if(cual == 'axisfileupload_exc'){
            	objUtiles.cerrarModal('axisfileupload');
            	objUtiles.ejecutarFormulario ("modal_axisgedox.do?SSEGURO=${__formdata.SSEGURO}&NMOVIMI=${__formdata.NMOVIMI}&CCOMPANI=${__formdata.CCOMPANI}&IDOBS=${__formdata.IDOBS}&TIPO_EXC=EXC", "form", document.miForm, "_self", objJsMessages.jslit_cargando);
            }else{
            	objUtiles.cerrarModal(cual);
            }
        }
		  
    </script>
  </head>
    <body onload="f_onload()" >
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>

        <c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">axisfileupload|<axis:alt f="axisgedox" c="TITULO" lit="1000614"/></c:param>
        </c:import>
        
        <form name="miForm" action="modal_axisgedox.do" method="POST">
            <input type="hidden" id="operation" name="operation" value=""/>
            <input type="hidden" id="IDDOC" name="IDDOC" value=""/>
            <input type="hidden" name="TIPO" value="${__formdata.TIPO}">
            
            
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt f="axisgedox" c="DESCRIPCION_TIT" lit="1000201"></axis:alt></c:param>
                <c:param name="producto"></c:param>
                <c:param name="form">axisgedox</c:param>
            </c:import>

            <!-- Area de campos  -->
            
            <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <!--campos-->
                        <axis:ocultar c="DSP_LISTA" f="axisgedox" dejarHueco="false">
                        <table class="seccion">
                            <tr>
                                <td class="titulocaja">
                                    <b><axis:alt f="axisgedox" c="DOCUM_GENERADA" lit="9902385"/></b>
                                </td>
                            </tr>
                            <tr>
                                <td class="campocaja">
                                    <div class="displayspace">
                                        <c:set var="title0"><axis:alt f="axisgedox" c="DESCRIPCION" lit="100588"></axis:alt></c:set>
                                        <c:set var="title1"><axis:alt f="axisgedox" c="FICHERO" lit="105940"></axis:alt></c:set>										
                                        <c:set var="title2"><axis:alt f="axisgedox" c="FARCHIV" lit="9909326"></axis:alt></c:set>
                                        <c:set var="title3"><axis:alt f="axisgedox" c="FELIMIN" lit="9909327"></axis:alt></c:set>  
                                        <display:table name="${__formdata.axisgedox}" id="miListaId" export="false" class="dsptgtable" pagesize="-1" defaultsort="2" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                                         requestURI="modal_axisgedox.do?paginar=true">
                                            <%@ include file="../include/displaytag.jsp"%>
                                            <display:column title="${title0}" sortable="true" sortProperty="TDESCRIP" headerClass="sortable"  media="html" autolink="false" >
                                                <c:choose>
                                                    <c:when test="${miListaId['TIPO'] != '1'}">
                                                        <div class="dspText"><a href="javascript:f_imprimir('${miListaId['IDDOC']}','${miListaId['FICHERO']}')">${miListaId['TDESCRIP']}</a></div>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <div class="dspText">${miListaId['TDESCRIP']}</div>
                                                    </c:otherwise>
                                                </c:choose>
                                            </display:column>
                                            <display:column title="${title1}" sortable="true" sortProperty="FICHERO" headerClass="headwidth30 sortable"  media="html" autolink="false" >
                                                <c:choose>
                                                    <c:when test="${miListaId['TIPO'] != '1'}">
                                                        <div class="dspText"><a href="javascript:f_imprimir('${miListaId['IDDOC']}','${miListaId['FICHERO']}')">${miListaId['FICHERO']}</a></div>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <div class="dspText">${miListaId['FICHERO']}</div>
                                                    </c:otherwise>
                                                </c:choose>
                                            </display:column>
                                            <display:column title="${title2}" sortable="true" sortProperty="FARCHIV" headerClass="headwidth10 sortable" media="html" autolink="false" style="width:15%" >
                                                <c:choose>
                                                    <c:when test="${miListaId['TIPO'] != '1'}">
                                                        <div class="dspText"><a href="javascript:f_imprimir('${miListaId['IDDOC']}','${miListaId['FARCHIV']}')">${miListaId['FARCHIV']}</a></div>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <div class="dspText">${miListaId['FARCHIV']}</div>
                                                    </c:otherwise>
                                                </c:choose>
                                            </display:column>     
                                            <display:column title="${title3}" sortable="true" sortProperty="FELIMIN" headerClass="headwidth10 sortable"  media="html" autolink="false" >
                                                <c:choose>
                                                    <c:when test="${miListaId['TIPO'] != '1'}">
                                                        <div class="dspText"><a href="javascript:f_imprimir('${miListaId['IDDOC']}','${miListaId['FELIMIN']}')">${miListaId['FELIMIN']}</a></div>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <div class="dspText">${miListaId['FELIMIN']}</div>
                                                    </c:otherwise>
                                                </c:choose>
                                            </display:column>    											
                                            <display:column title=" "  sortable="true" sortProperty="ICONO" headerClass="headwidth5 sortable" media="html" autolink="false" >
                                                <div class="dspIcons">
                                                    <c:choose>
                                                        <c:when test="${!empty miListaId['ICONO']}"><img src="images/filetypes/${miListaId['ICONO']}.jpg" height="15px" width="15px"></c:when>
                                                        <c:otherwise><img src="images/filetypes/(DEFAULT).jpg" height="15px" width="15px"></c:otherwise>
                                                    </c:choose>
                                                </div>
                                            </display:column>
                                        </display:table>
                                        <c:if test="${!empty __formdata.axisgedox}">
                                            <c:if test="${ !(fn:containsIgnoreCase(header['User-Agent'],'ipad') ) }">
                                                <script language="javascript">objUtiles.retocarDsptagtable("miListaId");</script>
                                            </c:if>
                                        </c:if>
                                    </div>
                                </td>
                            </tr>
                        </table>
                        </axis:ocultar>
                    </td>
                </tr>
                <c:if test="${!empty __formdata.axisgedoxreq}">
                <tr>
                    <td>
                        <!--campos-->
                        <axis:ocultar c="DSP_LISTA_DOCREQUERIDA" f="axisgedox" dejarHueco="false">
                        <table class="seccion">
                            <tr>
                                <td class="titulocaja">
                                    <b><axis:alt f="axisgedox" c="DOCUM_GENERADA" lit="9901998"/></b>
                                </td>
                            </tr>
                            <tr>
                                <td class="campocaja">
                                    <div class="displayspace">
                                        <c:set var="title0"><axis:alt f="axisgedox" c="DESCRIPCION" lit="100588"></axis:alt></c:set>
                                        <c:set var="title1"><axis:alt f="axisgedox" c="FICHERO" lit="105940"></axis:alt></c:set>
										<c:set var="title2"><axis:alt f="axisgedox" c="FCADUCA" lit="9909328"></axis:alt></c:set>
                                        <display:table name="${__formdata.axisgedoxreq}" id="miListaIdreq" export="false" class="dsptgtable" pagesize="-1" defaultsort="2" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                                         requestURI="modal_axisgedox.do?paginar=true">
                                            <%@ include file="../include/displaytag.jsp"%>
                                            <display:column title="${title0}" sortable="true" sortProperty="TDESCRIP" headerClass="sortable"  media="html" autolink="false" >
                                                <c:choose>
                                                    <c:when test="${miListaIdreq['TIPO'] != '1'}">
                                                        <div class="dspText"><a href="javascript:f_imprimir('${miListaIdreq['IDDOC']}','${miListaIdreq['FICHERO']}')">${miListaIdreq['TDESCRIP']}</a></div>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <div class="dspText">${miListaIdreq['TDESCRIP']}</div>
                                                    </c:otherwise>
                                                </c:choose>
                                            </display:column>
                                            <display:column title="${title1}" sortable="true" sortProperty="FICHERO" headerClass="headwidth30 sortable"  media="html" autolink="false" >
                                                <c:choose>
                                                    <c:when test="${miListaIdreq['TIPO'] != '1'}">
                                                        <div class="dspText"><a href="javascript:f_imprimir('${miListaIdreq['IDDOC']}','${miListaIdreq['FICHERO']}')">${miListaIdreq['FICHERO']}</a></div>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <div class="dspText">${miListaIdreq['FICHERO']}</div>
                                                    </c:otherwise>
                                                </c:choose>
                                            </display:column>
                                            <display:column title="${title2}" sortable="true" sortProperty="FCADUCI" headerClass="headwidth12 sortable"  media="html" autolink="false" >
                                                <c:choose>
                                                    <c:when test="${miListaId['TIPO'] != '1'}">
                                                        <div class="dspText"><a href="javascript:f_imprimir('${miListaId['IDDOC']}','${miListaId['FCADUCI']}')">${miListaId['FELIMIN']}</a></div>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <div class="dspText">${miListaId['FCADUCI']}</div>
                                                    </c:otherwise>
                                                </c:choose>
                                            </display:column>   											
                                            <display:column title=" "  sortable="true" sortProperty="ICONO" headerClass="headwidth5 sortable" media="html" autolink="false" >
                                                <div class="dspIcons">
                                                    <c:choose>
                                                        <c:when test="${!empty miListaIdreq['ICONO']}"><img src="images/filetypes/${miListaIdreq['ICONO']}.jpg" height="15px" width="15px"></c:when>
                                                        <c:otherwise><img src="images/filetypes/(DEFAULT).jpg" height="15px" width="15px"></c:otherwise>
                                                    </c:choose>
                                                </div>
                                            </display:column>
                                        </display:table>
                                        <c:if test="${!empty __formdata.axisgedoxreq}">
                                            <c:if test="${ !(fn:containsIgnoreCase(header['User-Agent'],'ipad') ) }">
                                                <script language="javascript">objUtiles.retocarDsptagtable("miListaIdreq");</script>
                                            </c:if>
                                        </c:if>
                                    </div>
                                </td>
                            </tr>
                        </table>
                        </axis:ocultar>
                    </td>
                </tr>
                </c:if>
            </table>
            
             
            <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisgedox</c:param><c:param name="__botones"><axis:visible f="axisgedox" c="BT_SALIR">salir</axis:visible><axis:visible f="axisgedox" c="BT_AFEGIRDOC"><c:if test="${empty param.IDDOC_INIT}">,1000615</c:if></axis:visible></c:param></c:import>
     </form>
    <c:import url="../include/mensajes.jsp" />
    </body>
</html>

