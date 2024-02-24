<%/**
*  Fichero: axisfinv011.jsp
*/
%>
<%@ page contentType="text/html;charset=windows-1252"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>    

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
 
<html>
    <head>
        <title><axis:alt f="axisfinv011" c="NOMBRE_PANTALLA" lit="formulario.axisnombrepantalla"/></title>
        <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
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
            
            function f_onload() {                
                var ok = "${guardado}";
                
                if (!objUtiles.estaVacio(ok) && ok == 0){
                    parent.f_aceptar_axisfinv011(${__formdata.CCODFON});        
                }

                f_cargar_propiedades_pantalla();
            }
            
            function f_but_cancelar() {
                parent.f_cerrar_modal("axisfinv011");  
            }    
            
            function f_but_aceptar() {
                if (objValidador.validaEntrada()) {
                    f_habilitar_campos();
                    objUtiles.ejecutarFormulario ("modal_axisfinv011.do", "aceptar", document.miForm, "_self", objJsMessages.jslit_cargando);
                }
            }
            
            function f_habilitar_campos(){
            try{
                var inputs = document.getElementsByTagName("input");
                var selects = document.getElementsByTagName("select");
                
                for(var i=0;i<selects.length;i++){
                    if(selects[i].attributes.length>0) {
                        var selectId = selects[i].getAttribute("id");
                          if(selects[i].getAttribute("type") != "button"  ){  
                           objDom.setDisabledPorId(selectId,false);
                     }
                    }
                } 
                }catch(e){}
            }
        
            
            function f_refresh(){
                f_habilitar_campos();
                objUtiles.ejecutarFormulario("modal_axisfinv011.do","refresh",document.miForm, "_self", objJsMessages.jslit_cargando);   
            }

        </script>
    </head>
    
    <body onload="f_onload()" >
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>   
        <form name="miForm" action="" method="POST">
            <input type="hidden" name="operation" id="operation" value=""/>
            
            <input type="hidden" name="NOU" id="NOU" value="${__formdata.NOU}"/>
            <input type="hidden" name="CCOD_ACT" id="CCOD_ACT" value="${__formdata.CCOD_ACT}"/>
            <input type="hidden" name="PAR_CEMPRES" id="PAR_CEMPRES" value="${__formdata.PAR_CEMPRES}"/>

            
             <c:import url="../include/titulo_nt.jsp">
                <c:param name="titulo"><axis:alt f="axisfinv011" c="TITULO_PANTALLA" lit="9902150" /></c:param>
                <c:param name="formulario"><axis:alt f="axisfinv011" c="TITULO_FORM" lit="9902150" /></c:param>
                <c:param name="form">axisfinv011</c:param>
            </c:import>
            
            <!-- Área de campos  -->
            <table class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <!-- Área 1 -->
                        <table class="seccion" align="center">
                            <tr>
                                <th style="width:2%;height:0px"></th>
                                <th style="width:33%;height:0px"></th>
                                <th style="width:33%;height:0px"></th>
                                <th style="width:31%;height:0px"></th>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;
                                </td>
                                <axis:visible f="axisfinv011" c="CCODFON">
                                    <td class="titulocaja">
                                        <b><axis:alt f="axisfinv011" c="CCODFON" lit="9001288"/></b>
                                    </td>
                                </axis:visible>
                                <axis:visible f="axisfinv011" c="FINICIO">
                                    <td class="titulocaja">
                                        <b><axis:alt f="axisfinv011" c="FINICIO" lit="9000526"/></b>
                                    </td>
                                </axis:visible>
                                <axis:visible f="axisfinv011" c="FFIN">
                                    <td class="titulocaja">
                                        <b><axis:alt f="axisfinv011" c="FFIN" lit="9000527"/></b>
                                    </td>
                                </axis:visible>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;
                                </td>
                                <axis:visible f="axisfinv011" c="CCODFON">
                                    <td class="campocaja">    
                                        <select title="<axis:alt f='axisfinv011' c='CCODFON' lit='9001288'/>" name = "CCODFON" id="CCODFON" size="1" 
                                            class="campowidthselect campo campotexto" style="width:90%" 
                                            <axis:atr f="axisfinv011" c="CCODFON" a="isinputtext=false"/>>
                                            <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisfinv011" c="SNV_COMBO" lit="108341"/> - </option>
                                            <c:forEach var="inversiones" items="${requestScope.T_IAX_FONDOS}">
                                                <option value = "${inversiones.CCODFON}"
                                                    <c:choose>
                                                        <c:when test="${!empty __formdata.CCODFON && __formdata.CCODFON == inversiones.CCODFON}">selected</c:when>
                                                    </c:choose>>
                                                    ${inversiones.TFONABV}
                                                </option>
                                            </c:forEach>
                                        </select>
                                    </td>
                                </axis:visible>
                                <axis:visible f="axisfinv011" c="FINICIO">
                                    <td class="campocaja">
                                        <input type="text" class="campowidthinput campo campotexto"  size="15" style="width:30%;" 
                                        value="<fmt:formatDate value='${__formdata.FINICIO}' pattern='dd/MM/yyyy'/>" name="FINICIO" id="FINICIO"
                                        title="<axis:alt f="axisfinv011" c="FINICIO" lit="9000526"/>" alt="<axis:alt f="axisfinv011" c="FINICIO" lit="9000526"/>"
                                        <axis:atr f="axisfinv011" c="FINICIO"/>/>
                                        <a style="vertical-align:middle;"><img id="icon_FINICIO" alt="<axis:alt f="axisfinv011" c="FINICIO" lit="9000526"/>" title="<axis:alt f="axisfinv011" c="FINICIO" lit="9000526"/>" src="images/calendar.gif"/></a>
                                    </td>
                                </axis:visible>
                                <axis:visible f="axisfinv011" c="FFIN">
                                    <td class="campocaja">
                                        <input type="text" class="campowidthinput campo campotexto"  size="15" style="width:30%;" 
                                        value="<fmt:formatDate value='${__formdata.FFIN}' pattern='dd/MM/yyyy'/>" name="FFIN" id="FFIN"
                                        title="<axis:alt f="axisfinv011" c="FFIN" lit="9000527"/>" alt="<axis:alt f="axisfinv011" c="FFIN" lit="9000527"/>"
                                        <axis:atr f="axisfinv011" c="FFIN"/>/>
                                        <a style="vertical-align:middle;"><img id="icon_FFIN" alt="<axis:alt f="axisfinv011" c="FFIN" lit="9000527"/>" title="<axis:alt f="axisfinv011" c="FFIN" lit="9000527"/>" src="images/calendar.gif"/></a>
                                    </td>
                                </axis:visible>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;
                                </td>
                                <axis:visible f="axisfinv011" c="CTIPCOM">
                                    <td class="titulocaja">
                                        <b><axis:alt f="axisfinv011" c="CTIPCOM" lit="9902149"/></b>  
                                    </td>
                                </axis:visible>
                                <axis:visible f="axisfinv011" c="CCONCEP">
                                    <td class="titulocaja">
                                        <b><axis:alt f="axisfinv011" c="CCONCEP" lit="1000480"/></b>  
                                    </td>
                                </axis:visible>
                                <axis:visible f="axisfinv011" c="CTIPOCALCUL">
                                    <td class="titulocaja">
                                        <b><axis:alt f="axisfinv011" c="CTIPOCALCUL" lit="9002111"/></b>  
                                    </td>
                                </axis:visible>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;
                                </td>
                                <axis:visible f="axisfinv011" c="CTIPCOM">
                                    <td class="campocaja">
                                        <select name="CTIPCOM" id="CTIPCOM" size="1" class="campo campotexto" style="width:90%" 
                                        title="<axis:alt f="axisfinv011" c="CTIPCOM" lit="9902149"/>" onchange="javascript:f_refresh()"
                                        <axis:atr f="axisfinv011" c="CTIPCOM" a="isinputtext=false"/> >
                                            <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisfinv011" c="SNV_COMBO" lit="108341"/> - </option>
                                            <c:forEach items="${requestScope.listaTipcom}" var="item">
                                                <option value = "${item.CATRIBU}"
                                                    <c:choose>
                                                        <c:when test="${!empty __formdata.CTIPCOM && __formdata.CTIPCOM == item.CATRIBU}">selected</c:when>
                                                    </c:choose>>${item.TATRIBU}</option>
                                            </c:forEach>
                                        </select>
                                    </td>
                                </axis:visible>
                                <axis:visible f="axisfinv011" c="CCONCEP">
                                    <td class="campocaja">
                                        <select name="CCONCEP" id="CCONCEP" size="1" class="campo campotexto" style="width:90%" 
                                        title="<axis:alt f="axisfinv011" c="CCONCEP" lit="1000480"/>"
                                        <axis:atr f="axisfinv011" c="CCONCEP" a="isinputtext=false"/>>
                                            <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisfinv011" c="SNV_COMBO" lit="108341"/> - </option>
                                            <c:forEach items="${requestScope.listaCalcom}" var="item">
                                                <option value = "${item.CATRIBU}" 
                                                    <c:choose>
                                                        <c:when test="${!empty __formdata.CCONCEP && __formdata.CCONCEP == item.CATRIBU}">selected</c:when>
                                                    </c:choose>>${item.TATRIBU}</option>
                                            </c:forEach>
                                        </select
                                    </td>
                                </axis:visible>
                                <axis:visible f="axisfinv011" c="CTIPOCALCUL">
                                    <td class="campocaja">
                                        <select name="CTIPOCALCUL" id="CTIPOCALCUL" size="1" class="campo campotexto" style="width:90%" 
                                        title="<axis:alt f="axisfinv011" c="CTIPOCALCUL" lit="9002111"/>" onchange="javascript:f_refresh()"
                                        <axis:atr f="axisfinv011" c="CTIPOCALCUL" a="isinputtext=false"/>>
                                            <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisfinv011" c="SNV_COMBO" lit="108341"/> - </option>
                                            <c:forEach items="${requestScope.listaTipcal}" var="item">
                                                <option value = "${item.CATRIBU}"  
                                                    <c:choose>
                                                        <c:when test="${!empty __formdata.CTIPOCALCUL && __formdata.CTIPOCALCUL == item.CATRIBU}">selected</c:when>
                                                    </c:choose>>${item.TATRIBU}</option>
                                            </c:forEach>
                                        </select
                                    </td>
                                </axis:visible>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;
                                </td>
                                <axis:visible f="axisfinv011" c="PGASTOS">
                                    <td class="titulocaja">
                                        <b><axis:alt f="axisfinv011" c="PGASTOS" lit="101467"/></b>  
                                    </td>
                                </axis:visible>
                                <axis:visible f="axisfinv011" c="IIMPFIJ">
                                    <td class="titulocaja">
                                        <b><axis:alt f="axisfinv011" c="IIMPFIJ" lit="9902145"/></b>
                                    </td>
                                </axis:visible>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;
                                </td>
                                <axis:visible f="axisfinv011" c="PGASTOS">
                                    <td class="campocaja">
                                        <input type="text" name="PGASTOS" id="PGASTOS" value="<fmt:formatNumber pattern="##0.00" value='${__formdata.PGASTOS}'/>" class="campowidthinput campo campotexto"  style="width:50%"
                                        alt="<axis:alt f="axisfinv011" c="PGASTOS" lit="101467"/>" title="<axis:alt f="axisfinv011" c="PGASTOS" lit="101467"/>" <axis:atr f="axisfinv011" c="PGASTOS"/>/>
                                    </td>
                                </axis:visible>
                                <axis:visible f="axisfinv011" c="IIMPFIJ">
                                    <td class="campocaja">
                                        <input type="text" name="IIMPFIJ" id="IIMPFIJ" value="<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value='${__formdata.IIMPFIJ}'/>" class="campowidthinput campo campotexto"  style="width:50%"
                                        alt="<axis:alt f="axisfinv011" c="IIMPFIJ" lit="9902145"/>" title="<axis:alt f="axisfinv011" c="IIMPFIJ" lit="9902145"/>" <axis:atr f="axisfinv011" c="IIMPFIJ"/>/>
                                    </td>
                                </axis:visible>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                        </table>
                        
                        <div class="separador">&nbsp; </div>                                        
                        <c:import url="../include/botonera_nt.jsp">
                            <c:param name="f">axisfinv011</c:param>
                            <c:param name="__botones">cancelar<axis:visible f="axisfinv011" c="ACEPTAR">,aceptar</axis:visible></c:param>
                        </c:import>
                        
                        <script type="text/javascript">
                            Calendar.setup({
                                inputField     :    "FINICIO",     
                                ifFormat       :    "%d/%m/%Y",      
                                button         :    "icon_FINICIO", 
                                singleClick    :    true,
                                firstDay       :    1
                            });
                     
                            Calendar.setup({
                                inputField     :    "FFIN",     
                                ifFormat       :    "%d/%m/%Y",      
                                button         :    "icon_FFIN", 
                                singleClick    :    true,
                                firstDay       :    1
                            });
                        </script>
                        
                        <div class="separador">&nbsp; </div>       
                    </td>
                </tr>
            </table>
        </form>
        <c:import url="../include/mensajes.jsp" />
    </body>
</html>
