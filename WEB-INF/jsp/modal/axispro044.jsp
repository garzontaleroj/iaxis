<%/*
*  Fichero: axispro033.jsp
*
*  @author <a href="mailto:amartinez@csi-ti.com">Alex Martinez</a>
*  Fecha: 31/03/2010
*/
%>

<%@ page contentType="text/html;charset=iso-8859-15" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <link rel="stylesheet" href="styles/genericosHtml.css" type="text/css">
    <link rel="stylesheet" href="styles/axisnt.css" type="text/css">
    <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>
    
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
    
    <c:import url="../include/carga_framework_js.jsp" />    
    <script type="text/javascript">
    
        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/
        
        function f_but_salir() {
           parent.f_aceptar_axispro044();
        }
        
        function f_onload(){
        
            var ok = "${__formdata.OK}";
            if (!objUtiles.estaVacio(ok)){
                if(ok == 0){
                    parent.f_aceptar_axispro044();
                }
            }
            
            var modo = "${__formdata.VMODO}";
            
            if (modo == 'PROD') {
                objDom.setDisplayPorId("CCACTIVI","none");
                objDom.setDisplayPorId("TTACTIVI","none");
                objDom.setDisplayPorId("TACTIVIDAD","none");
                objDom.setDisplayPorId("CCGARANT","none");
                objDom.setDisplayPorId("TTGARANT","none");
                objDom.setDisplayPorId("TGARANTIA","none");
            }
            else if (modo == 'ACT'){
                objDom.setDisplayPorId("CCACTIVI","block");
                objDom.setDisplayPorId("TTACTIVI","block");
                objDom.setDisplayPorId("TACTIVIDAD","block");
                objDom.setDisplayPorId("CCGARANT","none");
                objDom.setDisplayPorId("TTGARANT","none");
                objDom.setDisplayPorId("TGARANTIA","none");
            }
            else if (modo == 'GAR'){
                objDom.setDisplayPorId("CCACTIVI","block");
                objDom.setDisplayPorId("TTACTIVI","block");
                objDom.setDisplayPorId("TACTIVIDAD","block");
                objDom.setDisplayPorId("CCGARANT","block");
                objDom.setDisplayPorId("TTGARANT","block");
                objDom.setDisplayPorId("TGARANTIA","block");
            }
            revisarEstilos();
        }   
        
        function f_onclickCheckbox(thiss) {
            thiss.value =  ((thiss.checked)?1:0);
            objDom.setValorPorId(thiss.id, thiss.value);
        }   
        
        function f_but_aceptar() {
            if (objValidador.validaEntrada())
             objUtiles.ejecutarFormulario("modal_axispro044.do", "aceptar", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
        
    </script>
  </head>
  
  <body onload="f_onload()">
    <c:import url="../include/precargador_ajax.jsp"><c:param name="imagen" value="images/ajax-loader.gif"></c:param></c:import>
    
    <form name="miForm" action="modal_axispro033.do" method="POST">         
        <c:import url="../include/titulo_nt.jsp">
            <c:param name="formulario"><fmt:message key="9901237"/></c:param>
            <c:param name="form">axispro044</c:param>
            <c:param name="titulo"><fmt:message key="9901237"/></c:param>
        </c:import>

        <input type="hidden" id="VSPRODUC" name="VSPRODUC" value="${mntproducto.SPRODUC}"/>
        <input type="hidden" id="VCACTIVI" name="VCACTIVI" value="${ACTIVIDAD}"/>
        <input type="hidden" id="VCGARANT" name="VCGARANT" value="${CGARANTIA}"/>
        <input type="hidden" id="operation" name="operation" value=""/>
        <input type="hidden" id="VMODO" name="VMODO" value="${__formdata.VMODO}"/>
        <input type="hidden" id="NCONCEP" name="NCONCEP" value="${__formdata.NCONCEP}"/>
        <input type="hidden" id="VCFORPAG" name="VCFORPAG" value="${__formdata.CFORPAG}"/>
        <input type="hidden" id="VFINIVIG" name="VFINIVIG" value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FINIVIG}"/>"/>
        <input type="hidden" id="VCTIPCON" name="VCTIPCON" value="${__formdata.CTIPCON}"/>
    
        <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td>
                    <c:if test="${!empty mntproducto.SPRODUC}">
                    <div class="separador">&nbsp;</div>
                    <table class="seccion">
                        <tr>
                            <th style="width:2%;height:0px"></th>
                            <th style="width:5%;height:0px"></th>
                            <th style="width:35%;height:0px"></th>
                            <th style="width:15%;height:0px"></th>
                            <th style="width:45%;height:0px"></th>
                        </tr>
                        <!-- Producto -->
                        <tr>
                            <td></td>
                            <td class="titulocaja">
                                <b><fmt:message key="100829" /></b>
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td class="campocaja">
                                <input type="text" class="campowidthinput campo campotexto" value="${mntproducto.SPRODUC}" name="SPRODUC" id="SPRODUC" size="15" readonly="true"/>
                            </td>
                            <td class="campocaja">
                                <input type="text" class="campowidthinput campo campotexto" value="${mntproducto.TITULO[0].OB_IAX_PRODTITULO.TTITULO}" name="TPRODUC" id="TPRODUC" size="15" readonly="true"/>
                            </td>
                        </tr>
                        <!-- Actividad -->
                        <tr>
                            <td></td>
                            <td class="titulocaja" id="TACTIVIDAD">
                                <b ><fmt:message key="103481" /></b>
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td class="campocaja" id="CCACTIVI">
                                <input type="text" class="campowidthinput campo campotexto" value="${ACTIVIDAD}" name="CACTIVI" id="CACTIVI" size="15" readonly="true"/>
                            </td>
                            <td class="campocaja" id="TTACTIVI">
                                <input type="text" class="campowidthinput campo campotexto" value="${TACTIVIDAD}" name="TACTIVI" id="TACTIVI" size="15" readonly="true"/>
                            </td>
                        </tr>
                        <!-- Garantia -->
                        <tr>
                            <td></td>
                            <td class="titulocaja"  >
                                <b id="TGARANTIA"><fmt:message key="100561"/></b>
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td class="campocaja" id="CCGARANT">
                                <input type="text" class="campowidthinput campo campotexto" value="${CGARANTIA}" name="CGARANT" id="CGARANT" size="15" readonly="true"/>
                            </td>
                            <td class="campocaja" id="TTGARANT">
                                <input type="text" class="campowidthinput campo campotexto" value="${TGARANTIA}" name="TGARANT" id="TGARANT" size="15" readonly="true"/>
                            </td>
                        </tr>
                    </table>
                    <div class="separador">&nbsp;</div>
                </c:if>
                    <table class="seccion">
                        <tr>
                            <th style="width:2%;height:0px"></th>
                            <th style="width:30%;height:0px"></th>
                            <th style="width:20%;height:0px"></th>
                            <th style="width:50%;height:0px"></th>
                           
                        </tr>
                        <tr>
                            <td></td>
                            <td class="titulocaja">
                                <b><fmt:message key="100712" /></b>
                            </td>
                            <td class="titulocaja">
                                <b><fmt:message key="9000716" /></b>
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td class="campocaja">
                                <select name="CFORPAG" style="width:60%"  id="CFORPAG" size="1" onchange="" class="campowidthselect campo campotexto" title="<fmt:message key="100712"/>"
                                <c:if test="${empty __formdata.NCONCEP}"> <axis:atr f="axispro044" c="CFORPAG" a="modificable=true&obligatorio=true&isInputText=false"/></c:if> 
                                <c:if test="${!empty __formdata.NCONCEP}"> <axis:atr f="axispro044" c="CFORPAG" a="modificable=false&obligatorio=true&isInputText=false"/></c:if>>&nbsp;                                        
                                    <option value = "<%= Integer.MIN_VALUE %>"> - <fmt:message key="1000348"/> - </option>
                                    <c:forEach var="LSTCFORPAG" items="${__formdata.COMBOS.LSTCFORPAG}" varStatus="status">
                                        <option value = "${LSTCFORPAG.CATRIBU}"
                                            <c:if test="${__formdata.CFORPAG == LSTCFORPAG.CATRIBU}" >selected</c:if>>
                                            ${LSTCFORPAG.TATRIBU}
                                        </option>
                                    </c:forEach>
                                </select>
                            </td>
                            <td class="campocaja" >
                                <input type="text" formato="fecha" title="<fmt:message key="9000716"/>"
                                        <c:if test="${empty __formdata.NCONCEP}"> <axis:atr f="axispro044" c="FINIVIG" a="modificable=true&obligatorio=true&isInputText=false"/></c:if> 
                                        <c:if test="${!empty __formdata.NCONCEP}"> <axis:atr f="axispro044" c="FINIVIG" a="modificable=false&obligatorio=true&isInputText=false"/></c:if>
                                        name="FINIVIG" id="FINIVIG"  style="width:60%;"  
                                        value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FINIVIG}"/>"
                                        class="campowidthinput campo campotexto"/>
                                        <c:if test="${empty __formdata.NCONCEP}">
                                            <a id="icon_FINIVIG" style="vertical-align:middle;">
                                            <img alt="<fmt:message key="108341"/>" title="<fmt:message key="100883" />" src="images/calendar.gif"/></a>
                                        </c:if>
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td class="titulocaja">
                                <b><fmt:message key="9000720" /></b>
                            </td>
                            <td class="titulocaja">
                                <b><fmt:message key="9000723" /></b>
                            </td>
                            
                        </tr>
                        <tr>   
                            <td></td>
                            <td class="campocaja">
                                <select name="CTIPCON" style="width:80%"  id="CTIPCON" size="1" onchange="" class="campowidthselect campo campotexto" title="<fmt:message key="9000720"/>"
                                <c:if test="${empty __formdata.NCONCEP}"> <axis:atr f="axispro044" c="CTIPCON" a="modificable=true&obligatorio=true&isInputText=false"/></c:if> 
                                <c:if test="${!empty __formdata.NCONCEP}"> <axis:atr f="axispro044" c="CTIPCON" a="modificable=false&obligatorio=true&isInputText=false"/></c:if>>&nbsp;                                        
                                    <option value = "<%= Integer.MIN_VALUE %>"> - <fmt:message key="1000348"/> - </option>
                                    <c:forEach var="LSTCTIPCON" items="${__formdata.COMBOS.LSTCTIPCON}" varStatus="status">
                                        <option value = "${LSTCTIPCON.CATRIBU}"
                                            <c:if test="${__formdata.CTIPCON == LSTCTIPCON.CATRIBU}" >selected</c:if>>
                                            ${LSTCTIPCON.TATRIBU}
                                        </option>
                                    </c:forEach>
                                </select>
                            </td>   
                            <td class="campocaja">
                                <input type="text" id="NVALCON" name="NVALCON" value="<fmt:formatNumber pattern="###,##0.00" value="${__formdata.NVALCON}"/>" class="campowidthinput campo campotexto" style="width:50%"
                                title="<fmt:message key="9000723"/>" <axis:atr f="axispro044" c="NVALCON" a="modificable=true&obligatorio=true&formato=decimal"/> />
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td align="left" class="campocaja">
                                <b><fmt:message key="9901231"/></b>
                                <input type="checkbox" id="CBONIFI" name="CBONIFI" value="${__formdata.CBONIFI}" onclick="f_onclickCheckbox(this)"
                                <c:if test="${__formdata.CBONIFI == 1}">checked</c:if>
                                <axis:atr f="axispro001" c="CBONIFI" a="modificable=true"/> />
                            </td>
                             <td align="left" class="campocaja">
                                <b><fmt:message key="9901232"/></b>
                                <input type="checkbox" id="CFRACCI" name="CFRACCI" value="${__formdata.CFRACCI}" onclick="f_onclickCheckbox(this)"
                                <c:if test="${__formdata.CFRACCI == 1}">checked</c:if>
                                <axis:atr f="axispro044" c="CFRACCI" a="modificable=true"/> />
                            </td>
                            <td align="left" class="campocaja">
                                <b><fmt:message key="9901233"/></b>
                                <input type="checkbox" id="CRECFRA" name="CRECFRA" value="${__formdata.CRECFRA}" onclick="f_onclickCheckbox(this)"
                                <c:if test="${__formdata.CRECFRA == 1}">checked</c:if>
                                <axis:atr f="axispro044" c="CRECFRA" a="modificable=true"/> />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            
        </table>
        
        <c:import url="../include/botonera_nt.jsp"><c:param name="__botones">salir,aceptar</c:param></c:import>
        
        <script type="text/javascript">
            Calendar.setup({
            inputField     :    "FINIVIG",     
            ifFormat       :    "%d/%m/%Y",      
            button         :    "icon_FINIVIG", 
            singleClick    :    true,
            firstDay       :    1
            });
        </script>
        <script type="text/javascript">
            Calendar.setup({
            inputField     :    "FFINVIG",     
            ifFormat       :    "%d/%m/%Y",      
            button         :    "icon_FFINVIG", 
            singleClick    :    true,
            firstDay       :    1
            });
        </script>
    
    </form>
    <c:import url="../include/mensajes.jsp" />
</body>
</html>