<%--
      NOMBRE:    axismnt015.jsp
      @author <a href = "mailto:autor@csi-ti.com">Javi del Rio</a>
      Fecha: 10/07/2012
      PROPÓSITO: Mantenimiento de compañias
      
  
      REVISIONES:
      Ver        Fecha        Autor             Descripción
      ---------  ----------  ---------------  ------------------------------------
      1.0        10/07/2012   JRB             1. Creación de la pantalla. Bug.22122      
--%>

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
        <script type="text/javascript">

            /****************************************************************************************/
            /*********************************** NAVEGACION *****************************************/
            /****************************************************************************************/            
            function f_onload(){
                f_cargar_propiedades_pantalla(); 
                revisarEstilos();
 	  } 	   
            
            function f_but_salir() {
                objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axismnt015", "cancelar", document.miForm, "_self");
            }
            
                       
            function f_new (){
                //objUtiles.abrirModal("axismnt015", "src", "modal_axismnt017.do?operation=nou&NOU=1");
                //alert("boton nuevo");
                objUtiles.abrirModal("axismnt017", "src", "modal_axismnt017.do?operation=form&NOU=1");
            }
            
            function f_editar (CCOMPANI){
                //objUtiles.abrirModal("axismnt017", "src", "modal_axismnt017.do?operation=form&PAR_CCOMPANI=" + CCOMPANI);                
                //alert("boton editar");
                objUtiles.abrirModal("axismnt017", "src", "modal_axismnt017.do?operation=form&PAR_CCOMPANI=" + CCOMPANI);
            }
            
            /****************************************************************************************/
            /*********************************** UTILS *****************************************/
            /****************************************************************************************/            
            function f_actualizar_check(thiss){
                thiss.value = thiss.checked ? 1 : 0;
            }
                        
            function f_cerrar_modal(cual) {
                objUtiles.cerrarModal(cual);
                if (cual=='axismnt017') {
                    objUtiles.ejecutarFormulario ("axis_axismnt015.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);   
                }
            }

        </script>
    </head>
    <body onload="f_onload()">
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
    <%--Declaración de modales, en el caso que se quiera la aspa de cerrar de la ventana modal será necesario incluir |true en 
    caso contrario no poner nada.
    Ejemplo declaración de modal con aspa de cerrar(axisctr029) y sin aspa de cerrar (axisXXXModalplantilla): --%>
    <c:import url="../include/modal_estandar.jsp">
        <c:param name="nid_y_titulo">axismnt017|<axis:alt c="LIT_MODAL_AXISMNT017" f="axismnt017" lit="9903958"/></c:param>
    </c:import>
 
    <form name="miForm" action="" method="POST">
       <input type="hidden" id="operation" name="operation" value=""/>
       <input type="hidden" name="NRIESGO" id="NRIESGO" value="${__formdata.NRIESGO}"/>
        
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt c="lit_form" f="axismnt015" lit="9903955"/></c:param>
                <c:param name="form">axismnt015</c:param>
            </c:import>
            <div class="separador">&nbsp;</div>
                      <!-- Área de campos  -->
            <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <div class="titulo">                               
                            <div style="float:right;">
                                <axis:visible f="axismnt015" c="BOT_NEW">
                                    <img id="new" border="0" src="images/new.gif" alt="<axis:alt f="axismnt015" c="BOT_NEW" lit="1000428"/>" onclick="f_new();" style="cursor:pointer"/>  
                                </axis:visible>
                            </div>
                            <div style="clear:both;">
                               
                            </div>
                        </div>
                        <!-- Sección 1 -->
                        <table class="seccion">
                            
                           <tr>                       
                                        
                                        <td class="titulocaja" >
                                           
                                            <c:set var="title0"><axis:alt f="axismnt015" c="CCOMPANI" lit="9900885"/></c:set>  
                                            <c:set var="title1"><axis:alt f="axismnt015" c="TCOMPANI" lit="9903960"/></c:set>  
                                            <c:set var="title2"><axis:alt f="axismnt015" c="TTIPCOM" lit="9903956"/></c:set>  
                                            <c:set var="title3"><axis:alt f="axismnt015" c="FFALTA" lit="9001192"/></c:set>  
                                            <c:set var="title4"><axis:alt f="axismnt015" c="FBAJA" lit="9001510"/></c:set>  
                                            <c:set var="title5"><axis:alt f="axismnt015" c="CAFILI" lit="9903957"/></c:set>  
                                            <c:set var="title6"><axis:alt f="axismnt015" c="EDIT" lit="9901356"/></c:set>  

                                            <%int contador = 0;%>
                                            <div class="displayspaceMaximo">
                                                <display:table name="${listaCompanias}" id="LSTCOMP" export="false" class="dsptgtable" pagesize="-1" sort="list" cellpadding="0" cellspacing="0" style="width:98%" requestURI="axis_axismnt015.do?operation=form&paginar=true"> 
                                                    <%@ include file="../include/displaytag.jsp"%>
                                                    
                                                    <axis:visible f="axismnt015" c="CCOMPANI">
                                                        <display:column title="${title0}" sortable="true" sortProperty="OB_IAX_COMPANIAS.CCOMPANI" headerClass="sortable fixed"  media="html" autolink="false" style="width:12%" >
                                                            <div class="dspText">
                                                                ${LSTCOMP.OB_IAX_COMPANIAS.CCOMPANI}
                                                            </div>
                                                        </display:column>
                                                    </axis:visible>
                                                    <axis:visible f="axismnt015" c="TCOMPANI">
                                                        <display:column title="${title1}" sortable="true" sortProperty="OB_IAX_COMPANIAS.TCOMPANI" headerClass="sortable fixed"   media="html" autolink="false" style="width:30%" >
                                                            <div class="dspText">
                                                             ${LSTCOMP.OB_IAX_COMPANIAS.TCOMPANI}
                                                            </div>
                                                        </display:column>
                                                    </axis:visible>
                                                    <axis:visible f="axismnt015" c="TTIPCOM">
                                                        <display:column title="${title2}" sortable="true" sortProperty="OB_IAX_COMPANIAS.TTIPCOM" headerClass="sortable fixed"  media="html" autolink="false" style="width:12%" >
                                                            <div class="dspNumber">
                                                                ${LSTCOMP.OB_IAX_COMPANIAS.TTIPCOM}
                                                            </div>
                                                        </display:column>
                                                    </axis:visible>
                                                    <axis:visible f="axismnt015" c="FFALTA">
                                                        <display:column title="${title3}" sortable="true" sortProperty="OB_IAX_COMPANIAS.FFALTA" headerClass="sortable fixed"  media="html" autolink="false" style="width:12%" >
                                                            <div class="dspText">
                                                                <fmt:formatDate value='${LSTCOMP.OB_IAX_COMPANIAS.FFALTA}' pattern='dd/MM/yyyy'/>
                                                            </div>
                                                        </display:column>
                                                    </axis:visible>
                                                    <axis:visible f="axismnt015" c="FBAJA">
                                                        <display:column title="${title4}" sortable="true" sortProperty="OB_IAX_COMPANIAS.FBAJA" headerClass="sortable fixed"  media="html" autolink="false" style="width:12%" >
                                                            <div class="dspText">
                                                                <fmt:formatDate value='${LSTCOMP.OB_IAX_COMPANIAS.FBAJA}' pattern='dd/MM/yyyy'/>
                                                            </div>
                                                        </display:column>
                                                    </axis:visible>
                                                    <axis:visible f="axismnt015" c="CAFILI">
                                                        <display:column title="${title5}" sortable="true" sortProperty="OB_IAX_COMPANIAS.CAFILI" headerClass="sortable fixed"  media="html" autolink="false" style="width:12%" >
                                                            <div class="dspText">
                                                                <input onClick="f_onclickCheckbox(this)" type="checkbox" id="SWRUT" name="SWRUT"  
                                                                <axis:atr f="axismnt015" c="CAFILI" a="isInputText=false&modificable=false" /> 
                                                                <c:if test="${LSTCOMP.OB_IAX_COMPANIAS.CAFILI == 1}">checked="true"</c:if>  value="${LSTCOMP.OB_IAX_COMPANIAS.CAFILI}"/>                                                              
                                                            </div>
                                                        </display:column>
                                                    </axis:visible>
                                                    
                                                    <axis:visible f="axismnt015" c="EDIT">
                                                        <display:column title="${title6}" sortable="" sortProperty="" headerClass="sortable fixed"  media="html" autolink="false" style="width:5%" >
                                                            <div class="dspIcons">
                                                                <img border="0" alt="<axis:alt f="axismnt015" c="EDIT" lit="9901356"/>" title="<axis:alt f="axismnt015" c="edit" lit="9901356"/>" src="images/lapiz.gif"
                                                                style="vertical-align:middle;cursor:pointer;" 
                                                                onclick="javascript:f_editar('${LSTCOMP.OB_IAX_COMPANIAS.CCOMPANI}')"/>
                                                            </div>
                                                        </display:column>
                                                    </axis:visible>                                                                                                      
                                                    <%contador++;%>  
                                                </display:table>                                                        
                                            </div>
                                        </td>
                            </tr>
    
                        </table>
                        <div class="separador">&nbsp;</div>
                                    
        </form>   
    

<c:import url="../include/botonera_nt.jsp">
   <c:param name="f">axismnt015</c:param>
   <c:param name="__botones"><axis:ocultar f="axismnt015" c = "BT_SALIR" dejarHueco="false">salir</axis:ocultar></c:param>
</c:import>
<c:import url="../include/mensajes.jsp" />
    
</body>
</html>


