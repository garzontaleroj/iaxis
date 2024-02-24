<%/*
*  Fichero: axisadm030.jsp
*
*  Fecha: 05/03/2009
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
    <title><axis:alt f="axisadm038" c="TITLE" lit="9001162"/></title> <%-- Tratamiento de recibos --%>
    <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
    <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
    <link rel="stylesheet" href="styles/displaytag.css">
    <c:import url="../include/carga_framework_js.jsp"/>
   
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
    
        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/
        
        function f_onload() { 
            ok = "${__formdata.OK}";
            f_cercarTransferencies(ok);
            document.miForm.tipos.value = '';
            revisarEstilos(); 
            
            //f_inicialitzarChecks();
            CTRANSFERIDOS = "${__formdata.CTRANSFERIDOS}";
            if (objUtiles.estaVacio(CTRANSFERIDOS)){
                document.miForm.CTRANSFERIDOS.value = 0;
                f_ini_trans(0);
            }else{
                f_ini_trans(CTRANSFERIDOS);
            }
            
            <c:forEach items="${__formdata.listvalores.empresas}" var="item">
                    <c:if test="${(!empty __formdata['CEMPRES'] && __formdata['CEMPRES']==item.CEMPRES)}">
                                 document.miForm.CEMPRES.value = "${item.CEMPRES}"; 
                    </c:if>
            </c:forEach>
            
            f_cargar_propiedades_pantalla();
            
          }
          
          function f_inicialitzarChecks(){
          <c:forEach items="${__formdata.listvalores.tiposbusqueda}" var="item" varStatus="status" >
            <c:if test="${item.CATRIBU != 0 && item.CATRIBU != 9}">
              tipos = document.miForm.tipos.value;
              tipos = objUtiles.estaVacio(tipos) ? "|"+tipos : tipos ;
              var catr = "${item.CATRIBU}";
              tipos = tipos + catr+"|";
              document.miForm.tipos.value = tipos;
              

              id = "CTIPOBUSQUEDA_"+"${item.CATRIBU}";
              document.getElementById(id).checked = true;
              
            </c:if>  
          </c:forEach>
          }
          function f_buscar_trans(){
                
                CEMPRES = document.miForm.CEMPRES.value;
                CAGRUP = document.miForm.CAGRUP.value;
                CRAMO = document.miForm.CRAMO.value;
                SPRODUC = document.miForm.SPRODUC.value;
                FABONOINI = document.miForm.FABONOINI.value;
                FABONOFIN = document.miForm.FABONOFIN.value;
                FTRANSINI = document.miForm.FTRANSINI.value;
                FTRANSFIN = document.miForm.FTRANSFIN.value;
                CTRANSFERIDOS = document.miForm.CTRANSFERIDOS.value;
                NREMESA = document.miForm.NREMESA.value;
                                
                tipos = document.miForm.tipos.value;
                             
                parent.f_buscar_transferencias(CEMPRES, CAGRUP,CRAMO,SPRODUC,
                FABONOINI,FABONOFIN,FTRANSINI,FTRANSFIN,CTRANSFERIDOS,tipos,NREMESA, "cercant");
                
          }
          function f_cercarTransferencies(ok){
           if (!objUtiles.estaVacio(ok)) {
                var msg = "${__formdata.MSG}";
               if(!objUtiles.estaVacio(msg)) {
                 if (confirm(msg)){
                        f_buscar_trans();
                    }else{
                    objUtiles.ejecutarFormulario ("modal_axisadm038.do", "init", document.miForm, "_self", objJsMessages.jslit_cargando);    
                    }
              }else{
                f_buscar_trans();
              }
             }
         }
          
       
          function f_recargar(){
             if (objValidador.validaEntrada()) {
                 document.miForm.CEMPRES.value = document.miForm.CEMPRES_AUX.value;
                 //alert(document.miForm.CEMPRES.value);
                 objUtiles.ejecutarFormulario ("modal_axisadm038.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);    
             }
          }
          
          function f_recargar_empresa(){
             if (objValidador.validaEntrada()) {
                 document.miForm.CEMPRES.value = document.miForm.CEMPRES_AUX.value;
                 document.miForm.CAGRUP.value = '<%= Integer.MIN_VALUE %>';
                 objUtiles.ejecutarFormulario ("modal_axisadm038.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);    
             }
          }
          
          
          function f_recargar_agrupa(){
             if (objValidador.validaEntrada()) {
                 objUtiles.ejecutarFormulario ("modal_axisadm038.do", "recargar_agrupa", document.miForm, "_self", objJsMessages.jslit_cargando);    
             }
          }
          
          function f_but_buscar(){
                                  
             
             if (objValidador.validaEntrada()) {
       
                 if (!objUtiles.estaVacio(document.miForm.tipos.value) || !objUtiles.estaVacio(document.miForm.NREMESA.value)  ) {
                     if (objValidador.validaEntrada()) {
                     
                     
                        objUtiles.ejecutarFormulario ("modal_axisadm038.do", "buscar", document.miForm, "_self", objJsMessages.jslit_cargando);    
                        
                     }
                }else{
                     alert("<axis:alt f='axisadm038' c='ALERT_BUSC' lit='9001857' />");
                }
             } 
          }
          function f_actualitzarCheck(thiss){
              thiss.value = thiss.checked ? 1 : 0;
          }
          
          function f_addtipobusqueda(thiss){
           
              tipos = document.miForm.tipos.value;
              tipos = objUtiles.estaVacio(tipos) ? "|"+tipos : tipos ;
                  if (thiss.checked ){
                    tipos = tipos + thiss.value+"|";
                    f_comprobarMarcatTots();
                  }else{
                    tipos = f_removetipobusqueda(thiss);
                 }
              
              document.miForm.tipos.value = tipos;
          }
          
          function f_comprobarMarcatTots(){
           <c:forEach items="${__formdata.listvalores.tiposbusqueda}" var="item" varStatus="status" >
                    <c:if test="${item.CATRIBU != 0 && item.CATRIBU != 9}">
                      id = "CTIPOBUSQUEDA_"+"${item.CATRIBU}";                     
                      if (!document.getElementById(id).checked){
                      document.miForm.CHECKTOTS.checked = false;
                      return;
                      }
            </c:if>  
          </c:forEach>
          
          document.miForm.CHECKTOTS.checked = true;
          return;
          
          }
          
          function f_removetipobusqueda(thiss){
          
            tipos = document.miForm.tipos.value;
            var vec=tipos.split("|");
            tipos = "|";
            document.miForm.CHECKTOTS.checked = false;
            afegit = false;
            for(i=0;i<(vec.length-1);i++){
               if ( !objUtiles.estaVacio(vec[i]) && vec[i] != thiss.value){
                 tipos = tipos + vec[i] + "|";
                 afegit = true;

                }
            }
            
             if (!afegit)
                 tipos = '';  
            
            return tipos;
            
          }
          
          
       function f_actualitzarTransferidos(thiss){
            if ( !objUtiles.estaVacio(thiss.value) && (!objUtiles.estaVacio(document.miForm.CTRANSFERIDOS.value) && document.miForm.CTRANSFERIDOS.value != 2)  ){
              document.miForm.CTRANSFERIDOS.value = 1;
              document.miForm.b.checked = true;
            }
          }
          
       function f_actCTRANSFERIDOS(thiss){
          
          document.miForm.CTRANSFERIDOS.value = thiss.value;
          if (thiss.value == 2){
            var NREM = document.getElementById("NREMESA");              
            NREM.setAttribute("obligatorio",true);
            document.getElementById("NREMESA").className="campowidthinput campo campotexto_ob";
          }
          else{
            var NREM = document.getElementById("NREMESA");              
            NREM.setAttribute("obligatorio",false);
            document.getElementById("NREMESA").className="campowidthinput campo";
          }

            var NREM = document.getElementById("IIMPORTT");              
            NREM.setAttribute("obligatorio",false);
            document.getElementById("IIMPORTT").className="campowidthinput campo";
            
            var NREM = document.getElementById("NREMESA1");              
            NREM.setAttribute("obligatorio",false);
            document.getElementById("NREMESA1").className="campowidthinput campo";
            
            var NREM = document.getElementById("FABONOINI");              
            NREM.setAttribute("obligatorio",false);
            document.getElementById("FABONOINI").className="campowidthinput campo";
            
            var NREM = document.getElementById("FABONOFIN");              
            NREM.setAttribute("obligatorio",false);
            document.getElementById("FABONOFIN").className="campowidthinput campo";
            
            var NREM = document.getElementById("FTRANSINI");              
            NREM.setAttribute("obligatorio",false);
            document.getElementById("FTRANSINI").className="campowidthinput campo";
            
            var NREM = document.getElementById("FTRANSFIN");              
            NREM.setAttribute("obligatorio",false);
            document.getElementById("FTRANSFIN").className="campowidthinput campo";
//alert(thiss.value);
          //  Al seleccionar NO TRANSFERIDOS
          if (thiss.value == 0 || thiss.value == 2){
            objDom.setDisabledPorId("NREMESA", true);
            objDom.setDisabledPorId("NREMESA1", true);
            objDom.setDisabledPorId("FABONOINI", true);
            objDom.setVisibilidadPorId("icon_FABONOINI", "hidden");
            objDom.setDisabledPorId("FABONOFIN", true);
            objDom.setVisibilidadPorId("icon_FABONOFIN", "hidden");
            objDom.setDisabledPorId("FTRANSINI", true);
            objDom.setVisibilidadPorId("icon_FTRANSINI", "hidden");
            objDom.setDisabledPorId("FTRANSFIN", true);
            objDom.setVisibilidadPorId("icon_FTRANSFIN", "hidden");
            //
            //objDom.setDisabledPorId("NNUMIDE", true);
            //objDom.setDisabledPorId("TNOMBRE", true);
            //objDom.setDisabledPorId("asegurado", true);
            objDom.setDisabledPorId("IIMPORTT", true);
            //objDom.setDisabledPorId("BT_BORRAR_CAMPOS", true);
            //objDom.setDisabledPorId("BT_BUSCAR_PER", true);
            //objLista.borrarFilasDeLista ("DATOSPERSONA", "3", "<axis:alt f='axisadm038' c='DATOSPERSONA' lit='1000254'/>");
            f_borrar_campos();
            //
            habilitar_checks();
            
          }else{
            objDom.setDisabledPorId("NREMESA", false);
            objDom.setDisabledPorId("NREMESA1", false);
            objDom.setDisabledPorId("FABONOINI", false);
            objDom.setVisibilidadPorId("icon_FABONOINI", "visible");
            objDom.setDisabledPorId("FABONOFIN", false);
            objDom.setVisibilidadPorId("icon_FABONOFIN", "visible");
            objDom.setDisabledPorId("FTRANSINI", false);
            objDom.setVisibilidadPorId("icon_FTRANSINI", "visible");
            objDom.setDisabledPorId("FTRANSFIN", false);
            objDom.setVisibilidadPorId("icon_FTRANSFIN", "visible");
            //
            //objDom.setDisabledPorId("NNUMIDE", false);
            //objDom.setDisabledPorId("TNOMBRE", false);
            //objDom.setDisabledPorId("asegurado", false);
            objDom.setDisabledPorId("IIMPORTT", false);
            //objDom.setDisabledPorId("BT_BORRAR_CAMPOS", false);
            //objDom.setDisabledPorId("BT_BUSCAR_PER", false);
            //
          }

          //AL SELCCIONAR TRANSFERIDOS
          if (thiss.value == 1){
                  deshabilitar_checks();
                  
                  objDom.setDisabledPorId("NREMESA", true); //LCF
                 
                  objDom.setDisabledPorId("CEMPRES_AUX", false);
                  objDom.setDisabledPorId("CAGRUP", false);
                  objDom.setDisabledPorId("CRAMO", false);
                  objDom.setDisabledPorId("SPRODUC", false);
                  //
                  objDom.setDisabledPorId("NNUMIDE", false);
                  objDom.setDisabledPorId("TNOMBRE", false);
                  objDom.setDisabledPorId("asegurado", false);
                  objDom.setDisabledPorId("BT_BORRAR_CAMPOS", false);
                  objDom.setDisabledPorId("BT_BUSCAR_PER", false);
                  //
          }

          //AL SELECCIONAR GENERACION FICHERO
          if (thiss.value == 2){
                   deshabilitar_checks();
                   objDom.setDisabledPorId("NREMESA", false);
                   objDom.setDisabledPorId("NREMESA1", true); //LCF
                   
                    objDom.setDisabledPorId("CEMPRES_AUX", true);
                    objDom.setDisabledPorId("CAGRUP", true);
                    objDom.setDisabledPorId("CRAMO", true);
                    objDom.setDisabledPorId("SPRODUC", true);
                    //
                  objDom.setDisabledPorId("NNUMIDE", true);
                  objDom.setDisabledPorId("TNOMBRE", true);
                  objDom.setDisabledPorId("asegurado", true);
                  objDom.setDisabledPorId("BT_BORRAR_CAMPOS", true);
                  objDom.setDisabledPorId("BT_BUSCAR_PER", true);
                  objLista.borrarFilasDeLista ("DATOSPERSONA", "3", "<axis:alt f='axisadm038' c='DATOSPERSONA' lit='1000254'/>");
                  //
          }

          if (thiss.value == 0){
            document.miForm.NREMESA.value = '';
            document.miForm.NREMESA1.value = '';
            
            objDom.setDisabledPorId("CEMPRES_AUX", false);
            objDom.setDisabledPorId("CAGRUP", false);
            objDom.setDisabledPorId("CRAMO", false);
            objDom.setDisabledPorId("SPRODUC", false);
            //
          objDom.setDisabledPorId("NNUMIDE", false);
          objDom.setDisabledPorId("TNOMBRE", false);
          objDom.setDisabledPorId("asegurado", false);
          objDom.setDisabledPorId("BT_BORRAR_CAMPOS", false);
          objDom.setDisabledPorId("BT_BUSCAR_PER", false);
          //
          }
          //revisarEstilos();
       }
       
       
       function f_ini_trans(cod){
          
          var tipo_trans = cod;
          if (tipo_trans == 2){
           
            var NREM = document.getElementById("NREMESA");              
            NREM.setAttribute("obligatorio",true);
            document.getElementById("NREMESA").className="campowidthinput campo campotexto_ob";
          }
          else{
           
            var NREM = document.getElementById("NREMESA");              
            NREM.setAttribute("obligatorio",false);
            document.getElementById("NREMESA").className="campowidthinput campo";
          }
          
          //  Al seleccionar NO TRANSFERIDOS
          if (tipo_trans == 0 || tipo_trans == 2){
            objDom.setDisabledPorId("NREMESA", true);
            objDom.setDisabledPorId("NREMESA1", true);
            objDom.setDisabledPorId("FABONOINI", true);
            objDom.setVisibilidadPorId("icon_FABONOINI", "hidden");
            objDom.setDisabledPorId("FABONOFIN", true);
            objDom.setVisibilidadPorId("icon_FABONOFIN", "hidden");
            objDom.setDisabledPorId("FTRANSINI", true);
            objDom.setVisibilidadPorId("icon_FTRANSINI", "hidden");
            objDom.setDisabledPorId("FTRANSFIN", true);
            objDom.setVisibilidadPorId("icon_FTRANSFIN", "hidden");
            //habilitar_checks();
            //
            //objDom.setDisabledPorId("NNUMIDE", true);
            //objDom.setDisabledPorId("TNOMBRE", true);
            //objDom.setDisabledPorId("asegurado", true);
            objDom.setDisabledPorId("IIMPORTT", true);
            //objDom.setDisabledPorId("BT_BORRAR_CAMPOS", true);
            //objDom.setDisabledPorId("BT_BUSCAR_PER", true);
            //objLista.borrarFilasDeLista ("DATOSPERSONA", "3", "<axis:alt f='axisadm038' c='DATOSPERSONA' lit='1000254'/>");
            f_borrar_campos();
            //
            
          }else{
            objDom.setDisabledPorId("NREMESA", false);
            objDom.setDisabledPorId("NREMESA1", false);
            objDom.setDisabledPorId("FABONOINI", false);
            objDom.setVisibilidadPorId("icon_FABONOINI", "visible");
            objDom.setDisabledPorId("FABONOFIN", false);
            objDom.setVisibilidadPorId("icon_FABONOFIN", "visible");
            objDom.setDisabledPorId("FTRANSINI", false);
            objDom.setVisibilidadPorId("icon_FTRANSINI", "visible");
            objDom.setDisabledPorId("FTRANSFIN", false);
            objDom.setVisibilidadPorId("icon_FTRANSFIN", "visible");
            //
            //objDom.setDisabledPorId("NNUMIDE", false);
            //objDom.setDisabledPorId("TNOMBRE", false);
            //objDom.setDisabledPorId("asegurado", false);
            objDom.setDisabledPorId("IIMPORTT", false);
            //objDom.setDisabledPorId("BT_BORRAR_CAMPOS", false);
            //objDom.setDisabledPorId("BT_BUSCAR_PER", false);
            //
          }
          
          //AL SELCCIONAR TRANSFERIDOS
          if (tipo_trans == 1){
                  deshabilitar_checks();
                  
                  objDom.setDisabledPorId("NREMESA", true);  //LCF
                  
                  objDom.setDisabledPorId("CEMPRES_AUX", false);
                  objDom.setDisabledPorId("CAGRUP", false);
                  objDom.setDisabledPorId("CRAMO", false);
                  objDom.setDisabledPorId("SPRODUC", false);
                  //
              objDom.setDisabledPorId("NNUMIDE", false);
              objDom.setDisabledPorId("TNOMBRE", false);
              objDom.setDisabledPorId("asegurado", false);
              objDom.setDisabledPorId("BT_BORRAR_CAMPOS", false);
              objDom.setDisabledPorId("BT_BUSCAR_PER", false);
              //
          }
          
          //AL SELECCIONAR GENERACION FICHERO
          if (tipo_trans == 2){
                   deshabilitar_checks();
                   objDom.setDisabledPorId("NREMESA", false);
                   objDom.setDisabledPorId("NREMESA1", true); //LCF
                   
                   objDom.setDisabledPorId("CEMPRES_AUX", true);
                   objDom.setDisabledPorId("CAGRUP", true);
                   objDom.setDisabledPorId("CRAMO", true);
                   objDom.setDisabledPorId("SPRODUC", true);
                   //
              objDom.setDisabledPorId("NNUMIDE", true);
              objDom.setDisabledPorId("TNOMBRE", true);
              objDom.setDisabledPorId("asegurado", true);
              objDom.setDisabledPorId("BT_BORRAR_CAMPOS", true);
              objDom.setDisabledPorId("BT_BUSCAR_PER", true);
              objLista.borrarFilasDeLista ("DATOSPERSONA", "3", "<axis:alt f='axisadm038' c='DATOSPERSONA' lit='1000254'/>");
              //
                   
          }
          
          
          
          if (tipo_trans == 0){
            document.miForm.NREMESA.value = '';
            document.miForm.NREMESA1.value = '';
            
            objDom.setDisabledPorId("CEMPRES_AUX", false);
            objDom.setDisabledPorId("CAGRUP", false);
            objDom.setDisabledPorId("CRAMO", false);
            objDom.setDisabledPorId("SPRODUC", false);
            //
          objDom.setDisabledPorId("NNUMIDE", false);
          objDom.setDisabledPorId("TNOMBRE", false);
          objDom.setDisabledPorId("asegurado", false);
          objDom.setDisabledPorId("BT_BORRAR_CAMPOS", false);
          objDom.setDisabledPorId("BT_BUSCAR_PER", false);
          //
          }
          
       }
       
       
       
       
       
        function f_but_cancelar() {
            parent.f_cerrar_axisadm038();
        }   
        
        function deshabilitar_checks(){
        
        <c:forEach items="${__formdata.listvalores.tiposbusqueda}" var="item" varStatus="status" >
            <c:if test="${item.CATRIBU != 0 && item.CATRIBU != 9}">
              tipos = document.miForm.tipos.value;
              tipos = objUtiles.estaVacio(tipos) ? "|"+tipos : tipos ;
              var catr = "${item.CATRIBU}";
              tipos = tipos + catr+"|";
              document.miForm.tipos.value = tipos;
              

              id = "CTIPOBUSQUEDA_"+"${item.CATRIBU}";
              //document.getElementById(id).checked = true;
              document.getElementById(id).disabled = true;
              
            </c:if>  
              document.getElementById("CHECKTOTS").disabled=true;
          </c:forEach>
        
        }
        
        
        function habilitar_checks(){
        
        <c:forEach items="${__formdata.listvalores.tiposbusqueda}" var="item" varStatus="status" >
            <c:if test="${item.CATRIBU != 0 && item.CATRIBU != 9}">
              tipos = document.miForm.tipos.value;
              tipos = objUtiles.estaVacio(tipos) ? "|"+tipos : tipos ;
              var catr = "${item.CATRIBU}";
              tipos = tipos + catr+"|";
              document.miForm.tipos.value = tipos;
              

              id = "CTIPOBUSQUEDA_"+"${item.CATRIBU}";
              //document.getElementById(id).checked = true;
              document.getElementById(id).disabled = false;
              
            </c:if>  
            document.getElementById("CHECKTOTS").disabled=false;
          </c:forEach>
        
        }
        
        function f_checkdescheck(thiss){
                if (thiss.checked)
                f_inicialitzarChecks();
                else{
                  document.miForm.tipos.value = '';
                  <c:forEach items="${__formdata.listvalores.tiposbusqueda}" var="item" varStatus="status" >
                    <c:if test="${item.CATRIBU != 0 && item.CATRIBU != 9 }">
                      id = "CTIPOBUSQUEDA_"+"${item.CATRIBU}";
                      document.getElementById(id).checked = false;
                    </c:if>  
                  </c:forEach>
                  }
        }
        
        function f_cargar_DATOSPERSONA() {        
            var params = "&NNUMIDE=" + objDom.getValorPorId("NNUMIDE") + "&TNOMBRE=" + objDom.getValorPorId("TNOMBRE"); 
            objAjax.invokeAsyncCGI("modal_axisadm038.do", callbackCargarDatosPersona, 
                "operation=ajax_cargarDatosPersona" + params, this);
        }
        
        function f_seleccionar_persona(SPERSON, TNOMBRE,NNUMIDE) {
        
            var radioSPERSON = document.miForm.radioSPERSON;
           
            // Marcar/desmarcar radiobuttons
            if (objUtiles.estaVacio(radioSPERSON.length))
                radioSPERSON.checked = true;
            else {
                for (var i = 0; i < radioSPERSON.length; i++) 
                    radioSPERSON[i].checked = (radioSPERSON[i].value == SPERSON);
            }
            
            objDom.setValorPorId("SPERSON", SPERSON);
            objDom.setValorPorId("TNOMBRE", TNOMBRE);            
            objDom.setValorPorId("NNUMIDE", NNUMIDE);   
        }

        function f_borrar_campos() {
        
            objDom.setValorPorId("NNUMIDE", "");
             objDom.setValorPorId("SPERSON", "");
            objDom.setValorPorId("TNOMBRE", "");
           // f_cargar_DATOSPERSONA();
           //document.getElementById("NNUMIDE").focus();
        }

        /****************************************************************************************/
        /********************************** CALLBACK  *******************************************/
        /****************************************************************************************/
        
        function callbackCargarDatosPersona(ajaxResponseText) {
            var doc = objAjax.domParse(ajaxResponseText);
            // Buscamos las filas (tradded) y el cuerpo (tbodyadded) de un displayTag asociado (miListaId) 
            // para poder añadir una nueva fila
            if (!objAppMensajes.existenErroresEnAplicacion(doc)){
                var tbodyadded = objLista.obtenerBodyLista("DATOSPERSONA");
                var tradded = objLista.obtenerFilasBodyLista("DATOSPERSONA", tbodyadded);
                var primerSPERSON = null;
                var primerTEXTO   = null;
                var primerNNUMIDE = null;
                
                objLista.borrarFilasDeLista ("DATOSPERSONA", "3", "<axis:alt f='axisadm038' c='DATOSPERSONA' lit='1000254'/>");
                
                if (objDom.existeTag(doc, "CODI"))
                    // Si hay registros, eliminamos el tr "No se han encontrado datos"
                    objLista.borrarFilaVacia(tbodyadded, tradded);
                
                // Bucle para insertar cada una de las filas
                for (var i = 0; i < objDom.numeroDeTags(doc, "CODI") ; i++) {
                    // Obtenemos el estilo para la fila que insertaremos
                    var rowstyle = objLista.addEstiloEnFilaDeLista(tradded, "gridEven", "gridNotEven");
                    // Creamos una nueva fila vacia y le damos el estilo obtenido
                    var newtr = objLista.crearNuevaFila(rowstyle);
                    // Creamos un array de columnas a añadir a la nueva fila del displayTag
                    var newtd = new Array(4);
                    // Creamos todas las columnas (newtdX) asociadas a la fila que estamos creando
                    
                    var SPERSON   = objDom.getValorNodoDelComponente(doc.getElementsByTagName("CODI"), i, 0);
                    var VALOR   = objDom.getValorNodoDelComponente(doc.getElementsByTagName("VALOR"), i, 0);
                    var TEXTO     = objDom.getValorNodoDelComponente(doc.getElementsByTagName("TEXTO"), i, 0);
                  //  TEXTO = objUtiles.replaceAll(TEXTO, "'", "\'");
                     TEXTO=TEXTO.replace(/'/g, "\\'");
                    var jsFuncion = "javascript:f_seleccionar_persona('" + SPERSON + "', '" + TEXTO + "', '" + VALOR + "')";
                    
                    newtd[0] = objLista.addRadioButtonEnLista("radioSPERSON", SPERSON, jsFuncion);             
                    
                    if (i == 0 && !objUtiles.estaVacio(newtd[0])) {
                        primerSPERSON = SPERSON;
                        primerTEXTO   = TEXTO;
                        primerNNUMIDE   = VALOR;
                    }
                        
                    newtd[1] = objLista.addTextoEnLista(VALOR, jsFuncion);
                    newtd[2] = objLista.addTextoEnLista(TEXTO, jsFuncion);
                    
                    // Añadimos la nueva fila(con sus nuevas columnas) al cuerpo del displayTag
                    objLista.addNuevaFila(newtd, newtr, tbodyadded);
                }
                
                // Seleccionar el primero si sólo hay uno
                
                if (!objUtiles.estaVacio(primerSPERSON) && objDom.numeroDeTags(doc, "CODI") == 1)
                    f_seleccionar_persona(primerSPERSON, primerTEXTO,primerNNUMIDE);
                                                        
            } // Fi if
        }
          
    </script>    
</head>

<body  onload="f_onload()">
    
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
    
    <form name="miForm" action="" method="POST">         
    
        <input type="hidden" name="operation" value=""/>
        <input type="hidden" name="tipos"   value="${__formdata.tipos}"/>
        <input type="hidden" name="CTRANSFERIDOS"   value="${__formdata.CTRANSFERIDOS}"/>
        <input type="hidden" name="SPERSON"   value="${__formdata.SPERSON}"/>



        <c:import url="../include/titulo_nt.jsp">
                <c:param name="titulo"><axis:alt f="axisadm038" c="TITULO" lit="9001847"/></c:param>     <%-- Cerca Transferències --%>
                <c:param name="formulario"><axis:alt f="axisadm038" c="TITULO" lit="9001847"/></c:param> <%-- Cerca Transferències --%>
                <c:param name="form">axisadm038</c:param>
        </c:import>        

        <table class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td>
                  <table class="seccion" >
                      <tr>
                        <td>
                          <table class="area" align="center">
                             <tr>
                                <th style="width:25%;height:0px"></th>
                                <th style="width:25%;height:0px"></th>
                                <th style="width:25%;height:0px"></th>
                                <th style="width:25%;height:0px"></th>
                            </tr>
                            <tr>
                                <td class="titulo" colspan="2" style="border-bottom-color:#ffffff;">
                                     <b><axis:alt f="axisadm038" c="RADIO" lit="9901017" /></b>
                                     &nbsp;<input type="radio" name="radioCTRANSFERIDOS" id="a"  onclick="f_actCTRANSFERIDOS(this)"  value= "0" <c:if test="${__formdata.CTRANSFERIDOS == 0 || empty __formdata.CTRANSFERIDOS}">checked</c:if> />
                                     &nbsp;&nbsp;&nbsp;<b><axis:alt f="axisadm038" c="CONSLLIST" lit="9901018" /></b> <!-- Consulta /llistat -->
                                     &nbsp;<input type="radio" name="radioCTRANSFERIDOS" id="b"  onclick="f_actCTRANSFERIDOS(this)" value="1" <c:if test="${__formdata.CTRANSFERIDOS == 1}">checked</c:if>  />
                                     
                                </td>
                            </tr>
                            <tr>
                                <td class="titulocaja" colspan="2">
                                    <b><axis:alt f="axisadm038" c="CEMPRES_AUX" lit="101619" /></b>
                                </td>
                               
                            </tr>
                            <tr>
                             <td class="campocaja" colspan="2">
                                    <select name = "CEMPRES_AUX" id ="CEMPRES_AUX" title="<axis:alt f="axisadm038" c="CEMPRES_AUX" lit="101619" />" size="1" class="campowidthselect campo" onchange="f_recargar_empresa()" 
                                    <axis:atr f="axisadm038" c="CEMPRES" a="isInputText=false&obligatorio=true"/> >
                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisadm038" c="MIN_VALUE" lit="108341" /> - </option>
                                        <c:forEach items="${__formdata.listvalores.empresas}" var="item">
                                            <option value = "${item.CEMPRES}" <c:if test="${(!empty __formdata['CEMPRES'] && __formdata['CEMPRES']==item.CEMPRES)}">selected</c:if> >${item.TEMPRES}</option>
                                        </c:forEach>
                                    </select>
                                    <input type="hidden" class="campowidthinput campo" size="15" value="${__formdata.CEMPRES}" name="CEMPRES" id="CEMPRES" obligatorio="false" />
                           
                                </td>
                                
                            </tr>
                            <tr>
                                <td class="titulocaja">
                                    <b><axis:alt f="axisadm038" c="CAGRUP" lit="111471" /></b>
                                </td>
                                <td class="titulocaja">
                                    <b><axis:alt f="axisadm038" c="CRAMO" lit="100784" /></b>
                                </td>
                                 <td class="titulocaja" colspan="2">
                                    <b><axis:alt f="axisadm038" c="SPRODUC" lit="100829" /></b>
                                </td>
                                

                            </tr>
                            <tr>
                                 <td class="campocaja">
                                    <select name = "CAGRUP" onchange="f_recargar_agrupa()" id ="CAGRUP" size="1" class="campowidthselect campo">  //LCF onchange="f_recargar()" 
                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisadm038" c="MIN_VALUE" lit="108341" /> - </option>
                                        <c:forEach items="${__formdata.listvalores.agrupaciones}" var="item">
                                            <option value = "${item.CAGRPRO}" <c:if test="${__formdata['CAGRUP']==item.CAGRPRO}">selected</c:if> >${item.TAGRPRO}</option>
                                        </c:forEach>
                                    </select>
                                </td>
                                <td class="campocaja">
                                    <select name = "CRAMO" id ="CRAMO" size="1" onchange="f_recargar()" class="campowidthselect campo">
                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisadm038" c="MIN_VALUE" lit="108341" /> - </option>
                                        <c:forEach items="${__formdata.listvalores.ramos}" var="item">
                                            <option value = "${item.CRAMO}" <c:if test="${__formdata['CRAMO']==item.CRAMO}">selected</c:if> >${item.TRAMO}</option>
                                        </c:forEach>
                                    </select>
                                </td>
                                <td class="campocaja" colspan="2">
                                    <select name = "SPRODUC" id ="SPRODUC" size="1"  class="campowidthselect campo">
                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisadm038" c="MIN_VALUE" lit="108341" /> - </option>
                                        <c:forEach items="${__formdata.listvalores.productos}" var="item">
                                            <option value = "${item.SPRODUC}" <c:if test="${__formdata['SPRODUC']==item.SPRODUC}">selected</c:if> >${item.TTITULO}</option>
                                        </c:forEach>
                                    </select>
                                </td>
                                
                            </tr>
                            <!--    *************************  SECCION CHECK BOXES ************************** -->
                            <tr>
                                <td colspan="4">
                                    <table class="area" align="center">
                                    <tr>
                              
                                        <th style="width:20%;height:0px"></th>
                                        <th style="width:20%;height:0px"></th>
                                        <th style="width:20%;height:0px"></th>
                                        <th style="width:20%;height:0px"></th>
                                        <th style="width:20%;height:0px"></th>
                                
                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                            <b><axis:alt f="axisadm038" c="CHECK" lit="9900728" /></b>
                                            <input type="checkbox"  onclick="f_checkdescheck(this)"    name="CHECKTOTS" id="CHECKTOTS" value="1"  >
                                        </td>
                                    </tr>
                             
                                        <%int x = 0;%>
                                         <c:forEach items="${__formdata.listvalores.tiposbusqueda}" var="item" varStatus="status" >
                                            <c:if test="${item.CATRIBU != 0 && item.CATRIBU != 9}">  <!--  && item.CATRIBU != 9  -->
                                            <%--<% if (x%5 ==0 || x==5 || x== 10 || x==15){%>--%>
                                            <% if (x%5 ==0){%>
                                            <tr>
                                            <%}%>
                                                
                                                <td class="titulocaja">
                                                <input type="checkbox"   onclick="f_addtipobusqueda(this)"    name="CTIPOBUSQUEDA_${item.CATRIBU}" id="CTIPOBUSQUEDA_${item.CATRIBU}" value="${item.CATRIBU}"  >

                                               &nbsp;<b>${item.TATRIBU} </b>                                              
                                                    
                                               </td>
                                             <% if (x%5 ==4){%>
                                             </tr>
                                             <%}%>
                                                
                                             <%x++;%>
                                             </c:if>
                                             
                                          </c:forEach>
                                          
                                </table>
                                </td>
                            </tr>
                            <tr> 
                            <td colspan="4">&nbsp;</td>
                            </tr>
                            
                            <tr id="seccion_fechas">
                             <td colspan="4">
                             <table>
                             
                            <tr>
                                <td class="titulocaja">
                                    <b><axis:alt f="axisadm038" c="NREMESA1" lit="108527" /></b>
                                </td>
                                <axis:ocultar f="axisadm038" c="IIMPORT" dejarHueco="false">
                                    <td class="titulocaja">
                                        <b><axis:alt f="axisadm038" c="IIMPORT" lit="9000474" /></b>
                                    </td>
                                </axis:ocultar>
                            </tr>
                            <tr>
                                <td class="campocaja" >
                                    <input type="text" class="campowidthinput campo" size="15" onblur="f_actualitzarTransferidos(this)"  value="${__formdata.NREMESA1}" name="NREMESA1" id="NREMESA1"/>
                                </td>
                                <axis:ocultar f="axisadm038" c="IIMPORT" dejarHueco="false">
                                    <td class="campocaja" >
                                        <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.IIMPORTT}" name="IIMPORTT" id="IIMPORTT" obligatorio="false"/>
                                    </td>
                                </axis:ocultar>
                            </tr>
                            <tr>
                                                <td class="titulocaja">
                                                 <b><axis:alt f="axisadm038" c="FABONOINI" lit="9002294" /></b>
                                                 </td>
                                                 <td class="titulocaja">
                                                 <b><axis:alt f="axisadm038" c="FABONOFIN" lit="9900725" /></b>
                                                 </td>
                                                 <td class="titulocaja">
                                                 <b><axis:alt f="axisadm038" c="FTRANSINI" lit="9900727" /></b>
                                                 </td>
                                                 <td class="titulocaja">
                                                 <b><axis:alt f="axisadm038" c="FTRANSFIN" lit="9900726" /></b>
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td class="campocaja">
                                                     <input style="width:85%" type="text" class="campo campotexto" id="FABONOINI" name="FABONOINI" size="15"
                                                     value ="${__formdata.FABONOINI}" title="<axis:alt f="axisadm038" c="DATE" lit="100885"/>" <axis:atr f="axisadm038" c="FABONOINI" a="modificable=true&formato=fecha"/>/>
                                                     <a id="icon_FABONOINI" style="vertical-align:middle;" href="#"><img border="0" alt="<axis:alt f="axisadm038" c="DATE1" lit="108341" />" title="<axis:alt f="axisadm038" c="DATE1" lit="108341" />" src="images/calendar.gif"/></a>
                                                 </td>
                                                 <td class="campocaja">
                                                    <input style="width:85%" type="text" class="campo campotexto" id="FABONOFIN" name="FABONOFIN" size="15"
                                                    value ="${__formdata.FABONOFIN}" title="<axis:alt f="axisadm038" c="DATE" lit="100885"/>" <axis:atr f="axisadm038" c="FABONOFIN" a="modificable=true&formato=fecha"/>/>
                                                    <a id="icon_FABONOFIN" style="vertical-align:middle;" href="#"><img border="0" alt="<axis:alt f="axisadm038" c="DATE1" lit="108341" />" title="<axis:alt f="axisadm038" c="DATE1" lit="108341" />" src="images/calendar.gif"/></a>
                                                 </td>
                                                 <td class="campocaja">
                                                     <input style="width:85%" type="text" class="campo campotexto" id="FTRANSINI" name="FTRANSINI" size="15"
                                                     value ="${__formdata.FTRANSINI}" title="<axis:alt f="axisadm038" c="DATE" lit="100885"/>" <axis:atr f="axisadm038" c="FTRANSINI" a="modificable=true&formato=fecha"/>/>
                                                     <a id="icon_FTRANSINI" style="vertical-align:middle;" href="#"><img border="0" alt="<axis:alt f="axisadm038" c="DATE1" lit="108341" />" title="<axis:alt f="axisadm038" c="DATE1" lit="108341" />" src="images/calendar.gif"/></a>
                                                 </td>
                                                 <td class="campocaja">
                                                    <input style="width:85%" type="text" class="campo campotexto" id="FTRANSFIN" name="FTRANSFIN" size="15"
                                                    value ="${__formdata.FTRANSFIN}" title="<axis:alt f="axisadm038" c="DATE" lit="100885"/>" <axis:atr f="axisadm038" c="FTRANSFIN" a="modificable=true&formato=fecha"/>/>
                                                    <a id="icon_FTRANSFIN" style="vertical-align:middle;" href="#"><img border="0" alt="<axis:alt f="axisadm038" c="DATE1" lit="108341" />" title="<axis:alt f="axisadm038" c="DATE1" lit="108341" />" src="images/calendar.gif"/></a>
                                                 </td>
                                             </tr>
                                             
                                             
                                             </table>
                                             </td>
                                             </tr>
                            </div>
                           
                            </table>
                          </td>
                        </tr>
                    </table> <!-- FIN PRIMERA SECCION -->
                    
                    <axis:ocultar f="axisadm038" c="DSP_BUSCPERSON" dejarHueco="false"> 
                    <div class="separador">&nbsp;</div>
                    <table class="seccion">
                        <tr>
                            <th style="width:16.6%;height:0%;"/>
                            <th style="width:16.6%;height:0%;"/>
                            <th style="width:16.6%;height:0%;"/>
                            <th style="width:16.6%;height:0%;"/>
                            <th style="width:8.6%;height:0%;"/>
                            <th style="width:8.4%;height:0%;"/>
                        </tr>
                        <tr>
                            <axis:ocultar f="axisadm038" c="NNUMIDE" dejarHueco="false">
                            <td class="titulocaja">
                                <b><axis:alt f="axisadm038" c="NNUMIDE" lit="105330"/></b> <%-- Nº identificatiu --%>
                            </td>
                            </axis:ocultar>
                            <axis:ocultar f="axisadm038" c="TNOMBRE" dejarHueco="false">
                            <td class="titulocaja" colspan="3">
                                <b><axis:alt f="axisadm038" c="TNOMBRE" lit="1000560"/> <axis:alt f="axisadm038" c="TNOMBRE2" lit="105940"/></b> <%-- Cognoms Nom --%>
                            </td>
                            </axis:ocultar>
                            <axis:ocultar f="axisadm038" c="TIPOPER" dejarHueco="false">     
                            <td class="titulocaja">
                                <b><axis:alt f="axisadm038" c="PRENADOR" lit="101027"/></b> <%-- Prenedor --%>
                            </td>                            
                            <td class="titulocaja">
                                <input type="radio" id="tomador" name="tomador" onclick="javascript: if (tomador.checked) asegurado.checked =! tomador.checked"                                
                                <c:if test="${__formdata['tomador'] == 'on'}"> checked </c:if>/>                                    
                            </td>
                            </axis:ocultar>
                        </tr>
                        <tr>
                            <axis:ocultar f="axisadm038" c="NNUMIDE" dejarHueco="false">
                            <td class="campocaja">                             
                                <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.NNUMIDE}" name="NNUMIDE" id="NNUMIDE" 
                                <axis:atr f="axisadm038" c="NNUMIDE" a="obligatorio=false"/> onchange="f_cargar_DATOSPERSONA()" style="width:50%;"
                                title="<axis:alt f="axisadm038" c="NNUMIDE2" lit="1000559"/>" />
                            </td>
                            </axis:ocultar>
                            <axis:ocultar f="axisadm038" c="TNOMBRE" dejarHueco="false">
                            <td class="campocaja" colspan="3">                             
                                <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.TNOMBRE}" name="TNOMBRE" id="TNOMBRE" 
                                <axis:atr f="axisadm038" c="TNOMBRE" a="obligatorio=false"/>  onchange="f_cargar_DATOSPERSONA()"  style="width:80%;"/>
                            </td>
                            </axis:ocultar>
                            <axis:ocultar f="axisadm038" c="TIPOPER" dejarHueco="false">     
                            <td class="titulocaja">
                                <b><axis:alt f="axisadm038" c="CAMPO003" lit="101028"/></b> <%-- Assegurat --%>                                
                            </td>
                                       
                            <td class="titulocaja">
                                <input type="radio" id="asegurado" name="asegurado" onclick="javascript: if (asegurado.checked) tomador.checked =! asegurado.checked"
                                <c:if test="${__formdata['asegurado'] == 'on'}">checked</c:if>/>
                            </td>
                            </axis:ocultar>
                        </tr>
                        <tr>
                            <td align="center" colspan="5">
                                <div class="separador">&nbsp;</div>
                                <axis:ocultar f="axisadm038" c="BT_BORRAR_CAMPOS" dejarHueco="false">
                                <input type="button" id="BT_BORRAR_CAMPOS" class="boton" value="<axis:alt f="axisadm038" c="CAMPO004" lit="9000440"/>" onclick="f_borrar_campos()" />
                                </axis:ocultar>
                                &nbsp;&nbsp;&nbsp;&nbsp;
                                <axis:ocultar f="axisadm038" c="BT_BUSCAR_PER" dejarHueco="false">
                                <input type="button" id="BT_BUSCAR_PER" class="boton" value="<axis:alt f="axisadm038" c="CAMPO005" lit="1000065"/>" onclick="f_cargar_DATOSPERSONA()" />
                                </axis:ocultar>
                                <div class="separador">&nbsp;</div>
                            </td>
                        </tr>
                        <axis:ocultar f="axisadm038" c="DSP_DATPERSON" dejarHueco="false"> 
                        <tr>
                            <td colspan="6">
                                <c:set var="title1"><axis:alt f="axisadm038" c="CAMPO006" lit="800440"/></c:set> <%-- Nº --%>
                                <c:set var="title2"><axis:alt f="axisadm038" c="CAMPO007" lit="105940"/></c:set> <%-- Nom --%>
                                <div class="displayspace">
                                    <display:table name="${sessionScope.DATOSPERSONA}" id="DATOSPERSONA" export="false" class="dsptgtable" 
                                    pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0" 
                                    requestURI="modal_axisadm038.do?paginar=true">
                                        <%@ include file="../include/displaytag.jsp"%>
                                        <display:column headerClass="headwidth5 sortable" title="" media="html" autolink="false" >
                                            <div class="dspIcons">
                                                <input value="${DATOSPERSONA.SPERSON}" type="radio" id="radioSPERSON" name="radioSPERSON"/>
                                            </div>
                                        </display:column>
                                        <%--display:column title="${title1}" sortable="true" sortProperty="SPERSON" headerClass="headwidth5 sortable"  media="html" autolink="false" >                                    
                                            <div class="dspText">${DATOSPERSONA.SPERSON}</div>
                                        </display:column--%>
                                        <display:column title="${title1}" sortable="true" sortProperty="NNUMIDE" headerClass="headwidth5 sortable"  media="html" autolink="false" >                                    
                                            <div class="dspText">${DATOSPERSONA.NNUMIDE}</div>
                                        </display:column>
                                        <display:column title="${title2}" sortable="true" sortProperty="TNOMBRE" headerClass="sortable"  media="html" autolink="false" >                                    
                                            <div class="dspText"></div>
                                        </display:column>
                                    </display:table>
                                </div>
                            </td>
                        </tr> 
                      </axis:ocultar>                
                    </table>
                    </axis:ocultar> 
                            
                   <div class="separador">&nbsp;</div>         
                    <!-- INICIO PRIMERA SECCION -->        
                            <!--    ************************************************************************  -->
                    <axis:ocultar f="axisadm038" c="DSP_GENE_FIC" dejarHueco="false"> 
					<table class="seccion" >
                      <tr>
                        <td>
                          <table class="area" align="center">
                             <tr>
                                <th style="width:25%;height:0px"></th>
                                <th style="width:25%;height:0px"></th>
                                <th style="width:25%;height:0px"></th>
                                <th style="width:25%;height:0px"></th>
                            </tr>
                            <tr>
                            <td class="titulo" colspan="2" style="border-bottom-color:#FFFFFF;">
                                     <b><axis:alt f="axisadm038" c="CTRANS" lit="9901019" /></b> <!-- Generació fitxer -->
                                     &nbsp;<input type="radio" name="radioCTRANSFERIDOS" id="c"  onclick="f_actCTRANSFERIDOS(this)" value="2" <c:if test="${__formdata.CTRANSFERIDOS == 2}">checked</c:if>  />
                                </td>
                            </tr>
                            <tr>
                            
                                <td class="titulocaja" >
                                    <b><axis:alt f="axisadm038" c="NREMESA" lit="108527" /></b>
                                </td>
                                
                                <td class="titulocaja" >
                                   
                                </td>
                                <td class="titulocaja" colspan="2">
                                 </td>
                            </tr>
                            <tr>
                                
                               <td class="campocaja" >
                                     <input type="text" class="campowidthinput campo" size="15" onblur="f_actualitzarTransferidos(this)"  value="${__formdata.NREMESA}" name="NREMESA" id="NREMESA" obligatorio="false"/>
                                </td>
                                
                                
                                 
                            </tr>
                            
                    </table>
					</axis:ocultar>
                </td>
            </tr>
        </table>
        </tr>
    </td>
    </table>
        
        <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisadm038</c:param><c:param name="f">axisadm038</c:param>
		<c:param name="__botones">cancelar,buscar</c:param> 
        </c:import>

    </form>
<script type="text/javascript">
    Calendar.setup({
        inputField     :    "FABONOINI",     
        ifFormat       :    "%d/%m/%Y",      
        button         :    "icon_FABONOINI", 
        singleClick    :    true,
        firstDay       :    1
    });
    Calendar.setup({
        inputField     :    "FABONOFIN",     
        ifFormat       :    "%d/%m/%Y",      
        button         :    "icon_FABONOFIN", 
        singleClick    :    true,
        firstDay       :    1
    });
    Calendar.setup({
        inputField     :    "FTRANSINI",    
        ifFormat       :    "%d/%m/%Y",     
        button         :    "icon_FTRANSINI",  
        singleClick    :    true,
        firstDay       :    1
    });
    Calendar.setup({
        inputField     :    "FTRANSFIN",    
        ifFormat       :    "%d/%m/%Y",     
        button         :    "icon_FTRANSFIN",  
        singleClick    :    true,
        firstDay       :    1
    });

</script>
    <c:import url="../include/mensajes.jsp"/>

</body>
</html>