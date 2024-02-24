<%/* Revision:# xuf/L5xFE7APkw0xPdLPew== # */%>
<%/**
*  Fichero: axissin028.jsp
*  Incluye nuevo formato con títulos en la parte superior
*  @author <a href = "mailto:lcalvo@csi-ti.com">Luz Calvo</a>  
*  Fecha:06/08/2009
*/
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>    

<%@ page contentType="text/html;charset=iso-8859-15" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">

<html>
    <head>
        <title><axis:alt f="axissin028" c="NOMBREPANTALLA" lit="formulario.axisnombrepantalla"/></title>
        <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>          
        <%-- Especial per controlar els scroll amb iPad --%>
        <link type="text/css" href="styles/jquery.jscrollpane.css" rel="stylesheet" media="only screen and (min-device-width: 768px) and (max-device-width: 1024px)" />
        <style type="text/css" id="page-css" media="only screen and (min-device-width: 768px) and (max-device-width: 1024px)"> .wrapper{width: 100%;height: 50px;overflow: auto;} </style>
        <%-- FI Especial per controlar els scroll amb iPad --%>
        <c:import url="../include/carga_framework_js.jsp" />
        <script type="text/javascript">        
            
            /****************************************************************************************/
            /*********************************** NAVEGACION *****************************************/
            /****************************************************************************************/
            
            function f_onload() {
                //Si se ha entrado por segunda vez no mostrar el alert
                if (objUtiles.estaVacio(objDom.getValorPorId("NPOLIZA"))){
                    f_abrir_axisctr019();
                }
                 
                 <c:if test="${__formdata.ESTADO==4}">
                      //document.miForm.IMPCAPRIS.disabled="true";
                      //document.miForm.IMPCAPRIS.setAttribute('obligatorio','false'); 
                    
                 </c:if>
                    
                <c:if test="${__formdata.ESTADO==5}">
                     
                      //document.miForm.but_simular.disabled=false;
                      //document.miForm.IMPCAPRIS.disabled="false";
                </c:if>
                <axis:visible c="BT_IMPRIMIR" f="axissin028">
                
                    objDom.setVisibilidadPorId("but_imprimir", 'hidden');
                    <c:if test="${__formdata.BUSQUEDA==1}">
                        objDom.setVisibilidadPorId("but_imprimir", 'visible');  
                    </c:if>
                    
                </axis:visible>
                
                 f_cargar_propiedades_pantalla();
            }
            
            function cambiaCalculo(){ 
                var i,valor;
                for (i=0;i<document.miForm.radioTotalParcial.length;i++){ 
                   if (document.miForm.radioTotalParcial[i].checked) 
                      break; 
                } 
                
                if(i==0){
                    document.miForm.ESTADO.value=4;
                    //document.miForm.IMPCAPRIS.disabled=true;
                    //document.miForm.IMPCAPRIS.setAttribute('obligatorio','false');
                    document.miForm.IMPCAPRIS.value="";
                    document.miForm.IMPPRIMASCONS.value="";
                    document.miForm.IMPRETENCION.value="";
                    document.miForm.IMPRENDBRUTO.value="";
                    document.miForm.IMPRESCATE.value="";
                    document.miForm.IMPREDUCCION.value="";
                    document.miForm.IMPREGTRANS.value="";
                    document.miForm.IMPRCM.value="";
                    document.miForm.IMPPENALI.value="";
                    document.miForm.IMPRESNETO.value="";
                    document.miForm.PCTPCTRETEN.value="";
                    
                     objUtiles.ejecutarFormulario("axis_axissin028.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);
                }else if(i==1){
                    document.miForm.ESTADO.value=5;
                    document.miForm.IMPCAPRIS.value="";
                    document.miForm.IMPCAPRIS.disabled=false;     
                    document.miForm.IMPCAPRIS.setAttribute('obligatorio','true');
                    f_carga_dependencias();
                    revisarEstilos();
                   
                    document.miForm.IMPPRIMASCONS.value="";
                    document.miForm.IMPRETENCION.value="";
                    document.miForm.IMPRENDBRUTO.value="";
                    document.miForm.IMPRESCATE.value="";
                    document.miForm.IMPREDUCCION.value="";
                    document.miForm.IMPREGTRANS.value="";
                    document.miForm.IMPRCM.value="";
                    document.miForm.IMPPENALI.value="";
                    document.miForm.IMPRESNETO.value="";
                    objUtiles.ejecutarFormulario("axis_axissin028.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);
                }else{
                  alert("<axis:alt f="axissin028" c="IMPORTE" lit="100563"/>");
                }
            } 
                     
            function f_but_salir() {
                objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axisplantillajsp_general", "cancelar", document.miForm, "_self");
            }
            
            function f_but_1000531(){
                f_but_simular(0);
            }
            
            function f_but_simular(MODALIDAD) {   
                         var paramsFondos="";
                        if(document.getElementById("T_IAX_FONDOS") && document.getElementById("CTIPCALC")){       
                                var lstFondos = document.getElementById("T_IAX_FONDOS");
                                var lstinputs = lstFondos.getElementsByTagName("input");
                                
                                var ctipcalc = document.getElementById("CTIPCALC").value;
                                
                                for (var i =0; i < lstinputs.length; i++){
                                    
                                   if(lstinputs[i].type=='checkbox' && lstinputs[i].checked){     
                                     var ccesta = lstinputs[i].value;
                                   
                                        paramsFondos = paramsFondos+"&"+lstinputs[i].name+"="+ccesta;
                                     if(ctipcalc == 0){
                                      if(document.getElementById("percent"+ccesta).value){
                                         paramsFondos = paramsFondos+"&percent"+ccesta+"="+document.getElementById("percent"+ccesta).value;
                                      }else {
                                        alert("<axis:alt f="axissin028" c="PERCENTNULL" lit="111785"/>");
                                        return;
                                      }
                                     }else{
                                       if(document.getElementById("import"+ccesta).value){
                                        paramsFondos = paramsFondos+"&import"+ccesta+"="+document.getElementById("import"+ccesta).value; 
                                       }else {
                                        alert("<axis:alt f="axissin028" c="IMPORTNULL" lit="9901337"/>");
                                       return;
                                       }
                                     }
                                   }
                                }
                                paramsFondos = paramsFondos+"&CTIPCALC="+ctipcalc;
                        }
                    var at=document.getElementById('mensajes_table'); 
             if (at != null){
                at.style.visibility='hidden';
             }
             toggleMensajes(); 
                    if(objValidador.validaEntrada()){                        
                        var i,valor;
                        for (i=0;i<document.miForm.radioTotalParcial.length;i++){ 
                             if (document.miForm.radioTotalParcial[i].checked) 
                                break; 
                        }
                       
                        var importe = objDom.getValorPorId("IMPCAPRIS");
                     
                    <%--    if(importe!=null && importe!=""){ --%>
                    
                            if(i==0){
                                valor=4;
                                objAjax.invokeAsyncCGI("axis_axissin028.do", callbackSimular, "operation=simular" + "&SSEGURO="+objDom.getValorPorId("SSEGURO")+ "&IMPCAPRIS="+objDom.getValorPorId("IMPCAPRIS")
                                 + "&CCAUSIN="+ valor + "&NRIESGO="+objDom.getValorPorId("NRIESGO")+ "&FECHA="+ objDom.getValorPorId("FECHA")+ "&IMPPENALI="+ objDom.getValorPorId("IMPPENALI")
                                 + "&IMPRCM="+ objDom.getValorPorId("IMPRCM")+ "&PCTPCTRETEN="+ objDom.getValorPorId("PCTPCTRETEN")+ "&MODALIDAD="+ MODALIDAD, this,  objJsMessages.jslit_cargando, false);
                         
                          
                            }else{                            
                                valor=5;
                                
                                var PENALI = null;
                                if (document.miForm.IMPPENALI.readOnly == "false"){
                                    PENALI = objDom.getValorPorId("IMPPENALI");
                                }
                                
                                objAjax.invokeAsyncCGI("axis_axissin028.do", callbackSimular, "operation=simular" + "&SSEGURO="+objDom.getValorPorId("SSEGURO")+ "&IMPCAPRIS="+objDom.getValorPorId("IMPCAPRIS")
                                + "&CCAUSIN="+ valor + "&FECHA="+ objDom.getValorPorId("FECHA") + "&NRIESGO="+objDom.getValorPorId("NRIESGO") + "&IMPPENALI="+ PENALI + "&MODALIDAD="+ MODALIDAD+paramsFondos, this,  objJsMessages.jslit_cargando, false);
                     
                                }
                    }
           }
            
            function f_but_aceptar(){
               
              if(objValidador.validaEntrada()){
                                var lstFondos = document.getElementById("T_IAX_FONDOS");
                            if (lstFondos != null){
                                var lstinputs = lstFondos.getElementsByTagName("input");
                                var paramsFondos="";
                                var ctipcalc = document.getElementById("CTIPCALC").value;
                                
                                for (var i =0; i < lstinputs.length; i++){
                                    
                                   if(lstinputs[i].type=='checkbox' && lstinputs[i].checked){     
                                     var ccesta = lstinputs[i].value;
                                        paramsFondos = paramsFondos+"&"+lstinputs[i].name+"="+ccesta;
                                     if(ctipcalc == 0){
                                         paramsFondos = paramsFondos+"&percent"+ccesta+"="+Number(document.getElementById("percent"+ccesta).value);
                                     }else{
                                        paramsFondos = paramsFondos+"&import"+ccesta+"="+Number(document.getElementById("import"+ccesta).value); 
                                     }
                                   }
                                }
                              
                                paramsFondos = paramsFondos+"&CTIPCALC="+ctipcalc;
                             }
                 var importe =objDom.getValorPorId("IMPCAPRIS");
                 
                 var neto = objDom.getValorPorId("IMPRESNETO");
                  var i,valor;
                        for (i=0;i<document.miForm.radioTotalParcial.length;i++){ 
                             if (document.miForm.radioTotalParcial[i].checked) 
                                break; 
                        }
             
                        if(importe!=null && importe!=""){ 
                    
                            if(i==0){
                                valor=4;
                            }else{
                                valor=5;
                            }

                               
                                if(neto!=null && neto!=""){ 
                                
                               objAjax.invokeAsyncCGI("axis_axissin028.do", callbackAceptarSim, "operation=aceptar" + "&SSEGURO="+objDom.getValorPorId("SSEGURO")+ "&IMPCAPRIS="+objDom.getValorPorId("IMPCAPRIS")
                                + "&CCAUSIN="+ valor + "&FECHA="+ objDom.getValorPorId("FECHA") + "&NRIESGO="+objDom.getValorPorId("NRIESGO")+ "&IMPPENALI="+objDom.getValorPorId("IMPPENALI")
                                + "&IMPRCM="+ objDom.getValorPorId("IMPRCM")+ "&PCTPCTRETEN="+ objDom.getValorPorId("PCTPCTRETEN")+ "&CMOTRESC="+ objDom.getValorPorId("CMOTRESC")+paramsFondos, this,  objJsMessages.jslit_cargando, false);
                                }else{
                                alert("<axis:alt f="axissin028" c="TSIMULACIO" lit="9000544"/>");
                                }
                        
                        }else{
                            alert("<axis:alt f="axissin028" c="IMPORTE" lit="100563"/> "+objJsMessages.jslit_campo_obligatorio);
                        }
                        }
            }
            
            /****************************************************************************************/
            /*********************************** MODALES    *****************************************/
            /****************************************************************************************/
            function f_abrir_axisctr019() {
               objUtiles.abrirModal("axisctr019","src","modal_axisctr019.do?operation=form&tipo=RESCA_SIN");               
            }
            
            function f_cerrar_axisctr019(){
                objUtiles.cerrarModal("axisctr019");
            }
            
            function f_aceptar_axisctr019(SSEGURO){
                objDom.setValorPorId("SSEGURO", SSEGURO);
                f_cerrar_axisctr019();
                objDom.setValorPorId("BORRAR", "true");

                document.miForm.IMPCAPRIS.value="";
                document.miForm.IMPPENALI.value="";
                document.miForm.IMPRESCATE.value="";
                document.miForm.IMPPRIMASCONS.value="";
                document.miForm.IMPRENDBRUTO.value="";
                document.miForm.IMPREDUCCION.value="";
                document.miForm.IMPRETENCION.value="";
                document.miForm.PCTPCTRETEN.value="";
                document.miForm.IMPREGTRANS.value="";
                document.miForm.IMPRCM.value="";
                document.miForm.IMPRESNETO.value="";
                            
                objUtiles.ejecutarFormulario("axis_axissin028.do", "form", document.miForm, "ftrabajo", objJsMessages.jslit_cargando);
                
            }
            
            
            
            function f_but_cancelar() {
                objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axisplantillajsp_general", "cancelar", document.miForm, "_self");
            }    
            
            /****************************************************************************************/
            /******************************* CALLBACKS AJAX *****************************************/
            /****************************************************************************************/
            
           
           
            function callbackSimular(ajaxResponseText) {
                //alert(ajaxResponseText);  
                // Recibe la respuesta Ajax de emitir propuesta.
                // Y escribe los mensajes de info/error correspondientes.
                var doc = objAjax.domParse(ajaxResponseText);
                // Hacemos la llamada para pintar los errores/infos
                if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
                   
                     //objDom.setVisibilidadPorId("but_emitir", "hidden");
                    //recogemos mensaje con el número de poliza y lo enviamos a
                    //impresion Axisimprimir
                                   
                            //if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("TINFO")[0])){
                         
                              //  var mensaje = objDom.getValorNodoDelComponente(doc.getElementsByTagName("TINFO"), 0, 0);
                                //alert(mensaje);
                            //}else{
                            
                            
                            //if(objUtiles.existeObjetoXml(doc.getElementsByTagName("element")[0])){
                            //var elementos = doc.getElementsByTagName("element");
                            
                            var PCTPCTRETEN = objUtiles.existeObjetoXml(doc.getElementsByTagName("PCTPCTRETEN")[0]) ?
                            objDom.getValorNodoDelComponente(doc.getElementsByTagName("PCTPCTRETEN"), 0, 0) : "";
                            //var importe_PCTPCTRETEN = validarNumeros(PCTPCTRETEN);
                            var importe_PCTPCTRETEN = objNumero.formateaNumeroCero(PCTPCTRETEN, true);
                            objDom.setValorPorId("PCTPCTRETEN", importe_PCTPCTRETEN); 
                          
                            var IMPRETEN = objUtiles.existeObjetoXml(doc.getElementsByTagName("IMPRETENCION")[0]) ?
                            objDom.getValorNodoDelComponente(doc.getElementsByTagName("IMPRETENCION"), 0, 0) : "";
                            //var importe_IMPRETEN = validarNumeros(IMPRETEN); 
                            var importe_IMPRETEN = objNumero.formateaNumeroCero(IMPRETEN, true);
                            objDom.setValorPorId("IMPRETENCION", importe_IMPRETEN); 
                            
                            var IMPRESCATE = objUtiles.existeObjetoXml(doc.getElementsByTagName("IMPRESCATE")[0]) ?
                            objDom.getValorNodoDelComponente(doc.getElementsByTagName("IMPRESCATE"), 0, 0) : "";
                            //var importe_IMPRESCATE = validarNumeros(IMPRESCATE); 
                            var importe_IMPRESCATE = objNumero.formateaNumeroCero(IMPRESCATE, true);
                            objDom.setValorPorId("IMPRESCATE",importe_IMPRESCATE);
                            
                            var IMPPRIMASCONS = objUtiles.existeObjetoXml(doc.getElementsByTagName("IMPPRIMASCONS")[0]) ?
                            objDom.getValorNodoDelComponente(doc.getElementsByTagName("IMPPRIMASCONS"), 0, 0) : "";
                            //var importe_IMPPRIMASCONS = validarNumeros(IMPPRIMASCONS); 
                            var importe_IMPPRIMASCONS = objNumero.formateaNumeroCero(IMPPRIMASCONS, true);
                            objDom.setValorPorId("IMPPRIMASCONS", importe_IMPPRIMASCONS);
                           
                            
                            var IMPRENDBRUTO = objUtiles.existeObjetoXml(doc.getElementsByTagName("IMPRENDBRUTO")[0]) ?
                            objDom.getValorNodoDelComponente(doc.getElementsByTagName("IMPRENDBRUTO"), 0, 0) : "";
                            //var importe_IMPRENDBRUTO = validarNumeros(IMPRENDBRUTO);  
                            var importe_IMPRENDBRUTO = objNumero.formateaNumeroCero(IMPRENDBRUTO, true);
                            objDom.setValorPorId("IMPRENDBRUTO",importe_IMPRENDBRUTO);
                           
                            var IMPREDUCCION = objUtiles.existeObjetoXml(doc.getElementsByTagName("IMPREDUCCION")[0]) ?
                            objDom.getValorNodoDelComponente(doc.getElementsByTagName("IMPREDUCCION"), 0, 0) : "";
                            //var importe_IMPREDUCCION = validarNumeros(IMPREDUCCION);
                            var importe_IMPREDUCCION = objNumero.formateaNumeroCero(IMPREDUCCION, true);
                            objDom.setValorPorId("IMPREDUCCION",importe_IMPREDUCCION);
                            
                            var IMPREGTRANS = objUtiles.existeObjetoXml(doc.getElementsByTagName("IMPREGTRANS")[0]) ?
                            objDom.getValorNodoDelComponente(doc.getElementsByTagName("IMPREGTRANS"), 0, 0) : "";
                            //var importe_IMPREGTRANS = validarNumeros(IMPREGTRANS); 
                            var importe_IMPREGTRANS = objNumero.formateaNumeroCero(IMPREGTRANS, true);
                            objDom.setValorPorId("IMPREGTRANS", importe_IMPREGTRANS);
                          
                            
                            var IMPPROVISION = objUtiles.existeObjetoXml(doc.getElementsByTagName("IMPPROVISION")[0]) ?
                            objDom.getValorNodoDelComponente(doc.getElementsByTagName("IMPPROVISION"), 0, 0) : "";
                            //var importe_IMPPROVISION = validarNumeros(IMPPROVISION);  
                            var importe_IMPPROVISION = objNumero.formateaNumeroCero(IMPPROVISION, true);
                            objDom.setValorPorId("IMPPROVISION", importe_IMPPROVISION); 
                      
                            
                            var IMPCAPFALL = objUtiles.existeObjetoXml(doc.getElementsByTagName("IMPCAPFALL")[0]) ?
                            objDom.getValorNodoDelComponente(doc.getElementsByTagName("IMPCAPFALL"), 0, 0) : "";
                            //var importe_IMPCAPFALL = validarNumeros(IMPCAPFALL); 
                            var importe_IMPCAPFALL = objNumero.formateaNumeroCero(IMPCAPFALL, true);
                            objDom.setValorPorId("IMPCAPFALL", importe_IMPCAPFALL);
                         
                            
                            var IMPCAPGARAN = objUtiles.existeObjetoXml(doc.getElementsByTagName("IMPCAPGARAN")[0]) ?
                            objDom.getValorNodoDelComponente(doc.getElementsByTagName("IMPCAPGARAN"), 0, 0) : "";
                            //var importe_IMPCAPGARAN = validarNumeros(IMPCAPGARAN);
                            var importe_IMPCAPGARAN = objNumero.formateaNumeroCero(IMPCAPGARAN, true);
                            objDom.setValorPorId("IMPCAPGARAN", importe_IMPCAPGARAN);
                          
                            
                            var IMPPENALI = objUtiles.existeObjetoXml(doc.getElementsByTagName("IMPPENALI")[0]) ?
                            objDom.getValorNodoDelComponente(doc.getElementsByTagName("IMPPENALI"), 0, 0) : "";                            
                            //var importe_IMPPENALI = validarNumeros(IMPPENALI); 
                            var importe_IMPPENALI = objNumero.formateaNumeroCero(IMPPENALI, true);
                            objDom.setValorPorId("IMPPENALI",importe_IMPPENALI);
                         
                            
                            var IMPRESNETO = objUtiles.existeObjetoXml(doc.getElementsByTagName("IMPRESNETO")[0]) ?
                            objDom.getValorNodoDelComponente(doc.getElementsByTagName("IMPRESNETO"), 0, 0) : "";
                            //var importe_IMPRESNETO = validarNumeros(IMPRESNETO);
                            var importe_IMPRESNETO = objNumero.formateaNumeroCero(IMPRESNETO, true);
                            objDom.setValorPorId("IMPRESNETO",importe_IMPRESNETO);
                     
                            
                            var IMPRCM = objUtiles.existeObjetoXml(doc.getElementsByTagName("IMPRCM")[0]) ?
                            objDom.getValorNodoDelComponente(doc.getElementsByTagName("IMPRCM"), 0, 0) : "";
                            //var importe_IMPRCM = validarNumeros(IMPRCM); 
                            var importe_IMPRCM = objNumero.formateaNumeroCero(IMPRCM, true);
                            objDom.setValorPorId("IMPRCM", importe_IMPRCM);
                            
                            var IMPCAPRIS = objUtiles.existeObjetoXml(doc.getElementsByTagName("IMPCAPRIS")[0]) ?
                            objDom.getValorNodoDelComponente(doc.getElementsByTagName("IMPCAPRIS"), 0, 0) : "";
                            //var importe_IMPCAPRIS = validarNumeros(IMPCAPRIS);
                            var importe_IMPCAPRIS = objNumero.formateaNumeroCero(IMPCAPRIS, true);
                            objDom.setValorPorId("IMPCAPRIS", importe_IMPCAPRIS);
                        
                            //alert("final");
                             objDom.setDisabledPorId("but_aceptar",false);
                       
                             <axis:visible c="BT_IMPRIMIR" f="axissin028">
                                objDom.setVisibilidadPorId("but_imprimir", 'visible');
                             </axis:visible>     
                            
                            //}
                            
                      // }     
                            
                } else{
                
                    
                     objDom.setDisabledPorId("but_aceptar",true);
                     
                     <axis:visible c="BT_IMPRIMIR" f="axissin028">
                        objDom.setVisibilidadPorId("but_imprimir", 'hidden');
                     </axis:visible> 
                     if(document.miForm.IMPCAPRIS){
                     if(!objUtiles.estaVacio(IMPCAPRIS)){
                     var IMPCAPRIS = document.miForm.IMPCAPRIS.value;
                         objDom.setValorPorId("IMPCAPRIS",  f_formatear(IMPCAPRIS));                         
                         //objDom.setValorPorId("IMPCAPRIS", objValidador.valorFormateadoCampoNumerico(IMPCAPRIS,true,true));
                         }
                     }
                     
                }
                
                f_carga_dependencias();
                
                // recarrega scroll pane
                $.reinitialiseScroll();
                
            }
           
           

            function callbackTarifar(ajaxResponseText) {
                //alert(ajaxResponseText);
                // Recibe la respuesta Ajax de emitir propuesta.
                // Y escribe los mensajes de info/error correspondientes.
                var doc = objAjax.domParse(ajaxResponseText);
                // Hacemos la llamada para pintar los errores/infos
                if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
                //alert("EN ACEPTAR");
                    // Si todo ha ido bien, desactivar botones.
                                if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("RESULTADO")[0])){
                                var valor = objDom.getValorNodoDelComponente(doc.getElementsByTagName("RESULTADO"), 0, 0);
                                var error = objDom.getValorNodoDelComponente(doc.getElementsByTagName("MENSAJE"), 0, 0);
                                }
                                
                                if(valor==0){
                                objDom.setDisabledPorId("but_aceptar",false);
                                <axis:visible f="axissin028" c="BT_SIMULAR" >
                                objDom.setDisabledPorId("but_1000531",false);
                                </axis:visible>
                                alert("<axis:alt f="axissin028" c="PROCESCORRECTE" lit="PROCESCORRECTE"/>");
                                }else{
                                }
                               
         
                 }
            
                // recarrega scroll pane
                $.reinitialiseScroll();

             }
            
            
            ////////////////////////////////////////////////////////////
            
            function callbackAceptarSim(ajaxResponseText) {
             try{
            
                var doc = objAjax.domParse(ajaxResponseText);
               
                if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
                
                          
                            //alert(objUtiles.existeObjetoXml(doc.getElementsByTagName("element")[0]));
                            if(objUtiles.existeObjetoXml(doc.getElementsByTagName("element")[0])){
                              
                                var elementos = doc.getElementsByTagName("element");
                               
                                var CODIGO = objUtiles.existeObjetoXml(elementos[0].getElementsByTagName("CODIGO")[0]) ?
                                objDom.getValorNodoDelComponente(elementos[0].getElementsByTagName("CODIGO"), 0, 0) : "";
                               
                                if(CODIGO==0){
                                   
                                   objDom.setDisabledPorId("but_aceptar",true);
                                   <axis:visible f="axissin028" c="BT_SIMULAR" >
                                   objDom.setDisabledPorId("but_1000531",true);
                                   </axis:visible>
                                }
                                                     
                            
                            }
                      objUtiles.abrirModal("axisimprimir", "src", "modal_axisimprimir.do?dt=<%=new java.util.Date().getTime()%>&operation=impresion_doc_tipo&SEGURO="+document.miForm.SSEGURO.value+"&TIPO=RESCATE");    
                    } 
                    }
                    catch(e){
                        alert("error:"+e);
                    }
                    
                // recarrega scroll pane
                $.reinitialiseScroll();
                
            }
             
             
            
             //////////////////////////////////////////////////////////////
             function callbackAceptar(ajaxResponseText) {
              
             //alert(ajaxResponseText);
             var doc = objAjax.domParse(ajaxResponseText);
              
                if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
              
                                   
                            if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("TINFO")[0])){
                                //alert("En if");
                                var mensaje = objDom.getValorNodoDelComponente(doc.getElementsByTagName("TINFO"), 0, 0);
                                //alert(mensaje);
                            }else{
                                //alert("En else");
                                if(objUtiles.existeObjetoXml(doc.getElementsByTagName("CODIGO")[0])){
                                   
                                   
                          
                                    var valor = objDom.getValorNodoDelComponente(doc.getElementsByTagName("CODIGO"), 0, 0);
                                    if(valor==0){
                                    
                                        document.miForm.but_simular.disabled=true;
                                        document.miForm.but_aceptar.disabled=true;
                                    }
                                }
                            }
                            
                            
                }
                
                // recarrega scroll pane
                $.reinitialiseScroll();
             
             }
             
             function f_cerrar_axisimprimir() {
                objUtiles.cerrarModal("axisimprimir");
          }
             
            /*******************************************
                  Formateo Numeros
             ********************************************/
             function validarNumeros(IMPORTE){                          
                   if (!objUtiles.estaVacio(IMPORTE)){                   
                     IMPORT = objValidador.valorFormateadoCampoNumerico(IMPORTE, true, true);                     
                         if(objNumero.validaNumero(IMPORT, true)) {                     
                              return this.formateaNumeroCero(IMPORT, true);                     
                         }else{ return '';}
                    }else return IMPORTE;
             }
              function formateaNumeroCero(entrada, isDecimal){
                // es crida al reformateixador ###.###,00
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
             
             function validarEnvioSinmulacion(thiss){
                 thiss.value = validarNumeros(thiss.value);
                 if (thiss.value != ''){
                    f_but_simular(0);                 
                 }
             
             }
             
            function changeCtipcalc(){
                objUtiles.ejecutarFormulario("axis_axissin028.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);
            }
            
            function calcularImporteFondos(valor){
                               
                                if((document.getElementById("percent"+valor) && !document.getElementById("percent"+valor).value )
                                  ||(document.getElementById("import"+valor) && !document.getElementById("import"+valor).value )){
                                    return;
                                }           
                                var lstFondos = document.getElementById("T_IAX_FONDOS");
                                var lstinputs = lstFondos.getElementsByTagName("input");
                                var ctipcalc = document.getElementById("CTIPCALC").value;     
                                var importeActual = 0;
             if(ctipcalc == 0){
                                
                                for (var i =0; i < lstinputs.length; i++){
                                    
                                   if(lstinputs[i].type=='checkbox'){
                                     if(lstinputs[i].checked){     
                                         var ccesta = lstinputs[i].value;
                                             porcent = Number(document.getElementById("percent"+ccesta).value);
                                             importe = Number(document.getElementById("importeFnd"+ccesta).innerHTML);
                                             importeActual = Number(importeActual) + ((Number(importe)*Number(porcent))/100);
                                     } else{
                                       var ccesta = lstinputs[i].value;
                                       document.getElementById("percent"+ccesta).value = '';
                                    }
                                   }
               
                                }
                
                document.getElementById('IMPCAPRIS').value = objNumero.formateaNumeroMoneda(importeActual);
             
            }else if (ctipcalc == 1){
                   for (var i =0; i < lstinputs.length; i++){
                                    if(lstinputs[i].type=='checkbox' ){
                                       if( lstinputs[i].checked){     
                                             var ccesta = lstinputs[i].value;
                                             unidades = Number(document.getElementById("import"+ccesta).value);
                                             importeAct = Number(document.getElementById("importeFnd"+ccesta).innerHTML);
                                             unidadesAct = Number(document.getElementById("unidadesFnd"+ccesta).innerHTML);
                                             precio  = importeAct/unidadesAct;
                                             importeActual += unidades*precio;
                                        }else{
                                            var ccesta = lstinputs[i].value;
                                           document.getElementById("import"+ccesta).value ='';
                                        }
                                    }
                                    }
                    
                    document.getElementById('IMPCAPRIS').value = objNumero.formateaNumeroMoneda(importeActual);
            }else if (ctipcalc == 2){
                    for (var i =0; i < lstinputs.length; i++){
                                        
                                       if(lstinputs[i].type=='checkbox'){
                                         if(lstinputs[i].checked){     
                                             var ccesta = lstinputs[i].value;
                                             importe = Number(document.getElementById("import"+ccesta).value);
                                             importeAct = Number(document.getElementById("importeFnd"+ccesta).innerHTML);
                                             importeActual +=((Number(importe)));
                                       }else{
                                           var ccesta = lstinputs[i].value;
                                           document.getElementById("import"+ccesta).value = '';
                                       }
                                       }
                   
                                    }
                    
                    document.getElementById('IMPCAPRIS').value = objNumero.formateaNumeroMoneda(importeActual);
                 }
            else if (ctipcalc == 3){
                for (var i =0; i < lstinputs.length; i++){
                                        
                                       if(lstinputs[i].type=='checkbox'){
                                         if(lstinputs[i].checked){     
                                             var ccesta = lstinputs[i].value;
                                             importe = Number(document.getElementById("import"+ccesta).value);
                                             importeAct = Number(document.getElementById("importeFnd"+ccesta).innerHTML);
                                             importeActual +=((Number(importe)));
                                       }else{
                                           var ccesta = lstinputs[i].value;
                                           document.getElementById("import"+ccesta).value = '';
                                       }
                                       }
                   
                                    }
                    
                    document.getElementById('IMPCAPRIS').value = objNumero.formateaNumeroMoneda(importeActual);
            }
            
            }
        function f_but_imprimir(){
            if (objValidador.validaEntrada())
                objUtiles.abrirModal("axisimprimir", "src", "modal_axisimprimir.do?dt=<%=new java.util.Date().getTime()%>&operation=impresion_doc_tipo&SEGURO=" + document.miForm.SSEGURO.value + "&TIPO=PROYECCION");
        }
        </script>
    </head>
    <body  onload="f_onload()">
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
        
        <c:import url="../include/precargador_ajax.jsp"><c:param name="imagen" value="images/ajax-loader.gif"></c:param></c:import>
        <form name="miForm" action="" method="POST">
            <input type="hidden" name="operation" value=""/> 
            <input type="hidden" name="SSEGURO" id="SSEGURO" value="${__formdata.SSEGURO}" />
            <input type="hidden" name="BORRAR" id="BORRAR" value="" />
            <input type="hidden" name="ESTADO" id="ESTADO" value="${__formdata.ESTADO}" />

            <!--input type="hidden" name="CCAUSIN" id="CCAUSIN" value="" /-->
            
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="titulo"><axis:alt f="axissin028" c="TTITAXISSIN028" lit="152061" /></c:param>
                <c:param name="formulario"><axis:alt f="axissin028" c="FTITAXISSIN028" lit="152061" /></c:param>
                <c:param name="form">axissin028</c:param>
            </c:import>
            <!-- pantallas modales -->
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt f="axissin028" c="TTITAXISCTR019" lit="1000188" /></c:param>
                <c:param name="nid" value="axisctr019"></c:param>
            </c:import>
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt f="axissin028" c="TTITAXISIMPRI" lit="1000205" /></c:param>
                <c:param name="nid" value="axisimprimir"></c:param>
            </c:import>
            <!-- Área de campos  -->
            <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <div class="separador">&nbsp;</div>
                        <div class="titulo">
                        <img src="images/flecha.gif"/><axis:alt f="axissin028" c="DATOSPOLIZA" lit="104925"/>
                         </div>
                        <!-- Sección 1 -->
                        <table class="seccion">
                            <tr>
                                <td >
                                    <!-- Área 1 -->
                                    <table class="area" align="center">
                                        <tr>
                                            <th style="width:25%;height:0px"></th>
                                            <th style="width:25%;height:0px"></th>
                                            <th style="width:25%;height:0px"></th>
                                            <th style="width:25%;height:0px"></th>
                                        </tr>
                                        <tr>
                                            <axis:ocultar f="axissin028" c="NPOLIZA">                                    
                                               <td class="titulocaja" ><b><axis:alt f="axissin028" c="NPOLIZA" lit="100836"/></b></td>
                                            </axis:ocultar>                                               
                                               
                                            <axis:ocultar f="axissin028" c="NCERTIF">                                                
                                               <td class="titulocaja" ><b><axis:alt f="axissin028" c="NCERTIF" lit="101168"/></b></td>
                                            </axis:ocultar>
                                            
                                            <axis:ocultar f="axissin028" c="NRIESGO">                                             
                                               <td class="titulocaja"><b><axis:alt f="axissin028" c="NRIESGO" lit="100649"/></b></td>
                                            </axis:ocultar>                                            
                                            
                                            <axis:ocultar f="axissin028" c="FEFECTO">                                             
                                               <td class="titulocaja"><b><axis:alt f="axissin028" c="FEFECTO" lit="100883"/></b></td>
                                            </axis:ocultar>                                            
                                        </tr>
                                        <tr>
                                            <axis:ocultar f="axissin028" c="NPOLIZA"> 
                                                <td class="campocaja">
                                                    <input type="text" class="campowidthinput campo campotexto" id="NPOLIZA" name="NPOLIZA" size="15"  style="width:90%"
                                                    value="${__formdata.NPOLIZA}" <axis:atr f="axissin028" c="NPOLIZA" a="modificable=false"/> />
                                                    <img border="0" src="images/find.gif" onclick="f_abrir_axisctr019()" style="cursor:pointer"/>
                                                </td>
                                            </axis:ocultar>
                                            <axis:ocultar f="axissin028" c="NCERTIF"> 
                                                <td class="campocaja">
                                                    <input type="text" class="campowidthinput campo campotexto" id="NCERTIF" name="NCERTIF" size="15"  style="width:40%"
                                                    value="${__formdata.NCERTIF}" <axis:atr f="axissin028" c="NCERTIF" a="modificable=false"/> />
                                                   
                                                </td>
                                            </axis:ocultar>
                                            <axis:ocultar f="axissin028" c="NRIESGO"> 
                                                <td class="campocaja">
                                                    <input type="text" class="campowidthinput campo campotexto" id="NRIESGO" name="NRIESGO" size="15"  style="width:40%"
                                                    value="${__formdata.NRIESGO}" <axis:atr f="axissin028" c="NRIESGO" a="modificable=false"/> />
                                                   
                                                </td>
                                            </axis:ocultar>
                                            <axis:ocultar f="axissin028" c="FEFECTO"> 
                                                <td class="campocaja">
                                                    <input type="text" class="campowidthinput campo campotexto" id="FEFECTO" name="FEFECTO" size="15"  style="width:40%"
                                                    value="<fmt:formatDate pattern='dd/MM/yyyy' value='${__formdata.FEFECTO}'/>" <axis:atr f="axissin028" c="FEFECTO" a="modificable=false"/> />
                                                   
                                                </td>
                                            </axis:ocultar>
                                        </tr>
                                        
                                        <tr>
                                                <!--TABLE     ASEGURADOS -->
                                                <tr>
                                                    <td colspan="4">

                                                                <c:set var="title0"><axis:alt f="axissin028" c="ASSEGURADOS" lit="100645" /></c:set>
                                                                <div class="separador">&nbsp;</div>
                                                                <div class="displayspace">
                                                                <display:table name="${__formdata.axissin_asegurados}" id="lista" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                                                                requestURI="axis_plantilla.do?operation=general&paginar=true">
                                                                <%@ include file="../include/displaytag.jsp"%>
                                                                    
                                                                    <display:column title="${title0}" sortable="true" sortProperty="NOMBRE" headerClass="sortable" media="html" autolink="false" >
                                                                    <div class="dspText">${lista.OB_IAX_ASEGURADOS.TAPELLI1}&nbsp;${lista.OB_IAX_ASEGURADOS.TAPELLI2}&nbsp;,&nbsp;${lista.OB_IAX_ASEGURADOS.TNOMBRE}</div>
                                                                    </display:column>
                                                                 
                                                                    </display:table>
                                                                    </div>
                                                                  
                                                                    <div class="separador">&nbsp;</div>
                                                                  
                                                    </td><td></td><td></td><td></td><!-- en tres columnas-->
                                                    
                                                </tr>
                                                <!--FIN TABLE ASGURADOS-->
                                            
                                        </tr>
                                        
                                        <tr>
                                                <!--TABLE     TOMADORES-->
                                                <tr>
                                                    <td colspan="4">

                                                                <c:set var="title0"><axis:alt f="axissin028" c="TOMADORES" lit="1000181" /></c:set>
                                                               
                                                                <div class="separador">&nbsp;</div>
                                                                <div class="displayspace">
                                                               
                                                                <display:table name="${__formdata.axissin_tomadores}" id="lista" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                                                                requestURI="axis_plantilla.do?operation=general&paginar=true">
                                                                <%@ include file="../include/displaytag.jsp"%>
                                                                    
                                                                    <display:column title="${title0}" sortable="true" sortProperty="NOMBRE" headerClass="sortable" media="html" autolink="false" >
                                                                    <div class="dspText">${lista.OB_IAX_TOMADORES.TAPELLI1}&nbsp;${lista.OB_IAX_TOMADORES.TAPELLI2}&nbsp;,&nbsp;${lista.OB_IAX_TOMADORES.TNOMBRE}</div>
                                                                    </display:column>
                                                                    
                                                                    </display:table>
                                                                    </div>
                                                                    
                                                                    <div class="separador">&nbsp;</div>
                                                                  
                                                    </td><td></td><td></td><td></td><!-- en tres columnas-->
                                                    
                                                </tr>
                                                <!--FIN TABLE TOMADORES -->
                                            
                                        </tr>
                                    </table>

                                </td>
                            </tr>
                            <tr>
                            
                            </tr>
                        </table>
                         <axis:visible f="axissin028" c="DSP_DAT_ECON"> 
                        <div class="separador">&nbsp;</div>
                        <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axissin028" c="DAT_ECON" lit="1000097"/></div>
                        <!-- Sección 2 -->
                        <table class="seccion">
                           
                        <tr>
                            <td>
                        <table class="area" align="center">
                                        <tr>
                                            <tr>
                                            <!--th style="width:50%;height:0px"></th>
                                            <th style="width:50%;height:0px"></th-->
                                            <th style="width:10%;height:0px"></th>
                                            <th style="width:10%;height:0px"></th>
                                            <th style="width:10%;height:0px"></th>
                                            <th style="width:10%;height:0px"></th>
                                            <th style="width:25%;height:0px"></th>
                                            <th style="width:25%;height:0px"></th>
                                            <th style="width:10%;height:0px"></th>
                                           
                                        </tr>
                                        <tr>
                                            <axis:ocultar f="axissin028" c="IMPRIMAPER">                                             
                                               <td class="titulocaja"><b><axis:alt f="axissin028" c="IMPRIMAPER" lit="108230"/>&nbsp;<axis:alt f="axissin028" c="PRIMAPERIODICA" lit="1000512"/></b></td>
                                            </axis:ocultar>
                                            
                                            <axis:ocultar f="axissin028" c="ImpPrimaActual">                                             
                                               <td class="titulocaja"><b><axis:alt f="axissin028" c="ImpPrimaActual" lit="1000514"/></b></td>
                                            </axis:ocultar>
                                            
                                            <axis:ocultar f="axissin028" c="ImpPrimaInicial">                                             
                                               <td class="titulocaja"><b><axis:alt f="axissin028" c="ImpPrimaInicial" lit="1000516"/></b></td>
                                            </axis:ocultar>
                                            
                                            <td>&nbsp;</td>
                                            
                                            <axis:ocultar f="axissin028" c="ImpAportMax">                                             
                                               <td class="titulocaja"><b><axis:alt f="axissin028" c="ImpAportMax" lit="1000515"/></b></td>
                                            </axis:ocultar>
                                            
                                            <axis:ocultar f="axissin028" c="IMPAPORTACUM">                                             
                                               <td class="titulocaja"><b><axis:alt f="axissin028" c="IMPAPORTACUM" lit="1000513"/></b></td>
                                            </axis:ocultar>                                            
                                            
                                            <axis:ocultar f="axissin028" c="IMPAPORTPEND">                                             
                                               <td class="titulocaja"><b><axis:alt f="axissin028" c="IMPAPORTPEND" lit="1000517"/></b></td>
                                            </axis:ocultar>                                        
                                        
                                        </tr>
                                        <tr>
                                            <axis:ocultar f="axissin028" c="IMPRIMAPER"> 
                                                <td class="campocaja">
                                                    <input type="text" class="campowidth campo campotexto" id="IMPRIMAPER" name="IMPRIMAPER" size="15"  
                                                    value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONEDAPROD]}' value='${__formdata.IMPPRIMAPER}' />" <axis:atr f="axissin028" c="IMPRIMAPER" a="modificable=false"/> />
                                                   
                                                </td>
                                            </axis:ocultar>
                                            <axis:ocultar f="axissin028" c="ImpPrimaActual"> 
                                                <td class="campocaja">
                                                    <input type="text" class="campowidthmedium campo campotexto" id="IMPPRIMAACTUAL" name="IMPPRIMAACTUAL" size="15"  
                                                    value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONEDAPROD]}' value='${__formdata.IMPPRIMAACTUAL}' />" <axis:atr f="axissin028" c="IMPPRIMAACTUAL" a="modificable=false"/> />
                                                </td>
                                            </axis:ocultar>
                                            <axis:ocultar f="axissin028" c="ImpPrimaInicial"> 
                                                <td class="campocaja">
                                                    <input type="text" class="campowidthmedium campo campotexto" id="IMPPRIMAINICIAL" name="IMPPRIMAINICIAL" size="15"  
                                                    value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONEDAPROD]}' value='${__formdata.IMPPRIMAINICIAL}' />" <axis:atr f="axissin028" c="IMPPRIMAINICIAL" a="modificable=false"/> />
                                                </td>
                                            </axis:ocultar>
                                            <td></td>
                                             <axis:ocultar f="axissin028" c="ImpAportMax"> 
                                                <td class="campocaja">
                                                    <input type="text" class="campowidthmedium campo campotexto" id="IMPAPORTMAX" name="IMPAPORTMAX" size="15"  
                                                    value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONEDAPROD]}' value='${__formdata.IMPAPORTMAX}' />" <axis:atr f="axissin028" c="IMPAPORTMAX" a="modificable=false"/> />
                                                    <input type="text" class="campowidthsmall campo campotexto" id="IMPAPORTMAXTOT" name="IMPAPORTMAXTOT" size="15"  
                                                    value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONEDAPROD]}' value='${__formdata.IMPAPORTMAXTOT}' />" <axis:atr f="axissin028" c="IMPAPORTMAXTOT" a="modificable=false"/> />
                                               </td>
                                            </axis:ocultar>
                                            <axis:ocultar f="axissin028" c="IMPAPORTACUM"> 
                                                <td class="campocaja">
                                                    <input type="text" class="campowidthmedium campo campotexto" id="IMPAPORTACUM" name="IMPAPORTACUM" size="15"  
                                                    value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONEDAPROD]}' value='${__formdata.IMPAPORTACUM}' />" <axis:atr f="axissin028" c="ImpAportAcum" a="modificable=false"/> />
                                                    <input type="text" class="campowidthsmall campo campotexto" id="IMPAPORTACUMTOT" name="IMPAPORTACUMTOT" size="15" 
                                                    value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONEDAPROD]}' value='${__formdata.IMPAPORTACUMTOT}' />" <axis:atr f="axissin028" c="IMPAPORTACUMTOT" a="modificable=false"/> />
                                               </td>
                                            </axis:ocultar>
                                            
                                            <axis:ocultar f="axissin028" c="IMPAPORTPEND"> 
                                                <td class="campocaja">
                                                    <input type="text" class="campowidthmedium campo campotexto" id="IMPAPORTPEND" name="IMPAPORTPEND" size="15"
                                                    value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONEDAPROD]}' value='${__formdata.IMPAPORTPEND}' />" <axis:atr f="axissin028" c="IMPPRIMAACTUAL" a="modificable=false"/> />
                                                </td>
                                            </axis:ocultar>
                                            
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            </table>
                        </axis:visible>
                        <axis:visible c="DSP_TOT_PREGUNTAS" f="axissin028">
                        <c:if test="${!empty T_IAX_PREGUNTAS || !empty pregQuestSalut || !empty pregDespeses}"> 
                            <div class="separador">&nbsp;</div>
                            <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axissin028" c="PREGUNTAS" lit="102299"/></div>
                            <table class="seccion">
                            <tr>
                                <td>
                                    <!-- Área 3 -->
                                    <table class="area" align="center">
                                        <tr>
                                            <tr>
                                            <th style="width:33%;height:0px"></th>
                                            <th style="width:33%;height:0px"></th>
                                            <th style="width:33%;height:0px"></th>
                                        </tr>
                                        <c:if test="${!empty T_IAX_PREGUNTAS}">
                                        <axis:visible c="DSP_PREGUNTAS" f="axissin028">
                                        <tr>
                                            <td class="campocaja" colspan="4">
                                                <div style="float:left;">
                                                    <img id="DSP_TOT_PREGUNTAS_parent" src="images/mes.gif" onclick="objEstilos.toggleDisplay('DSP_TOT_PREGUNTAS', this)" style="cursor:pointer"/> 
                                                    <b><axis:alt c="LIT_TOT_PREGUNTAS" f="axissin028" lit="102299"/></b>
                                                </div>
                                                <div style="clear:both;">
                                                    <hr class="titulo">
                                                </div>    
                                           </td>
                                        </tr>
                                        <tr id="DSP_TOT_PREGUNTAS_children">   
                                            <td class="campocaja" colspan="4" >
                                                <div class="displayspace">
                                                     <c:set var="title0"><axis:alt f="axissin028" c="CPREGUN" lit="800440" /></c:set>
                                                     <c:set var="title1"><axis:alt f="axissin028" c="TPREGUN" lit="102738" /></c:set>
                                                     <c:set var="title2"><axis:alt f="axissin028" c="TRESPUE" lit="103712" /></c:set>
                                                      <display:table name="${T_IAX_PREGUNTAS}" id="T_IAX_PREGUNTAS" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0" 
                                                      requestURI="axis_axissin028.do?paginar=true&tabla=T_IAX_PREGUNTAS">
                                                           <%@ include file="../include/displaytag.jsp"%>
                                                           <axis:visible c="CPREGUN" f="axissin028">
                                                           <display:column title="${title0}" sortable="true" sortProperty="OB_IAX_PREGUNTAS.CPREGUN" headerClass="headwidth5 sortable"  media="html" autolink="false" >
                                                               <div class="dspNumber">${T_IAX_PREGUNTAS.OB_IAX_PREGUNTAS.CPREGUN}</div>
                                                           </display:column>
                                                           </axis:visible>
                                                           <display:column title="${title1}" sortable="true" sortProperty="OB_IAX_PREGUNTAS.TPREGUN" headerClass="sortable"  media="html" autolink="false" >
                                                               <div class="dspText">${T_IAX_PREGUNTAS.OB_IAX_PREGUNTAS.TPREGUN}</div>
                                                           </display:column>
                                                           <display:column title="${title2}" sortable="false" headerClass="headwidth30 sortable"  media="html" autolink="false" >
                                                               <div class="dspText">
                                                                   <c:choose>
                                                                       <c:when test="${T_IAX_PREGUNTAS.OB_IAX_PREGUNTAS.TRESPUE != null}">                                                    
                                                                           ${T_IAX_PREGUNTAS.OB_IAX_PREGUNTAS.TRESPUE}
                                                                       </c:when>
                                                                       <c:otherwise>
                                                                           ${T_IAX_PREGUNTAS.OB_IAX_PREGUNTAS.CRESPUE}
                                                                       </c:otherwise>
                                                                   </c:choose>
                                                               </div>
                                                           </display:column>                                                    
                                                      </display:table>
                                                </div>
                                               
                                            </td>
                                        </tr>
                                        </axis:visible>
                                        </c:if>
                                        <c:if test="${!empty pregQuestSalut}">
                                        <axis:visible c="DSP_PREGUNTAS_QUESTSALUT" f="axissin028">
                                        <tr>
                                            <td class="campocaja" colspan="4">
                                               <img id="DSP_PREGUNTAS_QUESTSALUT_parent" src="images/mes.gif" onclick="objEstilos.toggleDisplay('DSP_PREGUNTAS_QUESTSALUT', this)" style="cursor:pointer"/> 
                                               <b><axis:alt c="LIT_PREG_QUESTSALUT" f="axissin028" lit="103672"/></b>  
                                               <hr class="titulo">
                                           </td>
                                        </tr>
                                        <tr id="DSP_PREGUNTAS_QUESTSALUT_children" style="display:none">
                                           <td class="campocaja" colspan="4">
                                               <div class="displayspace">
                                                 <c:set var="title0"><axis:alt f="axissin028" c="CPREGUN" lit="800440" /></c:set>
                                                 <c:set var="title1"><axis:alt f="axissin028" c="TPREGUN" lit="102738" /></c:set>
                                                 <c:set var="title2"><axis:alt f="axissin028" c="TRESPUE" lit="103712" /></c:set>
                                                  <div id="wrapper" class="wrapper">
                                                  <display:table name="${pregQuestSalut}" id="T_IAX_PREGUNTAS" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0" 
                                                  requestURI="axis_axissin028.do?paginar=true&tabla=T_IAX_PREGUNTAS">
                                                       <%@ include file="../include/displaytag.jsp"%>
                                                       <axis:visible c="CPREGUN" f="axissin028">
                                                       <display:column title="${title0}" sortable="true" sortProperty="OB_IAX_PREGUNTAS.CPREGUN" headerClass="headwidth5 sortable"  media="html" autolink="false" >
                                                           <div class="dspNumber">${T_IAX_PREGUNTAS.OB_IAX_PREGUNTAS.CPREGUN}</div>
                                                       </display:column>
                                                      </axis:visible>
                                                       <display:column title="${title1}" sortable="true" sortProperty="OB_IAX_PREGUNTAS.TPREGUN" headerClass="sortable"  media="html" autolink="false" >
                                                           <div class="dspText">${T_IAX_PREGUNTAS.OB_IAX_PREGUNTAS.TPREGUN}</div>
                                                       </display:column>
                                                       <display:column title="${title2}" headerClass="headwidth30 sortable" media="html" autolink="false">
                                                           <div class="dspText">
                                                               <c:choose>
                                                                   <c:when test="${T_IAX_PREGUNTAS.OB_IAX_PREGUNTAS.TRESPUE != null}">                                                    
                                                                       ${T_IAX_PREGUNTAS.OB_IAX_PREGUNTAS.TRESPUE}
                                                                   </c:when>
                                                                   <c:otherwise>
                                                                       ${T_IAX_PREGUNTAS.OB_IAX_PREGUNTAS.CRESPUE}
                                                                   </c:otherwise>
                                                               </c:choose>
                                                           </div>
                                                       </display:column>                                                    
                                                  </display:table>
                                              
                                               </div>
                                           </td>
                                        </tr>
                                        </axis:visible>
                                        </c:if>
                                        <c:if test="${!empty pregDespeses}">
                                        <axis:visible c="DSP_PREGUNTAS_DESPESES" f="axissin028">
                                        <tr>
                                            <td class="campocaja" colspan="4">
                                               <img id="DSP_DSP_PREGUNTAS_DESPESES_parent" src="images/mes.gif" onclick="objEstilos.toggleDisplay('DSP_PREGUNTAS_DESPESES', this)" style="cursor:pointer"/> 
                                               <b><axis:alt c="LIT_PREG_DESPESES" f="axissin028" lit="9001509"/></b>   
                                               <hr class="titulo">
                                           </td>
                                        </tr>
                                        <tr id="DSP_PREGUNTAS_DESPESES_children" style="display:none">
                                           <td class="campocaja" colspan="4">
                                               <div class="displayspace">
                                                 <c:set var="title0"><axis:alt f="axissin028" c="CPREGUN" lit="800440" /></c:set>
                                                 <c:set var="title1"><axis:alt f="axissin028" c="TPREGUN" lit="102738" /></c:set>
                                                 <c:set var="title2"><axis:alt f="axissin028" c="TRESPUE" lit="103712" /></c:set>
                                                   <display:table name="${pregDespeses}" id="T_IAX_PREGUNTAS" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0" 
                                                  requestURI="axis_axissin028.do?paginar=true&tabla=T_IAX_PREGUNTAS">
                                                       <%@ include file="../include/displaytag.jsp"%>
                                                       <axis:visible c="CPREGUN" f="axissin028">
                                                       <display:column title="${title0}" sortable="true" sortProperty="OB_IAX_PREGUNTAS.CPREGUN" headerClass="headwidth5 sortable"  media="html" autolink="false" >
                                                           <div class="dspNumber">${T_IAX_PREGUNTAS.OB_IAX_PREGUNTAS.CPREGUN}</div>
                                                       </display:column>
                                                      </axis:visible>
                                                       <display:column title="${title1}" sortable="true" sortProperty="OB_IAX_PREGUNTAS.TPREGUN" headerClass="sortable"  media="html" autolink="false" >
                                                           <div class="dspText">${T_IAX_PREGUNTAS.OB_IAX_PREGUNTAS.TPREGUN}</div>
                                                       </display:column>
                                                       <display:column title="${title2}" headerClass="headwidth30 sortable" media="html" autolink="false">
                                                           <div class="dspText">
                                                               <c:choose>
                                                                   <c:when test="${T_IAX_PREGUNTAS.OB_IAX_PREGUNTAS.TRESPUE != null}">                                                    
                                                                       ${T_IAX_PREGUNTAS.OB_IAX_PREGUNTAS.TRESPUE}
                                                                   </c:when>
                                                                   <c:otherwise>
                                                                       ${T_IAX_PREGUNTAS.OB_IAX_PREGUNTAS.CRESPUE}
                                                                   </c:otherwise>
                                                               </c:choose>
                                                           </div>
                                                       </display:column>                                                    
                                                  </display:table>
                                               
                                               </div>
                                           </td>
                                        </tr>
                                        </axis:visible>
                                        </c:if>
                                    </table>
                                </td>
                            </tr>
                        </table>
                        </c:if>
                        </axis:visible>
                        <div class="separador">&nbsp;</div>
                        <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axissin028" c="PROVISIONES" lit="102656"/></div>
                        <table class="seccion">
                            <tr>
                                <td>
                                    <!-- Área 3 -->
                                    <table class="area" align="center">
                                        <tr>
                                            <tr>
                                            <th style="width:33%;height:0px"></th>
                                            <th style="width:33%;height:0px"></th>
                                            <th style="width:33%;height:0px"></th>
                                        </tr>
                                     
                                        <tr>
                                            <axis:ocultar f="axissin028" c="IMPPROVISION">                                             
                                               <td class="titulocaja"><b><axis:alt f="axissin028" c="IMPPROVISION" lit="1000518"/></b></td>
                                            </axis:ocultar>
                                            
                                            <axis:ocultar f="axissin028" c="IMPCAPFALL">                                             
                                               <td class="titulocaja"><b><axis:alt f="axissin028" c="IMPCAPFALL" lit="1000519"/></b></td>
                                            </axis:ocultar>
                                            
                                            <axis:ocultar f="axissin028" c="IMPCAPGARAN">                                             
                                               <td class="titulocaja"><b><axis:alt f="axissin028" c="IMPCAPGARAN" lit="1000521"/></b></td>
                                            </axis:ocultar>                                            
                                            
                                        </tr>
                                        <tr>
                                         
                                            <axis:ocultar f="axissin028" c="IMPPROVISION"> 
                                                <td class="campocaja">
                                                    <input type="text" class="campowidthbig campo campotexto" id="IMPPROVISION" name="IMPPROVISION" size="15"
                                                    value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONEDAPROD]}' value='${__formdata.IMPPROVISION}' />" <axis:atr f="axissin028" c="IMPPROVISION" a="modificable=false"/> />
                                                </td>
                                            </axis:ocultar>
                                            <axis:ocultar f="axissin028" c="IMPCAPFALL"> 
                                                <td class="campocaja">
                                                    <input type="text" class="campowidthbig campo campotexto" id="IMPCAPFALL" name="IMPCAPFALL" size="15"
                                                    value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONEDAPROD]}' value='${__formdata.IMPCAPFALL}' />" <axis:atr f="axissin028" c="IMPCAPFALL" a="modificable=false"/> />
                                                </td>
                                            </axis:ocultar>
                                            <axis:ocultar f="axissin028" c="IMPCAPGARAN"> 
                                                <td class="campocaja">
                                                    <input type="text" class="campowidthbig campo campotexto" id="IMPCAPGARAN" name="IMPCAPGARAN" size="15"
                                                   value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONEDAPROD]}' value='${__formdata.IMPCAPGARAN}' />" <axis:atr f="axissin028" c="IMPCAPGARAN" a="modificable=false"/> />
                                                </td>
                                            </axis:ocultar>
                                            
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table> 
                        <!-- tercera seccion -->
                        <div class="separador">&nbsp;</div>
                        <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axissin028" c="SIMRESCATE" lit="1000528"/></div>
                        <table class="seccion">
                            <tr>
                                <td>
                                    <!-- Área 3 -->
                                    <table class="area" align="center">
                                        <tr>
                                            
                                            <th style="width:50%;height:0px"></th>
                                            <th style="width:20%;height:0px"></th>
                                            <th style="width:30%;height:0px"></th>
                                        </tr>
                                            <axis:ocultar f="axissin028" c="ESTADO">
                                                <tr>                                         
                                                    <td colspan="3">
                                                         <!-- Área radio buttons total o parcial -->
                                                        <table class="seccion" align="center">
                                                        <tr>
                                                            <td><b><axis:alt f="axissin028" c="radioTotalParcial1" lit="1000529"/></b><input  <c:if test="${__formdata.ESTADO==4}">checked</c:if> onClick="javascript:cambiaCalculo()" 
                                                            value="4" type="radio" id="radioTotalParcial" name="radioTotalParcial"/></td>
                                                            <td></td>
                                                            <td><b><axis:alt f="axissin028" c="radioTotalParcial2" lit="1000530"/></b>&nbsp;&nbsp;<input  <c:if test="${__formdata.ESTADO==5}">checked</c:if> onClick="javascript:cambiaCalculo()" 
                                                            value="5" type="radio" id="radioTotalParcial" name="radioTotalParcial"/></td>
                                                        </tr>
                                                        
                                                        </table>
                                                        <div class="separador">&nbsp;</div>
                                                    </td>
                                                </tr>    
                                            </axis:ocultar>
                                     
                                     <axis:ocultar f="axissin028" c="FONDOS">
                                        <c:if test="${__formdata.ESTADO==5 && (__formdata.resUniPend == 2 || __formdata.resUniPend == 3)}">
                                       <tr>
                                           <td class="titulocaja">
                                            
                                            <b><axis:alt f="axissin028" c="TIT_CTIPCALC" lit="9002111"/></b>
                                          </td>
                                      </tr>
                                      <tr>
                                           <td class="campocaja">
                                            <select name ="CTIPCALC" id="CTIPCALC" style="width:50%;" size="1" class="campowidthselect campo campotexto" <axis:atr f="axissin028" c="CTIPCALC" a="modificable=true&isInputText=false"/>
                                                                title="<axis:alt f="axissin028" c="CTIPCALC" lit="9902172"/>" onchange="changeCtipcalc();">
                                                                <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt f="axissin028" c="SELECCIONAR" lit="108341"/> - </option>
                                                                <c:forEach var="ctipcalcs" items="${__formdata.LSTCTIPCALC}">
                                                                    <option value = "${ctipcalcs.CATRIBU}"
                                                                       <c:if test="${ctipcalcs.CATRIBU == __formdata.CTIPCALC}">selected</c:if>  >
                                                                        ${ctipcalcs.TATRIBU}
                                                                    </option> 
                                                                </c:forEach>
                                                                </select>
                                           </td>
                                       </tr>
                                        <tr>
                   
                                            <td class="seccion">
                   
                                                 <c:set var="title0"><axis:alt f="axissin028" c="TCESTA" lit="108263" /></c:set>
                                                 <c:set var="title1"><axis:alt f="axissin028" c="FULTVAL" lit="1000590" /></c:set>
                                                 <c:set var="title2"><axis:alt f="axissin028" c="IIMPACT" lit="100563" /></c:set>
                                                 <c:set var="title3"><axis:alt f="axissin028" c="NUNIACT" lit="105952" /></c:set>
                                                 <c:set var="title4"><axis:alt f="axissin028" c="PERCENT" lit="101467" /></c:set>
                                                <c:choose>
                                                <c:when test="${__formdata.CTIPCALC==1}">
                                                    <c:set var="title5"><axis:alt f="axissin028" c="IMPORT" lit="108490" /></c:set>
                                                </c:when>
                                                <c:otherwise>
                                                    <c:set var="title5"><axis:alt f="axissin028" c="IMPORT" lit="9001156" /></c:set>
                                                </c:otherwise>
                                                </c:choose>
                                                 <input  type="hidden" id="importeFondos"/>
                                                 <display:table name="${__formdata.fondos}" id="T_IAX_FONDOS" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0" 
                                                  requestURI="axis_axissin028.do?paginar=true&tabla=T_IAX_FONDOS">
                                                       <%@ include file="../include/displaytag.jsp"%>
                                                       <axis:visible c="CPREGUN" f="axissin028">
                                                       <display:column title="" sortable="true" sortProperty="OB_IAX_DATOS_FND.CCESTA" headerClass="headwidth5 sortable"  media="html" autolink="false" >
                                                           <div class="dspNumber"><input onClick="calcularImporteFondos(this.value)" type="checkbox" id="ccesta${T_IAX_FONDOS.OB_IAX_DATOS_FND.CCESTA}" name="ccesta${T_IAX_FONDOS.OB_IAX_DATOS_FND.CCESTA}" value="${T_IAX_FONDOS.OB_IAX_DATOS_FND.CCESTA}" <c:if test="${T_IAX_FONDOS.OB_IAX_DATOS_FND.NUNIACT==0}">disabled</c:if>></div>
                                                       </display:column>
                                                      </axis:visible>
                                                       <display:column title="${title0}" sortable="true" sortProperty="OB_IAX_DATOS_FND.TCESTA" headerClass="sortable"  media="html" autolink="false" >
                                                           <div class="dspText">${T_IAX_FONDOS.OB_IAX_DATOS_FND.TCESTA}</div>
                                                       </display:column>
                                                       <display:column title="${title1}" headerClass="headwidth30 sortable" media="html" autolink="false">
                                                           <div class="dspText">                                                            
                                                                       <fmt:formatDate pattern="dd/MM/yyyy" value="${T_IAX_FONDOS.OB_IAX_DATOS_FND.FULTVAL}"/>                                                          
                                                           </div>
                                                       </display:column>
                                                      <display:column title="${title2}" headerClass="headwidth30 sortable" media="html" autolink="false">
                                                           <div class="dspText" id="importeFnd${T_IAX_FONDOS.OB_IAX_DATOS_FND.CCESTA}">                                                            
                                                                       ${T_IAX_FONDOS.OB_IAX_DATOS_FND.IIMPACT}                                                            
                                                           </div>
                                                       </display:column> 
                                                      <display:column title="${title3}" headerClass="headwidth30 sortable" media="html" autolink="false">
                                                           <div class="dspText" id="unidadesFnd${T_IAX_FONDOS.OB_IAX_DATOS_FND.CCESTA}">                                                            
                                                                       ${T_IAX_FONDOS.OB_IAX_DATOS_FND.NUNIACT}                                                            
                                                           </div>
                                                       </display:column>
                                                       <axis:visible f="axissin028" c="VALOR">
                                                       <c:choose>
                                                       <c:when test="${__formdata.CTIPCALC==Integer.MIN_VALUE}">
                                                        &nbsp;
                                                       </c:when>
                                                       <c:when test="${__formdata.CTIPCALC==0}">
                                                       <display:column title="${title4}" headerClass="headwidth30 sortable" media="html" autolink="false">
                                                           <div class="dspText">                                                            
                                                               <input type="text" id="percent${T_IAX_FONDOS.OB_IAX_DATOS_FND.CCESTA}" name="percent${T_IAX_FONDOS.OB_IAX_DATOS_FND.CCESTA}" <c:if test="${T_IAX_FONDOS.OB_IAX_DATOS_FND.NUNIACT==0}">disabled</c:if> onblur="calcularImporteFondos(${T_IAX_FONDOS.OB_IAX_DATOS_FND.CCESTA})"/>
                                                           </div>
                                                       </display:column>
                                                       </c:when>
                                                       <c:otherwise>
                                                       <display:column title="${title5}" headerClass="headwidth30 sortable" media="html" autolink="false">
                                                           <div class="dspText">                                                            
                                                               <input type="text" id="import${T_IAX_FONDOS.OB_IAX_DATOS_FND.CCESTA}" name="import${T_IAX_FONDOS.OB_IAX_DATOS_FND.CCESTA}" <c:if test="${T_IAX_FONDOS.OB_IAX_DATOS_FND.NUNIACT==0}">disabled</c:if> onblur="calcularImporteFondos(${T_IAX_FONDOS.OB_IAX_DATOS_FND.CCESTA})"/>
                                                           </div>
                                                       </display:column>
                                                       </c:otherwise>
                                                       </c:choose>
                                                       </axis:visible>
                                                  </display:table>
                                              
                                            </td>
                                        </tr>
                                          </c:if>
                                          </axis:ocultar>
                                        <tr>
                                            <td>
                                                <table  align="center">
                                                     <tr>
                                                        <th style="width:50%;height:0px"></th>
                                                        <th style="width:50%;height:0px"></th>
                                                     </tr>
                                                     <tr>    
                                                     		<axis:ocultar f="axissin028" c="FECHA" dejarHueco="false">                                    
                                                        <td class="titulocaja"><b><axis:alt f="axissin028" c="FECHA" lit="100883"></axis:alt></b></td>
                                                        </axis:ocultar>
                                                        
                                                        <axis:ocultar f="axissin028" c="CMOTRESC" dejarHueco="false"> 
                                                            <td class="titulocaja"><b><axis:alt f="axissin028" c="CMOTRESC" lit="102577"></axis:alt></b></td>
                                                        </axis:ocultar>
                                                    
                                                    </tr>                                                      
                                                    <tr>
                                                        <axis:ocultar f="axissin028" c="FECHA" dejarHueco="false">
                                                            <td class="campocaja">
                                                                <jsp:useBean id="today" class="java.util.Date" /> 
                                                                <c:set var="FECHA"><fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FECHA}"/></c:set>
                                                                <input  type="text" class="campowidthbig campo campotexto" onchange="javascript:f_but_simular(1);" id="FECHA" name="FECHA" size="15" style="width:35%"
                                                                <axis:atr f="axissin028" c="FECHA" a="modificable=true&obligatorio=true&formato=fecha"/>
                                                                value="${FECHA} <c:if test="${empty FECHA}"><fmt:formatDate pattern="dd/MM/yyyy" value="${today}"/></c:if>"
                                                                title="<axis:alt f="axissin028" c="FECHA" lit="100883"/>"/><a id="FECHA" style="vertical-align:middle;"><img 
                                                                alt="<axis:alt f="axissin028" c="CFECHA" lit="108341"/>" title="<axis:alt f="axissin028" c="FECHA" lit="100883" />" src="images/calendar.gif"/></a>
                                                            </td>
                                                        </axis:ocultar>   
                                                        
                                                        <axis:ocultar f="axissin028" c="CMOTRESC" dejarHueco="false"> 
                                                            <td class="campocaja">
                                                                <select name = "CMOTRESC" id="CMOTRESC" style="width:100%;" size="1" class="campowidthselect campo campotexto" <axis:atr f="axissin028" c="CMOTRESC" a="modificable=true&isInputText=false"/>
                                                                title="<axis:alt f="axissin028" c="TCMOTRESC" lit="9902172"/>">
                                                                <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt f="axissin028" c="SELECCIONAR" lit="108341"/> - </option>
                                                                <c:forEach var="motivos" items="${__formdata.LSTCMOTRESC}">
                                                                    <option value = "${motivos.CMOTRESC}"
                                                                       <c:if test="${motivos.CMOTRESC == __formdata.CMOTRESC}">selected</c:if>  >
                                                                        ${motivos.TMOTRESC}
                                                                    </option> 
                                                                </c:forEach>
                                                                </select>
                                                            </td>
                                                        </axis:ocultar>
                                                        
                                                    </tr>
                                                    <tr>
                                                         <axis:ocultar f="axissin028" c="IMPCAPRIS">                                         
                                                           <td class="titulocaja"><b><axis:alt f="axissin028" c="IMPCAPRIS" lit="100563"></axis:alt></b></td>
                                                        </axis:ocultar>        
                                                    </tr>
                                                    <tr>
                                                         <axis:ocultar f="axissin028" c="IMPCAPRIS"> 
                                                            <td class="campocaja">
                                                                <input type="text" class="campowidthinput campo campotexto" onchange="javascript:validarEnvioSinmulacion(this);" size="15" value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONEDAPROD]}' value='${__formdata.IMPCAPRIS}' />" name="IMPCAPRIS" id="IMPCAPRIS"
                                                                style="width:50%;" <axis:atr f="axissin028" c="IMPCAPRIS" a="formato=decimal"/> 
                                                                title="<axis:alt f="axissin028" c="IMPORTE" lit="100563"/>"/>
                                                            </td>
                                                        </axis:ocultar>
                                                    </tr>
                                                    <tr>                                                    
                                                        <axis:ocultar f="axissin028" c="IMPPENALI">                                             
                                                           <td class="titulocaja"><b><axis:alt f="axissin028" c="IMPPENALI" lit="9900794"></axis:alt></b></td>
                                                        </axis:ocultar>                                                                   
                                                    </tr>
                                                    <tr>
                                                         <axis:ocultar f="axissin028" c="IMPPENALI"> 
                                                            <td class="campocaja">
                                                                <input type="text" class="campowidthbig campo campotexto" onchange="javascript:validarEnvioSinmulacion(this);" id="IMPPENALI" name="IMPPENALI" size="15"
                                                                value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONEDAPROD]}' value='${__formdata.IMPPENALI}' />" <axis:atr f="axissin028" c="IMPPENALI" a="modificable=false&formato=decimal"/>
                                                                title="<axis:alt f="axissin028" c="IMPPENALI" lit="9900794"/>"/>
                                                            </td>
                                                         </axis:ocultar>
                                                    </tr>
                                                    <tr>
                                                        <axis:ocultar f="axissin028" c="IMPRESCATE"> 
                                                           <td class="titulocaja_totales"><b><axis:alt f="axissin028" c="IMPRESCATE" lit="1000533"></axis:alt></b></td>                                                           
                                                        </axis:ocultar>  
                                                    </tr>                                                    
                                                    <tr>
                                                        <axis:ocultar f="axissin028" c="IMPRESCATE"> 
                                                            <td class="campocaja">
                                                                <input type="text" class="campowidthbig campo campotexto" id="IMPRESCATE" name="IMPRESCATE" size="15" onchange="javascript:f_formatear(this);"
                                                                value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONEDAPROD]}' value='${__formdata.IMPRESCATE}' />" <axis:atr f="axissin028" c="IMPRESCATE" a="modificable=false"/> />
                                                            </td>
                                                        </axis:ocultar>
                                                    </tr>                                                                                                       
                                                </table>                                            
                                            </td>
                                            <td></td>                                            
                                            <td>
                                                <table align="center">                                                    
                                                          <axis:ocultar f="axissin028" c="IMPPRIMASCONS" dejarHueco="false">   
                                                                <tr>
                                                                   <td class="titulocaja"><b><axis:alt f="axissin028" c="IMPPRIMASCONS" lit="1000523"></axis:alt></b></td>                        
                                                                </tr>   
                                                          </axis:ocultar>            
                                                          <axis:ocultar f="axissin028" c="IMPPRIMASCONS" dejarHueco="false"> 
                                                                  <tr>
                                                                    <td class="campocaja">
                                                                        <input type="text" class="campowidthbig campo campotexto" id="IMPPRIMASCONS" name="IMPPRIMASCONS" size="15" onchange="javascript:f_formatear(this);"
                                                                        value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONEDAPROD]}' value='${__formdata.IMPPRIMASCONS}' />" <axis:atr f="axissin028" c="IMPPRIMASCONS" a="modificable=false"/> />
                                                                    </td>
                                                                  </tr>  
                                                          </axis:ocultar>
                                                          <axis:ocultar f="axissin028" c="IMPRENDBRUTO" dejarHueco="false">                                             
                                                                  <tr>
                                                                     <td class="titulocaja"><b><axis:alt f="axissin028" c="IMPRENDBRUTO" lit="1000524"/></b></td>                        
                                                                  </tr>   
                                                          </axis:ocultar>                              
                                                          <axis:ocultar f="axissin028" c="IMPRENDBRUTO" dejarHueco="false"> 
                                                                <tr>
                                                                    <td class="campocaja">
                                                                        <input type="text" class="campowidthbig campo campotexto" id="IMPRENDBRUTO" name="IMPRENDBRUTO" size="15" onchange="javascript:f_formatear(this);"
                                                                        value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONEDAPROD]}' value='${__formdata.IMPRENDBRUTO}' />" <axis:atr f="axissin028" c="IMPRENDBRUTO" a="modificable=false"/> />
                                                                    </td>
                                                                </tr>   
                                                          </axis:ocultar>
                                                          <axis:ocultar f="axissin028" c="IMPREDUCCION" dejarHueco="false">                                             
                                                                <tr>
                                                                    <td class="titulocaja"><b><axis:alt f="axissin028" c="IMPREDUCCION" lit="1000525"/></b></td>                        
                                                                </tr>    
                                                          </axis:ocultar>                                            
                                                          <axis:ocultar f="axissin028" c="IMPREDUCCION" dejarHueco="false"> 
                                                                 <tr>
                                                                    <td class="campocaja">
                                                                        <input type="text" class="campowidthbig campo campotexto" id="IMPREDUCCION" name="IMPREDUCCION" size="15" onchange="javascript:f_formatear(this);"
                                                                        value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONEDAPROD]}' value='${__formdata.IMPREDUCCION}' />" <axis:atr f="axissin028" c="IMPREDUCCION" a="modificable=false"/> />
                                                                    </td>
                                                                 </tr>   
                                                          </axis:ocultar>
                                                          <axis:ocultar f="axissin028" c="IMPREGTRANS" dejarHueco="false"> 
                                                                <tr>
                                                                   <td class="titulocaja"><b><axis:alt f="axissin028" c="IMPREGTRANS" lit="1000532"/></b></td>
                                                                </tr>   
                                                          </axis:ocultar>
                                                          <axis:ocultar f="axissin028" c="IMPREGTRANS" dejarHueco="false"> 
                                                                <tr>
                                                                    <td class="campocaja">
                                                                        <input type="text" class="campowidthbig campo campotexto" id="IMPREGTRANS" name="IMPREGTRANS" size="15" onchange="javascript:f_formatear(this);"
                                                                        value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONEDAPROD]}' value='${__formdata.IMPREGTRANS}' />" <axis:atr f="axissin028" c="IMPREGTRANS" a="modificable=false"/> />
                                                                    </td>
                                                                </tr>
                                                          </axis:ocultar>
                                                          <axis:ocultar f="axissin028" c="IMPRCM" dejarHueco="false"> 
                                                               <tr>
                                                                  <td class="titulocaja"><b><axis:alt f="axissin028" c="IMPRCM" lit="1000526"/></b></td>                        
                                                                </tr>  
                                                          </axis:ocultar>                
                                                          <axis:ocultar f="axissin028" c="IMPRCM" dejarHueco="false"> 
                                                                <tr>
                                                                    <td class="campocaja">
                                                                        <input type="text" class="campowidthbig campo campotexto" id="IMPRCM" onchange="javascript:validarEnvioSinmulacion(this);" name="IMPRCM" size="15"
                                                                        value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONEDAPROD]}' value='${__formdata.IMPRCM}' />" <axis:atr f="axissin028" c="IMPRCM" a="modificable=false&formato=decimal"/>  
                                                                        title="<axis:alt f="axissin028" c="IMPRCM" lit="1000526"/>"/>
                                                                    </td>
                                                                 </tr>   
                                                          </axis:ocultar>
                                                          <axis:ocultar f="axissin028" c="IMPRETENCION" dejarHueco="false"> 
                                                         
                                                               <tr>
                                                                    <td class="titulocaja"><b><axis:alt f="axissin028" c="IMPRETENCION" lit="9001319"/></b>
                                                                                           &nbsp;<b><axis:alt f="axissin028" c="IMPRETENCION2" lit="101714"/></b>
                                                                    </td>                        
                                                               </tr>     
                                                          </axis:ocultar>    
                                                          <axis:ocultar f="axissin028" c="IMPRETENCION" dejarHueco="false"> 
                                                                <tr>
                                                                   
                                                                    <td class="campocaja">
                                                                        <input type="text" class="campowidthsmall campo campotexto" id="PCTPCTRETEN" onchange="javascript:validarEnvioSinmulacion(this);" name="PCTPCTRETEN" size="15" 
                                                                        value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONEDAPROD]}' value='${__formdata.PCTPCTRETEN}' />" <axis:atr f="axissin028" c="PCTPCTRETEN" a="modificable=false&formato=decimal"/> 
                                                                        title="<axis:alt f="axissin028" c="PCTPCTRETEN" lit="9001319"/>"/>                                                                        
                                                                        &nbsp;&nbsp;
                                                                        <input type="text" class="campowidthmedium campo campotexto" id="IMPRETENCION" name="IMPRETENCION" size="15" style="width:36%" onchange="javascript:f_formatear(this);"
                                                                        value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONEDAPROD]}' value='${__formdata.IMPRETENCION}' />" <axis:atr f="axissin028" c="IMPRETENCION" a="modificable=false"/> />
                                                                    </td>
                                                               </tr>
                                                          </axis:ocultar>
                                                          <axis:ocultar f="axissin028" c="IMPRESNETO" dejarHueco="false">                                             
                                                               <tr>
                                                                    <td class="titulocaja_totales"><b><axis:alt f="axissin028" c="IMPRESNETO" lit="1000527"/></b></td>                                                                                           
                                                               </tr>     
                                                          </axis:ocultar>                                            
                                                          <axis:ocultar f="axissin028" c="IMPRESNETO" dejarHueco="false"> 
                                                               <tr>
                                                                    <td class="campocaja">
                                                                        <input type="text" class="campowidthbig campo campotexto" id="IMPRESNETO" name="IMPRESNETO" size="15" onchange="javascript:f_formatear(this);"
                                                                        value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONEDAPROD]}' value='${__formdata.IMPRESNETO}' />" <axis:atr f="axissin028" c="IMPNETO" a="modificable=false"/> />
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
                    </td>
                </tr>
            </table>
             <div class="separador">&nbsp;</div>
            <c:import url="../include/botonera_nt.jsp"><c:param name="f">axissin028</c:param>
                <c:param name="__botones">salir<axis:visible c="BT_IMPRIMIR" f="axissin028">,imprimir</axis:visible><axis:visible f="axissin028" c="BT_SIMULAR" >,1000531</axis:visible>,<axis:visible f="axissin028" c="BT_ACEPTAR" >,aceptar</axis:visible></c:param>
                <c:param name="f">axissin028</c:param>
            </c:import>
        </form>
        <script type="text/javascript">
        Calendar.setup({
            inputField     :    "FECHA",     
            ifFormat       :    "%d/%m/%Y",      
            button         :    "icon_FECHA", 
            singleClick    :    true,
            firstDay       :    1
        });
    
        Calendar.setup({
            inputField     :    "FEFECT",     
            ifFormat       :    "%d/%m/%Y",      
            button         :    "icon_FEFECT", 
            singleClick    :    true,
            firstDay       :    1
        });
        </script>
        <c:import url="../include/mensajes.jsp" />
    </body>
</html>