<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1252"/>
    <title>axisajaxpeditar</title>
    <link rel="stylesheet" href="styles/genericosHtml.css" type="text/css">
    <link rel="stylesheet" href="styles/axisnt.css" type="text/css">

        <c:import url="../include/carga_framework_js.jsp" />
        <!--********** CALENDARIO ************************* -->
        <!-- Hoja de estilo del Calendario -->
        <link rel="stylesheet" type="text/css" media="all" href="styles/calendar-green.css" title="green" />
        <!-- Script principal del calendario -->
        <script type="text/javascript" src="scripts/calendar.js"></script>
        <!-- Idioma del calendario, en función del Locale -->
        <script type="text/javascript" src="scripts/calendar-${sessionScope.__locale}.js"></script>
        <!-- Setup del calendario -->
        <script type="text/javascript" src="scripts/calendar-setup.js"></script>
        <!--*********************************** -->
    <script language="Javascript">
    function f_but_cancelar() {
        parent.f_cerrar_axismpreditor()
    }
    function f_but_aceptar() {
        /*
        if (document.miForm.XVALPAR.value.length>0) {
            document.miForm.submit()
        }
        modificacion: cuando se informa un valor vacio, hay que tratar como un null, y en vez de grabar, eliminar!
        */
        if (objValidador.validaEntrada()) {
            document.miForm.submit()
        }
    }
    function f_onload() {
        //if (document.miForm.XVALPAR!=null && document.miForm.XVALPAR!=undefined )document.miForm.XVALPAR.focus()
        <c:if test="${RETURN==0}">
        parent.actualizarPtho(document.miForm.XVALPAR.value);
        parent.f_cerrar_axismpreditor();
        </c:if>
        f_setTPARAM('<c:out value="${TPARAM}"/>');
        
        
    }
    function f_setTPARAM(tparam){
        if (tparam.length > 84){
            tparam = tparam.substring(0,80)+' ...';
        }
        document.getElementById('td_tparam').innerHTML += tparam ;
    }
    </script>
  </head>
  <body onload="f_onload()">
    <form name="miForm" action="modal_axismpreditor.do" method="POST"> 
    <input type="hidden" name="operation" value="aceptar" />
    <input type="hidden" name="SPRODUC" value="${__formdata.SPRODUC}" />
    <input type="hidden" name="CTIPO" value="${__formdata.CTIPO}" />
    <input type="hidden" name="CPARAM" value="${__formdata.CPARAM}" />
    <input type="hidden" name="CUTILI" value="${__formdata.CUTILI}" />
    <input type="hidden" name="CEMPRES" value="${__formdata.CEMPRES}" />
    <input type="hidden" name="CACTIVI" value="${__formdata.CACTIVI}" />
    <input type="hidden" name="CGARANT" value="${__formdata.CGARANT}" />
    <table class="basetitulo100" align="center" cellpadding="0" cellspacing="0" style="width:100%;" border="0">
        <tr>
            <td>
                <table>
                    <tr>
                        <td style="font-size:11px;color:white">
                            [axismpreditor]
                        </td>
                        <td style="font-size: 14px;text-align:right;vertical-align: middle;color:white">
                            <b>PARAMEDITOR</b>&nbsp;
                        </td>
                    </tr>
                </table>
            </td>
     </tr>
    </table>
    
    <table id="tabla1" xclass="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0" style="width:100%; height:50px">
        <tr>
            <td>
                <table cellpadding="0" cellspacing="0">
                    <tr>
                        <th style="height:0px;width:35%"></th>
                        <th style="height:0px;width:65%"></th>
                    </tr>
                    <tr>
                        <td id="td_tparam">
                            <b><fmt:message key="104111" /></b>
                            <br />
                            <%--${TPARAM}-->
                            <%--<br />[<code>${__formdata.CPARAM}</code>]--%>
                        </td>
                        <td>
                            <b><fmt:message key="101159" /></b>
                            <i>
                                <c:if test="${__formdata.CTIPO==1}"><fmt:message key="100566" /></c:if>
                                <c:if test="${__formdata.CTIPO==2}"><fmt:message key="100899" /></c:if>
                                <c:if test="${__formdata.CTIPO==3}"><fmt:message key="109307" /></c:if>
                                <c:if test="${__formdata.CTIPO==4}"><fmt:message key="110263" /></c:if>
                            </i>
                            <br />
                            <c:choose>
                                <c:when test="${__formdata.CTIPO==1}">
                                    <textarea name="XVALPAR" id="XVALPAR" class="campo campotexto_ob"  title="XVALPAR" rows="3" cols="50" style="width:99%">${__formdata.XVALPAR}</textarea>
                                </c:when>
                                <c:when test="${__formdata.CTIPO==2}">
                                    <input type="text" class="campo campotexto_ob" title="XVALPAR" formato="entero" id="XVALPAR" name="XVALPAR" value="${__formdata.XVALPAR}"  style="width:50px" />
                                </c:when>
                                <c:when test="${__formdata.CTIPO==3}">
                                    <input formato="fecha" type="text" class="campo campotexto_ob"  title="XVALPAR" id="XVALPAR" name="XVALPAR" size="15" value="<fmt:formatDate value="${__formdata.XVALPAR}" pattern="dd/MM/yyyy"/>" style="width:100px" /><a style="vertical-align:middle;" href="#"><img id="popup_XVALPAR" border="0" src="images/calendar.gif"/></a>
                                    <script type="text/javascript">
                                    Calendar.setup({
                                    inputField     :    "XVALPAR",    
                                    ifFormat       :    "%d/%m/%Y",     
                                    button         :    "popup_XVALPAR",  
                                    singleClick    :    true,
                                    firstDay       :    1
                                    });
                                    
                                    </script>
                                </c:when>
                                <c:when test="${__formdata.CTIPO==4}">
                                    <select class="campo campotexto_ob" id="XVALPAR" name="XVALPAR"  title="XVALPAR"></select>
                                </c:when>
                            </c:choose>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <c:import url="../include/botonera_nt.jsp">
        <c:param name="__botones">cancelar,aceptar</c:param>
    </c:import>
    </form>
    <c:import url="../include/mensajes.jsp" />
    </body>
</html>
<%@ page contentType="text/html;charset=windows-1252"%>
