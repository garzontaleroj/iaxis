<%--
      NOMBRE:    axisusu004.jsp
      @author <a href = "mailto:xpastor@csi-ti.com">Xavi Pastor</a>
      Fecha: 05/04/2011
      PROPÓSITO (descripción pantalla): 
      Ejemplo : Buscador usuarios
  
      REVISIONES:
      Ver        Fecha        Autor             Descripción
      ---------  ----------  ---------------  ------------------------------------
      1.0        05/04/2011   XPL                1. Creación de la pantalla. Bug.18091
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
        
        <!--Inicio Sólo si vamos a tener un campo fecha !-->
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
        <!-- fin Sólo si vamos a tener un campo fecha !-->
        <script type="text/javascript">

            /****************************************************************************************/
            /*********************************** NAVEGACION *****************************************/
            /****************************************************************************************/            
            function f_onload(){
              document.miForm.USERNAME.focus();
               f_cargar_propiedades_pantalla();
             }
	    
 	    			

           function f_but_buscar() {
                if (objValidador.validaEntrada()){
                    //Validamos los campos de pantalla, ahora llamaríamos a la función que tocara
                    objUtiles.ejecutarFormulario("modal_axisusu004.do", "buscar", document.miForm, "_self", objJsMessages.jslit_cargando);
                }
           }
           
           function f_but_aceptar(idusuario) {
          

          if (objUtiles.estaVacio(idusuario))
            idusuario = document.getElementById("checked_usu").value;
          
 
                parent.f_aceptar_axisusu004(idusuario);
           }
           
           function f_but_cancelar() {
                parent.f_cerrar_modal('axisusu004');
           }
        

            
        </script>
    </head>
 <body class=" " onload="f_onload()" onkeypress="if (event.keyCode==13)  { f_but_buscar() }">
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
        <form name="miForm" action="" method="POST">
            <input type="hidden" id="operation" name="operation" value=""/>
            
            <input type="hidden" id="tipo" name="tipo" value="${__formdata.tipo}"/>
            
            
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt c="AXISUSU004_TITULO" f="axisusu004" lit="102114"/></c:param>
                <c:param name="producto"><axis:alt c="AXISUSU004_TITULO" f="axisusu004" lit="102114"/></c:param>
                <c:param name="form">axisusu004</c:param>
            </c:import>
            <!-- Area de campos  -->
            
              <!-- Área de campos  -->
              <axis:visible f="axisusu004" c="FILTRO">
            <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                    
                        <div class="separador">&nbsp; </div>                                        
                        <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axisusu004" c="FILTRO" lit="1000178" /></div>
                        <table class="seccion">
                            <tr>
                                <td>
                                    <table class="area" align="center">
                                        <tr>
                                            <th style="width:25%;height:0px"></th>
                                            <th style="width:25%;height:0px"></th>
                                            <th style="width:25%;height:0px"></th>
                                            <th style="width:25%;height:0px"></th>
                                        </tr>
                                        
                                        <tr>
                                           <axis:ocultar f="axisusu004" c="USERNAME">
                                                <td class="titulocaja" colspan="2">
                                                    <b><axis:alt f="axisusu004" c="USERNAME" lit="101995"/></b> <%-- Nombre usuario --%>
                                                </td>
                                            </axis:ocultar>
                                            
                                            <td class="titulocaja">
                                                &nbsp;
                                            </td>
                                        </tr>
                                        <tr>
                                            <axis:ocultar f="axisusu004" c="USERNAME">
                                                <td class="campocaja" colspan="2">
                                                    <input type="text" class="campowidthinput campo campotexto" id="USERNAME" name="USERNAME" size="15"
                                                    style="width:80%" value="${__formdata.USERNAME}"/>
                                                </td>
                                            </axis:ocultar>
                                         
                                        </tr>              
                                    </table>
                                </td>
                            </tr>
                        </table>
                        </axis:visible>
                        <div class="separador">&nbsp;</div>
                        <div class="separador">&nbsp; </div>                         
                        <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axisusu004" c="RESULTADO" lit="1000345" /></div>
                        <table class="seccion">
                            <tr>
                                <td>
                                    <table class="area" align="center">
                                        <tr>
                                            <td>
                                                <div class="separador">&nbsp; </div>
                                                <%-- DisplayTag Usuarios --%>
                                                <c:set var="title0"><axis:alt f="axisusu004" c="CUSUARI" lit="1000109"/></c:set>  <%-- Código --%>
                                                <c:set var="title1"><axis:alt f="axisusu004" c="NOMBRE" lit="101995"/></c:set>   <%-- Nombre usuario --%>
                                                <c:set var="title3"><axis:alt f="axisusu004" c="CAGENTE" lit="1000561"/></c:set>  <%-- Delegación --%>
                                                <div class="displayspaceMaximo">
                                                    <display:table name="${__formdata.LSTUSUARIOS}" id="LSTUSUARIOS" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                                                         requestURI="axis_axisusu004.do?paginar=true">
                                                        <%@ include file="../include/displaytag.jsp"%>
                                                        <axis:visible f="axisusu004" c="RADIO_USU">
                                                         <display:column title="" sortable="false" headerClass="headwidth5 sortable"  media="html" autolink="false" >    
                                                            <div class="dspIcons"><input  type="radio" id="checked_usu" name="checked_usu" value="${LSTUSUARIOS.OB_IAX_USERS.CUSUARI}"/></div>                                        
                                                         </display:column>
                                                         </axis:visible>
                                                         <axis:visible f="axisusu004" c="CUSUARI">
                                                        <display:column title="${title0}" sortable="true" sortProperty="OB_IAX_USERS.CUSUARI" headerClass="sortable"  media="html" autolink="false" >
                                                            <div class="dspText">
                                                               <a href="javascript:f_but_aceptar('${LSTUSUARIOS.OB_IAX_USERS.CUSUARI}')"> ${LSTUSUARIOS.OB_IAX_USERS.CUSUARI}</a>
                                                            </div>
                                                        </display:column>
                                                        </axis:visible>
                                                         <axis:visible f="axisusu004" c="NOMBRE">
                                                        <display:column title="${title1}" sortable="true" sortProperty="OB_IAX_USERS.NOMBRE" headerClass="sortable"  media="html" autolink="false" >
                                                            <div class="dspText">
                                                             <a href="javascript:f_but_aceptar('${LSTUSUARIOS.OB_IAX_USERS.CUSUARI}')">   ${LSTUSUARIOS.OB_IAX_USERS.NOMBRE}</a>
                                                            </div>
                                                        </display:column>
                                                        </axis:visible>
                                                      <axis:visible f="axisusu004" c="CAGENTE">
                                                        <display:column title="${title3}" sortable="true" sortProperty="OB_IAX_USERS.CAGENTE" headerClass="sortable"  media="html" autolink="false" >
                                                            <div class="dspText">
                                                               <a href="javascript:f_but_aceptar('${LSTUSUARIOS.OB_IAX_USERS.CUSUARI}')"> ${LSTUSUARIOS.OB_IAX_USERS.CAGENTE}</a>
                                                            </div>
                                                        </display:column>
                                                        </axis:visible>
                                                   </display:table>                                                        
                                                </div>
                                                <div class="separador">&nbsp; </div>                                        
                                            </td>                                                
                                        </tr>
                                    </table>           
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
            
     </form>
    
    

<c:import url="../include/botonera_nt.jsp">
           <c:param name="f">axisusu004</c:param>
            <c:param name="__botones"><axis:ocultar f="axisusu004" c = "BT_CANCELAR" dejarHueco="false">cancelar</axis:ocultar><axis:ocultar f="axisusu004" c = "BT_BUSCAR" dejarHueco="false">,buscar</axis:ocultar><axis:ocultar f="axisusu004" c = "BT_ACEPTAR" dejarHueco="false">,aceptar</axis:ocultar> </c:param>

</c:import>
<c:import url="../include/mensajes.jsp" />
    
</body>
</html>


