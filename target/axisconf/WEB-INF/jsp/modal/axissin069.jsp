<%/* Revision:# MP8BWwjj9vm3L468jjopAQ== # */%>

<%--
/**
*  Fichero: axissin069.jsp
*  
*  Titulo: Modal mantetenimniento personas relacionadas proceso judicial
*
*  Fecha: 03/03/2009
*/
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ page import="java.util.*" %>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>
<%@ page contentType="text/html;charset=iso-8859-15" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
    <title><axis:alt c="titulo" f="axissin069" lit="9909366"/></title>
    <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
    <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
    <link rel="stylesheet" href="styles/displaytag.css">
    <c:import url="../include/carga_framework_js.jsp"/>
    
    <script type="text/javascript">
    
            
        function f_onload() { 
         if (${requestScope.grabarOK == true}) {
        	 
                    //parent.f_aceptar_axissin069();
               //INI AXIS-AXIS-3597 EA 2019-05-13 SE AGREGARON FUNCIONES PARA REALIZAR EDICION MODIFICACION Y ELIMINACION DE (Beneficiarios y Demandado(s) / Demandante(s)) SIN AFECTAR EL RESTO DEL LA PANTALLA
        	 if(document.getElementById("tdpersonasBenef2").innerHTML!="null"){
            	 parent.document.getElementById("tdpersonasBenef").innerHTML=document.getElementById("tdpersonasBenef2").innerHTML;
            	 document.getElementById("tdpersonasBenef2").innerHTML="";
            	 }
            	 if(document.getElementById("tdpersonasDeman2").innerHTML!=undefined){
            	 parent.document.getElementById("tdpersonasDeman").innerHTML=document.getElementById("tdpersonasDeman2").innerHTML;
            	 document.getElementById("tdpersonasDeman2").innerHTML="";
             	}
            	 parent.f_cerrar_modal("axissin069");
			// FIN AXIS-AXIS-3597 EA 2019-05-13 SE AGREGARON FUNCIONES PARA REALIZAR EDICION MODIFICACION Y ELIMINACION DE (Beneficiarios y Demandado(s) / Demandante(s)) SIN AFECTAR EL RESTO DEL LA PANTALLA
                    
                    
        }
        f_cargar_propiedades_pantalla(); 
    

        f_campos_adicionales(TIPO);

        }
        
        function f_but_aceptar(){
            if (objValidador.validaEntrada()) {
                      objUtiles.ejecutarFormulario ("modal_axissin069.do", "guardar", document.Axissin0069Form, "_self", objJsMessages.jslit_cargando);

            }
        }
        function f_campos_adicionales(){
            var TIPO =objDom.getValorPorId('TIPO');
            if(TIPO == 2){
               objDom.setVisibilidadPorId("IIMPORTE_td", "visible");  
               objDom.setVisibilidadPorId("IIMPORTE_tit", "visible");

            }else{
               objDom.setVisibilidadPorId("IIMPORTE_td", "hidden");
               objDom.setVisibilidadPorId("IIMPORTE_tit", "hidden");
            }
        }
        function f_but_cancelar(){
            parent.f_cerrar_modal("axissin069");
        }

	
    </script>
</head>
<body onload="javascript:f_onload()">
<!-- INI AXIS-AXIS-3597 EA 2019-05-13 SE AGREGARON FUNCIONES PARA REALIZAR EDICION MODIFICACION Y ELIMINACION DE (Beneficiarios y Demandado(s) / Demandante(s)) SIN AFECTAR EL RESTO DEL LA PANTALLA -->
<div style="display:none">

 <c:set var="title0"><axis:alt f="axissin068" c="TTIPPER" lit="9906386" /></c:set><!-- Tipo de persona -->
                                            <c:set var="title1"><axis:alt f="axissin068" c="NNUMIDE" lit="9905773" /></c:set><!--Numero identificacion-->
                                            <c:set var="title2"><axis:alt f="axissin068" c="TNOMBRE" lit="105940" /></c:set> <!-- Nombre de la persona-->
                                            <c:set var="title3"><axis:alt f="axissin068" c="IIMPORTE" lit="9905283" /></c:set> <!-- Importe a pagar-->
                                            
                                            <c:set var="lista_personas" value="${__formdata.personasDeman}" />
                                            <div class="displayspace"  id="tdpersonasDeman2">
                                              <display:table name="${lista_personas}" id="DETPER_PJ" export="false" class="dsptgtable" pagesize="-1"  sort="list" cellpadding="0" cellspacing="0"
                                               requestURI="">
                                                <%@ include file="../include/displaytag.jsp"%>
                                                <display:column title="${title0}" sortable="true" sortProperty="TTIPPER" headerClass="sortable" media="html" autolink="false" >
                                                     <div class="dspText">${DETPER_PJ.OB_IAX_SIN_T_JUDICIAL_DETPER.TTIPPER}</div>    
                                                </display:column>
                                                <display:column title="${title1}" sortable="true" sortProperty="NNUMIDE" headerClass="sortable" media="html" autolink="false" >
                                                     <div class="dspText">${DETPER_PJ.OB_IAX_SIN_T_JUDICIAL_DETPER.NNUMIDE}</div>    
                                                </display:column>    

                                                <display:column title="${title2}" sortable="true" sortProperty="TNOMBRE" headerClass="sortable" media="html" autolink="false" >
                                                     <div class="dspText">${DETPER_PJ.OB_IAX_SIN_T_JUDICIAL_DETPER.TNOMBRE}</div>    
                                                </display:column>												
                                                
                                                <axis:visible f="axissin068" c="BT_SIN_EDITAR_DETPER_PJ"> <!--boton editar persona asociada -->
                                                <display:column title="${title7}" headerClass="headwidth5 sortable" media="html" autolink="false" >
                                                    <c:if test="${(!empty DETPER_PJ.OB_IAX_SIN_T_JUDICIAL_DETPER.NNUMIDE)}">
                                                        <div class="dspIcons" id="BT_SIN_EDITAR_DETPER_PJ"><img border="0" alt="<axis:alt f="axissin068" c="BT_SIN_EDITAR_DETPER_PJ" lit="100002"/>" title1="<axis:alt f="axissin006" c="BT_SIN_EDITAR_DETPER_PJ" lit="100002"/>" src="images/lapiz.gif" width="15px" height="15px"
                                                        style="cursor:pointer;" onclick="javascript:objUtiles.abrirModal('axissin069','src', 'modal_axissin069.do?operation=init&isNew=0&NSINIES='+'${__formdata.NSINIES}'+'&NTRAMIT='+'${__formdata.NTRAMIT}'+'&NORDEN='+'${__formdata.NORDEN}'+'&NNUMIDE='+'${DETPER_PJ.OB_IAX_SIN_T_JUDICIAL_DETPER.NNUMIDE}'+'&TNOMBRE='+'${DETPER_PJ.OB_IAX_SIN_T_JUDICIAL_DETPER.TNOMBRE}'+'&NTIPPER='+'${DETPER_PJ.OB_IAX_SIN_T_JUDICIAL_DETPER.NTIPPER}'+'&TIPO=1&NPERSONA='+'${DETPER_PJ.OB_IAX_SIN_T_JUDICIAL_DETPER.NPERSONA}');"/></div>
                                                    </c:if>
                                                </display:column> 
                                                </axis:visible>
                                               
                                                <axis:visible f="axissin006" c="BT_SIN_ELIMINAR_DETPER_PJ"> <!--boton Eliminar beneficiario asociado -->
                                                <display:column title="" headerClass="headwidth5 sortable" media="html" autolink="false" >
                                                   <c:if test="${!empty DETPER_PJ.OB_IAX_SIN_T_JUDICIAL_DETPER.NNUMIDE}">
                                                    <div class="dspIcons"><img border="0"  src="images/delete.gif" width="15px" height="15px"
                                                    style="cursor:pointer;" onclick="f_borrar_val_axissin069('&NVALOR='+'${DETPER_PJ.OB_IAX_SIN_T_JUDICIAL_DETPER.NPERSONA}');this.parentElement.parentElement.parentElement.remove();"/>
                                                    </div>
                                                    </c:if>
                                                </display:column> 
                                                </axis:visible>
                                        
                                               
                                            </display:table>
                                            </div>
                                            
                                            
                                            <c:set var="title0"><axis:alt f="axissin068" c="TTIPPER" lit="9906386" /></c:set><!-- Tipo de persona -->
                                            <c:set var="title1"><axis:alt f="axissin068" c="NNUMIDE" lit="9905773" /></c:set><!--Numero identificacion-->
                                            <c:set var="title2"><axis:alt f="axissin068" c="TNOMBRE" lit="105940" /></c:set> <!-- Nombre de la persona-->
                                            <c:set var="title3"><axis:alt f="axissin068" c="IIMPORTE" lit="9905283" /></c:set> <!-- Importe a pagar-->
                                            <c:set var="lista_personas1" value="${__formdata.personasBenef}" />
                                            <div class="displayspace" id="tdpersonasBenef2">
                                            
                                              <display:table name="${lista_personas1}" id="DETPER_BENEF" export="false" class="dsptgtable" pagesize="-1"  sort="list" cellpadding="0" cellspacing="0"
                                               requestURI="">
                                               
                                                <%@ include file="../include/displaytag.jsp"%>
                                               
                                                <display:column title="${title0}" sortable="true" sortProperty="TTIPPER" headerClass="sortable" media="html" autolink="false" >
                                                     <div class="dspText">${DETPER_BENEF.OB_IAX_SIN_T_JUDICIAL_DETPER.TTIPPER}</div>    
                                                </display:column>
                                                <display:column title="${title1}" sortable="true" sortProperty="NNUMIDE" headerClass="sortable" media="html" autolink="false" >
                                                     <div class="dspText">${DETPER_BENEF.OB_IAX_SIN_T_JUDICIAL_DETPER.NNUMIDE}</div>    
                                                </display:column>    

                                                <display:column title="${title2}" sortable="true" sortProperty="TNOMBRE" headerClass="sortable" media="html" autolink="false" >
                                                     <div class="dspText">${DETPER_BENEF.OB_IAX_SIN_T_JUDICIAL_DETPER.TNOMBRE}</div>    
                                                </display:column>
                                                
                                                <display:column title="${title3}" sortable="true" sortProperty="IIMPORTE" headerClass="sortable" media="html" autolink="false" >
                                                     <div class="dspText">${DETPER_BENEF.OB_IAX_SIN_T_JUDICIAL_DETPER.IIMPORTE}</div>    
                                                </display:column>	
                                                
                                                <axis:visible f="axissin068" c="BT_SIN_EDITAR_BENEF"> <!--boton editar beneficiario -->
                                                <display:column title="${title7}" headerClass="headwidth5 sortable" media="html" autolink="false" >
                                                    <c:if test="${(!empty DETPER_BENEF.OB_IAX_SIN_T_JUDICIAL_DETPER.NNUMIDE)}">
                                                        <div class="dspIcons" id="BT_SIN_EDITAR_BENEF"><img border="0" alt="<axis:alt f="axissin068" c="BT_SIN_EDITAR_BENEF" lit="100002"/>" title1="<axis:alt f="axissin006" c="BT_SIN_EDITAR_BENEF" lit="100002"/>" src="images/lapiz.gif" width="15px" height="15px"
                                                        style="cursor:pointer;" onclick="javascript:objUtiles.abrirModal('axissin069','src', 'modal_axissin069.do?operation=init&TIPO=2&isNew=0&NSINIES='+'${__formdata.NSINIES}'+'&NTRAMIT='+'${__formdata.NTRAMIT}'+'&NORDEN='+'${__formdata.NORDEN}'+'&NNUMIDE='+'${DETPER_BENEF.OB_IAX_SIN_T_JUDICIAL_DETPER.NNUMIDE}'+'&TNOMBRE='+'${DETPER_BENEF.OB_IAX_SIN_T_JUDICIAL_DETPER.TNOMBRE}'+'&NTIPPER='+'${DETPER_BENEF.OB_IAX_SIN_T_JUDICIAL_DETPER.NTIPPER}'+'&NPERSONA='+'${DETPER_BENEF.OB_IAX_SIN_T_JUDICIAL_DETPER.NPERSONA}'+'&IIMPORTE='+'${DETPER_BENEF.OB_IAX_SIN_T_JUDICIAL_DETPER.IIMPORTE}');"/></div>
                                                    </c:if>
                                                </display:column> 
                                                </axis:visible>
                                               
                                                <axis:visible f="axissin068" c="BT_SIN_ELIMINAR_BENEF"> <!--boton Eliminar beneficiario asociado -->
                                                <display:column title="" headerClass="headwidth5 sortable" media="html" autolink="false" >
                                                   <c:if test="${!empty DETPER_BENEF.OB_IAX_SIN_T_JUDICIAL_DETPER.NNUMIDE}">
                                                    <div class="dspIcons"><img border="0"  src="images/delete.gif" width="15px" height="15px"
                                                    style="cursor:pointer;"  onclick="f_borrar_val_axissin069('&NVALOR='+'${DETPER_BENEF.OB_IAX_SIN_T_JUDICIAL_DETPER.NPERSONA}');this.parentElement.parentElement.parentElement.remove();"/>
                                                    </div>
                                                    </c:if>
                                                </display:column> 
                                                </axis:visible>
                                              
                                               
                                            </display:table>
                                            </div>
                                            
                                            </div>
      <!-- FIN AXIS-AXIS-3597 EA 2019-05-13 SE AGREGARON FUNCIONES PARA REALIZAR EDICION MODIFICACION Y ELIMINACION DE (Beneficiarios y Demandado(s) / Demandante(s)) SIN AFECTAR EL RESTO DEL LA PANTALLA -->
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
	
    
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
    
    
    <form name="Axissin0069Form" action="" method="POST">
    <input type="hidden" name="operation" value="guardar" />
    <input type="hidden" name="NSINIES" value="${__formdata.NSINIES}"/>
    <input type="hidden" name="NTRAMIT" id="NTRAMIT" value="${__formdata.NTRAMIT}"/>
    <input type="hidden" name="NORDEN" id="NORDEN" value="${__formdata.NORDEN}"/>
    <input type="hidden" name="NPERSONA" id="NPERSONA" value="${__formdata.NPERSONA}"/>
    <input type="hidden" name="TIPO" id="TIPO" value="${__formdata.TIPO}"/>
    <input type="hidden" name="isNew" id="isNew" value="${__formdata.isNew}"/>
    <c:import url="../include/titulo_nt.jsp">
        
        <c:param name="titulo"><axis:alt c="titulo" f="axissin069" lit="9909366"/></c:param>
        <c:param name="formulario"><axis:alt c="form" f="axissin069" lit="9909366"/></c:param>
        <c:param name="form">axissin069</c:param>
        
    </c:import>

  

    <div class="separador">&nbsp;</div>
    <table  class="mainModalDimensions base"  align="center" cellpadding="0" cellspacing="0"><!--id="tabla1" -->
        <tr>
            <td>
                <!-- Seccion -->
                <div class="titulo"> 
                    <img  src="images/flecha.gif"/>
                    <axis:alt c="flecha" f="axissin069" lit="9909218" /> 
                </div>  
                <div class="separador">&nbsp;</div>
                <table class="seccion">
                <tr>
                    <td align="left">
                         <table class="area" align="center"--> <!-- UNO -->
                            <tr>
                                <th style="width:17%;height:0px"></th>
                                <th style="width:17%;height:0px"></th>
                                <th style="width:17%;height:0px"></th>
                                <th style="width:17%;height:0px"></th>
                                <th style="width:17%;height:0px"></th>
                                <th style="width:15%;height:0px"></th>
                                
                            </tr>
                            <tr>
                              <axis:ocultar f="axissin069" c="NNUMIDE" dejarHueco="false"> 
                                  <td class="titulocaja" >
                                        <b><axis:alt f="axissin069" c="NNUMIDE" lit="9904434"></axis:alt></b>
                                  </td>
                              </axis:ocultar>
                               <axis:ocultar f="axissin069" c="TNOMBRE" dejarHueco="false"> 
                                  <td class="titulocaja" >
                                        <b><axis:alt f="axissin069" c="TNOMBRE" lit="9000759"></axis:alt></b>
                                  </td>
                              </axis:ocultar>
                              <axis:ocultar f="axissin069" c="IIMPORTE" dejarHueco="false"> 
                                  <td class="titulocaja" id = "IIMPORTE_tit">
                                        <b><axis:alt f="axissin069" c="IIMPORTE" lit="9905283"></axis:alt></b>
                                  </td>
                              </axis:ocultar>

                            </tr>
                            <tr>               
                                <td class="campocaja">
                                <axis:visible f="axissin069" c="NNUMIDE">
                                    <input type="text" class="campowidthinput campo campotexto" style="width:65%"   id="NNUMIDE" name="NNUMIDE" size="15"   
                                     <axis:atr f="axissin069" c="NNUMIDE" a="modificable=true&obligatorio=true"/>  
                                     value="${__formdata.NNUMIDE}" title="<axis:alt c="NNUMIDE" f="axissin069" lit="9904434" />" 
                                     alt="<axis:alt c="NNUMIDE" f="axissin069" lit="9904434" />" /> 
                                 </axis:visible>
                                </td>
                                <td class="campocaja">
                                <axis:visible f="axissin069" c="TNOMBRE">
                                    <input type="text" class="campowidthinput campo campotexto" style="width:65%"   id="TNOMBRE" name="TNOMBRE" size="15"   
                                     <axis:atr f="axissin069" c="TNOMBRE" a="modificable=true&obligatorio=true"/>  value="${__formdata.TNOMBRE}" 
                                     title="<axis:alt c="TNOMBRE" f="axissin069" lit="9000759" />" 
                                     alt="<axis:alt c="TNOMBRE" f="axissin069" lit="9000759" />" /> 
                                 </axis:visible>
                                </td>
                                <td class="campocaja" id="IIMPORTE_td">
                                <axis:visible f="axissin069" c="IIMPORTE">
                                    <input type="text" class="campowidthinput campo campotexto" style="width:65%"   id="IIMPORTE" name="IIMPORTE" size="5"   
                                     <axis:atr f="axissin069" c="IIMPORTE" a="modificable=true"/>  value="${__formdata.IIMPORTE}" 
                                     title="<axis:alt c="IIMPORTE" f="axissin069" lit="9905283" />" 
                                     alt="<axis:alt c="IIMPORTE" f="axissin069" lit="9905283" />" /> 
                                 </axis:visible>
                                </td>
                               
                              </tr>
                              <tr>
                              <axis:ocultar f="axissin069" c="NTIPPER" dejarHueco="false"> <!-- TODO C -->
                                  <td class="titulocaja" colspan="2" >
                                        <b><axis:alt f="axissin069" c="NTIPPER" lit="9901939"></axis:alt></b>
                                  </td>
                              </axis:ocultar>
                              </tr>
                              <tr>
                                 <axis:ocultar c="NTIPPER" f="axissin069" dejarHueco="false">
                                 <!-- Clase Proceso -->
                                <td class="campocaja" colspan="2">
                                    <select name = "NTIPPER" id="NTIPPER" style="width:100%" size="1"  class="campowidthselect campo campotexto" <axis:atr f="axissin069" c="NTIPPER" a="modificable=true&obligatorio=true"/> 
                                     alt="<axis:alt c="NTIPPER" f="axissin069" lit="9909222" />" title="<axis:alt c="NTIPPER" f="axissin069" lit="9901939" />" > 
                                                <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt c="COMBO_SV" f="axissin069" lit="1000348"/> - </option>
                                                <c:forEach var="clases" items="${__formdata.listaRoles}">
                                                    <option value = "${clases.CATRIBU}"
                                                        <c:if test="${clases.CATRIBU == __formdata.NTIPPER}">selected</c:if>>
                                                        ${clases.TATRIBU}
                                                    </option>
                                                </c:forEach>
                                    </select>
                                </td>  
                                </axis:ocultar>
                             </tr>
                            </table> <!-- UNO -->

            </td>
        </tr>
    </table>
  </td>
</tr>
</table>
    <c:import url="../include/botonera_nt.jsp"><c:param name="f">axissin069</c:param><c:param name="f">axissin069</c:param><c:param name="f">axissin069</c:param><c:param name="__botones">cancelar,aceptar</c:param></c:import>
    </form>
    <script type="text/javascript">

</script>
  <c:import url="../include/mensajes.jsp" />
</body>
</html>
