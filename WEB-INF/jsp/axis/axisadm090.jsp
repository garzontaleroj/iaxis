<%/*
*  Fichero: axisage008.jsp
*/
%>


<%@ page contentType="text/html;charset=iso-8859-15" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
    <title>Traspaso de cartera de agente</title> <%-- Traspaso de cartera de agente --%>
    <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
    <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
    <link rel="stylesheet" href="styles/displaytag.css">
    <c:import url="../include/carga_framework_js.jsp"/>
    
  <script type="text/javascript">
    
    /****************************************************************************************/
    /*********************************** NAVEGACION *****************************************/
    /****************************************************************************************/
                 
    function f_onload() {   
       f_cargar_propiedades_pantalla();
        }
          
    function f_but_salir() {
       objUtiles.ejecutarFormulario("flujodetrabajo.do?forigen=axisadm090", "cancelar", document.miForm, "_self"); 
    }
    
    function f_cargar(){
    //Sólo recargamos valores cuando se cambia el agente de origen
        var PRONAME = document.miForm.PRONAME.value;
        if(PRONAME!=null && PRONAME!=''){
             /*   objDom.setDisabledPorId("but_aceptar",false);*/
                objUtiles.ejecutarFormulario("axis_axisadm090.do", "form", document.miForm, "_self", objJsMessages.jslit_actualizando_registro);   //jslit_cargando
    }
    
    f_cargar_propiedades_pantalla();
    }    
    
     function f_borrar_definicion(NORDEN, CCAMPO, CTIPCAM) {
        var answer = confirm(objJsMessages.jslit_confirma_borrar);
        if (answer)

            objUtiles.ejecutarFormulario("axis_axisadm090.do?subpantalla=masdatos&PNORDEN="+NORDEN+"&PCCAMPO="+CCAMPO+"&PCTIPCAM="+CTIPCAM, "eliminarDefinicion", document.miForm, "_self", objJsMessages.jslit_actualizando_registro);   
        } 
        
     function f_borrar_validacion() {
        var answer = confirm(objJsMessages.jslit_confirma_borrar);
        if (answer)

            objUtiles.ejecutarFormulario("axis_axisadm090.do?", "eliminarValidacion", document.miForm, "_self", objJsMessages.jslit_actualizando_registro);   
        }  
    
    
/****************************************************************************************/
/************************************** MODAL *******************************************/
/****************************************************************************************/

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
            
    function f_aceptar_modal(cual, params) {
        f_cerrar_modal(cual);
        if (objUtiles.estaVacio(params))   
            params = "";
        if (cual == 'axisadm090') /* modificar per model de cierres*/ {
            objUtiles.ejecutarFormulario("axis_axisadm090.do" + params, "buscar", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
    }
            
             
/******************************************************************************************************************************
 * ********************************************llamado al modal Axisadm091*****************************************************
 * **************************************************************************************************************************** */

    
    function f_abrir_axisadm091(NORDEN, CCAMPO, CTIPCAM, CMODO) {
     var PRONAME = document.miForm.PRONAME.value;
        if(PRONAME!=null && PRONAME!=''){            
            objUtiles.abrirModal("axisadm091", "src" ,"modal_axisadm091.do?operation=form&PRONAME=" + document.miForm.PRONAME.value+"&MODO="+CMODO+"&PNORDEN="+NORDEN+"&PCCAMPO="+CCAMPO+"&PCTIPCAM="+CTIPCAM);
        }
    }
    
    function f_cerrar_axisadm091() {
        objUtiles.cerrarModal("axisadm091")
        
         f_cargar();
    }    
    
    
    function f_aceptar_axisadm091(){
     
      f_cerrar_axisadm091();
      
     f_cargar_propiedades_pantalla();
       
     
    }
  
            
/******************************************************************************************************************************
 * ********************************************llamado al modal Axisadm092*****************************************************
 * **************************************************************************************************************************** */
 
    function f_abrir_axisadm092() {
    
     var PRONAME = document.miForm.PRONAME.value;
        if(PRONAME!=null && PRONAME!=''){
             /*   objDom.setDisabledPorId("but_aceptar",false);*/
              objUtiles.abrirModal("axisadm092","src","modal_axisadm092.do?operation=form&PRONAME="+document.miForm.PRONAME.value+"&MODO=alta");
       
    }
  
    }
    
    function f_cerrar_axisadm092() {
        objUtiles.cerrarModal("axisadm092")
        
         f_cargar();
    }    
    
    
    function f_aceptar_axisadm092(){
     
      f_cerrar_axisadm092();
      
     f_cargar_propiedades_pantalla();
       
     
    }


           
/******************************************************************************************************************************
 * ********************************************llamado al modal Axisadm090a*****************************************************
 * **************************************************************************************************************************** */
    
    
       function f_abrir_axisadm090a() {
       
       
             /*   objDom.setDisabledPorId("but_aceptar",false);*/
               objUtiles.abrirModal("axisadm090a","src","modal_axisadm090a.do?operation=form&MODO=alta");
       
    
    
    }
    
    
    function f_cerrar_axisadm090a() {
        objUtiles.cerrarModal("axisadm090a")
        
         f_cargar();
    }    
    
    

     function f_aceptar_axisadm090a(CDARCHI){
    
    

     document.miForm.PRONAME.value=CDARCHI;

   
    
      f_cerrar_axisadm090a();
      
     f_cargar_propiedades_pantalla();
       
     
    }
    
    
    
    
    
/********************************************************************************************/

           
/******************************************************************************************************************************
 * ********************************************llamado al modal Axisadm090a*****************************************************
 * **************************************************************************************************************************** */
    
    
       function f_abrir_axisadm090b() {
       
   
             /*   objDom.setDisabledPorId("but_aceptar",false);*/
               objUtiles.abrirModal("axisadm090b","src","modal_axisadm090b.do?operation=form&MODO=alta");
       
   
    
    }
    
    
    function f_cerrar_axisadm090b() {
        objUtiles.cerrarModal("axisadm090b")
        
         f_cargar();
    }    
    
    
    function f_aceptar_axisadm090b(CDARCHI){
    
    

     document.miForm.PRONAME.value=CDARCHI;

   
    
      f_cerrar_axisadm090b();
      
     f_cargar_propiedades_pantalla();
       
     
    }


  </script>    
</head>

  <!--  <body> -->
  
<body onload="f_onload()" onkeypress="if (event.keyCode==13)  { f_cargar() }">

    <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
    
 <form name="miForm" action="" method="POST">       
 
     <input type="hidden" id="operation" name="operation" value=""/>  

     <c:import url="../include/titulo_nt.jsp">
            <c:param name="titulo"><axis:alt f="axisadm090" c="TITULO" lit="9907686"/></c:param>     <%-- Traspaso de cartera de agente --%>
            <c:param name="formulario"><axis:alt f="axisadm090" c="TITULO" lit="9907686"/></c:param> <%-- Traspaso de cartera de agente --%>
            <c:param name="form">axisadm090</c:param>
     </c:import>
        
     <c:import url="../include/modal_estandar.jsp">
        <c:param name="titulo"><axis:alt f="axisadm090" c="TITULO_AGE" lit="1000234" /></c:param>
        <c:param name="nid" value="axisctr014" />
     </c:import>
     
   
     <c:import url="../include/modal_estandar.jsp">
            <c:param name="titulo"><axis:alt f="axisage008" c="TITULO_AGE" lit="1000234" /></c:param>
            <c:param name="nid" value="axisadm091" />
      </c:import>
      
       <c:import url="../include/modal_estandar.jsp">
            <c:param name="titulo"><axis:alt f="axisadm090" c="TITULO_AGE" lit="1000234" /></c:param>
            <c:param name="nid" value="axisadm092" />
      </c:import>
      
      <c:import url="../include/modal_estandar.jsp">
            <c:param name="titulo"><axis:alt f="axisadm090" c="TITULO_AGE" lit="1000234" /></c:param>
            <c:param name="nid" value="axisadm090a" />
      </c:import>
      
      <c:import url="../include/modal_estandar.jsp">
            <c:param name="titulo"><axis:alt f="axisadm090" c="TITULO_AGE" lit="1000234" /></c:param>
            <c:param name="nid" value="axisadm090b" />
      </c:import>
            
      <input type="hidden" name="CTIPAGE_BUSC" id="CTIPAGE_BUSC" value="${__formdata.CTIPAGE_BUSC}"/>
      <input type="hidden" name="CAGENTE"  id="CAGENTE" value="${__formdata.CAGENTE}"/>
           

 <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
 
    <tr>
    <td>
    
     <table class="area" align="center">
        <tr>
             <td>
             <div class="separador"></div>                                            
             <div style="float:right;" id="BT_SIN_NUEVO_AG">
              <img border="0"
                   alt='<axis:alt f="axisadm090" c="SPERON_ALT" lit="9907949"/>'
                   title='<axis:alt f="axisadm090" c="SPERON_ALT" lit="9907949"/>'
                   src="images/new.gif"
                   onclick="f_abrir_axisadm090a()"
                   style="cursor:pointer"/>
             </div>
             <div style="clear:both;">
             <hr class="titulo">
             </div>    
             </td>
        </tr>

        <tr>    
            <axis:ocultar f="axisadm090" c="PRONAME" dejarHueco="false">
                <td id ="td_PRONAME">
                    <b><axis:alt f="axisadm090" c="PRONAME" lit="9908025"></axis:alt></b>
                </td>
            </axis:ocultar>
        </tr>                
              
        <tr> 
            <axis:visible f="axisadm090" c="PRONAME">  
            <td class="campocaja" id="td_PRONAME">
                <input type="text" name="PRONAME" id="PRONAME" 
                class="campowidthinput campo campotexto"
                style="width:20%"                
                value="${__formdata.PRONAME}"
                <axis:atr f="axisadm090" c="PRONAME" a="modificable=false"/> />
                &nbsp;
                <img border="0"
                   alt='<axis:alt f="axisadm090" c="SPERON_ALT" lit="9907949"/>'
                   title='<axis:alt f="axisadm090" c="SPERON_ALT" lit="9907949"/>'
                   src="images/find.gif"
                   onclick="f_abrir_axisadm090b();"
                   style="cursor:pointer"/>
            </td>                        
            </axis:visible>
        </tr>
     </table>
                   
                    <!--  FIELD_DEFINITION -->
        <div class="separador"></div>
        <div class="titulo">
            <img src="images/flecha.gif"/><axis:alt f="axisadm090" c="FIELD_DEFINITION" lit="9907696"/>
        </div>
        <div style="float:right;" id="BT_SIN_NUEVO_AG">
            <axis:visible f="axisadm090" c="BT_SIN_NUEVO_AG">
                <a href="javascript:f_abrir_axisadm091(null, null, null, 'ALTA');">
                    <img border="0"
                         alt='<axis:alt f="axisadm090" c="LIT_SIN_ADD_AG" lit="9907696"/>'
                         title='<axis:alt f="axisadm090" c="LIT_SIN_ADD_AG" lit="9907696"/>'
                         src="images/new.gif"/></a>
            </axis:visible>            
        </div>
        <div style="clear:both;">
            <hr class="titulo">
        </div> 
                                
        <div class="separador"></div>
                     
                <table class="area" align="center">
                    <tr>
                        <td align="left" class="campocaja">
                            <!--CAMPOS FIELD_DEFINITION -->
                            <c:set var="title0">
                                <axis:alt f="axisadm090" c="FIELD_NAME" lit="9907697"/>
                            </c:set><!-- field name -->
                             
                            <c:set var="title1">
                                <axis:alt f="axisadm090" c="INI_POSITION" lit="9907698"/>
                            </c:set><!-- Numero initial position -->
                             
                            <c:set var="title2">
                                <axis:alt f="axisadm090" c="LENGTH POSIT" lit="9907699"/>
                            </c:set>
                             
                            <!-- length position -->
                             
                            <c:set var="title3">
                                <axis:alt f="axisadm090" c="TYPE_F_DEF" lit="9907700"/>
                            </c:set><!-- type-->
                             
                            <c:set var="title4">
                                <axis:alt f="axisadm090" c="ORD" lit="9908023"/>
                            </c:set><!-- delete -->
                            
                            <c:set var="title5">
                                <axis:alt f="axisadm090" c="FIELD_TYPE" lit="9908020"/>
                            </c:set><!-- delete -->
                            
                            <c:set var="title6">
                                <axis:alt f="axisadm090" c="FIELD_TYPE" lit="9908405"/>
                            </c:set><!-- delete -->
                            
                              <c:set var="title7">
                                <axis:alt f="axisadm090" c="FIELD_TYPE" lit="9908400"/>
                            </c:set><!-- delete -->
                            
                            <c:set var="title8">
                                <axis:alt f="axisadm090" c="CEDIT" lit="1000577"/>
                            </c:set>
                            
                            <div class="displayspace">
                            
                                <display:table name="${map_arch}"
                                               id="arch" export="false" class="dsptgtable"
                                               pagesize="-1" cellpadding="0" cellspacing="0">
                                    <%@ include file="../include/displaytag.jsp"%>
                                    
                                   <display:column title="${title4}" 
                                                    headerClass="fixed sortable" style="width:16,6%"
                                                    media="html" autolink="false">
                                        <div class="dspNumber">
                                            ${arch.NORDEN}
                                        </div>
                                    </display:column>
                                   
                                    <display:column title="${title0}" 
                                                    headerClass="fixed sortable" style="width:16,6%"
                                                    media="html" autolink="false">
                                        <div class="dspText">
                                            ${arch.CCAMPO}
                                        </div>
                                    </display:column>
                                    
                                    <display:column title="${title1}" 
                                                    headerClass="fixed sortable" style="width:16,6%"
                                                    media="html" autolink="false">
                                        <div class="dspNumber">
                                            ${arch.NPOSICI}
                                        </div>
                                    </display:column>
                                    
                                    <display:column title="${title2}" 
                                                    headerClass="fixed sortable" style="width:16,6%"
                                                    media="html" autolink="false">
                                        <div class="dspNumber">
                                            ${arch.NLONGITUD}
                                        </div>
                                    </display:column>
                                    
                                    <display:column title="${title3}" 
                                                    headerClass="fixed sortable" style="width:16,6%"
                                                    media="html" autolink="false">
                                        <div class="dspText">
                                            ${arch.TATRIBU}
                                        </div>
                                    </display:column>
                                    
                                     <display:column title="${title5}" 
                                                    headerClass="fixed sortable" style="width:16,6%"
                                                    media="html" autolink="false">
                                        <div class="dspText">
                                            ${arch.NTIPO}
                                        </div>
                                    </display:column>
                                    
                                    <display:column title="${title6}" 
                                                    headerClass="fixed sortable" style="width:16,6%"
                                                    media="html" autolink="true">
                                        <div class="dspText">
                                            ${arch.CDECIMAL}
                                        </div>
                                    </display:column>
                                    
                                    <display:column title="${title7}" 
                                                    headerClass="fixed sortable" 
                                                    style="width:16,6%"
                                                    autolink="true">
                                        <div class="dspText">
                                            ${arch.CMASK}
                                        </div>
                                    </display:column>
                                    
                                    <display:column title="${title8}" 
                                                    headerClass="fixed sortable" 
                                                    style="width:16,6%"
                                                    autolink="true">
                                        <div class="dspText">
                                            <input type="checkbox" id="CEDIT" name="CEDIT"                                                
                                               <c:if test="${arch.CEDIT == 1}">checked="true"</c:if>
                                               value="1" disabled="disabled"/>
                                        </div>
                                    </display:column>
                                    
                                    <display:column title="" sortable="false" sortProperty="" headerClass="fixed sortable"  media="html" autolink="false" >
                                        <div class="dspText">
                                        
                                               <img border="0" 
                                               id="CAGENTE_TEXT_IMG" 
                                               src="images/delete.gif" 
                                               onclick="f_borrar_definicion('${arch.NORDEN}', '${arch.CCAMPO}', '${arch.CTIPCAM}')" 
                                               style="cursor:pointer"/>   
                                
                                        </div>
                                        
                                    </display:column>
                                    
                                    <display:column title="" sortable="false" sortProperty="" headerClass="fixed sortable"  media="html" autolink="false" >
                                        <div class="dspText">
                                        
                                               <img border="0" 
                                               id="MODIF_DEF" 
                                               src="images/lapiz.gif" 
                                               onclick="f_abrir_axisadm091('${arch.NORDEN}', '${arch.CCAMPO}', '${arch.CTIPCAM}', 'MOD');" 
                                               style="cursor:pointer"/>   
                                
                                        </div>                                        
                                    </display:column>
                                    
                                </display:table>
                            </div>
                        </td>
                    </tr>
                </table>
                     
                     
             <!-- FIELD_VALIDATOR -->
        <div class="separador"></div>
        <div class="titulo">
            <img src="images/flecha.gif"/><axis:alt f="axisadm090" c="FIELD_VALIDATOR" lit="9907702"/>
        </div>
       <div style="float:right;" id="BT_SIN_NUEVO_AG">
            <axis:visible f="axisadm090" c="BT_SIN_NUEVO_AG">
                <!-- uuuu -->
                <a href="javascript:f_abrir_axisadm092();">
                    <img border="0"
                         alt='<axis:alt f="axisadm090" c="LIT_SIN_ADD_AG" lit="9907702"/>'
                         title='<axis:alt f="axisadm090" c="LIT_SIN_ADD_AG" lit="9907702"/>'
                         src="images/new.gif"/></a>
            </axis:visible>
            
        </div>
        <div style="clear:both;">
            <hr class="titulo">
        </div> 
        <div class="separador">&nbsp;</div>
            <table class="area" align="center">
                <tr>
                    <td align="left" class="campocaja">
                        <!--CAMPOS FIELD_VALIDATION -->
                        <c:set var="title0">
                            <axis:alt f="axisadm090" c="HEAD_FOOT" lit="9908022"/>
                        </c:set><!-- header/footer -->
                         
                        <c:set var="title1">
                            <axis:alt f="axisadm090" c="OPERA" lit="9907703"/>
                        </c:set><!-- operation -->
                         
                        <c:set var="title2">
                            <axis:alt f="axisadm090" c="CONT_FIELD" lit="9907705"/>
                        </c:set>
                         
                        <!-- content field-->
                         
                        <c:set var="title3">
                            <axis:alt f="axisadm090" c="DEL_F_VALI" lit="9907706"/>
                        </c:set><!-- delete -->
                        
                        <c:set var="title4">
                            <axis:alt f="axisadm090" c="CONT_FIELD_NAME" lit="9908021"/>
                        </c:set>
                        
                        <div class="displayspace">
                            <display:table name="${map_valida}"
                                           id="valida" export="false" class="dsptgtable"
                                           pagesize="-1" cellpadding="0" cellspacing="0"
                                           requestURI="">
                                <%@ include file="../include/displaytag.jsp"%>
                                <display:column title="${title4}" sortable="true"
                                                sortProperty="${valida.CCAMPO1}"
                                                headerClass="sortable" style="width:16,6%"
                                                media="html" autolink="false">
                                    <div class="dspText">
                                        ${valida.CCAMPO1}
                                    </div>
                                </display:column>
                                
                                 <display:column title="${title1}" sortable="true"
                                                sortProperty="${valida.CTIPCAM1}"
                                                headerClass="sortable" media="html"
                                                autolink="false">
                                    <div class="dspText">
                                        ${valida.CTIPCAM1}
                                    </div>
                                </display:column>
                                
                                <display:column title="${title0}" sortable="true"
                                                sortProperty=" ${valida.COPERADOR}"
                                                headerClass="sortable" style="width:16,6%"
                                                media="html" autolink="false">
                                    <div class="dspText">
                                        ${valida.COPERADOR}
                                    </div>
                                </display:column>
                                
                                <display:column title="${title4}" sortable="true"
                                                sortProperty="${valida.CCAMPO2}"
                                                headerClass="sortable" media="html"
                                                autolink="false">
                                    <div class="dspText">
                                       ${valida.CCAMPO2}
                                    </div>
                                </display:column>
                                
                 
                                <display:column title="${title2}" sortable="true"
                                                sortProperty="${valida.CTIPCAM2}"
                                                headerClass="sortable" media="html"
                                                autolink="false">
                                    <div class="dspText">
                                        ${valida.CTIPCAM2}
                                    </div>
                                </display:column>
                                
                               <display:column title="" sortable="false" sortProperty="" headerClass="fixed sortable"  media="html" autolink="false" >
                                    <div class="dspText">
                                    
                                           <img border="0" 
                                           id="CAGENTE_TEXT_IMG" 
                                           src="images/delete.gif" 
                                           onclick="f_borrar_validacion()" 
                                           style="cursor:pointer"/>   
                            
                                    </div>
                                    
                                </display:column>
                                
                            </display:table>
                        </div>
                    </td>
                </tr>
     </table></td>
            </tr>
     
     </table>
          <c:import url="../include/mensajes.jsp" />
          <c:import url="../include/botonera_nt.jsp">
          <c:param name="f">axisadm090</c:param>
          <c:param name="__botones">salir</c:param>
           </c:import>

 </form>

</body>


</html>