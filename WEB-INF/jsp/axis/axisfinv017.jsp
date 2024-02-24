<%
/**
*  Fichero: axisfinv017.jsp
*  Fecha: 15/10/2015
*/
%>
<%@ page contentType="text/html;charset=windows-1252" errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ page import="java.util.HashMap" %>
<%@ page import="axis.util.Constantes" %>
<%@ page import="java.util.ArrayList" %>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<html>
  <head>
    <link rel="stylesheet" href="styles/genericosHtml.css" type="text/css">
    <link rel="stylesheet" href="styles/axisnt.css" type="text/css">
    <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>
    <c:import url="../include/carga_framework_js.jsp" />
    
    <%--Inicio Sólo si vamos a tener un campo fecha --%>
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
    <%-- fin Sólo si vamos a tener un campo fecha --%>
    

    <script language="Javascript" type="text/javascript">

        function f_onload() {
            f_cargar_propiedades_pantalla();
            
            /***
            var vmodo  = document.getElementById("MODO");
            var vcheck = document.getElementById("processCheck");
                        
            if (vmodo.value == 'A') 
                vcheck.checked = true;
            else 
                vcheck.checked = false; 
                
            if (vmodo.value == 'null') {
                vcheck.checked = false; 
            }
            ***/
        }
        
        function f_but_salir() {
            objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axis_axisfinv017", "salir", document.miForm, "_self");
        }   
            
        
        function f_but_109006() {
            if (objValidador.validaEntrada() ){
                objUtiles.ejecutarFormulario ("axis_axisfinv017.do", "ejecutar", document.miForm, "_self", objJsMessages.jslit_cargando);
            }
        }
        
        function f_check(obj) {
            var form        = obj.form;
            var checkboxes  = form.elements[obj.name];
            var nomColumnas = form.elements['nombreColumna'];
            var str         = '';

            for (i=0; i<checkboxes.length; i++) {
                if (checkboxes[i].checked)
                    str = str + nomColumnas[i].value + '-' + '1;';
                else
                    str = str + nomColumnas[i].value + '-' + '0;';
            }
            
            // Guardar cadena de selecciones
            str       = str.substring(0, str.lastIndexOf(';'));
            var sel   = document.getElementById("selection");
            sel.value = str;
                        
            // Guardar tamaño de la lista
            var vsize   = document.getElementById("size");
            vsize.value = checkboxes.length;
        }
        
        /**
         * modo = 'R' si 'Reprocess' no está marcado
         *        'A' si 'Reprocess' está marcado
         * @param obj 
         */
        function f_modo(obj) {
            var modo  = document.getElementById('MODO');

            if (!obj.checked) 
                modo.value = 'R'
            else 
                modo.value = 'A'    
        }
             
        function f_formatdate(entrada,title){
            var jDate = new JsFecha();
            
            if (entrada.value.length > 0){
                entrada.value = jDate.formateaFecha(entrada.value);
                    
                if (jDate.validaFecha(entrada.value)){
                    entrada.value=jDate.formateaFecha(entrada.value);
                }
                else{
                    alert("<axis:alt f='axisfinv017' c='VAL_FECHA' lit='1000421'/>");
                    entrada.value = '';
                }
            }
            else {
                entrada.value = '';
            }
        }  

        function f_valida_numero() {  
        
           var decimal = /^[0-9]+([,.][0-9]+)?$/g;
           var numero  = document.getElementById("IIMPDIV");

           if (numero.value.match(decimal))  
               return number;
           else {
               alert("<axis:alt f='axisfinv017' c='VAL_NUMERO' lit='1000150'/>");
               numero.value = '';
               return false;
           }
        }
    </script>
    
  </head>
    <body onload="f_onload()"> 
      <div id="wrapper" class="wrapper">
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>

        <form name="miForm" action="" method="POST">

            <input type="hidden" id="selection" name="selection" value=""/>
            <input type="hidden" id="size"      name="size" value=""/>
            <input type="hidden" id="MODO"        name="MODO" value="${__formdata.MODO}" />

            <!-- Este campo se requiere para cualquier página -->
            <input type="hidden" id="operation" name="operation" value=""/>
        
            <c:set var="title0"></c:set>   
            <c:set var="title1"><axis:alt f="axisfinv017" c="CODE" lit="103465"/></c:set>
            <c:set var="title2"><axis:alt f="axisfinv017" c="FUND" lit="1000179"/></c:set>
            
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt f="axisfinv017" c="DIVIDENDS" lit="9908487"/></c:param>
                <c:param name="producto"><axis:alt f="axisfinv017" c="DIVIDENDS" lit="9908487"/></c:param>
                <c:param name="form">axisfinv017</c:param>
            </c:import>
        
            
            <table class="seccion" align="center">
                <tr>
                    <td>
                        <table class="area" align="center" style="width: 40%;"> 
                            <tr>                        
                                <td>       
                                    <display:table name="${T_IAX_INFO}"
                                                   id="T_IAX_INFO" 
                                                   export="false"
                                                   class="dsptgtable" 
                                                   pagesize="15"
                                                   defaultsort="2"       
                                                   defaultorder="ascending"
                                                   sort="list"
                                                   cellpadding="0"
                                                   cellspacing="0"
                                                   requestURI="axis_axisfinv017.do?paginar=true">                                 
                                                                                    
                                        <%@ include file="../include/displaytag.jsp"%>
    
    
                                        <display:column title="${title0}" sortable="false" 
                                                                          headerClass="headwidth5 sortable"  
                                                                          media="html" 
                                                                          autolink="false"
                                                                          style="width: 10%;">
                                            <div class="dspText">
                                                <input type="checkbox" id="selectedCheck" name="selectedCheck" 
                                                                       value=""  
                                                                       <c:if test="${T_IAX_INFO.SELECCIONADO == '1'}">checked</c:if>
                                                                       style="margin: 0 0 0 4px" onclick="f_check(this);" />
                                            </div>
                                        </display:column>
                         
                                        
                                        <display:column title="${title1}" sortable="true" 
                                                                          sortProperty="NOMBRE_COLUMNA" 
                                                                          headerClass="headwidth5 sortable"  
                                                                          media="html" 
                                                                          autolink="false"
                                                                          style="width: 20%;">
                                            <div class="dspText">${T_IAX_INFO.NOMBRE_COLUMNA}</div>
 
                                            <input type="hidden" id="nombreColumna" name="nombreColumna" 
                                                                 value="${T_IAX_INFO.NOMBRE_COLUMNA}" />                                            
                                        </display:column>
                                                             
                                        <display:column title="${title2}" sortable="true" 
                                                                          sortProperty="VALOR_COLUMNA"
                                                                          headerClass="sortable"  
                                                                          media="html" 
                                                                          autolink="false" 
                                                                          style="width: 30%;">
                                            <div class="dspText">${T_IAX_INFO.VALOR_COLUMNA}</div>
                                        </display:column>                                                                                                                                  
                                    </display:table> 
                                </td>
                            </tr>
                            
                            <tr></tr>
                            <tr>
                                <td>
                                    <table>
                                        <tr>
                                            <td style="width:30%;padding-left:14px">
                                                <table>
                                                    <tr><td class="titulocaja"><b><axis:alt f="axisfinv017" c="FVIGENCIA" lit="9908512"/></b></td></tr>
                                                    <tr>
                                                        <td>
                                                            <axis:visible f="axisfinv017" c="FVIGENCIA"> 
                                                                <input type="text" id="FVIGENCIA"  name="FVIGENCIA"
                                                                       value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FVIGENCIA}" />" 
                                                                       paramMap="true"  
                                                                       formato="fecha" 
                                                                       title="<axis:alt f="axisfinv017" c="FVIGENCIA" lit="9908512" />"
                                                                       onchange="f_formatdate(this);" <axis:atr f="axisfinv017" c="FVIGENCIA" a="obligatorio=true" />
                                                                       style="width:70%;"  
                                                                       class="campowidthinput campo campotexto" />
                                                                       <a id="icon_FVIGENCIA" style="vertical-align:middle;">
                                                                       <img alt="<axis:alt f="axisfinv017" c="IMG_FVIGENCIA" lit="108341"/>" 
                                                                       title="<axis:alt f="axisfinv017" c="IMG_FVIGENCIA" lit="108341" />" 
                                                                       src="images/calendar.gif"/> </a>
                                                            </axis:visible>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            
                                            <td style="width:40%;">
                                            </td>
                                              
                                            <td style="width:30%;padding-left:10px">
                                                <table>
                                                    <tr><td class="titulocaja"><b><axis:alt f="axisfinv017" c="FVALMOV" lit="105957"/></b></td></tr>
                                                    <tr>
                                                        <td>
                                                            <axis:visible f="axisfinv017" c="FVALMOV"> 
                                                                <input type="text" id="FVALMOV"  name="FVALMOV"
                                                                       value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FVALMOV}"/>" 
                                                                       paramMap="true"  
                                                                       formato="fecha" 
                                                                       title="<axis:alt f="axisfinv017" c="FVALMOV" lit="105957" />"
                                                                       onchange="f_formatdate(this);" <axis:atr f="axisfinv017" c="FVALMOV" a="obligatorio=true" />
                                                                       style="width:70%;"  
                                                                       class="campowidthinput campo campotexto" />
                                                                       <a id="icon_FVALMOV" style="vertical-align:middle;">
                                                                       <img alt="<axis:alt f="axisfinv017" c="IMG_FVALMOV" lit="108341"/>" 
                                                                       title="<axis:alt f="axisfinv017" c="IMG_FVALMOV" lit="108341" />" 
                                                                       src="images/calendar.gif"/> </a>
                                                            </axis:visible>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>                                          
                                        </tr>
                                        
                                        <tr>
                                        </tr>
                                        
                                        <tr>
                                            <td style="width:30%;padding-left:14px">
                                                <table>
                                                    <tr><td class="titulocaja"><b><axis:alt f="axisfinv017" c="IIMPDIV" lit="9908513"/></b></td></tr>
                                                    <tr>
                                                        <td>
                                                            <axis:visible f="axisfinv017" c="IIMPDIV"> 
                                                                <input type="text" id="IIMPDIV" 
                                                                                   name="IIMPDIV" 
                                                                                   title="<axis:alt f="axisfinv017" c="IIMPDIV" lit="9908513" />"
                                                                                   onchange="f_valida_numero();" 
                                                                                   value="${__formdata.IIMPDIV}"    
                                                                                   style="width:70%;"  
                                                                                   <axis:atr f="axisfinv017" c="IIMPDIV" a="obligatorio=true" />
                                                                                   class="campowidthinput campo campotexto" />
                                                            </axis:visible>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            
                                            <td style="width:40%;">
                                            </td>
                                              
                                            <td style="width:30%;padding-left:10px">
                                                <table>
                                                    <tr><td class="titulocaja"><b><axis:alt f="axisfinv017" c="processCheck" lit="9901221"/></b></td></tr>
                                                    <tr>
                                                        <td>
                                                            <axis:visible f="axisfinv017" c="PROCHECK"> 
                                                                    <input type="checkbox" 
                                                                           id="processCheck"
                                                                           name="processCheck" 
                                                                           value=""
                                                                           style="width:5%; margin: 0 0 0 0"  
                                                                           onclick="f_modo(this);" />
                                                            </axis:visible>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>                                         
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>     
      
            <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisfinv017</c:param>
                <c:param name="f">axisfinv017</c:param>
                <c:param name="__botones"><axis:visible c="BUT_SALIR" f="axisctr016">salir</axis:visible>,109006</c:param>
            </c:import>
            
            <script type="text/javascript">
                Calendar.setup({
                    inputField     :    "FVIGENCIA",     
                    ifFormat       :    "%d/%m/%Y",      
                    button         :    "icon_FVIGENCIA", 
                    singleClick    :    true,
                    firstDay       :    1
                });
            </script>
            
            <script type="text/javascript">
                Calendar.setup({
                    inputField     :    "FVALMOV",     
                    ifFormat       :    "%d/%m/%Y",      
                    button         :    "icon_FVALMOV", 
                    singleClick    :    true,
                    firstDay       :    1
                });
            </script>
            
    </form>
    <c:import url="../include/mensajes.jsp" />
</div>
    </body>
</html>
