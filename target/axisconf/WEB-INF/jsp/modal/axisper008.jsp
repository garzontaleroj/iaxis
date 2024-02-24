<%/*
*  Fichero: axisper008.jsp
*  @author <a href = "mailto:xpastor@csi-ti.com">Xavi Pastor</a> 
*  
*
*
*	El botón cancelar cierra la ventana actual.
*
*
*  Fecha: 23/07/2008
*/
%>
<%@ page contentType="text/html;charset=windows-1252" errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page import="java.util.List" %>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<html>
  <head>
    <link rel="stylesheet" href="styles/genericosHtml.css" type="text/css">
    <link rel="stylesheet" href="styles/axisnt.css" type="text/css">
    <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>
     	 <%-- Especial per controlar els scroll amb iPad --%>
        <link type="text/css" href="styles/jquery.jscrollpane.css" rel="stylesheet" media="only screen and (min-device-width: 768px) and (max-device-width: 1024px)" />
        <style type="text/css" id="page-css"> </style>
    <%-- FI Especial per controlar els scroll amb iPad --%>
    <c:import url="../include/carga_framework_js.jsp" />
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
    <script language="Javascript" type="text/javascript">

        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/

        function f_onload() {            

            
            try{
            		 <axis:visible f="axisper008" c="NOMBRE">
                	document.miForm.NOMBRE.focus();
                </axis:visible>
             } catch (e) {
	             	 <axis:visible f="axisper008" c="NOMBRECOMP">
	             		document.miForm.NOMBRECOMP.focus();
	             	</axis:visible>
             	}
             	
            if (document.all) // ES Explorer
                document.getElementById("tabla1").style.marginLeft="1.3%";
            <% if (request.getParameter("faceptar") != null) 
                // Esto sólo se ejecuta la primera vez que abrimos la pantalla
                // Ponemos faceptar en session
                  session.setAttribute("faceptar", request.getParameter("faceptar"));
            %>
            
            var SPERSON_OUT = "${requestScope.SPERSON_OUT}";
            var CAGENTE_OUT = "${requestScope.CAGENTE}";
            if (!objUtiles.estaVacio(SPERSON_OUT)) {
                // A continuación, código para ACEPTAR la persona, si se ha insertado correctamente a EST
                <% if (session.getAttribute("faceptar") != null) { %>
                	
                    parent.<%=(String) session.getAttribute("faceptar")%>(SPERSON_OUT,CAGENTE_OUT);
                <%} else { %>
                    parent.f_aceptar_axisper001 (SPERSON_OUT,CAGENTE_OUT);
                <% } %>
            }
            f_cargar_propiedades_pantalla();
        }
                
        function f_but_aceptar() {
            if(objUtiles.estaVacio(document.miForm.seleccionaPersona))
                alert(objJsMessages.jslit_busca_primero);
            else{
                var hayChecked = objUtiles.f_GuardaCasillasChecked ("seleccionaPersona");

                if(typeof hayChecked == 'boolean')                    
                    alert(objJsMessages.jslit_selecciona_de_lista);
                else {
                   seleccionarLista(objUtiles.utilSplit(hayChecked, "/")[0],objUtiles.utilSplit(hayChecked, "/")[1]);
                }
            }
        }
        
        function f_but_cancelar() {
            parent.f_cerrar_axisper008();
        }
        /* Cambio para IAXIS-15339 : Start */
        function f_but_host() {                       
        	objUtiles.abrirModal("axisper054","src","modal_axisper054.do?operation=form");
        }
        
        function f_cerrar_modalCIFIN(modal) {
    		objUtiles.cerrarModal(modal);
    	}
        /* Cambio para IAXIS-15339 : End */
        
        function f_but_buscar() {
            //Si la validación es correcta (true), ejecutamos la acción
            if (objValidador.validaEntrada()) {
                objUtiles.ejecutarFormulario("modal_axisper008.do","busqueda_persona",document.miForm, "_self", objJsMessages.jslit_buscando_personas);   
            }
        }
        
        
        function seleccionarLista (SPERSON,CAGENTE) {
            if (objUtiles.estaVacio(SPERSON))
                alert (objJsMessages.jslit_error_de_seleccion);
            else{
                objDom.setValorPorId ("SPERSON", SPERSON);
                objDom.setValorPorId ("CAGENTE", CAGENTE);
                objDom.setValorPorId ("CMODO", 'CONSULTA');
                objUtiles.ejecutarFormulario("modal_axisper008.do","traspaso_persona",document.miForm, "_self", objJsMessages.jslit_buscando_personas);   
            }
         }
         
        /****************************************************************************************/
        /************************************* MODAL ********************************************/
        /****************************************************************************************/
    
        function f_but_nueva_persona() {
            parent.f_abrir_axisper010NOU(true);
        }

	</script>
  </head>
    <body onload="f_onload()" onkeypress="if (event.keyCode==13)  { f_but_buscar() }">
        <div id="wrapper" class="wrapper">
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
        
    <!--  Cambio para IAXIS-15339 : Start  -->
	 <c:import url="../include/modal_estandar.jsp">
		<c:param name="nid_y_titulo">axisper054|<axis:alt
				c="axisper054" f="axisper054" lit="89908118" />
			</c:param>
	</c:import>
	<!-- Cambio para IAXIS-15339 : End -->
	
	
        <form name="miForm" action="" method="POST">
            <input type="hidden" name="operation" value=""/>
            <input type="hidden" name="SPERSON" id="SPERSON" value="" />
            <input type="hidden" name="SNIP" id="SNIP" value="" />
            <input type="hidden" name="CAGENTE" id="CAGENTE" value="" />
            <input type="hidden" name="CMODO" value="${__formdata.CMODO}"/>
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt f="axisper008" c="FORM" lit="1000065" /></c:param>
                <c:param name="producto"><axis:alt f="axisper008" c="FORM" lit="1000065" /></c:param>
                <c:param name="form">axisper008</c:param>
            </c:import>
            <!-- Area de campos  -->
            <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <!--campos-->
                        <table class="seccion">
                            <tr>
                                <td>
                                    <!-- Área 1 -->
                                    <table class="area" align="center">
                                        <tr>
                                            <th style="width:15%;height:0px"></th>
                                            <th style="width:15%;height:0px"></th>
                                            <th style="width:15%;height:0px"></th>
                                            <th style="width:15%;height:0px"></th>
                                            <th style="width:15%;height:0px"></th>
                                            <th style="width:15%;height:0px"></th>
                                        </tr>
                                        <tr>
                                            <axis:ocultar f="axisper008" c="CTIPIDE" dejarHueco="false"> 
                                                  <td class="titulocaja" colspan = "2">
                                                      <b><axis:alt f="axisper008" c="CTIPIDE" lit="109774"/></b><%-- <axis:ayuda c="NNUMNIF" f="axisper008" /> --%>
                                                  </td>
                                            </axis:ocultar>
                                            <axis:ocultar f="axisper008" c="NNUMNIF" dejarHueco="false"> 
                                                  <td class="titulocaja">
                                                      <b><axis:alt f="axisper008" c="NNUMNIF" lit="9000760"></axis:alt></b><%-- <axis:ayuda c="NNUMNIF" f="axisper008" /> --%>
                                                  </td>
                                            </axis:ocultar>
                                            <axis:visible f="axisper008" c="NOMBRECOMP">
                                                <td class="titulocaja" colspan="2">
                                                      <b><axis:alt f="axisper008" c="NOMBRECOMP" lit="105940"></axis:alt></b>
                                                </td>
                                            </axis:visible>                                        
                                         
                                            <axis:ocultar f="axisper008" c="SNIP" dejarHueco="false"> 
                                                  <td class="titulocaja">
                                                      <b><axis:alt f="axisper008" c="SNIP" lit="1000088"></axis:alt></b>
                                                  </td>
                                            </axis:ocultar>
                                        </tr>
                                        <tr>
                                       <axis:visible f="axisper008" c="CTIPIDE" > 
                                              <td class="campocaja" colspan = "2" >
                                                <select name="CTIPIDE" id="CTIPIDE" size="1" class="campowidthselect campo campotexto">&nbsp;
                                                    <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisper008" c="SNV_COMBO" lit="1000348"/> - </option>
                                                    <c:forEach var="element" items="${__formdata.listValores.tipDocum}">
                                                        <option value = "${element.CATRIBU}" 
                                                            <c:if test="${element.CATRIBU == __formdata.CTIPIDE}"> selected </c:if> />
                                                            ${element.TATRIBU} 
                                                        </option>
                                                    </c:forEach>
                                                </select>
                                              </td>
                                        </axis:visible>
										<!-- CP0013M_SYS_PERS_Val - ACL - 30/10/2018 -- Se adiciona maxlength para el campo NNUMNIF -->
										<!-- CP0036M_SYS_PERS - ACL - 30/11/2018 -- Se modifica maxlength para máximo 15-->
                                        <axis:visible f="axisper008" c="NNUMNIF" >
                                              <td class="campocaja">
                                                  <input type="text" maxlength="15" class="campo campotexto" value="${__formdata['NNUMNIF']}" name="NNUMNIF" id="NNUMNIF" size="15"/>
                                              </td>
                                        </axis:visible>
                                        <axis:visible f="axisper008" c="NOMBRECOMP">
                                        <td class="campocaja" colspan="2">
                                                  <input type="text" class="campo campotexto campowidthextrabig" value="${__formdata['NOMBRECOMP']}" name="NOMBRECOMP" id="NOMBRECOMP" size="15"/>
                                         </td>
                                        </axis:visible>                                   
                                        <axis:visible f="axisper008" c="SNIP" >
                                               <td class="campocaja">
                                                  <input type="text" class="campo campotexto" value="${__formdata['NSIP']}" name="NSIP" id="NSIP" size="15"/> <!-- TODO Title -->
                                              </td>
                                        </axis:visible>
                                        </tr>
                                        <tr>
                                        <axis:visible f="axisper008" c="NOMBRE">
                                        <td class="titulocaja" colspan="2">
                                                  <b><axis:alt f="axisper008" c="NOMBRE" lit="105940" /></b>
                                        </td>
                                        </axis:visible>                                           	

                                        <axis:ocultar f="axisper008" c="TAPELLI1" dejarHueco="false">
                                        <td class="titulocaja" colspan="2">
                                                  <b><axis:alt f="axisper008" c="TAPELLI1" lit="108243" /></b>
                                              </td>
                                        </axis:ocultar>
                                        <axis:ocultar f="axisper008" c="TAPELLI2" dejarHueco="false">
                                        <td class="titulocaja" colspan="2">
                                                  <b><axis:alt f="axisper008" c="TAPELLI2" lit="108246" /></b>
                                        </td>
                                        </axis:ocultar>
                                        </tr>
                                        <tr>
                                     <axis:visible f="axisper008" c="NOMBRE">
                                        <td class="campocaja" colspan="2">
                                                  <input type="text" class="campo campotexto" value="${__formdata['NOMBRE']}" name="NOMBRE" id="NOMBRE" size="15"/>
                                              </td>
                                        </axis:visible>                                             	

                                        <axis:ocultar f="axisper008" c="TAPELLI1" dejarHueco="false">
                                        <td class="campocaja" colspan="2">
                                                  <input type="text" class="campo campotexto" value="${__formdata['TAPELLI1']}" name="TAPELLI1" id="TAPELLI1" size="15"/>
                                              </td>
                                        </axis:ocultar>
                                        <axis:ocultar f="axisper008" c="TAPELLI2" dejarHueco="false">
                                        <td class="campocaja" colspan="2">
                                                  <input type="text" class="campo campotexto" value="${__formdata['TAPELLI2']}" name="TAPELLI2" id="TAPELLI2" size="15"/>
                                              </td>   
                                        </axis:ocultar>
                                        </tr>
                                        
                                        <tr>
                                        <axis:visible f="axisper008" c="FNACIMI">
                                            <td class="titulocaja">
                                                  <b><axis:alt c="FNACIMI" f="axisper008" lit="1000064"/></b>
                                            </td>
                                        </axis:visible>      
                                        <axis:ocultar f="axisper008" c="CPOSTAL" dejarHueco="false">
                                            <td class="titulocaja">
                                                <b><axis:alt c="CPOSTAL" f="axisper008" lit="100823"/></b>
                                            </td>
                                        </axis:ocultar>
                                        <axis:ocultar f="axisper008" c="TDOMICI" dejarHueco="false">
                                            <td class="titulocaja" colspan="2">
                                                  <b><axis:alt c="TDOMICI" f="axisper008" lit="110029"/></b>
                                            </td>
                                        </axis:ocultar>
                                        </tr>
                                        <tr>
                                        <axis:visible f="axisper008" c="FNACIMI">
                                            <td class="campocaja">
                                              <input type="text" class="campowidthinput campo campotexto" size="10" value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FNACIMI}"/>" name="FNACIMI" id="FNACIMI"  style="width:85%;"
                                              <axis:atr f="axisper008" c="FNACIMI" a="modificable=true&formato=fecha&obligatorio=false"/> title="<axis:alt f="axisper008" c="FNACIMI" lit="1000064"/>"/> 
                                              <a id="icon_FNACIMI" style="vertical-align:middle;" href="#"><img id="popup_calendario_FNACIMI" border="0" alt="<axis:alt f="axisper008" c="FNACIMI_CAL" lit="108341"/>" title="<axis:alt f="axisper008" c="TIT_FNACIMI" lit="100959" />" src="images/calendar.gif"/></a>
                                            </td>
                                        </axis:visible>                                        	
                                        <axis:ocultar f="axisper008" c="CPOSTAL" dejarHueco="false">
                                            <td class="campocaja">
                                                  <input type="text" class="campo campotexto" value="${__formdata['CPOSTAL']}" name="CPOSTAL" id="CPOSTAL" size="15"
                                                  style="text-transform:uppercase;" />
                                            </td>   
                                        </axis:ocultar>
                                        <axis:ocultar f="axisper008" c="TDOMICI" dejarHueco="false">
                                            <td class="campocaja" colspan="2">
                                                  <input type="text" class="campo campotexto" value="${__formdata['TDOMICI']}" name="TDOMICI" id="TDOMICI" size="15"/>
                                            </td>
                                        </axis:ocultar>
                                        </tr>                                        

                                    </table>
                                </td>
                            </tr>
                        </table>
                    
                        <div class="separador">&nbsp;</div>
                            <!-- DisplayTag ListaPersonas -->
                            <c:set var="title1"><axis:alt f="axisper008" c="NNUMIDE" lit="105330"/></c:set>
                            <c:set var="title2"><axis:alt f="axisper008" c="NOMBRE" lit="105940"/></c:set>
                            <c:set var="title3"><axis:alt c="FNACIMI" f="axisper008" lit="1000064"/></c:set>
                            <c:set var="title4"><axis:alt c="TDOMICI" f="axisper008" lit="110029"/></c:set>
                            <c:set var="title5"><axis:alt c="CPOSTAL" f="axisper008" lit="100823"/></c:set>
                            <c:set var="title0"><axis:alt f="axisper008" c="CAGENTE" lit="100584"/></c:set>
                            
                            <div class="seccion displayspacePersonas">
                                <display:table name="${sessionScope.axisper008_listaPersonas}" id="miListaId" export="false" class="dsptgtable" pagesize="15" defaultsort="1" defaultorder="ascending" requestURI="modal_axisper008.do?paginar=true" sort="list" cellpadding="0" cellspacing="0">
                                    <%@ include file="../include/displaytag.jsp"%>
                                    <display:column title=" " sortable="false" headerClass="headwidth5 sortable" style="width:5%;"  media="html" autolink="false" >    
                                        <div class="dspIcons"><input <c:if test="${miListaId['seleccionaPersona']}">checked</c:if> type="radio" id="seleccionaPersona" name="seleccionaPersona" value="${miListaId['CODI']}/${miListaId['CAGENTE']}"/></div>
                                    </display:column>
                                    <display:column title="${title1}" sortable="true" style="width:15%;" sortProperty="NNUMIDE" headerClass="headwidth5 sortable"  media="html" autolink="false" >
                                        <div class="dspNumber">${miListaId['NNUMIDE']}</div>
                                    </display:column>
                                    <display:column title="${title2}" sortable="true" style="width:25%;" sortProperty="NOMBRE" headerClass="sortable"  media="html" autolink="false" >
                                        <div class="dspText"><a href="javascript:seleccionarLista('${miListaId['CODI']}','${miListaId['CAGENTE']}')">${miListaId['NOMBRE']}</a></div>
                                    </display:column>
                                    <axis:visible f="axisper008" c="FNACIMI">
                                    <display:column title="${title3}" sortable="true" style="width:8%;" sortProperty="FNACIMI" headerClass="sortable"  media="html" autolink="false" >
                                        <div class="dspText"><a href="javascript:seleccionarLista('${miListaId['CODI']}','${miListaId['CAGENTE']}')">${miListaId['FNACIMI']}</a></div>
                                    </display:column>
                                    </axis:visible>
                                     <axis:visible f="axisper008" c="CPOSTAL">
                                    <display:column title="${title5}" sortable="true" style="width:7%;" sortProperty="CPOSTAL" headerClass="sortable"  media="html" autolink="false" >
                                        <div class="dspText"><a href="javascript:seleccionarLista('${miListaId['CODI']}','${miListaId['CAGENTE']}')">${miListaId['CPOSTAL']}</a></div>
                                    </display:column>    
                                    </axis:visible>
                                    <axis:visible f="axisper008" c="TDOMICI">
                                    <display:column title="${title4}" sortable="true" style="width:20%;" sortProperty="TDOMICI" headerClass="sortable"  media="html" autolink="false" >
                                        <div class="dspText"><a href="javascript:seleccionarLista('${miListaId['CODI']}','${miListaId['CAGENTE']}')">${miListaId['TDOMICI']}</a></div>
                                    </display:column>
                                    </axis:visible>                                    
                                    <axis:visible f="axisper008" c="CAGENTE">
                                        <display:column title="${title0}" sortable="true" style="width:5%;" sortProperty="NNUMNIF" headerClass="headwidth5 sortable"  media="html" autolink="false" >
                                            <div class="dspNumber">${miListaId['CAGENTE']}</div>
                                        </display:column>
                                        <display:column title="${title2}" sortable="true" style="width:20%;" sortProperty="TAGENTE" headerClass="sortable"  media="html" autolink="false" >
                                            <div class="dspText"><a href="javascript:seleccionarLista('${miListaId['CODI']}','${miListaId['CAGENTE']}')">${miListaId['TAGENTE']}</a></div>
                                        </display:column>                                                  
                                    </axis:visible>
                                    
                                </display:table>
                                <c:if test="${!(fn:containsIgnoreCase(header['User-Agent'],'ipad'))}">
                                <c:choose>
                                <c:when test="${!empty sessionScope.axisper008_listaPersonas}">
                                    <c:if test="${ !(fn:containsIgnoreCase(header['User-Agent'],'ipad') ) }">
                                        <script language="javascript">objUtiles.retocarDsptagtable("miListaId");</script>
                                    </c:if>
                                </c:when>
                                <c:otherwise>
                                    <script language="javascript">
                                       objLista.esconderListaSpans();
                                       objLista.esconderListaLinks();     
                                    </script>
                                </c:otherwise>
                                </c:choose>
                              </c:if>
                            </div>	
                            
                    </td>
                </tr>
            </table>						
            
            <div class="separador">&nbsp;</div>
            <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisper008</c:param>
                <c:param name="__botones"><axis:visible f="axisper008" c="BT_CANCELAR">,cancelar</axis:visible><axis:visible f="axisper008" c="BT_BUSCAR">,buscar</axis:visible><axis:visible f="axisper008" c="BT_HOST" >,host:150</axis:visible><axis:visible f="axisper008" c="BT_NUEVA_PERSONA">,nueva_persona</axis:visible><axis:visible f="axisper008" c="BT_ACEPTAR">,aceptar</axis:visible></c:param> </c:import>
           
        </form>

        <script type="text/javascript">
            Calendar.setup({
                inputField     :    "FNACIMI",     
                ifFormat       :    "%d/%m/%Y",      
                button         :    "popup_calendario_FNACIMI", 
                singleClick    :    true,
                firstDay       :    1
            });
        </script>

    <c:import url="../include/mensajes.jsp" />
    </div>
    </body>
    <c:if test="${ (fn:containsIgnoreCase(header['User-Agent'],'ipad') )   }">
      <script language="Javascript" type="text/javascript">  
        retocarPAGE_CSS('axisper008');
      </script >                   
    </c:if>
</html>

