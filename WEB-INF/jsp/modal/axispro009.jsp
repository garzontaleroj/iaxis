<%--
/**
*  Fichero: axispro009.jsp
*  @author <a href = "mailto:xpastor@csi-ti.com">Xavier Pastor</a>
*  
*  T?tulo: Modal datos Datos rentas
*
*  Fecha: 08/05/2008
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
    <title><fmt:message key="151090"/></title>
    <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
    <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
    <link rel="stylesheet" href="styles/displaytag.css">
    <c:import url="../include/carga_framework_js.jsp"/>
    <script type="text/javascript">
        function f_onload() { 
        var val1 = "<%=request.getAttribute("OK")%>"; 
        if (val1=="OK"){
            parent.f_aceptar_axispro002(${mntproducto.SPRODUC});
            this.f_but_cancelar();
        }
   }
        
        function f_but_aceptar(){
          //  parent.f_aceptar_axispro004();
         document.miForm.submit()
        }
        
        function f_but_cancelar(){
            parent.f_cerrar_modal("axispro009");
        }
        
    </script>
</head>
<body onload="javascript:f_onload()">
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
    <form name="miForm" action="modal_axispro009.do" method="POST">
    <input type="hidden" name="operation" value="guardar" />
    <input type="hidden" name="SPRODUC" value="${mntproducto.SPRODUC}"/>
    <input type="hidden" name="subpantalla" value="datosrentas"/>
    
    <c:import url="../include/titulo_nt.jsp">
        <c:param name="titulo"><fmt:message key="1000220"/></c:param>
        <c:param name="formulario"><fmt:message key="1000220"/></c:param>
        <c:param name="form">axispro009</c:param>
    </c:import>
    <div class="separador">&nbsp;</div>
 
     <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
       <tr>
            <td>    
       <table cellpadding="0" cellspacing="5" class="seccion">
        <tr>
            <th style="width:25%;height:0px"></th>
            <th style="width:25%;height:0px"></th>
            <th style="width:25%;height:0px"></th>
            <th style="width:25%;height:0px"></th>
        </tr>
        <tr>
            <td class="titulocaja">
                <b><fmt:message key="109382"/></b>
            </td>
            <td class="titulocaja">
                <b><fmt:message key="108831"/></b>
            </td>
            <td class="titulocaja" colspan="">
                <b><fmt:message key="108971"/></b>
            </td>
            <td class="titulocaja">
                <b><fmt:message key="180148"/></b>
            </td>
        </tr>
        <tr>
            <td align="left">
                <input type="text" name="TTIPREN" value="${mntproducto.DATRENT.TTIPREN}" class="campowidthinput campo campotexto" style="width:90%"
                <axis:atr f="axispro001" c="TTIPREN" a="modificable=false"/> />
            </td>
            <td align="left">
                <input type="text" name="TCLAREN" value="${mntproducto.DATRENT.TCLAREN}" class="campowidthinput campo campotexto" style="width:90%"
                <axis:atr f="axispro001" c="TCLAREN" a="modificable=false"/> />
            </td>
             <td align="left">
                <input type="text" name="TPA1REN" value="${mntproducto.DATRENT.TPA1REN}" class="campowidthinput campo campotexto" style="width:65%"
                <axis:atr f="axispro001" c="TPA1REN" a="modificable=false"/> />
            <c:if test="${mntproducto.DATRENT.CPA1REN != 0}">
                    <input type="text" name="NPA1REN" value="${mntproducto.DATRENT.NPA1REN}" class="campowidthinput campo campotexto" style="width:25%"
                    <axis:atr f="axispro001" c="NPA1REN" a="modificable=false"/> />
            </c:if>
            </td>
            <td align="left">
                <input type="text" name="TPCTREV" value="${mntproducto.DATRENT.TPCTREV}" class="campowidthinput campo campotexto" style="width:65%"
                <axis:atr f="axispro001" c="TPCTREV" a="modificable=false"/> />
            <%-- <c:set target="${mntproducto.DATRENT}" property="CPCTREV" value="1"/> <!-- TODO: Poner CPCTREV a saco para pruebas --> --%>
            <c:if test="${mntproducto.DATRENT.CPCTREV  == 1}">
                    <input type="text" name="NPCTREV" value="${mntproducto.DATRENT.NPCTREV}" class="campowidthinput campo campotexto" style="width:25%"
                    <axis:atr f="axispro001" c="NPCTREV" a="modificable=false"/> />
            </c:if>
            </td>
        </tr>
        <tr>
            <%-- <c:set target="${mntproducto.DATRENT}" property="CCLAREN" value="1"/> <!-- TODO: Poner CCLAREN a saco para pruebas --> --%>
            <c:if test="${mntproducto.DATRENT.CCLAREN == 1 || mntproducto.DATRENT.CCLAREN == 2}">
                <c:set var="literalTiempo">
                    ${mntproducto.CCLAREN == 1 ? 108973 : 108972}
                </c:set>
                <td class="titulocaja" style="text-align:left">
                    <b><fmt:message key="${literalTiempo}"/></b>
                </td>
            </c:if>
            <c:if test="${mntproducto.DATRENT.CPCTREV  == 2}">
                <td class="titulocaja">
                    <b><fmt:message key="103342"/></b>
                </td>
                <td class="titulocaja">
                    <b><fmt:message key="112412"/></b>
                </td>
            </c:if>
        </tr>
        <tr>
            <c:if test="${mntproducto.DATRENT.CPCTREV  == 2}">
                <%-- <c:set target="${mntproducto.DATRENT}" property="CCLAREN" value="1"/> <!-- TODO: Poner CCLAREN a saco para pruebas --> --%>
            <c:if test="${mntproducto.DATRENT.CCLAREN == 1 || mntproducto.DATRENT.CCLAREN == 2}">
                <td align="left">
                    <input type="text" name="NNUMREN" value="${mntproducto.DATRENT.NNUMREN}" class="campowidthinput campo campotexto" style="width:90%"
                    <axis:atr f="axispro001" c="NNUMREN" a="modificable=false"/> />
                </td>
            </c:if>
                <td align="left">
                    <input type="text" name="NPCTREVMIN" value="${mntproducto.DATRENT.NPCTREVMIN}" class="campowidthinput campo campotexto" style="width:25%"
                    <axis:atr f="axispro001" c="NPCTREVMIN" a="modificable=false"/> />
                </td>
                <td align="left">
                    <input type="text" name="NPCTREVMAX" value="${mntproducto.DATRENT.NPCTREVMAX}" class="campowidthinput campo campotexto" style="width:25%"
                    <axis:atr f="axispro001" c="NPCTREVMAX" a="modificable=false"/> />
                </td>
            </c:if>
        </tr>
    </table>
    <div class="separador">&nbsp;</div>
    <table cellpadding="0" cellspacing="5" class="seccion">
        <tr>
            <td width="100%">
                <table width="100%">
                <tr>
                    <th style="width:25%;height:0px"></th>
                    <th style="width:25%;height:0px"></th>
                    <th style="width:25%;height:0px"></th>
                    <th style="width:25%;height:0px"></th>
                </tr>
                <tr>
                    <td class="titulocaja" style="5%"  nowrap>
                        <b><fmt:message key="1000352"/></b>
                    </td>
                    <%-- <c:set target="${mntproducto.DATRENT}" property="CMUNREC" value="0"/> <!-- TODO: Poner CMUNREC a saco para pruebas --> --%>
                    <c:if test="${mntproducto.DATRENT.CMUNREC == 0}">
                        <td class="titulocaja" nowrap>
                            <b><fmt:message key="101307"/></b>
                        </td>
                    </c:if>
                    <td class="titulocaja" nowrap>
                        <b><fmt:message key="1000323"/></b>
                    </td>
                        
                </tr>
                    <td align="left" class="campocaja">
                        <input type="text"  name="TMUNREC" value="${mntproducto.DATRENT.TMUNREC}" class="campowidthinput campo campotexto" 
                        <axis:atr f="axispro001" c="TMUNREC" a="modificable=false"/> />
                    </td>
                    <c:if test="${mntproducto.DATRENT.CMUNREC == 0}">
                        <td align="left" class="campocaja">
                            <input type="text" name="TESTMRE" value="${mntproducto.DATRENT.TESTMRE}" class="campowidthinput campo campotexto" 
                            <axis:atr f="axispro001" c="TESTMRE" a="modificable=false"/> />
                        </td>
                    </c:if>
                    <td align="left" class="campocaja">
                        <input type="text"  name="TRECREN" value="${mntproducto.DATRENT.TRECREN}" class="campowidthinput campo campotexto" style="width:90%"
                        <axis:atr f="axispro001" c="TRECREN" a="modificable=false"/> />
                    </td>
                </tr>
                </table>                
            </td>
        </tr>
    </table>
    <div class="separador">&nbsp;</div>
    <table cellpadding="0" cellspacing="5" class="seccion">
        <tr>
            <th style="width:1%;height:0%;"/>
            <th style="width:45%;height:0%;"/>
            <th style="width:1%;height:0%;"/>
            <th style="width:45%;height:0%;"/>
        </tr>
        <tr>
            <td>
                &nbsp;
            </td>
            <td class="titulocaja">
                <u><b><fmt:message key="1000237"/></b></u>
                <div class="separador">&nbsp;</div>
                <div class="displayspace" style="height:170px">
                     <c:set var="title0"><fmt:message key="109373"/></c:set>
                     <c:set var="title1"><fmt:message key="108347" /></c:set>
                     <display:table name="${mntproducto.DATRENT.RENTASFORMULA}" id="RENTASFORMULA" export="false" class="dsptgtable" pagesize="6" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                     requestURI="axis_axispro001.do?paginar=true&operation=datosrentas"> 
                       <%@ include file="../include/displaytag.jsp"%>
                       <display:column title="" sortable="true" sortProperty="OB_IAX_PRODRENTASFORMULA.CCAMPO" headerClass="headwidth10 sortable"  media="html" autolink="false" >
                           <div class="dspNumber">${RENTASFORMULA.OB_IAX_PRODRENTASFORMULA.CCAMPO}</div>
                       </display:column>
                       <display:column title="${title0}" sortable="true" sortProperty="OB_IAX_PRODRENTASFORMULA.TCAMPO" headerClass="sortable"  media="html" autolink="false" >
                           <div class="dspText">${RENTASFORMULA.OB_IAX_PRODRENTASFORMULA.TCAMPO}</div>
                       </display:column>
                       <display:column title="" sortable="true" sortProperty="OB_IAX_PRODRENTASFORMULA.CLAVE" headerClass="headwidth10 sortable"  media="html" autolink="false" >
                           <div class="dspNumber">${RENTASFORMULA.OB_IAX_PRODRENTASFORMULA.CLAVE}</div>
                       </display:column>
                       <display:column title="${title1}" sortable="true" sortProperty="OB_IAX_PRODRENTASFORMULA.FORMULA" headerClass="sortable"  media="html" autolink="false" >
                           <div class="dspText">${RENTASFORMULA.OB_IAX_PRODRENTASFORMULA.FORMULA}</div>
                       </display:column>
                    </display:table>
                </div>
            </td>
            <td>
                &nbsp;
            </td>
            <td class="titulocaja">
                <u><b><fmt:message key="103313"/></b></u>
                <div class="separador">&nbsp;</div>
                <div class="displayspace" style="height:170px">
                    <c:set var="title0"><fmt:message key="100712" /></c:set>
                    <display:table name="${mntproducto.DATRENT.FORPAGREN}" id="FORPAGREN" export="false" class="dsptgtable" pagesize="6" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                    requestURI="axis_axispro001.do?paginar=true&operation=datosrentas">
                      <%@ include file="../include/displaytag.jsp"%>
                      <display:column title="${title0}" sortable="true" sortProperty="OB_IAX_PRODFORPAGREN.TFORPAG" headerClass="sortable"  media="html" autolink="false" >
                          <div class="dspText">${FORPAGREN.OB_IAX_PRODFORPAGREN.TFORPAG}</div>
                      </display:column>
                      <display:column sortable="true" sortProperty="OB_IAX_PRODFORPAGREN.COBLIGA" headerClass="headwidth10 sortable"  media="html" autolink="false" >
                          <div class="dspIcons">
                               <input type="checkbox" name="COBLIGA" 
                               <c:if test="${FORPAGREN.OB_IAX_PRODFORPAGREN.COBLIGA == 1}"> checked</c:if>
                               <axis:atr f="axispro001" c="OB_IAX_PRODFORPAGREN.COBLIGA" a="modificable=false"/> disabled /> 
                          </div>
                      </display:column>
                    </display:table>
                </div>
            </td>
        </tr>
    </table>
    </table>
</form>
    <c:import url="../include/botonera_nt.jsp"><c:param name="__botones">cancelar,aceptar</c:param></c:import>
    
  <c:import url="../include/mensajes.jsp" />
</html>