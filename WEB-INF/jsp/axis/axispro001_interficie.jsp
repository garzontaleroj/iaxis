<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ page import="java.util.*" %>

<c:set var="nombrePantalla" value="interficie"/>
<c:set var="tabulador" value="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"/>
<form name="${nombrePantalla}" action="" method="POST">

    <c:set var="title0"><axis:alt f="axispro001" c="CCODIGO" lit="1000109"/></c:set><!--Código-->
    <c:set var="title1"><axis:alt f="axispro001" c="CVALAXIS" lit="9906215"/></c:set><!--Val. Axis-->
    <c:set var="title2"><axis:alt f="axispro001" c="CVALAXISDEF" lit="9906217"/></c:set><!--Val. Defecto Axis-->
    <c:set var="title3"><axis:alt f="axispro001" c="CVALEMP" lit="9906216"/></c:set><!--Val. Empresa-->
    <c:set var="title4"><axis:alt f="axispro001" c="CVALDEF" lit="9906218"/></c:set><!--Val. Defecto Empresa-->
    <c:set var="title5"><axis:alt f="axispro001" c="EDITA" lit="9901356" /></c:set><!-- Editar -->
    <c:set var="title6"><axis:alt f="axispro001" c="BORRA" lit="1000127" /></c:set><!-- Eliminar -->
    
    <table cellpadding="0" cellspacing="5" class="seccion" style="padding:1% 1% 1% 1%">                                            
    <tr>
        <td>
            <display:table name="${mntproducto.INTERFICIES}" id="miListaInter" export="false" class="dsptgtable" pagesize="5" sort="list" cellpadding="0" cellspacing="0"
            requestURI="axis_axispro001.do?paginar=true&operation=interficies">
            <%@ include file="../include/displaytag.jsp"%>
                <display:column title="${title0}" sortable="true" sortProperty="OB_IAX_INTERFICIES.CCODIGO" headerClass="sortable" media="html" autolink="false" >
                    <div class="dspText">${miListaInter.OB_IAX_INTERFICIES.CCODIGO }</div>
                </display:column>
                <display:column title="${title1}" sortable="true" sortProperty="OB_IAX_INTERFICIES.CVALAXIS" headerClass="sortable" media="html" autolink="false" >
                    <div class="dspText">${miListaInter.OB_IAX_INTERFICIES.CVALAXIS }</div>
                </display:column>
                <display:column title="${title2}" sortable="true" sortProperty="OB_IAX_INTERFICIES.CVALAXISDEF" headerClass="sortable" media="html" autolink="false" >
                    <div class="dspText">${miListaInter.OB_IAX_INTERFICIES.CVALAXISDEF }</div>
                </display:column>
                <display:column title="${title3}" sortable="true" sortProperty="OB_IAX_INTERFICIES.CVALEMP" headerClass="sortable" media="html" autolink="false" >
                    <div class="dspText">${miListaInter.OB_IAX_INTERFICIES.CVALEMP }</div>
                </display:column>
                <display:column title="${title4}" sortable="true" sortProperty="OB_IAX_INTERFICIES.CVALDEF" headerClass="sortable" media="html" autolink="false" >
                    <div class="dspText">${miListaInter.OB_IAX_INTERFICIES.CVALDEF }</div>
                </display:column>
                <display:column title="${title5}" style="width:4%" sortable="false" headerClass="sortable" media="html" autolink="false" >
                    <div class="dspNumber"><img border="0" alt='<axis:alt f="axispro001" c="EDITA_INT" lit="9901356"/>' title='<axis:alt f="axispro001" c="EDITA_INT" lit="9901356"/>' src="images/lapiz.gif" onClick="javascript:f_abrir_modal('axispro052',null,'&isNew=no&CCODIGO='+'${miListaInter.OB_IAX_INTERFICIES.CCODIGO}'+'&CVALAXIS='+'${miListaInter.OB_IAX_INTERFICIES.CVALAXIS}'+'&CVALAXISDEF='+'${miListaInter.OB_IAX_INTERFICIES.CVALAXISDEF}'+'&CVALEMP='+'${miListaInter.OB_IAX_INTERFICIES.CVALEMP}'+'&CVALDEF='+'${miListaInter.OB_IAX_INTERFICIES.CVALDEF}');" style="cursor:pointer"/></div>
                </display:column>
                <display:column title="${title6}" style="width:4%" sortable="false" headerClass="sortable" media="html" autolink="false" >
                    <div class="dspNumber"><img border="0" alt='<axis:alt f="axispro001" c="BORRA_INT" lit="9001333"/>' title='<axis:alt f="axispro001" c="BORRA_INT" lit="9001333"/>' src="images/delete.gif" onclick="javascript:f_borrar_interficie('${miListaInter.OB_IAX_INTERFICIES.CCODIGO}','${miListaInter.OB_IAX_INTERFICIES.CVALAXIS}');" style="cursor:pointer"/></div>
                </display:column>
            </display:table>
            <!--/div-->
        </td>
    </tr>
    </table>

</form>