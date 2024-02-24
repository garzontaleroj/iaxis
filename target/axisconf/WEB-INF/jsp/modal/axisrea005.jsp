<%/* Revision:# jHVssfLFX5RlrKw24lQNJA== # */%>
<%-- 
*  Fichero: axisrea005.jsp
*  @author <a href = "mailto:icanada@csi-ti.com">Iván Cañada</a>
*
*  Fecha: 23/10/2009
*/
--%>
<%@ page contentType="text/html;charset=windows-1252" errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<html>
  <head>
    <link rel="stylesheet" href="styles/genericosHtml.css" type="text/css">
    <link rel="stylesheet" href="styles/axisnt.css" type="text/css">
    <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>
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

        function f_onload_axisrea005() {
        
            f_cargar_propiedades_pantalla();
            
            //Revisar si se esta modificando          
            if (objDom.getValorPorId("H_MODIF") == 1)
            {             
                objDom.setDisabledPorId("CCOMPANI",true);
                objDom.setValorPorId("CCOMPANI_MOD",objDom.getValorPorId("CCOMPANI"));
            }
            
            var grabarOK = '${requestScope.grabarOK}';
            if (!objUtiles.estaVacio(grabarOK) && grabarOK == "0"){
                      parent.f_aceptar_axisrea005($('#deletedCuadroces').val());   
            }
                    
        }
                
        function f_but_aceptar() {
            if (objValidador.validaEntrada()) {    
                
                var newCuadroces = $('#CTRAMO').val() + '-' + $('#CCOMPANI').val();
                var deletedCuadroces = $('#deletedCuadroces').val()+'';
                var parejas = deletedCuadroces.split(',');
                var i=0;
                for(i=0;i<parejas.length;i++){
                    if(parejas[i]==newCuadroces){
                        deletedCuadroces = deletedCuadroces.replace(newCuadroces,'');
                        if(deletedCuadroces.charAt(deletedCuadroces.length)==','){
                            deletedCuadroces = deletedCuadroces.substr(0,deletedCuadroces.length-1)
                        }
                        $('#deletedCuadroces').val(deletedCuadroces);
                    }
                }
               objUtiles.ejecutarFormulario("modal_axisrea005.do", "grabar", document.miForm, "_self");                      
            }            
        }
        
        function f_but_cancelar() { 
               parent.f_cerrar_modal("axisrea005");                
        }    
        
        function f_actualiza_number(CAMPON){                                              
                objDom.setValorPorId(CAMPON,objNumero.formateaNumeroCero(objDom.getValorPorId(CAMPON),true));
        }       
        
        /*function f_oculta_reserv()
        {  
            if (objDom.getValorPorId("IRESERV") != null)
            {
                objDom.setVisibilidadPorId("PRESERV","hidden");
                objDom.setVisibilidadPorId("label_PRESERV","hidden");
                objDom.setVisibilidadPorId("CRESREF","hidden");
                objDom.setVisibilidadPorId("label_CRESREF","hidden");
            }
       
            
            if (objDom.getValorPorId("CRESDEF") != null)
            {
                objDom.setVisibilidadPorId("PRESERV","hidden");
                objDom.setVisibilidadPorId("label_PRESERV","hidden");
                objDom.setVisibilidadPorId("IRESERV","hidden");
                objDom.setVisibilidadPorId("label_IRESERV","hidden");
            }
            
            if (objDom.getValorPorId("PRESERV") != null)
            {
                objDom.setVisibilidadPorId("CRESDEF","hidden");
                objDom.setVisibilidadPorId("label_CRESDEF","hidden");
                objDom.setVisibilidadPorId("IRESERV","hidden");
                objDom.setVisibilidadPorId("label_IRESERV","hidden");
            }            
            //objDom.getValorPorId("PRESERV") == null 
             //&& objDom.getValorPorId("CRESDEF") == null
            
            if (objDom.getValorPorId("IRESERV") == null)
            {
                objDom.setVisibilidadPorId("PRESERV","visible");
                objDom.setVisibilidadPorId("IRESERV","visible");
                objDom.setVisibilidadPorId("CRESREF","visible");
                objDom.setVisibilidadPorId("label_PRESERV","visible");
                objDom.setVisibilidadPorId("label_IRESERV","visible");
                objDom.setVisibilidadPorId("label_CRESREF","visible");
            }
            
            
        }*/
        
        /*function actualitzarCheckbox(obj){
         objDom.setValorPorId("CENTER", ((objDom.getComponenteMarcado(obj))? "1" : "0" ));
        }*/

    </script>
  
  
  </head>
  <body onload="f_onload_axisrea005()">
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
  
  
 
    <!--form name="axisrea004Form" action="" method="POST"-->
    <form name="miForm" action="modal_axisrea005.do" method="POST">
        <input type="hidden" name="operation" value=""/>
        <input type="hidden" name="CTRAMO" id="CTRAMO"  value="${__formdata.CTRAMO}"/>
        <input type="hidden" name="H_MODIF"  value="${__formdata.H_MODIF}"/>
        <input type="hidden" name="CCOMPANI_MOD"  value="${__formdata.CCOMPANI_MOD}"/>
        <input type="hidden" name="NVERSIO"  value="${__formdata.NVERSIO}"/>
        <input type="hidden" name="SCONTRA"  value="${__formdata.SCONTRA}"/>
        <input type="hidden" name="deletedCuadroces" id="deletedCuadroces"  value="${__formdata.deletedCuadroces}"/>
        <c:import url="../include/titulo_nt.jsp">
            <c:param name="formulario"><axis:alt f="axisrea005" c="LIT_NOMBRE_PANTALLA" lit="9002228" /></c:param>
            <c:param name="producto"><axis:alt f="axisrea005" c="ALT_NOMBRE_PANTALLA" lit="9002228" /></c:param>
            <c:param name="form">axisrea005</c:param>
        </c:import>
<% System.out.println("***************************************** Axisrea005 xxx 1"); %>
        <!-- Area de campos  -->
        <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0" style="height:130px">
            <div class="separador">&nbsp;</div>
            <tr>
                <td>
                
                    <!-- CUADROS -->
                    <table class="area">
                                        <tr>
                                            <th style="width:22.5%;height:0px"></th>                                            
                                            <th style="width:10%;height:0px"></th>
                                            <th style="width:22.5%;height:0px"></th>
                                            <th style="width:22.5%;height:0px"></th>
                                            <th style="width:22.5%;height:0px"></th>                                              
                                                    <tr> 
                                                         <axis:ocultar f="axisrea005" c="CCOMPANI">
                                                         <td class="titulocaja" colspan="1"><b><axis:alt f="axisrea005" c="LIT_CCOMPANI" lit="9000600"/></b></td> <%-- Compañía --%>
                                                         </axis:ocultar>                                                              
                                                         <axis:ocultar f="axisrea005" c="PCESION">
                                                         <td class="titulocaja" colspan="1"><b><axis:alt f="axisrea005" c="LIT_PCESION" lit="9000613"/></b></td> <%-- Porcentaje cesion --%>                                                         
                                                         </axis:ocultar>     
                                                         <axis:ocultar f="axisrea005" c="ISCONTA">
                                                         <td class="titulocaja" colspan="1"><b><axis:alt f="axisrea005" c="LIT_ISCONTA" lit="9000616"/></b></td> <%-- Siniestros al Contado --%>                                                    
                                                         </axis:ocultar>     
                                                         <axis:ocultar f="axisrea005" c="CCOMREA">
                                                         <td class="titulocaja" colspan="1"><b><axis:alt f="axisrea005" c="LIT_CCOMREA" lit="9001922"/></b></td> <%-- Codigo de Comisión --%>                                               
                                                         </axis:ocultar>     
                                                    </tr> 
                                                    <tr>                                                       
                                                       <td class="campocaja" colspan="1"> <%-- Compañia Reaseguradora --%>
                                                       <axis:ocultar f="axisrea005" c="CCOMPANI">
                                                       <select name="CCOMPANI" id="CCOMPANI" size="1" class="campowidthselect campo campotexto" obligatorio="true" style="width:100%;">                                                            
                                                            <option value=""> - <axis:alt f="axisrea005" c="ALT_PCCOMPANI" lit="9000600"/> - </option>
                                                            <c:forEach var="element" items="${__formdata.listaCompReaseg}">
                                                                <option value = "${element.CCOMPANI}" 
                                                                <c:if test="${element.CCOMPANI == __formdata.CCOMPANI}"> selected </c:if> >
                                                                ${element.TCOMPANI} 
                                                                </option>
                                                            </c:forEach>
                                                        </select>           
                                                        </axis:ocultar>   
                                                    
                                                       </td>   
                                                      <td class="campocaja" colspan="1"> <!-- PCESION -->
                                                        <axis:ocultar f="axisrea005" c="PCESION">
                                                            <input type="text" class="campo campotexto"  obligatorio="true" id="PCESION" onchange="f_actualiza_number('PCESION')" name="PCESION" style="width:80%"
                                                             onblur="if(!objUtiles.estaVacio(this.value)) if(!objValidador.esCampoNumerico(this.value, true, -1,'<axis:alt f="axisrea005" c="PCESION" lit="9000613"/>')){this.value='';this.focus()}else{var num=parseFloat(objNumero.cambiarSeparadorDecimalesPorMiles(objNumero.stripNonNumeric(this.value))); if(num>100){alert('<axis:alt f="axisrea005" c="PCESION" lit="1000390"/>');this.value='';this.focus()}}" 
                                                            value="${__formdata.PCESION}" <axis:atr f="axisrea005" c="PCESION" a="modificable=true"/>/>
                                                        </axis:ocultar>    
                                                      </td>
  <% System.out.println("***************************************** Axisrea005 ### 2"); %>                                                    
       
                                                      <td class="campocaja" colspan="1" > <!-- ISCONTA -->
                                                        <%--<axis:visible f="axisrea005" c="ISCONTA">
                                                            <input type="text" class="campo campotexto" id="ISCONTA" name="ISCONTA" style="width:80%"
                                                            value="<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${__formdata.ISCONTA}"/>" <axis:atr f="axisrea005" c="ISCONTA" a="modificable=true"/>/>                                                            
                                                        </axis:visible>--%> 
                                                        
                                                        <axis:ocultar f="axisrea005" c="ISCONTA">
                                                            <input type="text" class="campo campotexto" id="ISCONTA" onchange="f_actualiza_number('ISCONTA')" name="ISCONTA" style="width:80%"
                                                            value="${__formdata.ISCONTA}" <axis:atr f="axisrea005" c="ISCONTA" a="modificable=true"/>/>                                                            
                                                        </axis:ocultar>   
                                                      </td>
                                                      <% System.out.println("***************************************** Axisrea005 ### 3"); %>
                                                       <td class="campocaja" colspan="1"> <!-- CCOMREA -->
                                                        <axis:ocultar f="axisrea005" c="CCOMREA">
                                                               <select name="CCOMREA" id="CCOMREA" size="1" class="campowidthselect campo campotexto" style="width:82.5%;">                                                            
                                                                <option value=""> - <axis:alt f="axisrea005" c="ALT_CCOMREA" lit="9001922"/> - </option>
                                                                <c:forEach var="element" items="${__formdata.LST_COMISREA}">
                                                                    <option value = "${element.CCOMREA}" <c:if test="${element.CCOMREA == __formdata.CCOMREA}"> selected </c:if> >
                                                                    ${element.TDESCRI} 
                                                                    </option>
                                                                </c:forEach>
                                                            </select>                                                             
                                                            <%--<input type="text" class="campo campotexto" id="CCOMREA" name="CCOMREA" style="width:80%"
                                                            value="${__formdata.CCOMREA}" <axis:atr f="axisrea005" c="CCOMREA" a="modificable=true"/>/>--%>
                                                        </axis:ocultar>    
                                                       </td>                                                               
                                                    </tr>  
                                                    
                                                    <tr>       
                                                         <axis:ocultar f="axisrea005" c="ICOMFIJ">
                                                            <td class="titulocaja" colspan="1"><b><axis:alt f="axisrea005" c="LIT_ICOMFIJ" lit="9001924"/></b></td>  <%-- Importe Fijo de Comisión --%>
                                                         </axis:ocultar>    
                                                            
                                                         <axis:ocultar f="axisrea005" c="IRESERV">
                                                            <td class="titulocaja" colspan="1" ><b id="label_IRESERV"><axis:alt f="axisrea005" c="LIT_IRESERV" lit="9001156"/></b></td>
                                                         </axis:ocultar>    
                                                         <axis:ocultar f="axisrea005" c="CRESREF">
                                                            <td class="titulocaja" colspan="1" ><b id="label_CRESREF"><axis:alt f="axisrea005" c="LIT_CRESREF" lit="9002230"/></b></td><%--Codigo Reservas --%>                                                          
                                                         </axis:ocultar>    
                                                    </tr> 
                                                    <tr>   
                                                    <axis:ocultar f="axisrea005" c="ICOMFIJ">
                                                       <td class="campocaja" colspan="1"> <!-- ICOMFIJ -->
                                                        
                                                            <input type="text" class="campo campotexto" id="ICOMFIJ" onchange="f_actualiza_number('ICOMFIJ')" name="ICOMFIJ" style="width:80%"
                                                            value="${__formdata.ICOMFIJ}" <axis:atr f="axisrea005" c="ICOMFIJ" a="modificable=true"/>/>
                                                       
                                                       </td>
                                                        </axis:ocultar>    
                                                        <%--axis:ocultar f="axisrea005" c="PRESERV">
                                                        <td class="campocaja" colspan="1"> <!-- PRESERV -->
                                                        
                                                            <input type="text" class="campo campotexto" id="PRESERV" onchange="f_actualiza_number('PRESERV')" name="PRESERV"  style="width:80%"
                                                            value="${__formdata.PRESERV}" <axis:atr f="axisrea005" c="PRESERV" a="modificable=true"/>/>                                                       
                                                       
                                                        </td>
                                                         </axis:ocultar--%> 
                                                         <axis:ocultar f="axisrea005" c="IRESERV">
                                                        <td class="campocaja" colspan="1"> <!-- IRESERV -->
                                                        
                                                            <input type="text" class="campo campotexto" id="IRESERV" name="IRESERV" onchange="f_actualiza_number('IRESERV')" style="width:80%"
                                                            value="${__formdata.IRESERV}" <axis:atr f="axisrea005" c="IRESERV" a="modificable=true"/>/>
                                                         
                                                        </td>                                                
                                                        </axis:ocultar>  
                                                        <axis:ocultar f="axisrea005" c="CRESREF">
                                                        <td class="campocaja" > <!-- CRESREF -->
                                                            <input type="text" class="campo campotexto" id="CRESREF" name="CRESREF" style="width:80%"
                                                            value="${__formdata.CRESREF}" <axis:atr f="axisrea005" c="CRESREF" a="modificable=true"/>/>
                                                        
                                                        </td>   
                                                        </axis:ocultar>   
                                                    </tr> 
                                                    <% System.out.println("***************************************** Axisrea005 ### 4"); %>
                                                    <tr>       
                                                         <axis:ocultar f="axisrea005" c="CTIPCOMIS">
                                                            <td class="titulocaja" colspan="1"><b><axis:alt f="axisrea005" c="LIT_CTIPCOMIS" lit="9902149"/></b></td>  <%-- Tipo comisión --%>
                                                         </axis:ocultar>    
                                                         <axis:ocultar f="axisrea005" c="PCTCOMIS">
                                                            <td class="titulocaja" colspan="1" ><b id="label_PCOMISI"><axis:alt f="axisrea005" c="LIT_PCTCOMIS" lit="9001923"/></b></td><%--% Comision --%>
                                                         </axis:ocultar>    
                                                         <axis:ocultar f="axisrea005" c="CTRAMOCOMISION">
                                                            <td class="titulocaja" colspan="1" ><b id="label_TRAMOSCOMISION"><axis:alt f="axisrea005" c="LIT_CTRAMOCOMISION" lit="9902207"/></b></td><%-- Tramos comisión --%>
                                                         </axis:ocultar>    
                                                        <axis:ocultar f="axisrea005" c="CCORRED">
                                                            <td class="titulocaja" colspan="1" ><b id="label_CCORRED"><axis:alt f="axisrea005" c="LIT_CCORRED" lit="9000752"/></b></td><%-- Boreker --%>
                                                         </axis:ocultar>  
                                                    </tr> 
                                                    
                                                    <tr> 
                                                       <axis:ocultar f="axisrea005" c="CTIPCOMIS">
                                                       <td class="campocaja" colspan="1"> <!-- TIPO COMISION -->
                                                        
                                                           
                                                                    <select name="CTIPCOMIS" id="CTIPCOMIS" size="1" class="campowidthselect campo campotexto" onchange=""  style="width:82.5%;">
                                                                         <option value=""> - <axis:alt f="axisrea004" c="ALT_CTIPCOMIS_SEl1" lit="1000348"/>&nbsp;<axis:alt f="axisrea004" c="ALT_TIPOCOMISION_SEl2" lit="9902149"/> - </option>
                                                                         <c:forEach var="element" items="${__formdata.ListaTipComisi}">
                                                                         <c:if test="${element.CATRIBU != 0}">
                                                                           <option value = "${element.CATRIBU}"                                                                            
                                                                                 <c:if test="${element.CATRIBU == __formdata.CTIPCOMIS}"> selected </c:if>>
                                                                                ${element.TATRIBU} 
                                                                           </option>
                                                                         </c:if>  
                                                                         </c:forEach>
                                                                   </select>                                                        
                                                    
                                                       </td>
                                                       </axis:ocultar>    
                                                       <axis:ocultar f="axisrea005" c="PCTCOMIS">
                                                       <!-- INI - AXIS 4451 - 20/06/2019 - AABG - SE AGREGA OBLIGATORIEDAD DE CAMPO -->
                                                       <td class="campocaja" colspan="1"> <!-- % COMISION -->
                                                           <input type="text" class="campo campotexto" obligatorio="true" id="PCTCOMIS" onchange="" name="PCTCOMIS" style="width:80%"
                                                            onblur="if(!objUtiles.estaVacio(this.value)) if(!objValidador.esCampoNumerico(this.value, true, -1,'<axis:alt f="axisrea005" c="PCTCOMIS" lit="9001923"/>')){this.value='';this.focus()}else{var num=parseFloat(objNumero.cambiarSeparadorDecimalesPorMiles(objNumero.stripNonNumeric(this.value))); if(num>100){alert('<axis:alt f="axisrea005" c="PCTCOMIS" lit="1000390"/>');this.value='';this.focus()}else{this.value=num.toFixed(2).replace(objNumero.getSeparadorMiles(),objNumero.getSeparadorDecimales())}}"
                                                            value="${__formdata.PCTCOMIS}" <axis:atr f="axisrea005" c="PCTCOMIS" a="modificable=true"/>/>
                                                       </td>
                                                       <!-- FIN - AXIS 4451 - 20/06/2019 - AABG - SE AGREGA OBLIGATORIEDAD DE CAMPO -->
                                                       </axis:ocultar>    
                                                       <axis:ocultar f="axisrea005" c="CTRAMOCOMISION">
                                                       <td class="campocaja" colspan="1"> <!-- TRAMOSCOMISION -->
                                                          <select name="CTRAMOCOMISION" id="CTRAMOCOMISION" size="1" class="campowidthselect campo campotexto" onchange="" style="width:82.5%;">
                                                                         <option value=""> - <axis:alt f="axisrea004" c="ALT_CTRAMOCOMISION_SEl1" lit="1000348"/>&nbsp;<axis:alt f="axisrea004" c="ALT_TRAMOSCOMISION_SEl2" lit="9902207"/> - </option>
                                                                         <c:forEach var="element" items="${__formdata.ListaTramComisi}">
                                                                         <c:if test="${element.CCODIGO != 0}">
                                                                           <option value = "${element.CCODIGO}"                                                                            
                                                                                 <c:if test="${element.CCODIGO == __formdata.CTRAMOCOMISION}"> selected </c:if>>
                                                                                ${element.TDESCRIPCION} 
                                                                           </option>
                                                                         </c:if>  
                                                                         </c:forEach>
                                                                   </select>     
                                                       </td>
                                                       </axis:ocultar>   
                                                       <axis:ocultar f="axisrea005" c="CCORRED">
                                                                                                           
                                                        <td class="campocaja" colspan="1"> <%-- Compañia Reaseguradora --%>
                                                       <axis:ocultar f="axisrea005" c="CCORRED">
                                                       <select name="CCORRED" id="CCORRED" size="1" class="campowidthselect campo campotexto" style="width:100%;">                                                            
                                                            <option value=""> - <axis:alt f="axisrea005" c="ALT_CCORRED" lit="9000752"/> - </option>
                                                            <c:forEach var="element" items="${__formdata.ListaBroker}">
                                                                <option value = "${element.CCOMPANI}" 
                                                                <c:if test="${element.CCOMPANI == __formdata.CCORRED}"> selected </c:if> >
                                                                ${element.TCOMPANI} 
                                                                </option>
                                                            </c:forEach>
                                                        </select>           
                                                        </axis:ocultar>                                                               
                                                       </td>   
                                                                                                     
                                                       
                                                        </axis:ocultar>
                                                    </tr>
                                                    
                                                    <tr>
                                                         <axis:ocultar f="axisrea005" c="PRESERV">
                                                            <td class="titulocaja" colspan="1" ><b id="label_PRESERV"><axis:alt f="axisrea005" c="LIT_PRESERV" lit="9002231"/></b></td><%--% Reservas --%>
                                                         </axis:ocultar> 
                                                         <axis:ocultar f="axisrea005" c="PINTRES" dejarHueco="false"><!--  PER. DEVOLUCION DEP. -->
                                                            <td class="titulocaja" colspan="2"><b id="label_PINTRES"><axis:alt f="axisrea004prop" c="LIT_PINTRES" lit="9902204"/></b></td>
                                                         </axis:ocultar>
                                                         <axis:ocultar f="axisrea005" c="PCTGASTOSREA" dejarHueco="false"><!--  % GASTOS --> <%-- CONF-587 --%>
                                                            <td class="titulocaja" colspan="2"><b id="label_PCTGASTOSREA"><axis:alt f="axisrea005" c="LIT_PCTGASTOSREA" lit="9902215"/></b></td>
                                                         </axis:ocultar>
                                                                                                                  
                                                    </tr> 
                                                    
                                                    <tr>
                                                        <axis:ocultar f="axisrea005" c="PRESERV" dejarHueco="false">
                                                        <!-- INI - AXIS 4451 - 20/06/2019 - AABG - SE AGREGA OBLIGATORIEDAD DE CAMPO -->
                                                          <td class="campocaja" colspan="1"> 
                                                          
                                                                <input type="text" class="campo campotexto" obligatorio="true" id="PRESERV" onchange="" name="PRESERV"  style="width:80%"
                                                                onblur="if(!objUtiles.estaVacio(this.value)) if(!objValidador.esCampoNumerico(this.value, true, -1,'<axis:alt f="axisrea005" c="PRESERV" lit="9002231"/>')){this.value='';this.focus()}else{var num=parseFloat(objNumero.cambiarSeparadorDecimalesPorMiles(objNumero.stripNonNumeric(this.value))); if(num>100){alert('<axis:alt f="axisrea005" c="PRESERV" lit="1000390"/>');this.value='';this.focus()}else{this.value=num.toFixed(2).replace(objNumero.getSeparadorMiles(),objNumero.getSeparadorDecimales())}}"
                                                                value="${__formdata.PRESERV}" <axis:atr f="axisrea005" c="PRESERV" a="modificable=true"/>/>
                                                         
                                                          </td>  
                                                        <!-- FIN - AXIS 4451 - 20/06/2019 - AABG - SE AGREGA OBLIGATORIEDAD DE CAMPO -->   
                                                        </axis:ocultar>
                                                        <axis:ocultar f="axisrea5" c="PINTRES" dejarHueco="false">
                                                          <td class="campocaja" colspan="2"> 
                                                          
                                                                <input type="text" class="campo campotexto" id="PINTRES" onchange="" name="PINTRES" style="width:80%"
                                                                value="${__formdata.PINTRES}" <axis:atr f="axisrea004prop" c="PINTRES" a="modificable=true"/>/>
                                                         
                                                          </td>   
                                                        </axis:ocultar>
                                                        <axis:ocultar f="axisrea005" c="PCTGASTOSREA" dejarHueco="false"> <%-- CONF-587 --%>
                                                          <td class="campocaja" colspan="2"> 
                                                          
                                                                <input type="text" class="campo campotexto" id="PCTGASTOSREA" onchange="" name="PCTGASTOSREA" style="width:50%"
                                                                value="${__formdata.PCTGASTOSREA}" <axis:atr f="axisrea005" c="PCTGASTOSREA" a="modificable=true"/>/>
                                                         
                                                          </td>   
                                                       </axis:ocultar>
                                                 
                                                     
                                                    </tr>
                                                   
                                              </table>                          
                                            <% System.out.println("***************************************** Axisrea005 ### 5"); %>               
                                                                        
                                     <!-- ************************* FIN DATOS CUADROS  ********************* -->     			
        
        <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisrea005</c:param><c:param name="f">axisrea005</c:param>
            <c:param name="__botones">cancelar,aceptar</c:param>
        </c:import>        
    </form> 
    
    <c:import url="../include/mensajes.jsp" />
    
   </body>
   <% System.out.println("***************************************** Axisrea005 ### 6"); %> 
</html>
