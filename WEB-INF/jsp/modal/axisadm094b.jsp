<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<%--
  Fichero: axisctr063.jsp
  @author <a href = "mailto:jsanchez@csi-ti.com">Jordi Sanchez</a>

  Fecha: 20/12/2007
--%>


<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>
<html>
    <head>
        <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
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

        <script type="text/javascript">
            
            function f_onload(){
             f_cargar_propiedades_pantalla();
             
                         
             if (document.getElementById('DIR').value != "" ){
             
             document.getElementById('but_aceptar').setAttribute("type", "hidden")
                                      
            }
            }
            
            ///////////////////////////////////////////////////
       
            function f_but_123456 (){
            
            
            f_imprimir_fitxer();
            
            
            }
            function f_but_aceptar () {
            
            if (objValidador.validaEntrada()){
			
			var bool = document.getElementById('CVALIDA');
            
            var VALIDA = ((bool.checked)?1:0);
            
                objUtiles.ejecutarFormulario("modal_axisadm094b.do?PVALIDA="+VALIDA, "aceptar", document.miForm, "_self", objJsMessages.jslit_cargando);
                
            }
            }
            function f_but_salir() {
                parent.f_but_cerrar_axisadm094b();
            }    

            function f_esconder_precargador (){
                objEventos.showHideLoader("ajaxLoader", "ajaxContent", "ajaxText", "", "none");
            }
            
            
            function f_imprimir_fitxer(){                    
                pfitxer = document.getElementById('DIR').value;
                var str2 = pfitxer.replace(/barrainvertida/gi, "\\"); 
                objUtiles.abrirModal("axisimprimir", "src", "modal_axisimprimir.do?operation=tunnel&file="+str2+"&origen=axislist003.jsp",600,200);
             }  

            
                        
                       
           
        </script>
    </head>
    <%--<body onload="f_onload()" >--%>
    <body onunload="try { f_clear_resources(document.body) } catch (e) {}" onload="f_onload()">
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>


    <form name="miForm" action="axis_axisadm094.do" method="POST">
          <input type="hidden" name="operation" value=""/>
          <input type="hidden" id="checked_mot" name="checked_mot"/>
          <input type="hidden" id="PMODO" name="PMODO" value="${__formdata.PMODO}"/>
          <input type="hidden" id="NLINEA" name="NLINEA" value="${__formdata.NLINEA}"/>
          <input type="hidden" id="SSEGURO" name="SSEGURO" value="${__formdata.SSEGURO}"/>            
          <input type="hidden" id="NPOLIZA" name="NPOLIZA" value="${__formdata.NPOLIZA}"/>
          <input type="hidden" id="CUSUALT" name="CUSUALT" value="${__formdata.CUSUALT}"/>
          <input type="hidden" id="DIR" name="DIR" value="${__formdata.DIR}"/>
            <c:import url="../include/titulo_nt.jsp"> 
                <c:param name="modalidad"> </c:param> 
                <c:param name="titulo"> </c:param>
                <c:param name="formulario"><c:choose><c:when test="${__formdata.PMODO == 0}"><fmt:message key="9001219" /></c:when><c:when test="${__formdata.PMODO == 1}"><fmt:message key="9001221" /></c:when></c:choose></c:param>
                <c:param name="producto"></c:param>
                <c:param name="form">axisadm094b</c:param>
            </c:import>
    <c:import url="../include/modal_estandar.jsp">
        <c:param name="nid_y_titulo">axisimprimir|<axis:alt f="axislist003" c="TIT_AXISIMPRIMIR" lit="1000205" />|true</c:param>
    </c:import>
            
    <!-- Area de campos  -->
    <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
       
        <tr>
            <td>
                <table class="area" align="center">
                   <tr>
                     <th style="width:25%;height:0%;"/>
                     <th style="width:25%;height:0%;"/>
                     <th style="width:25%;height:0%;"/>
                     <th style="width:25%;height:0%;"/>
                   </tr>                        

                
                                      
                       <tr>
                          <!-- Titulo Fecha Alta -->
                          <axis:ocultar f="axisctr063" c="FALTA" dejarHueco="false">
                          <td class="titulocaja">
                             <b><fmt:message key="9908377"/></b>
                          </td>
                          </axis:ocultar>
                       </tr>                       
                       <tr>
                          <!-- Fecha Alta -->
                          
                          <td class="campocaja">
                             <input type="text" 
                                    class="campowidthinput campo campotexto" 
                                    size="15" 
                                    value="<fmt:formatDate value='${__formdata.FALTA}' pattern='dd/MM/yyyy'/>" 
                                    name="FALTA" 
                                    id="FALTA" 
                                    style="width:45%;" <axis:atr f="axisctr063" c="FALTA" a="modificable=true&obligatorio=true"/> />
                                     <a style="vertical-align:middle;"><img
                                        id="icon_FALTA" 
                                        border=0 
                                        alt="<fmt:message key="9908377"/>" 
                                        title="<fmt:message key="9908377" />" 
                                        src="images/calendar.gif"/></a>
                          </td> 
                        
                        <td id="td_CVALIDA" class="campocaja" >
                                &nbsp;&nbsp;<b><axis:alt f="axisint001" c="AXISADM094" lit="9908575" /></b>&nbsp;&nbsp;
                                <input type="checkbox" style="vertical-align:middle;" onclick="" id="CVALIDA" name="CVALIDA" 
                                  
                               
                                
                        </td>
                        
                        
                       </tr>                    
                     
                       <tr>
                       
                          <!-- Titulo Fecha Finalizacion -->
                          <axis:ocultar f="axisctr063" c="FFINALI" dejarHueco="false">
                          <td class="titulocaja">
                             <b><fmt:message key="9908378"/></b>
                          </td>
                          </axis:ocultar>
                       </tr>
                       <tr>
                          <!-- Fecha Finalizacion -->
                          
                          <td class="campocaja">
                             <input type="text" 
                             class="campowidthinput campo campotexto" 
                             size="15" 
                             style="width:45%;" 
                             value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FFINALI}" />" 
                             name="FFINALI" 
                             id="FFINALI" 
                             <axis:atr f="axisctr063" c="FFINALI" a="modificable=true&obligatorio=true"/> />
                             <a style="vertical-align:middle;"><img
                                id="icon_FFINALI" 
                                border=0 
                                alt="<fmt:message key="9908378"/>" 
                                title="<fmt:message key="9908378" />" 
                                src="images/calendar.gif"/></a>
                          </td> 
                         
                       </tr>
                       
                       
                     
                       
                                        
                    
                </table>
             
            <table class="seccion" align="center">
             
            
             <td>
             
             
             <a href="javascript:f_imprimir_fitxer()">${__formdata.DIR}</a>
            
             
             </td>
             
                          
            </table>     
                
            </td>
        </tr>
        
       
        
    </table>  <!-- Table area campos --> <!-- Ahora incluye a los dos forms -->

   

    <c:import url="../include/botonera_nt.jsp">
        <c:param name="__botones">
        salir,aceptar
        </c:param>
    </c:import>

    </form>
    
    <c:import url="../include/mensajes.jsp" />

    
    <script type="text/javascript">
        Calendar.setup({
            inputField     :    "FALTA",     
            ifFormat       :    "%d/%m/%Y",      
            button         :    "icon_FALTA", 
            singleClick    :    true,
            firstDay       :    1
        });
     </script>
     
    
        <script type="text/javascript">
           Calendar.setup({
               inputField     :    "FFINALI",     
               ifFormat       :    "%d/%m/%Y",      
               button         :    "icon_FFINALI", 
               singleClick    :    true,
              firstDay       :    1
        });
        </script>
     
    </body>
</html>

