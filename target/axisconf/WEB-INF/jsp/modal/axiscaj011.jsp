<%/* Revision:# Y2/CQSdIghBWd2O7KlonYQ== # */%>
<%@ page contentType="text/html;charset=windows-1252" errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="java.util.*" %>


<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<html>
  <head>
    <link rel="stylesheet" href="styles/genericosHtml.css" type="text/css">
    <link rel="stylesheet" href="styles/axisnt.css" type="text/css">
    <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>
    <link type="text/css" href="styles/jquery.jscrollpane.css" rel="stylesheet" media="only screen and (min-device-width: 768px) and (max-device-width: 1024px)" />
    <link rel="stylesheet" type="text/css" media="all" href="styles/calendar-green.css" title="green" />
    <script type="text/javascript" src="scripts/calendar.js"></script>    
    <script type="text/javascript" src="scripts/calendar-${sessionScope.__locale}.js"></script>
    <script type="text/javascript" src="scripts/calendar-setup.js"></script>           
    <style type="text/css" id="page-css"> </style>
    <c:import url="../include/carga_framework_js.jsp" />
    <script language="Javascript" type="text/javascript">
        
        function f_onload() {
       
          var vEstado = document.getElementById('CESTCHQ').value;
          
          
          
          if( vEstado == 'Bounced' || vEstado == "Accepted" ){
          
            document.miForm.FFECHAC.readOnly = true; 
            document.miForm.CSITCHE.disabled="true";
            document.getElementById("popup_calendario_FFECHAC").style.visibility = 'hidden';
            document.getElementById("but_aceptar").style.visibility = 'hidden';
            
          }
          
        	f_cargar_propiedades_pantalla();
                
        }  
        
        function f_but_cancelar() {
            parent.f_cerrar_modal('axiscaj011');                      
        }           
        
        function f_but_aceptar(){   
        if (objValidador.validaEntrada()) {
         var query= "FFECHAC="+$("#FFECHAC").val()+
                                                    "&CSITCHE="+$("#CSITCHE").val()
                                                    +"&HSCAJA="+$("#HSCAJA").val()
                                                    +"&NCHEQUE="+$("#NCHEQUE").val()
                                                    +"&HCESTADO="+$("#HCESTADO").val();
                                                    
         objAjax.invokeAsyncCGI("modal_axiscaj011.do", callbackAjaxCargarDescuentos, "operation=ajax_guardar&"+query, this, objJsMessages.jslit_cargando);
         //objUtiles.ejecutarFormulario("modal_axiscaj011.do", "guardar&"+query, document.miForm, "_self", objJsMessages.jslit_cargando);  
        } 
        }
        
          function f_valida_protestado(estado){   
          var est2=estado.value;
          if(est2==2){
         var query= "HSCAJA="+$("#HSCAJA").val();
         objAjax.invokeAsyncCGI("modal_axiscaj011.do", callbackAjaxValidaProtestado, "operation=ajax_valida_protestado&"+query, this, objJsMessages.jslit_cargando);
         //objUtiles.ejecutarFormulario("modal_axiscaj011.do", "guardar&"+query, document.miForm, "_self", objJsMessages.jslit_cargando);  
        }
        }
        
        
        function callbackAjaxCargarDescuentos (ajaxResponseText){    
         var doc=objAjax.domParse(ajaxResponseText);
         if(!objAppMensajes.existenErroresEnAplicacion(doc)){         
         var ban=objDom.getValorNodoDelComponente(doc.getElementsByTagName("GUARDADO"), 0, 0);
                if(ban==0){
                parent.f_post_cierre_modalaxiscaj011();
                }
          }
         } 
         
        function callbackAjaxValidaProtestado (ajaxResponseText){    
         var doc=objAjax.domParse(ajaxResponseText);
         if(!objAppMensajes.existenErroresEnAplicacion(doc)){         
         var ban=objDom.getValorNodoDelComponente(doc.getElementsByTagName("VALIDADO"), 0, 0);
                if(ban!=0){
                alert("<axis:alt f="axiscaj011" c="CSITCHE" lit="9906013"/>");
                objDom.setValorPorId("CSITCHE","<%= Integer.MIN_VALUE %>");
                }
          }
         } 
        
   </script>
    
  </head>
  <body onload="f_onload()">
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
    
    <form name="miForm" action="modal_axiscaj011.do" method="POST">
        <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt f="axiscaj011" c="TITULO" lit="9905082" /></c:param>
                <c:param name="nid" value="axiscaj011" />
        </c:import>
        <input type="hidden" name="operation" value=""/>  
        <input type="hidden" id="SPERSON" name="SPERSON" value=""/>
        <input type="hidden" id="HSCAJA" name="HSCAJA" value="${__formdata.HSCAJA}"/>
        <input type="hidden" id="CCHEQUE" name="CCHEQUE" value="${__formdata.CCHEQUE}"/>
        <input type="hidden" id="HCESTADO" name="HCESTADO" value="${__formdata.HCESTADO_ANT}"/>
        
        <c:import url="../include/titulo_nt.jsp">
           <c:param name="formulario"><axis:alt c="formulario" f="axiscaj007" lit="9905830" /></c:param>
           <c:param name="producto"><axis:alt c="formulario" f="axiscaj007" lit="9905829"/></c:param>
            <c:param name="form">axiscaj011</c:param>
        </c:import>             
        <div class="separador">&nbsp;</div>        
        <!-- Area de campos  -->
        <table class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0" style="height:10px;">
            <tr>
                <th style="width:25%;height:0px"></th>
                <th style="width:25%;height:0px"></th>
                <th style="width:25%;height:0px"></th>                                
                <th style="width:25%;height:0px"></th>
            </tr>    
            <tr>
                <td class="titulocaja">
                    <b><axis:alt f="axiscaj007" c="TIT_CCHEQUE" lit="9905071"/></b>
                </td>
            </tr>
            <tr>
                <td>
                    <input type="text" class="campo campotexto" value="${__formdata.CCHEQUE}"  name="CCHEQUE" id="CCHEQUE" size="15" readonly="true"
                           style="width:50%" />
                </td>
            </tr>
            <tr>
                <td colspan="4">
                    <div class="separador">&nbsp;</div>
                </td>
             </tr>
            <tr>
                    <axis:ocultar f="axiscaj011" c="NNUMIDE" dejarHueco="false"> 
                        <td class="titulocaja">
                           <b><axis:alt f="axiscaj011" c="NNUMIDE" lit="9903661"/></b>
                        </td>
                    </axis:ocultar>
                    <axis:ocultar f="axiscaj011" c="TNOMBRE" dejarHueco="false"> 
                        <td class="titulocaja" colspan="2">
                           <b><axis:alt f="axiscaj011" c="TNOMBRE" lit="9905826"/></b>
                        </td>
                    </axis:ocultar>
             </tr>
             <tr>
                    <axis:visible f="axiscaj011" c="NNUMIDE" >
                        <td class="campocaja">
                            <input type="text" class="campodisabled campo campotexto" value="${__formdata.NNUMIDE}" name="NNUMIDE" id="NNUMIDE" 
                                   readonly="true" style="width:75%" size="15" />
                        </td>
                    </axis:visible>
                    <axis:visible f="axiscaj011" c="TNOMBRE" >
                        <td class="campocaja" colspan="2">
                            <input type="text" class="campodisabled campo campotexto" value="${__formdata.TNOMBRE}" name="TNOMBRE" id="TNOMBRE" 
                                   readonly="true" size="15" />
                        </td>
                    </axis:visible>
             </tr>
             <tr>
                <td colspan="4">
                    <div class="separador">&nbsp;</div>
                </td>
             </tr>
             <tr>
                    <axis:ocultar f="axiscaj011" c="CSITCHE" dejarHueco="false"> 
                        <td class="titulocaja">
                           <b><axis:alt f="axiscaj011" c="CSITCHE" lit="100874"/></b>
                        </td>
                    </axis:ocultar>
                    <axis:ocultar f="axiscaj011" c="FFECHAC" dejarHueco="false"> 
                        <td class="titulocaja">
                           <b><axis:alt f="axiscaj011" c="FFECHAC" lit="100562"/></b>
                        </td>
                    </axis:ocultar>
                    
             </tr>
             <tr>
                   <axis:visible f="axiscaj011" c="CSITCHE" > 
                        <td class="campocaja">
                            <select name="CSITCHE" id="CSITCHE"   size="1" class="campowidthselect campo campotexto_ob" style="width:84%;"  onchange="f_valida_protestado(this)"
                             <axis:atr f="axiscaj011" c="CSITCHE" a="obligatorio=true&isInputText=false"/> title="<axis:alt f="axiscaj011" c="CSITCHE" lit="100874"/>" >   
                               <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt f="axiscaj011" c="CSITCHE" lit="108341"/> - </option>
                               <c:forEach var="situ_cheque" items="${__formdata.CSITCHE}">
                                  
                                    <option value="${situ_cheque.CATRIBU}"
                                    <c:if test="${__formdata.HCESTADO == situ_cheque.CATRIBU}">selected</c:if>>
                                    ${situ_cheque.TATRIBU}
                                    </option>
                                </c:forEach>
                            </select>
                     
                        </td>
                    </axis:visible>
                    <axis:visible f="axiscaj011" c="FFECHAC" >                 
                        <td class="campocaja" >
                                                                                                        
                            <input  type="text" class="campowidthinput campo campotexto_ob" size="10" maxlength="10"  value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FFECHAC}"/>"
                                     name="FFECHAC" id="FFECHAC" style="width:50%;" title= "<axis:alt f="axiscaj011" c="FFECHAC" lit="100562"/>"  
                             <axis:atr f="axiscaj007" c="FFECHAC" a="obligatorio=true&formato=fecha&modificable=true"/>
                         <a style="vertical-align:middle;">
                                <img id="popup_calendario_FFECHAC" alt="<axis:alt f="axiscaj007" c="FFECHAC" lit="108341"/>"  
                                     src="images/calendar.gif" 
                            </a>
                        </td>            
                    </axis:visible>    
            </tr>
            <tr>
              <div class="separador">&nbsp;</div>            
                       <div class="titulo">
                              <img src="images/flecha.gif"/><b><axis:alt f="axiscaj007" c="LIT32" lit="9905087"/></b>
                        </div>     
             <table class="seccion" >
                <tr>                        
                <td align="left">
                <table class="area" align="center">
                    <tr> 
                        <th style="width:25%;height:0px"></th>
                        <th style="width:25%;height:0px"></th>
                        <th style="width:25%;height:0px"></th>
                        <th style="width:25%;height:0px"></th>
                    </tr>
                    
                    <tr>
                        <axis:ocultar f="axiscaj020" c="TMEDMOV" dejarHueco="false"> 
                        <td class="titulocaja">
                            <b><axis:alt f="axiscaj020" c="TMEDMOV" lit="9000719"/></b>
                        </td>                                            
                        </axis:ocultar>
                        
                        <axis:ocultar f="axiscaj020" c="TRAZON" dejarHueco="false"> 
                        <td class="titulocaja">
                            <b><axis:alt f="axiscaj020" c="TRAZON" lit="9907720"/></b>
                        </td>                                            
                        </axis:ocultar> 
                        
                        <axis:ocultar f="axiscaj020" c="FFECHAREC" dejarHueco="false"> 
                        <td class="titulocaja">
                            <b><axis:alt f="axiscaj020" c="FFECHAREC" lit="9907723"/></b>
                        </td>                                   
                        </axis:ocultar> 
                        
                        <axis:ocultar f="axiscaj020" c="TBANCO" dejarHueco="false"> 
                        <td class="titulocaja">
                            <b><axis:alt f="axiscaj020" c="TBANCO" lit="9908476"/></b>
                        </td>                                   
                        </axis:ocultar> 
                    </tr>
                    <tr>
                        <axis:visible f="axiscaj020" c="TMEDMOV">
                        <td class="campocaja">
                            <input type="text" class="campo campotexto" value="${__formdata.TMEDMOV}" name="TMEDMOV" id="TMEDMOV" size="10" <axis:atr f="axiscaj020" c="TMEDMOV" a="modificable=false&obligatorio=false"/>/>
                        </td>
                        </axis:visible>  
                        
                        <axis:visible f="axiscaj020" c="TRAZON">
                        <td class="campocaja">
                            <input type="text" class="campo campotexto" value="${__formdata.TRAZON}" name="TRAZON" id="TRAZON" size="10" <axis:atr f="axiscaj020" c="TRAZON" a="modificable=false&obligatorio=false"/>/>
                        </td>
                        </axis:visible>
                        
                        <axis:visible f="axiscaj020" c="FFECHAREC">
                        <td class="campocaja">
                            <input type="text" class="campo campotexto" value="<fmt:formatDate pattern='dd/MM/yyyy' value='${__formdata.FFECHAREC}'/>" name="FFECHAREC" id="FFECHAREC" size="10" <axis:atr f="axiscaj020" c="FFECHAREC" a="modificable=false&obligatorio=false"/>/>
                        </td>
                        </axis:visible> 
                        
                        <axis:visible f="axiscaj020" c="TBANCO">
                        <td class="campocaja">
                            <input type="text" class="campo campotexto" value="${__formdata.TBANCO}" name="TBANCO" id="TBANCO" size="10" <axis:atr f="axiscaj020" c="TBANCO" a="modificable=false&obligatorio=false"/>/>
                        </td>
                        </axis:visible> 
                    </tr>
                    
                    <tr>
                        <axis:ocultar f="axiscaj020" c="NTYPCHEQ" dejarHueco="false"> 
                        <td class="titulocaja">
                            <b><axis:alt f="axiscaj020" c="NTYPCHEQ" lit="9907714"/></b>
                        </td>                                            
                        </axis:ocultar>
                        
                        <axis:ocultar f="axiscaj020" c="NTYPDCHEQ" dejarHueco="false"> 
                        <td class="titulocaja">
                            <b><axis:alt f="axiscaj020" c="NTYPDCHEQ" lit="9907715"/></b>
                        </td>                                            
                        </axis:ocultar>
                        
                        <axis:ocultar f="axiscaj020" c="NCHEQUE" dejarHueco="false"> 
                        <td class="titulocaja">
                            <b><axis:alt f="axiscaj020" c="NCHEQUE" lit="9907717"/></b>
                        </td>                                            
                        </axis:ocultar>
                        
                        <axis:ocultar f="axiscaj020" c="CESTCHQ" dejarHueco="false"> 
                        <td class="titulocaja">
                            <b><axis:alt f="axiscaj020" c="CESTCHQ" lit="9908120"/></b>
                        </td>                                            
                        </axis:ocultar>
                    </tr>
                    
                    <tr>                    
                        <axis:visible f="axiscaj020" c="NTYPCHEQ">
                        <td class="campocaja">
                            <input type="text" class="campo campotexto" value="${__formdata.NTYPCHEQ}" name="NTYPCHEQ" id="NTYPCHEQ" size="10" <axis:atr f="axiscaj020" c="NTYPCHEQ" a="modificable=false&obligatorio=false"/>/>
                        </td>
                        </axis:visible>
                        
                        <axis:visible f="axiscaj020" c="NTYPDCHEQ">
                        <td class="campocaja">
                            <input type="text" class="campo campotexto" value="${__formdata.NTYPDCHEQ}" name="NTYPDCHEQ" id="NTYPDCHEQ" size="10" <axis:atr f="axiscaj020" c="NTYPDCHEQ" a="modificable=false&obligatorio=false"/>/>
                        </td>
                        </axis:visible>
                        
                        <axis:visible f="axiscaj020" c="NCHEQUE">
                        <td class="campocaja">
                            <input type="text" class="campo campotexto" value="${__formdata.NCHEQUE}" name="NCHEQUE" id="NCHEQUE" size="10" <axis:atr f="axiscaj020" c="NCHEQUE" a="modificable=false&obligatorio=false"/>/>
                        </td>
                        </axis:visible>
                        
                        <axis:visible f="axiscaj011" c="CESTCHQ">
                        <td class="campocaja">
                            <input type="text" class="campo campotexto" value="${__formdata.CESTCHQ}" name="CESTCHQ" id="CESTCHQ" size="10" <axis:atr f="axiscaj011" c="CESTCHQ" a="modificable=false&obligatorio=false"/>/>
                        </td>
                        </axis:visible>
                    </tr>
                    
                    <tr>
                        <axis:ocultar f="axiscaj020" c="TOTROBAN" dejarHueco="false"> 
                        <td class="titulocaja">
                            <b><axis:alt f="axiscaj020" c="TOTROBAN" lit="9907713"/></b>
                        </td>                                            
                        </axis:ocultar> 
                        
                        <axis:ocultar f="axiscaj020" c="NACCNUMBER" dejarHueco="false"> 
                        <td class="titulocaja">
                            <b><axis:alt f="axiscaj020" c="NACCNUMBER" lit="9907721"/></b>
                        </td>                                   
                        </axis:ocultar>
                        
                        <axis:ocultar f="axiscaj020" c="NACCHOLDER" dejarHueco="false"> 
                        <td class="titulocaja">
                            <b><axis:alt f="axiscaj020" c="NACCHOLDER" lit="9908485"/></b>
                        </td>                                            
                        </axis:ocultar> 
                        
                        <axis:ocultar f="axiscaj020" c="TPAYTEXT" dejarHueco="false"> 
                        <td class="titulocaja">
                            <b><axis:alt f="axiscaj020" c="TPAYTEXT" lit="9907724"/></b>
                        </td>                                            
                        </axis:ocultar>
                    </tr>
                    
                    <tr>
                        <axis:visible f="axiscaj020" c="TOTROBAN">
                        <td class="campocaja">
                            <input type="text" class="campo campotexto" value="${__formdata.TOTROBAN}" name="TOTROBAN" id="TOTROBAN" size="10" <axis:atr f="axiscaj020" c="TOTROBAN" a="modificable=false&obligatorio=false"/>/>
                        </td>
                        </axis:visible>
                        
                        <axis:visible f="axiscaj020" c="NACCNUMBER">
                        <td class="campocaja">
                            <input type="text" class="campo campotexto" value="${__formdata.NACCNUMBER}" name="NACCNUMBER" id="NACCNUMBER" size="10" <axis:atr f="axiscaj020" c="NACCNUMBER" a="modificable=false&obligatorio=false"/>/>
                        </td>
                        </axis:visible> 
                        
                        <axis:visible f="axiscaj020" c="NACCHOLDER">
                        <td class="campocaja">
                            <input type="text" class="campo campotexto" value="${__formdata.NACCHOLDER}" name="NACCHOLDER" id="NACCHOLDER" size="10" <axis:atr f="axiscaj020" c="NACCHOLDER" a="modificable=false&obligatorio=false"/>/>
                        </td>
                        </axis:visible>
                        
                        <axis:visible f="axiscaj020" c="TPAYTEXT">
                        <td class="campocaja">
                            <input type="text" class="campo campotexto" value="${__formdata.TPAYTEXT}" name="TPAYTEXT" id="TPAYTEXT" size="10" <axis:atr f="axiscaj020" c="TPAYTEXT" a="modificable=false&obligatorio=false"/>/>
                        </td>
                        </axis:visible>  
                    </tr>
                    
                    <tr>                    
                    <axis:ocultar f="axiscaj020" c="NAMOPAY" dejarHueco="false"> 
                        <td class="titulocaja">
                            <b><axis:alt f="axiscaj020" c="NAMOPAY" lit="9904351"/></b>
                        </td>                                            
                    </axis:ocultar>                     
                    </tr>
                    
                    <tr>                    
                    <axis:visible f="axiscaj020" c="NAMOPAY">
                        <td class="campocaja">
                            <input type="text" class="campo campotexto" value="<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${__formdata.NAMOPAY}"/>" name="NAMOPAY" id="NAMOPAY" size="10" <axis:atr f="axiscaj020" c="NAMOPAY" a="modificable=false&obligatorio=false"/>/>
                        </td>
                    </axis:visible>                    
                    </tr>                    
                    
                </table>
                </td>
            </tr>
        </table>	
        <c:import url="../include/botonera_nt.jsp"><c:param name="f">axiscaj011</c:param><c:param name="f">axiscaj011</c:param>
            <c:param name="__botones"><axis:ocultar f="axiscaj007" c = "BT_CANCELAR" dejarHueco="false">cancelar</axis:ocultar><axis:visible f="axiscaj007" c="BT_ACEPTAR">,aceptar</axis:visible></c:param>
        </c:import>
    </form>
    <script type="text/javascript">
            Calendar.setup({
                inputField     :    "FFECHAC",     
                ifFormat       :    "%d/%m/%Y",      
                button         :    "popup_calendario_FFECHAC", 
                singleClick    :    true,
                firstDay       :    1
            });
    </script>     
    <c:import url="../include/mensajes.jsp" />
   </body>
</html>
