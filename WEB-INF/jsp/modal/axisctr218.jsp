

<%--
      NOMBRE:    axisctr218.jsp
      @author <a href = "mailto:amartinez@csi-ti.com">Alex Martinez</a>
      Fecha: 13/02/2015
      PROPÓSITO (descripción pantalla):  Carga de Preguntas a nivel de tabla
  

--%>

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
        <c:import url="../include/carga_framework_js.jsp" />
        
        <!--Inicio Sólo si vamos a tener un campo fecha !-->
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
        <!-- fin Sólo si vamos a tener un campo fecha !-->
        <script type="text/javascript">

        $(document).on("focusout","input[name^='COLUMNA_']",function(e){
            if (!objUtiles.estaVacio($(this).val())){
                if (!objValidador.esCampoNumerico($(this).val(),true,-1,"")){
                    e.preventDefault();
                    $(this).val('');
                    $(this).focus();
                }
            }
        });
            /****************************************************************************************/
            /*********************************** NAVEGACION *****************************************/
            /****************************************************************************************/            
            function f_onload(){
                var ok = "${__formdata.ok}";                
                
                if (!objUtiles.estaVacio(ok))
                    parent.f_aceptar_axisctr218();
                     //parent.f_cerrar_modal('axisctr218');
                
                f_cargar_propiedades_pantalla();
                f_tratarDisplayTagsPorConfiguracion();
                

	    }
            
           
           function f_but_aceptar() {
                objUtiles.ejecutarFormulario("modal_axisctr218.do", "guardar", document.miForm, "_self", objJsMessages.jslit_cargando);
                        
           }
           
          /*******************************************
                  Formateo Numeros
             ********************************************/
             function validarNumeros(IMPORT){
                 if (!objUtiles.estaVacio(IMPORT)){
                   /*  IMPORT = objValidador.valorFormateadoCampoNumerico(IMPORTE, true, true);
                     alert(IMPORT);*/
                     if(objNumero.validaNumero(IMPORT, true)){
                         return IMPORT;
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
       
           
           function f_but_salir() {
             parent.f_cerrar_modal('axisctr218');
           }
           
           function f_but_9001481(){
            
            var sseguro = "${__formdata.SSEGURO}"; 
            var nriesgo = "${__formdata.NRIESGO}"; 
            var cpregun = "${__formdata.CPREGUN}"; 
            var cgarant = "${__formdata.CGARANT}"; 
            var nmovimi = "${__formdata.NMOVIMI}"; 
            objUtiles.abrirModal("axisadm093", "src", "modal_axisadm093.do?operation=form&ORIGEN=AXISCTR218&SSEGURO="+sseguro+"&NRIESGO="+nriesgo+"&CPREGUN="+cpregun+"&CGARANT="+cgarant+"&NOVIMI="+nmovimi);
           }     
           
           function f_cerrar_modal(pantalla,P_SPROCESSAL) {
                objUtiles.cerrarModal(pantalla);
                document.miForm.SPROCES.value = P_SPROCESSAL;
                objUtiles.ejecutarFormulario("modal_axisctr218.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);
            } 
            
            function f_but_consultar(){
                var sproces = "${__formdata.SPROCES}";
                if (objUtiles.estaVacio(sproces)){
                    alert("No se ha realizado ninguna carga");
                }
                else
                objUtiles.abrirModal("axisint001", "src", "modal_axisint001.do?operation=form&ORIGEN=AXISCTR218&CMODO=ALTA_COLECTIVO&SPROCES="+sproces);
            }
            
            function f_cerrar_axisint001(pantalla) {
                objUtiles.cerrarModal(pantalla);
             } 
             
             function f_but_9001333(){
                if(confirm("<axis:alt f='axisctr218' c='CONFIRM' lit='9907579'/>"))
                    objUtiles.ejecutarFormulario("modal_axisctr218.do", "borrar", document.miForm, "_self", objJsMessages.jslit_cargando);
             }
           
           function f_but_9907580(){
                var cpregun = "${__formdata.CPREGUN}"; 
                var tpregun = "${__formdata.TPREGUN}"; 
                
                parent.f_sincarga(cpregun,tpregun);
           }
           
           function f_but_9000479(){
            objUtiles.ejecutarFormulario("modal_axisctr218.do", "validar", document.miForm, "_self", objJsMessages.jslit_cargando);
           }
        </script>
        <script  src="scripts/colResizable.min.js"></script>
        <script  type="text/javascript">
        
        $(function(){	
            $("#valores").colResizable({
                liveDrag:true, 
                gripInnerHtml:"<div class='grip'></div>", 
                draggingClass:"dragging"});
             
            });	
        </script>

    </head>
 <body class=" " onload="f_onload()" onkeypress="if (event.keyCode==13)  { f_but_buscar() }">
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
        <form name="miForm" action="" method="POST">
            <input type="hidden" id="operation" name="operation" value=""/>
            
            <input type="hidden" id="tipo" name="tipo" value="${__formdata.tipo}"/>
            <input type="hidden" id="MODO" name="MODO" value="${__formdata.MODO}"/>
            <input type="hidden" id="CMODO" name="CMODO" value="${__formdata.MODO}"/>
            <input type="hidden" id="SSEGURO" name="SSEGURO" value="${__formdata.SSEGURO}"/>
            <input type="hidden" id="NRIESGO" name="NRIESGO" value="${__formdata.NRIESGO}"/>
            <input type="hidden" id="NMOVIMI" name="NMOVIMI" value="${__formdata.NMOVIMI}"/>
            <input type="hidden" id="CPREGUN" name="CPREGUN" value="${__formdata.CPREGUN}"/>
            <input type="hidden" id="CGARANT" name="CGARANT" value="${__formdata.CGARANT}"/>
            <input type="hidden" id="TIPO_PREGUNTA" name="TIPO_PREGUNTA" value="${__formdata.TIPO_PREGUNTA}"/>
            <input type="hidden" id="TPREGUN" name="TPREGUN" value="${__formdata.TPREGUN}"/>
            <input type="hidden" name="CONSULTA" id="CONSULTA" value="${__formdata.CONSULTA}"/>  
            <input type="hidden" name="CTABLA" id="CTABLA" value="${__formdata.CTABLA}"/>  
            <input type="hidden" name="SPROCES" id="SPROCES" value="${__formdata.SPROCES}"/>  
            <input type="hidden" name="SPRODUC" id="SPRODUC" value="${__formdata.SPRODUC}"/>  
            
            
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt c="LIT_FORM" f="axisctr218" lit="9901369"/></c:param>
                <c:param name="producto"><axis:alt c="LIT_FORM" f="axisctr218" lit="9901369"/></c:param>
                <c:param name="form">axisctr218</c:param>
            </c:import>
            
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt f="axisadm093" c="TITULO" lit="9001149"/></c:param>
                <c:param name="nid" value="axisadm093" />
            </c:import>
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt f="axisint001" c="TITULO" lit=""/></c:param>
                <c:param name="nid" value="axisint001" />
            </c:import>
            
            <!-- Area de campos  -->
              
            <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                    
                        <!--campos-->
                        <table class="seccion">
                            <tr>
                                <th style="width:25%;height:0px"></th>
                                <th style="width:25%;height:0px"></th>
                                <th style="width:25%;height:0px"></th>
                                <th style="width:25%;height:0px"></th>
                            </tr>
                            
                                <axis:ocultar f="axisctr218" c="DSP_PREGUNTAB" dejarHueco="false"> 
                                <tr>
                                    <td class="campocaja" colspan="4">
                                                  
                                                <div class="titulo">
                                                  <div style="float:left;">
                                                  <%--img src="images/flecha.gif"/--%>${__formdata.CPREGUN} - ${__formdata.TPREGUN} 
                                                    </div>
                                                </div>
                                               
                                               
                                            <div class="separador">&nbsp;</div>   
                                        
                                         <div id="DSP_PREGUNTASTABLA" class="displayspaceOver" style="visibility:hidden;">&nbsp;</div>
                                         <div id="Dt_PREGUNTASTABLA" class="displayspaceMaximo">
                                        <table class="seccion" cellpadding="0" cellspacing="0" align="right" style="width:99%" id="valores">
                                    
                                        <tbody id="preguntab" align="right">
                                             <tr class="gridEvenHover">
                                             
                                           
                                                     <c:if test="${!empty __formdata.lstcabecera}">      
                                                     <c:set var="total">${95/fn:length(__formdata.lstcabecera)}</c:set>
                                                       <c:forEach items="${__formdata.lstcabecera}" var="lista" varStatus="i">                                    
                                                               <td class="dspText"  style="width:${total}%"><b>${lista.OB_IAX_PREGUNTASTAB_COLUMNS.TCOLUMNA}</b></td>
                                                        </c:forEach> 
                                                    <%--       <c:if test="${empty __formdata.CONSULTA || __formdata.CONSULTA != 1}">
                                                        <td class="dspText" align="center"  style="width:5%"></td>                
                                                        </c:if>--%>
                                                      </c:if>
                                              </tr>   
                                               <c:if test="${!empty __formdata.lstpreguntab}">     
                                           
                                                  
                                                         <c:forEach items="${__formdata.lstpreguntab}" var="lista" varStatus="x"> 
                                                         
                                                              <tr tipo="ri" id="fila_${__formdata.lstpreguntab[x.count-1].OB_IAX_PREGUNTASTAB.NLINEA}" title="fila_${__formdata.lstpreguntab[x.count-1].OB_IAX_PREGUNTASTAB.NLINEA}"
                                                            <c:if test="${x.count mod 2 ==0}">                                                                      
                                                                class="gridEven"                                                        
                                                            </c:if>
                                                            <c:if test="${x.count mod 2 !=0}">                                                                      
                                                                class="gridNotEven"                                                        
                                                            </c:if>
                                                        >     
                                                        
                                                            <c:forEach items="${__formdata.lstpreguntab[x.count-1].OB_IAX_PREGUNTASTAB.TCOLUMNAS}" var="listacolumns" varStatus="j">   
                                                              <td  class="campocaja" style="width:${total}%">
                                                                <div class="dspText">
                                                                    ${listacolumns.OB_IAX_PREGUNTASTAB_COLUMNS.TVALOR}
                                                                </div>     
                                                              </td>                                   
                                                              
                                                              </c:forEach> 
                                                              
                                                             
                                                              </tr>
                                                         </c:forEach> 
                                               
                                                        
                                                        </tr>
                                                        </c:if>
                                            </tbody>  
                                            
                                        </table>
                                        </div>
                                             
                                            
                                    </td>
                                    </tr>
                                    
                                </axis:ocultar> 
                               
                            
                               
                           
                            
                            
                        </table>
                       
                     
                    </td>
                </tr>
            </table>
    
     </form>
    
    
    

<c:import url="../include/botonera_nt.jsp">
           <c:param name="f">axisctr218</c:param>
            <c:param name="__botones"><axis:ocultar f="axisctr218" c = "BT_SALIR" dejarHueco="false">salir</axis:ocultar><axis:ocultar f="axisctr218" c = "BT_SINCARGA" dejarHueco="false">,9907580</axis:ocultar><axis:ocultar f="axisctr218" c = "BT_VALIDAR" dejarHueco="false">,9000479</axis:ocultar><axis:ocultar f="axisctr218" c = "BT_CONSULTAR" dejarHueco="false">,consultar</axis:ocultar><axis:ocultar f="axisctr218" c = "BT_BORRAR" dejarHueco="false">,9001333</axis:ocultar><axis:ocultar f="axisctr218" c = "BT_CARGAR" dejarHueco="false">,9001481</axis:ocultar><axis:ocultar f="axisctr218" c = "BT_ACEPTAR" dejarHueco="false">,aceptar</axis:ocultar> </c:param>

</c:import>
<c:import url="../include/mensajes.jsp" />
    
</body>
</html>


