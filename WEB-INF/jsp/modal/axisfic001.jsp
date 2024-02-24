<%/* Revision:# su7MWbNgCpyZDU+LNfqlng== # */%>
<%-- 
*  Fichero: axisfic001.jsp
*  @author <a href = "mailto:erhernandez@csi-ti.com">Edgar Hernandez</a>
*
*  Fecha: 28/06/2016
*/
--%>
<%@ page contentType="text/html;charset=windows-1252" errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page import="axis.util.Constantes"%>
<%@ page import="java.util.*"%>
<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
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

        function f_onload_axisfic001() {
            
          if (document.referrer.indexOf("main.do")>0) { objSeccion.seccionPorAbrirCookieBorrar("axisfic001");}
            if (document.referrer.indexOf("main.do")>0) { objSeccion.posicionPorColorcarCookieBorrar("axisfic001");}
            f_cargar_propiedades_pantalla();
            revisarEstilos();
            
            
            
            objSeccion.abrirSeccionesPorAbrir("axisfic001");
            objSeccion.colocarPosicionPorColocar("axisfic001");
        }
        
                
        function f_but_aceptar() {
          revisarEstilos();
            parent.f_cerrar_axisfic001();
            formdataSPERSON = '${__formdata.SPERSON}';
            parent.f_aceptar_axisfic001(formdataSPERSON);
        }
        
        function f_but_cancelar() {        
            revisarEstilos();
            parent.f_cerrar_axisfic001();
            formdataSPERSON = '${__formdata.SPERSON}';
           // parent.f_aceptar_axisfic001(formdataSPERSON);
        }             
        
        function f_but_salir() {
          revisarEstilos();
          parent.f_cerrar_axisfic001();
        }
            
        /****************************************************************************************/
        /*********************************** CALLBACK AJAX **************************************/
        /****************************************************************************************/
        
        

        /****************************************************************************************/
        /************************************** MODAL *******************************************/
        /****************************************************************************************/
        // INI - TCS_324B - JLTS - 11/02/2019. Se ajusta para que reciba el parametro de IDIOMA
        function f_but_pers() {
            objUtiles.abrirModal("axisimprimir", "src", "modal_axisimprimir.do?dt=<%=new java.util.Date().getTime()%>&operation=impresion_personas&SPERSON="+document.axisfic001Form.SPERSON.value+"&TIPO=PERSONA_CLIENTE"+"&CIDOOMAREP=8");
        }
        function f_but_pers01() {
            objUtiles.abrirModal("axisimprimir", "src", "modal_axisimprimir.do?dt=<%=new java.util.Date().getTime()%>&operation=impresion_personas&SPERSON="+document.axisfic001Form.SPERSON.value+"&TIPO=PERSONA_CLIENTE"+"&CIDOOMAREP=5");
        }
        function f_cerrar_axisimprimir() {
            objUtiles.cerrarModal("axisimprimir");
        }
        // FIN - TCS_324B - JLTS - 11/02/2019
        /****************************************************************************************/
        /************************************** AXISFIC002****************************************/
        /****************************************************************************************/         
          function f_aceptar_axisfic002(){
              f_cerrar_axisfic002();
              objUtiles.ejecutarFormulario("modal_axisfic001.do", "form", document.axisfic001Form, "_self", objJsMessages.jslit_cargando);
          }
	  //  INI TCS_11;IAXIS-2119 - JLTS - 10/03/2019 - Se ajusta la función
          function f_abrir_axisfic002(selectedSPERSON,selectedSFINANCI, selectedNMOVIMI, selectedCMODO) {
            //alert("Entro selectedSPERSON="+selectedSPERSON+" selectedSFINANCI"+selectedSFINANCI+ " selectedNMOVIMI="+selectedNMOVIMI+" selectedCMODO="+selectedCMODO);
              objUtiles.abrirModal("axisfic002", "src", "modal_axisfic002.do?operation=form&SPERSON="+selectedSPERSON+"&SFINANCI="+selectedSFINANCI+"&NMOVIMI="+selectedNMOVIMI+"&CMODO="+selectedCMODO);
          }
    //  INI TCS_11;IAXIS-2119 - JLTS - 10/03/2019    
          function f_borrar_DIRECCION(CDOMICI,selectedPerson) {
           var answer = confirm(objJsMessages.jslit_confirma_borrar);
           if (answer)
             objUtiles.ejecutarFormulario("axis_axisfic001.do?subpantalla=masdatos&SPERSON="+selectedPerson+"&CDOMICI=" + CDOMICI, "eliminarDireccion", document.miForm, "_self", objJsMessages.jslit_cargando);   
          }  
          function f_cerrar_axisfic002(){
               objUtiles.cerrarModal("axisfic002");
         //  INI TCS_11;IAXIS-2119 - JLTS - 10/03/2019 se incluye el f_onload_axisfic001()
               f_onload_axisfic001();
         //  INI TCS_11;IAXIS-2119 - JLTS - 10/03/2019
          }   
        
        /****************************************************************************************/
        /************************************** AXISFIC003****************************************/
        /****************************************************************************************/         
          function f_aceptar_axisfic003(selectedPerson){
              f_cerrar_axisfic003();
              objUtiles.ejecutarFormulario("modal_axisfic001.do", "form", document.axisfic001Form, "_self", objJsMessages.jslit_cargando);
             
          }
          function f_abrir_axisfic003(selectedSFINANCI, selectedFCORTE, selectedCMODO) {           
              objUtiles.abrirModal("axisfic003", "src", "modal_axisfic003.do?operation=form&SFINANCI="+selectedSFINANCI+"&CMODO="+selectedCMODO);
          }
          //  INI TCS_11;IAXIS-2119 - JLTS - 10/03/2019 - Se incluye f_borrar_fin_general
          function f_borrar_fin_general (selectedSFINANCI, selectedNMOVIMI) {
            var answer = confirm(objJsMessages.jslit_confirma_borrar);
            if (answer) {
              objUtiles.ejecutarFormulario("modal_axisfic001.do?&SFINANCI="+selectedSFINANCI+"&NMOVIMI="+selectedNMOVIMI, "eliminarfin_general", document.axisfic001Form, "_self", objJsMessages.jslit_borrando_registro);
            }
          }
          // INI TCS_11;IAXIS-2119 - JLTS - 10/03/2019
          function f_borrar_declaracion(selectedSFINANCI, selectedFCORTE, selectedCESVALOR, selectedIPATRILIQ, selectedIRENTA) {
            var answer = confirm(objJsMessages.jslit_confirma_borrar);
            if (answer)
              objUtiles.ejecutarFormulario("modal_axisfic001.do?&SFINANCI="+selectedSFINANCI+"&FCORTE="+objUtiles.formateaTimeStamp2(selectedFCORTE)+"&CESVALOR="+selectedCESVALOR+"&IPATRILIQ="+selectedIPATRILIQ+"&IRENTA="+selectedIRENTA, "eliminarrenta", document.axisfic001Form, "_self", objJsMessages.jslit_borrando_registro);  
          }  
          function f_cerrar_axisfic003(){
              objUtiles.cerrarModal("axisfic003"); 
          } 
          
         /****************************************************************************************/
         /************************************** AXISFIC004****************************************/
         /****************************************************************************************/         
          function f_aceptar_axisfic004(selectedPerson){
                f_cerrar_axisfic004();
                objUtiles.ejecutarFormulario("modal_axisfic001.do", "form", document.axisfic001Form, "_self", objJsMessages.jslit_cargando);
          }
          function f_abrir_axisfic004(selectedSFINANCI, selectedFCONSULTA, selectedCFUENTE, CMODO) {           
                objUtiles.abrirModal("axisfic004", "src", "modal_axisfic004.do?operation=form&SFINANCI="+selectedSFINANCI+"&FCONSULTA="+objUtiles.formateaTimeStamp2(selectedFCONSULTA)+"&CFUENTE="+selectedCFUENTE+"&CMODO="+CMODO+"&SPERSON="+'${__formdata.SPERSON}'+"&CAGENTE="+'${__formdata.CAGENTE}');
          }    
          function f_borrar_endeudamiento(selectedSFINANCI, selectedFCONSULTA, selectedCFUENTE) {
            var answer = confirm(objJsMessages.jslit_confirma_borrar);
              if (answer)
                objUtiles.ejecutarFormulario("modal_axisfic001.do?&SFINANCI="+selectedSFINANCI+"&FCONSULTA="+objUtiles.formateaTimeStamp2(selectedFCONSULTA)+"&CFUENTE="+selectedCFUENTE, "eliminarendeuda", document.axisfic001Form, "_self", objJsMessages.jslit_borrando_registro);  
          }  
          function f_cerrar_axisfic004(){
                objUtiles.cerrarModal("axisfic004");
          }  
          
         /****************************************************************************************/
         /************************************** AXISFIC005****************************************/
         /****************************************************************************************/         
          function f_aceptar_axisfic005(selectedPerson){
                f_cerrar_axisfic005();
                objUtiles.ejecutarFormulario("modal_axisfic001.do", "form", document.axisfic001Form, "_self", objJsMessages.jslit_cargando);
          }
          function f_abrir_axisfic005(selectedSFINANCI, selectedNMOVIMI, CMODO) {           
                objUtiles.abrirModal("axisfic005", "src", "modal_axisfic005.do?operation=form&SFINANCI="+selectedSFINANCI+"&NMOVIMI="+selectedNMOVIMI+"&CMODO="+CMODO+"&SPERSON="+'${__formdata.SPERSON}'+"&CAGENTE="+'${__formdata.CAGENTE}');
          }    
          function f_borrar_indicadores(selectedSFINANCI, selectedNMOVIMI) {
              var answer = confirm(objJsMessages.jslit_confirma_borrar);
              if (answer)
                objUtiles.ejecutarFormulario("modal_axisfic001.do?&SFINANCI="+selectedSFINANCI+"&NMOVIMI="+selectedNMOVIMI, "eliminarindica", document.axisfic001Form, "_self", objJsMessages.jslit_borrando_registro); 
            }  
          function f_cerrar_axisfic005(){
                objUtiles.cerrarModal("axisfic005");
          }  
               
        /****************************************************************************************/
        /************************************** DOCUMENTACION *******************************************/
        /****************************************************************************************/
        
        function f_but_1000615() { // Añadir documentación
            f_abrir_modal("axisper030", true, "&SPERSON=${dades_persona.SPERSON}&CAGENTE=${dades_persona.CAGENTE}");
            
        }
        
        function f_modifdocum(SPERSON,IDDOCGEDOX){
            f_abrir_modal("axisper030", true, "&SPERSON="+SPERSON+"&CAGENTE=${__formdata.CAGENTE}&IDDOCGEDOX="+IDDOCGEDOX);
    
        }
        
        function f_aceptar_axisper030(){
            objUtiles.cerrarModal("axisper030");
            SPERSON = "${__formdata.SPERSON}";
            objUtiles.ejecutarFormulario("axis_axisfic001.do?&SPERSON="+SPERSON, "form", document.miForm, "_self", objJsMessages.jslit_cargando); 
        }
        
        /****************************************************************************************/
        /************************************** UTILES *******************************************/
        /****************************************************************************************/
        function f_cerrar_modal(pantalla){
            objUtiles.cerrarModal(pantalla);
        }
    
        function f_abrir_modal(cual, noXButton, optionalQueryString) {
            if (objUtiles.estaVacio(optionalQueryString))                
                optionalQueryString = "";
                
            if (noXButton) 
                objDom.setVisibilidadPorId("but_cerrar_modal_" + cual, "hidden");    
                
            objUtiles.abrirModal(cual, "src", "modal_" + cual + ".do?operation=form" + optionalQueryString);        
        }
        
        function f_cerrar_modal(cual) {
            objUtiles.cerrarModal(cual);
        }
        
    </script>  

  </head>
  <body onload="f_onload_axisfic001()">
 
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>  
     
    <c:import url="../include/modal_estandar.jsp">
      <c:param name="titulo">
        <axis:alt f="axisfic001" c="MODFIC002" lit=""/>
      </c:param>
      <c:param name="nid" value="axisfic002"/>
    </c:import> 
    
    <c:import url="../include/modal_estandar.jsp">
      <c:param name="titulo">
        <axis:alt f="axisfic001" c="MODFIC003" lit=""/>
      </c:param>
      <c:param name="nid" value="axisfic003"/>
    </c:import> 
    
    <c:import url="../include/modal_estandar.jsp">
      <c:param name="titulo">
        <axis:alt f="axisfic001" c="MODFIC004" lit=""/>
      </c:param>
      <c:param name="nid" value="axisfic004"/>
    </c:import> 
    
    <c:import url="../include/modal_estandar.jsp">
      <c:param name="titulo">
        <axis:alt f="axisfic001" c="MODFIC005" lit=""/>
      </c:param>
      <c:param name="nid" value="axisfic005"/>
    </c:import>
    <!-- INI - CP0151M_SYS_PERS - JLTS - 17/12/2018 -->
  <c:import url="../include/modal_estandar.jsp">
      <c:param name="titulo"><axis:alt f="axisfic001" c="TITULOIMPRIMIR" lit="1000205" /></c:param>
      <c:param name="nid" value="axisimprimir"></c:param>
  </c:import>
  <!-- FIN - CP0151M_SYS_PERS - JLTS - 17/12/2018 -->
      
    <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt f="axisper030" c="MOD_DOCUM" lit="1000431"/></c:param>
                <c:param name="nid" value="axisper030" />
    </c:import>     
      
    <form name="axisfic001Form" action="modal_axisfic001.do" method="POST">
        <input type="hidden" name="operation" value=""/>
        <input type="hidden" name="SPERSON"  value="${__formdata.SPERSON}"/>
        <input type="hidden" name="SFINANCI" value="${__formdata.SFINANCI}"/>  
        <input type="hidden" name="CMODO" value="${__formdata.CMODO}"/>
        <input type="hidden" name="CAGENTE"  value="${__formdata.CAGENTE}"/>
        <!-- INI TCS_11;IAXIS-2119 - JLTS - 10/03/2019 - Se incluyen los tres campos FRUT, FCCOMER y CIIU -->
        <input type="hidden" name="FRUT" value="${__formdata.FRUT}"/>
        <input type="hidden" name="FCCOMER"  value="${__formdata.FCCOMER}"/>
        <input type="hidden" name="CIIU"  value="${__formdata.CIIU}"/>
        <!--  INI TCS_11;IAXIS-2119 - JLTS - 10/03/2019 -->
        <!--  INI IAXIS-4143 -JLTS - 22/01/2020 - Se adiciona CTIPPER -->
        <input type="hidden" name="CTIPPER"  value="${__formdata.CTIPPER}"/>
        <!--  FIN IAXIS-4143 -JLTS - 22/01/2020 - Se adiciona CTIPPER -->
        
        <c:import url="../include/titulo_nt.jsp">
            <c:param name="formulario"><axis:alt f="axisfic001" c="formulario" lit="9909064" /></c:param>
            <c:param name="producto"><axis:alt f="axisfic001" c="producto" lit="9909064" /></c:param>
            <c:param name="form">axisfic001</c:param>
        </c:import>


        <!-- Area de campos  -->
        <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0" style="height:130px">
            <div class="separador">&nbsp;</div>
            <tr>
                <td>
                    <table class="seccion">
      <axis:visible f="axisfic001" c="BT_IMPRIMIR"> <!--IAXIS-4854-->
        <!-- INI - TCS_234B -- JLTS - 11/02/2019 Se crea el nuevo reporte en ingles -->
      <div style="float: right;">
      <img border="0" onclick="javascript:f_but_pers01()"
        alt="<axis:alt f="axisfic001" c="DOCPER" lit="2000083"/>"
        title="<axis:alt f="axisfic001" c="DOCPER" lit="2000083"/>"
        src="images/print.gif" />
      </div>
            <!-- FIN - TCS_234B -- JLTS - 11/02/2019. -->
        <!-- INI - CP0151M_SYS_PERS -- JLTS - 17/12/2018 -->
      <div style="float: right;">
      <img border="0" onclick="javascript:f_but_pers()"
        alt="<axis:alt f="axisfic001" c="DOCPER" lit="9910379"/>"
        title="<axis:alt f="axisfic001" c="DOCPER" lit="9910379"/>"
        src="images/print.gif" />
      </div>
      </axis:visible><!--IAXIS-4854-->
                    <!-- FIN - CP0151M_SYS_PERS -- JLTS -- 17/12/2018 -->
                      <tr>
                     <td align="left">
                        <table class="area" align="center">
                              <tr>
                                  <th style="height:0px"></th>
                              </tr>
                              <!-- Informacion General -->
                              <axis:visible c="DSP_INFORGENERAL" f="axisfic001">
                  <c:if test="${__formdata.T_IAX_FINANCIERA==null}">
                    <tr>
                      <td class="campocaja">
                      <img src="images/mes.gif" id="DSP_INFORGENERAL_parent" onclick="objEstilos.toggleDisplay('DSP_INFORGENERAL', this)" style="cursor: pointer" /> 
                        <b><axis:alt f="axisfic001" c="CINFOGENERAL" lit="9902028" /></b>
                        <hr class="titulo">
                      </td>
                    </tr>
                    <tr id="DSP_INFORGENERAL_children" style="display:yes">
                      <td class="campocaja">
                      <axis:visible f="axisfic001" c="BT_NVDOC"><!--IAXIS-4854-->
											<!--  INI TCS_11;IAXIS-2119 - JLTS - 10/03/2019 - Se ajusta la condición -->
                      <%-- <c:if test="${(__formdata.CMODO == 0 || __formdata.CMODO == 2) && !empty __formdata.FRUT && !empty __formdata.FCCOMER}"> --%>
                      <!--  FIN TCS_11;IAXIS-2119 - JLTS - 10/03/2019 -->
                                                <div style="float:right;">
							                                 	    <!--  INI TCS_11;IAXIS-2119 - JLTS - 10/03/2019 - Se ajustan los parámetros de f_abrir_axisfic002-->
                                                  <img border="0"
                                                           alt='<axis:alt f="axisfic001" c="LIT11" lit="9902028"/>'
                                                           title='<axis:alt f="axisfic001" c="LIT12" lit="9902028"/>'
                                                           src="images/new.gif"
                                                           onclick="f_abrir_axisfic002('${idLstGeneral.SPERSON}','${__formdata.SFINANCI}', '${idLstGeneral.NMOVIMI}', '${__formdata.CMODO}')"/> <!-- POST-123 --> 
                                                           <!-- onclick="f_abrir_axisfic002('${idLstGeneral.SPERSON}','${__formdata.SFINANCI}', '${idLstGeneral.NMOVIMI}', '0')"/> -->
                                                      <!--  FIN  TCS_11;IAXIS-2119 - JLTS - 10/03/2019 --> 
                                                  </div>         
                                              <%-- </c:if> --%>
                               </axis:visible> 
                      <div class="displayspace">
                            
                                     <c:set var="title0"><axis:alt f="axisfic001" c="FCCOMER_LIT" lit="9909140"/></c:set>
                                   <!--  INI TCS_11;IAXIS-2119 - JLTS - 10/03/2019 - Se adiciona FRUT_LIT, FRUT y se ajusta el orden de los titulos -->
                                   <c:set var="title1"><axis:alt f="axisfic001" c="FRUT_LIT" lit="9909086"/></c:set>
                                   
                                          <c:set var="title2"><axis:alt f="axisfic001" c="TOBJSOC_LIT" lit="9909069"/></c:set>
                                   <!-- INI IAXIS-4143 -JLTS - 22/01/2020 - Se adiciona condición con el CTIPPER -->
                                   <c:if test="${__formdata.CTIPPER == 2}">
                                     <c:set var="title3"><axis:alt f="axisfic001" c="FCONSTI_LIT" lit="9909070"/></c:set>
                                   </c:if>
                                   <c:if test="${__formdata.CTIPPER == 1}">
                                     <c:set var="title3"><axis:alt f="axisfic001" c="FCONSTI_LIT" lit="1000064"/></c:set>
                                   </c:if>
                                   <!-- FIN IAXIS-4143 -JLTS - 22/01/2020 - Se adiciona condición con el CTIPPER -->
                                          
                                          <c:set var="title4"><axis:alt f="axisfic001" c="SPERREP_LIT" lit="9909071"/></c:set>                                      
                                      <c:set var="axisfic001_lstGeneral" value="${__formdata.T_IAX_FINANCIERA}" />    
                                         <div class="separador">&nbsp;</div>
                                         
                                         <display:table name="${__formdata.lstGeneral}" id="idLstGeneral" export="false" class="dsptgtable"
                                pagesize="-1"  defaultorder="ascending"
                                requestURI="axis_axisfic001.do?paginar=true" sort="list"
                                cellpadding="0" cellspacing="0" >
                                <%@ include file="../include/displaytag.jsp"%>
                                            
                                            <display:column title="${title0}" sortProperty="FCCOMER" headerClass="sortable" media="html" sortable="false" autolink="false">
                                                  <div class="dspDate">${idLstGeneral.FCCOMER}</div>
                                              </display:column>
                                              <display:column title="${title1}" sortProperty="FRUT" headerClass="sortable" media="html" sortable="false" autolink="false">
                                                  <div class="dspDate">${idLstGeneral.FRUT}</div>
                                              </display:column>
                                              <display:column title="${title2}" sortProperty="TOBJSOC" headerClass="sortable" media="html" sortable="false" autolink="false">                               
                                                  <div class="dspText">${idLstGeneral.TOBJSOC}</div>
                                              </display:column>
                                              <display:column title="${title3}" sortProperty="FCONSTI" headerClass="sortable" media="html" sortable="false" autolink="false">
                                                  <div class="dspDate">${idLstGeneral.FCONSTI}</div>
                                              </display:column>
                                              <display:column title="${title4}" sortProperty="SPERREP" headerClass="sortable" media="html" sortable="false" autolink="false">                                 
                                                  <div class="dspText">${idLstGeneral.SPERREP}</div>
                                              </display:column>
                                              <axis:visible f="axisfic001" c="BT_EDITDOC"> <!--IAXIS-4854-->
                                                <%-- <c:if test="${__formdata.CMODO == 2}"> --%>
                                                <display:column title="" sortable="false"  sortProperty=""  headerClass="headwidth5 sortable fixed"  media="html"  autolink="false" >
                                                            <div class="dspIcons">
                                          	                                                <!--  INI TCS_11;IAXIS-2119 - JLTS - 10/03/2019 - Se justan los parámetros a f_abrir_axisfic002 -->
                                                              <img border="0"
                                                                   alt="<axis:alt f='axisfic001' c='LIT_EDIINFGEN' lit='100002'/> <axis:alt f='axisfic001' c='LIT_INFGEN' lit='9902028'/>"
                                                                   title="<axis:alt f='axisfic001' c='LIT_EDIINFGEN' lit='100002'/> <axis:alt f='axisfic001' c='LIT_INFGEN' lit='9902028'/>"
                                                                   src="images/lapiz.gif"
                                                                   onclick="f_abrir_axisfic002('${idLstGeneral.SPERSON}','${__formdata.SFINANCI}', '${idLstGeneral.NMOVIMI}', '${__formdata.CMODO}')"/> <!-- POST-123 --> 
                                                           <!-- onclick="f_abrir_axisfic002('${idLstGeneral.SPERSON}','${__formdata.SFINANCI}', '${idLstGeneral.NMOVIMI}', '2')"/> -->
                                                                                          <!--  FIN TCS_11;IAXIS-2119 - JLTS - 10/03/2019 -->
                                                            </div>
                                                        </display:column>
                                              <%-- </c:if> --%>
                                              </axis:visible> <!--IAXIS-4854-->
                                              <%-- <c:if test="${__formdata.CMODO == 1}"> --%>
                                                <display:column title="" sortable="false"  sortProperty=""  headerClass="headwidth5 sortable fixed"  media="html" autolink="false">
                                           <div class="dspIcons">
                              
                                                <img border="0"
                                                     alt="<axis:alt f='axisfic001' c='LIT_CONINFGEN' lit='1000439'/> <axis:alt f='axisfic001' c='LIT_INFGEN' lit='9902028'/>"
                                                     title="<axis:alt f='axisfic001' c='LIT_CONINFGEN' lit='1000439'/> <axis:alt f='axisfic001' c='LIT_INFGEN' lit='9902028'/>"
                                                     src="images/mas.gif"
                                                     onclick="f_abrir_axisfic002('${idLstGeneral.SPERSON}','${__formdata.SFINANCI}', '${idLstGeneral.NMOVIMI}', '${__formdata.CMODO}')"/> <!-- POST-123 --> 
                                                           <!-- onclick="f_abrir_axisfic002('${idLstGeneral.SPERSON}','${__formdata.SFINANCI}', '${idLstGeneral.NMOVIMI}', '1')"/> -->
                              
                                            </div>
                                          </display:column>
                                               <%-- </c:if> --%>
                                               <axis:visible f="axisfic001" c="BT_DELDOC"> <!--IAXIS-4854-->
                                               <!--  INI TCS_11;IAXIS-2119 - JLTS - 10/03/2019 - Se adicina el delete -->
                                               <%-- <c:if test="${__formdata.CMODO == 2}"> --%>
                                                        <display:column title=""
                                                                        sortable="false"
                                                                        sortProperty=""
                                                                        headerClass="headwidth5 sortable fixed"
                                                                        media="html"
                                                                        autolink="false">
                                                          <div class="dspIcons">
                                                            
                                                              <img border="0"
                                                                   alt="<axis:alt f='axisfic001' c='LIT22' lit='1000127'/> <axis:alt f='axisfic001' c='LIT22' lit='9909072'/>"
                                                                   title="<axis:alt f='axisfic001' c='LIT23' lit='1000127'/> <axis:alt f='axisfic001' c='LIT23' lit='9909072'/>"
                                                                   src="images/delete.gif"
                                                                   onclick="f_borrar_fin_general('${__formdata.SFINANCI}', '${idLstGeneral.NMOVIMI}')"/>
                                                          </div>
                                                        </display:column>
                                                      <%-- </c:if> --%>
                                                </axis:visible><!-- IAXIS-4854 -->
                                               <!--  FIN TCS_11;IAXIS-2119 - JLTS - 10/03/2019 -->           
                                          </display:table>     
                                          </div>
                                           
                      </td>
                      </tr>
                  </c:if>   
                </axis:visible>
                              
                              
                              <!-- Declaracion de renta -->
                              <axis:visible c="DSP_DECLARENTA" f="axisfic001">
                  <c:if test="${__formdata.lstGeneral!=null}">
                    <tr>
                      <td class="campocaja">
                      <img src="images/mes.gif" id="DSP_DECLARENTA_parent" onclick="objEstilos.toggleDisplay('DSP_DECLARENTA', this)" style="cursor: pointer" /> 
                        <b><axis:alt f="axisfic003" c="CDECLARENTA" lit="9909072" /></b>
                        <hr class="titulo">
                      </td>
                    </tr>
                    <tr id="DSP_DECLARENTA_children" style="display:yes">
                      <td class="campocaja">
                      
                      <axis:visible f="axisfic001" c="BT_NVDECREN"><!--IAXIS-4854-->
                                              <%-- <c:if test="${__formdata.CMODO == 0 || __formdata.CMODO == 2}"> --%>
                                                <div style="float:right;">
                                                  <img border="0"
                                                           alt='<axis:alt f="axisfic003" c="LIT11" lit="9909072"/>'
                                                           title='<axis:alt f="axisfic003" c="LIT12" lit="9909072"/>'
                                                           src="images/new.gif"
                                                           onclick="f_abrir_axisfic003('${__formdata.SFINANCI}', null, '${__formdata.CMODO}')"/> <!-- POST-123 --> 
                                                           <!-- onclick="f_abrir_axisfic003('${__formdata.SFINANCI}', null, '0')"/>"/> -->   
                                                  </div>
                                                  <%-- </c:if> --%>
                               </axis:visible> 
                      
                      <div class="displayspace">
                            
                            <c:set var="title0"><axis:alt f="axisfic001" c="TESVALOR_LIT" lit="9909073"/></c:set>
                                          <c:set var="title1"><axis:alt f="axisfic001" c="IPARILIQ_LIT" lit="9909074"/></c:set>
                                          <c:set var="title2"><axis:alt f="axisfic001" c="IRENTA_LIT" lit="9909075"/></c:set>
                                          <c:set var="title3"><axis:alt f="axisfic001" c="FCORTE_LIT" lit="9909076"/></c:set>                                     
                                      <c:set var="axisfic001_lstRenta" value="${__formdata.T_IAX_FINANCIERA}" />    
                                         <div class="separador">&nbsp;</div>
                                         
                                         <display:table name="${__formdata.lstRenta}" id="idLstRenta" export="false" class="dsptgtable"
                                pagesize="-1" defaultsort="2" defaultorder="ascending"
                                requestURI="axis_axisfic001.do?paginar=true" sort="list"
                                cellpadding="0" cellspacing="0">
                                <%@ include file="../include/displaytag.jsp"%>
                                            
                                            <display:column title="${title0}" sortProperty="TESVALOR" headerClass="sortable" media="html" sortable="false" autolink="false">
                                                  <div class="dspText">${idLstRenta.TESVALOR}</div>
                                              </display:column>
                                              <display:column title="${title1}" sortProperty="IPARILIQ" headerClass="sortable" media="html" sortable="false" autolink="false">                                
                                                  <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value="${idLstRenta.IPATRILIQ}"/></div>
                                              </display:column>
                                              <display:column title="${title2}" sortProperty="IRENTA" headerClass="sortable" media="html" sortable="false" autolink="false">
                                                  <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value="${idLstRenta.IRENTA}"/></div>
                                              </display:column>
                                              <display:column title="${title3}" sortProperty="FCORTE" headerClass="sortable" media="html" sortable="false" autolink="false">                                  
                                                  <div class="dspDate">${idLstRenta.FCORTE}</div>
                                              </display:column>
                                              <axis:visible f="axisfic001" c="BT_EDITDECREN"><!--IAXIS-4854-->
                                                <%-- <c:if test="${__formdata.CMODO == 2}"> --%>
                                                <display:column title="" sortable="false"  sortProperty=""  headerClass="headwidth5 sortable fixed"  media="html"  autolink="false">
                                                            <div class="dspIcons">
                                                  
                                                              <img border="0"
                                                                   alt="<axis:alt f='axisfic001' c='LIT_EDIDECREN' lit='100002'/> <axis:alt f='axisfic001' c='LIT_DECREN' lit='9909072'/>"
                                                                   title="<axis:alt f='axisfic001' c='LIT_EDIDECREN' lit='100002'/> <axis:alt f='axisfic001' c='LIT_DECREN' lit='9909072'/>"
                                                                   src="images/lapiz.gif"
                                                                   onclick="f_abrir_axisfic003('${idLstRenta.SFINANCI}', '${idLstRenta.FCORTE}', '${__formdata.CMODO}')"/>
                                                  
                                                            </div>
                                                        </display:column>
                                              <%-- </c:if> --%>
                                              </axis:visible><!--IAXIS-4854-->
                                              <axis:visible f="axisfic001" c="BT_DETDECREN"><!--IAXIS-4854-->
                                                <%-- <c:if test="${__formdata.CMODO == 1}"> --%>
                                                <display:column title="" sortable="false"  sortProperty=""  headerClass="headwidth5 sortable fixed"  media="html" autolink="false">
                                           <div class="dspIcons">
                              
                                                <img border="0"
                                                     alt="<axis:alt f='axisfic001' c='LIT_CONDECREN' lit='1000439'/> <axis:alt f='axisfic001' c='LIT_DECREN' lit='9909072'/>"
                                                     title="<axis:alt f='axisfic001' c='LIT_CONDECREN' lit='1000439'/> <axis:alt f='axisfic001' c='LIT_DECREN' lit='9909072'/>"
                                                     src="images/mas.gif"
                                                     onclick="f_abrir_axisfic003('${idLstRenta.SFINANCI}', '${idLstRenta.FCORTE}', '${__formdata.CMODO}')"/>
                              
                                            </div>
                                          </display:column>
                                               <%-- </c:if> --%>   
                                               </axis:visible>    
                                               <axis:visible f="axisfic001" c="BT_DELDECREN"><!--IAXIS-4854-->
                                                 <%-- <c:if test="${__formdata.CMODO == 2}"> --%>
                                                        <display:column title=""
                                                                        sortable="false"
                                                                        sortProperty=""
                                                                        headerClass="headwidth5 sortable fixed"
                                                                        media="html"
                                                                        autolink="false">
                                                          <div class="dspIcons">
                                                            
                                                              <img border="0"
                                                                   alt="<axis:alt f='axisfic001' c='LIT22' lit='1000127'/> <axis:alt f='axisfic001' c='LIT22' lit='9909072'/>"
                                                                   title="<axis:alt f='axisfic001' c='LIT23' lit='1000127'/> <axis:alt f='axisfic001' c='LIT23' lit='9909072'/>"
                                                                   src="images/delete.gif"
                                                                   onclick="f_borrar_declaracion('${idLstRenta.SFINANCI}', '${idLstRenta.FCORTE}', '${idLstRenta.CESVALOR}', '${idLstRenta.IPATRILIQ}', '${idLstRenta.IRENTA}')"/>
                                                            
                                                          </div>
                                                        </display:column>
                                                      <%-- </c:if>    --%>
                                              </axis:visible><!--IAXIS-4854-->        
                                          </display:table>     
                                          </div>
                                           
                      </td>
                      </tr>
                  </c:if>   
                </axis:visible>                            
                          <!-- Endeudamiento sector financiero -->
                          <axis:visible c="DSP_ENDEUDAMIENTO" f="axisfic001">
                  <c:if test="${__formdata.lstGeneral!=null}">
                    <tr>
                      <td class="campocaja">
                      <img src="images/mes.gif" id="DSP_ENDEUDAMIENTO_parent" onclick="objEstilos.toggleDisplay('DSP_ENDEUDAMIENTO', this)" style="cursor: pointer" /> 
                        <b><axis:alt f="axisfic001" c="CENDEUDAMIENTO" lit="9909077" /></b>
                        <hr class="titulo">
                      </td>
                    </tr>
                    <tr id="DSP_ENDEUDAMIENTO_children" style="display:yes">
                      <td class="campocaja">
                      
                      <axis:visible f="axisfic001" c="BT_NVENDEFIN"><!--IAXIS-4854-->
                                              <%-- <c:if test="${__formdata.CMODO == 0 || __formdata.CMODO == 2}"> --%>
                                                <div style="float:right;">
                                                  <img border="0"
                                                           alt='<axis:alt f="axisfic001" c="LIT11" lit="9909077"/>'
                                                           title='<axis:alt f="axisfic001" c="LIT12" lit="9909077"/>'
                                                           src="images/new.gif"
                                                           onclick="f_abrir_axisfic004('${__formdata.SFINANCI}', null, null, '${__formdata.CMODO}')"/> <!-- POST-123 --> 
                                                           <!-- onclick="f_abrir_axisfic004('${__formdata.SFINANCI}', null, null, '0')"/>"/> -->   
                                                  </div>         
                                              <%-- </c:if>  --%>
                               </axis:visible> 
                      
                      <div class="displayspace">
                            
                            <c:set var="title0"><axis:alt f="axisfic001" c="IENDTOT_LIT" lit="9909078"/></c:set>
                                          <c:set var="title1"><axis:alt f="axisfic001" c="NTCALIF_LIT" lit="9909079"/></c:set>
							                            <%-- INI IAXIS-4146 - JLTS - 20/05/2019. Se adiciona campo ncalries--%>
							                            <c:set var="title2"><axis:alt f="axisfic001" c="TNCALRIES_LIT" lit="2000094"/></c:set>	                            
							                            <%-- FIN IAXIS-4146 - JLTS - 20/05/2019. Se adiciona campo ncalries--%>
							                            <c:set var="title3"><axis:alt f="axisfic001" c="NCONSUL_LIT" lit="9909080"/></c:set>
									                    <c:set var="axisfic001_lstEndeuda" value="${__formdata.T_IAX_FINANCIERA}" />    
									                       <div class="separador">&nbsp;</div>
									                       
									                       <display:table name="${__formdata.lstEndeuda}" id="idLstEndeuda" export="false" class="dsptgtable"
																pagesize="-1" defaultsort="2" defaultorder="ascending"
																requestURI="axis_axisfic001.do?paginar=true" sort="list"
																cellpadding="0" cellspacing="0">
																<%@ include file="../include/displaytag.jsp"%>
									                        	<%-- INI IAXIS-15817 - FCG - 28/06/2021. Se adiciona propiedad visible--%>
									                        	<axis:visible f="axisfic001" c="IENDTOT">
										                        	<display:column title="${title0}" sortProperty="TESVALOR" headerClass="sortable" media="html" sortable="false" autolink="false">
										                                <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value="${idLstEndeuda.IENDTOT}"/></div>
										                            </display:column>
									                            </axis:visible>
									                            <axis:visible f="axisfic001" c="NTCALIF">
										                            <display:column title="${title1}" sortProperty="NTCALIF" headerClass="sortable" media="html" sortable="false" autolink="false">																
										                                <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value="${idLstEndeuda.NTCALIF}"/></div>
										                            </display:column>
									                            </axis:visible>
									                            <%-- INI IAXIS-4146 - JLTS - 20/05/2019. Se adiciona campo ncalries--%>
									                            <display:column title="${title2}" sortProperty="TNCALRIES" headerClass="sortable" media="html" sortable="false" autolink="false">																
									                                <div class="dspText">${idLstEndeuda.TNCALRIES}</div>
									                            </display:column>
									                            <%-- FIN IAXIS-4146 - JLTS - 20/05/2019. Se adiciona campo ncalries--%>
									                            <axis:visible f="axisfic001" c="NCONSUL">
										                            <display:column title="${title3}" sortProperty="NCONSUL" headerClass="sortable" media="html" sortable="false" autolink="false">
										                                <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value="${idLstEndeuda.NCONSUL}"/></div>
	                                              					</display:column>
	                                              				</axis:visible>
	                                              				<%-- FIN IAXIS-15817 - FCG - 28/06/2021. Se adiciona propiedad visible--%>
                                              <axis:visible f="axisfic001" c="BT_EDITENDEFIN"><!--IAXIS-4854-->
                                                <%-- <c:if test="${__formdata.CMODO == 2}"> --%>
                                                <display:column title="" sortable="false"  sortProperty=""  headerClass="headwidth5 sortable fixed"  media="html"  autolink="false">
                                                            <div class="dspIcons">
                                                  
                                                              <img border="0"
                                                                   alt="<axis:alt f='axisfic001' c='LIT_EDIENDTOLFIN' lit='100002'/> <axis:alt f='axisfic001' c='LIT_ENDTOLFIN' lit='9909077'/>"
                                                                   title="<axis:alt f='axisfic001' c='LIT_EDIENDTOLFIN' lit='100002'/> <axis:alt f='axisfic001' c='LIT_ENDTOLFIN' lit='9909077'/>"
                                                                   src="images/lapiz.gif"
                                                                   onclick="f_abrir_axisfic004('${idLstEndeuda.SFINANCI}', '${idLstEndeuda.FCONSULTA}', '${idLstEndeuda.CFUENTE}', '${__formdata.CMODO}')"/>
                                                  
                                                            </div>
                                                        </display:column>
                                              <%-- </c:if> --%>
                                              </axis:visible><!--IAXIS-4854-->
                                              <axis:visible f="axisfic001" c="BT_DETENDEFIN"><!--IAXIS-4854-->
                                                 <%-- <c:if test="${__formdata.CMODO == 1}"> --%>
                                                <display:column title="" sortable="false"  sortProperty=""  headerClass="headwidth5 sortable fixed"  media="html" autolink="false">
                                           <div class="dspIcons">
                              
                                                <img border="0"
                                                     alt="<axis:alt f='axisfic001' c='LIT_CONENDTOLFIN' lit='1000439'/> <axis:alt f='axisfic001' c='LIT_ENDTOLFIN' lit='9909077'/>"
                                                     title="<axis:alt f='axisfic001' c='LIT_CONENDTOLFIN' lit='1000439'/> <axis:alt f='axisfic001' c='LIT_ENDTOLFIN' lit='9909077'/>"
                                                     src="images/mas.gif"
                                                     onclick="f_abrir_axisfic004('${idLstEndeuda.SFINANCI}', '${idLstEndeuda.FCONSULTA}', '${idLstEndeuda.CFUENTE}', '${__formdata.CMODO}')"/>
                              
                                            </div>
                                          </display:column> 
                                       <%-- </c:if> --%>
                                        </axis:visible><!--IAXIS-4854-->
                                        <axis:visible f="axisfic001" c="BT_DELENDEFIN"><!--IAXIS-4854-->
                                       		<%-- <c:if test="${__formdata.CMODO == 2}"> --%>
                                                        <display:column title=""
                                                                        sortable="false"
                                                                        sortProperty=""
                                                                        headerClass="headwidth5 sortable fixed"
                                                                        media="html"
                                                                        autolink="false">
                                                          <div class="dspIcons">
                                                            
                                                              <img border="0"
                                                                   alt="<axis:alt f='axisfic001' c='LIT22' lit='1000127'/> <axis:alt f='axisfic001' c='LIT22' lit='9909077'/>"
                                                                   title="<axis:alt f='axisfic001' c='LIT23' lit='1000127'/> <axis:alt f='axisfic001' c='LIT23' lit='9909077'/>"
                                                                   src="images/delete.gif"
                                                                   onclick="f_borrar_endeudamiento('${idLstEndeuda.SFINANCI}', '${idLstEndeuda.FCONSULTA}', '${idLstEndeuda.CFUENTE}')"/>
                                                            
                                                          </div>
                                                        </display:column>
                                                      <%-- </c:if>   --%>
                                          </axis:visible><!--IAXIS-4854-->                   
                                          </display:table>     
                                          </div>
                                           
                      </td>
                      </tr>
                  </c:if>   
                </axis:visible>  
								<!-- Información financiera -->
                <axis:visible c="DSP_INFOFINANCI" f="axisfic001">
                  <c:if test="${__formdata.lstGeneral!=null}">
                    <tr>
                      <td class="campocaja">
                      <img src="images/mes.gif" id="DSP_INFOFINANCI_parent" onclick="objEstilos.toggleDisplay('DSP_INFOFINANCI', this)" style="cursor: pointer" /> 
                        <b><axis:alt f="axisfic001" c="CINFOFINANCI" lit="9909139" /></b>
                        <hr class="titulo">
                      </td>
                    </tr>
                    <tr id="DSP_INFOFINANCI_children" style="display:yes">
                      <td class="campocaja">
                      
                      <axis:visible f="axisfic001" c="BT_NVINFOFIN"> <!--IAXIS-4854-->
                                              <%-- <c:if test="${__formdata.CMODO == 0 || __formdata.CMODO == 2}"> --%> 
                                                <div style="float:right;">
                                                  <img border="0"
                                                           alt='<axis:alt f="axisfic001" c="LIT11" lit="9909139"/>'
                                                           title='<axis:alt f="axisfic001" c="LIT12" lit="9909139"/>'
                                                           src="images/new.gif"
                                                           onclick="f_abrir_axisfic005('${__formdata.SFINANCI}', '0', '${__formdata.CMODO}')"/> <!-- POST-123 --> 
                                                           <!-- onclick="f_abrir_axisfic005('${__formdata.SFINANCI}', '0', '0')"/> -->   
                                                  </div>
                                                  <%-- </c:if> --%>
                               </axis:visible> 
                      
                      
                      <div class="displayspace">
                            
                            <c:set var="title0"><axis:alt f="axisfic001" c="CMONEDA_LIT" lit="108645"/></c:set>
                                          <c:set var="title1"><axis:alt f="axisfic001" c="CFUENTE_LIT" lit="9909082"/></c:set>
                                          <c:set var="title2"><axis:alt f="axisfic001" c="FINDICAD_LIT" lit="9909083"/></c:set>                                 
                                      <c:set var="axisfic001_lstIndicador" value="${__formdata.T_IAX_FINANCIERA}" />    
                                         <div class="separador">&nbsp;</div>
                                         
                                         <display:table name="${__formdata.lstIndicador}" id="idLstIndicador" export="false" class="dsptgtable"
                                pagesize="-1" defaultsort="2" defaultorder="ascending"
                                requestURI="axis_axisfic001.do?paginar=true" sort="list"
                                cellpadding="0" cellspacing="0">
                                <%@ include file="../include/displaytag.jsp"%>
                                            
                                            <display:column title="${title0}" sortProperty="CMONEDA" headerClass="sortable" media="html" sortable="false" autolink="false">
                                                  <div class="dspText">${idLstIndicador.CMONEDA}</div>
                                              </display:column>
                                              <display:column title="${title1}" sortProperty="CFUENTE" headerClass="sortable" media="html" sortable="false" autolink="false">                               
                                                  <div class="dspText">${idLstIndicador.TFUENTE}</div>
                                              </display:column>
                                              <display:column title="${title2}" sortProperty="FINDICAD" headerClass="sortable" media="html" sortable="false" autolink="false">
                                                  <div class="dspDate">${idLstIndicador.FEESFIN}</div>
                                              </display:column>
                                              <axis:visible f="axisfic001" c="BT_EDITINFOFIN"> <!--IAXIS-4854-->
                                                <%-- <c:if test="${__formdata.CMODO == 2}"> --%>
                                                <display:column title="" sortable="false"  sortProperty=""  headerClass="headwidth5 sortable fixed"  media="html"  autolink="false">
                                                            <div class="dspIcons">
                                                  
                                                              <img border="0"
                                                                   alt="<axis:alt f='axisfic001' c='LIT_EDIINFFIN' lit='100002'/> <axis:alt f='axisfic001' c='LIT_INFFIN' lit='9909077'/>"
                                                                   title="<axis:alt f='axisfic001' c='LIT_EDIINFFIN' lit='100002'/> <axis:alt f='axisfic001' c='LIT_INFFIN' lit='9909077'/>"
                                                                   src="images/lapiz.gif"
                                                                   onclick="f_abrir_axisfic005('${idLstIndicador.SFINANCI}', '${idLstIndicador.NMOVIMI}', '${__formdata.CMODO}')"/>
                                                  
                                                            </div>
                                                        </display:column>
                                              <%-- </c:if> --%>
                                              </axis:visible> <!--IAXIS-4854-->
                                              <axis:visible f="axisfic001" c="BT_DETINFOFIN"> <!--INI IAXIS-4854-->
                                                <%-- <c:if test="${__formdata.CMODO == 1}"> --%>
                                                <display:column title="" sortable="false"  sortProperty=""  headerClass="headwidth5 sortable fixed"  media="html" autolink="false">
                                           <div class="dspIcons">
                              
                                                <img border="0"
                                                     alt="<axis:alt f='axisfic001' c='LIT_CONINFFIN' lit='1000439'/> <axis:alt f='axisfic001' c='LIT_INFFIN' lit='9909139'/>"
                                                     title="<axis:alt f='axisfic001' c='LIT_CONINFFIN' lit='1000439'/> <axis:alt f='axisfic001' c='LIT_INFFIN' lit='9909139'/>"
                                                     src="images/mas.gif"
                                                     onclick="f_abrir_axisfic005('${idLstIndicador.SFINANCI}', '${idLstIndicador.NMOVIMI}', 'CONSULTA')"/>
                              
                                            </div>
                                          </display:column>
                                              <%-- </c:if>  --%>
                                              </axis:visible> <!--FIN IAXIS-4854-->
                                              <axis:visible f="axisfic001" c="BT_DELINFOFIN"> <!--IAXIS-4854-->
                                              	<%-- <c:if test="${__formdata.CMODO == 2}"> --%>
                                                        <display:column title=""
                                                                        sortable="false"
                                                                        sortProperty=""
                                                                        headerClass="headwidth5 sortable fixed"
                                                                        media="html"
                                                                        autolink="false">
                                                          <div class="dspIcons">
                                                            
                                                              <img border="0"
                                                                   alt="<axis:alt f='axisfic001' c='LIT22' lit='1000127'/> <axis:alt f='axisfic001' c='LIT22' lit='9909139'/>"
                                                                   title="<axis:alt f='axisfic001' c='LIT23' lit='1000127'/> <axis:alt f='axisfic001' c='LIT23' lit='9909139'/>"
                                                                   src="images/delete.gif"
                                                                   onclick="f_borrar_indicadores('${idLstIndicador.SFINANCI}', '${idLstIndicador.NMOVIMI}')"/>
                                                            
                                                          </div>
                                                        </display:column>
                                                      <%-- </c:if>  --%>
                                             </axis:visible><!--IAXIS-4854-->                      
                                          </display:table>     
                                          </div>
                                           
                      </td>
                      </tr>
                  </c:if>   
                </axis:visible>  
                          <!-- Documentos -->
                          <axis:visible c="DSP_DOCUMENTOS" f="axisfic001">
                  <c:if test="${__formdata.lstGeneral!=null}">
                    <tr>
                      <td class="campocaja">
                      <img src="images/mes.gif" id="DSP_DOCUMENTOS_parent" onclick="objEstilos.toggleDisplay('DSP_DOCUMENTOS', this)" style="cursor: pointer" /> 
                        <b><axis:alt f="axisfic001" c="CDOCUMENTOS" lit="9001358" /></b>
                        <hr class="titulo">
                      </td>
                    </tr>
                                      
                    <tr id="DSP_DOCUMENTOS_children" style="display:yes">
                      
                      <td class="campocaja">
                        <axis:visible f="axisfic001" c="BT_NVDOCU"><!--IAXIS-4854-->
                                              <%-- <c:if test="${__formdata.CMODO == 0 || __formdata.CMODO == 2}"> --%>
                                                <div style="float:right;">
                                                  <img border="0"
                                                           alt='<axis:alt f="axisfic001" c="FILE" lit="9902032"/>'
                                                           title='<axis:alt f="axisfic001" c="FILE" lit="9902032"/>'
                                                           src="images/new.gif"
                                                           onclick="f_but_1000615()" />                       
                                                </div>
                                          <%-- </c:if> --%> 
                                  </axis:visible> 
                        <div class="displayspace">
                            
                            <c:set var="title0"><axis:alt f="axisfic001" c="TDESCRIPCION_LIT" lit="1000110" /></c:set>
                                          <c:set var="title1"><axis:alt f="axisfic001" c="TNOMBRE_LIT" lit="9907629" /></c:set>
                                          <c:set var="title2"><axis:alt f="axisfic001" c="FALTA_LIT" lit="105887"/></c:set>
                                          <c:set var="title3"><axis:alt f="axisfic001" c="TOBSERVA_LIT" lit="101162"/></c:set>                                      
                                      <c:set var="axisfic001_lstDoc" value="${__formdata.T_IAX_FINANCIERA}" />    
                                         <div class="separador">&nbsp;</div>
                                         
                                         <display:table name="${__formdata.lstDoc}" id="idLstDoc" export="false" class="dsptgtable"
                                pagesize="-1" defaultsort="2" defaultorder="ascending"
                                requestURI="axis_axisfic001.do?paginar=true" sort="list"
                                cellpadding="0" cellspacing="0">
                                <%@ include file="../include/displaytag.jsp"%>
                                          
                                              <display:column title="${title0}" sortProperty="TDESCRIPCION" headerClass="sortable" media="html" sortable="false" autolink="false">
                                                  <div class="dspText">${idLstDoc.FALTA}</div>
                                              </display:column>
                                              <display:column title="${title1}" sortProperty="TNOMBRE" headerClass="sortable" media="html" sortable="false" autolink="false">                                 
                                                  <div class="dspText">${idLstDoc.TOBSER}</div>
                                              </display:column>
                                              <display:column title="${title2}" sortProperty="FALTA" headerClass="sortable" media="html" sortable="false" autolink="false">
                                                  <div class="dspText">${idLstDoc.FALTA}</div>
                                              </display:column>
                                              <display:column title="${title3}" sortProperty="TOBSERVA" headerClass="sortable" media="html" sortable="false" autolink="false">                                  
                                                  <div class="dspText">${idLstDoc.TOBSER}</div>
                                              </display:column>
                                              <%-- <c:if test="${__formdata.CMODO == 1}"> --%>
                                                <axis:visible f="axisfic001" c="BT_MODIFDOCUM">
                                                <display:column title="" headerClass="headwidth5 sortable" media="html" autolink="false" >
                                                     <div class="dspIcons"><img border="0"  src="images/lapiz.gif" width="15px" height="15px"
                                                          style="cursor:pointer;" onclick="f_modifdocum('${__formdata.SPERSON}','${idLstDoc.IDDOCGDX}')"/>
                                                     </div>
                                                  </display:column> 
                                                    </axis:visible>
                                                 <%-- </c:if> --%>   
                                              </display:table>
                                              <c:if test="${!empty __formdata.dades_persona.DATOS_DOCUMENTACION}">
                                                <c:if test="${ !(fn:containsIgnoreCase(header['User-Agent'],'ipad') ) }">
                                                    <script language="javascript">objUtiles.retocarDsptagtable("idLstDoc");</script>
                                                </c:if>
                                            </c:if>
                                                              
                                               
                              </div>             
                      </td>
                    </tr>
                  </c:if>   
                </axis:visible>
                            </table>
                           </td>
                         </tr>        
                    </table>
                </td>
            </tr>
        </table>      

		 <!-- POST-123 -->
        <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisfic001</c:param><c:param name="f">axisfic001</c:param>
            <%-- <c:param name="__botones"><c:if test="${__formdata.CMODO != 1}"> cancelar,aceptar,</c:if><c:if test="${__formdata.CMODO == 1}">salir</c:if> </c:param>--%>
            <c:param name="__botones">cancelar,aceptar,salir</c:param>
        </c:import>
    </form>

        <c:import url="../include/mensajes.jsp" />

    </body>    

</html>