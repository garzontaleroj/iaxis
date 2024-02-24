
<%@ page contentType="text/html;charset=iso-8859-15"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <link rel="stylesheet" href="styles/genericosHtml.css" type="text/css"></link>
    <link rel="stylesheet" href="styles/axisnt.css" type="text/css"></link>
    <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>
    <link rel="StyleSheet" href="styles/tree.css" type="text/css"></link>
    <link rel="stylesheet" type="text/css" media="all" href="styles/calendar-green.css" title="green"/>
    <script type="text/javascript" src="scripts/calendar.js"></script>
    <script type="text/javascript" src="scripts/calendar-${sessionScope.__locale}.js"></script>
    <script type="text/javascript" src="scripts/calendar-setup.js"></script>
    <c:import url="../include/carga_framework_js.jsp"/>
    <script type="text/javascript">
      
        function f_but_cancelar() {
     
           parent.f_cerrar_modal("axisdesc017");
        }
        
        function f_onload() {
                
            var ok = "${__formdata.OK}";
            if (!objUtiles.estaVacio(ok) &&  ok == 0){
                var CCAMPANYA = objDom.getValorPorId("CCAMPANYA");
                parent.f_aceptar_axisdesc017(CCAMPANYA);
            }
            
            f_cargar_propiedades_pantalla(); 
            document.getElementById("CCAMPANYA").focus();
        }
        
        function f_but_aceptar() {
            
              var CCAMPANYA = objDom.getValorPorId("CCAMPANYA");
              var FINICIO = objDom.getValorPorId("FINICIO");
              var FFIN = objDom.getValorPorId("FFIN");
              
              if (objValidador.validaEntrada()) {
                f_habilitar_campos();
                objUtiles.ejecutarFormulario ("modal_axisdesc017.do", "aceptar", document.miForm, "_self", objJsMessages.jslit_cargando);
              }
        }
        
         function f_habilitar_campos(){
            var selects = document.getElementsByTagName("select");
           // var checkboxs = document.getElementsByTagName("checkbox");
            for(var i=0;i<selects.length;i++){
                if(selects[i].attributes.length>0) {
                   var selectId = selects[i].getAttribute("id");
                     try{
                         if (document.getElementById(selectId).style.visibility != 'hidden' ){
                             if(selects[i].getAttribute("type") != "button"  &&
                                objDom.estaDisabled(selectId))
                                    objDom.setDisabledPorId(selectId,false);
                         }
                     }catch(e){}
                }
            }
        }

            function f_formatdate(entrada,title){
                 var jDate = new JsFecha();
                    if(entrada.value.length>0){
                        entrada.value=jDate.formateaFecha(entrada.value);
                    
                        if(jDate.validaFecha(entrada.value)){
                            entrada.value=jDate.formateaFecha(entrada.value);
                        }else{
                            alert("<axis:alt c='VALIDA_FECHA' f='axisdesc015' lit='1000421'/>");
                            entrada.value = '';
                        }
                    }else{entrada.value = '';}
            }


    </script>
  </head>
  <body onunload="try { f_clear_resources(document.body) } catch (e) {}"
        onload="f_onload()" ><c:import url="../include/precargador_ajax.jsp">
      <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import><form name="miForm" action="modal_axisdesc017.do" method="POST">
      <c:import url="../include/titulo_nt.jsp">
        <c:param name="titulo">
          <axis:alt f="axisdesc017" c="TITULO" lit="9905600"/>
        </c:param>
        <c:param name="formulario">
          <axis:alt f="axisdesc017" c="TITULO" lit="9905600"/>
        </c:param>
        <c:param name="form">axisdesc017</c:param>
      </c:import>
      <input type="hidden" id="operation" name="operation" value=""/>
      <input type="hidden" name="MODO" id="MODO" value="${__formdata.MODO}" />
      <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="3">
        <tr>
          <td>
            <div class="separador">&nbsp;</div>
            <table class="seccion">
              <tr>
                <td>
                  <table class="area" align="center">
                    <tr>
                      <th style="width:25%;height:0%;"></th>
                      <th style="width:15%;height:0%;"></th>
                      <th style="width:15%;height:0%;"></th>
                      <th style="width:45%;height:0%;"></th>
                    </tr>
                    <tr>
                      <axis:ocultar f="axisdesc017" c="CCAMPANYA">
                        <td class="titulocaja">
                          <b><axis:alt f="axisdesc017" c="CCAMPANYA" lit="103465"/></b>
                        </td>
                      </axis:ocultar>
                      <axis:ocultar f="axisdesc017" c="FINICIO">
                        <td class="titulocaja">
                          <b><axis:alt f="axisdesc017" c="FINICIO" lit="9000526"/></b>
                        </td>
                      </axis:ocultar>
                      <axis:ocultar f="axisdesc017" c="FFIN">
                        <td class="titulocaja">
                          <b><axis:alt f="axisdesc017" c="FFIN" lit="9000527"/></b>
                        </td>
                      </axis:ocultar>
                    </tr>
                    <tr>
                      <axis:ocultar f="axisdesc017" c="CCAMPANYA">
                        <td class="campocaja">
                                        <select name = "CCAMPANYA" id="CCAMPANYA" style="width:100%;" size="1"  class="campowidthselect campo campotexto"
                                             <axis:atr f="axisdesc017" c="CCAMPANYA" a="isInputText=false&modificable=true&obligatorio=true"/>
                                             <c:if test="${__formdata.MODO == 'MODIF'}">
                                                <axis:atr f="axisdesc017" c="CCAMPANYA" a="isInputText=false&modificable=false&obligatorio=true"/>
                                             </c:if>>
                                            <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisdesc017" c="SELECCIONAR" lit="108341"/> - </option>
                                            <c:forEach var="campa" items="${__formdata.listaCampanyas}">
                                                <option value = "${campa.CCAMPANYA}"
                                                    <c:if test="${campa.CCAMPANYA == __formdata.CCAMPANYA}">selected</c:if>>
                                                    ${campa.TCAMPANYA}
                                                </option>
                                            </c:forEach>
                                        </select>
                                    </td>
                      </axis:ocultar>
                      <axis:ocultar f="axisdesc017" c="FINICIO">
                        <td class="campocaja">  
                                     <input style="width:50%;"  type="text" class="campowidthinput campo campotexto" id="FINICIO" name="FINICIO" size="15"  title="<axis:alt f='axisdesc017' c='FINICIO' lit='9000526' />" 
                                      onchange="javascript:f_formatdate(this,'')" value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FINICIO}"/>" <axis:atr f="axisdesc017" c="FINICIO" a="modificable=true&formato=fecha"/> />
                                     <a id="icon_FINICIO" style="vertical-align:middle;">
                                     <img alt="<axis:alt f="axisdesc017" c="DATE" lit="108341"/>" title="<axis:alt f="axisdesc017" c="FINICIO" lit="9001861" />" src="images/calendar.gif"/></a>                  
                                </td>
                      </axis:ocultar>
                      <axis:ocultar f="axisdesc017" c="FFIN">
                        <td class="campocaja">  
                                     <input style="width:50%;"  type="text" class="campowidthinput campo campotexto" id="FFIN" name="FFIN" size="15"  title="<axis:alt f='axisdesc017' c='FFIN' lit='9000527' />" 
                                     onchange="javascript:f_formatdate(this,'')" value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FFIN}"/>" <axis:atr f="axisdesc017" c="FFIN" a="modificable=true&formato=fecha"/> />
                                     <a id="icon_FFIN" style="vertical-align:middle;">
                                     <img alt="<axis:alt f="axisdesc017" c="DATE" lit="108341"/>" title="<axis:alt f="axisdesc017" c="FFIN" lit="9001861" />" src="images/calendar.gif"/></a>                  
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
      <c:import url="../include/botonera_nt.jsp">
        <c:param name="f">axisdesc017</c:param>
        <c:param name="__botones">cancelar,aceptar</c:param>
      </c:import>
      <div class="separador">&nbsp;</div>
    </form><c:import url="../include/mensajes.jsp"/>
    
      <script type="text/javascript">
            <axis:ocultar f="axisdesc017" c="FINICIO" dejarHueco="false">
            Calendar.setup({
                inputField     :    "FINICIO",     
                ifFormat       :    "%d/%m/%Y",      
                button         :    "icon_FINICIO", 
                singleClick    :    true,
                firstDay       :    1
            });
            </axis:ocultar>
      
            <axis:ocultar f="axisdesc017" c="FFIN" dejarHueco="false">
            Calendar.setup({
                inputField     :    "FFIN",     
                ifFormat       :    "%d/%m/%Y",      
                button         :    "icon_FFIN", 
                singleClick    :    true,
                firstDay       :    1
            });
            </axis:ocultar>
        </script>
        
</body>
</html>