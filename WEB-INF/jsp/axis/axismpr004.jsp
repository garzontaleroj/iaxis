<%/**
*  Fichero: ${sessionScope.AXISMPRXXX}.jsp
*  @author <a href = "mailto:echristen@csi-ti.com">Elmar Christen</a>
*  
*/
%>
<%@ page contentType="text/html;charset=windows-1252" errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
    <head>
        <title><axis:alt f="axismpr004" c="TITULOMPR004" lit="formulario.${sessionScope.AXISMPRXXX}"/></title>
        <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
        <link rel="stylesheet" href="styles/displaytag.css">
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
        <script type="text/javascript">
            function f_cactivi(ths) {
                //if (ths.selectedIndex!=0) {
                    objUtiles.ejecutarFormulario ("axis_${sessionScope.AXISMPRXXX}.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);     
                //}
            }        
            
            function f_ondblclick(ths) {
                ptho=ths
                var parsedVal=parseVal(ths.name)
                var CUTILI=parsedVal[0]
                var CTIPO=parsedVal[1]
                var CPARAM=parsedVal[2]

                var CACTIVI=document.miForm.CACTIVI.value
                var CGARANT=detectRadiovalue(document.miForm.CGARANT)

                var XVALPAR=ths.value
                var SPRODUC=document.miForm.SPRODUC.value
                f_abrir_axismpreditor(SPRODUC,CUTILI, CTIPO, CPARAM, XVALPAR,CACTIVI,CGARANT)
                
            }
            
            function getparam(cg) {
                document.miForm.CGARANT.value=cg
                objUtiles.ejecutarFormulario ("axis_${sessionScope.AXISMPRXXX}.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);     
            }
            
            function f_but_salir() {
                objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axismpr004", "cancelar", document.miForm, "_self");
            //    objUtiles.ejecutarFormulario ("main.do", "trabajo", document.miForm, "_self");
            }

            function f_onload(){
                f_cargar_propiedades_pantalla();
                <c:if test="${empty __formdata.SPRODUC}">f_abrir_axismpr001();</c:if>
                <%--
                if (document.miForm.SPRODUC.value.length>0) {
                    if (document.miForm.CACTIVI.options.length>1 && document.miForm.CACTIVI.selectedIndex==0 ) {
                        document.miForm.CACTIVI.selectedIndex=1;
                        f_cactivi(document.miForm.CACTIVI)
                    }
                }
                --%>
                if (document.miForm.SPRODUC.value.length>0) {
                    if (document.miForm.CACTIVI.options.length>0 && "${__formdata.CACTIVI}".length==0 ) {
                        document.miForm.CACTIVI.selectedIndex=0;
                        f_cactivi(document.miForm.CACTIVI)
                    }
                }
                
              
                
            }
            // Modal Buscador
            function f_abrir_axismpr001 () {
                objUtiles.abrirModal("axismpr001", "src", "modal_axismpr001.do?operation=form");
            }
            function f_cerrar_axismpr001() {
                objUtiles.cerrarModal("axismpr001");
            }   
            function f_aceptar_axismpr001 (SPRODUC) {
                f_cerrar_axismpr001();
                document.miForm.SPRODUC.value=SPRODUC;
                document.miForm.CACTIVI.value="-1"
                if (document.miForm.CGARANT !=undefined) document.miForm.CGARANT.value=""
                objUtiles.ejecutarFormulario ("axis_${sessionScope.AXISMPRXXX}.do", "init", document.miForm, "_self", objJsMessages.jslit_cargando);     
            }

            function callbackonchange(responseText) {
                //alert("["+responseText+"]")
                if (responseText.substring(0,1)!="0") {
                
                    alert('<axis:alt f="axismpr004" c="CALLBACK" lit="101283"/>');
                }
            }
            
            function detectRadiovalue(ths) {
                var retVal=null;
                var i=0
                //alert(ths.length)
                if (ths.length==undefined) {
                    return ths.value;
                }
                else {
                    for (i=0; i<ths.length; i++) {
                        if (ths[i].checked) {
                            retVal=ths[i].value
                            break;
                        }
                    }
                    return retVal;
                }
            }
            
            function f_onchange(ths) {
                if (objValidador.validaEntrada()) {
                    var parsedVal=parseVal(ths.name)
                    var CUTILI=parsedVal[0]
                    var CTIPO=parsedVal[1]
                    var CPARAM=parsedVal[2]
    
                    var XVALPAR=ths.value
                    var SPRODUC=document.miForm.SPRODUC.value
    
                    var CACTIVI=document.miForm.CACTIVI.value
                    var CGARANT=detectRadiovalue(document.miForm.CGARANT)
                    var qs="operation=actualizar";
                    qs=qs+"&SPRODUC="+SPRODUC;
                    qs=qs+"&CUTILI="+CUTILI
                    qs=qs+"&CPARAM="+CPARAM
                    qs=qs+"&XVALPAR="+XVALPAR
                    qs=qs+"&CTIPO="+CTIPO
                    qs=qs+"&CACTIVI="+CACTIVI
                    qs=qs+"&CGARANT="+CGARANT
                    qs=qs+"&dt="+(new Date().getTime())
                    objAjax.invokeAsyncCGI("axis_${sessionScope.AXISMPRXXX}.do", callbackonchange, qs, this)
                }
            }
            
            function borrar(CPARAM) {
                var CACTIVI=document.miForm.CACTIVI.value
                var CGARANT=detectRadiovalue(document.miForm.CGARANT)
                var confdel=confirm(objJsMessages.jslit_confirma_borrar);
                if (confdel) {
                    document.miXForm.CPARAM.value=CPARAM
                    document.miXForm.CACTIVI.value=CACTIVI
                    document.miXForm.CGARANT.value=CGARANT
                    objUtiles.ejecutarFormulario ("axis_${sessionScope.AXISMPRXXX}.do", "borrar", document.miXForm, "_self", objJsMessages.jslit_cargando);     
                }
            }
            
            function anyadir() {
                document.miXForm.CPARAM.value=document.miForm.miCPARAM.value
                document.miXForm.XVALPAR.value=document.miForm.miXVALPAR.value
                document.miXForm.CTIPO.value=document.miForm.miCTIPO.value
                
                objUtiles.ejecutarFormulario ("axis_${sessionScope.AXISMPRXXX}.do", "anyadir", document.miXForm, "_self", objJsMessages.jslit_cargando);     
            }

            // Modal Editor axismpreditor
            var ptho=null
            function f_abrir_axismpreditor (SPRODUC,CUTILI,CTIPO, CPARAM, XVALPAR,CACTIVI,CGARANT) {
                var qs="operation=form"
                qs=qs+"&SPRODUC="+escape(SPRODUC)
                qs=qs+"&CTIPO="+escape(CTIPO)
                qs=qs+"&CUTILI="+escape(CUTILI)
                qs=qs+"&CPARAM="+escape(CPARAM)
                qs=qs+"&XVALPAR="+escape(XVALPAR)
                qs=qs+"&CACTIVI="+CACTIVI
                qs=qs+"&CGARANT="+CGARANT
                qs=qs+"&dt="+(new Date().getTime())
                objUtiles.abrirModal("axismpreditor", "src", "modal_axismpreditor.do?"+qs, 480, 200);
            }
            function actualizarPtho(v) {
                ptho.value=v
            }
            
            function f_cerrar_axismpreditor() {
                objUtiles.cerrarModal("axismpreditor");
                ptho=null
            }   

        </script>
    </head>
<body onload="f_onload()">
<c:import url="../include/precargador_ajax.jsp"><c:param name="imagen" value="images/ajax-loader.gif"></c:param></c:import>
<c:import url="../include/modal_estandar.jsp"><c:param name="nid_y_titulo">axismpr001|<axis:alt f="axismpr004" c="NIDYTIT" lit="1000206"/></c:param></c:import>
<c:import url="../include/modal_estandar.jsp"><c:param name="nid">axismpreditor</c:param><c:param name="titulo"><axis:alt f="axismpr004" c="NID" lit="100002"/></c:param><c:param name="modalModo">SOLOX</c:param></c:import>
<form name="miForm" action="" method="POST">
    <input type="hidden" name="operation"/>
    <input type="hidden" name="SPRODUC" value="${__formdata.SPRODUC}" />
    <input type="hidden" name="CPARAM"  />
    <input type="hidden" name="CTIPO"  />
    <input type="hidden" name="XVALPAR"  />

    <c:import url="../include/titulo_nt.jsp">
            <c:param name="titulo"><axis:alt f="axismpr004" c="TIT_NT" lit="151160"/></c:param>
            <c:param name="formulario"><axis:alt f="axismpr004" c="FRM_NT" lit="151160"/></c:param>
            <c:param name="form">${sessionScope.AXISMPRXXX}</c:param>
    </c:import>

<!-- Area de campos  -->
<table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
<tr>
<td>
    <div class="titulo">
        <img src="images/flecha.gif"/>${headeritem1}
        <axis:ocultar f="AXISMPR004" c="find"> 
        <img id="find" border="0" src="images/find.gif" onclick="f_abrir_axismpr001()" style="cursor:pointer"/>
        </axis:ocultar>
    </div>
    <axis:ocultar f="AXISMPR004" c="CACTIVI"> 
    <table class="seccion" id="CACTIVI">
        <tr>
            <td>
                <b><axis:alt f="axismpr004" c="CACTIVI" lit="103481"/></b>
            </td>
        </tr>
        <tr>
            <td>

                <select name="CACTIVI"  size="1" class="campo campotexto_ob" style="width:300px" onchange="f_cactivi(this)">
                    <c:forEach items="${headeritem2}" var="item">
                        <option value="${item.OB_IAXPAR_ACTIVIDADES.CACTIVI}" <c:if test="${__formdata.CACTIVI==item.OB_IAXPAR_ACTIVIDADES.CACTIVI}">selected</c:if>>${item.OB_IAXPAR_ACTIVIDADES.TACTIVI}</option>
                    </c:forEach>
                </select>

            </td>
        </tr>
    </table>
    </axis:ocultar>	
    <div class="seccion" style="height:80px;width:100%;overflow:auto">
        <c:set var="title0"><axis:alt f="axismpr004" c="title0" lit="100588"/></c:set>
        <display:table name="${headeritem3}" style="width:98%" id="item" export="false" class="dsptgtable" pagesize="-1" defaultsort="2" defaultorder="ascending"  sort="list" cellpadding="0" cellspacing="0" requestURI="axis_axismpr004.do?paginar=true">
            <%@ include file="../include/displaytag.jsp"%>
            <display:column title="" sortable="false" headerClass="headwidth5 sortable"  media="html" autolink="false" style="width:5%">    
                <div class="dspIcons"><input type="radio" <c:if test="${__formdata.CGARANT==item.OB_IAXPAR_GARANTIAS.CGARANT}">checked</c:if>   value="${item.OB_IAXPAR_GARANTIAS.CGARANT}" name="CGARANT" onclick="getparam('${item.OB_IAXPAR_GARANTIAS.CGARANT}')" /></div>
            </display:column>
            <display:column title="${title0}" sortable="true" headerClass="headwidth5 sortable"  media="html" autolink="false"  style="width:95%">    
                <a href="javascript:getparam('${item.OB_IAXPAR_GARANTIAS.CGARANT}')"><div class="dspText">${item.OB_IAXPAR_GARANTIAS.DESCRIPCION}</div> </a>
            </display:column>
        </display:table>
    </div>
    <br />
    <jsp:include page="axismprlista.jsp?mprlistasize=10" flush="true" />
</td>
</tr>
</table>
<!-- Area de campos  -->
<c:import url="../include/botonera_nt.jsp">
<c:param name="f">axismpr004</c:param>
<c:param name="__botones">salir</c:param>
</c:import>


    </form>
<c:import url="../include/mensajes.jsp" />

<form name="miXForm" action="" method="POST">
    <input type="hidden" name="operation"/>
    <input type="hidden" name="SPRODUC" value="${__formdata.SPRODUC}" />
    <input type="hidden" name="CPARAM"  />
    <input type="hidden" name="CTIPO"  />
    <input type="hidden" name="XVALPAR"  />
    <input type="hidden" name="CACTIVI"  />
    <input type="hidden" name="CGARANT"/>
</form>


</body>
</html>
