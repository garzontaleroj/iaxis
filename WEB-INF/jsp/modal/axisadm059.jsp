<%/*
*  Fichero: axisadm059.jsp
*  
*  Fecha: 12/07/2010
*/
%>
<%@ page contentType="text/html;charset=windows-1252" errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="java.util.List" %>

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

       function f_onload(){
                f_cargar_propiedades_pantalla();        
                var ok = "${__formdata.OK}";        
                        if (!objUtiles.estaVacio(ok) && ok==1){
                                parent.f_aceptar_axisadm059();
                        }                           
       }            
      
       function f_but_aceptar() {        
          if (objValidador.validaEntrada()) {      
            var CTIP_AUX = objDom.getValorPorId("CTIPBAN"); 
           <%--BUG 25929/136957:JLTS:20130212Se adicionan las siguientes dos variables--%>
            var CCOB_AUX = objDom.getValorPorId("CCOBBAN");
            var NCTA_AUX = objDom.getValorPorId("NCUENTA");
            objUtiles.ejecutarFormulario("modal_axisadm059.do?CTIP_AUX="+CTIP_AUX+"&CCOB_AUX="+CCOB_AUX+"&NCTA_AUX="+NCTA_AUX, "aceptar", axisadm059Form, "_self", objJsMessages.jslit_cargando);                
          }
       }      
            
       function f_but_cancelar() {          
            parent.f_cerrar_axisadm059();
       }       
                
       function f_formatdate(entrada,title){
            var jDate = new JsFecha();
            if(entrada.value.length>0){
                entrada.value=jDate.formateaFecha(entrada.value);
            
                if(jDate.validaFecha(entrada.value)){
                    entrada.value=jDate.formateaFecha(entrada.value);
                }else{
                    alert("<axis:alt c="aler" f="axisadm059" lit="1000421"/>");
                }
            }
        }  
        
        function f_onclickCheckbox(thiss) {
            thiss.value =  ((thiss.checked)?1:0);
            objDom.setValorPorId(thiss.id, thiss.value);
        }
            
        /*******************************************
              Formateo Numeros
         ********************************************/
         function validarNumeros(IMPORTE){
             if (!objUtiles.estaVacio(IMPORTE)){
                 IMPORT = objValidador.valorFormateadoCampoNumerico(IMPORTE, true, true);
                 if(objNumero.validaNumero(IMPORT, true)){
                     return this.formateaNumeroCero(IMPORT, true);
                 }
                 else{
                     return   '';
                 }
             }
             else return IMPORTE;
         }
         
        function formateaNumeroCero(entrada, isDecimal){
            // es crida al reformateixador  ###.###,00
            var fnum=objNumero.formateaNumero(entrada,isDecimal);
            if(entrada.indexOf(objNumero.getSeparadorDecimales())<0){
                fnum += objNumero.getSeparadorDecimales() + '00';
            }
            // si es tracta d'un 0 el converteix a 0,00
            if(fnum=='0') fnum += objNumero.getSeparadorDecimales() + '00';
            return fnum;
        }

        function f_formatear(thiss){
            thiss.value = validarNumeros(thiss.value);
        }

        function f_calculoma(thiss){               
            f_formatear(thiss);
        }
        
    </script>
  </head>
    <body onload="f_onload()" class=" ">
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
        
        <form name="axisadm059Form" action="" method="POST">
            <input type="hidden" name="operation" value="">
            <input type="hidden" name="MODIF" value="${__formdata.MODIF}" id="MODIF">                    
            <input type="hidden" name="CEMPRES" value="${__formdata.CEMPRES}" id="CEMPRES">   
            <input type="hidden" name="CCOBAN_BUS" value="${__formdata.CCOBAN_BUS}" id="CCOBAN_BUS">   
            <input type="hidden" name="CMODO" value="${__formdata.CMODO}" id="CMODO">   
            <input type="hidden" name="DOM_FILLER_LN3" value="${__formdata.DOM_FILLER_LN3}" id="DOM_FILLER_LN3">   
            <input type="hidden" name="CCONTABAN" value="${__formdata.CCONTABAN}" id="CCONTABAN">   
            
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt c="form" f="axisadm059" lit="9901531" /></c:param>
                <c:param name="producto"><axis:alt c="producto" f="axisadm059" lit="9901531" /></c:param>
                <c:param name="form">axisadm059</c:param>
            </c:import>
           
    <!-- Area de campos  -->
    <div class="separador">&nbsp;</div>
    <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0"> 
        <tr>
          <td>                                    
            <!--campos-->
             <table class="seccion">
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
                               <axis:ocultar f="axisadm059" c="CCOBBAN" dejarHueco="false"> 
                                    <td class="titulocaja" ><!-- CCOBBAN -->
                                         <b><axis:alt f="axisadm059" c="CCOBBAN" lit="100879"></axis:alt></b>                                                                          
                                    </td>
                                </axis:ocultar>    
                                <axis:ocultar f="axisadm059" c="NCUENTA" dejarHueco="false"> 
                                    <td class="titulocaja" ><!-- CCOBBAN -->
                                         <b><axis:alt f="axisadm059" c="NCUENTA" lit="100965"></axis:alt></b>                                                                          
                                    </td>
                                </axis:ocultar>    
                                <axis:ocultar f="axisadm059" c="CTIPBAN" dejarHueco="false"> 
                                    <td class="titulocaja" ><!-- CTIPBAN -->
                                         <b><axis:alt f="axisadm059" c="CTIPBAN" lit="9001200"></axis:alt></b>                                 
                                    </td>
                                </axis:ocultar>      
                                <axis:ocultar f="axisadm059" c="CDOMENT" dejarHueco="false"> 
                                    <td class="titulocaja" ><!-- CCOBBAN -->
                                         <b><axis:alt f="axisadm059" c="CDOMENT" lit="9001624"></axis:alt></b>                                                                          
                                    </td>
                               </axis:ocultar>  
                             </tr>
                             <tr>
                                <axis:ocultar f="axisadm059" c="CCOBBAN" dejarHueco="false"> 
                                     <td class="campocaja">
                                        <c:choose>
                                            <c:when test="${!__formdata.MODIF}"> 
                                                <input type="text" class="campo campotexto" id="CCOBBAN" name="CCOBBAN" size="15" style="width:40%"
                                                value =  "${__formdata.CCOBBAN}" formato="entero" maxLength="3"  title="<axis:alt c="CCOBBAN" f="axisadm059" lit="100879"/>" 
                                                disabled <axis:atr f="axisadm059" c="CCOBBAN" a="obligatorio=true&modificable=${__formdata.MODIF}"/>/>                                                              
                                            </c:when>                                            
                                            <c:otherwise>                                                
                                               <input type="text" class="campo campotexto" id="CCOBBAN" name="CCOBBAN" size="15" style="width:40%"
                                                value =  "${__formdata.CCOBBAN}" formato="entero" maxLength="3"  title="<axis:alt c="CCOBBAN" f="axisadm059" lit="100879"/>" 
                                                <axis:atr f="axisadm059" c="CCOBBAN" a="obligatorio=true&modificable=${__formdata.MODIF}"/>/>                                                              
                                            </c:otherwise>                                            
                                        </c:choose>                                   
                                    </td>                             
                                </axis:ocultar>      
                                <axis:ocultar f="axisadm059" c="NCUENTA" dejarHueco="false"> 
                                    <td class="campocaja">
                                        <c:choose>
                                            <c:when test="${!__formdata.MODIF}"> 
                                               <input type="text" class="campo campotexto" id="NCUENTA" name="NCUENTA" size="15" 
                                               value = "${__formdata.NCUENTA}" maxLength="34" title="<axis:alt c="NCUENTA" f="axisadm059" lit="100965"/>" 
                                               disabled <axis:atr f="axisadm059" c="NCUENTA" a="obligatorio=true&modificable=${__formdata.MODIF}"/>/> 
                                            </c:when>                                            
                                            <c:otherwise>                                                
                                               <input type="text" class="campo campotexto" id="NCUENTA" name="NCUENTA" size="15" 
                                               value = "${__formdata.NCUENTA}" maxLength="34" title="<axis:alt c="NCUENTA" f="axisadm059" lit="100965"/>" 
                                               <axis:atr f="axisadm059" c="NCUENTA" a="obligatorio=true&modificable=${__formdata.MODIF}"/>/> 
                                            </c:otherwise>                                            
                                        </c:choose>
                                    </td>                             
                                </axis:ocultar>
                                <axis:ocultar f="axisadm059" c="CTIPBAN" dejarHueco="false"> 
                                     <td class="campocaja">
                                            <select name="CTIPBAN" id ="CTIPBAN" size="1"  class="campowidthinput campo campotexto" 
                                            title="<axis:alt c="CTIPBAN" f="axisadm059" lit="9001200"/>" 
                                            <axis:atr f="axisadm059" c="CTIPBAN" a="isInputText=false&obligatorio=true&modificable=${__formdata.MODIF}"/>>
                                                <option value="<%=Integer.MIN_VALUE%>"> - <axis:alt c="CTIPBAN" f="axisadm059" lit="9001200"/> - </option>                                                                                                        
                                                <c:forEach items="${__formdata.listaCuenta}" var="item">
                                                    <option value = "${item.CTIPBAN}" <c:if test="${!empty __formdata.CTIPBAN && __formdata.CTIPBAN == item.CTIPBAN}"> selected </c:if>>${item.TTIPO}</option>
                                                </c:forEach>
                                            </select>
                                      </td> 
                                  </axis:ocultar>    
                                <axis:ocultar f="axisadm059" c="CDOMENT" dejarHueco="false"> 
                                    <td class="campocaja">
                                        <input type="text" class="campo campotexto" id="CDOMENT" name="CDOMENT" size="15" 
                                                           value =  "${__formdata.CDOMENT}" formato="entero" maxLength="4" title="<axis:alt c="CDOMENT" f="axisadm059" lit="9001624"/>" 
                                                           <axis:atr f="axisadm059" c="CDOMENT" a="obligatorio=true&modificable=true"/>/>                      
                                    </td>                             
                                </axis:ocultar>
                             </tr>
                             <%-- Seccion 2 --%>
                             <tr>
                                <axis:ocultar f="axisadm059" c="CDOMSUC" dejarHueco="false"> 
                                    <td class="titulocaja" ><!-- CCOBBAN -->
                                         <b><axis:alt f="axisadm059" c="CDOMSUC" lit="9002202"></axis:alt></b>                                                                          
                                    </td>
                                </axis:ocultar>    
                                <axis:ocultar f="axisadm059" c="DESCRIPCION" dejarHueco="false"> 
                                    <td class="titulocaja" ><!-- CCOBBAN -->
                                         <b><axis:alt f="axisadm059" c="DESCRIPCION" lit="100588"></axis:alt></b>                                                                          
                                    </td>
                                </axis:ocultar>  
                                <axis:ocultar f="axisadm059" c="TSUFIJO" dejarHueco="false"> 
                                    <td class="titulocaja" ><!-- CCOBBAN -->
                                         <b><axis:alt f="axisadm059" c="TSUFIJO" lit="9001734"></axis:alt></b>                                                                          
                                    </td>
                                </axis:ocultar>  
                                <axis:ocultar f="axisadm059" c="NPRISEL" dejarHueco="false"> 
                                    <td class="titulocaja" ><!-- CCOBBAN -->
                                         <b><axis:alt f="axisadm059" c="NPRISEL" lit="9000574"></axis:alt></b>                                                                          
                                    </td>
                                </axis:ocultar>    
                             </tr>
                             <tr>
                                <axis:ocultar f="axisadm059" c="CDOMSUC" dejarHueco="false"> 
                                    <td class="campocaja">
                                        <input type="text" class="campo campotexto" id="CDOMSUC" name="CDOMSUC" size="15" 
                                                           value="${__formdata.CDOMSUC}" formato="entero" maxLength="4" title="<axis:alt c="CDOMSUC" f="axisadm059" lit="9002202"/>" 
                                                           <axis:atr f="axisadm059" c="CDOMSUC" a="obligatorio=true&modificable=true"/>/>                      
                                    </td>                             
                                </axis:ocultar>                                
                                <axis:ocultar f="axisadm059" c="DESCRIPCION" dejarHueco="false"> 
                                    <td class="campocaja">
                                        <input type="text" class="campo campotexto" id="DESCRIPCION" name="DESCRIPCION" size="15" 
                                                           value="${__formdata.DESCRIPCION}" maxLength="50" title="<axis:alt c="DESCRIPCION" f="axisadm059" lit="100588"/>" 
                                                           <axis:atr f="axisadm059" c="DESCRIPCION" a="modificable=true"/>/>                      
                                    </td>                             
                                </axis:ocultar>  
                                <axis:ocultar f="axisadm059" c="TSUFIJO" dejarHueco="false"> 
                                    <td class="campocaja">
                                        <input type="text" class="campo campotexto" id="TSUFIJO" name="TSUFIJO" size="15" 
                                                           value="${__formdata.TSUFIJO}" maxLength="4" title="<axis:alt c="TSUFIJO" f="axisadm059" lit="9001734"/>" 
                                                           <axis:atr f="axisadm059" c="TSUFIJO" a="obligatorio=true&modificable=true"/>/>                      
                                    </td>                             
                                </axis:ocultar>   
                                <axis:ocultar f="axisadm059" c="NPRISEL" dejarHueco="false"> 
                                    <td class="campocaja">
                                        <input type="text" class="campo campotexto" id="NPRISEL" name="NPRISEL" size="15" 
                                                           value="${__formdata.NPRISEL}" formato="entero" maxLength="2" title="<axis:alt c="NPRISEL" f="axisadm059" lit="9000574"/>" 
                                                           <axis:atr f="axisadm059" c="NPRISEL" a="obligatorio=true&modificable=true"/>/>                      
                                    </td>                             
                                </axis:ocultar>                                  
                                
                             </tr>
                             <%-- Seccion 3 --%>
                             <tr>
                                <axis:ocultar f="axisadm059" c="TCOBBAN" dejarHueco="false"> 
                                    <td class="titulocaja" ><!-- TCOBBAN -->
                                         <b><axis:alt f="axisadm059" c="TCOBBAN" lit="100785"></axis:alt></b>                                                                          
                                    </td>
                                </axis:ocultar>                                   
                                <axis:ocultar f="axisadm059" c="PRECIMP" dejarHueco="false"> 
                                    <td class="titulocaja" ><!-- PRECIMP -->
                                         <b><axis:alt f="axisadm059" c="PRECIMP" lit="9901651"></axis:alt></b>                                                                          
                                    </td>
                                </axis:ocultar>                                   
                                <axis:ocultar f="axisadm059" c="NNUMNIF" dejarHueco="false"> 
                                    <td class="titulocaja" ><!-- NNUMNIF -->
                                         <b><axis:alt f="axisadm059" c="NNUMNIF" lit="105904"></axis:alt></b>                                                                          
                                    </td>
                                </axis:ocultar>  
                                    <td class="titulocaja" ><!-- CBAJA -->                                    
                                         <table>
                                            <tr>
                                                <axis:ocultar f="axisadm059" c="CBAJA" dejarHueco="false"> 
                                                <td class="titulocaja" ><!-- CBAJA -->
                                                    <b><axis:alt f="axisadm059" c="CBAJA" lit="9901519"></axis:alt></b>
                                                </td>
                                                </axis:ocultar>
                                                <axis:ocultar f="axisadm059" c="CAGRUPREC" dejarHueco="false"> 
                                                <td class="titulocaja" ><!-- CBAJA -->
                                                    <b><axis:alt f="axisadm059" c="CAGRUPREC" lit="9902650"></axis:alt></b>
                                                </td>
                                                </axis:ocultar>
                                            </tr>
                                        </table>
                                    </td>
                             </tr>                             
                             <tr>
                                <axis:ocultar f="axisadm059" c="TCOBBAN" dejarHueco="false"> 
                                    <td class="campocaja">
                                        <input type="text" class="campo campotexto" id="TCOBBAN" name="TCOBBAN" size="15" 
                                                           value="${__formdata.TCOBBAN}" maxLength="40" title="<axis:alt c="TCOBBAN" f="axisadm059" lit="100785"/>" 
                                                           <axis:atr f="axisadm059" c="TCOBBAN" a="obligatorio=false&modificable=true"/>/>                      
                                    </td>                             
                                </axis:ocultar>                                
                                <axis:ocultar f="axisadm059" c="PRECIMP" dejarHueco="false"> 
                                    <td class="campocaja">
                                        <input type="text" class="campo campotexto" id="PRECIMP" name="PRECIMP" size="15" style="width:40%"
                                                           value="<fmt:formatNumber pattern='###,##0.00' value='${__formdata.PRECIMP}'/>"   
                                                           onChange = "javascript:f_calculoma(this);"
                                                           formato="decimal"  title="<axis:alt c="PRECIMP" f="axisadm059" lit="9901651"/>" 
                                                           <axis:atr f="axisadm059" c="PRECIMP" a="obligatorio=false&modificable=true"/>/>                                                              
                                    </td>                             
                                 </axis:ocultar>      
                                 <axis:ocultar f="axisadm059" c="NNUMNIF" dejarHueco="false"> 
                                    <td class="campocaja">
                                        <input type="text" class="campo campotexto" id="NNUMNIF" name="NNUMNIF" size="15" 
                                                           value =  "${__formdata.NNUMNIF}" maxLength="14" title="<axis:alt c="NNUMNIF" f="axisadm059" lit="105904"/>" 
                                                           <axis:atr f="axisadm059" c="NNUMNIF" a="modificable=true"/>/>                      
                                    </td>                             
                                 </axis:ocultar>
                                  <td class="titulocaja" ><!-- CBAJA -->                                    
                                         <table>
                                            <tr>
                                                <axis:ocultar f="axisadm059" c="CBAJA" dejarHueco="false"> 
                                                <td class="titulocaja" ><!-- CBAJA -->
                                                    <input type="checkbox" id="CBAJA" name="CBAJA" title="<axis:alt c="CBAJA" f="axisadm059" lit="9901519"/>"  value="${__formdata.CBAJA}" <c:if test="${__formdata.CBAJA == 1}">checked</c:if> onchange="f_onclickCheckbox(this);" 
                                                    <axis:atr f="axisadm059" c="CBAJA" a="modificable=true"/>/>    
                                                </td>
                                                </axis:ocultar>
                                                <axis:ocultar f="axisadm059" c="CAGRUPREC" dejarHueco="false"> 
                                                <td class="titulocaja" ><!-- CBAJA -->
                                                    <input type="checkbox" id="CAGRUPREC" name="CAGRUPREC" title="<axis:alt c="CAGRUPREC" f="axisadm059" lit="9902650"/>"  value="${__formdata.CAGRUPREC}" <c:if test="${__formdata.CAGRUPREC == 1}">checked</c:if> onchange="f_onclickCheckbox(this);" 
                                                    <axis:atr f="axisadm059" c="CAGRUPREC" a="modificable=true"/>/>    
                                                </td>
                                                </axis:ocultar>
                                            </tr>
                                        </table>
                                    </td>
                             </tr>
                         </table>
                    </td>
                </tr>
             </table>
          </td>
        </tr>
    </table>
                         
        <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisadm059</c:param><c:param name="f">axisadm059</c:param>
            <c:param name="f">axisadm059</c:param>        
            <c:param name="__botones">cancelar,aceptar</c:param>
        </c:import>
        
        <script type="text/javascript">
            Calendar.setup({
            inputField     :    "FVALORA",     
            ifFormat       :    "%d/%m/%Y",      
            button         :    "icon_FVALORA", 
            singleClick    :    true,
            firstDay       :    1
            });            
        </script>
            
        </form>
      <c:import url="../include/mensajes.jsp" />
    </body>
</html>
