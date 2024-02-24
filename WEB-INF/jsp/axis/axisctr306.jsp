<%/*Revision:# 78gYQ+ic8zYoOJo3X0PDEw== #*/%>
<%/**
*  Fichero: axisctr306.jsp
*  Pantalla de consulta / mantenimiento de usuarios.
*  @author <a href = "mailto:igil@csi-ti.com">Ivan Gil</a>  
*
*  Fecha: 08/07/2015
*/
%>
<%@ page contentType="text/html;charset=windows-1252"%>
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
        <title><axis:alt f="axisctr306" c="NOMBREPANTALLA" lit="formulario.axisnombrepantalla"/></title>
        <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>
            <input type="hidden" name="SEL_NORDEN" id="SEL_NORDEN" value="${__formdata.SEL_NORDEN}"/>
            <input type="hidden" name="MENSWARNINFO" id ="MENSWARNINFO" value="${__formdata.MENSWARNINFO}" />
            <input type="hidden" name="AVISO_VIEW" id ="AVISO_VIEW" value="${__formdata.AVISO_VIEW}" />
            <input type="hidden" name="PLSTAVISOS" id ="PLSTAVISOS" value="${__formdata.PLSTAVISOS}" />
        <style type="text/css">
            .displayspaceMaximo {
                width:99.8%;
                height: expression( this.scrollHeight > 900 ? "900px" : "auto" );
                max-height:900px;
                overflow-x: hidden;
                overflow-y: auto;
                border: 1px solid #DDDDDD;
            }
        </style>

        <c:import url="../include/carga_framework_js.jsp" />
        
        <script type="text/javascript">        
            
            /****************************************************************************************/
            /*********************************** NAVEGACION *****************************************/
            /****************************************************************************************/
            
            function f_onload() {
                f_cargar_propiedades_pantalla();
                revisarEstilos();
            }

            function f_but_buscar() {
                objUtiles.ejecutarFormulario ("axis_axisctr306.do", "buscar", document.miForm, "_self", objJsMessages.jslit_cargando);
            }

            function f_but_salir() {
                objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axisctr306", "cancelar", document.miForm, "_self");
            }           
            
            function f_but_anadir(CTIPO) {
                objDom.setVisibilidadPorId('but_cerrar_modal_axisctr307', 'hidden');
                objUtiles.abrirModal("axisctr307", "src", "modal_axisctr307.do?operation=form&MODO=axis.isNew&CTIPO_MED="+CTIPO);        
            }
            
            function f_borrar(NORDEN , obj) {
            
             
                if (confirm("<axis:alt f='axisctr306' c='BORRAR' lit='1000167'/>"))
                    objUtiles.ejecutarFormulario ("axis_axisctr306.do?NORDEN="+NORDEN, "borrar", document.miForm, "_self", objJsMessages.jslit_borrando_registro);
            }

            /****************************************************************************************/
            /********************************* MODAL axisctr307 *************************************/
            /****************************************************************************************/
            
            function f_cerrar_modal(cual) {
                objUtiles.cerrarModal(cual);
            }
            
            function f_aceptar_modal(cual) {                
                f_cerrar_modal(cual);
                objUtiles.ejecutarFormulario("axis_axisctr306.do", "buscar", document.miForm, "_self", objJsMessages.jslit_cargando);
                
            }
            
            function f_but_anterior() {
                // objUtiles.ejecutarFormulario("axis_axisctr004.do", "form", document.miForm, "_self");
                objUtiles.ejecutarFormulario("axis_axisctr306.do", "anterior", document.miForm, "_self");
            }
            function f_but_siguiente() {
                var AVISO_VIEW = '${__formdata.AVISO_VIEW}';
                if(AVISO_VIEW==1){
                    objUtiles.ejecutarFormulario("axis_axisctr306.do", "siguiente", document.miForm, "_self");
                }else{
                    objUtiles.ejecutarFormulario("axis_axisctr306.do", "avisos", document.miForm, "_self");
                    
                }
                
                
            }
            function callbackAjaxAviso(ajaxResponseText){
                      var doc = objAjax.domParse(ajaxResponseText);
   
                    alert(ajaxResponseText);
                  
                
            }
                        
            function f_but_cancelar() {
                //objUtiles.ejecutarFormulario ("main.do", "trabajo", document.miForm, "_self");
                objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axisctr306", "cancelar", document.miForm, "_self");
            }
            
        </script>
    </head>
    
    <body onunload="try { f_clear_resources(document.body) } catch (e) {}" onload="f_onload()" onkeypress="if (event.keyCode==13)  { f_but_buscar() }">
    
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
        
        <form name="miForm" action="" method="POST">
            <input type="hidden" name="operation" value=""/> 
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt f="axisctr306" c="MANT_CITA_MEDIC" lit="9908315"/></c:param> <%-- Mantenimiento de usuarios --%>
                <c:param name="titulo"><axis:alt f="axisctr306" c="MANT_CITA_MEDIC_TIT" lit="9908315"/></c:param> <%-- Mantenimiento de usuarios --%>
                <c:param name="form">axisctr306</c:param>
            </c:import>
            
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="nid_y_titulo">axisctr307|<axis:alt f="axisctr306" c="CITAS_MEDICAS" lit="9908315"/></c:param>
            </c:import>

            
            <!-- Tabla -->
                        <div class="separador">&nbsp; </div>                         
                        <axis:visible f="axisctr306" c="DSP_CITAMEDICA" >
                        <table class="seccion">
                            <tr>
                                <td>
                                    <table class="area" align="center">
                           <tr>
		                        <td align="left">
		                            <div class="titulo" style="margin-left:10px;font-size: 11px;"><img src="images/flecha.gif"/><axis:alt f="axisctr306" c="TIT_DSP_BENEIDENT" lit="9908458"/>    </div>
                                    <axis:visible f="axisctr306" c="NUEVA_CITA_MED" >
                                    <div style="float:right;">
                                    <img onclick="javascript:f_but_anadir(0)" border="0" alt="<axis:alt f="axisctr306" c="NUEVA_CITA_MED" lit="1000428"/>" title="<axis:alt f="axisctr306" c="NUEVA_CITA_MED" lit="1000428"/>" src="images/agenda.gif"/></div></axis:visible>
		                    
                                        </td>
		                    </tr>
		                    <tr>
		                        <td>
		         
		                            <c:set var="title0"><axis:alt f="axisctr306" c="CODEVID" lit="9908314"/></c:set><%--Codigo cita medica--%>
		                            <c:set var="title1"><axis:alt f="axisctr306" c="TEVIDEN" lit="9908312"/></c:set><%--Tipo cita medica--%>
		                            <c:set var="title2"><axis:alt f="axisctr306" c="NOMASEG" lit="100645"/></c:set><%--Nombre Asegurado--%>
		                            <c:set var="title3"><axis:alt f="axisctr306" c="NOMMEDI" lit="9908313"/></c:set><%--Nombre medico--%>
                                            <c:set var="title4"><axis:alt f="axisctr306" c="TESTADO" lit="9905523"/></c:set><%--Estado--%>
                                            <c:set var="title5"><axis:alt f="axisctr306" c="FEVIDEN" lit="9908311"/></c:set><%--Fecha cita medica--%>
                                            <c:set var="title6"><axis:alt f="axisctr306" c="CPAGO" lit="9908320"/></c:set><%--Estado--%>
                                            <c:set var="title7"><axis:alt f="axisctr306" c="IEVIDEN" lit="9908321"/></c:set><%--Fecha cita medica--%>            
                                    <c:set var="axisctr306_lista_citasmedicas" value="${__formdata.T_IAX_CITAMEDICA}" />
		                            <div class="separador">&nbsp;</div>
		                            <div class="displayspaceGrande">
                                            
		                                <display:table name="${axisctr306_lista_citasmedicas}" id="miL01" export="false" class="dsptgtable" defaultsort="1" pagesize="-1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0" requestURI="axis_axisctr306.do">
		                                    <%@ include file="../include/displaytag.jsp"%>
                                                    
		                                    <display:column title="${title0}" sortable="true" sortProperty="CODEVID" headerClass="sortable" style="width:5%;"  media="html" autolink="false" >
                                                    <c:if test="${miL01.OB_IAX_CITAMEDICA.CTIPEVI == 0}">
		                                        <div class="dspText">${miL01.OB_IAX_CITAMEDICA.CODEVID}</div>
                                                    </c:if>
		                                    </display:column>
		                                    <display:column title="${title1}" sortable="true" sortProperty="TEVIDEN" headerClass="sortable" style="width:20%;"  media="html" autolink="false" >
		                                    <c:if test="${miL01.OB_IAX_CITAMEDICA.CTIPEVI == 0}">
                                                        <div class="dspText">${miL01.OB_IAX_CITAMEDICA.TEVIDEN}</div>
                                                    </c:if>
		                                    </display:column>
		                                    <display:column title="${title2}" sortable="true" sortProperty="NOMASEG" headerClass="sortable" style="width:10%;"  media="html" autolink="false" >
		                                    <c:if test="${miL01.OB_IAX_CITAMEDICA.CTIPEVI == 0}">
                                                        <div class="dspText">${miL01.OB_IAX_CITAMEDICA.NOMASEG}</div>
                                                    </c:if>
		                                    </display:column>
		                                    <display:column title="${title3}" sortable="true" sortProperty="NOMMEDI" headerClass="sortable"  style="width:10%;" media="html" autolink="false" >
		                                    <c:if test="${miL01.OB_IAX_CITAMEDICA.CTIPEVI == 0}">
                                                        <div class="dspText">${miL01.OB_IAX_CITAMEDICA.NOMMEDI}</div>
                                                    </c:if>
		                                    </display:column>

		                                      <display:column title="${title4}" sortable="true" sortProperty="TESTADO" headerClass="sortable" style="width:10%;"  media="html" autolink="false" >
		                                      <c:if test="${miL01.OB_IAX_CITAMEDICA.CTIPEVI == 0}">
                                                        <div class="dspText">${miL01.OB_IAX_CITAMEDICA.TESTADO}</div>
                                                      </c:if>
		                                      </display:column>
                                         
		                                      <display:column title="${title5}" sortable="true" sortProperty="FEVIDEN" headerClass="sortable"  style="width:10%;" media="html" autolink="false" >
		                                      <c:if test="${miL01.OB_IAX_CITAMEDICA.CTIPEVI == 0}">
                                                        <div class="dspText">${miL01.OB_IAX_CITAMEDICA.FEVIDEN}</div>
                                                      </c:if>
		                                      </display:column>
 		                                      <display:column title="${title6}" sortable="true" sortProperty="CPAGO" headerClass="sortable" style="width:5%;"  media="html" autolink="false" >
		                                      <c:if test="${miL01.OB_IAX_CITAMEDICA.CTIPEVI == 0}">
                                                        <div class="dspText">${miL01.OB_IAX_CITAMEDICA.TPAGO}</div>
                                                      </c:if>
		                                      </display:column>
                                         
		                                      <display:column title="${title7}" sortable="true" sortProperty="IEVIDEN" headerClass="sortable"  style="width:5%;" media="html" autolink="false" >
		                                      <c:if test="${miL01.OB_IAX_CITAMEDICA.CTIPEVI == 0}">
                                                        <div class="dspText">${miL01.OB_IAX_CITAMEDICA.IEVIDEN}</div>
                                                      </c:if>
		                                      </display:column>                                        
                                                     
                                                        <display:column title="" sortable="true" sortProperty="" headerClass="headwidth5 sortable"  media="html" autolink="false" style="width:2%;" >
                                                             <c:if test="${miL01.OB_IAX_CITAMEDICA.CTIPEVI == 0}">
                                                             <div class="dspIcons">
                                                               <axis:visible f="axisctr306" c="BUT_MODIFICAR" >
                                                                <a href="javascript:objDom.setVisibilidadPorId('but_cerrar_modal_axisctr307', 'hidden');objUtiles.abrirModal('axisctr307', 'src', 'modal_axisctr307.do?operation=form&CODEVID=${miL01.OB_IAX_CITAMEDICA.CODEVID}&TEVIDEN=${miL01.OB_IAX_CITAMEDICA.TEVIDEN}&CEVIDEN=${miL01.OB_IAX_CITAMEDICA.CEVIDEN}&NOMASEG=${miL01.OB_IAX_CITAMEDICA.NOMASEG}&NOMMEDI=${miL01.OB_IAX_CITAMEDICA.NOMMEDI}&SPERSON=${miL01.OB_IAX_CITAMEDICA.SPERSON}&SPERSON_MED=${miL01.OB_IAX_CITAMEDICA.SPERSON_MED}&TESTADO=${miL01.OB_IAX_CITAMEDICA.TESTADO}&CESTADO=${miL01.OB_IAX_CITAMEDICA.CESTADO}&FEVIDEN=${miL01.OB_IAX_CITAMEDICA.FEVIDEN}&CPAGO=${miL01.OB_IAX_CITAMEDICA.CPAGO}&IEVIDEN=${miL01.OB_IAX_CITAMEDICA.IEVIDEN}&NORDEN=${miL01.OB_IAX_CITAMEDICA.NORDEN}&MODO=axis.noNew&NORDEN_R=${miL01.OB_IAX_CITAMEDICA.NORDEN_R}&CTIPO_MED=0')"><img border="0" alt="<axis:alt f='axisctr306' c='EDITAR' lit='9908074'/>"  
                                                                title="<axis:alt f='axisctr306' c='EDITAR_TOT' lit='9908074'/>" src="images/lapiz.gif"/></a>
                                                                </axis:visible>
                                                                </div>
                                                             </c:if>
                                                           
                                                        </display:column>  

                                                        <axis:visible f="axisctr306" c="BTN_DELMED" >
                                                        <display:column title=""
                                                                    headerClass="headwidth5 sortable"
                                                                    media="html"
                                                                    autolink="false"
                                                                    style="width:2%;">
                                                                    <c:if test="${miL01.OB_IAX_CITAMEDICA.CTIPEVI == 0}">
                                                        <div class="dspIcons">
                                                            <a href="javascript:f_borrar('${miL01.OB_IAX_CITAMEDICA.NORDEN}', this)">
                                                                <img border="0"
                                                                     alt='<axis:alt f="axisctr306" c="ICO_DEL" lit="1000127" />'
                                                                     title='<axis:alt f="axisctr306" c="ICO_DEL" lit="1000127" />'
                                                                     src="images/delete.gif"/>
                                                            </a>
                                                        </div>
                                                        </c:if>
                                                        </display:column>
                                                        </axis:visible>
                                                        
                                                    </display:table>                                                        
                                                </div>
                                                <div class="separador">&nbsp; </div>                                        
                                            </td>                                                
                                        </tr>
                                    </table>           
                                </td>
                            </tr>
                        </table>
                        </axis:visible>
      
    

            <!-- Tabla -->
                        <div class="separador">&nbsp; </div>                         
                        <axis:visible f="axisctr306" c="DSP_CITANOMEDICA" >
                        <table class="seccion">
                            <tr>
                                <td>
                                    <table class="area" align="center">
                           <tr>
		                        <td align="left">
		                            <div class="titulo" style="margin-left:10px;font-size: 11px;"><img src="images/flecha.gif"/><axis:alt f="axisctr306" c="TIT_DSP_BENEIDENT" lit="9908459"/>    </div>
                                    <axis:visible f="axisctr306" c="NUEVA_CITA_NOMED" >
                                    <div style="float:right;">
                                    <img onclick="javascript:f_but_anadir(1)" border="0" alt="<axis:alt f="axisctr306" c="NUEVA_CITA_NOMED" lit="1000428"/>" title="<axis:alt f="axisctr306" c="NUEVA_CITA_NOMED" lit="1000428"/>" src="images/agenda.gif"/></div></axis:visible>
		                    
                                        </td>
		                    </tr>
		                    <tr>
		                        <td>
		         
		                            <c:set var="title0"><axis:alt f="axisctr306" c="CODEVID" lit="9908314"/></c:set><%--Codigo cita medica--%>
		                            <c:set var="title1"><axis:alt f="axisctr306" c="TEVIDEN" lit="9908312"/></c:set><%--Tipo cita medica--%>
		                            <c:set var="title2"><axis:alt f="axisctr306" c="NOMASEG" lit="100645"/></c:set><%--Nombre Asegurado--%>
		                            <c:set var="title3"><axis:alt f="axisctr306" c="NOMMEDI" lit="9908313"/></c:set><%--Nombre medico--%>
                                            <c:set var="title4"><axis:alt f="axisctr306" c="TESTADO" lit="9905523"/></c:set><%--Estado--%>
                                            <c:set var="title5"><axis:alt f="axisctr306" c="FEVIDEN" lit="9908311"/></c:set><%--Fecha cita medica--%>
                                            <c:set var="title6"><axis:alt f="axisctr306" c="CPAGO" lit="9908320"/></c:set><%--Estado--%>
                                            <c:set var="title7"><axis:alt f="axisctr306" c="IEVIDEN" lit="9908321"/></c:set><%--Fecha cita medica--%>            
                                    <c:set var="axisctr306_lista_citasmedicas" value="${__formdata.T_IAX_CITAMEDICA}" />
		                            <div class="separador">&nbsp;</div>
		                            <div class="displayspaceGrande">
                                            
		                                <display:table name="${axisctr306_lista_citasmedicas}" id="miL01" export="false" class="dsptgtable" defaultsort="1" pagesize="-1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0" requestURI="axis_axisctr306.do">
		                                    
                                                    <%@ include file="../include/displaytag.jsp"%>
                                                    
		                                    <display:column title="${title0}" sortable="true" sortProperty="CODEVID" headerClass="sortable" style="width:5%;"  media="html" autolink="false" >
                                                    <c:if test="${miL01.OB_IAX_CITAMEDICA.CTIPEVI == 1}">
		                                        <div class="dspText">${miL01.OB_IAX_CITAMEDICA.CODEVID}</div>
                                                    </c:if>
		                                    </display:column>
		                                    <display:column title="${title1}" sortable="true" sortProperty="TEVIDEN" headerClass="sortable" style="width:20%;"  media="html" autolink="false" >
		                                    <c:if test="${miL01.OB_IAX_CITAMEDICA.CTIPEVI == 1}">
                                                        <div class="dspText">${miL01.OB_IAX_CITAMEDICA.TEVIDEN}</div>
                                                    </c:if>
		                                    </display:column>
		                                    <display:column title="${title2}" sortable="true" sortProperty="NOMASEG" headerClass="sortable" style="width:10%;"  media="html" autolink="false" >
		                                    <c:if test="${miL01.OB_IAX_CITAMEDICA.CTIPEVI == 1}">
                                                        <div class="dspText">${miL01.OB_IAX_CITAMEDICA.NOMASEG}</div>
                                                    </c:if>
		                                    </display:column>
                                      
                                                        <axis:visible f="axisctr306" c="BTN_DELNOMED" >
                                                        <display:column title=""
                                                                    headerClass="headwidth5 sortable"
                                                                    media="html"
                                                                    autolink="false"
                                                                    style="width:2%;">
                                                                    <c:if test="${miL01.OB_IAX_CITAMEDICA.CTIPEVI == 1}">
                                                        <div class="dspIcons">
                                                            <a href="javascript:f_borrar('${miL01.OB_IAX_CITAMEDICA.NORDEN}', this)">
                                                                <img border="0"
                                                                     alt='<axis:alt f="axisctr306" c="ICO_DEL" lit="1000127" />'
                                                                     title='<axis:alt f="axisctr306" c="ICO_DEL" lit="1000127" />'
                                                                     src="images/delete.gif"/>
                                                            </a>
                                                        </div>
                                                        </c:if>
                                                        </display:column>
                                                        </axis:visible>
                                                       
                                                    </display:table>                                                        
                                                </div>
                                                <div class="separador">&nbsp; </div>                                        
                                            </td>                                                
                                        </tr>
                                    </table>           
                                </td>
                            </tr>
                        </table>
                        </axis:visible>
      
                
            <c:if test="${param.multiPantalla != 'true'}">        
            <!-- Botonera -->
                <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisctr306</c:param>
                    <c:param name="__botones">cancelar<axis:visible f="axisctr306" c="BT_ANT">,anterior</axis:visible><axis:visible f="axisctr306" c="BT_SEG">,siguiente</axis:visible></c:param>
                </c:import>
            </c:if>
        </form>
    
        <c:import url="../include/mensajes.jsp" />
    </body>
</html>