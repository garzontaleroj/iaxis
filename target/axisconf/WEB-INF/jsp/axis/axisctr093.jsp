<%--/**
*  Fichero: axisctr093.jsp
*   
*  Primara pantalla del flujo de trabajo "Consulta PÃ³liza".
*  TÃ­tulo: Consulta de PÃ³lizas
*
*  Fecha: 27/11/2007
*/
--%>


<%@ page contentType="text/html;charset=windows-1252"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
    <head>
        <title><axis:alt f="axisctr093" c="LIT_TITULO" lit="101908"/></title>
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
  <!--*********************************** -->        
        <script type="text/javascript">
           
            /****************************************************************************************/
            /*********************************** NAVEGACION *****************************************/
            /****************************************************************************************/     
        
            function f_onload(){

                
                f_cargar_propiedades_pantalla();
                f_open_axisctr092();
                f_abrir_secciones();
             
                var rechazado = "${__formdata.RECHAZADO}";
                 if (!objUtiles.estaVacio(rechazado) && objUtiles.utilEquals(rechazado, "1")){
                    document.miForm.RECHAZADO.value='';
                    objUtiles.abrirModal("axisimprimir", "src", "modal_axisimprimir.do?dt=<%=new java.util.Date().getTime()%>&operation=impresion_doc_tipo&SEGURO="+document.miForm.SSEGURO.value+"&TIPO=REV");
                 }
               
                var recargar = "${__formdata.recargar}";
                 if (!objUtiles.estaVacio(recargar) && objUtiles.utilEquals(recargar, "0")){
                  //Se recarga para actualizar la botonera
                    f_recargar();
                }
                    
                var v_ccodpla = "${__formdata.CCODPLA}";
                
                //if (document.miForm.CCODPLA_TRASPAS.value!='') {
                if (v_ccodpla!='') {
                    objEstilos.toggleDisplay('J_PLAN', 'J_PLAN_parent');
                    objDom.setVisibilidadPorId("CCOMPANI_L", "hidden");
                    objDom.setVisibilidadPorId("CCOMPANI_DGS", "hidden");
                    objDom.setVisibilidadPorId("TCOMPANI", "hidden");
                    objDom.setVisibilidadPorId("ICO_CCOMPANI", "hidden");

                document.miForm.TPOLEXT.setAttribute("obligatorio",false);
                document.miForm.TPOLEXT.className="campowidthselect campo campotexto"; 

                    }
                else{
                         document.miForm.CCODPLA_TRASPAS.value='';
                         document.miForm.CCODPLA.value='';
                         document.miForm.TCODPLA_TRASPAS.value='';
                         document.miForm.CCODFON_TRASPAS.value='';
                         document.miForm.TCODFON_TRASPAS.value='';
                         document.miForm.CCODGES_TRASPAS.value='';
                         document.miForm.TCODGES_TRASPAS.value='';
                         objDom.setVisibilidadPorId("CCOMPANI_L", "visible");
                         objDom.setVisibilidadPorId("CCOMPANI_DGS", "visible");
                         objDom.setVisibilidadPorId("TCOMPANI", "visible");
                         objDom.setVisibilidadPorId("ICO_CCOMPANI", "visible");   

                document.miForm.TPOLEXT.setAttribute("obligatorio","true");
                document.miForm.TPOLEXT.className="campowidthselect campo campotexto_ob";                       
                         
                }
                
                 try{
                     <c:if test="${empty __formdata.CEXTERN && __configform.axisctr093__CEXTERN__valordefecto == 1}">
                        objDom.setVisibilidadPorId("NCERTEXT", "hidden");
                        objDom.setVisibilidadPorId("ICO_BUSCARPOLIZA", "hidden");
                     </c:if>  
                     <c:if test="${__formdata.CEXTERN == 1}">
                        objDom.setVisibilidadPorId("NCERTEXT", "hidden");
                        objDom.setVisibilidadPorId("ICO_BUSCARPOLIZA", "hidden");
                     </c:if>                      
               }
               catch(e){}                    
            }

        
        function f_nuevo_traspaso(){            
            objUtiles.cerrarModal("axisctr092");
            f_abrir_axisctr019();
        }
        
        function f_abrir_cercador(){
                objUtiles.abrirModal("axisctr106","src","modal_axisctr106.do?operation=buscar&CEMPRES="+document.miForm.CCODPLA_TRASPAS.value);
            
        }        
        
       
        function f_formatdate(entrada,title){
         var jDate = new JsFecha();
            if(entrada.value.length>0){
                entrada.value=jDate.formateaFecha(entrada.value);
            
                if(jDate.validaFecha(entrada.value)){
                    entrada.value=jDate.formateaFecha(entrada.value);
                }else{
                    alert("<axis:alt f="axisctr093" c="LIT_ALERT" lit="1000421"/>");
                }
            }
        }               
            
            function f_open_axisctr092() {
                document.miForm.NUEVO.value = null;
                var SSEGURO = "${__formdata.SSEGURO}";
                <axis:visible c="CONSULTA_TRAS" f="axisctr093">
                    if (objUtiles.estaVacio(SSEGURO))
                        f_abrir_axisctr092();
                </axis:visible>

                <c:if test="${__configform.axisctr093__CONSULTA_TRAS__visible == 'false'}">
                    if (objUtiles.estaVacio(SSEGURO))
                        f_abrir_axisctr019();
                </c:if>
            }
            
        function f_formatdate2(fecha,fecha1){
         var jDate = new JsFecha();
            if(fecha.value.length>0){
                fecha.value=jDate.formateaFecha(fecha.value);
                if(jDate.validaFecha(fecha.value))
                  {
                    fecha.value=jDate.formateaFecha(fecha.value);
                    //validacion que no es mayor que hoy
                        fec=fecha.value.split("/");
                        fec1=fecha1.split("-");
                        if(fec[2]>fec1[0]){alert("<axis:alt f="axisctr093" c="LIT_ALERT2" lit="9901418"/>");fecha.value='';}
                        else 
                          if(fec[2]>=fec1[0]){
                                if(fec[1]>fec1[1]) {alert("<axis:alt f="axisctr093" c="LIT_ALERT3" lit="9901418"/>");fecha.value='';}
                                else 
                                    if(fec[1]>=fec1[1]){
                                        if(fec[0]>fec1[2]){alert("<axis:alt f="axisctr093" c="LIT_ALERT4" lit="9901418"/>");fecha.value='';}
                                                    }
                                             }                      
                    ////////////////////////////////////
                }else{
                    alert("<axis:alt f="axisctr093" c="LIT_ALERT5" lit="1000421"/>");
                }
            }
        }  
function comparaFecha(fecha,fecha1){
var jDate = new JsFecha();
fecha.value=jDate.formateaFecha(fecha.value);
fec=fecha.value.split("/");
fec1=fecha1.split("-");
//alert("entro: comparo: " + fec[0] + "/ "+fec[1] + "/" + fec[2] + "con: "+fec1[2] + "/ "+fec1[1]+"/"+fec1[0]);
if(fec[0]>fec1[2])
{
//alert("mayor1");
}
else if(fec[0]<fec1[2])
{
alert("menor1");
}
else 
{
if(fec[1]>fec1[1])
{
alert("mayor2");
}
else if(fec[1]<fec1[1])
{
alert("menor2");
}
else 
{
if(fec[2]>fec1[0])
{
alert("mayor3");
}
else if(fec[2]<fec1[0])
{
alert("menor3");
}
else 
{
alert("IGUAL??");
}
}
}
}            
            function f_abrir_secciones(){
   // Desplegar la sección correspondiente si volvemos despues de editar_suplemento.
                <% 
                    if(request.getAttribute("SECACTIVA") != null){
                        java.util.List SECACTIVA = (java.util.List)request.getAttribute("SECACTIVA");
                        for(int i=0;i<SECACTIVA.size();i++){
                    %>      
                        var seccion = '<%=SECACTIVA.get(i)%>';
                        objEstilos.toggleDisplay(seccion, document.getElementById(seccion + "_parent"));
                 <% 
                        }
                    } %>   
                                     
                        objEstilos.toggleDisplay("DSP_DATOSTRASPASO", document.getElementById("DSP_DATOSTRASPASO_parent"));             
                        objEstilos.toggleDisplay("DSP_ORIDEST", document.getElementById("DSP_ORIDEST_parent"));                                                  
            
            }
            
            function mostrar(nombreCapa){ 
            //alert(nombreCapa);
            document.getElementById(nombreCapa).style.visibility="visible"; 
            } 
            
            function ocultar(nombreCapa){ 
            //alert(nombreCapa);
            document.getElementById(nombreCapa).style.visibility="hidden"; 
            } 
            
            function mostrar_ocultar(nombreCapa){ 
                if(document.getElementById(nombreCapa).style.visibility=="visible"){
                    document.getElementById(nombreCapa).style.visibility="hidden"; 
                }else{
                    document.getElementById(nombreCapa).style.visibility="visible"; 
                }
            } 
            function f_but_salir() {
                objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axisctr093", "cancelar", document.miForm, "_self");
            }
            
            function f_recargar()
              {
              var mensaje = "${__formdata.missatge_OK}";
                 //actualizarImportes();
                 objUtiles.ejecutarFormulario("axis_axisctr093.do?ACTUALIZA_DATOS=SI&MISS="+mensaje, "form", document.miForm, "_self", objJsMessages.jslit_cargando);
              }

            function f_actualitzar()
            {
                objUtiles.ejecutarFormulario("axis_axisctr093.do?ACTUALIZA_DATOS=NO", "form", document.miForm, "_self", objJsMessages.jslit_cargando);
            }
            
            function actualizarImportes()
            {
                try{
                    if (!objUtiles.estaVacio(document.miForm.IIMPORTE))
                        objDom.setValorPorId("IIMPORTE", objNumero.cambiarSeparadorDecimalesPorMiles(objDom.getValorPorId("IIMPORTE")));
                        //objDom.setValorPorId("IIMPORTE", objValidador.valorFormateadoCampoNumerico(objDom.getValorPorId("IIMPORTE"), true, true));              
                }catch(e){}
            }              
        
        function f_onclickCheckbox(thiss) {
        //alert("Valor checked??"+thiss.checked);
            if(thiss.checked){
                //alert("En uno");
                //document.miForm.tipo_listado.value=0;
                document.miForm.NCERTEXT.value='';
                document.miForm.CEXTERN.value=1;
                document.miForm.CCEXTERN.checked=true;
                objDom.setVisibilidadPorId("NCERTEXT", "hidden");
                objDom.setVisibilidadPorId("ICO_BUSCARPOLIZA", "hidden");
                //actualizarImportes();
                }
            else{
                 //alert("En dos");
                //document.miForm.tipo_listado.value=1;
                document.miForm.CEXTERN.value=0;
                document.miForm.CCEXTERN.checked=false;
                objDom.setVisibilidadPorId("NCERTEXT", "visible");
                objDom.setVisibilidadPorId("ICO_BUSCARPOLIZA", "visible");
                //actualizarImportes();
                }
            
        }         
      function f_onclickCheckbox2(thiss) {
            if(thiss.checked){ 
                //FONDO DE PENSIONES 
                
                objEstilos.toggleDisplay('J_PLAN', 'J_PLAN_parent');
                
                objDom.setVisibilidadPorId("CCOMPANI_DGS", "hidden");
                objDom.setVisibilidadPorId("CCOMPANI_L", "hidden");
                objDom.setVisibilidadPorId("TCOMPANI", "hidden");
                objDom.setVisibilidadPorId("ICO_CCOMPANI", "hidden");
                //document.miForm.CCOMPANI_DGS.value='';
                //document.miForm.CCOMPANI.value='';
                //document.miForm.TCOMPANI.value='';
                document.miForm.TPOLEXT.setAttribute("obligatorio",false);
                document.miForm.TPOLEXT.className="campowidthselect campo campotexto"; 



                }
            else{ 
                //COMPAÑIA
                
                objEstilos.toggleDisplay('J_PLAN', 'J_PLAN_parent');                         
                
                objDom.setVisibilidadPorId("CCOMPANI_DGS", "visible");
                objDom.setVisibilidadPorId("CCOMPANI_L", "visible");
                objDom.setVisibilidadPorId("TCOMPANI", "visible");
                objDom.setVisibilidadPorId("ICO_CCOMPANI", "visible");
                //         document.miForm.CCODPLA_TRASPAS.value='';
                //         document.miForm.CCODPLA.value='';
                //         document.miForm.TCODPLA_TRASPAS.value='';
                //         document.miForm.CCODFON_TRASPAS.value='';
                //         document.miForm.TCODFON_TRASPAS.value='';
                //         document.miForm.CCODGES_TRASPAS.value='';
                //         document.miForm.TCODGES_TRASPAS.value='';
                document.miForm.TPOLEXT.setAttribute("obligatorio","true");
                document.miForm.TPOLEXT.className="campowidthselect campo campotexto_ob";   

                
                        
               
                }
            
        }                 

            /****************************************************************************************/
            /************************************* MODALES ********************************************/
            /****************************************************************************************/
               
           
        function f_abrir_modal(cual, noXButton, optionalQueryString) {
						
             if (objUtiles.estaVacio(optionalQueryString))                
                optionalQueryString = "";
                
            objUtiles.abrirModal(cual, "src", "modal_" + cual + ".do?operation=form" + optionalQueryString);   
           
        }
        
        function f_cerrar_modal(cual) {
            objUtiles.cerrarModal(cual);
        }
        
        function f_aceptar_modal(cual, params) {
            f_cerrar_modal(cual);
        }
            /* IMPRESION */
            function f_but_100001() {
                objUtiles.abrirModal("axisimprimir", "src", "modal_axisimprimir.do?dt=<%=new java.util.Date().getTime()%>&operation=impresion_traspas&CSTRAPAS="+document.miForm.STRAS.value + "&CSSEGURO="+document.miForm.SSEGURO.value + "&CTIPO=TRAS");            
            }
            
             function f_cerrar_axisimprimir() {
             objUtiles.cerrarModal("axisimprimir");
             //actualizarImportes();
              objUtiles.ejecutarFormulario ("axis_axisctr093.do?ACTUALIZA_DATOS=SI", "form", document.miForm, "_self", objJsMessages.jslit_cargando);         
            }
            
            
            /* GEDOX */
            function f_but_gedox(NMOVIMI) {
                objUtiles.abrirModal("axisgedox", "src", 
                    "modal_axisgedox.do?dt=<%=new java.util.Date().getTime()%>&operation=form&SEGURO="+document.miForm.SSEGURO.value + "&NMOVIMI=" + NMOVIMI);
            }   
            function f_cerrar_axisgedox() {
                objUtiles.cerrarModal("axisgedox");
            }

            // Modal Buscador
            function f_abrir_axisctr092 () {
                 document.miForm.NUEVO.value = null;
                objUtiles.abrirModal("axisctr092", "src", "modal_axisctr092.do?operation=init&tipo=TRASPASO");
            }
            function f_cerrar_axisctr092() {
                objUtiles.cerrarModal("axisctr092");
            }   
            function f_aceptar_axisctr092 (SSEGURO,STRAS) {
                f_cerrar_axisctr092();
                document.miForm.SSEGURO.value=SSEGURO;
                document.miForm.STRAS.value=STRAS;
                //actualizarImportes();
                objUtiles.ejecutarFormulario ("axis_axisctr093.do?ACTUALIZA_DATOS=SI", "form", document.miForm, "_self", objJsMessages.jslit_cargando);     
            }
            function f_cerrar_axisctr106() {
                objUtiles.cerrarModal("axisctr106");
            }   
            function f_aceptar_axisctr106 (CCODDGS,CTIPBAN,CBANCAR) {
            
                f_cerrar_axisctr106();
                document.miForm.CCOMPANI_DGS.value=CCODDGS;
                document.miForm.CTIPBAN.value=CTIPBAN;
                document.miForm.CBANCAR.value=CBANCAR;
                f_onchange_cccompani(CCODDGS)
            }            
            
             
         // Modal Buscador
        function f_abrir_axisctr019 () {
            document.miForm.NUEVO.value = 1;
            objUtiles.abrirModal("axisctr019", "src", "modal_axisctr019.do?operation=form&tipo=TRASPASO");
        }
        function f_buscar_poliza_destino () {
            document.miForm.NUEVO.value = null;
            objUtiles.abrirModal("axisctr019", "src", "modal_axisctr019.do?operation=form&tipo=TRASPASO");
        }
        function f_cerrar_axisctr019() {
            objUtiles.cerrarModal("axisctr019");
        }   
        function f_aceptar_axisctr019 (SSEGURO) {
            f_cerrar_axisctr019();
            if (document.miForm.NUEVO.value == 1){
                /*** cuando hago nuevo Traspaso tras escoger poliza */
                document.miForm.SSEGURO.value=SSEGURO;
                document.miForm.STRAS.value='';
                document.miForm.NMOVIMI.value= -9999;//Le ponemos un valor imposible para conseguir que, al cambiar de pÃ³liza, salga siempre cargado el primer movimiento del multiregistro
                //actualizarImportes();
                objUtiles.ejecutarFormulario ("axis_axisctr093.do?ACTUALIZA_DATOS=SI&MODO=NUEVO_TRASPASO", "form", document.miForm, "_self", objJsMessages.jslit_cargando);     
            }else{ 
                /*** cuando busco la póliza destino dentro de los datos de traspaso */
                //actualizarImportes();
                objAjax.invokeAsyncCGI("axis_axisctr093.do?ACTUALIZA_DATOS=SI&SSEGURO_DESTINO="+SSEGURO, callbackAjaxPolizaDestino, "operation=ajax_poliza_destino", this, objJsMessages.jslit_cargando);
            }
            
        }
            
          /****************************************************************************************/
            /******************************* BOTONERA *****************************************/
            /****************************************************************************************/
            
            function f_but_9900785(){
               ////////antes de confirmar miro que todo OK pues lo voy a grabar antes////////////
                var NPORCEN=objDom.getValorPorId("NPORCEN");
                var IIMPTEMP=objDom.getValorPorId("IIMPTEMP");
                var NPARPLA=objDom.getValorPorId("NPARPLA");
                
                // RSC 18/05/2011
                //objDom.setValorPorId("CEXTERN", ((document.miForm.CEXTERN.checked)? "1" : "0"));
                if(document.miForm.CCEXTERN.checked){
                    document.miForm.CEXTERN.value=1;
                }else{
                    document.miForm.CEXTERN.value=0;
                }
                //FIN RSC 18/05/2011
                
                if (objValidador.validaEntrada()) { 
                    objUtiles.ejecutarFormulario ("axis_axisctr093.do?ACTUALIZA_DATOS=SI&CESTADO=" + document.miForm.CESTADO.value, "confirmar", document.miForm, "_self", objJsMessages.jslit_cargando);     
                }                                                           
            }
            function f_but_9900786(){

                //actualizarImportes();
                objUtiles.ejecutarFormulario ("axis_axisctr093.do", "demorar", document.miForm, "_self", objJsMessages.jslit_cargando);     

            }
            
            function f_but_9002020(){
                //actualizarImportes();
                objUtiles.ejecutarFormulario ("axis_axisctr093.do", "rechazar", document.miForm, "_self", objJsMessages.jslit_cargando);     
                
            }
            
            function f_but_110074(){
                if (document.miForm.CESTADO.value==1 ||document.miForm.CESTADO.value==2||document.miForm.CESTADO.value==8) 
                {
                //actualizarImportes();
                objUtiles.ejecutarFormulario ("axis_axisctr093.do", "anular", document.miForm, "_self", objJsMessages.jslit_cargando);     
                }
            }
            function f_but_gravar(){                

                
                var NPORCEN=objDom.getValorPorId("NPORCEN");
                var IIMPTEMP=objDom.getValorPorId("IIMPTEMP");
                var NPARPLA=objDom.getValorPorId("NPARPLA");
                
                //alert("En gravar: "+document.miForm.CCEXTERN.checked);
                
                if(document.miForm.CCEXTERN.checked){
                    document.miForm.CEXTERN.value=1;
                }else{
                    document.miForm.CEXTERN.value=0;
                }
                //objDom.setValorPorId("CEXTERN", ((document.miForm.CEXTERN.checked)? "1" : "0"));
               // alert(document.miForm.CEXTERN.value);
                    
                    if (objValidador.validaEntrada()) { 
                        //actualizarImportes();
                        objUtiles.ejecutarFormulario ("axis_axisctr093.do?ACTUALIZA_DATOS=SI&CESTADO=" + document.miForm.CESTADO.value, "grabar", document.miForm, "_self", objJsMessages.jslit_cargando);                             
                       }
            }
            
            function f_but_9900787(){
                //actualizarImportes();
                objUtiles.ejecutarFormulario ("axis_axisctr093.do", "desconfirmar", document.miForm, "_self", objJsMessages.jslit_cargando);     
                
            }
            function f_but_9900788(){

                //actualizarImportes();
                objUtiles.ejecutarFormulario ("axis_axisctr093.do?ACTUALIZA_DATOS=SI&CESTADO=" + document.miForm.CESTADO.value, "traspasar", document.miForm, "_self", objJsMessages.jslit_cargando);     
            }
            function f_but_9900789(){
                //actualizarImportes();
                objUtiles.ejecutarFormulario ("axis_axisctr093.do", "infoDatosFiscales", document.miForm, "_self", objJsMessages.jslit_cargando);
            }
            function f_abrir_axispen009(){
                objUtiles.abrirModal("axispen009", "src", "modal_axispen009.do?operation=form");
            }
            function f_aceptar_axispen009(CCODPLA, CCODFON, CCODGES){
            f_cerrar_modal("axispen009");
            //actualizarImportes();
            objAjax.invokeAsyncCGI("axis_axisctr093.do?ACTUALIZA_DATOS=SI&CCODPLATRASPAS="+CCODPLA, callbackAjaxTraspaso, "operation=ajax_ccodpla_traspas", this, objJsMessages.jslit_cargando);
               
            }
            function f_onchange_ccodpla(CCODPLA){
            //actualizarImportes();
            objAjax.invokeAsyncCGI("axis_axisctr093.do?CCODPLATRASPAS="+CCODPLA, callbackAjaxTraspaso, "operation=ajax_ccodpla_traspas", this, objJsMessages.jslit_cargando);               
            }
            
            function f_onchange_cccompani(CCOMPANI){
            //actualizarImportes();
            objAjax.invokeAsyncCGI("axis_axisctr093.do?CCOMPANI="+CCOMPANI, callbackAjaxCompania, "operation=ajax_ccompani_traspas", this, objJsMessages.jslit_cargando);
               
            }            
            
           
            /****************************************************************************************/
            /******************************* CALLBACKS AJAX *****************************************/        
            /****************************************************************************************/
             function callbackAjaxCompania (ajaxResponseText) {
            try{
                 objDom.setValorPorId("PTCOMPANI", "");   
                var doc = objAjax.domParse(ajaxResponseText);
                var elementos = doc.getElementsByTagName("element");
    
                   objDom.setValorPorId("CTIPBAN", ""); 
                   objDom.setValorPorId("CBANCAR", "");    

                   objDom.setValorPorId("CCOMPANI", "");     
                   objDom.setValorPorId("CTIPBAN", ""); 
                   objDom.setValorPorId("CBANCAR", "");                         
                
                
                if(!objAppMensajes.existenErroresEnAplicacion(doc))
                   {
                    var codigo = objDom.getValorNodoDelComponente(doc.getElementsByTagName("PCCOMPANI"), 0, 0);
                    
                    var NOMBRE_T = objDom.getValorNodoDelComponente(doc.getElementsByTagName("PTCOMPANI"), 0, 0);
                    objDom.setValorPorId("TCOMPANI", NOMBRE_T); 
                    
                    var CODI_CIA = objDom.getValorNodoDelComponente(doc.getElementsByTagName("PCCOMPANI"), 0, 0);
                    objDom.setValorPorId("CCOMPANI", CODI_CIA); 
                    
                    var TIPO_B = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("PCTIPBAN")[0]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("PCTIPBAN"), 0, 0) : "");
                    objDom.setValorPorId("CTIPBAN", TIPO_B); 
                    
                    var CUENTA = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("PCBANCAR")[0]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("PCBANCAR"), 0, 0) : "");
                    objDom.setValorPorId("CBANCAR", CUENTA);   
                   
                   }else{
                   objDom.setValorPorId("CCOMPANI_DGS", "");     
                   objDom.setValorPorId("CCOMPANI", ""); 
                   objDom.setValorPorId("TCOMPANI", "");     
                   objDom.setValorPorId("CTIPBAN", ""); 
                   objDom.setValorPorId("CBANCAR", "");                     
                   }
                }
                catch(e){
                }
            }   

             function callbackAjaxPolizaDestino (ajaxResponseText) {
            try{
                var doc = objAjax.domParse(ajaxResponseText);
                if (!objAppMensajes.existenErroresEnAplicacion(doc)) {   
                
                     objDom.setValorPorId("TPOLEXT", objDom.getValorNodoDelComponente(doc.getElementsByTagName("NPOLIZA"), 0, 0));
                     objDom.setValorPorId("NCERTEXT", objDom.getValorNodoDelComponente(doc.getElementsByTagName("NCERTIF"), 0, 0));
                     
                }
                }catch(e){}
            }            
            
             function callbackAjaxTraspaso (ajaxResponseText) {
            try{
            //alert(ajaxResponseText);
                var doc = objAjax.domParse(ajaxResponseText);
                var elementos = doc.getElementsByTagName("element");
                
                   objDom.setValorPorId("CTIPBAN", ""); 
                   objDom.setValorPorId("CBANCAR", "");  
                
                if (!objAppMensajes.existenErroresEnAplicacion(doc)) {                       
                     objDom.setValorPorId("CCODPLA", objDom.getValorNodoDelComponente(doc.getElementsByTagName("CCODPLA"), 0, 0));
                     objDom.setValorPorId("CCODPLA_TRASPAS", objDom.getValorNodoDelComponente(doc.getElementsByTagName("CODDGS"), 0, 0));
                     objDom.setValorPorId("TCODPLA_TRASPAS", objDom.getValorNodoDelComponente(doc.getElementsByTagName("TNOMPLA"), 0, 0));
                     objDom.setValorPorId("CCODFON_TRASPAS", objDom.getValorNodoDelComponente(doc.getElementsByTagName("CFONDGS"), 0, 0));
                     objDom.setValorPorId("TCODFON_TRASPAS", objDom.getValorNodoDelComponente(doc.getElementsByTagName("TFONDO"), 0, 0));
                     objDom.setValorPorId("CCODGES_TRASPAS", objDom.getValorNodoDelComponente(doc.getElementsByTagName("CGESDGS"), 0, 0));
                     objDom.setValorPorId("TCODGES_TRASPAS", objDom.getValorNodoDelComponente(doc.getElementsByTagName("TNOMGES"), 0, 0));                   
                     objDom.setValorPorId("CTIPBAN", objDom.getValorNodoDelComponente(doc.getElementsByTagName("CTIPBAN"), 0, 0));                   
                     objDom.setValorPorId("CBANCAR", objDom.getValorNodoDelComponente(doc.getElementsByTagName("CBANCAR"), 0, 0));                   
                     
                     }else{
                     objDom.setValorPorId("CCODPLA_TRASPAS", "");
                     objDom.setValorPorId("CCODPLA", "");
                     objDom.setValorPorId("TCODPLA_TRASPAS", "");
                     objDom.setValorPorId("CCODFON_TRASPAS", "");
                     objDom.setValorPorId("TCODFON_TRASPAS", "");
                     objDom.setValorPorId("CCODGES_TRASPAS", "");
                     objDom.setValorPorId("TCODGES_TRASPAS", "");                      
                     }
                }catch(e)    {                 
                   }      
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
            
            function ValidaPorcen (valor){
                var valorNumerico = objNumero.toDoNumberOperation(valor.value);
        
                if (!objUtiles.estaVacio(validarNumeros(valor.value))){
                    if (valorNumerico >=0&& valorNumerico <=100){
                        var result = 100-valorNumerico;
                        var StrResult = result + "     ";
                        StrResult = objNumero.toDoNumberView(StrResult);
                        document.miForm.PORCPOS2006.value=validarNumeros(StrResult.substr(0,6));
                    }
                    else{
                        document.miForm.PORCPOS2006.value='';
                 //     document.miForm.PORCANT2007.value='';
                    }
                    f_formatear(valor);
                }
                else{
                    valor.value = '';
                    document.miForm.PORCPOS2006.value='';
                }
            }
            
            function ValidaPorcen2006 (valor){
                var valorNumerico = objNumero.toDoNumberOperation(valor.value);
        
                if (!objUtiles.estaVacio(validarNumeros(valor.value))){
                    if (document.miForm.CTIPTRASSOL.value == 2){
                        if (valorNumerico >=0&& valorNumerico <=100){
                            var result = 100-valorNumerico;
                            var StrResult = result + "     ";
                            StrResult = objNumero.toDoNumberView(StrResult);
                            document.miForm.NPORCEN.value=validarNumeros(StrResult.substr(0,6));
                        }
                        else{
                            document.miForm.NPORCEN.value='';
                        }
                    }
                    f_formatear(valor);
                }
                else{
                    valor.value = '';
                    if (document.miForm.CTIPTRASSOL.value == 2){
                        document.miForm.NPORCEN.value='';
                    }
                }
            }
        
        
        </script>
    </head>
    <body onload="f_onload()">
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
        <form name="miForm" action="axis_axisctr093.do" method="POST">
            <input type="hidden" id="operation" name="operation" value="form"/>
            <input type="hidden" id="NRIESGO" name="NRIESGO" value="${__formdata.NRIESGO}"/>
            <input type="hidden" id="PFEFECTO" name="PFEFECTO" value="${__formdata.PFEFECTO}"/>
            <input type="hidden" id="NMOVIMI" name="NMOVIMI" value="${__formdata.NMOVIMI}"/>
            <input type="hidden" id="MODO" name="MODO" value="${__formdata.MODO}"/>
            <input type="hidden" id="SSEGURO" name="SSEGURO" value="${__formdata['SSEGURO']}" />
            <input type="hidden" id="STRAS" name="STRAS" value="${__formdata['STRAS']}" />
            <input type="hidden" id="CAGRPRO" name="CAGRPRO" value="${__formdata['CAGRPRO']}" />
            <input type="hidden" id="SPRODUC" name="SPRODUC" value="${__formdata['SPRODUC']}" />
            <input type="hidden" id="SECACTIVA" name="SECACTIVA" value="" />
            <input type="hidden" id="CEXTERN" name="CEXTERN" value="${__formdata['CEXTERN']}" />
            <input type="hidden" id="NUEVO" name="NUEVO" value="${__formdata.NUEVO}" />
            <input type="hidden" id="CCOMPANI" name="CCOMPANI" value="${__formdata.CCOMPANI}" />
            <input type="hidden" id="CCODPLA" name="CCODPLA" value="${__formdata.CCODPLA}" />
            <input type="hidden" id="SECACTIVA" name="SECACTIVA" value="" />
            <input type="hidden" id="FONDITO" name="FONDITO" value="" />
	    <input type="hidden" id="FHOY" name="FHOY" value="${__formdata.FHOY}" />
            <input type="hidden" id="RECHAZADO" name="RECHAZADO" value="" />
    
             <c:import url="../include/modal_estandar.jsp">
                <c:param name="nid_y_titulo">axisctr092|<axis:alt f="axisctr093" c="LIT_MODAL_AXISCTR092" lit="9900745" />#axisimprimir|<axis:alt f="axisctr093" c="LIT_MODAL_AXISGEDOX" lit="1000205" />|true#axisgedox|<axis:alt f="axisctr093" c="LIT_MODAL_AXISCTR019" lit="1000201" />#axisctr019|<axis:alt f="axisctr093" c="LIT_MODAL_AXISPEN009" lit="1000188" />#axispen009|<axis:alt f="axisctr093" c="LIT_MODAL_AXISPEN009_2" lit="9900880" /></c:param>
            </c:import>
            
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="nid_y_titulo">axisctr106|<axis:alt f="axisctr093" c="LIT_MODAL_AXISCTR106" lit="9900956" /></c:param>
            </c:import>  
            
             <c:import url="../include/titulo_nt.jsp">
                    <c:param name="modalidad"><axis:alt f="axisctr093" c="LIT_MODALIDAD" lit="109232" /></c:param>
                    <c:param name="formulario"><axis:alt f="axisctr093" c="LIT_MODALIDAD" lit="109232" /></c:param>
                    <c:param name="form">axisctr093</c:param>
            </c:import>
            <!-- Area de campos  -->
            <div class="separador">&nbsp;</div>
            <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
                 
                <c:import url="axisctr093_a.jsp"/>
                <c:import url="axisctr093_b.jsp"/>
                </table>
                    </td>
                </tr>
            </table>
        </form>        
         <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisctr093</c:param><c:param name="f">axisctr093</c:param>
                <c:param name="f">axisctr093</c:param>
                <c:param name="__botones">salir<c:if test="${!empty __formdata.STRAS&&datos_poliza.CSITUAC!=2}">,9900785</c:if><c:if test="${!empty __formdata.STRAS}">,9900786</c:if><c:if test="${!empty __formdata.STRAS}">,9002020</c:if><c:if test="${!empty __formdata.STRAS}">,110074</c:if><c:if test="${datos_poliza.CSITUAC!=2}">,gravar</c:if><c:if test="${!empty __formdata.STRAS}">,9900787</c:if><c:if test="${!empty __formdata.STRAS && empty datos_poliza.TRETENI && datos_poliza.CSITUAC!=2}">,9900788</c:if><c:if test="${!empty __formdata.STRAS}">,9900789</c:if><c:if test="${!empty __formdata.STRAS}">,100001</c:if>
                </c:param>
        </c:import>
        <script type="text/javascript">
    Calendar.setup({
        inputField     :    "FSOLICI",     
        ifFormat       :    "%d/%m/%Y",      
        button         :    "popup_calendario_FSOLICI",  
        singleClick    :    true,
        firstDay       :    1
    });
    Calendar.setup({
        inputField     :    "FEFECTO",     
        ifFormat       :    "%d/%m/%Y",      
        button         :    "popup_calendario_FEFECTO",  
        singleClick    :    true,
        firstDay       :    1
    });
    Calendar.setup({
        inputField     :    "FVALOR",     
        ifFormat       :    "%d/%m/%Y",      
        button         :    "popup_calendario_FVALOR",  
        singleClick    :    true,
        firstDay       :    1
    });
     Calendar.setup({
        inputField     :    "FANTIGI",     
        ifFormat       :    "%d/%m/%Y",      
        button         :    "popup_calendario_FANTIGI",  
        singleClick    :    true,
        firstDay       :    1
    });
    Calendar.setup({
        inputField     :    "FCONTING",     
        ifFormat       :    "%d/%m/%Y",      
        button         :    "popup_calendario_FCONTIG",  
        singleClick    :    true,
        firstDay       :    1
    });
    Calendar.setup({
        inputField     :    "FABONOCAP",     
        ifFormat       :    "%d/%m/%Y",      
        button         :    "popup_calendario_FABONOCAP",  
        singleClick    :    true,
        firstDay       :    1
    });
    </script>
        <c:import url="../include/mensajes.jsp"/>
    </body>
    
</html>