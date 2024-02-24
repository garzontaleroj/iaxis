<%/**
*  Fichero: axisrea038.jsp (modal)
*  Manteniment de comptes tècniques 
*/
%>
<%@ page contentType="text/html;charset=windows-1252"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>    

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
    <head>
        <title><axis:alt f="axisrea038" c="TITULO" lit="9001844"/></title> <!--Gestió Transferències-->
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
        
        function f_onload() {
            
            CEMPRES = "${__formdata.CEMPRES}";
            // INI - AXIS 4624 - 12/07/2019 - AABG - SE SETEA EL VALOR MONCON PARA CAMBIO VISUAL
            var MONCON = "${__formdata.ISALDO_MONCON}";
            objDom.setValorPorId('ISALDO_MONCON',MONCON);
            // FIN - AXIS 4624 - 12/07/2019 - AABG - SE SETEA EL VALOR MONCON PARA CAMBIO VISUAL
            
            var ok = "${ok}";
                if(!objUtiles.estaVacio(ok)){
                        parent.f_aceptar_axisrea038(document.miForm.CAGENTE.value);
                }
            f_cargar_propiedades_pantalla();
              
        }
              
         /*   function f_aceptar_axisrea037(CAGENTE, TAGENTE){
                objUtiles.cerrarModal("axisrea037");
                document.miForm.CAGENTE.value = CAGENTE;
                document.miForm.TAGENTE.value = TAGENTE;
                objUtiles.ejecutarFormulario ("axis_axisrea038.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);    
                
            }
            
             function f_seleccionar_registro(CEMPRES,CTRAMO,CCOMPANI,SCONTRA,NVERSIO,SPRODUC,FCIERRE){
                objUtiles.cerrarModal("axisrea037");
                document.miForm.CEMPRES_SEL.value = CEMPRES;
                document.miForm.CTRAMO_SEL.value = CTRAMO;
                document.miForm.CCOMPANI_SEL.value = CCOMPANI;
                document.miForm.SCONTRA_SEL.value = SCONTRA;
                document.miForm.NVERSIO_SEL.value = NVERSIO;
                document.miForm.SPRODUC_SEL.value = SPRODUC;
                document.miForm.FCIERRE_SEL.value = FCIERRE;
                objUtiles.ejecutarFormulario ("axis_axisrea038.do", "cargar", document.miForm, "_self", objJsMessages.jslit_cargando);    
                
            }
            
            function f_abrir_axisrea037(){
                objUtiles.abrirModal("axisrea037","src","modal_axisrea037.do?operation=form");
            }  */
            
            //INI - AXIS 4624 - 11/07/2019 - AABG - SE AGREGA NUEVO ATRIBUTO POLIZA, SINIESTRO
            function f_borrar_cta(NNUMLIN, CCONCEP, NPOLIZA, NSINIESTRO){
             var answer = confirm(objJsMessages.jslit_confirma_borrar);
            if (answer){
               objUtiles.ejecutarFormulario ("modal_axisrea038.do?NNUMLIN_SEL="+NNUMLIN+"&CCONCEP_SEL="+CCONCEP+"&NPOLIZA_DEL="+NPOLIZA+"&NSINIES_DEL="+NSINIESTRO, "delete", document.miForm, "_self", objJsMessages.jslit_cargando);    
               }
            }
            //FIN - AXIS 4624 - 11/07/2019 - AABG - SE AGREGA NUEVO ATRIBUTO POLIZA, SINIESTRO

            function f_gestion_linea(PMODO,NNUMLIN){
                params = "&NNUMLIN="+NNUMLIN+"&CEMPRES="+document.miForm.CEMPRES.value+"&CAGENTE="+document.miForm.BROKER.value;
                objUtiles.abrirModal("axisrea039","src","modal_axisrea039.do?operation=init&PMODO="+PMODO+params);
            }
            
            function f_alta_mov(){
               
                var CEMPRES = document.miForm.CEMPRES.value;
                var TEMPRES = document.miForm.TEMPRES.value;
                var CCOMPANI = document.miForm.CCOMPANI.value;
                var TCOMPANI = document.miForm.TCOMPANI.value;
                var NVERSIO = document.miForm.NVERSIO.value;
                var SCONTRA = document.miForm.SCONTRA.value;
                var TCONTRA = document.miForm.TCONTRA.value;
                var CTRAMO = document.miForm.CTRAMO.value;
                var TTRAMO = document.miForm.TTRAMO.value;
                var BROKER = document.miForm.BROKER.value;
                var TCCORRED = document.miForm.TCCORRED.value;
                var SPRODUC = document.miForm.SPRODUC.value;
                var TPRODUC = document.miForm.TPRODUC.value;
                var FCIERRE = document.miForm.FCIERRE.value;
                var TMONEDA = document.miForm.TMONEDA_SEL.value;
                var COMPANIA = document.miForm.COMPANIA.value;
                params = "&CEMPRES="+CEMPRES+"&CCOMPANI="+CCOMPANI+"&NVERSIO="+NVERSIO+"&SCONTRA="+SCONTRA+"&CTRAMO="+CTRAMO+"&SPRODUC="+SPRODUC+"&FMOVIMI="+FCIERRE+"&TEMPRES="+TEMPRES+"&TCOMPANI="+TCOMPANI+"&TCONTRA="+TCONTRA+"&TTRAMO="+TTRAMO+"&TCCORRED="+TCCORRED+"&TPRODUC="+TPRODUC+"&TMONEDA="+TMONEDA+"&COMPANIA="+COMPANIA;
                objUtiles.abrirModal("axisrea039","src","modal_axisrea039.do?operation=init&CMODO=1"+params); //Modo alta=1
            }
            
            
            function f_mod_linea(NNUMLIN,CDEBHAB,CCONCEP,NVERSIO,FCIERRE,IMPORTE,TDOCUME,TDESCRI,CESTADO,TMONEDA,SPRODUC,CTIPMOV,NPOLIZA,NCERTIF,NSINIES,SIDEPAG){
                var NNUMLIN = NNUMLIN; // NUM DE LINEA
                var CDEBHAB = CDEBHAB; // CODIGO DEBE HABER de LINEA
                var CCONCEP = CCONCEP; // CODIGO DEBE HABER de LINEA
                var CEMPRES = document.miForm.CEMPRES.value;
                var TEMPRES = document.miForm.TEMPRES.value;
                var CCOMPANI = document.miForm.CCOMPANI.value;
                var TCOMPANI = document.miForm.TCOMPANI.value;
                var NVERSIO = NVERSIO; //NVERSIO DE LINEA
                var SCONTRA = document.miForm.SCONTRA.value;
                var TCONTRA = document.miForm.TCONTRA.value;
                var CTRAMO = document.miForm.CTRAMO.value;
                var TTRAMO = document.miForm.TTRAMO.value;
                var BROKER = document.miForm.BROKER.value;
                var TCCORRED = document.miForm.TCCORRED.value;
                var SPRODUC = document.miForm.SPRODUC.value;
                var TPRODUC = document.miForm.TPRODUC.value;
                var COMPANIA = document.miForm.COMPANIA.value;
                var FCIERRE = FCIERRE; //FCIERRE de la línea
                var IIMPORT = IMPORTE;
                //RCL - BUG 27322 / 146701
                var TDOCUME = escape(TDOCUME);
                var TDESCRIP = escape(TDESCRI);
                var CESTADO = CESTADO;
                var TMONEDA = TMONEDA;
                var SPRODUC = SPRODUC;
                var NPOLIZA = NPOLIZA;
                var NCERTIF = NCERTIF;
                var NSINIES = NSINIES;
                var SIDEPAG = SIDEPAG;
                params = "&CEMPRES="+CEMPRES+"&CCOMPANI="+CCOMPANI+"&NVERSIO="+NVERSIO+"&SCONTRA="+SCONTRA+"&CTRAMO="+CTRAMO+"&SPRODUC="+SPRODUC+"&FMOVIMI="+FCIERRE;
                params = params + "&TEMPRES="+TEMPRES+"&TCOMPANI="+TCOMPANI+"&TCONTRA="+TCONTRA+"&TTRAMO="+TTRAMO+"&TCCORRED="+TCCORRED+"&TPRODUC="+TPRODUC+"&CCONCEPTO="+CCONCEP;
                params = params + "&NNUMLIN="+NNUMLIN+"&CDEBHAB="+CDEBHAB+"&IIMPORT="+IIMPORT+"&TDOCUME="+TDOCUME+"&TDESCRIP="+TDESCRIP+"&CESTADO="+CESTADO+"&TMONEDA="+TMONEDA;
                params = params + "&CTIPMOV="+CTIPMOV+"&NPOLIZA="+NPOLIZA+"&NCERTIF="+NCERTIF+"&NSINIES="+NSINIES+"&SIDEPAG="+SIDEPAG+"&COMPANIA="+COMPANIA;
                
                objUtiles.abrirModal("axisrea039","src","modal_axisrea039.do?operation=init&CMODO=0"+params); //Modo modificacion=0
            }
            
            function f_consulta_linea(NNUMLIN,CDEBHAB,CCONCEP,NVERSIO,FCIERRE,IMPORTE,TDOCUME,TDESCRI,CESTADO,TMONEDA,SPRODUC,CTIPMOV,NPOLIZA,NCERTIF,NSINIES,SIDEPAG){
                var NNUMLIN = NNUMLIN; // NUM DE LINEA
                var CDEBHAB = CDEBHAB; // CODIGO DEBE HABER de LINEA
                var CCONCEP = CCONCEP;
                var CEMPRES = document.miForm.CEMPRES.value;
                var TEMPRES = document.miForm.TEMPRES.value;
                var CCOMPANI = document.miForm.CCOMPANI.value;
                var TCOMPANI = document.miForm.TCOMPANI.value;
                var NVERSIO = NVERSIO; //NVERSIO DE LINEA
                var SCONTRA = document.miForm.SCONTRA.value;
                var TCONTRA = document.miForm.TCONTRA.value;
                var CTRAMO = document.miForm.CTRAMO.value;
                var TTRAMO = document.miForm.TTRAMO.value;
                var BROKER = document.miForm.BROKER.value;
                var TCCORRED = document.miForm.TCCORRED.value;
                var SPRODUC = document.miForm.SPRODUC.value;
                var TPRODUC = document.miForm.TPRODUC.value;
                var FCIERRE = FCIERRE; //FCIERRE de la línea
                var IIMPORT = IMPORTE;
                //RCL - BUG 27322 / 146701
                var TDOCUME = escape(TDOCUME);
                var TDESCRIP = escape(TDESCRI);
                var CESTADO = CESTADO;
                var TMONEDA = TMONEDA;
                var SPRODUC = SPRODUC;
                var NPOLIZA = NPOLIZA;
                var NCERTIF = NCERTIF;
                var NSINIES = NSINIES;
                var SIDEPAG = SIDEPAG;
                params = "&CEMPRES="+CEMPRES+"&CCOMPANI="+CCOMPANI+"&NVERSIO="+NVERSIO+"&SCONTRA="+SCONTRA+"&CTRAMO="+CTRAMO+"&SPRODUC="+SPRODUC+"&FMOVIMI="+FCIERRE;
                params = params + "&TEMPRES="+TEMPRES+"&TCOMPANI="+TCOMPANI+"&TCONTRA="+TCONTRA+"&TTRAMO="+TTRAMO+"&TCCORRED="+TCCORRED+"&TPRODUC="+TPRODUC+"&CCONCEPTO="+CCONCEP;
                params = params + "&NNUMLIN="+NNUMLIN+"&CDEBHAB="+CDEBHAB+"&IIMPORT="+IIMPORT+"&TDOCUME="+TDOCUME+"&TDESCRIP="+TDESCRIP+"&CESTADO="+CESTADO+"&TMONEDA="+TMONEDA;
                params = params + "&CTIPMOV="+CTIPMOV+"&NPOLIZA="+NPOLIZA+"&NCERTIF="+NCERTIF+"&NSINIES="+NSINIES+"&SIDEPAG="+SIDEPAG;
                
                objUtiles.abrirModal("axisrea039","src","modal_axisrea039.do?operation=init&CMODO=2"+params); //Modo consulta=2
            }
            
            
            function f_cerrar_axisrea039(){
                objUtiles.cerrarModal("axisrea039");
                document.miForm.FCIERRE_SEL.value = document.miForm.FCIERRE.value;
                objUtiles.ejecutarFormulario ("modal_axisrea038.do", "cargar", document.miForm, "_self", objJsMessages.jslit_cargando);    
            }
            
            
             function f_but_9001771(){
                objUtiles.cerrarModal("axisrea039");
                document.miForm.FCIERRE_SEL.value = document.miForm.FCIERRE.value;
                objUtiles.ejecutarFormulario ("modal_axisrea038.do", "liquidar", document.miForm, "_self", objJsMessages.jslit_cargando);    
            }
            
             function f_but_delete_linea(){
                objUtiles.cerrarModal("axisrea039");
                document.miForm.FCIERRE_SEL.value = document.miForm.FCIERRE.value;
                objUtiles.ejecutarFormulario ("modal_axisrea038.do", "delete", document.miForm, "_self", objJsMessages.jslit_cargando);    
            }
            
            function f_aceptar_axisrea039(){
                f_cerrar_axisrea039();
            }
            
      
            function f_but_salir() {
                //objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axisrea038", "cancelar", document.miForm, "_self");
                parent.f_cerrar_axisrea038();
            } 
            
            function f_cerrar_axisrea037(){
                objUtiles.cerrarModal("axisrea037");
            }
            
            function mostrar(nombreCapa){ 
            //alert(nombreCapa);
                document.getElementById(nombreCapa).style.visibility="visible"; 
            } 
            
            function ocultar(nombreCapa){ 
            //alert(nombreCapa);
                document.getElementById(nombreCapa).style.visibility="hidden"; 
            } 
            
            
            function actualizar_importes(total_filas, i)
            {
               /*var elementos = "";

               for(var j=0;j<total_filas;j++){
                    //alert("document.miForm.num_linea_"+j+".checked");
                    var valor = eval("document.miForm.num_reg_"+j+".checked");
                    //alert("VALOR TRUE OR FALSE"+valor);
                    var obtenido = valor?"1":"0";
                    //alert("valor: "+obtenido+" de fila: "+j);
                    if(obtenido=='1'){
                       elementos = elementos+j+"x";
                    }
               }
              alert("Suma: total: ************************************* :"+elementos);
              objUtiles.ejecutarFormulario ("axis_axisrea038.do?CADENA_VALORES="+elementos, "recargar_pantalla", document.miForm, "_self", objJsMessages.jslit_cargando);    
             */
           
            
            }
            
            function f_but_aceptar(){   
                var multiRegistro = "${fn:escapeXml(__formdata.listaCta)}"; //Indica el número de tomadores
                var tamanyolista=0;
                
                    if(!objUtiles.estaVacio(multiRegistro)){
                         tamanyolista =   "${ empty __formdata.listaCta ? 0 : fn:length(__formdata.listaCta)}";
                    }
                   var elementosNS=""; //Elementos no seleccionados
                   var elementosS=""; //Elementos seleccionados
                   for(var j=0;j<tamanyolista;j++){
                        var check = eval("document.miForm.num_reg_"+j);
                        if (check!=null) {
                            var valor = eval("document.miForm.num_reg_"+j+".checked");
                            var obtenido = valor?"1":"0";
                            if(obtenido=='0'){  //Obtenemos los no seleccionados
                                elementosNS = elementosNS+j+"x";
                            }else{
                                elementosS = elementosS+j+"x";
                            }
                        }
                   }
                objUtiles.ejecutarFormulario ("modal_axisrea038.do?CADENA_VALORES_NS="+elementosNS+"&CADENA_VALORES_S="+elementosS , "aceptar", document.miForm, "_self", objJsMessages.jslit_cargando);    
             
            
            }
            
            function actualitzarConceptos(value) {
                var check = ((objDom.getComponenteMarcado(value)) ? "1" : "0");
                objUtiles.ejecutarFormulario ("modal_axisrea038.do?VER_TODOS="+check, "cargar", document.miForm, "_self", objJsMessages.jslit_cargando);    
            }
         
        </script>
    </head>
    
    <body onload="f_onload()">
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
        <form name="miForm" action="" method="POST">
        <input type="hidden" name="operation" value=""/>
             
        <input type="hidden" name="CEMPRES_SEL" id="CEMPRES_SEL" value="${__formdata.CEMPRES_SEL}" />
        <input type="hidden" name="CTRAMO_SEL"  id="CTRAMO_SEL" value="${__formdata.CTRAMO_SEL}" />
        <input type="hidden" name="CCOMPANI_SEL" id="CCOMPANI_SEL" value="${__formdata.CCOMPANI_SEL}" />
        <input type="hidden" name="SCONTRA_SEL" id="SCONTRA_SEL" value="${__formdata.SCONTRA_SEL}" />
        <input type="hidden" name="NVERSIO_SEL" id="NVERSIO_SEL" value="${__formdata.NVERSIO_SEL}" />
        <input type="hidden" name="SPRODUC_SEL" id="SPRODUC_SEL" value="${__formdata.SPRODUC_SEL}" />
        <input type="hidden" name="FCIERRE_SEL" id="FCIERRE_SEL" value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FCIERRE}"/>"/>
        <input type="hidden" name="CESTADO_SEL"  id="CESTADO_SEL" value="${__formdata.CESTADO_SEL}" />
        <input type="hidden" name="NPOLIZA_SEL"  id="NPOLIZA_SEL" value="${__formdata.NPOLIZA_SEL}" />
        <input type="hidden" name="TMONEDA_SEL"  id="TMONEDA_SEL" value="${__formdata.TMONEDA_SEL}" />
        <input type="hidden" name="CEMPRES" id="CEMPRES" value="${__formdata.CEMPRES}" />
        <input type="hidden" name="CCOMPANI" id="CCOMPANI" value="${__formdata.CCOMPANI}" />
        <input type="hidden" name="SCONTRA" id="SCONTRA" value="${__formdata.SCONTRA}" />
        <input type="hidden" name="BROKER" id="BROKER" value="${__formdata.BROKER}" />
        <input type="hidden" name="CAGENTE" id="CAGENTE" value="${__formdata.BROKER}" />
        <input type="hidden" name="SPRODUC" id="SPRODUC" value="${__formdata.SPRODUC}" />
        <input type="hidden" name="CTRAMO" id="CTRAMO" value="${__formdata.CTRAMO}" />
        <input type="hidden" name="COMPANIA" id="COMPANIA" value="${__formdata.COMPANIA}" />
        <input type="hidden" name="SPAGREA" id="SPAGREA" value="${__formdata.SPAGREA}" />
        <input type="hidden" name="CHECK_VER_TODOS" id="CHECK_VER_TODOS" value="${__formdata.CHECK_VER_TODOS}" />
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="titulo"><axis:alt f="axisrea038" c="TIT_REA038" lit="9001941" /></c:param>
                <c:param name="form">axisrea038</c:param>
            </c:import>
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt f="axisrea038" c="TIT_037" lit="104907" /></c:param>
                <c:param name="nid" value="axisrea037" />
           </c:import>
           <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt f="axisrea038" c="TIT_039" lit="9001947" /></c:param>
                <c:param name="nid" value="axisrea039" />
           </c:import>
           
        <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td>
                  <table class="seccion">
                      <tr>
                        <td>
                        
                        
                          <table class="area" align="center">
                             <tr>
                                <th style="width:11%;height:0px"></th>
                                <th style="width:11%;height:0px"></th>
                                <th style="width:11%;height:0px"></th>
                                <th style="width:11%;height:0px"></th>
                                <th style="width:11%;height:0px"></th>
                                <th style="width:11%;height:0px"></th>
                                <th style="width:11%;height:0px"></th>
                                <th style="width:11%;height:0px"></th>
                                <th style="width:11%;height:0px"></th>
                                
                            </tr>
                                    <tr>
                                        <td class = "campocaja" colspan="11" >
                                            <div class="separador">&nbsp;</div>     
                                            <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axisrea038" c="TIT" lit="9903039"/>
                                          
                                        </td>
                                     </tr>

                                     <tr>
                                         <axis:ocultar f="axisrea038" c="TEMPRES" dejarHueco="false">   
                                             <td  class = "titulocaja">
                                               <b><axis:alt f="axisrea038" c="TEMPRES" lit="101619" /></b>
                                             </td>
                                         </axis:ocultar>    
                                         <axis:ocultar f="axisrea038" c="SPRODUC" dejarHueco="false">   
                                             <td  class = "titulocaja">
                                               <b><axis:alt f="axisrea038" c="SPRODUC" lit="9902909" /></b>
                                             </td>
                                         </axis:ocultar>  
                                         <axis:ocultar f="axisrea038" c="TCOMPANI" dejarHueco="false">   
                                             <td  class = "titulocaja">
                                               <b><axis:alt f="axisrea038" c="TCOMPANI" lit="9903030" /></b>
                                             </td>
                                         </axis:ocultar>    
                                         <axis:ocultar f="axisrea038" c="TCONTRA" dejarHueco="false">   
                                             <td  class = "titulocaja">
                                               <b><axis:alt f="axisrea038" c="TCONTRA" lit="9001894" /></b>
                                             </td>         
                                         </axis:ocultar>        
                                         <axis:ocultar f="axisrea038" c="NVERSIO" dejarHueco="false">   
                                             <td  class = "titulocaja">
                                               <b><axis:alt f="axisrea038" c="NVERSIO" lit="9001146" /></b>
                                             </td>
                                         </axis:ocultar>        
                                         <axis:ocultar f="axisrea038" c="NTRAMO" dejarHueco="false">   
                                             <td  class = "titulocaja">
                                               <b><axis:alt f="axisrea038" c="NTRAMO" lit="9000609" /></b>
                                             </td>         
                                         </axis:ocultar>        
                                         <axis:ocultar f="axisrea038" c="TCCORRED" dejarHueco="false">   
                                             <td  class = "titulocaja">
                                               <b><axis:alt f="axisrea038" c="TCCORRED" lit="9000752" /></b>
                                             </td>         
                                         </axis:ocultar>
                                          <axis:ocultar f="axisrea038" c="FCIERRE" dejarHueco="false">   
                                             <td  class = "titulocaja">
                                               <b><axis:alt f="axisrea038" c="FCIERRE" lit="9000490" /></b>
                                             </td>         
                                         </axis:ocultar> 
                                         <axis:ocultar f="axisrea038" c="ISALDO" dejarHueco="false">   
                                             <td  class = "titulocaja">
                                               <b><axis:alt f="axisrea038" c="ISALDO" lit="9001942" /></b>
                                             </td>         
                                         </axis:ocultar> 
                                     </tr>

                                     <tr>
                                         <axis:ocultar f="axisrea038" c="TEMPRES" dejarHueco="false">   
                                            <td class = "campocaja" >
                                                <input type="text" class="campo campotexto" size="15" value="${__formdata.TEMPRES}" name="TEMPRES" id="TEMPRES"
                                                 title="<axis:alt f="axisrea038" c="TEMPRES" lit="101619"/>" <axis:atr f="axisrea038" c="TEMPRES" a="modificable=false"/> />
                                            </td>
                                         </axis:ocultar> 
                                         <axis:ocultar f="axisrea038" c="TPRODUC" dejarHueco="false">   
                                            <td class = "campocaja" >
                                                <input type="text" class="campo campotexto" size="15" value="${__formdata.TPRODUC}" name="TPRODUC" id="TPRODUC"
                                                 title="<axis:alt f="axisrea038" c="SPRODUC" lit="9902909" />" <axis:atr f="axisrea038" c="TPRODUC" a="modificable=false"/> />
                                            </td>
                                         </axis:ocultar> 
                                         <axis:ocultar f="axisrea038" c="TCOMPANI" dejarHueco="false">                                           
                                             <td class = "campocaja" >
                                                <input type="text" class="campo campotexto" size="15" value="${__formdata.TCOMPANI}" name="TCOMPANI" id="TCOMPANI"
                                                 title="<axis:alt f="axisrea038" c="TCOMPANI" lit="9903030" />" <axis:atr f="axisrea038" c="TCOMPANI" a="modificable=false"/> />
                                             </td>
                                         </axis:ocultar> 
                                         <axis:ocultar f="axisrea038" c="TCONTRA" dejarHueco="false">                                           
                                             <td class = "campocaja" >
                                                <input type="text" class="campo campotexto" size="15" value="${__formdata.TCONTRA}" name="TCONTRA" id="TCONTRA"
                                                 title="<axis:alt f="axisrea038" c="TCONTRA" lit="9001894" />" <axis:atr f="axisrea038" c="TCONTRA" a="modificable=false"/> />
                                             </td>
                                         </axis:ocultar>    
                                         <axis:ocultar f="axisrea038" c="NVERSIO" dejarHueco="false">                                           
                                             <td class = "campocaja" >
                                                <input type="text" class="campo campotexto" size="15" value="${__formdata.NVERSIO}" name="NVERSIO" id="NVERSIO"
                                                 title="<axis:alt f="axisrea038" c="NVERSIO" lit="9001146" />" <axis:atr f="axisrea038" c="NVERSIO" a="modificable=false"/> />
                                             </td>
                                         </axis:ocultar>    
                                         <axis:ocultar f="axisrea038" c="TTRAMO" dejarHueco="false">                                           
                                             <td class = "campocaja" >
                                                <input type="text" class="campo campotexto" size="15" value="${__formdata.TTRAMO}" name="TTRAMO" id="TTRAMO"
                                                 title="<axis:alt f="axisrea038" c="NTRAMO" lit="9000609" />" <axis:atr f="axisrea038" c="TTRAMO" a="modificable=false"/> />
                                             </td>
                                         </axis:ocultar> 
                                         <axis:ocultar f="axisrea038" c="TCCORRED" dejarHueco="false">                                           
                                             <td class = "campocaja" >
                                                <input type="text" class="campo campotexto" size="15" value="${__formdata.TCCORRED}" name="TCCORRED" id="TCCORRED"
                                                 title="<axis:alt f="axisrea038" c="TCCORRED" lit="9000752" />" <axis:atr f="axisrea038" c="TCCORRED" a="modificable=false"/> />
                                             </td>
                                         </axis:ocultar>
                                         <axis:ocultar f="axisrea038" c="FCIERRE" dejarHueco="false">                                           
                                             <td class = "campocaja" >
                                                <input type="text" class="campo campotexto" size="15" value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FCIERRE}"/>" name="FCIERRE" id="FCIERRE"
                                                 title="<axis:alt f="axisrea038" c="FCIERRE" lit="9000490" />" <axis:atr f="axisrea038" c="FCIERRE" a="modificable=false"/> />
                                             </td>
                                         </axis:ocultar>
                                         
                                         <axis:ocultar f="axisrea038" c="ISALDO" dejarHueco="false">                                           
                                             <td class = "campocaja" >
                                                <input type="text" class="campo campotexto" size="15" value="<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${__formdata.ISALDO}"/>" name="ISALDO" id="ISALDO"
                                                 title="<axis:alt f="axisrea038" c="ISALDO" lit="9001942" />" <axis:atr f="axisrea038" c="ISALDO" a="modificable=false"/> />
                                             </td>
                                         </axis:ocultar> 
                                    </tr>

                                    <tr>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                           
                                        <axis:ocultar f="axisrea038" c="ISALDO_MONCON" dejarHueco="false">   
                                             <td  class = "titulocaja" colspan="2">
                                               <b><axis:alt f="axisrea038" c="ISALDO_MONCON" lit="9903052" /></b>
                                             </td>         
                                        </axis:ocultar> 
                                    </tr>
                                     
                                      
                                    <tr>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                     
                                        <axis:ocultar f="axisrea038" c="ISALDO_MONCON" dejarHueco="false">                                           
                                             <td class = "campocaja" colspan="2" >
                                                <input type="text" class="campo campotexto" size="15" value="<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${__formdata.ISALDO_MONCON}"/>" name="ISALDO_MONCON" id="ISALDO_MONCON"
                                                 title="<axis:alt f="axisrea038" c="ISALDO_MONCON" lit="9903052" />" <axis:atr f="axisrea038" c="ISALDO_MONCON" a="modificable=false"/> />
                                             </td>
                                         </axis:ocultar> 
                                    </tr>
                                      
                                    <tr>
                                        <td class = "campocaja" colspan="9" >
                                            <axis:visible f="axisrea038" c="ALTA_CTATEC">
                                                <c:if test="${__formdata.CEMPRES == 17}"> <!-- Solo para POSITIVA -->
                                                    <input type="checkbox"
                                                           <c:if test="${__formdata.CHECK_VER_TODOS == 1}">checked</c:if>
                                                           onClick="javascript:actualitzarConceptos(this)">
                                                           <b><axis:alt f="axisrea038" c="CHECK_VER_TODOS_CONCEP" lit="9906739" /></b>
                                                    </input>
                                                </c:if>
                                                <div class="separador">&nbsp;</div>  
                                              
                                                  <div class="titulo">
                                                  <div style="float:left;">
                                                  <img src="images/flecha.gif"/>
                                                  <axis:alt f="axisrea038" c="ALTA" lit="105050"/>
                                                  </div>
                                                 <div style="float:right;">
                                                        <a href="javascript:f_alta_mov()">  <img border="0" title="<axis:alt c="form_lit" f="axisrea038" lit="1000428"/>" src="images/new.gif"/></a>
                                                  </div>
                                                </div>
                                            </axis:visible>
                                        </td>
                                     </tr>
                                     <axis:ocultar f="axisrea038" c="DSP_CUENTAS" dejarHueco="false">   
                                         
                                         <tr>
                                            <td class = "campocaja" colspan="9">
                                            
                                            <c:set var="title0"><axis:alt f="axisrea038" c="NNUMLIN" lit="9001727"/></c:set>
                                            <c:set var="title1"><axis:alt f="axisrea038" c="TIPOLIN" lit="100565"/></c:set>
                                            <c:set var="title2"><axis:alt f="axisrea038" c="TIT2" lit="100562"/></c:set>
                                            <c:set var="title3"><axis:alt f="axisrea038" c="TESTADO" lit="100587"/></c:set>
                                            <c:set var="title4"><axis:alt f="axisrea038" c="CONCEPTO" lit="9000715"/></c:set>
                                            <c:set var="title5"><axis:alt f="axisrea038" c="IDEBE" lit="9000499"/></c:set>
                                            <c:set var="title6"><axis:alt f="axisrea038" c="IHABER" lit="9000500"/></c:set>
                                            <c:set var="title7"><axis:alt f="axisrea038" c="TDESCRIP" lit="100588"/></c:set>
                                            <c:set var="title8"><axis:alt f="axisrea038" c="ISALDO" lit="9001942"/></c:set>
                                            <c:set var="title9"><axis:alt f="axisrea038" c="FVALOR" lit="1000590"/></c:set>
                                            <c:set var="title10"><axis:alt f="axisrea038" c="TIT10" lit="9901169"/></c:set>
                                            <%-- Total filas multirregistro --%>
                                            <% int x = 0; %>   
                                            <% int sumatorio = 1; %>  
                                            <div class="displayspaceMaximo">
                                               <display:table name="${__formdata.listaCta}" id="miListaId" export="false" style="width:98%;" class="dsptgtable" pagesize="-1"  sort="list" cellpadding="0" cellspacing="0"
                                                 requestURI="modal_axisrea038.do?paginar=true">
                                                 <c:set var="prueba"><%=x%></c:set>
                                                    <%@ include file="../include/displaytag.jsp"%>
                                                   <display:column title="" sortable="true" style="width:4%;" sortProperty="NUM_REG" headerClass="sortable fixed"  media="html" autolink="false" >
                                                    <div class="dspIcons">
                                                        <c:if test="${miListaId['CTIPCTA'] == 1}">
                                                                <c:if test="${miListaId['CESTADO'] == 1}">
                                                                    <input type="checkbox" checked="true" name="num_reg_<%=x%>" <c:if test="${__formdata.CESTADO_PANTALLA!='1'}" >readonly</c:if> id="num_reg_<%=x%>" value="${miListaId['NUM_LINEA']}" onclick="actualizar_importes('${total_filas}');" />
                                                                </c:if>
                                                                 <c:if test="${miListaId['CESTADO'] == 4}">
                                                                    <input type="checkbox"  name="num_reg_<%=x%>" <c:if test="${__formdata.CESTADO_PANTALLA!='1'}" >readonly</c:if> id="num_reg_<%=x%>" value="${miListaId['NUM_LINEA']}" onclick="actualizar_importes('${total_filas}');" />
                                                                </c:if>
                                                        </c:if>
                                                    </div>
                                                   </display:column>
                                                    <axis:visible c="NNUMLIN" f="axisrea038">
                                                        <display:column title="${title0}" sortable="true" style="width:4%;" sortProperty="NNUMLIN" headerClass="sortable fixed"  media="html" autolink="false" >
                                                             <div class="dspNumber">${miListaId['NNUMLIN']}</div>
                                                        </display:column>
                                                    </axis:visible>                                                    
                                                    <axis:visible c="TIPOLIN" f="axisrea038">
                                                        <display:column title="${title1}" sortable="true" style="width:7%;" sortProperty="TTIPMOV" headerClass="sortable fixed"  media="html" autolink="false" >
                                                              <div class="dspText">${miListaId['TTIPMOV']}</div>
                                                        </display:column>
                                                     </axis:visible>   
                                                    <%--axis:visible c="CFISCAL" f="axisrea038">
                                                        <display:column title="${title10}" sortable="true" style="width:5%;" sortProperty="TFISCAL" headerClass="sortable fixed"  media="html" autolink="false" >
                                                              <div class="dspText">${miListaId['TFISCAL']}</div>
                                                        </display:column>
                                                    </axis:visible--%>
                                                    <axis:visible c="FVALOR" f="axisrea038">
                                                        <display:column title="${title9}" sortable="true" style="width:7%;" sortProperty="FCIERRE" headerClass="sortable fixed"  media="html" autolink="false" >
                                                            <div class="dspText"><fmt:formatDate pattern="dd/MM/yyyy" value="${miListaId.FCIERRE}"/></div>    
                                                        </display:column>
                                                     </axis:visible>   
                                                     <axis:visible c="TESTADO" f="axisrea038">
                                                         <display:column title="${title3}" sortable="true" style="width:8%;" sortProperty="TESTADO" headerClass="sortable fixed"  media="html" autolink="false" >
                                                              <div class="dspText">${miListaId['TESTADO']}</div>
                                                         </display:column>
                                                     </axis:visible>
                                                     <axis:visible c="CONCEPTO" f="axisrea038">
                                                         <display:column title="${title4}" sortable="true" style="width:21%;" sortProperty="CONCEPTO" headerClass="sortable fixed"  media="html" autolink="false" >                                                
                                                              <div style="float:left;text-align:left;padding-left:10px;padding-right:5px;"> 
                                                                ${miListaId['TCONCEP']}
                                                              </div>   
                                                              <c:if test="${miListaId['CCONCTA'] == 98}">                                                        
                                                                        <div style="float:right;text-align:right;padding-right:10px;padding-left:5px;">
                                                                             <c:if test="${miListaId['CESTPAG'] == 1}">
                                                                                <img border="0" alt="<axis:alt f="axisrea038" c="CESTPAG_1" lit="9901193"/>" title1="<axis:alt f="axisrea038" c="CESTPAG_1" lit="9901193"/>" src="images/formulap.gif" width="17px" height="17px"
                                                                                    style="cursor:pointer;"/>
                                                                             </c:if>
                                                                             <c:if test="${miListaId['CESTPAG'] != 1}">
                                                                                 <img border="0" alt="<axis:alt f="axisrea038" c="CESTPAG_2" lit="9901194"/>" title1="<axis:alt f="axisrea038" c="CESTPAG_2" lit="9901194"/>" src="images/formulap_red.gif" width="17px" height="17px"
                                                                                    style="cursor:pointer;"/>                                                                     
                                                                             </c:if>
                                                                        </div>
                                                              </c:if>
                                                        </display:column>  
                                                     </axis:visible> 

                                                     <axis:visible c="IDEBE" f="axisrea038">
                                                        <display:column title="${title5}" sortable="true" style="width:7%;" sortProperty="IDEBE" headerClass="sortable fixed"  media="html" autolink="false" >
                                                               <div class="dspNumber">
                                                              <c:choose>
                                                              <c:when test="${miListaId['CCONCTA']==0}">
                                                                <fmt:formatNumber pattern="###,##0.00" value="0"/>
                                                              </c:when>	
                                                              <c:otherwise>
                                                                <!-- INI - ML - 4610 - VISUALIZAR MONEDA CONTABLE  -->
                                                                <fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${miListaId['IDEBE']}"/><br>                                                                
                                                                <c:if test="${miListaId['CMONEDA'] != 'COP' }">
                                                                 	<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${miListaId['IDEBE_MONCON']}"/> COP			                                                     	
		                                                        </c:if>
		                                                        <!-- FIN - ML - 4610 - VISUALIZAR MONEDA CONTABLE  -->
                                                              </c:otherwise>	
                                                              </c:choose>
                                                              </div>                                                              
                                                        </display:column>
                                                     </axis:visible>   
                                                     <axis:visible c="IHABER" f="axisrea038">   
                                                        <display:column title="${title6}" sortable="true" style="width:7%;" sortProperty="IHABER" headerClass="sortable fixed"  media="html" autolink="false" >
                                                              <div class="dspNumber">
                                                              <c:choose>
                                                              <c:when test="${miListaId['CCONCTA']==0}">
                                                                <fmt:formatNumber pattern="###,##0.00" value="0"/>
                                                              </c:when>	
                                                              <c:otherwise>
                                                                <!-- INI - ML - 4610 - VISUALIZAR MONEDA CONTABLE  -->
                                                                <fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${miListaId['IHABER']}"/><br>
                                                                <c:if test="${miListaId['CMONEDA'] != 'COP' }">
                                                                 	<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${miListaId['IHABER_MONCON']}"/> COP			                                                     	
		                                                        </c:if>
		                                                        <!-- FIN - ML - 4610 - VISUALIZAR MONEDA CONTABLE  -->
                                                              </c:otherwise>	
                                                              </c:choose>
                                                              </div>                                                              
                                                        </display:column>
                                                     </axis:visible>   
                                                     <axis:visible c="TDESCRIP" f="axisrea038">   
                                                        <display:column title="${title7}" sortable="true" style="width:21%;" sortProperty="TDESCRIP" headerClass="sortable fixed"  media="html" autolink="false" >
                                                              <div class="dspText">${fn:escapeXml(miListaId['TDESCRI'])}</div>
                                                        </display:column>  
                                                     </axis:visible>   
                                                     <axis:visible c="ISALDO" f="axisrea038">   
                                                        <display:column title="${title8}" sortable="true" style="width:8%;" sortProperty="ISALDO" headerClass="sortable fixed"  media="html" autolink="false" >
                                                           <div class="dspNumber">
                                                               <c:choose>
                                                               <c:when test="${miListaId['CCONCTA']==0}">
                                                                     <c:choose>
                                                                    <c:when test="${miListaId['IHABER']>0}">
                                                                        <fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${miListaId['IHABER']*(-1)}"/>
                                                                    </c:when>
                                                                    <c:when test="${miListaId['IDEBE']>0}">
                                                                        <fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${miListaId['IDEBE']}"/>
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <fmt:formatNumber pattern="###,##0.00" value="${0}"/>
                                                                    </c:otherwise>
                                                                   </c:choose>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <fmt:formatNumber pattern="###,##0.00" value="${0}"/>
                                                                </c:otherwise>
                                                              </c:choose>
                                                          </div>
                                                        </display:column>
                                                    </axis:visible>

                                                    <axis:visible f="axisrea038" c="BT_SIN_EDITAR"> 
                                                        <display:column title="" headerClass="sortable fixed" media="html" style="width:3%;"  autolink="false" >
                                                          <c:if test="${miListaId['CTIPCTA'] == 1 && (miListaId['CESTADO'] == 1 || miListaId['CESTADO'] == 3 )}">  <!-- 0: LIQUIDADO - NO SE PUEDE MODIFICAR  , 1:AUTOMATICO - NO SE PUEDE MODIFICAR --> 
                                                             <div class="dspIcons"><img border="0" title="<axis:alt f='axiscoa002' c='LIT_ED_BO' lit='9901356'/>" alt="<axis:alt f="axisrea038" c="CEDIT" lit="100002"/>" title1="<axis:alt f="axisrea038" c="CEDIT" lit="100002"/>" src="images/lapiz.gif" width="15px" height="15px"
                                                            style="cursor:pointer;" onclick="f_mod_linea('${miListaId['NNUMLIN']}','${miListaId['CDEBHAB']}','${miListaId['CCONCEP']}','${miListaId['NVERSIO']}','<fmt:formatDate pattern="dd/MM/yyyy" value="${miListaId['FCIERRE']}"/>','<fmt:formatNumber pattern="###,##0.00" value="${miListaId['IIMPORT']}"/>','${fn:escapeXml(miListaId['TDOCUME'])}','${fn:escapeXml(miListaId['TDESCRI'])}','${miListaId['CESTADO']}','${miListaId['TMONEDA']}','${miListaId['SPRODUC']}','${miListaId['CTIPMOV']}','${miListaId['NPOLIZA']}','${miListaId['NCERTIF']}','${miListaId['NSINIES']}','${miListaId['SIDEPAG']}')"/></div>
                                                          </c:if>
                                                                                                       
                                                         </display:column>
                                                     </axis:visible>
                                                     <axis:visible f="axisrea038" c="BT_SIN_CONSULTAR"> 
                                                        <display:column title="" headerClass="sortable fixed" media="html" style="width:3%;"  autolink="false" >
                                                             <div class="dspIcons"><img border="0" title="<axis:alt f='axiscoa002' c='LIT_CO_BO' lit='1000439'/>" alt="<axis:alt f="axisrea038" c="CONS" lit="1000439"/>" title1="<axis:alt f="axisrea038" c="CONS" lit="1000439"/>" src="images/mas.gif" 
                                                            style="cursor:pointer;" onclick="f_consulta_linea('${miListaId['NNUMLIN']}','${miListaId['CDEBHAB']}','${miListaId['CCONCEP']}','${miListaId['NVERSIO']}','<fmt:formatDate pattern="dd/MM/yyyy" value="${miListaId['FCIERRE']}"/>','<fmt:formatNumber pattern="###,##0.00" value="${miListaId['IIMPORT']}"/>','${fn:escapeXml(miListaId['TDOCUME'])}','${fn:escapeXml(miListaId['TDESCRI'])}','${miListaId['CESTADO']}','${miListaId['TMONEDA']}','${miListaId['SPRODUC']}','${miListaId['CTIPMOV']}','${miListaId['NPOLIZA']}','${miListaId['NCERTIF']}','${miListaId['NSINIES']}','${miListaId['SIDEPAG']}')"/></div>
                                                                                                       
                                                         </display:column>
                                                     </axis:visible>
                                                     <axis:visible f="axisrea038" c="BT_SIN_DELETE"> 
                                                        <display:column title="" headerClass="sortable fixed" media="html" style="width:3%;" autolink="false" >
                                                        <!-- INI - AXIS 4624 - 11/07/2019 - AABG - SE AGREGA NUEVO ATRIBUTO POLIZA, SINIESTRO -->
                                                        <c:if test="${miListaId['CTIPCTA'] == 1 && (miListaId['CESTADO'] == 1 && miListaId['CTIPMOV'] == 1 )}">  <!-- 0: LIQUIDADO - NO SE PUEDE BORRAR  , 1:AUTOMATICO - NO SE PUEDE BORRAR --> 
                                                            <div class="dspIcons"><img border="0" title="<axis:alt f='axiscoa002' c='LIT_BO_BO' lit='9001333'/>" alt="<axis:alt f="axisrea038" c="DEL" lit="1000127"/>" title1="<axis:alt f="axisrea038" c="DEL" lit="1000127"/>" src="images/delete.gif" width="15px" height="15px"
                                                            style="cursor:pointer;" onclick="javascript:f_borrar_cta('${miListaId['NNUMLIN']}','${miListaId['CCONCEP']}','${miListaId['NPOLIZA']}','${miListaId['NSINIES']}');"/></div>
                                                        </c:if>
                                                        <!-- FIN - AXIS 4624 - 11/07/2019 - AABG - SE AGREGA NUEVO ATRIBUTO POLIZA, SINIESTRO -->
                                                        </display:column>
                                                    </axis:visible>
                                                    <% x=x+sumatorio; %>
                                                </display:table>
                                              </div>                                            
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
            <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisrea038</c:param><c:param name="f">axisrea038</c:param>
            <c:param name="f">axisrea038</c:param>
            <c:param name="__botones">salir<axis:visible f="axisrea038" c="BT_ACEPTAR">,aceptar</axis:visible></c:param>
            </c:import>
                
       </form>
     <c:import url="../include/mensajes.jsp"/>
    
    </body>

</html>
