<%@ page contentType="text/html;charset=windows-1252"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page import="axis.util.Constantes, java.util.*" %>
<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
    <head>
        <title></title>
        <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
        <link rel="stylesheet" href="styles/displaytag.css">
        <link type="text/css" href="styles/jquery.jscrollpane.css" rel="stylesheet" media="only screen and (min-device-width: 768px) and (max-device-width: 1024px)" />
        <link rel="stylesheet" type="text/css" media="all" href="styles/calendar-green.css" title="green" />
        <script type="text/javascript" src="scripts/calendar.js"></script>    
        <script type="text/javascript" src="scripts/calendar-${sessionScope.__locale}.js"></script>
        <script type="text/javascript" src="scripts/calendar-setup.js"></script> 
        <c:import url="../include/carga_framework_js.jsp"/>        
        <script type="text/javascript">
        
            function f_onload() {
                f_cargar_propiedades_pantalla();
              
            }
            
            function f_aceptar_modal(pantalla){
                f_cerrar_modal(pantalla);
                objUtiles.ejecutarFormulario("axis_axiscaj008.do", "form", document.miForm, "ftrabajo", objJsMessages.jslit_cargando);
            }
            
            function f_aceptar_modal(pantalla, param){
                f_cerrar_modal(pantalla);
                objUtiles.ejecutarFormulario("axis_axiscaj008.do?"+param, "form", document.miForm, "ftrabajo", objJsMessages.jslit_cargando);
            }
    
            function f_abrir_modal(cual, noXButton, optionalQueryString) {
              
                if (objUtiles.estaVacio(optionalQueryString))                
                    optionalQueryString = "";
                
                if (noXButton) 
                    objDom.setVisibilidadPorId("but_cerrar_modal_" + cual, "hidden");    

                objUtiles.abrirModal(cual, "src", "modal_" + cual + ".do?operation=init" + optionalQueryString);   
            }
            
            function f_cerrar_modal(pantalla){
                objUtiles.cerrarModal(pantalla);
            }      
            
            function f_but_salir(){
                objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axiscaj008", "cancelar", document.miForm, "_self");            
            }
            
            function f_but_buscar() {
                if (objValidador.validaEntrada()) {
                    objUtiles.ejecutarFormulario("axis_axiscaj008.do","busqueda_movimientos",document.miForm, "_self", objJsMessages.jslit_cargando);   
                }
            }
            
            function f_aceptar_axisusu009(PCUSUARI){
                f_cerrar_modal("axisusu009");
                objDom.setValorPorId("CUSUARI", PCUSUARI);
                document.miForm.CUSUARI.focus();            
            }
            
            function mostrar(nombreCapa,nombreDIV){ 
                objUtiles.scrollPoll(nombreCapa,nombreDIV);
            } 
    
            function ocultar(nombreCapa){ 
            document.getElementById(nombreCapa).style.visibility="hidden"; 
            }   

            function mostrarContent(contentFrame, COD_CMEDMOV, NCHEQUE, TBANCO, CESTCHQ, CAUTORIZA, NULTDIGTAR, NCUOTAS, CCOMERCIO ) {
                // Bug 0032660/0190245 - 12/11/2014 - JMF
                if (COD_CMEDMOV == '0') {
                   ocultar(contentFrame);
                   return true;
                }
                
                var cad = "";
                var layer = document.getElementById(contentFrame);
            
                cad += '                                                                        <!-- INICIO SECCION -->\n';
                cad += '                                                                        <table class="area" align="center">\n';
                if (COD_CMEDMOV == '1') {
                    cad += '                                                                        <tr>\n';
                    cad += '                                                                            <th style="width:30%;height:0px"></th>\n';
                    cad += '                                                                            <th style="width:70%;height:0px"></th>\n';
                    cad += '                                                                        </tr>\n';
                    cad += '                                                                        <tr>\n';
                    cad += '                                                                                <%-- Cheque --%>\n';
                    cad += '                                                                                 <td class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;" >\n';
                    cad += '                                                                                    <b><axis:alt f="axiscaj008" c="NCHEQUE" lit="9905071"/></b>\n';
                    cad += '                                                                                </td>   \n';
                    cad += '                                                                                 <%--Banco --%>\n';
                    cad += '                                                                                 <td class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;">\n';
                    cad += '                                                                                    <b><axis:alt f="axiscaj008" c="TBANCO" lit="9000964"/></b>\n';
                    cad += '                                                                                </td> \n';
                    cad += '                                                                        </tr>\n';
                    cad += '                                                                        <tr>\n';
                    cad += '                                                                             <%-- NCHEQUE --%>\n';
                    cad += '                                                                                <td class="campocaja" style="background-color:white;border-right-width: 0px;">\n';
                    cad += '                                                                                    <input type="text" class="campo campotexto" id="CAMPO2" name="CAMPO2" size="15"\n';
                    cad += '                                                                                    value="' + NCHEQUE + '" readonly="readonly"/>\n';
                    cad += '                                                                                </td>\n';
                    cad += '                                                                                <%-- TBANCO --%>\n';
                    cad += '                                                                                <td class="campocaja" style="background-color:white;border-right-width: 0px;">\n';
                    cad += '                                                                                    <input type="text" class="campo campotexto" id="CAMPO3" name="CAMPO3" size="15"\n';
                    cad += '                                                                                    value="' + TBANCO + '" readonly="readonly"/>\n';
                    cad += '                                                                                </td>\n';
                    cad += '                                                                        </tr>\n';
                }
                if (COD_CMEDMOV == '3') {
                    cad += '                                                                        <tr>\n';
                    cad += '                                                                            <th style="width:30%;height:0px"></th>\n';
                    cad += '                                                                            <th style="width:70%;height:0px"></th>\n';
                    cad += '                                                                        </tr>\n';
                    cad += '                                                                        <tr>\n';
                    cad += '                                                                                <%-- Vale Vista --%>\n';
                    cad += '                                                                                 <td class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;" >\n';
                    cad += '                                                                                    <b><axis:alt f="axiscaj008" c="NCHEQUE" lit="9905369"/></b>\n';
                    cad += '                                                                                </td>   \n';
                    cad += '                                                                                 <%--Banco --%>\n';
                    cad += '                                                                                 <td class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;">\n';
                    cad += '                                                                                    <b><axis:alt f="axiscaj008" c="TBANCO" lit="9000964"/></b>\n';
                    cad += '                                                                                </td> \n';
                    cad += '                                                                        </tr>\n';
                    cad += '                                                                        <tr>\n';
                    cad += '                                                                             <%-- NCHEQUE --%>\n';
                    cad += '                                                                                <td class="campocaja" style="background-color:white;border-right-width: 0px;">\n';
                    cad += '                                                                                    <input type="text" class="campo campotexto" id="CAMPO2" name="CAMPO2" size="15" style="width:90%"\n';
                    cad += '                                                                                    value="' + NCHEQUE + '" readonly="readonly"/>\n';
                    cad += '                                                                                </td>\n';
                    cad += '                                                                                <%-- TBANCO --%>\n';
                    cad += '                                                                                <td class="campocaja" style="background-color:white;border-right-width: 0px;">\n';
                    cad += '                                                                                    <input type="text" class="campo campotexto" id="CAMPO3" name="CAMPO3" size="15" style="width:90%"\n';
                    cad += '                                                                                    value="' + TBANCO + '" readonly="readonly"/>\n';
                    cad += '                                                                                </td>\n';
                    cad += '                                                                        </tr>\n';
                }
                if (COD_CMEDMOV == '5') {
                    cad += '                                                                        <tr>\n';
                    cad += '                                                                            <th style="width:30%;height:0px"></th>\n';
                    cad += '                                                                            <th style="width:70%;height:0px"></th>\n';
                    cad += '                                                                        </tr>\n';
                    cad += '                                                                        <tr>\n';
                    cad += '                                                                                <%-- Boleta deposito --%>\n';
                    cad += '                                                                                 <td class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;" >\n';
                    cad += '                                                                                    <b><axis:alt f="axiscaj008" c="NCHEQUE" lit="9907203"/></b>\n';
                    cad += '                                                                                </td>   \n';
                    cad += '                                                                                 <%--Banco --%>\n';
                    cad += '                                                                                 <td class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;">\n';
                    cad += '                                                                                    <b><axis:alt f="axiscaj008" c="TBANCO" lit="9000964"/></b>\n';
                    cad += '                                                                                </td> \n';
                    cad += '                                                                        </tr>\n';
                    cad += '                                                                        <tr>\n';
                    cad += '                                                                             <%-- NCHEQUE --%>\n';
                    cad += '                                                                                <td class="campocaja" style="background-color:white;border-right-width: 0px;">\n';
                    cad += '                                                                                    <input type="text" class="campo campotexto" id="CAMPO2" name="CAMPO2" size="15" style="width:90%"\n';
                    cad += '                                                                                    value="' + NCHEQUE + '" readonly="readonly"/>\n';
                    cad += '                                                                                </td>\n';
                    cad += '                                                                                <%-- TBANCO --%>\n';
                    cad += '                                                                                <td class="campocaja" style="background-color:white;border-right-width: 0px;">\n';
                    cad += '                                                                                    <input type="text" class="campo campotexto" id="CAMPO3" name="CAMPO3" size="15" style="width:90%"\n';
                    cad += '                                                                                    value="' + TBANCO + '" readonly="readonly"/>\n';
                    cad += '                                                                                </td>\n';
                    cad += '                                                                        </tr>\n';
                }
                if (COD_CMEDMOV == '4') {
                    cad += '                                                                        <tr>\n';
                    cad += '                                                                            <th style="width:50%;height:0px"></th>\n';
                    cad += '                                                                            <th style="width:50%;height:0px"></th>\n';
                    cad += '                                                                        </tr>\n';
                    cad += '                                                                        <tr>\n';
                    cad += '                                                                                <%-- Tarjeta Internet --%>\n';
                    cad += '                                                                                 <td class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;" >\n';
                    cad += '                                                                                    <b><axis:alt f="axiscaj008" c="CAUTORIZA" lit="9905858"/></b>\n';
                    cad += '                                                                                </td>   \n';
                    cad += '                                                                                <%-- Tarjeta Internet --%>\n';
                    cad += '                                                                                 <td class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;" >\n';
                    cad += '                                                                                    <b><axis:alt f="axiscaj008" c="NULTDIGTAR" lit="9903068"/></b>\n';
                    cad += '                                                                                </td>   \n';
                    cad += '                                                                        </tr>\n';
                    cad += '                                                                        <tr>\n';
                    cad += '                                                                             <%-- CAUTORIZA --%>\n';
                    cad += '                                                                                <td class="campocaja" style="background-color:white;border-right-width: 0px;">\n';
                    cad += '                                                                                    <input type="text" class="campo campotexto" id="CAMPO2" name="CAMPO2" size="15" style="width:90%"\n';
                    cad += '                                                                                    value="' + CAUTORIZA + '" readonly="readonly"/>\n';
                    cad += '                                                                                </td>\n';
                    cad += '                                                                             <%-- NULTDIGTAR --%>\n';
                    cad += '                                                                                <td class="campocaja" style="background-color:white;border-right-width: 0px;">\n';
                    cad += '                                                                                    <input type="text" class="campo campotexto" id="CAMPO3" name="CAMPO3" size="15" style="width:90%"\n';
                    cad += '                                                                                    value="' + NULTDIGTAR + '" readonly="readonly"/>\n';
                    cad += '                                                                                </td>\n';
                    cad += '                                                                        </tr>\n';
                    cad += '                                                                        <tr>\n';
                    cad += '                                                                                <%-- NCUOTAS --%>\n';
                    cad += '                                                                                 <td class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;" >\n';
                    cad += '                                                                                    <b><axis:alt f="axiscaj008" c="NCUOTAS" lit="9906723"/></b>\n';
                    cad += '                                                                                </td>   \n';
                    cad += '                                                                                <%-- CCOMERCIO --%>\n';
                    cad += '                                                                                 <td class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;" >\n';
                    cad += '                                                                                    <b><axis:alt f="axiscaj008" c="CCOMERCIO" lit="9900822"/></b>\n';
                    cad += '                                                                                </td>   \n';
                    cad += '                                                                        </tr>\n';
                    cad += '                                                                        <tr>\n';
                    cad += '                                                                             <%-- NCUOTAS --%>\n';
                    cad += '                                                                                <td class="campocaja" style="background-color:white;border-right-width: 0px;">\n';
                    cad += '                                                                                    <input type="text" class="campo campotexto" id="CAMPO4" name="CAMPO4" size="15" style="width:90%"\n';
                    cad += '                                                                                    value="' + NCUOTAS + '" readonly="readonly"/>\n';
                    cad += '                                                                                </td>\n';
                    cad += '                                                                             <%-- CCOMERCIO --%>\n';
                    cad += '                                                                                <td class="campocaja" style="background-color:white;border-right-width: 0px;">\n';
                    cad += '                                                                                    <input type="text" class="campo campotexto" id="CAMPO5" name="CAMPO5" size="15" style="width:90%"\n';
                    cad += '                                                                                    value="' + CCOMERCIO + '" readonly="readonly"/>\n';
                    cad += '                                                                                </td>\n';
                    cad += '                                                                        </tr>\n';
                }
                if (COD_CMEDMOV == '6') {
                    cad += '                                                                        <tr>\n';
                    cad += '                                                                            <th style="width:50%;height:0px"></th>\n';
                    cad += '                                                                            <th style="width:50%;height:0px"></th>\n';
                    cad += '                                                                        </tr>\n';
                    cad += '                                                                        <tr>\n';
                    cad += '                                                                                <%-- Tarjeta POS --%>\n';
                    cad += '                                                                                 <td class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;" >\n';
                    cad += '                                                                                    <b><axis:alt f="axiscaj008" c="CAUTORIZA" lit="9905858"/></b>\n';
                    cad += '                                                                                </td>   \n';
                    cad += '                                                                                <%-- Tarjeta POS --%>\n';
                    cad += '                                                                                 <td class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;" >\n';
                    cad += '                                                                                    <b><axis:alt f="axiscaj008" c="NULTDIGTAR" lit="9903068"/></b>\n';
                    cad += '                                                                                </td>   \n';
                    cad += '                                                                        </tr>\n';
                    cad += '                                                                        <tr>\n';
                    cad += '                                                                             <%-- CAUTORIZA --%>\n';
                    cad += '                                                                                <td class="campocaja" style="background-color:white;border-right-width: 0px;">\n';
                    cad += '                                                                                    <input type="text" class="campo campotexto" id="CAMPO2" name="CAMPO2" size="15" style="width:90%"\n';
                    cad += '                                                                                    value="' + CAUTORIZA + '" readonly="readonly"/>\n';
                    cad += '                                                                                </td>\n';
                    cad += '                                                                             <%-- NULTDIGTAR --%>\n';
                    cad += '                                                                                <td class="campocaja" style="background-color:white;border-right-width: 0px;">\n';
                    cad += '                                                                                    <input type="text" class="campo campotexto" id="CAMPO3" name="CAMPO3" size="15" style="width:90%"\n';
                    cad += '                                                                                    value="' + NULTDIGTAR + '" readonly="readonly"/>\n';
                    cad += '                                                                                </td>\n';
                    cad += '                                                                        </tr>\n';
                    cad += '                                                                        <tr>\n';
                    cad += '                                                                                <%-- NCUOTAS --%>\n';
                    cad += '                                                                                 <td class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;" >\n';
                    cad += '                                                                                    <b><axis:alt f="axiscaj008" c="NCUOTAS" lit="9906723"/></b>\n';
                    cad += '                                                                                </td>   \n';
                    cad += '                                                                                <%-- CCOMERCIO --%>\n';
                    cad += '                                                                                 <td class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;" >\n';
                    cad += '                                                                                    <b><axis:alt f="axiscaj008" c="CCOMERCIO" lit="9900822"/></b>\n';
                    cad += '                                                                                </td>   \n';
                    cad += '                                                                        </tr>\n';
                    cad += '                                                                        <tr>\n';
                    cad += '                                                                             <%-- NCUOTAS --%>\n';
                    cad += '                                                                                <td class="campocaja" style="background-color:white;border-right-width: 0px;">\n';
                    cad += '                                                                                    <input type="text" class="campo campotexto" id="CAMPO4" name="CAMPO4" size="15" style="width:90%"\n';
                    cad += '                                                                                    value="' + NCUOTAS + '" readonly="readonly"/>\n';
                    cad += '                                                                                </td>\n';
                    cad += '                                                                             <%-- CCOMERCIO --%>\n';
                    cad += '                                                                                <td class="campocaja" style="background-color:white;border-right-width: 0px;">\n';
                    cad += '                                                                                    <input type="text" class="campo campotexto" id="CAMPO5" name="CAMPO5" size="15" style="width:90%"\n';
                    cad += '                                                                                    value="' + CCOMERCIO + '" readonly="readonly"/>\n';
                    cad += '                                                                                </td>\n';
                    cad += '                                                                        </tr>\n';
                }
                cad += '                                                                            </table> \n';
                
                layer.innerHTML = cad;
            }
            
       </script>
    </head>
    <body onload="f_onload()">
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>

    <form name="miForm" action="axis_axiscaj008.do" method="POST">
            <input type="hidden" id="operation" name="operation" value=""/>
            <input type="hidden" id="SPERSON" name="SPERSON" value="${__formdata.SPERSON}"/>
            
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt c="form" f="axiscaj008" lit="9905101"/></c:param>
                <c:param name="form">axiscaj008</c:param>
            </c:import> 
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="nid_y_titulo">axiscaj011|<axis:alt f="axiscaj008" c="MODAL_AXISCAJ011" lit="9905095" /></c:param>
            </c:import>
            
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="nid_y_titulo">axisusu009|<axis:alt c="axisusu009_TITULO" f="axisusu009" lit="9000589"/></c:param>
            </c:import>
            
            <axis:visible c="DSP_CUENTAS" f="axiscaj008"> 
              <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                <td>
                <table class="seccion">
                <tr>
                    <td align="left" >
                         <table class="area" align="center">
                            <tr>
                    <th style="width:20%;height:0px"></th>
                    <th style="width:20%;height:0px"></th>
                    <th style="width:20%;height:0px"></th>
                    <th style="width:40%;height:0px"></th>
                 </tr>
                 <tr>
                    <td class="titulocaja">
                        <b><axis:alt f="axiscaj008" c="CUSUARI" lit="9905097"/></b>
                    </td>
                    <td class="titulocaja">
                        <b><axis:alt f="axiscaj008" c="FINICIO" lit="9000526"/></b>
                    </td>
                    <td class="titulocaja">
                        <b><axis:alt f="axiscaj008" c="FFIN" lit="9000527"/></b>
                    </td>
                </tr>
                 <tr>
                    <td>
                    <input type="text" class="campo campotexto_ob"  obligatorio="true" value="${__formdata.CUSUARI}"  name="CUSUARI" id="CUSUARI" size="15"
                               style="text-transform:uppercase;width:50%" onkeypress="if (event.keyCode==13)  { f_but_buscar() }" title="<axis:alt f="axiscaj008" c="CUSUARI" lit="9905097"/>" alt="<axis:alt f="axiscaj008" c="CUSUARI" lit="9905097"/>" />
                    &nbsp;<img id="findCusuari"  src="images/find.gif" onclick="f_abrir_modal('axisusu009', null, null);" style="cursor:pointer" alt=""/>    
                    </td>
                    <td>
                        <input  type="text" class="campowidthinput campo campotexto" size="10" value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FINICIO}"/>" 
                                name="FINICIO" id="FINICIO" style="width:50%;" title= "<axis:alt f="axiscaj008" c="FINICIO" lit="108341"/>"  
                                <axis:atr f="axiscaj008" c="FINICIO" a="obligatorio=false&formato=fecha"/> />
                            <a style="vertical-align:middle;">
                                <img id="popup_calendario_FINICIO" alt="<axis:alt f="axiscaj008" c="FINICIO" lit="108341"/>"  
                                     src="images/calendar.gif" 
                            </a>
                    </td>
                    <td>
                        <input  type="text" class="campowidthinput campo campotexto" size="10" value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FFIN}"/>" 
                                name="FFIN" id="FFIN" style="width:50%;" title= "<axis:alt f="axiscaj008" c="FFIN" lit="108341"/>"  
                                <axis:atr f="axiscaj008" c="FFIN" a="obligatorio=false&formato=fecha"/> />
                            <a style="vertical-align:middle;">
                                <img id="popup_calendario_FFIN" alt="<axis:alt f="axiscaj008" c="FFIN" lit="108341"/>"  
                                     src="images/calendar.gif" 
                            </a>
                    </td>
                </tr>
                <tr>
                    <td class="titulocaja">
                        <div class="separador">&nbsp;</div> 
                        <b><axis:alt f="axiscaj008" c="CTIPMOV" lit="102421"/></b>
                    </td>
                    <td class="titulocaja">
                        <b><axis:alt f="axiscaj008" c="CMEDIPA" lit="9902938"/></b>
                    </td>
                </tr>
                  
                 <tr>
                     <td class="campocaja">
                            <select name="CTIPMOV" id="CTIPMOV" size="1" class="campowidthselect campo campotexto" style="width:84%;" 
                                    onchange="validar_medio()"
                                <axis:atr f="axiscaj008" c="CTIPMOV" a="obligatorio=false&isInputText=false"/>>
                                <option value="<%= Integer.MIN_VALUE %>">
                                    <axis:alt f="axiscaj008" c="SELECCIONAR" lit="108341"/>                                
                                </option>
                                <c:forEach var="tip_mov" items="${__formdata.LSTCTIPMOV}">
                                    <option value="${tip_mov.CATRIBU}"
                                    <c:if test="${__formdata.CTIPMOV == tip_mov.CATRIBU}">selected</c:if>>
                                    ${tip_mov.TATRIBU}
                                    </option>
                                </c:forEach>
                            </select>
                     </td>
                     <td class="campocaja">
                            <select name="CMEDMOV" id="CMEDMOV" size="1" class="campowidthselect campo campotexto" style="width:84%;" 
                                    onchange="validar_medio()"
                                <axis:atr f="axiscaj008" c="CMEDIPA" a="obligatorio=false&isInputText=false"/>>
                                <option value="<%= Integer.MIN_VALUE %>">
                                    <axis:alt f="axiscaj008" c="SELECCIONAR" lit="108341"/>                                
                                </option>
                                <c:forEach var="medmov" items="${__formdata.LSTCMEDMOV}">
                                    <option value="${medmov.CATRIBU}"
                                    <c:if test="${__formdata.CMEDMOV == medmov.CATRIBU}">selected</c:if>>
                                    ${medmov.TATRIBU}
                                    </option>
                                </c:forEach>
                            </select>
                        </td>
                </tr>
                <c:import url="../include/botonera_nt.jsp">
                <c:param name="f">axiscaj007</c:param>
                <c:param name="__botones"><axis:ocultar f="axiscaj007" c = "BT_BUSCAR" dejarHueco="false">buscar</axis:ocultar>,</c:param>
                </c:import>
                <tr>
                    <td colspan="4">
                       <div class="separador">&nbsp;</div>            
                       <div class="titulo">
                            <img src="images/flecha.gif"/><b><axis:alt f="axiscaj008" c="LIT32" lit="9905068"/></b>
                       </div>                        
                        <table class="seccion">         
                          <tr><td>
                                       <c:set var="title0"><axis:alt f="axiscaj008" c="FFECMOV" lit="100562"/></c:set>
                                       <c:set var="title1"><axis:alt f="axiscaj008" c="CUSUARI" lit="103465"/></c:set>
                                       <c:set var="title2"><axis:alt f="axiscaj008" c="TUSUARI" lit="101995"/></c:set>
                                       <c:set var="title3"><axis:alt f="axiscaj008" c="CTIPMOV" lit="9901195"/></c:set>
                                       <c:set var="title5"><axis:alt f="axiscaj008" c="CMEDMOV" lit="9905098"/></c:set>
                                       <c:set var="title6"><axis:alt f="axiscaj008" c="CLIENTE" lit="9905099"/></c:set>
                                       <c:set var="title7"><axis:alt f="axiscaj008" c="NCHEQUE" lit="9905071"/></c:set>
                                       <c:set var="title8"><axis:alt f="axiscaj008" c="CESTCHQ" lit="101510"/></c:set>
                                       <c:set var="title9"><axis:alt f="axiscaj008" c="IMOVIMI" lit="9905100"/></c:set>
                                       <c:set var="title10"><axis:alt f="axiscaj008" c="CMONEOP" lit="108645"/></c:set>
                                       <c:set var="title11"><axis:alt f="axiscaj008" c="NREFDEPOSITO" lit="9907216"/></c:set>
                                       <c:set var="title12"><axis:alt f="axiscaj008" c="OTROS" lit="1000310"/></c:set>  <%-- Altres dades --%>
                               </td>
                               <td>
                              <div class="seccion" id="MOVIMI">
                                <display:table name="${sessionScope.axiscaj008_listaMovimientos}"
                                               id="miListaId" export="false"
                                               class="dsptgtable" pagesize="15"
                                               defaultsort="1"
                                               defaultorder="ascending"
                                               sort="list" cellpadding="0"
                                               cellspacing="0"
                                               requestURI="axis_axiscaj008.do?paginar=true">
                                  <%@ include file="../include/displaytag.jsp"%>
                                  <axis:visible f="axiscaj008" c="FFECMOV">
                                   <display:column title="${title0}"
                                                  sortable="true"
                                                  sortProperty="FFECMOV"
                                                  headerClass="sortable fixed"
                                                  media="html" autolink="false">
                                    <div class="dspText">
                                    <fmt:formatDate pattern="dd/MM/yyyy" value="${miListaId['FFECMOV']}"/>
                                    </div>
                                  </display:column>
                                  </axis:visible>
                                  <display:column title="${title1}"
                                                  sortable="true"
                                                  sortProperty="CUSUARI"
                                                  headerClass="sortable fixed"
                                                  media="html" autolink="false">
                                    <div class="dspText">
                                        ${miListaId['CUSUARI']}
                                    </div>
                                  </display:column>
                                  <display:column title="${title2}"
                                                  sortable="true"
                                                  sortProperty="TUSUARI"
                                                  headerClass="sortable fixed"
                                                  media="html" autolink="false">
                                    <div class="dspText">
                                       ${miListaId['TUSUARI']}
                                    </div>
                                  </display:column>
                                  <display:column title="${title3}"
                                                  sortable="true"
                                                  sortProperty="CTIPMOV"
                                                  headerClass="sortable fixed"
                                                  media="html" autolink="false">
                                    <div class="dspText">
                                      ${miListaId['CTIPMOV']}
                                    </div>
                                  </display:column>
                                  <display:column title="${title5}"
                                                  sortable="true"
                                                  sortProperty="CMEDMOV"
                                                  headerClass="sortable fixed"
                                                  media="html" autolink="false">
                                    <div class="dspText">
                                      ${miListaId['CMEDMOV']}
                                    </div>
                                  </display:column>
                                  <display:column title="${title6}"
                                                  sortable="true"
                                                  sortProperty="CLIENTE"
                                                  headerClass="sortable fixed"
                                                  media="html" autolink="false">
                                    <div class="dspText">
                                      ${miListaId['CLIENTE']}
                                    </div>
                                  </display:column>
                                  <display:column title="${title7}"
                                                  sortable="true"
                                                  sortProperty="NCHEQUE"
                                                  headerClass="sortable fixed"
                                                  media="html" autolink="false">
                                    <div class="dspText">
                                      ${miListaId['NCHEQUE']}
                                    </div>
                                  </display:column>
                                  <display:column title="${title8}"
                                                  sortable="true"
                                                  sortProperty="CESTCHQ"
                                                  headerClass="sortable fixed"
                                                  media="html" autolink="false">
                                    <div class="dspText">
                                      ${miListaId['CESTCHQ']}
                                    </div>
                                  </display:column>
                                  <display:column title="${title9}"
                                                  sortable="true"
                                                  sortProperty="IMOVIMI"
                                                  headerClass="sortable fixed"
                                                  media="html" autolink="false">
                                    <div class="dspText">
                                      ${miListaId['IMOVIMI']}
                                    </div>
                                  </display:column>
                                  <display:column title="${title10}"
                                                  sortable="true"
                                                  sortProperty="CMONEOP"
                                                  headerClass="sortable fixed"
                                                  media="html" autolink="false">
                                    <div class="dspText">
                                      ${miListaId['CMONEOP']}
                                    </div>
                                  </display:column>
                                  <display:column title="${title11}"
                                                  sortable="true"
                                                  sortProperty="NREFDEPOSITO"
                                                  headerClass="sortable fixed"
                                                  media="html" autolink="false">
                                    <div class="dspText">
                                      ${miListaId['NREFDEPOSITO']}
                                    </div>
                                  </display:column>
                                    <!-- *************************** Bug 0032660/0190245 - 12/11/2014 - JMF ********************************* style="width:5%;"  -->
                                    <display:column title="${title12}" 
                                                    sortable="false" 
                                                    headerClass="sortable fixed" 
                                                    media="html" autolink="false" >
                                        <div class="dspIcons">
                                            <a onmouseout="ocultar('SECCION_B${miListaId['CLAVE']}');"
                                                onmouseover="javascript:mostrar('SECCION_B${miListaId['CLAVE']}','MOVIMI');mostrarContent('SECCION_B${miListaId['CLAVE']}', '${miListaId['COD_CMEDMOV']}', '${miListaId['NCHEQUE']}', '${miListaId['TBANCO']}', '${miListaId['CESTCHQ']}', '${miListaId['CAUTORIZA']}', '${miListaId['NULTDIGTAR']}', '${miListaId['NCUOTAS']}', '${miListaId['CCOMERCIO']}' );"
                                             > 
                                                <img border="0" alt="<axis:alt f="axiscaj008" c="INFO" lit="100002"/>" title="${title12}" src="images/informacion.gif" width="11px" height="11px" style="cursor:pointer;"/>
                                            </a>
                                        </div>
                                    </display:column>
                                    <!-- *************************** SECCION MÁS DATOS ********************************* -->
                                    <display:column class="seccion_informacion">
                                         <div id="SECCION_B${miListaId['CLAVE']}" class="seccion_informacion"></div>
                                    </display:column>
                                </display:table>
                                <br>
                                </td></tr>
                        </table>
                    </td>
                </tr>
            </table>
        </axis:visible>    
        <div class="separador">&nbsp;</div>   
        <div class="separador">&nbsp;</div>
        <div class="separador">&nbsp;</div>
    </form>  
    <script type="text/javascript">
            Calendar.setup({
                inputField     :    "FINICIO",     
                ifFormat       :    "%d/%m/%Y",      
                button         :    "popup_calendario_FINICIO", 
                singleClick    :    true,
                firstDay       :    1
            });
            Calendar.setup({
                inputField     :    "FFIN",     
                ifFormat       :    "%d/%m/%Y",      
                button         :    "popup_calendario_FFIN", 
                singleClick    :    true,
                firstDay       :    1
            });
    </script>     
    <c:import url="../include/botonera_nt.jsp">
       <c:param name="f">axiscaj008</c:param>
       <c:param name="__botones"><axis:ocultar f="axiscaj008" c = "BT_SALIR" dejarHueco="false">salir</axis:ocultar></c:param>
    </c:import>
    <c:import url="../include/mensajes.jsp" />    
</body>
</html>


