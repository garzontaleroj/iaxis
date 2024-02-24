<%@ page contentType="text/html;charset=windows-1252" errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ page import="axis.mvc.model.*" %><% //ecg20131002 %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
    <head>
        <title><axis:alt f="axissin071" c="LIT_BUSC_SIMUL" lit="1000200"/></title>
        <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
        <link rel="stylesheet" href="styles/displaytag.css">
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
        <script type="text/javascript">
            

            function f_onload() {
                f_cargar_propiedades_pantalla();    	
            }      
            
            function f_but_buscar(){
                alert("buscar");
            }
            
             function f_but_salir() {
                objUtiles.ejecutarFormulario ("main.do", "trabajo", document.miForm, "_self");
            } 
            
            function f_but_aceptar() {
                alert("aceptar");
            }
            
            function f_but_nuevo() {
                f_abrir_axisadm206("ALTA");
            }
            
            
            function f_abrir_axisprf000() {
                 objUtiles.abrirModal("axisprf000", "src", "modal_axisprf000.do?operation=form");
            }
            
            function f_aceptar_axisprf000() {
               f_cerrar_axisprf000();     
            }
            
            function f_cerrar_axisprf000() {
                objUtiles.cerrarModal('axisprf000');
                
            } 
            
            function f_aceptar_modal(pantalla, param){
                f_cerrar_axisprf000();
                objUtiles.ejecutarFormulario("axis_axissin071.do?"+param, "form", document.miForm, "ftrabajo", objJsMessages.jslit_cargando);
            }
            

            function f_but_aceptar() {     
                    var url="axis_axissin071.do?operation=descargar&PSPERSON="+document.miForm.PSPERSON.value+"&FHASTA="+document.miForm.FHASTA.value+"&FDESDE="+document.miForm.FDESDE.value;
                    objAjax.invokeAsyncCGI_JSON(url, callbackAceptar, "<axis:alt f='axissin071' c='MSG_CARGAR' lit='9905686'/>")
            } 
            
            function callbackAceptar (p) {
           
            objEventos.showHideLoader("ajaxLoader", "ajaxContent", "ajaxText", "", "none");
             //hay que actualizar la lista de resulotados xxx
            var odiv_OBFICHERO=document.getElementById("div_OBFICHERO");
            var div_OBFICHEROcontenido="";
            div_OBFICHEROcontenido=div_OBFICHEROcontenido+"<table align=\"center\" class=\"dsptgtable\">";
               if (p.JSON2.LIST_FICHEROS.OFICHERO!=null) { 
                 

                 
                  var ficherolist = p.JSON2.LIST_FICHEROS.OFICHERO;
                           
                         var str2 = ficherolist.replace(/barrainvertida/gi, "\\");    
                         console.log(ficherolist);
                         console.log(str2);
                         objUtiles.abrirModal("axisimprimir", "src", "modal_axisimprimir.do?operation=tunnel&file="+str2);

           
                } 
           }

        </script>
    </head>
    <body onload="f_onload()">
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
    
    <c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">axisimprimir|<axis:alt f="axissin064" c="TITULO_IMPR" lit="1000205" />|true</c:param>
    </c:import>
    <form name="miForm" action="" method="POST">
        <input type="hidden" name="operation"/>
        <input type="hidden" name="TTITULO" id="TTITULO" value=""/>
        <input type="hidden" name="CMODO" id="CMODO" value=""/>
        <input type="hidden" name="PSPERSON" id="PSPERSON" value="${__formdata['OBPROFESIONAL'].SPERSON}"/>
        <input type="hidden" name="DES_FILE" id="DES_FILE" value="${__formdata.DES_FILE}"/>
       
        <c:import url="../include/titulo_nt.jsp">
                <c:param name="modalidad"><axis:alt f="axissin071" c="TITULO" lit="9909912" /></c:param>
                <c:param name="formulario"><axis:alt f="axissin071" c="TITULO" lit="9909912" /></c:param>
                <c:param name="form">axissin071</c:param>
        </c:import>
        
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">axisprf000|<axis:alt f="axissin071" c="MODAL_AXISPRF000" lit="9904785" /></c:param>
        </c:import> 
        
      
  
  
        
        
    <!-- Area de campos  -->
    <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td>          
             <table class="seccion">
                <tr>
                    <td align="left">
                         <table class="area" align="center">
                            <tr>
                                <th style="width:20%;height:0px"></th>
                                <th style="width:60%;height:0px"></th>
                              
                            </tr>
                            <tr>
                                <axis:visible f="axissin071" c="NIT"> 
                                    <td class="titulocaja">
                                        <b id="label_NIT"><axis:alt f="axissin071" c="LIT_NIT" lit="9909913"/></b>
                                    </td>
                                </axis:visible>
                            </tr>                                    
                            <tr>
                           
                               <axis:ocultar f="axissin071" c="NIT" dejarHueco="false"> 
                                    <td class="campocaja">
                                        <input type="text" name="NIT_TEXT" title="<axis:alt f="axissin071" c="NIT" lit="9909913" />" id="NIT_TEXT" value="${__formdata['OBPROFESIONAL'].NNUMIDE}" class="campowidthinput campo campotexto" style="width:70%" formato="entero"
                                        <axis:atr f="axissin071" c="NIT_TEXT" a="modificable=true&obligatorio=true"/> onchange="f_actualizar_proveedor()" />
                                        <img id="IMG_NIT_TEXT" border="0" src="images/find.gif" onclick="f_abrir_axisprf000()" style="cursor:pointer"/>
                                    </td>
                                     <td class="campocaja">    
                                        <input readonly="true" type="text" name="NOMBRE_TEXT" id="NOMBRE_TEXT" value="${__formdata['OBPROFESIONAL'].TNOMBRE}" class="campowidthinput campo campotexto"/>
                                    </td>
                              </axis:ocultar>
                               
                            </tr>
                            
                            <tr>
                                <axis:ocultar f="axissin071" c="FDESDE" dejarHueco="false"> 
                                        <td class="titulocaja" ><b id="label_FDESDE"><axis:alt f="axissin071" c="LIT_FDESDE" lit="9902360"/></b></td>
                                </axis:ocultar>
                            </tr>
                            
                            <tr>
                               <axis:ocultar f="axissin071" c="FDESDE" dejarHueco="false"> <!-- TODO C -->
                                    <td class="campocaja">
                                        <input type="text" class="campowidthinput campo campotexto" size="15" value="<fmt:formatDate value='${axisadm206_plListaVersionesDian[0].FINIVIG}' pattern='dd/MM/yyyy'/>" name="FDESDE" id="FDESDE" 
                                            style="width:55%;" <axis:atr f="axissin071" c="FDESDE" a="modificable=true&formato=fecha"/> /> 
                                            <a style="vertical-align:middle;"><img
                                            id="icon_FDESDE" border=0 alt="<axis:alt f="axissin071" c="LIT_FDESDE" lit="9902360"/>" title="<axis:alt f="axissin071" c="LIT_FDESDE_TIT" lit="9902360"/>" src="images/calendar.gif"/></a>
                                    </td>
                                </axis:ocultar>      

                             </tr>
                             
                             <tr>
                                <axis:ocultar f="axissin071" c="FHASTA" dejarHueco="false">
                                    <td class="titulocaja" ><b id="label_FHASTA"><axis:alt f="axissin071" c="LIT_FHASTA" lit="9902361"/></b></td>
                                 </axis:ocultar>
                            </tr>
                            
                            <tr>   
                                
                            <axis:ocultar f="axissin071" c="FHASTA" dejarHueco="false">
                                   <td class="campocaja" colspan="1"> 
                                        <input type="text" class="campowidthinput campo campotexto" size="15" value="<fmt:formatDate value='${axisadm206_plListaVersionesDian[0].FINIVIG}' pattern='dd/MM/yyyy'/>" name="FHASTA" id="FHASTA" 
                                            style="width:55%;" <axis:atr f="axisadm206" c="FHASTA" a="modificable=true&formato=fecha"/> /> 
                                            <a style="vertical-align:middle;"><img
                                            id="icon_FHASTA" border=0 alt="<axis:alt f="axisadm206" c="LIT_FHASTA" lit="100885"/>" title="<axis:alt f="axisadm206" c="LIT_FHASTA_TIT" lit="100885"/>" src="images/calendar.gif"/></a>
                                   </td>
                            </axis:ocultar>
                            
                            
                           </tr>
                             
                              
                        </table>
                        <div class="separador">&nbsp;</div>   
                        </tr>
                    </table>
                    
           
                       
                    </td>
        </tr>
        <tr>                    
        </tr>  
    </table>
            
            <c:import url="../include/botonera_nt.jsp"><c:param name="f">axissin071</c:param>
                <c:param name="f">axissin071</c:param>
                <c:param name="__botones">salir<axis:visible f="axissin071" c="BT_ACEPTAR">,aceptar</axis:visible></c:param>
            </c:import>
    </form>
<c:import url="../include/mensajes.jsp" />

    <script type="text/javascript">
        Calendar.setup({
            inputField     :    "FDESDE",     
            ifFormat       :    "%d/%m/%Y",      
            button         :    "icon_FDESDE", 
            singleClick    :    true,
            firstDay       :    1
        });
     </script>
     <script type="text/javascript">
           Calendar.setup({
               inputField     :    "FHASTA",     
               ifFormat       :    "%d/%m/%Y",      
               button         :    "icon_FHASTA", 
               singleClick    :    true,
              firstDay       :    1
        });
     </script>
</body>
</html>

