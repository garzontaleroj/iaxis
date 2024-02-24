<%-- * Fichero: axisctr179.jsp * datos beneficiarios a nivel de riesgo *--%>
<%@ page contentType="text/html;charset=windows-1252" errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>
<html>
    <head>
        <link rel="stylesheet" href="styles/genericosHtml.css" type="text/css"></link>
        <link rel="stylesheet" href="styles/axisnt.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>
        <c:import url="../include/carga_framework_js.jsp"/>
        <link rel="stylesheet" type="text/css" media="all" href="styles/calendar-green.css" title="green"/>
        <script type="text/javascript" src="scripts/calendar.js"></script>
        <script type="text/javascript" src="scripts/calendar-${sessionScope.__locale}.js"></script>
        <script type="text/javascript" src="scripts/calendar-setup.js"></script>
        <script language="Javascript" type="text/javascript">

        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/

        function f_onload_axisctr179() {
           f_cargar_propiedades_pantalla();
                       
            var grabarOK = '${requestScope.grabarOK}';
            if (!objUtiles.estaVacio(grabarOK) && grabarOK == "0")
               parent.f_aceptar_axisctr179();                
                
        }
                
        function f_but_aceptar() {
             if (objValidador.validaEntrada()) {           
                    objUtiles.ejecutarFormulario("modal_axisctr179.do", "altamodi", document.miForm, "_self", objJsMessages.jslit_cargando);             
            }
           
        }
        
        function f_but_cancelar() { 
               parent.f_cerrar_axisctr179();                
        }    
        
         /* *********************************************************************************************** */
              function f_mod_ctipben(thiss){
        	
        	f_cargar_propiedades_pantalla();
        	
        	if (thiss.value == 3 )
        		document.miForm.SPERSON_TIT.value = 0;
        }
    </script>
    </head>
    <body onload="f_onload_axisctr179()">
            <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif" />
        </c:import>
        <form name="miForm" action="modal_axisctr179.do" method="POST">
            <input type="hidden" name="operation" value=""/>
            <input type="hidden" name="NRIESGO"  id="NRIESGO" value="${__formdata.NRIESGO}" />
            <input type="hidden" name="NORDEN"  id="NORDEN" value="${__formdata.NORDEN}" />
            <input type="hidden" name="CGARANT" id="CGARANT" value="${__formdata.CGARANT}" />
            <input type="hidden" name="SPERSON" id="SPERSON" value="${__formdata.SPERSON}" />
            <input type="hidden" name="TGARANT" id="TGARANT" value="${__formdata.TGARANT}" />
            
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="producto"><axis:alt f="axisctr179" c="ALT_NOMBRE_PANTALLA" lit="9902585"/></c:param>
                <c:param name="form">axisctr179</c:param>
            </c:import>
            <table id="tabla1" class="mainModalDimensions base" align="center"
                   cellpadding="0" cellspacing="0" style="height:130px">
                <tr>
                    <td>
                        <div class="titulo">
                            <img src="images/flecha.gif"/><axis:alt f="axisctr179"
                                                                    c="TITULO"
                                                                    lit="9902584"/> ${__formdata.TGARANT}
                        </div>
                       <table class="area">
                            <tr>
                                <th style="width:15%;height:0px"></th>
                                <th style="width:15%;height:0px"></th>
                                <th style="width:40%;height:0px"></th>
                                <th style="width:30%;height:0px"></th>
                            </tr>

                            <tr>
                                <axis:ocultar f="axisctr179" c="TTIPIDE" dejarHueco="false">
                                    <td class="titulocaja"><b id="label_TTIPIDE"><axis:alt f="axisctr179" c="ALT_TTIPIDE" lit="109774"/></b></td>
                                </axis:ocultar>
                                <axis:ocultar f="axisctr179" c="NNUMIDE" dejarHueco="false">
                                    <td class="titulocaja"><b id="label_NNUMIDE"><axis:alt f="axisctr179" c="ALT_NNUMIDE" lit="105330"/></b></td>
                                </axis:ocultar>
                                <axis:ocultar f="axisctr179" c="NOMBRE_BEN" dejarHueco="false">
                                    <td class="titulocaja"><b id="label_NOMBRE_BEN"><axis:alt f="axisctr179" c="ALT_NOMBRE_BEN" lit="105940"/></b></td>
                                </axis:ocultar>
                                <axis:ocultar f="axisctr179" c="CTIPBEN" dejarHueco="false">
                                    <td class="titulocaja"><b id="label_CTIPBEN"><axis:alt f="axisctr179" c="LIT_CTIPBEN" lit="9901522"/></b></td>
                                </axis:ocultar>
                            </tr>
                            <tr>
                                <axis:ocultar f="axisctr179" c="TTIPIDE" dejarHueco="false">
                                    <td class="campocaja">
                                        <input type="text" readonly="readonly" name="TTIPIDE" id="TTIPIDE" class="campo" value="${__formdata.map_get_beneident_g.TTIPIDE}" />
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axisctr179" c="NNUMIDE" dejarHueco="false">
                                    <td class="campocaja">
                                        <input type="text" readonly="readonly" name="NNUMIDE" id="NNUMIDE" class="campo" value="${__formdata.map_get_beneident_g.NNUMIDE}" />
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axisctr179" c="NOMBRE_BEN" dejarHueco="false">
                                    <td class="campocaja">
                                        <input type="text" readonly="readonly" name="NOMBRE_BEN" id="NOMBRE_BEN" class="campo" value="${__formdata.map_get_beneident_g.NOMBRE_BEN}" />
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axisctr179" c="CTIPBEN" dejarHueco="false">
                                    <td class="campocaja">
                                        <select name="CTIPBEN" id="CTIPBEN" onchange= "f_mod_ctipben(this)" class="campo" style="width:100px" obligatorio="true" >
                                            <option value=""> -  <axis:alt f="axisctr179" c="LIT_CTIPBEN_SELECCIONE" lit="1000348"/> - </option>
                                            <c:forEach items="${__formdata.lista_detvalores_ctipben}" var="item">
                                            <option value="${item.CATRIBU}" <c:if test="${__formdata.map_get_beneident_g.CTIPBEN==item.CATRIBU}">selected</c:if>>${item.TATRIBU}</option>
                                            </c:forEach>
                                        </select>
                                    </td>
                                </axis:ocultar>
                            <tr>
                                <axis:ocultar f="axisctr179" c="CPAREN" dejarHueco="false">
                                    <td class="titulocaja" colspan="3">
                                        <b id="label_CPAREN"><axis:alt f="axisctr179" c="CPAREN" lit="9902580"/></b>
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axisctr179" c="PPARTICIP" dejarHueco="false">
                                    <td class="titulocaja"> 
                                        <b id="label_PPARTICIP"><axis:alt f="axisctr179" c="PPARTICIP" lit="9902581"/></b>
                                    </td>
                                </axis:ocultar>
                            </tr>
                            <tr>
                                <axis:ocultar f="axisctr179" c="CPAREN" dejarHueco="false">
                                    <td class="campocaja" colspan="3">
                                        <select name="CPAREN" id="CPAREN" title = "<axis:alt f="axisctr179" c="CPAREN" lit="9902580"/>" class="campo" obligatorio="true">
                                            <option value=""> - <axis:alt f="axisctr179" c="LIT_CPAREN_SELECCIONE" lit="1000348"/> - </option>
                                            <c:forEach items="${__formdata.lista_detvalores_capren}" var="item">
                                            <option value="${item.CATRIBU}" <c:if test="${__formdata.map_get_beneident_g.CPAREN==item.CATRIBU}">selected</c:if>>${item.TATRIBU}</option>
                                            </c:forEach>
                                        </select>
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axisctr179" c="PPARTICIP" dejarHueco="false">
                                    <td class="campocaja">
                                        <input type="text" class="campo campotexto" title = "<axis:alt f="axisctr179" c="PPARTICIP" lit="9902581"/>" id="PPARTICIP" name="PPARTICIP" value="${__formdata.map_get_beneident_g.PPARTICIP}" formato="decimal" style="width:80px" <axis:atr f="axisctr179" c="PPARTICIP" a="modificable=true&obligatorio=true"/>/>
                                    </td>
                                </axis:ocultar>
                            </tr>
                            <tr>
                                <axis:ocultar f="axisctr179" c="SPERSON_TIT" dejarHueco="false">
                                    <td class="titulocaja" colspan="3">
                                        <b id="label_SPERSON_TIT"><axis:alt f="axisctr179" c="SPERSON_TIT" lit="9902583"/></b>
                                    </td>
                                </axis:ocultar>
                            </tr>
                            <tr>
                                <axis:ocultar f="axisctr179" c="SPERSON_TIT" dejarHueco="false">
                                    <td class="campocaja" colspan="3">
                                        <select name="SPERSON_TIT" title = "<axis:alt f="axisctr179" c="SPERSON_TIT" lit="9902583"/>" id="SPERSON_TIT" <axis:atr f="axisctr179" c="SPERSON_TIT" a="modificable=true&obligatorio=true"/> class="campo">
                                            <option value=""> - <axis:alt f="axisctr179" c="LIT_SPERSON_TIT_SELECCIONE" lit="1000348"/> - </option>
                                            <c:forEach items="${__formdata.lista_get_beneident_tit}" var="item">
                                                <option value="${item.OB_IAX_BENEIDENTIFICADOS.SPERSON}" <c:if test="${__formdata.map_get_beneident_g.SPERSON_TIT==item.OB_IAX_BENEIDENTIFICADOS.SPERSON}">selected</c:if>> ${item.OB_IAX_BENEIDENTIFICADOS.NOMBRE_BEN} </option>
                                            </c:forEach>
                                        </select>
                                    </td>
                                </axis:ocultar>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
            <c:import url="../include/botonera_nt.jsp">
                <c:param name="f">axisctr179</c:param>
                <c:param name="__botones">cancelar,aceptar</c:param>
            </c:import>
        </form><c:import url="../include/mensajes.jsp"/></body>
</html>