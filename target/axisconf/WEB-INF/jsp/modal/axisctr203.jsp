<%/* Revision:# +KDofHtLlKwoX7wrLNQBuA== # */%>
<%/*
*  Fichero: Axisctr203.jsp
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
            parent.f_cerrar_axisctr203();
       }
       
       function f_but_aceptar(){
            var FINCLU = document.axisctr203Form.FINCLU.value;
            var FEXCLU = document.axisctr203Form.FEXCLU.value;
            
            var xMonth=FINCLU.substring(3, 5);   
            var xDay=FINCLU.substring(0, 2);   
            var xYear=FINCLU.substring(6,10);   
            var yMonth=FEXCLU.substring(3, 5);   
            var yDay=FEXCLU.substring(0, 2);   
            var yYear=FEXCLU.substring(6,10);   
    
            var fechainclu = xYear+xMonth+xDay;
            var fechaexclu = yYear+yMonth+yDay;
            
            if (objValidador.validaEntrada()){
                if(!objUtiles.estaVacio(fechainclu) && !objUtiles.estaVacio(fechaexclu) ){
                    if(fechaexclu<=fechainclu){
                        alert('<axis:alt f="axisctr203" c="VALFECHAS" lit="9904460" />');
                    }
                    else{
                        f_habilitar_campos();
                        objUtiles.ejecutarFormulario("modal_axisctr203.do", "guardar", document.axisctr203Form, "_self", objJsMessages.jslit_cargando); 
                    }
                }
                else{
                    f_habilitar_campos();
                    objUtiles.ejecutarFormulario("modal_axisctr203.do", "guardar", document.axisctr203Form, "_self", objJsMessages.jslit_cargando);
                }
            }
       }
       
       function f_onload(){
        	f_cargar_propiedades_pantalla();
            var ok = '${__formdata.OK}';
            var PSPERLRE_OUT = '${__formdata.PSPERLRE_OUT}';
            if(ok == '0'){
                parent.f_aceptar_axisctr203();
            }
       }
       
       
       function f_onchange_CTIPPERcerca(TIDENTI) {
            formdataTIDENTI = '${__formdata.TPERSONA}';
            if ( TIDENTI != formdataTIDENTI ) {
                // Recargar formulario para esconder/mostrar campos en función de TIDENTI
                objUtiles.ejecutarFormulario("modal_axisctr203.do", "form", document.axisctr203Form, "_self", objJsMessages.jslit_cargando);   
            }
        }
        
       function f_abrir_axisper021 () {
            var SSEGURO = "${__formdata.SSEGURO}";
            var CAGENTE = "${__formdata.CAGENTE}";
            objUtiles.abrirModal("axisper021", "src", "modal_axisper021.do?operation=form&MODO_SWPUBLI=PERSONAS_PRIVADAS&CAGENTE="+CAGENTE+"&SSEGURO="+SSEGURO);
      }
      
      function f_cerrar_axisper022(){
        f_cerrar_modalespersona("axisper022");
      }   
      
      function f_cerrar_axisper021(){
         f_cerrar_modalespersona("axisper021");
      }   
      
      function f_nova_persona(){
            //alert("al entrar en el parent***");
            f_cerrar_modalespersona("axisper021");
            var CAGENTE = "${__formdata.CAGENTE_PERSN}";
            //alert(CAGENTE);
            objUtiles.abrirModal("axisper022","src","modal_axisper022.do?operation=form&MODO_SWPUBLI=PERSONAS_PRIVADAS&CAGENTE="+CAGENTE);  
      }
      
      function f_cerrar_modalespersona(modal){
        objUtiles.cerrarModal(modal);
      } 
      
      function f_aceptar_persona(SPERSON,CAGENTE, SNIP, modal){
        //alert("Em cerrar persona "+SPERSON+" CAGENTE : "+CAGENTE+" SNIP :"+SNIP);
        f_cerrar_modalespersona(modal);
        
        //alert("Em cerrar persona2");
        var porigen = 'INT';
        if (modal =='axisper022')
         porigen = 'NUEVO';
        
        document.axisctr203Form.ORIGEN.value = porigen;
        document.axisctr203Form.SNIP.value = SNIP; 
        document.axisctr203Form.CAGENTE_VISIO.value = CAGENTE;
        
        if (!objUtiles.estaVacio(SPERSON)){          
          objAjax.invokeAsyncCGI("modal_axisctr203.do?SPERSON_REL="+SPERSON+"&CAGENTE1="+CAGENTE, callbackAjaxActualitzaPersona, "operation=ajax_actualizar_persona", this, objJsMessages.jslit_cargando);
        }
      }

      function callbackAjaxActualitzaPersona (ajaxResponseText) {
            try{
               //alert(ajaxResponseText);
               
                var doc = objAjax.domParse(ajaxResponseText);
             
                if (!objAppMensajes.existenErroresEnAplicacion(doc)) {   
                     
                     objDom.setValorPorId("NNUMIDE", objDom.getValorNodoDelComponente(doc.getElementsByTagName("NNUMIDE"), 0, 0));
                   
                     var APELLIDO1 = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("TAPELLI1")[0]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("TAPELLI1"), 0, 0) : "");
                     var APELLIDO2 = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("TAPELLI2")[0]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("TAPELLI2"), 0, 0) : "");
                     var NOMBRE = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("TNOMBRE")[0]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("TNOMBRE"), 0, 0) : "");
                     var CTIPIDE = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("CTIPIDE")[0]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("CTIPIDE"), 0, 0) : "");
                     var CTIPPER = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("CTIPPER")[0]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("CTIPPER"), 0, 0) : "");   
                     var SPERSON = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("SPERSON")[0]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("SPERSON"), 0, 0) : "");
                     var FNACIMI = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("FNACIMI")[0]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("FNACIMI"), 0, 0) : "");
                     
                     objDom.setValorPorId("NOMBRE", NOMBRE+' ' + APELLIDO1 +' '+ APELLIDO2);                     
                     objDom.setValorPorId("SPERSON_REL", objDom.getValorNodoDelComponente(doc.getElementsByTagName("SPERSON"), 0, 0));         
                     document.axisctr203Form.SPERSON_REL.value = objDom.getValorNodoDelComponente(doc.getElementsByTagName("SPERSON"), 0, 0);
                     
                     objDom.setValorPorId("CTIPIDE", CTIPIDE);
                     objDom.setValorPorId("CTIPPER", CTIPPER);
                     objDom.setValorPorId("SPERSON", SPERSON);
                     objDom.setValorPorId("NOMBRE", NOMBRE + " " + APELLIDO1 + " " + APELLIDO2);
                     
                     document.axisctr203Form.NOMBRE.readOnly = true;//AMA-262: Se corrige la validación que no se realizaba por no ser modificables.
                     document.axisctr203Form.NNUMIDE.readOnly = true;//Es necesario hacer se bloqueen una vez se han seteado.
                     
                     if(document.axisctr203Form.FNACIMI && FNACIMI != null && FNACIMI != ''){
                        var year = FNACIMI.substring(0, 4);
                        var mon = FNACIMI.substring(4, 6);
                        var day = FNACIMI.substring(6, 8);
                        objDom.setValorPorId("FNACIMI", day + '/' + mon + '/' + year);
                     }
                }          
             
            }catch(e){}
      }
      
        function f_habilitar_campos(){
            var selects = document.getElementsByTagName("select");
           // var checkboxs = document.getElementsByTagName("checkbox");
            for(var i=0;i<selects.length;i++){
                if(selects[i].attributes.length>0) {
                   var selectId = selects[i].getAttribute("id");
                     try{
                         if (document.getElementById(selectId).style.visibility != 'hidden' ){
                             if(selects[i].getAttribute("type") != "button"  &&
                                objDom.estaDisabled(selectId))
                                    objDom.setDisabledPorId(selectId,false);
                         }
                     }catch(e){}
                }
            }
        }
        
    </script>
  </head>
    <body onload="f_onload()" class=" ">
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="titulo"><axis:alt c="TITULO_022" f="axisctr203" lit="1000214"/></c:param>
            <c:param name="nid" value="axisper022"/>
        </c:import> 
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="titulo"><axis:alt c="TITULO_021" f="axisctr203" lit="1000235"/></c:param>
            <c:param name="nid" value="axisper021"/>
        </c:import>    
        <form name="axisctr203Form" action="" method="POST">
            <input type="hidden" name="operation" value="">
            <input type="hidden" name="ORIGEN" id="ORIGEN" value="${__formdata.ORIGEN}"/>
            <input type="hidden" name="CAGENTE_VISIO" value="${__formdata.CAGENTE_VISIO}"/>
            <input type="hidden" name="SNIP" value="${__formdata.SNIP}"/>
            <input type="hidden" id="SPEREAL" name="SPEREAL" value="${__formdata.SPEREAL}"/>
            <input type="hidden" id="SPERSON_REL" name="SPERSON_REL" value="${__formdata.SPERSON_REL}"/>
            <input type="hidden" id="CAGENTE" name="CAGENTE" value="${__formdata.CAGENTE}"/>
            <input type="hidden" id="CMODO" name="CMODO" value="${__formdata.CMODO}"/>
            <input type="hidden" id="SPERLRE" name="SPERLRE" value="${__formdata.SPERLRE}"/>
            

            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt f="axisctr203" c="formulario" lit="9904438" /></c:param>
                <c:param name="producto"><axis:alt f="axisctr203" c="producto" lit="9904438" /></c:param>
                <c:param name="form">Axisctr203</c:param>
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
                                        <td class="titulocaja" >
                                            <b><axis:alt f="axisctr203" c="CCLALIS" lit="9904431"/></b><!-- Clase lista -->
                                        </td> 
                                        <td class="titulocaja" >
                                            <b><axis:alt f="axisctr203" c="CTIPLIS" lit="9904432"/></b><!-- Tipo lista -->
                                        </td> 
                                        
                                    </tr>
                                    <tr> 
                                        <td class="campocaja" > 
                                            <select name = "CCLALIS" id="CCLALIS" size="1" class="campowidthselect campo campotexto"
                                            <axis:atr f="axisctr203" c="CCLALIS" a="modificable=false&obligatorio=true&isInputText=false"/> >
                                                <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisctr203" c="BLANCO" lit="108341"/> - </option>
                                                <c:forEach var="tipo" items="${__formdata.listValores.claseList}">
                                                    <option value = "${tipo.CATRIBU}"
                                                    <c:if test="${tipo.CATRIBU == 2}"> selected </c:if>>
                                                     ${tipo.TATRIBU}</option>  
                                                </c:forEach>
                                            </select>
                                        </td>
                                        <td class="campocaja" > 
                                            <select name = "CTIPLIS" id="CTIPLIS" size="1" class="campowidthselect campo campotexto"
                                              title="<axis:alt f="axisctr203" c="CTIPLIS" lit="9904432"/>"
                                                <axis:atr f="axisctr203" c="CTIPLIS" a="modificable=true&obligatorio=true&isInputText=false"/>>
                                                <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisctr203" c="BLANCO" lit="108341"/> - </option>
                                                <c:forEach var="tipo" items="${__formdata.listValores.tipoList}">
                                                    <option value = "${tipo.CATRIBU}"
                                                    <c:if test="${(!empty __formdata.CTIPLIS)&& tipo.CATRIBU == __formdata.CTIPLIS}"> selected </c:if>>
                                                     ${tipo.TATRIBU}</option>  
                                                </c:forEach>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <!-- Tipo identificacion -->
                                        <td class="titulocaja" >
                                            <b><axis:alt f="axisctr203" c="CTIPIDE" lit="9904433"/></b>
                                        </td>
                                        <!-- Número identificación -->
                                        <td class="titulocaja" >
                                            <b><axis:alt f="axisctr203" c="NIDENTIFICACION" lit="9904434"/></b>
                                        </td>
                                        <!-- Nombre persona -->
                                        <td class="titulocaja"  colspan="2">
                                            <b><axis:alt f="axisctr203" c="NOMBREPER" lit="105940"/></b>
                                        </td>
                                        
                                        <!-- Tipo persona -->
                                        <td class="titulocaja">
                                            <b><axis:alt f="axisctr203" c="CTIPPER" lit="102844"/></b>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="campocaja">
                                            <select name = "CTIPIDE" id="CTIPIDE"  style="width:100%;" value="${__formdata.CTIPIDE}" 
                                                    size="1" onchange="" class="campowidthselect campo campotexto" 
                                                     <axis:atr f="axissin011" c="CTIPIDE" a="modificable=false&obligatorio=false&isInputText=false"/>>
                                                <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisctr203" c="BLANCO" lit="108341"/> - </option>
                                                <c:forEach var="estado" items="${__formdata.listValores.tipDocum}">
                                                    <option value = "${estado.CATRIBU}"
                                                    <c:if test="${(!empty __formdata.CTIPIDE)&& estado.CATRIBU == __formdata.CTIPIDE}"> selected </c:if>>
                                                     ${estado.TATRIBU}</option>  
                                                </c:forEach>
                                            </select>
                                        </td>
                                        <td class="campocaja">
                                            <input type="hidden" id="SPERSON" name="SPERSON" value="${__formdata.SPERSON}" class="campowidthinput campo campotexto" style="width:90%"
                                                <axis:atr f="axisctr203" c="SPERSON" a="modificable=false&obligatorio=true"/> /> 
                                            <input type="text" id="NNUMIDE" name="NNUMIDE" value="${__formdata.NNUMIDE}" class="campowidthinput campo campotexto" style="width:60%"
                                                title="<axis:alt f="axisctr203" c="NNUMIDE" lit="9904434"/>"
                                                <axis:atr f="axisctr203" c="NNUMIDE" a="obligatorio=true"/> /> 
                                            <img id="find" border="0" src="images/find.gif" onclick="f_abrir_axisper021()" style="cursor:pointer"/>  
                                        </td>
                                        <td class="campocaja" colspan="2">
                                            <input type="text" id="NOMBRE" name="NOMBRE" value="${__formdata.NOMBRE}" class="campowidthinput campo campotexto" style="width:90%"
                                                <axis:atr f="axisctr203" c="NOMBRE" a="obligatorio=true"/> /> 
                                        </td>
                                        <td class="campocaja">
                                            <select name = "CTIPPER" id="CTIPPER"  style="width:100%;"  size="1" 
                                            <axis:atr f="axisctr203" c="CTIPPER" a="modificable=false&obligatorio=false&isInputText=false"/> 
                                                  onchange="f_onchange_CTIPPERcerca(this.value)" class="campowidthselect campo campotexto">
                                                <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisctr203" c="BLANCO" lit="108341"/> - </option>
                                                <c:forEach var="estado" items="${__formdata.listValores.tipPerson}">
                                                    <option value = "${estado.CATRIBU}"
                                                    <c:if test="${(!empty __formdata.CTIPPER)&& estado.CATRIBU == __formdata.CTIPPER}"> selected </c:if>>
                                                     ${estado.TATRIBU}</option>  
                                                </c:forEach>
                                            </select>
                                        </td>
                                    </tr>
                                   
                                    
                                    <tr>
                                        <td class="titulocaja" >
                                            <b><axis:alt f="axisctr203" c="FINCLU" lit="9902640"/></b><!--F. Inclusion -->
                                        </td> 
                                        <td class="titulocaja" >
											<axis:visible c="MOTINCLU" f="axisctr203" > 
												<b><axis:alt f="axisctr203" c="MOTINCLU" lit="9904447"/></b><!-- Motivo inclusión -->
											</axis:visible>
                                        </td>
                                        <td class="titulocaja" >
                                            <b><axis:alt f="axisctr203" c="FEXCLU" lit="9902639"/></b><!-- F. Exclusión -->
                                        </td> 
                                        <axis:visible c="FNACIMI" f="axisctr203" >  
                                            <td class="titulocaja" >
                                               <b id="label_FNACIMI"><axis:alt f="axisctr203" c="FNACIMI" lit="1000064"/></b><!-- F. Nacimiento -->
                                            </td> 
                                        </axis:visible>
                                    </tr>
                                    <tr>
                                        <td class="campocaja" > 
                                            <jsp:useBean id="today" class="java.util.Date" />
                                            
                                            <input type="text" formato="fecha" name="FINCLU" id="FINCLU" style="width:40%;"   
                                                value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FINCLU}"/> <c:if test="${empty __formdata.FINCLU}"><fmt:formatDate pattern="dd/MM/yyyy" value="${today}"/></c:if>"
                                                title="<axis:alt f="axisctr203" c="FINCLU" lit="9902640"/>"
                                                <c:choose>
                                                        <c:when test="${__formdata.CMODO == 'MODIF'}">
                                                            <axis:atr f="axisctr203" c="FINCLU" a="modificable=false&obligatorio=true"/>
                                                        </c:when>
                                                        <c:otherwise >
                                                         <axis:atr f="axisctr203" c="FINCLU" a="modificable=true&obligatorio=true"/> 
                                                        </c:otherwise>
                                                     </c:choose>
                                                 class="campowidthinput campo campotexto" />
                                            <c:if test="${__formdata.CMODO == 'NEW'}">
                                            <a id="icon_FINCLU" style="vertical-align:middle;">
                                            <img alt="<axis:alt f="axisctr203" c="FINCLU" lit="108341"/>" title="<axis:alt f="axisctr203" c="FINCLU2" lit="9902640" />" src="images/calendar.gif"/></a>
                                            </c:if>
                                        </td>
                                        <td class="campocaja">
                                          <axis:visible c="MOTINCLU" f="axisctr203" > 
                                             <select name = "MOTINCLU" id="MOTINCLU"  style="width:100%;" value="" size="1" class="campowidthselect campo campotexto"
                                                    title="<axis:alt f="axisctr203" c="MOTINCLU" lit="9904447"/>"
                                                    <c:choose>
                                                        <c:when test="${__formdata.CMODO == 'MODIF'}">
                                                         <axis:atr f="axisctr203" c="MOTINCLU" a="modificable=false&obligatorio=true&isInputText=false"/>
                                                        </c:when>
                                                        <c:otherwise >
                                                         <axis:atr f="axisctr203" c="MOTINCLU" a="modificable=true&obligatorio=true&isInputText=false"/> 
                                                        </c:otherwise>
                                                     </c:choose> >
                                                <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisctr203" c="BLANCO" lit="108341"/> - </option>
                                                <c:forEach var="estado" items="${__formdata.listValores.motExclu}">
                                                    <option value = "${estado.CATRIBU}"
                                                    <c:if test="${(!empty __formdata.MOTINCLU)&& estado.CATRIBU == __formdata.MOTINCLU}"> selected </c:if>>
                                                     ${estado.TATRIBU}</option>  
                                                </c:forEach>
                                            </select>
                                            </axis:visible>
                                        </td>
                                        <td class="campocaja" >
                                            <input type="text" formato="fecha" name="FEXCLU" id="FEXCLU" style="width:40%;"   value="<fmt:formatDate value="${__formdata.FEXCLU}" pattern="dd/MM/yyyy" />" class="campowidthinput campo campotexto"/>
                                            <a id="icon_FEXCLU" style="vertical-align:middle;">
                                            <img alt="<axis:alt f="axisctr203" c="FEXCLU" lit="108341"/>" title="<axis:alt f="axisctr203" c="FEXCLU2" lit="9902639" />" src="images/calendar.gif"/></a>
                                        </td>
                                        <axis:visible c="FNACIMI" f="axisctr203" >   
                                          <td class="campocaja" >
                                            <input type="text" formato="fecha" name="FNACIMI" id="FNACIMI" style="width:40%;"
                                                value="<fmt:formatDate value="${__formdata.FNACIMI}" pattern="dd/MM/yyyy" />"
                                                class="campowidthinput campo campotexto"
                                                <axis:atr f="axisctr203" c="FNACIMI" a="modificable=false"/>/>
                                          </td>
                                       </axis:visible>             
                                    </tr>
                                    <!--INICIO JAVENDANO CONF 239 -->
                                    <tr>
                                        <td class="titulocaja" colspan="2">
                                            <b><axis:alt f="axisctr203" c="TOBSERV" lit="101162"/></b>
                                        </td>
                                        <td class="titulocaja" colspan="2">
                                            <b><axis:alt f="axisctr203" c="TMOTEXC" lit="9902642"/></b>
                                        </td>                                        
                                    </tr> 
                                    <tr>                                        
                                        <td class="campocaja" colspan="2">
                                            <input type="text" id="TOBSERV" name="TOBSERV" value="${__formdata.TOBSERV}" class="campowidthinput campo campotexto" style="width:90%"
                                                <axis:atr f="axisctr203" c="TOBSERV" a="obligatorio=false"/> /> 
                                        </td>                                       
                                        <td class="campocaja" colspan="2">
                                            <input type="text" id="TMOTEXC" name="TMOTEXC" value="${__formdata.TMOTEXC}" class="campowidthinput campo campotexto" style="width:90%"
                                                <axis:atr f="axisctr203" c="TMOTEXC" a="obligatorio=false"/> /> 
                                        </td>                                        
                                    </tr>
                                    <!--FIN JAVENDANO CONF 239 -->
                                </table>    
                            </td>
                        </tr>
                        </table>
                    </td>
                </tr>
            </table>					
            
            <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisctr203</c:param>
                <c:param name="__botones">cancelar,aceptar</c:param>
            </c:import>
            
            <script type="text/javascript">
            <c:if test="${__formdata.CMODO == 'NEW'}">
            Calendar.setup({
            inputField     :    "FINCLU",     
            ifFormat       :    "%d/%m/%Y",      
            button         :    "icon_FINCLU", 
            singleClick    :    true,
            firstDay       :    1
            });
            </c:if>
           
            Calendar.setup({
            inputField     :    "FEXCLU",     
            ifFormat       :    "%d/%m/%Y",      
            button         :    "icon_FEXCLU", 
            singleClick    :    true,
            firstDay       :    1
            });
            </script>
            
        </form>
      <c:import url="../include/mensajes.jsp" />
    </body>
</html>

