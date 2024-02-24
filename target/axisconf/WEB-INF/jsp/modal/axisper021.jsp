<%/*
*  Fichero: axisper021.jsp
*  @author <a href = "mailto:xpastor@csi-ti.com">Xavi Pastor</a> 
*     
*     FUNCIONAMENT de AXISPER021 i AXISPER022
*     Per tal que funcionin les modals generiques de persones la pantalla PARENT
      que volgui cridar a les modals caldrà 
*     una funció JS que obrir la modal passant-li com a paràmetre el 
      MODO_SWPUBLI i el CAGENTE, tal que :
      function f_abrir_axisper021 () {
*           objUtiles.abrirModal("axisper021", "src", 
            "modal_axisper021.do?operation=form&MODO_SWPUBLI=PERSONAS_PUBLICAS&CAGENTE=CAGENTE");
      }
      El MODO_SWPUBLI el seu valor serà PERSONAS_PUBLICAS o PERSONAS_PRIVADAS, 
      depenent del que es volgui
      El CAGENTE el valor dependrà des de quina opció estem utilitzant les modals, per exemple :
      al modul de sinistres el CAGENTE serà el de la pòlissa.
      Necessitarem també una funció, nomenada : 
      function f_cerrar_modalespersona(modal){
      objUtiles.cerrarModal(modal);
      } 
      que ens tancarà qualsevol de les dos modals depenent d'on estiguem.
      també necessitem una funció que al prémer nova persona a la modal axisper021, buscador de persones
      ens obrir la modal d'alta ràpida, s'haurà de dir:
      function f_nova_persona(){
      f_cerrar_modalespersona("axisper021");
      objUtiles.abrirModal("axisper022","src","modal_axisper022.do?operation=form&MODO_SWPUBLI=PERSONAS_PRIVADAS&CAGENTE="+CAGENTE);  
      }

      Per acabar necessitarem un altre funció que acceptarà la persona tant donada d'alta per la axisper021
      com per la axisper022.
      S'haurà d'anomenar, com es veu tindrem el SPERSON, així fent una crida a bbdd podrem obtenir la persona
      buscada o creada. Haurà de ser algu semblant a: (En aquest cas amb ajax ens actualizarà els camps
      NNUMIDE, NOMBRE i CTIPIDE de la pantalla.
      function f_aceptar_persona(SPERSON,CAGENTE, modal){
        f_cerrar_modalespersona(modal);
         if (!objUtiles.estaVacio(SPERSON)){
        objAjax.invokeAsyncCGI("modal_axissin007.do?SPERSON="+SPERSON+"&CAGENTE="+CAGENTE, callbackAjaxActualitzaPersona, "operation=ajax_actualiza_persona", this, objJsMessages.jslit_cargando);
        }
      }
      function callbackAjaxActualitzaPersona (ajaxResponseText) {
        try{
            var doc = objAjax.domParse(ajaxResponseText);
            if (!objAppMensajes.existenErroresEnAplicacion(doc)) {   
               
                 objDom.setValorPorId("NNUMIDE", objDom.getValorNodoDelComponente(doc.getElementsByTagName("NNUMIDE"), 0, 0));
                 objDom.setValorPorId("NOMBRE", objDom.getValorNodoDelComponente(doc.getElementsByTagName("TNOMBRE"), 0, 0));
                 objDom.setValorPorId("CTIPIDE", objDom.getValorNodoDelComponente(doc.getElementsByTagName("CTIPIDE"), 0, 0));
            }          
         
        }catch(e){}
      }

*
*
*  Fecha: 24/03/2009
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
    <script language="Javascript" type="text/javascript">

        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/

        function f_onload() {
          
            try{
                document.miForm.NOMBRE.focus();
             } catch (e) {	try{
                                    document.miForm.NOMBRECOMP.focus();
                                    }catch(e){ }
            }
             	
            if (document.all) // ES Explorer
                document.getElementById("tabla1").style.marginLeft="1.3%";
            
            var CAGENTE_OUT = "${requestScope.CAGENTE_OUT}";
            var SPERSON_OUT = "${requestScope.SPERSON_OUT}";
            var CAGENTE = objDom.getValorPorId ("CAGENTE");
             var SNIP = objDom.getValorPorId ("SNIP");
             
            if (!objUtiles.estaVacio(SPERSON_OUT)) {
                // A continuación, código para ACEPTAR la persona, si se ha insertado correctamente a EST
                if (!objUtiles.estaVacio(CAGENTE_OUT)) {
                    parent.f_aceptar_persona (SPERSON_OUT,CAGENTE, SNIP, "axisper021");
                }
                else{
                    parent.f_aceptar_persona (SPERSON_OUT,CAGENTE_OUT, SNIP, "axisper021");
                }
            }
            
            
            var consult = "${__formdata.CONSULT_INI}"
             if (!objUtiles.estaVacio(consult)) {
                f_but_buscar();
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
                    seleccionarLista(objUtiles.utilSplit(hayChecked, "/")[0],objUtiles.utilSplit(hayChecked, "/")[1],objUtiles.utilSplit(hayChecked, "/")[2]);
                }
            }
        }
        
        function f_but_cancelar() {
            parent.f_cerrar_modalespersona("axisper021");
        }        
        
        function f_but_buscar() {
            //Si la validación es correcta (true), ejecutamos la acción
            if (objValidador.validaEntrada()) {
                objDom.setValorPorId ("MODO_BUSQUEDA","NORMAL");
                objUtiles.ejecutarFormulario("modal_axisper021.do","busqueda_persona",document.miForm, "_self", objJsMessages.jslit_buscando_personas);   
            }
        }
        
        function seleccionarLista (SPERSON,CAGENTE,SNIP) {
            if (objUtiles.estaVacio(SPERSON) && objUtiles.estaVacio(SNIP))
                alert (objJsMessages.jslit_error_de_seleccion);
            else{
                objDom.setValorPorId ("SPERSON", SPERSON);
                objDom.setValorPorId ("CAGENTE", CAGENTE);
                objDom.setValorPorId ("SNIP", SNIP);
                //parent.f_aceptar_persona (SPERSON,CAGENTE, "axisper021");
                if (objDom.getValorPorId("MODO_BUSQUEDA") == "HOST"){
                    objUtiles.ejecutarFormulario("modal_axisper021.do","traspaso_persona",document.miForm, "_self", objJsMessages.jslit_buscando_personas);   
                }
                else{
                    parent.f_aceptar_persona (SPERSON,CAGENTE,SNIP, "axisper021");
                }
            }
         }
         
         function f_but_9000509() {
         //Si la validación es correcta (true), ejecutamos la acción
            if (objValidador.validaEntrada()) {
                objDom.setValorPorId ("MODO_BUSQUEDA","HOST");
                objUtiles.ejecutarFormulario("modal_axisper021.do","busqueda_persona_host",document.miForm, "_self", objJsMessages.jslit_buscando_personas);   
            }
         }
         
        /****************************************************************************************/
        /************************************* MODAL ********************************************/
        /****************************************************************************************/
    
        function f_but_nueva_persona() {
           parent.f_nova_persona();
        }


        
    </script>
  </head>
    <body class=" " onload="f_onload()" onkeypress="if (event.keyCode==13)  { f_but_buscar() }">
         <div id="wrapper" class="wrapper">
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
        <form name="miForm" action="" method="POST">
            <input type="hidden" name="operation" value=""/>
            <input type="hidden" name="SPERSON" id="SPERSON" value="${__formdata.SPERSON}" />
            <input type="hidden" name="SNIP" id="SNIP" value="${__formdata.SNIP}" />
            <input type="hidden" name="CAGENTE" id="CAGENTE" value="${__formdata.CAGENTE}" />
            <input type="hidden" name="SSEGURO" id="SSEGURO" value="${__formdata.SSEGURO}" />
            <input type="hidden" name="MODO_SWPUBLI" id="MODO_SWPUBLI" value="${__formdata.MODO_SWPUBLI}" />
            <input type="hidden" name="MODO_BUSQUEDA" id="MODO_BUSQUEDA" value="${__formdata.MODO_BUSQUEDA}" />
            <input type="hidden" name="ORIGEN" id="ORIGEN" value="${__formdata.ORIGEN}" />
            <input type="hidden" name="CONDICION" id="CONDICION" value="${__formdata.CONDICION}" />
            
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt f="axisper021" c="FORM" lit="1000065" /></c:param>
                <c:param name="producto"><axis:alt f="axisper021" c="FORM" lit="1000065" /></c:param>
                <c:param name="form">axisper021</c:param>
            </c:import>
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt f="axisper021" c="TITULO" lit="1000214"/></c:param>
                <c:param name="nid" value="axisper022"/>
            </c:import> 
            <!-- Area de campos  -->
            <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <!--campos-->
                        <table class="seccion">
                            <tr>
                                <td>
                                    <!-- �?rea 1 -->
                                    <table class="area" align="center">
                                        <tr>
                                            <th style="width:15%;height:0px"></th>
                                            <th style="width:15%;height:0px"></th>
                                            <th style="width:15%;height:0px"></th>
                                            <th style="width:15%;height:0px"></th>
                                            <th style="width:15%;height:0px"></th>
                                            <th style="width:15%;height:0px"></th>
                                        </tr>
                                        <axis:ocultar c="SWPUBLI" f="axisper021" dejarHueco="false">
                                        <tr>
                                            <td class="titulocaja" colspan="3"> <b><axis:alt f="axisper021" c="PUBLI" lit="9000792"/></b>
                                                <input  disabled type="checkbox" id="MODO_SWPUBLI" name="MODO_SWPUBLI"
                                                <c:if test="${__formdata.MODO_SWPUBLI eq 'PERSONAS_PUBLICAS'}">checked="true"</c:if>  value="${__formdata.SWPUBLI}"/>
                                            </td>
                                        </tr>                                      
                                        </axis:ocultar>
                                         <tr>
                                       <axis:ocultar f="axisper021" c="CTIPIDE" dejarHueco="false"> 
                                              <td class="titulocaja" colspan = "2">
                                                  <b><axis:alt f="axisper021" c="CTIPIDE" lit="109774"/></b><%-- <axis:ayuda c="NNUMNIF" f="axisper021" /> --%>
                                              </td>
                                        </axis:ocultar>

                                        <axis:ocultar f="axisper021" c="NNUMNIF" dejarHueco="false"> 
                                              <td class="titulocaja">
                                                  <b><axis:alt f="axisper021" c="NNUMNIF" lit="9000760"></axis:alt></b><%-- <axis:ayuda c="NNUMNIF" f="axisper021" /> --%>
                                              </td>
                                        </axis:ocultar>
                                        <axis:visible f="axisper021" c="NOMBRECOMP">
                                        <td class="titulocaja" colspan="2">
                                                  <b><axis:alt f="axisper021" c="NOMBRECOMP" lit="105940"></axis:alt></b>
                                        </td>
                                        </axis:visible>                                        
                                     
                                        <axis:ocultar f="axisper021" c="SNIP" dejarHueco="false"> 
                                              <td class="titulocaja">
                                                  <b><axis:alt f="axisper021" c="SNIP" lit="1000088"/></b>
                                              </td>
                                        </axis:ocultar>
                                        </tr>
                                        <tr>
                                       <axis:visible f="axisper021" c="CTIPIDE" > 
                                              <td class="campocaja" colspan = "2" >
                                                <select name="CTIPIDE" id="CTIPIDE" size="1" class="campowidthselect campo campotexto">&nbsp;
                                                    <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisper021" c="SNV_COMBO" lit="1000348"/> - </option>
                                                    <c:forEach var="element" items="${__formdata.listValores.tipDocum}">
                                                        <option value = "${element.CATRIBU}" 
                                                            <c:if test="${element.CATRIBU == __formdata.CTIPIDE}"> selected </c:if> />
                                                            ${element.TATRIBU} 
                                                        </option>
                                                    </c:forEach>
                                                </select>
                                              </td>
                                        </axis:visible>
                                        
                                        <axis:visible f="axisper021" c="NNUMNIF" >
                                              <td class="campocaja">
                                                  <input type="text" class="campo campotexto" value="${__formdata['NNUMNIF']}" name="NNUMNIF" id="NNUMNIF" size="15"/>
                                              </td>
                                        </axis:visible>
                                        <axis:visible f="axisper021" c="NOMBRECOMP">
                                        <td class="campocaja" colspan="2">
                                                  <input type="text" class="campo campotexto" value="${__formdata['NOMBRECOMP']}" name="NOMBRECOMP" id="NOMBRECOMP" size="15"/>
                                         </td>
                                        </axis:visible>                                   

                                        
                                        <axis:visible f="axisper021" c="SNIP" >
                                               <td class="campocaja">
                                                  <input type="text" class="campo campotexto" value="${__formdata['NSIP']}" name="NSIP" id="NSIP" size="15"/> <!-- TODO Title -->
                                              </td>
                                        </axis:visible>
                                        </tr>
                                        <tr>
                                        <axis:visible f="axisper021" c="NOMBRE">
                                        <td class="titulocaja" colspan="2">
                                                  <b><axis:alt f="axisper021" c="NOMBRE" lit="105940" /></b>
                                        </td>
                                        </axis:visible>                                           	

                                        <axis:ocultar f="axisper021" c="TAPELLI1" dejarHueco="false">
                                        <td class="titulocaja" colspan="2">
                                                  <b><axis:alt f="axisper021" c="TAPELLI1" lit="108243" /></b>
                                              </td>
                                        </axis:ocultar>
                                        <axis:ocultar f="axisper021" c="TAPELLI2" dejarHueco="false">
                                        <td class="titulocaja" colspan="2">
                                                  <b><axis:alt f="axisper021" c="TAPELLI2" lit="108246" /></b>
                                        </td>
                                        </axis:ocultar>
                                        </tr>
                                        <tr>
                                     <axis:visible f="axisper021" c="NOMBRE">
                                        <td class="campocaja" colspan="2">
                                                  <input type="text" class="campo campotexto" value="${__formdata['NOMBRE']}" name="NOMBRE" id="NOMBRE" size="15"/>
                                              </td>
                                        </axis:visible>                                             	

                                        <axis:ocultar f="axisper021" c="TAPELLI1" dejarHueco="false">
                                        <td class="campocaja" colspan="2">
                                                  <input type="text" class="campo campotexto" value="${__formdata['TAPELLI1']}" name="TAPELLI1" id="TAPELLI1" size="15"/>
                                              </td>
                                        </axis:ocultar>
                                        <axis:ocultar f="axisper021" c="TAPELLI2" dejarHueco="false">
                                        <td class="campocaja" colspan="2">
                                                  <input type="text" class="campo campotexto" value="${__formdata['TAPELLI2']}" name="TAPELLI2" id="TAPELLI2" size="15"/>
                                              </td>   
                                        </axis:ocultar>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                       
                        <div class="separador">&nbsp;</div>
                            <!-- DisplayTag ListaPersonas -->
                            <c:set var="title1"><axis:alt f="axisper021" c="NNUMIDE" lit="105330"/></c:set>
                            <c:set var="title2"><axis:alt f="axisper021" c="NOMBRE" lit="105940"/></c:set>
                            <c:set var="title0"><axis:alt f="axisper021" c="CAGENTE" lit="100584"/></c:set>
                            
                            <div class="seccion displayspacePersonas">
                                <display:table name="${sessionScope.axisper021_listaPersonas}" id="miListaId" export="false" class="dsptgtable" pagesize="10" defaultsort="1" defaultorder="ascending" requestURI="modal_axisper021.do?paginar=true" sort="list" cellpadding="0" cellspacing="0">
                                    <%@ include file="../include/displaytag.jsp"%>
                                    <display:column title=" " sortable="false" headerClass="headwidth5 sortable" style="width:5%;"  media="html" autolink="false" >    
                                        <div class="dspIcons"><input <c:if test="${miListaId['seleccionaPersona']}">checked</c:if> type="radio" id="seleccionaPersona" name="seleccionaPersona" value="${miListaId['CODI']}/${miListaId['CAGENTE']}/${miListaId['SNIP']}"/></div>
                                    </display:column>
                                    <axis:visible f="axisper021" c="NNUMNIF_LIST">
                                    <display:column title="${title1}" sortable="true" style="width:10%;" sortProperty="NNUMNIF" headerClass="headwidth5 sortable"  media="html" autolink="false" >
                                        <div class="dspNumber">${miListaId['NNUMNIF']}</div>
                                    </display:column>
                                    </axis:visible>
                                    <axis:visible f="axisper021" c="NOMBRE_LIST">
                                    <display:column title="${title2}" sortable="true" style="width:50%;" sortProperty="NOMBRE" headerClass="sortable"  media="html" autolink="false" >
                                        <div class="dspText"><a href="javascript:seleccionarLista('${miListaId['CODI']}','${miListaId['CAGENTE']}','${miListaId['SNIP']}')">${miListaId['NOMBRE']}</a></div>
                                    </display:column>
                                    </axis:visible>
                                    <axis:visible f="axisper021" c="CAGENTE_LIST">
                                    <display:column title="${title0}" sortable="true" style="width:5%;" sortProperty="NNUMNIF" headerClass="headwidth5 sortable"  media="html" autolink="false" >
                                        <div class="dspNumber">${miListaId['CAGENTE']}</div>
                                    </display:column>
                                    </axis:visible>
                                    <axis:visible f="axisper021" c="TAGENTE_LIST">
                                    <display:column title="${title2}" sortable="true" style="width:30%;" sortProperty="NOMBRE" headerClass="sortable"  media="html" autolink="false" >
                                        <div class="dspText"><a href="javascript:seleccionarLista('${miListaId['CODI']}','${miListaId['CAGENTE']}','${miListaId['SNIP']}')">${miListaId['TAGENTE']}</a></div>
                                    </display:column>                                                  
                                    </axis:visible>
                               
                                    
                                </display:table>
                                <c:choose>
                                <c:when test="${!empty sessionScope.axisper021_listaPersonas}">
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
                            </div>	
                            
                    </td>
                </tr>
            </table>						
            
            <div class="separador">&nbsp;</div>
            <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisper021</c:param><c:param name="f">axisper021</c:param>
                <c:param name="f">axisper021</c:param>
                <c:param name="__botones">cancelar<axis:visible f="axisper021" c="BT_BUSCAR">,buscar</axis:visible><axis:visible f="axisper021" c="BT_BUSCARHOST">,9000509</axis:visible><axis:visible f="axisper021" c="BT_NUEVA_PERSONA">,nueva_persona</axis:visible>,aceptar</c:param>
            </c:import>
        </form>
    <c:import url="../include/mensajes.jsp" />
    </div>
    </body>
    <c:if test="${ (fn:containsIgnoreCase(header['User-Agent'],'ipad') )   }">
      <script language="Javascript" type="text/javascript">  
        retocarPAGE_CSS('axisper021');
      </script>                   
    </c:if>
</html>

