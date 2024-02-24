<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<c:set var="pantalla" value="axispro001_actividades"/>
<script type="text/javascript">      
    
        /****************************************************************************************/
        /********************************** ACTIVIDADES *****************************************/
        /****************************************************************************************/
     
        function f_but_actualizar_actividades(producto,actividad){
            document.miForm2.SPRODUC.value=producto;
            document.miForm2.CACTIVI.value=actividad;
            document.miForm2.submit(); 
        }
        
        <% request.getSession().setAttribute("AXISMPRXXX","axismpr003"); %>
        
        function f_abrir_como_modal(cual, SPRODUC,CACTIVI) {
            //alert("En como modal");
            if (objUtiles.estaVacio(SPRODUC))
                SPRODUC = '${mntproducto.SPRODUC}';
            
            document.miForm2.SPRODUC.value = SPRODUC;
            document.miForm2.CACTIVI.value = CACTIVI;
            
            objUtiles.abrirModal(cual, "src", "axis_"+cual+".do?operation=form&SPRODUC=" + SPRODUC + "&CACTIVI="+CACTIVI);        
        }
        
        /****SECCIONES DE ACTIVIDADES*********/
        function f_but_parametros_activ() {
            objUtiles.ejecutarFormulario("axis_axispro001.do", "consultarParametrosActivi", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
        
        //TODO PENDIENTE DE ANALISIS
        /*function f_but_preguntas_activ() {
            objUtiles.ejecutarFormulario("axis_axispro001.do", "consultarPreguntasActivi", document.miForm, "_self", objJsMessages.jslit_cargando);
        }*/
        
        function f_but_recargo_activ() {
            objUtiles.ejecutarFormulario("axis_axispro001.do", "consultarRecargoActivi", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
        
        function f_but_preguntas_activ(){
           
            var SPRODUC = document.miForm.SPRODUC.value;
            var CACTIVI = document.miForm.CACTIVI.value;
            
            objUtiles.abrirModal("axispro033", "src", "modal_axispro033.do?operation=form&SPRODUC="+SPRODUC+"&CACTIVI="+CACTIVI+"&VMODO=ACT"); 
            
        }
        
    </script>
<table cellpadding="0" cellspacing="5" class="seccion"
       style="padding:1% 1% 1% 1%">
  <tr>
    <td>
      <form name="${pantalla}">
        <input type="hidden" name="subpantalla" value="${pantalla}"/>
        <!-- DisplayTag Lista de productos -->
        <c:set var="title0">
          <fmt:message key="1000109"/>
        </c:set>
        <c:set var="title1">
          <fmt:message key="100588"/>
        </c:set>
        <div class="displayspace">
          <display:table name="${mntproducto.ACTIVID}" id="T_IAX_ACTIVIDADES"
                         export="false" class="dsptgtable" pagesize="6"
                         defaultsort="2" defaultorder="ascending" sort="list"
                         cellpadding="0" cellspacing="0"
                         requestURI="axis_axispro001.do?paginar=true&operation=actividades">
            <%@ include file="../include/displaytag.jsp"%>
            <display:column title="" sortable="false"
                            headerClass="headwidth5 sortable" style="width:5%"
                            media="html" autolink="false">
              <div class="dspIcons">
                <input type="radio" id="checked_actividad"
                       name="checked_actividad"
                       <c:if test="${T_IAX_ACTIVIDADES.OB_IAX_PRODACTIVIDADES.CACTIVI==sessionScope.ACTIVIDAD}">checked </c:if>
                       value="${T_IAX_ACTIVIDADES.OB_IAX_PRODACTIVIDADES.CACTIVI}"
                       onclick="f_but_actualizar_actividades('${mntproducto.SPRODUC}',${T_IAX_ACTIVIDADES.OB_IAX_PRODACTIVIDADES.CACTIVI})"/>
              </div>
            </display:column>
            <display:column title="${title0}" sortable="true"
                            sortProperty="OB_IAX_PRODACTIVIDADES.CACTIVI"
                            style="width:5%" headerClass="sortable" media="html"
                            autolink="false">
              <div class="dspNumber" style="text-align:right">
                ${T_IAX_ACTIVIDADES.OB_IAX_PRODACTIVIDADES.CACTIVI}
              </div>
            </display:column>
            <display:column title="${title1}" sortable="true"
                            sortProperty="OB_IAX_PRODACTIVIDADES.TACTIVI"
                            style="width:70%" headerClass="sortable"
                            media="html" autolink="false">
              <div class="dspText">
                ${T_IAX_ACTIVIDADES.OB_IAX_PRODACTIVIDADES.TACTIVI}
              </div>
            </display:column>
          </display:table>
        </div>
        <iframe id="actividades_seccion" name="actividades_seccion"
                style="width:100%;height:180px"
                src="axis_axispro001.do?operation=cargar_actividades&SPRODUC=${mntproducto.SPRODUC}&supantalla=${requestScope.subpantalla}"
                scrolling="auto" frameborder="0"></iframe>
      </form>
      <form name="miForm2" target="actividades_seccion" method="POST"
            action="axis_axispro001.do">
        <input type="hidden" name="CACTIVI" id="CACTIVI" value="0"/>
        <input type="hidden" name="SPRODUC" id="SPRODUC"
               value="${mntproducto.SPRODUC}"/>
        <input type="hidden" name="operation" id="operation"
               value="cargar_actividades"/>
      </form>
    </td>
  </tr>
</table>
<div class="separador">&nbsp;</div>