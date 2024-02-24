<%/*
*  Fichero: axisman004.jsp
*
*  
*/
%>
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
        <c:import url="../include/carga_framework_js.jsp"/> 
         
        <script type="text/javascript">
        
            function f_onload() {
            
               
                f_cargar_propiedades_pantalla(); 
                var nomina=objDom.getValorPorId("NOMINASEL");
               if(nomina!='' && nomina!=null){
               abrir_imprimir(nomina);
               alert('<axis:alt f="axisman004" c="NUMERO_NOMINA" lit="9906757"/>'+' '+nomina);
                 f_limpiarForm();
                 }
                objDom.setValorPorId("NOMINASEL","");
            }  
            
            function abrir_modal_imprimir(){
            
            var NOMINA= $("#NOMINA").val();
                if (objUtiles.estaVacio(NOMINA)) {
                alert('<axis:alt f="axisman004" c="FALTA_NOMINA" lit="9906754"/>');
                }else{
                 abrir_imprimir(NOMINA);                    
                }            
            }
            
            
            function abrir_imprimir(nomina){
            f_abrir_modal('axisman006',null,'&NOMINA='+nomina);  
            }
            
              function cargar_acciones_sel(estado,valida) {
             
              var ESTADO=estado;  
            objAjax.invokeAsyncCGI("axis_axisman004.do?", callbackAjaxCargarComboAcciones, "operation=ajax_cargar_acciones&ESTADO="+ESTADO+"&VALIDA="+valida,
             this, objJsMessages.jslit_cargando);
                                  
           }
               function f_cerrar_axisman006(){
                objUtiles.cerrarModal("axisman006");
            }   
          
           
            function f_abrir_modal(cual, noXButton, optionalQueryString) {
              
                if (objUtiles.estaVacio(optionalQueryString))                
                    optionalQueryString = "";
                
                if (noXButton) 
                    objDom.setVisibilidadPorId("but_cerrar_modal_" + cual, "hidden");    

                objUtiles.abrirModal(cual, "src", "modal_" + cual + ".do?operation=init" + optionalQueryString);   
            }
           
           
              function cargar_acciones(obj,estado,NUMFOLIO) {
                                     
              var ESTADO=estado;      
              
              MARCAR = obj.checked?1:0;
              
              valida = validaCheck();                              
                    
            objAjax.invokeAsyncCGI("axis_axisman004.do?", callbackAjaxCargarComboAcciones, "operation=ajax_cargar_acciones&ESTADO="+ESTADO+"&NUMFOLIO="+NUMFOLIO+"&MARCAR="+MARCAR+"&VALIDA="+valida,
                                  this, objJsMessages.jslit_cargando);                       
                     
              if(validaCheck()==0){
               var CCRITERIOCombo = document.miForm.ACCION; 
                objDom.borrarOpcionesDeCombo(CCRITERIOCombo);
                objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", '<axis:alt f="axiscomi010" c="MIN_VALUE" lit="108341"/>', CCRITERIOCombo, 0);
                objDom.setValorPorId("ACCION","<%= Integer.MIN_VALUE %>");
                 }
                 else
                 {
                 objDom.setValorPorId("CADENA","1");
                 }
            
            
                                       
            }
            
                       function callbackAjaxCargarComboAcciones(ajaxResponseText){
                 var doc=objAjax.domParse(ajaxResponseText);
               
                    var elementos = doc.getElementsByTagName("element");
                    
                    
                    
                    var CCRITERIOCombo = document.miForm.ACCION;     
                   objDom.borrarOpcionesDeCombo(CCRITERIOCombo);
                   objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", '<axis:alt f="axiscomi010" c="MIN_VALUE" lit="108341"/>', CCRITERIOCombo, 0);
                       for (i = 0; i < elementos.length; i++) {
                            var CCRITERIO= objDom.getValorNodoDelComponente(doc.getElementsByTagName("CATRIBU"), i, 0);
                            var TCRITERIO = objDom.getValorNodoDelComponente(doc.getElementsByTagName("TATRIBU"), i, 0);                                     
                            objDom.addOpcionACombo(CCRITERIO, TCRITERIO, CCRITERIOCombo, i+1);
                        }                   
              
          
                 }
            
            
              function validaCheck() {
              var con=0;
             $(".NUMEROFOLIO:checkbox:checked").each(function(){
            con++;
            }); 
            return con;
        } 
            
           function ChequearTodosBut() { 
            
            var estado=objDom.getValorPorId("ESTADOSEL");
            cargar_acciones_sel(estado,1); 
            
            objDom.setValorPorId("CADENA","1");
            
            for (var i=0;i < document.forms["miForm"].elements.length;i++){ 
           
            var elemento = document.forms[0].elements[i]; 
                    if (elemento.type == "checkbox"){ 
                        elemento.checked =true;
                    }                
            }
            

        } 
        

        function DesChequearTodosBut() { 
        var estado;
        cargar_acciones_sel(estado,0); 
        
            for (var i=0;i < document.forms["miForm"].elements.length;i++){ 
                  var elemento = document.forms[0].elements[i]; 
                      if (elemento.type == "checkbox"){ 
                          elemento.checked =false;
                    } 
                    }
                      var CCRITERIOCombo = document.miForm.ACCION; 
                objDom.borrarOpcionesDeCombo(CCRITERIOCombo);
                objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", '<axis:alt f="axiscomi010" c="MIN_VALUE" lit="108341"/>', CCRITERIOCombo, 0);
                objDom.setValorPorId("ACCION","<%= Integer.MIN_VALUE %>");
            }  
         
            
            function f_but_salir(){
                objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axisman004", "cancelar", document.miForm, "_self");            
            }

            function f_limpiarForm(){
                    objDom.setValorPorId("SITMANDATO","<%= Integer.MIN_VALUE %>");
                    objDom.setValorPorId("NOMINA","");
                    objDom.setValorPorId("ACCION","<%= Integer.MIN_VALUE %>");
                    objDom.setValorPorId("CADENA","");
                    objDom.setValorPorId("ESTADOSEL","");
                    objDom.setValorPorId("NOMINASEL","");
                    
                    
            }
            
          
            
            function f_buscar(){
         var NOMINA= $("#NOMINA").val();
         var SITMANDATO= $("#SITMANDATO").val();
         objDom.setValorPorId("ESTADOSEL","");
           if (objUtiles.estaVacio(NOMINA) && objUtiles.estaVacio(SITMANDATO)) 
                alert('<axis:alt f="axisman004" c="INFORMARCAMPOS" lit="9906716"/>');
         else{
          if (objValidador.validaEntrada()) 
                    objUtiles.ejecutarFormulario("axis_axisman004.do","m_buscar",document.miForm, "_self", objJsMessages.jslit_cargando);   
               
           }
           }
           
            function f_but_aceptar(){
            
               //objDom.setValorPorId("CADENA","");
             
                $(".NUMEROFOLIO:checkbox:checked").each(function(){
                $("#CADENA").val($("#CADENA").val()+"-"+$(this).val());
                });
                
                
                
            if(objDom.getValorPorId("CADENA")=="" || objDom.getValorPorId("CADENA")==null){ 
               alert('<axis:alt f="axisman004" c="INFORMARMANDATO" lit="9906730"/>');
             }
             else{
             if(objDom.getValorPorId("ACCION")=="" || objDom.getValorPorId("ACCION")==null  || objDom.getValorPorId("ACCION")=="<%= Integer.MIN_VALUE %>"){
                alert('<axis:alt f="axisman004" c="INFORMARACCION" lit="9906729"/>');      
                 }else{
                    objUtiles.ejecutarFormulario("axis_axisman004.do","m_aceptar",document.miForm, "_self", objJsMessages.jslit_cargando);   
                   //alert (objDom.getValorPorId("CADENA"));
                    }
                }
            }            
                       
         
        </script>
    </head>
    <body onload="f_onload()">
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>

    <form name="miForm" action="axis_axisman004.do" method="POST">
            <input type="hidden" id="operation" name="operation" value=""/>
            <input type="hidden" id="CADENA" name="CADENA" value="${__formdata.CADENA}"/>
            <input type="hidden" id="ESTADOSEL" name="ESTADOSEL" value="${__formdata.ESTADOSEL}"/> 
            <input type="hidden" id="NOMINASEL" name="NOMINASEL" value="${__formdata.NOMINASEL}"/> 
                        <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt c="form" f="axisman004" lit="9000594"/> <axis:alt c="form" f="axisman004" lit="9906715"/></c:param>
               <c:param name="producto"><axis:alt f="axisman004" c="PRODUCTO" lit="9906588"/> - <axis:alt f="axisman004" c="PRODUCTO" lit="9002150"/> <axis:alt f="axisman0010" c="PRODUCTO" lit="9903431"/></c:param>
                <c:param name="form">axisman004</c:param>
            </c:import> 
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="nid_y_titulo">axisman006|<axis:alt f="axisman010" c="MODAL_axisman006" lit="1000205"/></c:param>
            </c:import>
          
            <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                <td>
                 <div class="titulo">
                    <img src="images/flecha.gif"/>
                    <axis:alt f="axisman004" c="BUSQUEDAMANDATOS" lit="9906589"/> 
                    
                </div>
                <table class="seccion" cellpadding="0" cellspacing="0">
                <tr>
                    <td align="left" >
                            <table class="area" align="center">
                            <tr>
                                <th style="width:20%;"></th>
                                <th style="width:15%;"></th>
                                <th style="width:20%;"></th>                                
                                <th ></th>   
                            </tr>  
                            
                                <tr>
                                <axis:ocultar f="axisman004" c="SITMANDATO" dejarHueco="false"> 
                                    <td class="titulocaja"  id="tit_SITMANDATO">
                                       <b id="label_SITMANDATO" ><axis:alt f="axisman004" c="SITUACION" lit="100874"/> <axis:alt f="axisman004" c="MANDATO" lit="9906597"/></b>
                                    </td>
                                </axis:ocultar>
                                 <axis:ocultar f="axisman001" c="NOMINA" dejarHueco="false"> 
                                    <td class="titulocaja"  id="tit_NOMINA">
                                       <b id="label_NOMINA"><axis:alt f="axisman001" c="NOMINA" lit="9906644"/></b>
                                    </td>
                                </axis:ocultar>
                             </tr>
                             
                            <tr>
                                  <axis:ocultar f="axisman001" c="SITMANDATO" >
                                   
                                   <td class="campocaja"  id = "td_SITMANDATO">
                                        <select name="SITMANDATO" id="SITMANDATO" size="1" class="campowidthselect campo campotexto_ob" style="width:84%;" value="${__formdata.SITMANDATO}"
                                                title="<axis:alt f="axisman004" c="SITUACION" lit="100874"/> <axis:alt f="axisman004" c="MANDATO" lit="9906597"/>"
                                            <axis:atr f="axisman004" c="SITMANDATO" a="isInputText=false"/>>
                                            <option value="<%= Integer.MIN_VALUE %>">
                                                <axis:alt f="axisman004" c="SELECCIONAR" lit="108341"/>                                
                                            </option>
                                            <c:forEach var="accions" items="${listsitmandato}">
                                                <option value="${accions.CATRIBU}"
                                                <c:if test="${__formdata.SITMANDATO == accions.CATRIBU}">selected</c:if>>
                                                ${accions.TATRIBU}
                                                </option>
                                            </c:forEach>
                                        </select>
                                    </td>  
                                </axis:ocultar> 
                                
                                
                                <axis:ocultar f="axisman004" c="NOMINA" >
                                    <td class="campocaja">
                                        <input type="text" class="campodisabled campo campotexto" value="${__formdata.NOMINA}" name="NOMINA" id="NOMINA" formato="entero"
                                              style="width:100%" size="15" />
                                    </td>
                                </axis:ocultar>
                               <axis:ocultar f="axisman004" c="BT_BUSCAR" dejarHueco="false">
                                <td class="campocaja">
                                  <a href="javascript:abrir_modal_imprimir()"> <img border="0"  alt="<axis:alt f="axisman004" c="DOCMAN" lit="9002213"/>"   title="<axis:alt f="axisctr020" c="DOCPOL" lit="9002213"/>" src="images/print.gif"/></a>
                                  <input type="button" class="boton" value="<axis:alt f="axisman004" c="BUSCAR" lit="100797"/>" onclick="f_buscar()" />
                                  </td>
                                </axis:ocultar>
                                
                                
                            </tr>
                          
                        </table>
            </td>
        </tr>
         <tr>
                <td>
                 <div class="titulo">
                    <img src="images/flecha.gif"/>
                <axis:alt c="form" f="axisman004" lit="9000594"/> <axis:alt c="form" f="axisman004" lit="9906715"/>
                </div>
               <table class="seccion" cellpadding="0" cellspacing="0">
                <tr>
                    <td align="left" >
                            <table class="area" align="center">
                            <tr>
                               <th style="width:20%;"></th>
                                <th style="width:80%;"></th>                                                       
                                
                            </tr>
                            <tr>
                                <axis:ocultar f="axisman004" c="ACCION" dejarHueco="false"> 
                                    <td class="titulocaja">
                                       <b><axis:alt f="axisman004" c="ACCION" lit="9000844"/></b>
                                    </td>                                    
                                </axis:ocultar>
                                
                            </tr>
                            <tr>
                            
                             <axis:ocultar f="axisman001" c="ACCION" >
                                   
                                   <td class="campocaja"  id = "td_ACCION">
                                        <select name="ACCION" id="ACCION" size="1" class="campowidthselect campo campotexto_ob" style="width:84%;" 
                                                title="<axis:alt f="axisman004" c="ACCION" lit="9000844"/>" value=${__formdata.ACCION}
                                            <axis:atr f="axisman004" c="ACCION" a="isInputText=false"/>>
                                            <option value="<%= Integer.MIN_VALUE %>">
                                                <axis:alt f="axisman004" c="SELECCIONAR" lit="108341"/>                                
                                            </option>
                                            <c:forEach var="acciones" items="${listacciones}">
                                                <option value="${acciones.CATRIBU}"
                                                <c:if test="${__formdata.ACCION == acciones.CATRIBU}">selected</c:if>>
                                                ${acciones.TATRIBU}
                                                </option>
                                            </c:forEach>
                                        </select>
                                    </td>  
                                </axis:ocultar> 
                                   <td class="campocaja"> 
                                   <axis:ocultar f="axisman004" c="BT_SELECCIONAR" dejarHueco="false">
                              
                                <input type="button" class="boton" value="<axis:alt f="axisman004" c="BT_SELECCIONAR" lit="9000756"/>" onclick="ChequearTodosBut()" />
                               
                                </axis:ocultar>
                                
                                 <axis:ocultar f="axisman004" c="BT_DESELECCIONAR" dejarHueco="false">
                              
                                <input type="button" class="boton" value="<axis:alt f="axisman004" c="BT_DESELECCIONAR" lit="9000757"/>" onclick="DesChequearTodosBut()" />
                                 
                                </axis:ocultar>
                                 </td>
                            </tr>   
                               <tr>
                                        <td class = "campocaja" colspan="5" >
                                            <div class="separador">&nbsp;</div>  
                                             <div style="float:left;">
                                                   <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axisman004" c="TITULO" lit="9906588"/></div>
                                             </div>
                                             

                                        </td>
                                     </tr>
                                     <axis:ocultar f="axisctr004" c="DSP_CUENTAS" dejarHueco="false">   
                                         <tr>
                                            <td class = "campocaja" colspan="5">
                                            
                                            <c:set var="title0"><axis:alt f="axisman001" c="MANDATO" lit="9906670"/></c:set>
                                       <c:set var="title1"><axis:alt f="axisman004" c="RDEUDOR" lit="9906598"/></c:set>
                                       <c:set var="title2"><axis:alt f="axisman004" c="RMANDANTE" lit="9906599"/></c:set>
                                       <c:set var="title3"><axis:alt f="axisman004" c="FORPAGO" lit="9902938"/></c:set>
                                       <c:set var="title4"><axis:alt f="axisman004" c="BANCO" lit="9000964"/></c:set>
                                       <c:set var="title5"> <axis:alt f="axisman004" c="SUCURSAL" lit="9002202"/></c:set> 
                                        <c:set var="title6"><axis:alt f="axisman004" c="TIPTAR" lit="9902671"/></c:set>
                                        <c:set var="title7"><axis:alt f="axisman004" c="NUMTAR" lit="9906593"/></c:set>
                                        <c:set var="title8"><axis:alt f="axisman004" c="NCTACTE" lit="9903154"/></c:set>
                                        <c:set var="title9"><axis:alt f="axisman004" c="ULTIMA" lit="9906714"/> <axis:alt f="axisman004" c="NOMINA" lit="9906644"/></c:set>
                                        <c:set var="title10"><axis:alt f="axisman004" c="SITUACION" lit="100874"/></c:set>
                                            <div class="displayspaceGrande">
                                             
                                <display:table name="${listmandatos}"
                                               id="miListaId" export="false"
                                               class="dsptgtable" pagesize="15"                                              
                                               defaultorder="ascending"
                                               sort="list" cellpadding="0"
                                               cellspacing="0"
                                               requestURI="axis_axisman004.do?paginar=true&operation=form">
                                  <%@ include file="../include/displaytag.jsp"%>
                                  <display:column sortable="true"
                                                  sortProperty=""
                                                  headerClass="sortable fixed"
                                                  media="html" autolink="false" style="width:4%">
                                    <div class="dspText">    
                                    <input type="checkbox" id="NUMEROFOLIO" name="NUMEROFOLIO" value="${miListaId['NUMEROFOLIO']}" onclick="cargar_acciones(this,${miListaId['SITUACION']},${miListaId['NUMEROFOLIO']})"
                                     <c:if test="${miListaId.MARCAR == 1}"> checked </c:if>
                                     class="NUMEROFOLIO" <c:if test="${miListaId.EDITABLE == 0 }"> style="visibility:hidden;"  </c:if> />
                                    </div>
                                  </display:column>                
                                   <display:column title="${title0}"
                                                  sortable="true"
                                                  sortProperty="NUMEROFOLIO"
                                                  headerClass="sortable fixed"
                                                  media="html" autolink="false">
                                    <div class="dspText">
                                    ${miListaId['NUMEROFOLIO']}</div>
                                   
                                  </display:column>
                               
                                 <display:column title="${title10}"
                                                  sortable="true"
                                                  sortProperty="SITUACION"
                                                  headerClass="sortable fixed"
                                                  media="html" autolink="false">
                                    <div class="dspText">
                                    ${miListaId['SITUACIONDESC']}</div>
                                   
                                  </display:column>
                                  
                                  <display:column title="${title1}"
                                                  sortable="true"
                                                  sortProperty="RUTDEUDOR"
                                                  headerClass="sortable fixed"
                                                  media="html" autolink="false">
                                    <div class="dspText">
                                     ${miListaId['RUTDEUDOR']}</div>    
                                    
                                  </display:column>
                                  <display:column title="${title2}"
                                                  sortable="true"
                                                  sortProperty="RUTMANDANTE"
                                                  headerClass="sortable fixed"
                                                  media="html" autolink="false">
                                    <div class="dspText">
                                     ${miListaId['RUTMANDANTE']}</div>   
                                   
                                  </display:column>
                                  <display:column title="${title3}"
                                                  sortable="true"
                                                  sortProperty="FORMAPAGO"
                                                  headerClass="sortable fixed"
                                                  media="html" autolink="false">
                                    <div class="dspText">
                                     ${miListaId['FORMAPAGO']}</div>   
                                   
                                  </display:column>
                                  <display:column title="${title4}"
                                                  sortable="true"
                                                  sortProperty="BANCO"
                                                  headerClass="sortable fixed"
                                                  media="html" autolink="false">
                                    <div class="dspText">
                                     ${miListaId['BANCO']}</div>   
                                   </display:column>
                                   
                                    <display:column title="${title5}"
                                                  sortable="true"
                                                  sortProperty="SUCURSAL"
                                                  headerClass="sortable fixed"
                                                  media="html" autolink="false">
                                    <div class="dspText">
                                     ${miListaId['SUCURSAL']}</div>   
                                   </display:column>
                                   
                                  <display:column title="${title8}"
                                                  sortable="true"
                                                  sortProperty="CUENTABANCARIA"
                                                  headerClass="sortable fixed"
                                                  media="html" autolink="false">
                                    <div class="dspText">
                                     ${miListaId['CUENTABANCARIA']}</div>   
                                   </display:column>
                                   
                                      <display:column title="${title6}"
                                                  sortable="true"
                                                  sortProperty="TIPOTARJETA"
                                                  headerClass="sortable fixed"
                                                  media="html" autolink="false">
                                    <div class="dspText">
                                     ${miListaId['TIPOTARJETA']} </div>   
                                   </display:column>
                                   
                                   <display:column title="${title9}"
                                                  sortable="true"
                                                  sortProperty="ULTNOMINA"
                                                  headerClass="sortable fixed"
                                                  media="html" autolink="false">
                                    <div class="dspText">
                                     ${miListaId['ULTNOMINA']} </div>   
                                   </display:column>
                                   
                                </display:table>
                                              </div>                                            
                                            </td>
                                          </tr>
                                      </axis:ocultar>   
                                  
                            
                            </table>
                    </td>
                </tr>
                </table>
                
               </td>
         </tr>
          
        </table>
    </form>    
    <c:import url="../include/botonera_nt.jsp">
       <c:param name="f">axisman004</c:param>
       <c:param name="__botones"><axis:ocultar f="axisman004" c = "BT_SALIR" dejarHueco="false">salir</axis:ocultar><axis:ocultar f="axisman004" c="BT_ACEPTAR">,aceptar</axis:ocultar></c:param>
    </c:import>
       
</body>
</html>


