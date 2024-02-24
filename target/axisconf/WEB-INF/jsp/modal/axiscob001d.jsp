<%/*
*  Fichero: axiscob001c.jsp
*  @author <a href = "mailto:jpacheco@csi-ti.com">Juan Carlos PAcheco</a> 
*     
*/
%>
<%@ page contentType="text/html;charset=windows-1252" errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page import="java.util.List" %>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<html>
  <head>
    <link rel="stylesheet" href="styles/genericosHtml.css" type="text/css">
    <link rel="stylesheet" href="styles/axisnt.css" type="text/css">
    <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>
    <%-- Especial per controlar els scroll amb iPad --%>
        <link type="text/css" href="styles/jquery.jscrollpane.css" rel="stylesheet" media="only screen and (min-device-width: 768px) and (max-device-width: 1024px)" />
        <style type="text/css" id="page-css"> </style>
    <%-- FI Especial per controlar els scroll amb iPad --%>
    <c:import url="../include/carga_framework_js.jsp" />
    <script language="Javascript" type="text/javascript">

        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/

        function f_onload() {
        
            try{
                document.miForm.NOMBRE.focus();
            } catch (e) {	
                try{
                    document.miForm.NOMBRECOMP.focus();
                }catch(e){ alert(e);}
            }
            
            if (document.all) // ES Explorer
                document.getElementById("tabla1").style.marginLeft="1.3%";
            
            f_cargar_propiedades_pantalla();
        }           
        
        function f_but_cancelar() {
            parent.f_cerrar_modal("axiscob001d");
        }
        
    </script>
  </head>
    <body onload="f_onload();">
    
        <c:import url="../include/titulo_nt.jsp">
            <c:param name="titulo">
            <axis:alt f="axiscob001" c="TITULO" lit="9908733"/>
            </c:param>
            <c:param name="formulario">
            <axis:alt f="axiscob001" c="FORM" lit="9908006"/>
            </c:param>
            <c:param name="form">axiscob001d</c:param>
        </c:import>
        
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
        
        <form name="miForm" action="" method="POST">
            <input type="hidden" name="operation" value=""/>
            <input type="hidden" name="SPERSON" id="SPERSON" value="${__formdata.SPERSON}" />
            <input type="hidden" name="SNIP" id="SNIP" value="${__formdata.SNIP}" />
            <input type="hidden" name="CAGENTE" id="CAGENTE" value="${__formdata.CAGENTE}" />
            <input type="hidden" name="SSEGURO" id="SSEGURO" value="${__formdata.SSEGURO}" />
            <input type="hidden" name="MODO_SWPUBLI" id="MODO_SWPUBLI" value="${__formdata.MODO_SWPUBLI}" />
            <input type="hidden" name="MODO_BUSQUEDA" id="MODO_BUSQUEDA" value="${__formdata.MODO_BUSQUEDA}" />
            <input type="hidden" name="ORIGEN" id="ORIGEN" value="${__formdata.ORIGEN}" />
            <input type="hidden" name="CONDICION" id="CONDICION" value="${__formdata.CONDICION}" />
            <input type="hidden" name="SEQCAJA" id="SEQCAJA" value="" />
            
            
            <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0" style="height:10px;">
            <tr>
            <td>
                <div class="separador">&nbsp;</div>
                <div class="titulo">
                    <img src="images/flecha.gif"/>
                    <b><axis:alt f="axiscob001d" c="LIT32" lit="9908006"/></b>
                </div>
                <table class="seccion">
                <tr>                        
                <td align="left">
                    <table class="area" align="center">
                    <tr> 
                        <th style="width:25%;height:0px"></th>
                        <th style="width:25%;height:0px"></th>
                        <th style="width:25%;height:0px"></th>
                        <th style="width:25%;height:0px"></th>
                    </tr>
                    
                    <tr>
                        <axis:ocultar f="axiscob001d" c="POLICY" dejarHueco="false"> 
                        <td class="titulocaja">
                            <b><axis:alt f="axiscob001d" c="POLICY" lit="9001875" /></b>
                        </td>                                            
                        </axis:ocultar>
                        
                        <axis:ocultar f="axiscob001d" c="HOLDER" dejarHueco="false"> 
                        <td class="titulocaja">
                            <b><axis:alt f="axiscob001d" c="HOLDER" lit="9907907" /></b>
                        </td>                                            
                        </axis:ocultar>
                        
                    </tr>
                    
                    <tr>
                        <axis:visible f="axiscob001d" c="POLICY">
                        <td class="campocaja">
                           <input type="text" style="width:300px" class="campo campotexto" value="${__formdata.NPOLIZA}" name="NPOLIZA" id="NPOLIZA" size="15" 
                                  <axis:atr f="axiscob001d" c="POLICY" a="modificable=false"/>/>
                        </td>
                        </axis:visible>  
                        
                        <axis:visible f="axiscob001d" c="HOLDER">
                        <td class="campocaja">
                            <input type="text" style="width:300px" class="campo campotexto" value="${__formdata['NOMBRE']}" name="NOMBRE" id="NOMBRE" size="15" 
                            <axis:atr f="axiscob001d" c="HOLDER" a="modificable=false"/>/>
                        </td>
                        </axis:visible>
                    </tr>
                    </table>                    
                </td>                        
                </tr>
                </table>
                
                    <div class="separador">&nbsp;</div>
                    
                    <c:set var="title0"><axis:alt f="axiscob001d" c="NNUMLIN" lit="100899"/></c:set> <!-- 100899 Número -->
                    <c:set var="title1"><axis:alt f="axiscob001d" c="FFECMOV" lit="1000597"/></c:set> <!--1000597 Fecha día -->
                    <c:set var="title2"><axis:alt f="axiscob001d" c="FFECVAL" lit="1000590"/></c:set> <!-- 1000590 Fecha valor -->
                    <c:set var="title3"><axis:alt f="axiscob001d" c="CMOVIMI" lit="1000591"/></c:set> <!--1000591 Tipo movimiento -->
                    <c:set var="title30"><axis:alt f="axiscob001d" c="TDESCRI" lit="101761"/></c:set> <!--101761 Descripción-->
                    <c:set var="title4"><axis:alt f="axiscob001d" c="CMEDMOV" lit="9902444"/></c:set> <!-- 9902444 Medio de Pago -->
                    <c:set var="title5"><axis:alt f="axiscob001d" c="NCHEQUE" lit="9905071"/></c:set> <!-- 9905071 Cheque -->
                    <c:set var="title6"><axis:alt f="axiscob001d" c="IIMPPRO"   lit="9905111"/></c:set> <!-- 9905111 Importe Moneda Producto  -->
                    <c:set var="title7"><axis:alt f="axiscob001d" c="CMONEDA" lit="108645"/></c:set> <!--108645 Moneda -->
                    <c:set var="title8"><axis:alt f="axiscob001d" c="IIMPOPE" lit="100563"/></c:set> <!-- 100563 Importe -->
                    <c:set var="title9"><axis:alt f="axiscob001d" c="IIMPINS" lit="9905112"/></c:set> <!-- 9905112 Importe Moneda Sistema -->
                    <c:set var="title10"><axis:alt f="axiscob001d" c="FCAMBIO" lit="9900897"/></c:set> <!-- 9900897 Fecha cambio -->
                    <c:set var="title11"><axis:alt f="axiscob001d" c="ISALDO" lit="9001942"/></c:set> <!-- 9001942 Saldo -->
                    <c:set var="title12"><axis:alt f="axiscob001d" c="TMOVIMI" lit="1000591"/></c:set> <!--1000591 Tipo movimiento -->
                    <c:set var="title13"><axis:alt f="axiscob001d" c="TMEDMOV" lit="9902444"/></c:set> <!-- 9902444 Medio de Pago -->
                    <c:set var="title14"><axis:alt f="axiscob001d" c="TMEDMOV" lit="9001285"/></c:set> <!-- REFERENCIA DEPOSITO-->

                    
                    <div class="seccion displayspacePersonas"> 
                    
                        <display:table name="${sessionScope.listaPolizas}"  id="lstMov" export="false" class="dsptgtable" pagesize="-1" sort="list"
                        cellpadding="0" cellspacing="0" requestURI="modal_axiscob001d.do?paginar=true" style="width:100%" >
                        
                        <%@ include file="../include/displaytag.jsp"%>
                        
                        <axis:visible f="axiscob001d" c="NREFDEPOSITO" >                        
                        <display:column title="${title14}" sortable="true" sortProperty="CMOVIMI" headerClass="sortable" media="html" autolink="false" style="white-space:nowrap; width:15px">
                        <div class="dspText">
                            ${lstMov.NREFDEPOSITO}
                        </div>
                        </display:column>                        
                        </axis:visible>
                        
                        <axis:visible f="axiscob001d" c="DATE" >
                        <display:column title="${title1}" sortable="true" sortProperty="FFECMOV" headerClass="sortable" media="html" autolink="false" style="white-space:nowrap; width:15px">
                        <div class="dspDate">
                            <fmt:formatDate pattern='dd/MM/yyyy' value='${lstMov.FFECMOV}'/> 
                        </div>
                        </display:column>
                        </axis:visible>
                        
                        <axis:visible f="axiscob001d" c="VALUE_DATE" >
                        <display:column title="${title2}" sortable="true" sortProperty="FFECVAL" headerClass="sortable" media="html" autolink="false" style="white-space:nowrap; width:15px">
                        <div class="dspDate">
                            <fmt:formatDate pattern='dd/MM/yyyy' value='${lstMov.FFECVAL}'/> 
                        </div>
                        </display:column>
                        </axis:visible>
                        
                        
                        <display:column title="${title30}" sortable="true" sortProperty="TDESCRI" headerClass="sortable" media="html" autolink="false">
                        <div class="dspText">
                            ${lstMov.TDESCRI}
                        </div>
                        </display:column>
                        
                        <display:column title="${title8}" sortable="true" sortProperty="IIMPOPE" headerClass="sortable" media="html" autolink="false" style="white-space:nowrap; " >
                        <div class="dspNumber">
                            <fmt:formatNumber pattern="${applicationScope.__formatNumberPatterns[lstMov.CMONEDA]}" value="${lstMov.IIMPOPE}"/> ${lstMov.CMONEDA} 
                        </div>                        
                        </display:column>
                        
                        <display:column title="${title6}" sortable="true" sortProperty="IIMPPRO" headerClass="sortable" media="html" autolink="false" style="white-space:nowrap; " >
                        <div class="dspNumber">
                            <fmt:formatNumber pattern="${__formatNumberPatterns[lstMov.CMONEDAPRO]}" value="${lstMov.IIMPPRO}"/> ${lstMov.CMONEDAPRO}
                        </div>                        
                        </display:column>
                        
                        <display:column title="${title9}" sortable="true" sortProperty="IIMPINS" headerClass="sortable" media="html" autolink="false"  style="white-space:nowrap;">
                        <div class="dspNumber">
                            <fmt:formatNumber pattern="${applicationScope.__formatNumberPatterns[lstMov.CMONEDAINS]}" value="${lstMov.IIMPINS}"/> ${lstMov.CMONEDAINS}
                        </div>
                        </display:column>
                        
                        </display:table>
                    </div>                    
               
            </td>
            </tr>            
            </table>
            
            <div class="separador">&nbsp;</div>
            <c:import url="../include/botonera_nt.jsp"><c:param name="f">axiscob001d</c:param><c:param name="f">axiscob001d</c:param>
                <c:param name="f">axiscob001d</c:param>
                <c:param name="__botones">cancelar</c:param>
            </c:import>
        </form>
    <c:import url="../include/mensajes.jsp" />
    </body>
    <c:if test="${ (fn:containsIgnoreCase(header['User-Agent'],'ipad') )   }">
      <script language="Javascript" type="text/javascript">  
        retocarPAGE_CSS('axiscob001d');
      </script>                   
    </c:if>
</html>

