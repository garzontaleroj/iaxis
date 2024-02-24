<%/*
*  Fichero: axispro046.jsp
*
*  @author <a href="mailto:amartinez@csi-ti.com">Alex Martinez</a>
*  Fecha: 18/06/2010
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
    
    
    
    <c:import url="../include/carga_framework_js.jsp" />    
    <script type="text/javascript">
    
        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/
        
        function f_but_salir() {
           //parent.f_cerrar_modal('axispro045');
           parent.parent.reabrir_modal_garantias("modal_axispro001_garantias.do?operation=form&SPRODUC=${__formdata.SPRODUC}&CACTIVI=${param.PCACTIVI}&CGARANT=${param.PCGARANT}&dt="+(new Date().getTime()) + "&subpantalla=garantias_datostecnicos");
        }
        
        function f_onload(){
        
            var ok = "${__formdata.OK}"
            if(ok == 1){
                f_but_salir();
            }
            
            revisarEstilos();
             f_cargar_propiedades_pantalla();
        }   
            
        
        function f_but_aceptar() {
            objUtiles.ejecutarFormulario("modal_axispro046.do", "aceptar", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
        
        function f_onclickCheckbox(thiss){
            thiss.value =  ((thiss.checked)?1:0);
            objDom.setValorPorId(thiss.id, thiss.value);
        }
        
    </script>
  </head>
  
  <body onload="f_onload()">
    <c:import url="../include/precargador_ajax.jsp"><c:param name="imagen" value="images/ajax-loader.gif"></c:param></c:import>
    
    <form name="miForm" action="modal_axispro046.do" method="POST">         
        <c:import url="../include/titulo_nt.jsp">
            <c:param name="formulario"><axis:alt f="axispro046" c="MANTENIMIENTO" lit="9901297"/></c:param>
            <c:param name="form">axispro046</c:param>
            <c:param name="titulo"><axis:alt f="axispro046" c="MANTENIMIENTO" lit="9901297"/></c:param>
        </c:import>

        <input type="hidden" id="PSPRODUC" name="PSPRODUC" value="${SPRODUC}"/>
        <input type="hidden" id="PCACTIVI" name="PCACTIVI" value="${ACTIVIDAD}"/>
        <input type="hidden" id="PCGARANT" name="PCGARANT" value="${CGARANTIA}"/>
        <input type="hidden" id="operation" name="operation" value=""/>
        <input type="hidden" id="VMODO" name="VMODO" value="${__formdata.VMODO}"/>
    
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
                                <b><axis:alt f="axispro046" c="TPRODUC" lit="100829"/></b>
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
                                <b ><axis:alt f="axispro046" c="TACTIVIDAD" lit="103481"/></b>
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
                                <b id="TGARANTIA"><axis:alt f="axispro046" c="TGARANTIA" lit="100561"/></b>
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
                            <th style="width:25%;height:0px"></th>
                            <th style="width:25%;height:0px"></th>
                            <th style="width:20%;height:0px"></th>
                            <th style="width:28%;height:0px"></th>
                        </tr>
                        <tr>
                            <td></td>
                            <td class="titulocaja">
                                <b><axis:alt f="axispro046" c="LSTRAMOSDGS" lit="107248"/> </b>
                            </td>
                            <td class="titulocaja">
                                <b><axis:alt f="axispro046" c="TMORTALIDAD" lit="1000354"/></b>
                            </td>
                            <td class="titulocaja">
                                <b><axis:alt f="axispro046" c="PRECSEG" lit="1000339"/></b>
                            </td>
           
                        </tr>
                        <tr>
                            <td></td>
                            <td class="campocaja">
                                <select name="LSTRAMOSDGS" style="width:90%"  id="LSTRAMOSDGS" size="1" onchange="" class="campowidthselect campo campotexto">&nbsp;                                        
                                    <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt f="axispro046" c="SELECCIONAR" lit="1000348"/> - </option>
                                    <c:forEach var="ramosdgs" items="${__formdata.COMBOS.LSTRAMOSDGS}" varStatus="status">
                                        <option value = "${ramosdgs.CRAMDGS}"
                                            <c:if test="${__formdata.LSTGARIN == ramosdgs.CRAMDGS || mntgaran.DATTECNICOS.CRAMDGS == ramosdgs.CRAMDGS}" >selected</c:if>>
                                            ${ramosdgs.TRAMDGS}
                                        </option>
                                    </c:forEach>
                                </select>
                            </td>
                            <td class="campocaja">
                                <select name="LSTMORTALIDAD" style="width:90%"  id="LSTMORTALIDAD" size="1" onchange="" class="campowidthselect campo campotexto">&nbsp;                                        
                                    <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt f="axispro046" c="SELECCIONAR" lit="1000348"/> - </option>
                                    <c:forEach var="mortalidad" items="${__formdata.COMBOS.LSTMORTALIDAD}" varStatus="status">
                                        <option value = "${mortalidad.CTABLA}"
                                            <c:if test="${__formdata.LSTGARIN == mortalidad.CTABLA || mntgaran.DATTECNICOS.CTABLA == mortalidad.CTABLA}" >selected</c:if>>
                                            ${mortalidad.TTABLA}
                                        </option>
                                    </c:forEach>
                                </select>
                            </td>
                            <td align="left">
                                <input type="text" name="PRECSEG" value="${mntgaran.DATTECNICOS.PRECSEG}" class="campowidthinput campo campotexto" style="width:20%"
                                    <axis:atr f="axispro001" c="PRECSEG" a="modificable=true"/> />
                            </td>
                            <td class="titulocaja">
                                <b><axis:alt f="axispro046" c="NPARBEN" lit="1000495"/></b>
                                <input type="checkbox" name="NPARBEN" id="NPARBEN" value="${mntgaran.DATTECNICOS.NPARBEN}" 
                                    <c:if test="${mntgaran.DATTECNICOS.NPARBEN == 1}">checked</c:if>
                                    onclick="f_onclickCheckbox(this)" />
                            </td>
                             </tr>
                              <tr>
                            <td class="titulocaja">
                            </td>
                            <td class="titulocaja">
                                <b><axis:alt f="axispro046" c="CPROVIS" lit="9000729"/> </b>
                            </td>
           
                        </tr>
                            <tr>
                            <td>
                             </td>
                              <td>
                                <select name="CPROVIS" id="CPROVIS" size="1" class="campowidthselect campo campotexto" style="width:90%;">&nbsp;
                                    <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axispro046" c="SELECCIONAR" lit="1000348"/> - </option>
                                    <c:forEach var="element" items="${__formdata.COMBOS.LSTPRO}">
                                        <option value = "${element.CATRIBU}" 
                                            <c:if test="${element.CATRIBU == mntgaran.DATTECNICOS.CPROVIS}"> selected </c:if> />
                                            ${element.TATRIBU} 
                                        </option>
                                    </c:forEach>
                                </select>
                            </td>
                             </tr>
                    </table>
                </td>
            </tr>
            
        </table>
        
        <c:import url="../include/botonera_nt.jsp">
        <c:param name="f">axispro046</c:param> 
        <c:param name="__botones">salir,aceptar</c:param>
        </c:import>       
         
    </form>
    <c:import url="../include/mensajes.jsp" />
</body>
</html>