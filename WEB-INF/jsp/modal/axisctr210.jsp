<%/*
*  Fichero: Axiscomi002.jsp
*  @author <a href = "mailto:amartinez@csi-ti.com">Alex Martinez</a> 
*
*  Fecha: 12/07/2010
*/
%>
<%@ page contentType="text/html;charset=windows-1252" errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>

<%@ page import="java.util.List" %>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

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
    <script language="Javascript" type="text/javascript">

        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/

       function f_but_cancelar() {
            parent.f_cerrar_axisctr210();
       }
       
       
       function f_onload(){
        	f_cargar_propiedades_pantalla();
       }
       
       function f_but_buscar(){
       
           var CMATRIC = document.axisctr210Form.CMATRIC.value;
           var CODMOTOR = document.axisctr210Form.CODMOTOR.value;
           var CCHASIS = document.axisctr210Form.CCHASIS.value;
           var NBASTID = document.axisctr210Form.NBASTID.value;
           var CLASELISTA = document.axisctr210Form.CLASELISTA.value;
           var TIPOLISTA = document.axisctr210Form.TIPOLISTA.value;
           var FINCLUDESDE = document.axisctr210Form.FINCLUDESDE.value;
           var FINCLUHASTA = document.axisctr210Form.FINCLUHASTA.value;
           var FEXCLUDESDE = document.axisctr210Form.FEXCLUDESDE.value;
           var FEXCLUHASTA = document.axisctr210Form.FEXCLUHASTA.value;
           
           parent.f_but_buscar(CMATRIC,CODMOTOR,CCHASIS,NBASTID,CLASELISTA,TIPOLISTA,
                               FINCLUDESDE,FINCLUHASTA,FEXCLUDESDE,FEXCLUHASTA);
        
       }
       
       function f_onchange_CTIPPERcerca(TIDENTI) {
            formdataTIDENTI = '${__formdata.TPERSONA}';
            if ( TIDENTI != formdataTIDENTI ) {
                // Recargar formulario para esconder/mostrar campos en función de TIDENTI
                objUtiles.ejecutarFormulario("modal_axisctr210.do", "form", document.axisctr210Form, "_self", objJsMessages.jslit_cargando);   
            }
        }
        
    </script>
  </head>
    <body onload="f_onload()" class=" ">
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
        <form name="axisctr210Form" action="" method="POST">
            <input type="hidden" name="operation" value="">

            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt f="axisctr210" c="formulario" lit="9905978" /></c:param>
                <c:param name="producto"><axis:alt f="axisctr210" c="producto" lit="9905978" /></c:param>
                <c:param name="form">Axisctr210</c:param>
            </c:import>
            <!-- Area de campos  -->
            <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <table class="seccion">    
                        <tr>
                            <td align="left" >
                                <table class="area" align="center">
                                    <tr>
                                        <th style="width:20%;height:0px"></th>
                                        <th style="width:25%;height:0px"></th>
                                        <th style="width:20%;height:0px"></th>
                                        <th style="width:20%;height:0px"></th>
                                        <th style="width:15%;height:0px"></th>
                                    </tr>
                                    <tr>
                                        <!-- Codigo Matricula --> 
                                        <td class="titulocaja">
                                            <b><axis:alt f="axisctr210" c="CMATRIC" lit="9001057"/></b>
                                        </td>
                                        <!-- Codigo motor -->
                                        <td class="titulocaja" >
                                            <b><axis:alt f="axisctr210" c="CODMOTOR" lit="9904654"/></b>
                                        </td>
                                        <!-- Codigo chasis -->
                                        <td class="titulocaja" >
                                            <b><axis:alt f="axisctr210" c="CCHASIS" lit="9904655"/></b>
                                        </td>
                                        <!-- Numero bastidor -->
                                        <td class="titulocaja" >
                                            <b><axis:alt f="axisctr210" c="NBASTID" lit="9001061"/></b>
                                        </td>
                                        
                                    </tr>
                                    <tr> 
                                        <td class="campocaja">
                                            <input type="text" name="CMATRIC" id="CMATRIC"  value="${__formdata.CMATRIC}"  class="campowidthinput campo campotexto"/>
                                        </td>
                                        <td class="campocaja">
                                            <input type="text" name="CODMOTOR" id="CODMOTOR"  value="${__formdata.CODMOTOR}"  class="campowidthinput campo campotexto"/>
                                        </td>
                                        <td class="campocaja">
                                            <input type="text" name="CCHASIS" id="CCHASIS"  value="${__formdata.CCHASIS}"  class="campowidthinput campo campotexto"/>
                                        </td>
                                        <td class="campocaja">
                                            <input type="text" name="NBASTID" id="NBASTID"  value="${__formdata.NBASTID}"  class="campowidthinput campo campotexto"/>
                                        </td>
                                       
                                    </tr>
                                    <tr>
                                        <td class="titulocaja" >
                                            <b><axis:alt f="axisctr210" c="CLASELISTA" lit="9904431"/></b><!-- Clase lista -->
                                        </td> 
                                        <td class="titulocaja" >
                                            <b><axis:alt f="axisctr210" c="TIPOLISTA" lit="9904432"/></b><!-- Tipo lista -->
                                        </td> 
                                        
                                    </tr>
                                    <tr> 
                                        <td class="campocaja" > 
                                            <select name = "CLASELISTA" id="CLASELISTA" size="1" class="campowidthselect campo campotexto"
                                            <axis:atr f="axisctr210" c="CLASELISTA" a="modificable=true&obligatorio=false&isInputText=false"/> >
                                                <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisctr210" c="BLANCO" lit="108341"/> - </option>
                                                <c:forEach var="tipo" items="${__formdata.listValores.claseList}">
                                                    <option value = "${tipo.CATRIBU}"
                                                    <c:if test="${(!empty __formdata.CLASELISTA)&& tipo.CATRIBU == __formdata.CLASELISTA}"> selected </c:if>>
                                                     ${tipo.TATRIBU}</option>  
                                                </c:forEach>
                                            </select>
                                        </td>
                                        <td class="campocaja" > 
                                            <select name = "TIPOLISTA" id="TIPOLISTA" size="1" class="campowidthselect campo campotexto"
                                                <axis:atr f="axisctr210" c="TIPOLISTA" a="modificable=true&obligatorio=false&isInputText=false"/>>
                                                <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisctr210" c="BLANCO" lit="108341"/> - </option>
                                                <c:forEach var="tipo" items="${__formdata.listValores.tipoList}">
                                                    <option value = "${tipo.CATRIBU}"
                                                    <c:if test="${(!empty __formdata.TIPO)&& tipo.CATRIBU == __formdata.TIPO}"> selected </c:if>>
                                                     ${tipo.TATRIBU}</option>  
                                                </c:forEach>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="titulocaja" >
                                            <b><axis:alt f="axisctr210" c="FINCLUDESDE" lit="9902640"/>
                                               <axis:alt f="axisctr210" c="FINCLUDESDE2" lit="104095"/></b><!--F. Inclusion desde -->
                                        </td> 
                                        <td class="titulocaja" >
                                            <b><axis:alt f="axisctr210" c="FINCLUHASTA" lit="9902640"/>
                                               <axis:alt f="axisctr210" c="FINCLUHASTA2" lit="103051"/></b><!-- F. Inclusion hasta -->
                                        </td> 
                                        <td class="titulocaja" >
                                            <b><axis:alt f="axisctr210" c="FEXCLUDESDE" lit="9902639"/>
                                               <axis:alt f="axisctr210" c="FEXCLUDESDE2" lit="104095"/></b><!-- F. Exclusión desde -->
                                        </td> 
                                        <td class="titulocaja" >
                                            <b><axis:alt f="axisctr210" c="FEXCLUHASTA" lit="9902639"/>
                                               <axis:alt f="axisctr210" c="FEXCLUHASTA2" lit="103051"/></b><!-- F. Exclusión hasta -->
                                        </td> 
                                    </tr>
                                    <tr>
                                        <td class="campocaja" > 
                                            <input type="text" formato="fecha" name="FINCLUDESDE" id="FINCLUDESDE" style="width:40%;"   value="<fmt:formatDate value="${__formdata.FINIVIG}" pattern="dd/MM/yyyy" />" class="campowidthinput campo campotexto"/>
                                            <a id="icon_FINCLUDESDE" style="vertical-align:middle;">
                                            <img alt="<axis:alt f="axisctr210" c="FINCLUDESDE1" lit="108341"/>" title="<axis:alt f="axisctr210" c="FINCLUDESDE2" lit="100883" />" src="images/calendar.gif"/></a>
                                        </td>
                                        <td class="campocaja" >
                                            <input type="text" formato="fecha" name="FINCLUHASTA" id="FINCLUHASTA" style="width:30%;"   value="<fmt:formatDate value="${__formdata.FINCLUHASTA}" pattern="dd/MM/yyyy" />" class="campowidthinput campo campotexto"/>
                                            <a id="icon_FINCLUHASTA" style="vertical-align:middle;">
                                            <img alt="<axis:alt f="axisctr210" c="FINCLUHASTA1" lit="108341"/>" title="<axis:alt f="axisctr210" c="FINCLUHASTA2" lit="100883" />" src="images/calendar.gif"/></a>
                                        </td>
                                        <td class="campocaja" >
                                            <input type="text" formato="fecha" name="FEXCLUDESDE" id="FEXCLUDESDE" style="width:40%;"   value="<fmt:formatDate value="${__formdata.FEXCLUDESDE}" pattern="dd/MM/yyyy" />" class="campowidthinput campo campotexto"/>
                                            <a id="icon_FEXCLUDESDE" style="vertical-align:middle;">
                                            <img alt="<axis:alt f="axisctr210" c="FEXCLUDESDE1" lit="108341"/>" title="<axis:alt f="axisctr210" c="FEXCLUDESDE2" lit="100883" />" src="images/calendar.gif"/></a>
                                        </td>
                                        <td class="campocaja" >
                                            <input type="text" formato="fecha" name="FEXCLUHASTA" id="FEXCLUHASTA" style="width:40%;"   value="<fmt:formatDate value="${__formdata.FEXCLUHASTA}" pattern="dd/MM/yyyy" />" class="campowidthinput campo campotexto"/>
                                            <a id="icon_FEXCLUHASTA" style="vertical-align:middle;">
                                            <img alt="<axis:alt f="axisctr210" c="FEXCLUHASTA1" lit="108341"/>" title="<axis:alt f="axisctr210" c="FEXCLUHASTA2" lit="100883" />" src="images/calendar.gif"/></a>
                                        </td>
                                    </tr>
                                </table>    
                            </td>
                        </tr>
                        </table>
                    </td>
                </tr>
            </table>					
            
            <c:import url="../include/botonera_nt.jsp"><c:param name="f">axiscomi002</c:param><c:param name="f">axiscomi002</c:param>
                <c:param name="__botones">cancelar,buscar</c:param>
            </c:import>
            
            <script type="text/javascript">
            Calendar.setup({
            inputField     :    "FINCLUDESDE",     
            ifFormat       :    "%d/%m/%Y",      
            button         :    "icon_FINCLUDESDE", 
            singleClick    :    true,
            firstDay       :    1
            });
            
            
            Calendar.setup({
            inputField     :    "FINCLUHASTA",     
            ifFormat       :    "%d/%m/%Y",      
            button         :    "icon_FINCLUHASTA", 
            singleClick    :    true,
            firstDay       :    1
            });
            
            Calendar.setup({
            inputField     :    "FEXCLUDESDE",     
            ifFormat       :    "%d/%m/%Y",      
            button         :    "icon_FEXCLUDESDE", 
            singleClick    :    true,
            firstDay       :    1
            });
            
            
            Calendar.setup({
            inputField     :    "FEXCLUHASTA",     
            ifFormat       :    "%d/%m/%Y",      
            button         :    "icon_FEXCLUHASTA", 
            singleClick    :    true,
            firstDay       :    1
            });
            </script>
            
        </form>
      <c:import url="../include/mensajes.jsp" />
    </body>
</html>

