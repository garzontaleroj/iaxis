<%/*
*  Fichero: axisper021.jsp
*  @author <a href = "mailto:xpastor@csi-ti.com">Xavi Pastor</a> 
*     
Pantalla axissin063 Validacion Innominados

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
            
            
            var consult = "${__formdata.CONSULT_INI}";
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

                if(typeof hayChecked == 'boolean'){
                    alert(objJsMessages.jslit_selecciona_de_lista);
                }else{
                    seleccionarLista(objUtiles.utilSplit(hayChecked, ",")[0],objUtiles.utilSplit(hayChecked, ",")[1],objUtiles.utilSplit(hayChecked, ",")[2],objUtiles.utilSplit(hayChecked, ",")[3],objUtiles.utilSplit(hayChecked, ",")[4]);
                }
            }
        }
        
        function f_but_cancelar() {
            parent.f_cerrar_modalespersona("axissin063");
        }        
        
        function f_but_buscar() {
            //Si la validación es correcta (true), ejecutamos la acción
            if (objValidador.validaEntrada()) {
                objDom.setValorPorId ("MODO_BUSQUEDA","NORMAL");
                objUtiles.ejecutarFormulario("modal_axissin063.do","busqueda_persona",document.miForm, "_self", objJsMessages.jslit_buscando_personas);   
            }
        }
        
        function seleccionarLista (NUM,NIF,NOMBRES,FASENAC,CASESEX) {
        	
	        if(objUtiles.estaVacio(NIF) && objUtiles.estaVacio(NOMBRES)){
	            alert(objJsMessages.jslit_error_de_seleccion);            
	        }else{
	        /* Transformacion Fecha*/
	        FASENAC=FASENAC.substring(0,10);    
	        
	        var param='1;1;'+NIF+';'+NOMBRES+';'+FASENAC+";"+CASESEX;
	        //var param="1","1",NUM,NOMBRES,FASENAC,CASESEX];
			
	        objUtiles.abrirModal("axisper022","src","modal_axisper022.do?operation=form&MODO_SWPUBLI=PERSONAS_PRIVADAS&faceptar=axisper022&origen=axissin063&PARAM="+param);
	        //parent.f_cerrar_modalespersona("axissin063");
	        }

         }
        
        function aceptar_axisper022(SPERSON,CAGENTE, SNIP, modal){

            f_cerrar_modalespersona(modal);           
    		parent.f_aceptar_persona(SPERSON,CAGENTE,SNIP, "axissin063");

    	}  
        
        function f_cerrar_axisper022(modal){
        	f_cerrar_modalespersona(modal);          
        }
         
        function f_cerrar_modalespersona(pantalla){
   		 	objUtiles.cerrarModal(pantalla);
   		}

        
    </script>
  </head>
    <body onload="f_onload()" onkeypress="if (event.keyCode==13)  { f_but_buscar() }">
         <div id="wrapper" class="wrapper">
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
        <form name="miForm" action="" method="POST">
            <input type="hidden" name="operation" value=""/>   
            <input type="hidden" name="SSEGURO" id="SSEGURO" value="${sessionScope.SSEGURO}" />
           
            <input type="hidden" name="PARAM" id="PARAM" value="${__formdata.PARAM}" />
  
            
            
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt f="axissin063" c="FORM" lit="9906698" /></c:param>
                <c:param name="producto"><axis:alt f="axissin063" c="FORM" lit="9906698" /></c:param>
                <c:param name="form">axissin063</c:param>
            </c:import>
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt f="axisper022" c="TITULO" lit="1000214"/></c:param>
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
                                    <!-- ??rea 1 -->
                                    <table class="area" align="center">
                                        <tr>
                                            <th style="width:25%;height:0px" ></th>
                                            <th style="width:25%;height:0px"></th>
                                            <th style="width:15%;height:0px"></th>
                                            <th style="width:15%;height:0px"></th>
                                            <th style="width:15%;height:0px"></th>
                                            <th style="width:15%;height:0px"></th>
                                        </tr>
                                        <tr>
	                                        <axis:visible f="axissin063" c="NRIESGO"> 
	                                              <td class="titulocaja">
	                                                  <b><axis:alt f="axissin063" c="NRIESGO" lit="100649"></axis:alt></b><%-- <axis:ayuda c="NNUMNIF" f="axisper021" /> --%>
	                                              </td>
	                                        </axis:visible>
                                        </tr>
                                        <tr>
	                                        <axis:visible f="axissin063" c="NRIESGO" >
	                                              <td class="campocaja">
	                                                  <input type="text" class="campo campotexto" value="${__formdata.NRIESGO}" name="NRIESGO" id="NRIESGO" size="15" readonly="TRUE"/>
	                                              </td>
	                                        </axis:visible>
	                                        <axis:visible f="axissin063" c="TRIESGO">
		                                        <td class="campocaja" >
		                                                  <input type="text" class="campo campotexto" value="${__formdata.TRIESGO}" name="TRIESGO" id="TRIESGO" size="15" readonly="TRUE"/>
		                                         </td>
	                                        </axis:visible>                                   
	                                    </tr>
	                                    <tr>
	                                         <axis:visible f="axissin063" c="NOMASEG" > 
	                                              <td class="titulocaja">
	                                                  <b><axis:alt f="NOMASEG" c="NOMASEG" lit="9905653"/></b>
	                                              </td>
	                                        </axis:visible>
                                        </tr>
                                        <tr>
	                                         <axis:visible f="axissin063" c="NOMASEG" >
	                                               <td class="campocaja">
	                                                  <input type="text" class="campo campotexto" value="${__formdata['NOMASEG']}" name="NOMASEG" id="NOMASEG" size="35"/> <!-- TODO Title -->
	                                                  <!--<img tabindex="28"  id="BUSCAR_PER" border="0" title="<axis:alt f="axissin063" c="BUSCAR_PER" lit="9904600"/>" src="images/find.gif" onclick="f_but_buscar()" style="cursor:pointer"/> -->
	                                              </td>
	                                        </axis:visible>
                                        </tr>
                                       
                                    </table>
                                </td>
                            </tr>
                        </table>
                       
                        <div class="separador">&nbsp;</div>
                            <!-- DisplayTag ListaPersonas -->
                        <axis:visible f="axissin063" c="DSP_ASEGURADOS_INN">

							<table class="area" align="center">
				                 
                			<tr>   
	                			<td class="titulocaja" colspan="3">
					                      <b><axis:alt f="axissin063" c="CAGENTE" lit="108228"></axis:alt></b>
					            </td>
                			</tr>
                			<tr>
                    			<td align="center" >

			                         <c:set var="title0"><axis:alt f="axissin063" c="NASE" lit="9907628" /></c:set>
			                         <c:set var="title1"><axis:alt f="axissin063" c="NOMASE" lit="9907629" /></c:set>
			                         <c:set var="title2"><axis:alt f="axissin063" c="FECASE" lit="9907630" /></c:set>
			                         <c:set var="title3"><axis:alt f="axissin063" c="SEXASE" lit="9907631" /></c:set>
			                         <c:set var="title4"><axis:alt f="axissin063" c="NIFASE" lit="9907632" /></c:set>
			                         <div class="seccion displayspaceGrande" style="width:98%">
	                          			<display:table name="${ASEGURADOS_INNOM}" 
	                                         id="ASEGURADOS" 
	                                         export="false" 
	                                         class="dsptgtable" 
	                                         defaultsort="2"
	                                         defaultorder="ascending"
	                                         pagesize="-1"  
	                                         sort="list" 
	                                         cellpadding="0" 
	                                         cellspacing="0" 
	                                         requestURI="modal_axissin063.do?paginar=true">
	                                       
		                               	   <%@ include file="../include/displaytag.jsp"%>
		                               	   
			                               <display:column title=" " sortable="false"
			                                                    headerClass="headwidth5 sortable" 
			                                                    style="width:5%;"  
			                                                    media="html" 
			                                                    autolink="false" >    
			                                        <div class="dspIcons"><input <c:if test="${ASEGURADOS['seleccionaPersona']}">checked</c:if>
			                                        type="radio" id="seleccionaPersona" 
			                                        name="seleccionaPersona" 
			                                        value="${ASEGURADOS['NUM']},${ASEGURADOS['NIF']},${ASEGURADOS['NOMBRES']},${ASEGURADOS['FNACIM']},${ASEGURADOS['SEXO']}"/></div>
			                               </display:column>
			                               <display:column title="${title0}" 
			                                               sortable="false" 
			                                               sortProperty="ASEGURADOS.NUM" 
			                                               headerClass="headwidth5 sortable"  
			                                               media="html" 
			                                               autolink="false" >
			                                          <div class="dspNumber"><a href="javascript:seleccionarLista('${ASEGURADOS.NUM}','${ASEGURADOS.NIF}','${ASEGURADOS.NOMBRES}','${ASEGURADOS.FNACIM}','${ASEGURADOS.SEXO}')">${ASEGURADOS.NUM}</div>
			                               </display:column>   
			                               <display:column title="${title1}" 
			                                               sortable="false" 
			                                               sortProperty="ASEGURADOS.NOMBRES" 
			                                               headerClass="sortable"  
			                                               media="html" 
			                                               autolink="false" >
			                                         <div class="dspText"><a href="javascript:seleccionarLista('${ASEGURADOS.NUM}','${ASEGURADOS.NIF}','${ASEGURADOS.NOMBRES}','${ASEGURADOS.FNACIM}','${ASEGURADOS.SEXO}')">${ASEGURADOS.NOMBRES}</a></div>
			                               </display:column>
			                               <display:column title="${title2}" 
			                                               sortable="false" 
			                                               headerClass="sortable"  
			                                               media="html" 
			                                               autolink="false" >
			                                		<div class="dspText"><a href="javascript:seleccionarLista('${ASEGURADOS.NUM}','${ASEGURADOS.NIF}','${ASEGURADOS.NOMBRES}','${ASEGURADOS.FNACIM}','${ASEGURADOS.SEXO}')"><fmt:formatDate pattern="dd/MM/yyyy" value="${ASEGURADOS.FNACIM}"/>
			                                </div>
			                               </display:column>    
			                               <display:column title="${title3}" 
			                                               sortable="false" 
			                                               headerClass="sortable"  
			                                               media="html" 
			                                               autolink="false" >
			                                          <div class="dspText"><a href="javascript:seleccionarLista('${ASEGURADOS.NUM}','${ASEGURADOS.NIF}','${ASEGURADOS.NOMBRES}','${ASEGURADOS.FNACIM}','${ASEGURADOS.SEXO}')">${ASEGURADOS.SEXO}</div>
			                               </display:column>
			                               <display:column title="${title4}" 
			                               				   sortable="false" 
			                               				   headerClass="sortable"  
			                               				   media="html" 
			                               				   autolink="false" >
			                                   		  <div class="dspText"><a href="javascript:seleccionarLista('${ASEGURADOS.NUM}','${ASEGURADOS.NIF}','${ASEGURADOS.NOMBRES}','${ASEGURADOS.FNACIM}','${ASEGURADOS.SEXO}')">${ASEGURADOS.NIF}</div>
			                               </display:column>
	                          		</display:table>
                          			<c:choose>
		                            <c:when test="${!empty lista_liquida_documentos &&  !(fn:containsIgnoreCase(header['User-Agent'],'ipad') )}">
		                                <script language="javascript">objUtiles.retocarDsptagtable("miListaId_recibos");</script>
		                            </c:when>
		                            </c:choose>
		                        </div>
                       		</td>
                   		</tr>
					</table>
			 	</axis:visible>				
            
            <div class="separador">&nbsp;</div>
            <c:import url="../include/botonera_nt.jsp"><c:param name="f">axissin063</c:param><c:param name="f">axissin063</c:param>
                <c:param name="f">axissin063</c:param>
                <c:param name="__botones">cancelar<axis:visible f="axissin063" c="BT_BUSCAR">,buscar</axis:visible>,aceptar</c:param>
            </c:import>
        </form>
    <c:import url="../include/mensajes.jsp" />
    </div>
    </body>
    <c:if test="${ (fn:containsIgnoreCase(header['User-Agent'],'ipad') )   }">
      <script language="Javascript" type="text/javascript">  
        retocarPAGE_CSS('axissin063');
      </script>                   
    </c:if>
</html>

