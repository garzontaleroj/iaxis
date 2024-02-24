<%/* Revision:# 6Lg1fjFFTc1A4ehrVi6c5A== # */%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>


<c:set var="pantalla" value="${param.nombrePantalla}"/>

<c:choose>
    <c:when test="${param.multiPantalla == 'true'}">
        <c:set var="literalPantalla">
            <axis:alt f="axisctr006" c="TIT1" lit="1000183"/>/<axis:alt f="axisctr006" c="TIT2" lit="1000079"/>
        </c:set>
    </c:when>
    <c:otherwise>
        <c:set var="literalPantalla">
            <axis:alt f="axisctr006" c="TIT3" lit="1000079"/>
        </c:set>
    </c:otherwise>
</c:choose>

 <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt f="axisctr006" c="TITULO_AXISCTR101" lit="1000199" /></c:param>
                <c:param name="nid" value="axisctr101" />
            </c:import>
<c:import url="../include/precargador_ajax.jsp">
    <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
</c:import>
        
<form name="${pantalla}Form" action="" method="POST">
    <input type="hidden" name="operation" value=""/> 
    <input type="hidden" name="selected" id="selected"/>  
    <input type="hidden" id="SNIP" name="SNIP" value="${__formdata.SNIP}"/>
    <input type="hidden" id="SPERSON" name="SPERSON" value="${__formdata.SPERSON}"/>
    <input type="hidden" id="ORIGEN" name="ORIGEN" value="${__formdata.ORIGEN}"/>
    <input type="hidden" id="CLAUSU_NOOBLIG" name="CLAUSU_NOOBLIG" value="${__formdata.CLAUSU_NOOBLIG}"/>
     <input type="hidden" name="TNOMBRE" id="TNOMBRE" value=""/>
    <input type="hidden" name="TNOMBRE1" id="TNOMBRE1" value=""/>
    <input type="hidden" name="TNOMBRE2" id="TNOMBRE2" value=""/>
    <input type="hidden" name="TAPELLI1" id="TAPELLI1" value=""/>
    <input type="hidden" name="TAPELLI2" id="TAPELLI2" value=""/>
    <input type="hidden" name="CTIPIDE" id="CTIPIDE" value=""/>
    <input type="hidden" name="TIDENTI" id="TIDENTI" value=""/>
    <input type="hidden" name="CSEXPER" id="CSEXPER" value=""/>
    <input type="hidden" name="FNACIMI" id="FNACIMI" value=""/>
    <input type="hidden" name="NNUMNIF" id="NNUMNIF" value=""/>
    <input type="hidden" name="NORDEN" id="NORDEN" value=""/>
	<input type="hidden" name="MENSWARNINFO" id ="MENSWARNINFO" value="${__formdata.MENSWARNINFO}" />
	
    <c:import url="../include/titulo_nt.jsp">
        <c:param name="modalidad"><axis:alt f="axisctr006" c="MODALIDAD" lit="101110" />
        <axis:visible f="axisctr006" c="NPOLIZA"> 
         <axis:alt f="axisctr006" c="TITULO_FORM" lit="101779"/> 
         <axis:ocultar f="axisctr006" c="TITULO_COLECTIVO" dejarHueco="false">
            	<axis:alt f="axisctr006" c="TITULO_FORM" lit="102707"/> 
            </axis:ocultar>
            ${__formdata.NPOLIZA}
        </axis:visible>
        <axis:visible f="axisctr006" c="PTMOTMOV"> ${__formdata.PTMOTMOV}
        </axis:visible>
        </c:param>
        <c:param name="titulo"></c:param>
        <c:param name="formulario">${literalPantalla}</c:param>
        <c:param name="form">${pantalla}</c:param>
    </c:import>
    <!-- Area de campos  -->
    <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0" <c:if test="${param.multiPantalla == 'true'}">style="height:170px;"</c:if>>
        <tr>
            <td>
                <table class="seccion">
                        <tr>
                            <td style="font-size: 11px;">
                            <font color="#FF8400" ><b>
                                <axis:visible c="ETIQ_RISC" f="axisctr006">
                                        <axis:alt f="axisctr006" c="ETIQ_RISC" lit="100649"></axis:alt> 
                                </axis:visible>
                                ${__formdata.OB_IAX_RIESGOS.TRIESGO}</b></font>
                            </td>
                        </tr>
                </table>
                <div class="separador">&nbsp;</div>
                <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axisctr006" c="TITULO_PANTALLA" lit="1000079" /></div>
                <!--campos-->
                         
                <table class="seccion">
                    <tr>
                    <td>
                     <axis:ocultar f="axisctr006" c="CLAUSULAS">
                    <table class="area" align="center">
                    <tr>
                        <td colspan="2" align="left">
                            <div class="titulo" style="margin-left:10px;font-size: 11px;"><img src="images/flecha.gif"/><axis:alt f="axisctr006" c="TIT_CLAU" lit="1000083" /></div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <!-- DisplayTag clausulasDefinidas -->
                            <c:set var="title0"><axis:alt f="axisctr006" c="CODIGO" lit="800440"/></c:set>
                            <c:set var="title1"><axis:alt f="axisctr006" c="DESCRIPCION_CLAU" lit="101805"/></c:set>
                            <div class="separador">&nbsp;</div>
                            <div class="displayspace">
                                <display:table name="${requestScope.axisctr006_listaClausulasBeneficiario}" id="miListaId" export="false" class="dsptgtable" pagesize="-1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                                 requestURI="axis_${pantalla}.do?paginar=true">
                                    <%@ include file="../include/displaytag.jsp"%>
                                    <display:column title="" sortable="false" sortProperty="selectedClausula" headerClass="headwidth5 sortable"  media="html" autolink="false" >
                                        <div class="dspIcons">
                                        <input onclick="javascript:f_validar_checkbox(this)" <c:if test="${(miListaId['NCLADEF']==1 && __formdata['CMODO']=='ALTA_POLIZA' && empty requestScope.clausulas_especificas && empty requestScope.axisctr006_clausulaSeleccionada) || requestScope.axisctr006_clausulaSeleccionada eq miListaId['SCLABEN']   }">checked</c:if> 
                                            type="checkbox" id="selectedClausula" name="selectedClausula" value="${miListaId['SCLABEN']}"/>
                                        </div>    
                                    </display:column>
                                    <axis:visible f="axisctr006" c="SCLABEN">
                                    <display:column title="${title0}" sortable="true" sortProperty="SCLABEN" headerClass="headwidth5 sortable"  media="html" autolink="false" >
                                        <div class="dspNumber">${miListaId['SCLABEN']}</div>
                                    </display:column>
                                    </axis:visible>
                                    <display:column title="${title1}" sortable="true" sortProperty="TCLABEN" headerClass="sortable" media="html" autolink="false" >
                                        <div class="dspText">${miListaId['TCLABEN']}</div>
                                    </display:column>
                                </display:table>
                            </div>
                            <div class="separador">&nbsp;</div>
                        </td>
                    </tr>
                    </table>
                    </td>
                    </tr>
                </table>
               
                <!--campos-->
                <axis:ocultar f="axisctr006" c="TCLAESP">
                    <table class="seccion">
                     <tr>
                        <td>
                        <table class="area" align="center">
                        <tr>
                            <td colspan="2" align="left">
                                <div class="titulo" style="margin-left:10px;font-size: 11px;"><img src="images/flecha.gif"/><axis:alt f="axisctr006" c="CLAU_ESP" lit="9901198" /></div>
                            </td>
                        </tr>
                        <tr>
                            <td >
                            <div class="separador">&nbsp;</div>
                                <textarea onclick="f_habilita_textarea()" onfocus="javascript:if (this.readonly) this.blur()" class="campo campotexto" style="width:100%;" name="clausulas_especificas" id="clausulas_especificas">${requestScope.clausulas_especificas}</textarea>
                            <div class="separador">&nbsp;</div>
                            </td>
                        </tr>
                        </table>
                        </td>
                        </tr>
                    </table>
                 </axis:ocultar>
                  </axis:ocultar>
                <axis:visible c="BEN_IDENT" f="axisctr006">
                    <c:import url="axisctr006_body_beneficiarios_identificados.jsp">
                    <c:param name="multiPantalla" value="${param.multiPantalla}"/>
                    <c:param name="nombrePantalla" value="${pantalla}"/>            
                    </c:import>
                </axis:visible>

            </td>
        </tr>
    </table>

    <c:if test="${param.multiPantalla != 'true'}">        
        <!-- Botonera -->
        <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisctr006</c:param>
            <c:param name="__botones">cancelar<axis:visible f="axisctr006" c="BT_ANT">,anterior</axis:visible><axis:visible f="axisctr006" c="BT_SEG">,siguiente</axis:visible></c:param>
        </c:import>
        </form>
    </c:if>
