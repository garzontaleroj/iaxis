<%/* Revision:# bz3tv2Fdh0QTQvySc2gzCw== # */%>
<%/**
*  Fichero: axisage10.jsp
*/
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>    

<%@ page contentType="text/html;charset=iso-8859-15" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">

<html>
    <head>
        <title><axis:alt f="axisage010" c="TITULO" lit="9905811"/></title>
        <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>   
        <link rel="stylesheet" type="text/css" media="all" href="styles/calendar-green.css" title="green" />
        <script type="text/javascript" src="scripts/calendar.js"></script>
        <script type="text/javascript" src="scripts/calendar-${sessionScope.__locale}.js"></script>
        <script type="text/javascript" src="scripts/calendar-setup.js"></script>
        <c:import url="../include/carga_framework_js.jsp" />
        <script type="text/javascript">
          /****************************************************************************************/
          /*********************************** NAVEGACION *****************************************/
          /****************************************************************************************/
        function f_onload() {
            if (document.miForm.isNew.value != "true" && document.miForm.isBusca.value != "true") {
              f_abrir_modal('axisage009', true, "");
            }
            f_cargar_propiedades_pantalla();
        }
        
             function f_actualizar_check1(CEXCCRR) {
     
              objDom.setValorPorId("CEXCEPCION1", ((objDom.getComponenteMarcado(CEXCCRR)) ? "1" : "0"));
                          
          }
         function f_actualizar_check2(CEXCNEWP) {
     
              objDom.setValorPorId("CEXCEPCION2", ((objDom.getComponenteMarcado(CEXCNEWP)) ? "1" : "0"));
       
          }
 
          function f_but_cancelar() {
              objUtiles.ejecutarFormulario("flujodetrabajo.do?forigen=axisage010", "cancelar", document.miForm, "_self");
          }
 
          function f_but_aceptar() {
              if (objDom.getValorPorId("CESTADO") == 2 && objUtiles.estaVacio(objDom.getValorPorId("FFINCAM"))) {
                  alert('<axis:alt f="axisage010" c="ERROR_CESTADO" lit="9906704"/>');
              }
              else if (!objUtiles.estaVacio(objDom.getValorPorId("FFINCAM")) && fechaMayorOIgualQue(objDom.getValorPorId("FINICAM"), objDom.getValorPorId("FFINCAM"))) {
                  alert('<axis:alt f="axisage010" c="ERROR_FECHA" lit="101922"/>');
              }
              if (fechaMayorOIgualQue(objDom.getValorPorId("FINIREC"), objDom.getValorPorId("FFINREC"))) {
                  alert('<axis:alt f="axisage010" c="ERROR_FECHA" lit="9909009"/>');
                  }
              else if (fechaMayorOIgualQue(objDom.getValorPorId("FINICAM"), objDom.getValorPorId("FINIREC"))) {
                  alert('<axis:alt f="axisage010" c="ERROR_FECHA" lit="9909010"/>');
                  }
                  
              if (fechaMayorOIgualQue(objDom.getValorPorId("FINIREC"), objDom.getValorPorId("FFINCAM"))) {
                  alert('<axis:alt f="axisage010" c="ERROR_FECHA" lit="9909012"/>');
                  }
             
              else {
                  if (objValidador.validaEntrada()) {
                      document.miForm.isEdit.value = true;
                      document.miForm.isNew.value = false;
                      objUtiles.ejecutarFormulario("axis_axisage010.do", "aceptar", document.miForm, "_self");
                  }
              }
          }
 
          function f_cerrar_modal(cual) {
              objUtiles.cerrarModal(cual);
              document.miForm.grabarOK.value = false;
              document.miForm.isEdit.value = true;
              objUtiles.ejecutarFormulario("axis_axisage010.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);
          }
 
          function f_cerrar_axisage009() {
              document.miForm.isBusca.value = true;
              f_cerrar_modal("axisage009");
          }
 
          function f_cerrar_axisage011() {
              document.miForm.isBusca.value = true;
              f_cerrar_modal("axisage011");
          }
 
          function f_cerrar_axisctr999() {
              document.miForm.isBusca.value = true;
              f_cerrar_modal("axisctr999");
          }
 
          function f_aceptar_axisage009(CCODIGO) {
              objUtiles.cerrarModal("axisage009");
              document.miForm.CCODIGO.value = CCODIGO;
              document.miForm.grabarOK.value = false;
              document.miForm.isEdit.value = true;
              document.miForm.isNew.value = false;
              document.miForm.isBusca.value = true;
              objUtiles.ejecutarFormulario("axis_axisage010.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);
          }
 
          function f_nuevo_axisage009() {
              objUtiles.cerrarModal("axisage009");
              document.miForm.grabarOK.value = false;
              document.miForm.isEdit.value = false;
              document.miForm.isNew.value = true;
              document.miForm.isBusca.value = true;
              objUtiles.ejecutarFormulario("axis_axisage010.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);
          }
 
          function actualitzarCheckbox(obj) 
          {
              objDom.setValorPorId(obj.name, ((objDom.getComponenteMarcado(obj)) ? "true" : "false"));
              if(document.getElementById("IMPRIMIR_ALL").value == "true" && document.getElementById(obj.name).value == "false")
                  {
                      document.getElementById("IMPRIMIR_ALL").value = false;
                      document.getElementById("IMPRIMIR_ALL").checked = false;
                  }
          }
 
          function f_anyadir_producto() {
            if (document.miForm.isNew.value == "true") {
                alert('<axis:alt f="axisage010" c="ERROR_ISNEW" lit="9906684"/>');
            } else if (objValidador.validaEntrada()) {
              f_abrir_modal('axisctr999', true, '&CCODIGO=' + objDom.getValorPorId("CCODIGO"));
            }
          }
 
          function f_anyadir_agenteGanador() {
            if (document.miForm.isNew.value == "true") {
                 alert('<axis:alt f="axisage010" c="ERROR_ISNEW" lit="9906684"/>');
            } else if (objValidador.validaEntrada()) {
              f_abrir_modal('axisage011', true, '&CCODIGO=' + objDom.getValorPorId("CCODIGO") + '&TDESCRIP=' + objDom.getValorPorId("TDESCRIP") + '&FINICAM=' + objDom.getValorPorId("FINICAM") + '&MODO=isGanadores');
            }
          }
 
          //Asignar agente
          function f_but_9001304() {
          if (document.miForm.isNew.value == "true") {
                 alert('<axis:alt f="axisage010" c="ERROR_ISNEW" lit="9906684"/>');
            } else if (objValidador.validaEntrada()) {
              f_abrir_modal('axisage011', true, '&CCODIGO=' + objDom.getValorPorId("CCODIGO") + '&TDESCRIP=' + objDom.getValorPorId("TDESCRIP") + '&FINICAM=' + objDom.getValorPorId("FINICAM") + '&MODO=isAsignar');
            }
          }
 
          //Desasignar agente
          function f_but_9902356() {
          if (document.miForm.isNew.value == "true") {
                 alert('<axis:alt f="axisage010" c="ERROR_ISNEW" lit="9906684"/>');
            } else if (objValidador.validaEntrada()) {
              f_abrir_modal('axisage011', true, '&CCODIGO=' + objDom.getValorPorId("CCODIGO") + '&TDESCRIP=' + objDom.getValorPorId("TDESCRIP") + '&FINICAM=' + objDom.getValorPorId("FINICAM") + '&MODO=isDesasignar');
            }
          }
 
          
              
 
              function f_abrir_modal(cual, noXButton, optionalQueryString) {
                  if (objUtiles.estaVacio(optionalQueryString))
                  optionalQueryString = "";
 
                  if (noXButton)
                  objDom.setVisibilidadPorId("but_cerrar_modal_" + cual, "hidden");
 
                  objUtiles.abrirModal(cual, "src", "modal_" + cual + ".do?operation=form" + optionalQueryString);
              }
 
              function fechaMayorOIgualQue(fec0, fec1) {
                  var bRes = false;
                  var sDia0 = fec0.substr(0, 2);
                  var sMes0 = fec0.substr(3, 2);
                  var sAno0 = fec0.substr(6, 4);
                  var sDia1 = fec1.substr(0, 2);
                  var sMes1 = fec1.substr(3, 2);
                  var sAno1 = fec1.substr(6, 4);
                  if (sAno0 > sAno1)
                  bRes = true;
                  else {
                      if (sAno0 == sAno1) {
                          if (sMes0 > sMes1)
                          bRes = true;
                          else {
                              if (sMes0 == sMes1)
                              if (sDia0 >= sDia1)
                              bRes = true;
                          }
                      }
                  }
                  return bRes;
              }
          
          //Gen. carta anulación
          function f_but_9902358() {
                var numberOfChBox = $('.cosa').length;
                var cont = 10000000;
                var aux = 0;
                for(var i=0;i<numberOfChBox;i++){
                      //alert("f_but_9902358-Iteracio: " + i);
                      var finalAccio ="KO";
                      var cosa="CAGENTE_"+i;
                      if($('#IMPRIMIR_' + i).is(':checked')) {
                        if (!objUtiles.estaVacio(objDom.getValorPorId("FFINCAM_"+i)))
                        {
                                if (objValidador.validaEntrada()) {                            
                                    var url = "axis_axisage010.do?operation=miajaxjson&CMAP=CAMPA_CARTA_BAJA&CCODIGO="+document.miForm.CCODIGO.value+"&CCAGENTE="+objDom.getValorPorId(cosa);
                                    finalAccio = objAjax.invokeSyncCGI_JSON(url, callBack_miajaxjson, "<axis:alt f="axisage010" c="MSG_CARGAR" lit="9905686"/>");
                                }
                                while(finalAccio != "OK")
                                {
                                    i = i;  
                                }
                        } else{
                            alert('<axis:alt f="axisage010" c="ERROR_AGENTE" lit="9908111"/>');
                        }
                      }
                }
          }
          
          //Gen. carta alta
          function f_but_9902357() {
              var numberOfChBox = $('.cosa').length;
                for(var i=0;i<numberOfChBox;i++){
                      //alert("f_but_9902358-Iteracio: " + i);
                      var finalAccio ="KO";
                      var cosa="CAGENTE_"+i;
                      if($('#IMPRIMIR_' + i).is(':checked')) {
                        if (!objUtiles.estaVacio(objDom.getValorPorId("FINICAM_"+i)))
                        {
                            if (objValidador.validaEntrada()) {
                                //alert("f_but_9902358-crida: " + i);
                                var url = "axis_axisage010.do?operation=miajaxjson&CMAP=CAMPA_CARTA_ALTA&CCODIGO="+document.miForm.CCODIGO.value+"&CCAGENTE="+objDom.getValorPorId(cosa);
                                finalAccio = objAjax.invokeSyncCGI_JSON(url, callBack_miajaxjson, "<axis:alt f="axisage010" c="MSG_CARGAR" lit="9905686"/>");
                            }
                            while(finalAccio != "OK")
                            {
                                i = i;  
                            }
                        } else{
                            alert('<axis:alt f="axisage010" c="ERROR_AGENTE" lit="9908110"/>');
                        }
                    }
                }
          }
          
          function callBack_miajaxjson(p) {
               //alert(JSON.stringify(p))
               objEventos.showHideLoader("ajaxLoader", "ajaxContent", "ajaxText", "", "none");
                //hay que actualizar la lista de resulotados xxx
                var odiv_OBFICHERO=document.getElementById("div_OBFICHERO");
                odiv_OBFICHERO.innerHTML="";
                var div_OBFICHEROcontenido="";
                div_OBFICHEROcontenido=div_OBFICHEROcontenido+"<table align=\"center\" class=\"dsptgtable\">";
            
                if (p.JSON2.LISTADOS!=null) {
                   if (p.JSON2.LISTADOS.MENSAJES!=null && p.JSON2.LISTADOS.MENSAJES.length>0) {
                      var errmsg="<axis:alt c="EJECUTAR_ERROR" f="axislist003" lit="108953" />";
                      for (var i=0;i<p.JSON2.LISTADOS.MENSAJES.length;i++) {
                        var miMENSAJESitem=p.JSON2.LISTADOS.MENSAJES[i];
                        errmsg=errmsg+"\n- "+miMENSAJESitem.OB_IAX_MENSAJES.TERROR;
                      }
                         alert(errmsg);
                    }else{
                       div_OBFICHEROcontenido=div_OBFICHEROcontenido+"<tr><td><a href=\"javascript:f_imprimir_fitxer()\">"+p.JSON2.LISTADOS.ONOMFICHERO+"</a><input type=\"hidden\"   name=\"SORTIDA"+"\" id=\"SORTIDA"+"\" value=\""+p.JSON2.LISTADOS.OFICHERO+"\"/> </td></tr> ";
                       div_OBFICHEROcontenido=div_OBFICHEROcontenido+"</table>";
                       odiv_OBFICHERO.innerHTML=div_OBFICHEROcontenido;
                       f_imprimir_fitxer();
                    }
                }
          }
          
          function selectAll()
          {
              var numberOfChBox = $('.cosa').length;
              if(document.getElementById("IMPRIMIR_ALL").value == "true")
              {
                  document.getElementById("IMPRIMIR_ALL").value = false;
                  for(var i=0;i<numberOfChBox;i++)
                 {
                      document.getElementById("IMPRIMIR_" + i).checked = false;
                      document.getElementById("IMPRIMIR_" + i).value = false;
                 }
              }
              else
              {
                  document.getElementById("IMPRIMIR_ALL").value = true;
                  for(var i=0;i<numberOfChBox;i++)
                 {
                      document.getElementById("IMPRIMIR_" + i).checked = true;
                      document.getElementById("IMPRIMIR_" + i).value = true;
                 } 
              }
          }
          
         function f_imprimir_fitxer(){
            //pfitxer = document.getElementById('SORTIDA').value;
            //var str2 = pfitxer.replace(/barrainvertida/gi, "\\");  
            //objUtiles.ejecutarFormulario("axis_axisage010.do?file="+str2, "tunnel_doc", document.miForm, "_blank", null);
            
            pfitxer = document.getElementById('SORTIDA').value;
            var doc = pfitxer.replace(/barrainvertida/gi, "\\");
            nuevaVentana = window.open("axis_axisage010.do?operation=tunnel_doc&file=" + doc, "_new");    
            // Abrir un proceso con setInterval para cerrar la ventana recién abierta
            if (document.all) {
                 idVentanas[contadorVentanas] = setInterval("f_cerrar_nuevaVentana()", 100);
                 contadorVentanas++;
             }
         } 
         function f_validar_fecha_pro()
		 {
            var date = objDom.getValorPorId("FINICAM");
     		var date1 = objDom.getValorPorId("FFINCAM");
            var dias = fecha (date, date1);    
				
				if(dias > 720){
					alert("<axis:alt f='axisage010' c='MENSAAGE' lit='9910860'/>");
				}       
     }
         function f_validar_fecha_rec()
		 {
            var date = objDom.getValorPorId("FINIREC");
      		var date1 = objDom.getValorPorId("FFINREC"); 
      		var dias = fecha (date, date1);    
 				
 				if(dias > 720){
 					alert("<axis:alt f='axisage010' c='MENSAAGE' lit='9910877'/>");
 				}       
      }
     
         function fecha(f1,f2)
		 {
			 var aFecha1 = f1.split('/'); 
			 var aFecha2 = f2.split('/'); 
			 var fFecha1 = Date.UTC(aFecha1[2],aFecha1[1]-1,aFecha1[0]); 
			 var fFecha2 = Date.UTC(aFecha2[2],aFecha2[1]-1,aFecha2[0]); 
			 var dif = fFecha2 - fFecha1;
			 var dias = Math.floor(dif / (1000 * 60 * 60 * 24)); 
			 return dias;
		 }
        </script>
    </head>
    <body  onload="f_onload()">
        <div class="seccion displayspace" id="div_OBFICHERO" style="display:none"></div>
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">axisage009|<axis:alt f="axisage010" c="LIT_MOD_010" lit="9902359"/><%-- Búsqueda de Campañas --%></c:param>
        </c:import>
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">axisage011|<axis:alt f="axisage010" c="LIT_MOD_010" lit="9000713"/><%-- Búsqueda de agentes --%></c:param>
        </c:import>
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">axisctr999|<axis:alt f="axisage010" c="LIT_MOD_010" lit="1000108"/><%-- Búsqueda de garantias --%></c:param>
        </c:import>
        <form name="miForm" action="axis_axisage010.do" method="POST">
            
            <input type="hidden" name="operation" value=""/> 
            <input type="hidden" name="isNew" id="isNew" value="${__formdata.isNew}"/>        
            <input type="hidden" name="isBusca" id="isBusca" value="${__formdata.isBusca}"/>
            <input type="hidden" name="isEdit" id="isEdit" value="${__formdata.isEdit}"/>
            <input type="hidden" name="grabarOK" id="grabarOK" value="${__formdata.grabarOK}"/>
            <input type="hidden" name="CEXCEPCION1" id="CEXCEPCION1" value="${__formdata.CEXCEPCION1}"/> 
            <input type="hidden" name="CEXCEPCION2" id="CEXCEPCION2" value="${__formdata.CEXCEPCION2}"/> 
        
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt f="axisage010" c="TITULO" lit="9905811"/></c:param>
                <c:param name="titulo"><axis:alt f="axisage010" c="TITULO" lit="9905811"/></c:param> 
                <c:param name="form">axisage010</c:param>
            </c:import>
            <!-- Área de campos  -->
            <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <!-- Sección 1 -->
                       <table class="seccion">
                          <tr>
                            <td>
                              <table class="area" align="center">
                                <tr>
                                  <th style="width:25%;height:0%;"></th>
                                  <th style="width:25%;height:0%;"></th>
                                  <th style="width:25%;height:0%;"></th>
                                  <th style="width:25%;height:0%;"></th>
                                </tr>
                                <tr>
                                  <axis:ocultar f="axisage010" c="CCODIGO">
                                    <td class="titulocaja">
                                      <b><axis:alt f="axisage010" c="CCODIGO" lit="103465"/></b>
                                    </td>
                                  </axis:ocultar>
                                  <axis:ocultar f="axisage010" c="TDESCRIP">
                                    <td class="titulocaja" colspan="1">
                                      <b><axis:alt f="axisage010" c="TDESCRIP" lit="9900734"/></b>
                                    </td>
                                  </axis:ocultar>
                                  <axis:ocultar f="axisage010" c="CESTADO">
                                    <td class="titulocaja">
                                      <b><axis:alt f="axisage010" c="CESTADO" lit="100587"/></b>
                                    </td>
                                  </axis:ocultar>
                                  <axis:ocultar f="axisage010" c="CCONVEN">
                                    <td class="titulocaja">
                                    <b><axis:alt f="axisage010" c="CCONVEN" lit="9908880"/></b> <%-- Tipo de Convención --%>
                                    </td>
                                  </axis:ocultar>
                                </tr>
                                <tr>
                                  <axis:ocultar f="axisage010" c="CCODIGO">
                                    <td class="campocaja">
                                      <input id="CCODIGO" name="CCODIGO" type="text" class="campo campotexto" style="width:30%" maxlength="4"
                                             title=<axis:alt f="axisage010" c="CCODIGO" lit="103465"/>
                                             alt=<axis:alt f="axisage010" c="CCODIGO" lit="103465"/>
                                             value="${__formdata.CCODIGO}"
                                             <axis:atr f="axisage010" c="CCODIGO" a="modificable=true&obligatorio=true"/>/>
                                      <img border="0" src="images/find.gif" onclick="f_abrir_modal('axisage009', true)" 
                                           style="cursor:pointer" id="icon_CERCAGEN" 
                                           alt="<axis:alt f="axisage010" c="CERCAGEN" lit="9902359"/>" 
                                           title="<axis:alt f="axisage010" c="CERCAGEN" lit="9902359"/>"/>  
                                    </td>
                                  </axis:ocultar>
                                  <axis:ocultar f="axisage010" c="TDESCRIP">
                                    <td class="campocaja">
                                      <input id="TDESCRIP" name="TDESCRIP" type="text" class="campo campotexto" style="width:100%" maxlength="120"
                                             title=<axis:alt f="axisage010" c="TDESCRIP" lit="9900734" />
                                             alt=<axis:alt f="axisage010" c="TDESCRIP" lit="9900734"/> 
                                             <axis:atr f="axisage010" c="TDESCRIP" a="obligatorio=true"/>
                                             value="${__formdata.TDESCRIP}"/>
                                    </td>
                                  </axis:ocultar>
                                  <axis:visible c="CESTADO" f="axisage010">
                                    <td class="campocaja">
                                        <select class="campowidthselect campo campotexto" id="CESTADO" name="CESTADO" 
                                                size="1" style="width:50%"   
                                                title="<axis:alt f="axisage010" c="CESTADO" lit="100587"/>"
                                                <axis:atr f="axisage010" c="CESTADO" a="obligatorio=true&isInputText=false"/>>
                                            <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisage010" c="CESTADO_VALOR" lit="100587"/> - </option>
                                            <c:forEach items="${__formdata.LSTVALORES.LSTESTADOS}" var="item"> 
                                                <option value="${item.CATRIBU}" <c:if test="${item.CATRIBU  == __formdata.CESTADO}">selected</c:if>>
                                                    ${item.TATRIBU}
                                                </option>
                                            </c:forEach>
                                        </select>
                                    </td>
                                  </axis:visible>
                                <axis:visible f="axisage010" c="CCONVEN">
                                            <td class="campocaja">                                
                                                <select name="CCONVEN" id="CCONVEN" size="1" class="campowidthselect campo campotexto" style="width:95%;"> 
                                                 <axis:atr f="axisage010" c="CCONVEN" a="obligatorio=true&isInputText=false"/>
                                                    <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisage010" c="CCONVEN" lit="9908880"/> - </option>
                                                    <c:forEach var="element" items="${__formdata.LSTVALORES.LSTCONVEN}" >
                                                        <option value = "${element.CATRIBU}" <c:if test="${element.CATRIBU == __formdata.CCONVEN}">selected</c:if>>
                                                            ${element.TATRIBU} 
                                                        </option>
                                                    </c:forEach>
                                                </select>
                                            </td> 
                                    </axis:visible> 
                                </tr>
                                <tr>
                                  <axis:ocultar f="axisage010" c="FINICAM">
                                    <td class="titulocaja">
                                      <b><axis:alt f="axisage010" c="FINICAM" lit="9908888"/></b>
                                    </td>
                                  </axis:ocultar>
                                  <axis:ocultar f="axisage010" c="FFINCAM">
                                    <td class="titulocaja" colspan="1">
                                      <b><axis:alt f="axisage010" c="FFINCAM" lit="9908889"/></b>
                                    </td>
                                  </axis:ocultar>
                                  <axis:ocultar f="axisage010" c="FINIREC">
                                    <td class="titulocaja" colspan="1">
                                      <b><axis:alt f="axisage010" c="FINIREC" lit="9908878"/></b>
                                    </td>
                                  </axis:ocultar>
                                  
                                 <axis:ocultar f="axisage010" c="FFINREC">
                                    <td class="titulocaja" colspan="1">
                                      <b><axis:alt f="axisage010" c="FFINREC" lit="9908879"/></b>
                                    </td>
                                  </axis:ocultar>
                                </tr>
                                <tr>
                                  <axis:ocultar f="axisage010" c="FINICAM">
                                    <td class="campocaja">  
                                      <input type="text" class="campo campotexto" size="15" style="width:35%;"
                                             value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FINICAM}"/>"
                                             name="FINICAM" id="FINICAM"
                                             title="<axis:alt f='axisage010' c='FINICAM' lit='9000526'/>"
                                             alt="<axis:alt f='axisage010' c='FINICAM' lit='9000526'/>" 
                                             <axis:atr f="axisage010" c="FINICAM" a="obligatorio=true&formato=fecha"/> />
                                             <a style="vertical-align:middle;">
                                        <img id="icon_FINICAM" alt='<axis:alt f="axisage010" c="FINICAM" lit="9000526"/>'
                                             title='<axis:alt f="axisage010" c="FINICAM" lit="9000526" />'
                                             src="images/calendar.gif"/></a>
                                    </td>
                                  </axis:ocultar>
                                  <axis:ocultar f="axisage010" c="FFINCAM">
                                    <td class="campocaja">
                                      <input type="text" class="campo campotexto" size="15" style="width:35%;"
                                             value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FFINCAM}"/>"
                                             name="FFINCAM" id="FFINCAM"
                                             title="<axis:alt f='axisage010' c='FFINCAM' lit='9000527'/>"
                                             alt="<axis:alt f='axisage010' c='FFINCAM' lit='9000527'/>" 
                                             <axis:atr f="axisage010" c="FFINCAM" a="formato=fecha"/> onchange="f_validar_fecha_pro()"/>
                                             <a style="vertical-align:middle;">
                                        <img id="icon_FFINCAM" alt='<axis:alt f="axisage010" c="FFINCAM" lit="9000527"/>'
                                             title='<axis:alt f="axisage010" c="FFINCAM" lit="9000527" />'
                                             src="images/calendar.gif"/></a>
                                    </td>
                                  </axis:ocultar>
                                  <axis:ocultar f="axisage010" c="FINIREC">
                                    <td class="campocaja">
                                      <input type="text" class="campo campotexto" size="15" style="width:35%;"
                                             value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FINIREC}"/>"
                                             name="FINIREC" id="FINIREC"
                                             title="<axis:alt f='axisage010' c='FINIREC' lit='9908878'/>"
                                             alt="<axis:alt f='axisage010' c='FINIREC' lit='9908878'/>" 
                                             <axis:atr f="axisage010" c="FINIREC" a="formato=fecha"/> />
                                             <a style="vertical-align:middle;">
                                        <img id="icon_FINIREC" alt='<axis:alt f="axisage010" c="FINIREC" lit="9908878"/>'
                                             title='<axis:alt f="axisage010" c="FINIREC" lit="9908878" />'
                                             src="images/calendar.gif"/></a>
 
 
                                    </td>
                                  </axis:ocultar>
                                 <axis:ocultar f="axisage010" c="FFINREC">
                                    <td class="campocaja">
                                      <input type="text" class="campo campotexto" size="15" style="width:35%;"
                                             value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FFINREC}"/>"
                                             name="FFINREC" id="FFINREC"
                                             title="<axis:alt f='axisage010' c='FFINREC' lit='9908879'/>"
                                             alt="<axis:alt f='axisage010' c='FFINREC' lit='9908879'/>" 
                                             <axis:atr f="axisage010" c="FFINREC" a="formato=fecha"/> onchange="f_validar_fecha_rec()"/>
                                             <a style="vertical-align:middle;">
                                        <img id="icon_FFINREC" alt='<axis:alt f="axisage010" c="FFINREC" lit="9908879"/>'
                                             title='<axis:alt f="axisage010" c="FFINREC" lit="9908879" />'
                                             src="images/calendar.gif"/></a>
                                    </td>
                                  </axis:ocultar>
                                </tr>
                              </table>
                            </td>
                          </tr>
                          <tr>
                            <td class="campocaja">
                                <img id="DSP_CAMPAPRD_parent" src="images/menys.gif" 
                                     onclick="objEstilos.toggleDisplay('DSP_CAMPAPRD', this)" 
                                     style="cursor:pointer"/> 
                                <b><axis:alt f="axisage010" c="LIT_IMG_1" lit="102177" /> - 
                                   <axis:alt f="axisage010" c="LIT_IMG_1" lit="108357" /></b>
                                   <div style="float:right;" id="DATOS_CAMPAPRD">
                                        <img id="DSP_CAMPAPRD_parent" src="images/new.gif" 
                                             onclick="f_anyadir_producto()" style="cursor:pointer"/>
                                   </div>
                                <hr class="titulo">    
                            <td>
                          </tr>
                          <tr id="DSP_CAMPAPRD_children" style="display:yes">
                            <td>
                                <c:set var="title0"><axis:alt f="axisage010" c="SPRODUC" lit="102177"/></c:set>
                                <c:set var="title1"><axis:alt f="axisage010" c="CGARANT" lit="108357"/></c:set>
                                <div class="seccion displayspaceGrande">
                                 <display:table name="${__formdata.CAMPAPRD}" id="campaprdListId" 
                                    export="false" class="dsptgtable" pagesize="-1"  sort="list" 
                                    cellpadding="0" cellspacing="0" requestURI="" >
                                    <%@ include file="../include/displaytag.jsp"%>
                                        <axis:visible f="axisage010" c="SPRODUC">
                                            <display:column title="${title0}" sortable="true" 
                                                            headerClass="sortable" media="html" autolink="false" 
                                                            sortProperty="OB_IAX_CAMPANAS.SPRODUC"
                                                            style="width:50%">
                                                <div class="dspText">${campaprdListId.OB_IAX_CAMPAPRD.SPRODUC} ${campaprdListId.OB_IAX_CAMPAPRD.TPRODUC}</div>
                                                <div class="dspText"></div>
                                            </display:column>
                                        </axis:visible>
                                        <axis:visible f="axisage010" c="CGARANT">
                                            <display:column title="${title1}" sortable="true" 
                                                            headerClass="sortable" media="html" autolink="false" 
                                                            sortProperty="OB_IAX_CAMPANAS.CGARANT"
                                                            style="width:50%">
                                                <c:if test="${campaprdListId.OB_IAX_CAMPAPRD.CGARANT != '-1'}"> 
                                                    <div class="dspText">${campaprdListId.OB_IAX_CAMPAPRD.CGARANT} ${campaprdListId.OB_IAX_CAMPAPRD.TGARANT}</div>
                                                </c:if>
                                            </display:column>
                                        </axis:visible>
                                 </display:table> 
                                </div>    
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <table class="area" align="center">
                                    <tr>
                                      <th style="width:15%;height:0%;"></th>
                                      <th style="width:15%;height:0%;"></th>
                                      <th style="width:15%;height:0%;"></th>
                                      <th style="width:15%;height:0%;"></th>
                                      <th style="width:15%;height:0%;"></th>
                                      <th style="width:15%;height:0%;"></th>
                                    </tr>
                                    <tr>
                                        <axis:ocultar f="axisage010" c="IVALINI">
                                            <td class="titulocaja">
                                              <b><axis:alt f="axisage010" c="IVALINI" lit="9902339"/></b>
                                            </td>
                                        </axis:ocultar>
                                        <axis:ocultar f="axisage010" c="IPREMIO">
                                            <td class="titulocaja">
                                              <b><axis:alt f="axisage010" c="IPREMIO" lit="9902340"/></b>
                                            </td>
                                        </axis:ocultar>
                                        <axis:ocultar f="axisage010" c="IVTAPRV">
                                            <td class="titulocaja">
                                              <b><axis:alt f="axisage010" c="IVTAPRV" lit="9902341"/></b>
                                            </td>
                                        </axis:ocultar>
                                        <axis:ocultar f="axisage010" c="IVTAREA">
                                            <td class="titulocaja">
                                              <b><axis:alt f="axisage010" c="IVTAREA" lit="9906650"/></b>
                                            </td>
                                        </axis:ocultar>
                                        <axis:ocultar f="axisage010" c="NAGECAM">
                                            <td class="titulocaja">
                                              <b><axis:alt f="axisage010" c="NAGECAM" lit="9906651"/></b>
                                            </td>
                                        </axis:ocultar>
                                        <axis:ocultar f="axisage010" c="NAGEGAN">
                                            <td class="titulocaja">
                                              <b><axis:alt f="axisage010" c="NAGEGAN" lit="9906652"/></b>
                                            </td>
                                        </axis:ocultar>
                                    </tr>
                                    <tr>
                                        <axis:ocultar f="axisage010" c="IVALINI">
                                           <td class="campocaja">
                                             <input id="IVALINI" name="IVALINI" type="text" class="campo campotexto" 
                                                    title=<axis:alt f="axisage010" c="IVALINI" lit="9902339"/>
                                                    alt=<axis:alt f="axisage010" c="IVALINI" lit="9902339"/>
                                                    value="${__formdata.IVALINI}"/>
                                           </td>
                                        </axis:ocultar>
                                        <axis:ocultar f="axisage010" c="IPREMIO">
                                           <td class="campocaja">
                                             <input id="IPREMIO" name="IPREMIO" type="text" class="campo campotexto" 
                                                    title=<axis:alt f="axisage010" c="IPREMIO" lit="9902340"/>
                                                    alt=<axis:alt f="axisage010" c="IPREMIO" lit="9902340"/>
                                                    value="${__formdata.IPREMIO}"/>
                                           </td>
                                        </axis:ocultar>
                                        <axis:ocultar f="axisage010" c="IVTAPRV">
                                           <td class="campocaja">
                                             <input id="IVTAPRV" name="IVTAPRV" type="text" class="campo campotexto" 
                                                    title=<axis:alt f="axisage010" c="IVTAPRV" lit="9902341"/>
                                                    alt=<axis:alt f="axisage010" c="IVTAPRV" lit="9902341"/>
                                                    value="${__formdata.IVTAPRV}"/>
                                           </td>
                                        </axis:ocultar>
                                        <axis:ocultar f="axisage010" c="IVTAREA">
                                           <td class="campocaja">
                                             <input id="IVTAREA" name="IVTAREA" type="text" class="campo campotexto" 
                                                    title=<axis:alt f="axisage010" c="IVTAREA" lit="9906650"/>
                                                    alt=<axis:alt f="axisage010" c="IVTAREA" lit="9906650"/>
                                                    value="${__formdata.IVTAREA}"/>
                                           </td>
                                        </axis:ocultar>
                                        <axis:ocultar f="axisage010" c="NAGECAM">
                                           <td class="campocaja">
                                             <input id="NAGECAM" name="NAGECAM" type="text" class="campo campotexto" 
                                                    title=<axis:alt f="axisage010" c="NAGECAM" lit="9906651"/>
                                                    alt=<axis:alt f="axisage010" c="NAGECAM" lit="9906651"/>
                                                    value="${__formdata.NAGECAM}"/>
                                           </td>
                                        </axis:ocultar>
                                        <axis:ocultar f="axisage010" c="NAGEGAN">
                                           <td class="campocaja">
                                             <input id="NAGEGAN" name="NAGEGAN" type="text" class="campo campotexto" 
                                                    title=<axis:alt f="axisage010" c="NAGEGAN" lit="9906652"/>
                                                    alt=<axis:alt f="axisage010" c="NAGEGAN" lit="9906652"/>
                                                    value="${__formdata.NAGEGAN}"/>
                                           </td>
                                        </axis:ocultar>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <table class="area" align="center">
                                    <tr>
                                      <th style="width:25%;height:0%;"></th>
                                      <th style="width:75%;height:0%;"></th>
                                    </tr>
                                    <tr>
                                        <axis:ocultar f="axisage010" c="CMEDIOS">
                                            <td class="titulocaja">
                                              <b><axis:alt f="axisage010" c="CMEDIOS" lit="9902344"/></b>
                                            </td>
                                        </axis:ocultar>
                                        <axis:ocultar f="axisage010" c="TOBSERV">
                                            <td class="titulocaja">
                                              <b><axis:alt f="axisage010" c="TOBSERV" lit="101162"/></b>
                                            </td>
                                        </axis:ocultar>
                                    </tr>
                                    <tr>
                                        <axis:visible c="CMEDIOS" f="axisage010">
                                        <td class="campocaja">
                                            <c:forEach items="${__formdata.medios}" var="item">
                                                    <input type="checkbox" name="CMEDIO_${item.key}" 
                                                           id="CMEDIO_${item.key}" value="${item.value.valor}"
                                                           <c:if test="${item.value.valor}">checked="checked"</c:if>
                                                           onClick="javascript:actualitzarCheckbox(this)">
                                                           ${item.value.tatribu} 
                                                    </input>
                                                    <br/>
                                            </c:forEach>
                                        </td>
                                        </axis:visible>
                                        <axis:ocultar f="axisage010" c="TOBSERV">
                                           <td class="campocaja">
                                             <textarea class="campowidthinput campo campotexto"  
                                                       <axis:atr f="axispsu003" c="TOBSERV" a="modificable=true&isInputText=false"/> 
                                                       style="width:100%;" name="TOBSERV" id="TOBSERV" cols="100" rows="4">
                                                       ${__formdata.TOBSERV}
                                            </textarea>
                                           </td>
                                        </axis:ocultar>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td class="campocaja">
                                <img id="DSP_CAMPAAGE_parent" src="images/menys.gif" 
                                     onclick="objEstilos.toggleDisplay('DSP_CAMPAAGE', this)" 
                                     style="cursor:pointer"/> 
                                <b>Agentes asignados</b>
                                <hr class="titulo">    
                            <td>
                        <tr id="DSP_CAMPAAGE_children" style="display:yes">
                            <td>
                                <c:set var="title0"><axis:alt f="axisage010" c="CCODIGO" lit="103465"/></c:set>
                                <c:set var="title1"><axis:alt f="axisage010" c="CAGENTE" lit="100584"/></c:set>
                                <c:set var="title2"><axis:alt f="axisage010" c="FINICAM" lit="9000526"/></c:set>
                                <c:set var="title3"><axis:alt f="axisage010" c="FFINCAM" lit="9000527"/></c:set>
                                <c:set var="title4"><axis:alt f="axisage010" c="IMPRIMIR" lit="100001"/>
 
                                                    <input type="checkbox" name="IMPRIMIR_ALL" 
                                                           id="IMPRIMIR_ALL" value="true"
                                                           checked="checked"
                                                           onClick="javascript:selectAll()">                                                           
                                                    </input>                                                                                                                                      
                                </c:set>
                                <div class="seccion displayspaceGrande">
                                 <%int cont = 0;%>
                                 <display:table name="${__formdata.CAMPAAGE}" id="campaageListId" 
                                    export="false" class="dsptgtable" pagesize="-1"  sort="list" 
                                    cellpadding="0" cellspacing="0" requestURI="" >                                    
                                    <%@ include file="../include/displaytag.jsp"%>    
                                    <c:set var="i"><%=cont%></c:set>                                
                                        <axis:visible f="axisage010" c="CCODIGO">
                                            <display:column title="${title0}" sortable="true" 
                                                            headerClass="sortable" media="html" autolink="false" 
                                                            sortProperty="OB_IAX_CAMPAAGE.CCODIGO"
                                                            style="width:150px">
                                                <div class="dspText">${campaageListId.OB_IAX_CAMPAAGE.CCODIGO}</div>
                                            </display:column>
                                        </axis:visible>
                                        <axis:visible f="axisage010" c="CAGENTE">
                                            <display:column title="${title1}" sortable="true" 
                                                            headerClass="sortable" media="html" autolink="false" 
                                                            sortProperty="OB_IAX_CAMPAAGE.CAGENTE"
                                                            style="width:40%">
                                                <div class="dspText">${campaageListId.OB_IAX_CAMPAAGE.CAGENTE} 
                                                                     ${campaageListId.OB_IAX_CAMPAAGE.TAGENTE}</div>
                                            </display:column>
                                        </axis:visible>
                                        <axis:visible f="axisage010" c="FINICAM">
                                            
                                            <display:column title="${title2}" sortable="true" 
                                                            headerClass="sortable" media="html" autolink="false" 
                                                            sortProperty="OB_IAX_CAMPAAGE.FINICAM"
                                                            style="width:150px">
                                                <div class="dspDate">
                                                    <fmt:formatDate value="${campaageListId.OB_IAX_CAMPAAGE.FINICAM}" pattern="dd/MM/yyyy"/>
                                                </div>
                                            </display:column>
                                        </axis:visible>
                                        <axis:visible f="axisage010" c="FFINCAM">
                                            <display:column title="${title3}" sortable="true" 
                                                            headerClass="sortable" media="html" autolink="false" 
                                                            sortProperty="OB_IAX_CAMPAAGE.FFINCAM"
                                                            style="width:150px">
                                                <div class="dspDate">
                                                    <fmt:formatDate value="${campaageListId.OB_IAX_CAMPAAGE.FFINCAM}" pattern="dd/MM/yyyy"/>
                                                </div>
                                            </display:column>
                                        </axis:visible>
                                        <axis:visible f="axisage010" c="IMPRIMIR">
                                            <display:column title="${title4}" sortable="false" 
                                                            headerClass="sortable" media="html" autolink="false"                                                             
                                                            style="width:150px">
                                                <div class="dspText">   
                                                    <input type="hidden" name="FFINCAM_${i}" 
                                                           id="FFINCAM_${i}" value="${campaageListId.OB_IAX_CAMPAAGE.FFINCAM}">
                                                    </input>   
                                                    <input type="hidden" name="FINICAM_${i}" 
                                                           id="FINICAM_${i}" value="${campaageListId.OB_IAX_CAMPAAGE.FINICAM}">
                                                    </input>   
                                                    <input type="hidden" name="CAGENTE_${i}" 
                                                           id="CAGENTE_${i}" value="${campaageListId.OB_IAX_CAMPAAGE.CAGENTE}">
                                                    </input>                                                          
                                                    <input type="checkbox" name="IMPRIMIR_${i}" 
                                                           id="IMPRIMIR_${i}" value="true" class="cosa"
                                                           checked="checked"
                                                           onClick="javascript:actualitzarCheckbox(this)">
                                                    </input>                                                                                        
                                                    <% cont ++ ;%>
                                                </div>                                                
                                            </display:column>
                                        </axis:visible>                                        
                                 </display:table> 
                                </div>    
                                <div class="separador">&nbsp;</div>
                            </td>
                        </tr>
                        <tr>
                            <td class="campocaja">
                                <img id="DSP_GANADOR_parent" src="images/mes.gif" 
                                      onclick="objEstilos.toggleDisplay('DSP_GANADOR', this)" style="cursor:pointer"/> 
                                <b>Agentes ganadores</b>
                                <div style="float:right;" id="DATOS_CAMPAAGE_GANADOR">
                                    <img id="DSP_CAMPAAGE_GANADOR_parent" src="images/new.gif" 
                                         onclick="f_anyadir_agenteGanador()" style="cursor:pointer"/>
                                </div>
                                <hr class="titulo">    
                            </td>
                        </tr>
                        <tr id="DSP_GANADOR_children" style="display:none">
                            <td>
                                <c:set var="title0"><axis:alt f="axisage010" c="CCODIGO" lit="103465"/></c:set>
                                <c:set var="title1"><axis:alt f="axisage010" c="CAGENTE" lit="100584"/></c:set>
                                <c:set var="title2"><axis:alt f="axisage010" c="FINICAM" lit="9000526"/></c:set>
                                <c:set var="title3"><axis:alt f="axisage010" c="FFINCAM" lit="9000527"/></c:set>
                                <div class="seccion displayspaceGrande">
                                 <display:table name="${__formdata.CAMPAAGE_GANADOR}" id="campaageGanadorListId" 
                                    export="false" class="dsptgtable" pagesize="-1"  sort="list" 
                                    cellpadding="0" cellspacing="0" requestURI="" >
                                    <%@ include file="../include/displaytag.jsp"%>
                                        <axis:visible f="axisage010" c="CCODIGO">
                                            <display:column title="${title0}" sortable="true" 
                                                            headerClass="sortable" media="html" autolink="false" 
                                                            sortProperty="OB_IAX_CAMPAAGE_GANADOR.CCODIGO"
                                                            style="width:150px">
                                                <div class="dspText">${campaageGanadorListId.OB_IAX_CAMPAAGE_GANADOR.CCODIGO}</div>
                                            </display:column>
                                        </axis:visible>
                                        <axis:visible f="axisage010" c="CAGENTE">
                                            <display:column title="${title1}" sortable="true" 
                                                            headerClass="sortable" media="html" autolink="false" 
                                                            sortProperty="OB_IAX_CAMPAAGE_GANADOR.CAGENTE"
                                                            style="width:40%">
                                                <div class="dspText">${campaageGanadorListId.OB_IAX_CAMPAAGE_GANADOR.CAGENTE} 
                                                                     ${campaageGanadorListId.OB_IAX_CAMPAAGE_GANADOR.TAGENTE}</div>
                                            </display:column>
                                        </axis:visible>
                                        <axis:visible f="axisage010" c="FINICAM">
                                            
                                            <display:column title="${title2}" sortable="true" 
                                                            headerClass="sortable" media="html" autolink="false" 
                                                            sortProperty="OB_IAX_CAMPAAGE_GANADOR.FINICAM"
                                                            style="width:150px">
                                                <div class="dspDate">
                                                    <fmt:formatDate value="${campaageGanadorListId.OB_IAX_CAMPAAGE_GANADOR.FINICAM}" pattern="dd/MM/yyyy"/>
                                                </div>
                                            </display:column>
                                        </axis:visible>
                                        <axis:visible f="axisage010" c="FFINCAM">
                                            <display:column title="${title3}" sortable="true" 
                                                            headerClass="sortable" media="html" autolink="false" 
                                                            sortProperty="OB_IAX_CAMPAAGE_GANADOR.FFINCAM"
                                                            style="width:150px">
                                                <div class="dspDate">
                                                    <fmt:formatDate value="${campaageGanadorListId.OB_IAX_CAMPAAGE_GANADOR.FFINCAM}" pattern="dd/MM/yyyy"/>
                                                </div>
                                            </display:column>
                                        </axis:visible>
                                 </display:table> 
                                </div>    
                                <div class="separador">&nbsp;</div>
                            </td>
                        </tr>
                        <tr>
                            <td class="campocaja">
                                <img id="DSP_CAMPADOC_parent" src="images/mes.gif" 
                                      onclick="objEstilos.toggleDisplay('DSP_CAMPADOC', this)" style="cursor:pointer"/>
                                <b>Documentación</b>
                                
                                <hr class="titulo">    
                            </td>
                        </tr>
                        <tr id="DSP_CAMPADOC_children" style="display:none">
                            <td>
                                <c:set var="title0"><axis:alt f="axisage010" c="TNOMBRE" lit="9001358"/></c:set>
                                 <div class="seccion displayspaceGrande">
                                 <display:table name="${__formdata.PLISTDOCUMENTOS}" id="documentosListId" 
                                    export="false" class="dsptgtable" pagesize="-1"  sort="list" 
                                    cellpadding="0" cellspacing="0" requestURI="" >
                                    <%@ include file="../include/displaytag.jsp"%>
                                        <axis:visible f="axisage010" c="TNOMBRE">
                                            <display:column title="${title0}" sortable="true" 
                                                            headerClass="sortable" media="html" autolink="false" 
                                                            sortProperty="TNOMBRE"
                                                            style="width:100%">
                                                <div class="dspText">${documentosListId.TNOMBRE}</div>
                                            </display:column>
                                        </axis:visible>
                                </display:table>
                                </div>
                                <div class="separador">&nbsp;</div>
                            </td>
                        </tr>
                        
                        <tr>
                            <td class="campocaja">
                                <img id="DSP_EXCEPCIONES_parent" src="images/mes.gif" 
                                      onclick="objEstilos.toggleDisplay('DSP_EXCEPCIONES', this); objEstilos.toggleDisplay('DSP_EXCEPCIONES2', this);" style="cursor:pointer"/>
                                <b>Excepciones</b>
                                <hr class="titulo">    
                            </td>
                        </tr>
                        <tr id="DSP_EXCEPCIONES_children" style="display:none">
                             <axis:visible c="CEXCCRR" f="axisage010" >
                                <td class="campocaja" id="td_CHECK" >
                                    <input onClick="f_actualizar_check1(this)" 
                                        <axis:atr f="axisage010" c="CEXCCRR" a="modificable=true&obligatorio=false&isInputText=false"/>
                                        <c:if test="${__formdata.CEXCCRR == 1 }"> checked </c:if> 
                                         type="checkbox" id="CEXCCRR" name="CEXCCRR" value="${__formdata.CEXCCRR}" />
                                         <axis:alt f="axisage010" c="CEXCCRR" lit="9908883"/>
                                </td>                  
                            </axis:visible>                             
                        </tr>
                        
                        <tr id="DSP_EXCEPCIONES2_children" style="display:none">
                            <axis:visible c="CEXCNEWP" f="axisage010"  > 
                                <td class="campocaja" id="td_CHECK" > 
                                    <input onClick="f_actualizar_check2(this)" 
                                        <axis:atr f="axisage010" c="CEXCNEWP" a="modificable=true&obligatorio=false&isInputText=false"/>
                                        <c:if test="${__formdata.CEXCNEWP == 1 }"> checked </c:if> 
                                         type="checkbox" id="CEXCNEWP" name="CEXCNEWP" value="${__formdata.CEXCNEWP}" />
                                         <axis:alt f="axisage010" c="CEXCNEWP" lit="9908887"/>
                                </td>
                            </axis:visible>
                        </tr>                             
                              
                             
                    </table> 
                    
                   
                    
                    
                    
            </table>
            
            
            <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisage010</c:param><c:param name="f">axisage010</c:param>
                <c:param name="__botones">cancelar,9902356,9001304,aceptar,9902357,9902358</c:param>
            </c:import>
        </form>
        <c:import url="../include/mensajes.jsp" />
        <script type="text/javascript">
              Calendar.setup( {
                  inputField : "FINICAM", ifFormat : "%d/%m/%Y", button : "icon_FINICAM", singleClick : true, firstDay : 1
              });
                  Calendar.setup( {
                      inputField : "FFINCAM", ifFormat : "%d/%m/%Y", button : "icon_FFINCAM", singleClick : true, firstDay : 1
                  });
                  Calendar.setup( {
                      inputField : "FINIREC", ifFormat : "%d/%m/%Y", button : "icon_FINIREC", singleClick : true, firstDay : 1
                  });
                  Calendar.setup( {
                      inputField : "FFINREC", ifFormat : "%d/%m/%Y", button : "icon_FFINREC", singleClick : true, firstDay : 1
                  });
        </script>    
    </body>
</html>
