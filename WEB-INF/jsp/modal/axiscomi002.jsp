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
            parent.f_cerrar_axiscomi002();
       }
       
       function f_but_nuevo(){
        parent.f_but_9901307('','NUEVO');
       }
       
       function f_onload(){
        	f_cargar_propiedades_pantalla();
       }
       
       function f_but_buscar(){
       
       var CCOMISI = document.axiscomi002Form.CODIGO.value;
       var TCOMISI = document.axiscomi002Form.DESCRIPCION.value;
       var CESTADO = document.axiscomi002Form.ESTADO.value;
       var CTIPO = document.axiscomi002Form.TIPO.value;
       var FINIVIG = document.axiscomi002Form.FINIVIG.value;
       var FFINVIG = document.axiscomi002Form.FFINVIG.value;
       
       var xMonth=FINIVIG.substring(3, 5);   
       var xDay=FINIVIG.substring(0, 2);   
       var xYear=FINIVIG.substring(6,10);   
       var yMonth=FFINVIG.substring(3, 5);   
       var yDay=FFINVIG.substring(0, 2);   
       var yYear=FFINVIG.substring(6,10);   

       var fechaini = xYear+xMonth+xDay;
       var fechafin = yYear+yMonth+yDay;
       
       if(!objUtiles.estaVacio(fechaini) && !objUtiles.estaVacio(fechafin) ){
            if(fechafin<=fechaini)
                alert('<axis:alt f="axiscomi002" c="VALFECHAS" lit="101922" />');  
            else
                parent.f_but_buscar(CCOMISI,TCOMISI,CESTADO,CTIPO,FINIVIG,FFINVIG);
            
       }
       else
        parent.f_but_buscar(CCOMISI,TCOMISI,CESTADO,CTIPO,FINIVIG,FFINVIG);
        
       }
        
    </script>
  </head>
    <body onload="f_onload()" class=" ">
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
        <form name="axiscomi002Form" action="" method="POST">
            <input type="hidden" name="operation" value="">

            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt f="axiscomi002" c="formulario" lit="9901318" /></c:param>
                <c:param name="producto"><axis:alt f="axiscomi002" c="producto" lit="9901318" /></c:param>
                <c:param name="form">Axiscomi002</c:param>
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
                                        <th style="width:40%;height:0px"></th>
                                        <th style="width:20%;height:0px"></th>
                                        <th style="width:20%;height:0px"></th>
                                        <th style="width:20%;height:0px"></th>
                                    </tr>
                                    <tr>
                                        <!-- Codigo -->
                                        <td class="titulocaja">
                                            <b><axis:alt f="axiscomi002" c="CODIGO" lit="1000109" /></b>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="campocaja" >
                                            
                                            <input type="text" name="CODIGO" id="CODIGO" style="width:50%;"  value="${__formdata.CODIGO}"  class="campowidthinput campo campotexto"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <!-- DESCRIPCION -->
                                        <td class="titulocaja" >
                                            <b><axis:alt f="axiscomi002" c="DESCRIPCION" lit="100588" /></b>
                                        </td>
                                        <!-- Estado -->
                                        <td class="titulocaja" >
                                            <b><axis:alt f="axiscomi002" c="ESTADO" lit="100587" /></b>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="campocaja"  >
                                            <input type="text" name="DESCRIPCION" id="DESCRIPCION"  value="${__formdata.DESCRIPCION}"  class="campowidthinput campo campotexto"/>
                                        </td>
                                        <td class="campocaja"  >
                                            <select name = "ESTADO" id="ESTADO"  style="width:100%;"
                                                    value="" size="1" onchange="" class="campowidthselect campo campotexto">
                                                <option value=""> - <axis:alt f="axiscomi002" c="BLANCO" lit="108341"/> - </option>
                                                <c:forEach var="estado" items="${listaEstados}">
                                                    <option value = "${estado.CATRIBU}"
                                                    <c:if test="${(!empty __formdata.ESTADO)&& estado.CATRIBU == __formdata.ESTADO}"> selected </c:if>>
                                                     ${estado.TATRIBU}</option>  
                                                </c:forEach>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="titulocaja" >
                                            <b><axis:alt f="axiscomi002" c="TIPO" lit="100565" /></b><!-- Tipo -->
                                        </td> 
                                        <td class="titulocaja" >
                                            <b><axis:alt f="axiscomi002" c="FINIVIG" lit="9000716" /></b><!-- Inicioa vigencia -->
                                        </td> 
                                        <td class="titulocaja" >
                                            <b><axis:alt f="axiscomi002" c="FFINVIG" lit="9000717" /></b><!-- Fin vigencia -->
                                        </td> 
                                    </tr>
                                    <tr> 
                                        <td class="campocaja" > 
                                            <select name = "TIPO" id="TIPO"  
                                                    value="" size="1" onchange="" class="campowidthselect campo campotexto">
                                                <option value=""> - <axis:alt f="axiscomi002" c="BLANCO" lit="108341"/> - </option>
                                                <c:forEach var="tipo" items="${listaTipos}">
                                                    <option value = "${tipo.CATRIBU}"
                                                    <c:if test="${(!empty __formdata.TIPO)&& tipo.CATRIBU == __formdata.TIPO}"> selected </c:if>>
                                                     ${tipo.TATRIBU}</option>  
                                                </c:forEach>
                                            </select>
                                        </td>
                                        <td class="campocaja" >
                                            <input type="text" formato="fecha" name="FINIVIG" id="FINIVIG" style="width:60%;"   value="<fmt:formatDate value="${__formdata.FINIVIG}" pattern="dd/MM/yyyy" />" class="campowidthinput campo campotexto"/>
                                            <a id="icon_FINIVIG" style="vertical-align:middle;">
                                            <img alt="<axis:alt f="axiscomi002" c="FINIVIG1" lit="108341"/>" title="<axis:alt f="axiscomi002" c="FINIVIG2" lit="100883" />" src="images/calendar.gif"/></a>
                                        </td>
                                        <td class="campocaja" >
                                            <input type="text" formato="fecha" name="FFINVIG" id="FFINVIG" style="width:60%;"   value="<fmt:formatDate value="${__formdata.FFINVIG}" pattern="dd/MM/yyyy" />" class="campowidthinput campo campotexto"/>
                                            <a id="icon_FFINVIG" style="vertical-align:middle;">
                                            <img alt="<axis:alt f="axiscomi002" c="FFINVIG1" lit="108341"/>" title="<axis:alt f="axiscomi002" c="FFINVIG2" lit="100883" />" src="images/calendar.gif"/></a>
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
                <c:param name="__botones">cancelar,buscar<axis:visible f="axiscomi002" c="NUEVO" >,nuevo</axis:visible></c:param>
            </c:import>
            
            <script type="text/javascript">
            Calendar.setup({
            inputField     :    "FINIVIG",     
            ifFormat       :    "%d/%m/%Y",      
            button         :    "icon_FINIVIG", 
            singleClick    :    true,
            firstDay       :    1
            });
            
            
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

