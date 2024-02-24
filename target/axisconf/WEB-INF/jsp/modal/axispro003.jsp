<%/**
*  Fichero: axispro003.jsp
*  Modal - Mantenimiento prodctos: Sección DATOS GENERALES.
*
*  Fecha: 16/04/2007
*/
%>

<%@ page contentType="text/html;charset=windows-1252" errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<html>
<head>
<link rel="stylesheet" href="styles/genericosHtml.css" type="text/css">
<link rel="stylesheet" href="styles/axisnt.css" type="text/css">
<link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>
<c:import url="../include/carga_framework_js.jsp" />

<script language="Javascript" type="text/javascript">
var companias = new Array();
var productos = new Array();
    
   
    // Primero miramos si hay alguna opción de la lista seleccionada
    function f_but_aceptar() {                    
        if (objValidador.validaEntrada()) {
            //datos generales
            //alert("En aceptar");
            SPRODUC=document.miForm.SPRODUC.value;
           // objDom.setValorPorId("CRAMO", document.miForm.CRAMO.value);
           // CRAMO=document.miForm.CRAMO.value;
            CMODALI=document.miForm.CMODALI.value;
            CTIPSEG=document.miForm.CTIPSEG.value;
            CCOLECT=document.miForm.CCOLECT.value;
            //datos
            CACTIVO=document.miForm.CACTIVO.value;
            CTERMFIN=document.miForm.CTERMFIN.value;
            CTIPRIE=document.miForm.CTIPRIE.value;
            COBJASE=document.miForm.COBJASE.value;
            CSUBPRO=document.miForm.CSUBPRO.value;
            C2CABEZAS=document.miForm.C2CABEZAS.value;
            CAGRPRO=document.miForm.CAGRPRO.value;
            CDIVISA=document.miForm.CDIVISA.value;
    
            var CPRPROD = ((document.miForm.CPRPROD)? document.miForm.CPRPROD.value : null);       
            var NMAXRIE = ((document.miForm.NMAXRIE)? document.miForm.NMAXRIE.value : null); 
    
    
            if(CACTIVO!="null"){
            objUtiles.ejecutarFormulario("modal_axispro003.do", "setDatosGenerales", document.miForm, "_self", objJsMessages.jslit_cargando);   
                 //parent.f_aceptar_axispro003(SPRODUC,CRAMO,CMODALI,CTIPSEG,CCOLECT,CACTIVO,CTERMFIN,CTIPRIE,COBJASE,CSUBPRO,C2CABEZAS,CAGRPRO,CDIVISA,NMAXRIE,CPRPROD);
            }else{
                alert("<axis:alt f="axispro003" c="ALERT1" lit="108341"/> <axis:alt f="axispro003" c="ALERT1" lit="100587"/>");
            }
        }
    }
    
    function f_but_cancelar() {                                   
        parent.f_cerrar_modal("axispro003");                
    }
    
    
    function f_seleccionar(SPRODUC){
        if (objUtiles.estaVacio(SPRODUC))
            alert (objJsMessages.jslit_error_de_seleccion);
        else
           
            parent.f_aceptar_axispro003(SPRODUC);
     }   
      
   
      function f_onchange_CSUBPRO(CSUBPRO) {
        //    formdataTIDENTI = '${__formdata.TIDENTI}';
        //    if (TIDENTI != "<%= Integer.MIN_VALUE %>" && TIDENTI != formdataTIDENTI && (formdataTIDENTI == 2 || TIDENTI == 2)) {
                // Recargar formulario para esconder/mostrar campos en función de TIDENTI
                objUtiles.ejecutarFormulario("modal_axispro003.do?CSUBPRO_MODI="+CSUBPRO, "form", document.miForm, "_self", objJsMessages.jslit_cargando);   
          //  }
        }
     //////////////////////////////////// AJAX ////////////////////////////////////
     function f_guardar_fila(num_fila){
            //var cadena=parametro.split("#");
            //alert("En continuar");
            //alert(num_fila);
            var idioma = eval('document.miForm.CIDIOMA_'+num_fila+'.value');
            var titulo = eval('document.miForm.TTITULO_'+num_fila+'.value');
            var rotulo = eval('document.miForm.TROTULO_'+num_fila+'.value');
            //alert(document.write('document.miForm.TROTULO_'+num_fila+'.value'));
            //alert(idioma);
            //objAjax.invokeAsyncCGI("axis_axispro003.do?CIDIOMA="+cadena[0]+"&TIDIOMA="+cadena[1], callbackAjaxGuardar, "operation=ajax_guardar_lista", this, objJsMessages.jslit_cargando);
           objAjax.invokeAsyncCGI("modal_axispro003.do?CIDIOMA="+idioma+"&TTITULO="+titulo+"&TROTULO="+rotulo, callbackAjaxGuardar, "operation=ajax_guardar_lista", this, objJsMessages.jslit_cargando);
    }
    
    function callbackAjaxGuardar(ajaxResponseText) {
                //alert("volver");
                try {                
                    var doc=objAjax.domParse(ajaxResponseText);
                    //alert(doc);
                    var error = objUtiles.hayValorElementoXml(doc.getElementsByTagName("ERROR")[0]) ? 
                    objDom.getValorNodoDelComponente(doc.getElementsByTagName("ERROR"), 0, 0) : ""; 
                    if(error!=""){
                    alert(error);
                    }
                
                } catch (e) {
                    if (isDebugAjaxEnabled == "true")
                        alert (e.name + " " + e.message);
                }
                   
    }               
     
     
     
      function f_guardar_companyia(num_fila_guardar, ori){                 

      
      
      
            if(document.getElementById("COMPANY_"+num_fila_guardar).value == <%= Integer.MIN_VALUE %>){        
                alert("<axis:alt f="axispro003" c="ALERT1" lit="9901329"/>");            
            }
            else if(document.getElementById("PROD_"+num_fila_guardar).value == <%= Integer.MIN_VALUE %>){        
                document.getElementById("PROD_"+num_fila_guardar).focus();
            }
            else{
                if(comprovarCompanyiaRepetida()==1){
                    alert("<axis:alt f="axispro003" c="ALERT3" lit="108959"/>");        
                    document.getElementById("COMPANY_"+num_fila_guardar).value = <%= Integer.MIN_VALUE %> ;
                    
                }
                else{                    
                    var companyia = document.getElementById("COMPANY_"+num_fila_guardar).value;
                    var agente = document.getElementById("AGENTE_"+num_fila_guardar).value;
                    var producto = document.getElementById("PROD_"+num_fila_guardar).value;
                     desabilitarCampos();
                    objAjax.invokeAsyncCGI("modal_axispro003.do?COMPANY="+companyia+"&AGENTE="+agente+"&PROD="+producto+"&PRODUCTO="+document.miForm.SPRODUC.value, callbackAjaxGuardarCompanyia, "operation=ajax_guardar_companyia", this, objJsMessages.jslit_cargando,num_fila_guardar);
               }
               }
               
       if (!objUtiles.estaVacio(ori) && ori== 1 ){
         objAjax.invokeAsyncCGI("modal_axispro003.do?COMPANY="+document.getElementById("COMPANY_"+num_fila_guardar).value, callbackAjaxCargarProductos, "operation=ajax_cargar_prod", this, objJsMessages.jslit_cargando,num_fila_guardar);
       }
    }
    
    
    function callbackAjaxCargarProductos (ajaxResponseText, num_fila) {
    
                var doc=objAjax.domParse(ajaxResponseText);
                if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                    var elementos = doc.getElementsByTagName("SPRODUC");
                   var SPRODUCCombo = document.getElementById("PROD_"+num_fila)
                   objDom.borrarOpcionesDeCombo(SPRODUCCombo);
                   objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", '- <axis:alt f="axispro003" c="SPRODUC" lit="108341"/> - ', SPRODUCCombo, 0);
                       for (i = 0; i < elementos.length; i++) {
                            var SPRODUC = objDom.getValorNodoDelComponente(doc.getElementsByTagName("SPRODUC"), i, 0);
                            var TITULO = objDom.getValorNodoDelComponente(doc.getElementsByTagName("TTITULO"), i, 0);                                     
                            objDom.addOpcionACombo(SPRODUC, TITULO, SPRODUCCombo, i+1);
                        }
                 
                }
            }    
   
    
    function callbackAjaxGuardarCompanyia(ajaxResponseText, num_fila) {
               // alert(num_fila);
                try {                
                    var doc=objAjax.domParse(ajaxResponseText);
                    //alert(doc);
                    var error = objUtiles.hayValorElementoXml(doc.getElementsByTagName("ERROR")[0]) ? 
                    objDom.getValorNodoDelComponente(doc.getElementsByTagName("ERROR"), 0, 0) : ""; 
                    if(error!=""){
                    alert(error);
                    }
                    //deshabilitamos el combo para no afectar a la integridad
                    else{
                        var companyia = document.getElementById("COMPANY_"+num_fila);   
                       // companyia.setAttribute('disabled','true');
                    }
                
                } catch (e) {
                    if (isDebugAjaxEnabled == "true")
                        alert (e.name + " " + e.message);
                }
                   
    }         
    
    
    //eliminar por AJAX
      function f_ajax_eliminar_companyia(num_fila){                 
               // alert("num en call eliminar: "+num_fila);
                
                var companyia = eval('document.miForm.COMPANY_'+num_fila+'.value');                            
                var prod = eval('document.miForm.PROD_'+num_fila+'.value');      
                objAjax.invokeAsyncCGI("modal_axispro003.do?COMPANY="+companyia+"&PRODUCTO="+document.miForm.SPRODUC.value+"&PRODESP="+prod, callbackAjaxEliminarCompanyia, "operation=ajax_eliminar_companyia", this, objJsMessages.jslit_cargando,num_fila);
            
    }
    
    function callbackAjaxEliminarCompanyia(ajaxResponseText, num_fila) {
               // alert(num_fila);
                try {                
                    var doc=objAjax.domParse(ajaxResponseText);
                    //alert(doc);
                    var error = objUtiles.hayValorElementoXml(doc.getElementsByTagName("ERROR")[0]) ? 
                    objDom.getValorNodoDelComponente(doc.getElementsByTagName("ERROR"), 0, 0) : ""; 
                    if(error!=""){
                    alert(error);
                    }
                    //la boorramos por js para no afecta a otras posibles filas vacias
                    else{
                        borrar_fila_companyia_js(num_fila);
                    }
                
                } catch (e) {
                    if (isDebugAjaxEnabled == "true")
                        alert (e.name + " " + e.message);
                }
                   
    }          
    
    
    //---------------
        
     
     //////////////////////////////////////////////////////////////////////////////
     
    function actualitzarCheckbox(obj){
         objDom.setValorPorId("C2CABEZAS", ((objDom.getComponenteMarcado(obj))? "1" : "0" ));
    }
    <% System.out.println("************************************************* 3"); %>
        
    // **************************************
    // **************************************
    // Recalculammos el índice de una nueva fila
    // **************************************
    // **************************************
    function obtenerNuevoIndice(){    
            var table_companyias = document.getElementById("companyias");
             if(table_companyias!=null){
             var tr_companyias = table_companyias.getElementsByTagName("tr");
             var filas=0;             
             for (i=0; i < tr_companyias.length; i++) {                        
                 if(tr_companyias[i].getAttribute("tipo")=='ri'){                            
                 filas=filas+1;
                 }
             }          
             //Obtenemos el siguiente numero no dado de alta
             //alert("El numero que se desea insertar es: "+filas);
             var myCounter=0;             
             while(myCounter < tr_companyias.length){                
                texto_id="fila_"+filas;
                if(tr_companyias[myCounter].getAttribute("id")==texto_id){
                //El numero ya existe intentamos asignar otro
                filas=filas+1;
                myCounter=0;
                }
                myCounter++;
            }
             return filas;
             }else{
             //alert("No existen filas de rentas irre");
             return 0;
             }          
    }    
    
   
     // **************************************
    // **************************************
    // Añadir nueva fila a tabla compañía
    // **************************************
    // **************************************
        
    function anyadir_fila_companyia(){    
    desabilitarCampos();
             //primero llamamos a la funcion que nos devuelve el número de filas rellenadas
             //sabremos que el id_ sera i+1
             var numero_filas = obtenerNuevoIndice(); //Si el número de filas =3 la siguiente será 3          
            
            
            /*  var  totalFilas = obtenerNuevoIndice();
        
         for(i=0; i < (totalFilas) ;i++){
              var elementoCompany = document.getElementById("COMPANY_"+i);
            var elementoProducto = document.getElementById("PROD_"+i);
            var valorCompany = elementoCompany.value;   
            var valorProducto = elementoProducto.value;
            
            if (valorProducto >= 0 && valorCompany >=0){
            objDom.setDisabledPorId("PROD_"+i,true);
            objDom.setDisabledPorId("COMPANY_"+i,true);
            }

        }*/
            var cont = numero_filas-1;
            var elementoCompany = document.getElementById("COMPANY_"+cont);
            var elementoProducto = document.getElementById("PROD_"+cont);
            try{
                var valorCompany = elementoCompany.value;   
                var valorProducto = elementoProducto.value;
            }catch(e){valorCompany=0;valorProducto=0;}
            
            
      if (valorProducto >= 0 && valorCompany >=0){
             //alert("valor de la nueva fila:"+numero_filas)
             // recogemos el tag de companyias
             var table_companyias = document.getElementById("companyias");     
             // creamos la tr y la td
             var mitr = document.createElement("tr");
             //Comprovamos el color de la fila
             if ((numero_filas % 2)==0){
                    mitr.classname ="";
                    mitr.setAttribute('class','gridNotEven');
                    mitr.className = "gridNotEven";            
                }
             else{
                    mitr.classname ="";
                    mitr.setAttribute('class','gridEven');
                    mitr.className = "gridEven";            
                }                
             //preparamos identificador de fila y lo cargamos   
             var texto="fila_"+numero_filas;       
             mitr.setAttribute('id',texto);
             mitr.setAttribute('tipo','ri');
             mitr.setAttribute('title',texto);
             //creamos el td de companyia i la apariencia
             var mitd = document.createElement("td");         
             mitd.setAttribute('class','dspText');     
             mitd.className ="dspText";                  
             //Creamos el select de comppanyia
             var miselect = document.createElement("select");            
                    var texto_companyia = 'COMPANY_'+numero_filas;
                    miselect.setAttribute('class','campowidthselect campo campotexto'); //Será obligatorio?
                    miselect.className="campowidthselect campo campotexto";            
                    miselect.style.width="90%";
                    miselect.setAttribute('id',texto_companyia);
                    miselect.setAttribute('obligatorio','true');
                    miselect.setAttribute('name','name_'+texto_companyia);
                    miselect.name=texto_companyia;
                    miselect.style.fontFamily="arial";
                    miselect.style.fontSize="11px";
                    miselect.style.backgroundColor="#F7FFD6";
                    miselect.onchange = function (evt) {
                        f_guardar_companyia(numero_filas,"1");                        
                    };
              
             var mioption = document.createElement("option");
             //Primer option con min value
             mioption.setAttribute('value', <%= Integer.MIN_VALUE %>);
             micompani=document.createTextNode('- ' + '<axis:alt f="axispro003" c="SEL_COMPANI" lit="108341"/>' + ' -');
             mioption.appendChild(micompani);
             miselect.appendChild(mioption);
             //alert(companias.length);
             for(i=0;i < companias.length;i++){
                 var mioption = document.createElement("option");
                 
                 mioption.setAttribute('value', companias[i][0]);
                 micompani=document.createTextNode(companias[i][1]);            
                 mioption.appendChild(micompani);
                 miselect.appendChild(mioption);
             } 
             //Cargamos select copmpañías en el TD
             mitd.appendChild(miselect);
             //creamos nuevo TD de agentes y le damos la apariéncia    
             var agentetd=document.createElement("td");
             agentetd.setAttribute('class','dspText');
             agentetd.className="dspText";
             var agenteinput = document.createElement("input");
                    //anyadir variables al input
                    var texto_agente='AGENTE_'+numero_filas;
                    agenteinput.setAttribute('id',texto_agente);                        
                    agenteinput.setAttribute('class','campowidthinput campo campotexto'); //Será obligatorio?
                    agenteinput.className="campowidthinput campo campotexto";                    
                    agenteinput.setAttribute('title','AGENTE_'+numero_filas);
                    agenteinput.setAttribute('name','name_'+texto_agente);
                    agenteinput.name=texto_agente;
                    agenteinput.setAttribute('type','text');
                    agenteinput.type="text";
                    agenteinput.style.width="90%";
                    agenteinput.style.fontFamily="arial";
                    agenteinput.style.fontSize="11px";                               
                    //Asignar al onchange la función AJAX de actualixación.
                    agenteinput.onchange = function (evt) {
                        f_guardar_companyia(numero_filas);                        
                    };
            //Cargamos el campo agente en el TD de agente.
             agentetd.appendChild(agenteinput);
                  
             //creamos nuevo TD de producto específico y le damos la apariéncia       
             var proddEspTD = document.createElement("td");            
             proddEspTD.setAttribute('class','dspText');       
             proddEspTD.className="dspText";
             //Creamos el campo Select
             var miselectPE = document.createElement("select");            
                    var texto_producto = 'PROD_'+numero_filas;
                    miselectPE.setAttribute('class','campowidthselect campo campotexto');
                    miselectPE.className="campowidthselect campo campotexto";           
                    miselectPE.style.width="90%";
                    miselectPE.setAttribute('id',texto_producto);
                    miselectPE.setAttribute('name','name_'+texto_producto);
                    miselectPE.name=texto_producto;
                    miselectPE.style.fontFamily="arial";
                    miselectPE.style.fontSize="11px";
                    miselectPE.setAttribute('obligatorio','true');
                    miselectPE.onchange = function (evt) {
                    f_guardar_companyia(numero_filas);                        
                    };
             //Anyadir las options del select 
             var mioptionPE = document.createElement("option");     
             //Primer option con min value
             mioptionPE.setAttribute('value', <%= Integer.MIN_VALUE %>);
             miPE=document.createTextNode('- ' + '<axis:alt f="axispro003" c="SELECCIONAR" lit="108341"/>' + ' -');
             mioptionPE.appendChild(miPE);
             miselectPE.appendChild(mioptionPE);     
             for(i=0;i < productos.length;i++){
                var mioptionPE = document.createElement("option");
                mioptionPE.setAttribute('value', productos[i][0]);
                miPE=document.createTextNode(productos[i][1]);      
                mioptionPE.appendChild(miPE);
                miselectPE.appendChild(mioptionPE);
             }  
             proddEspTD.appendChild(miselectPE);          
            //Creamos TD para el sigo de eliminación de fila 
            var imgtd=document.createElement("td");
            imgtd.setAttribute('class','dspText');       
            imgtd.className="dspText";
            var ael = document.createElement("a");
                var stringId = "eliminar_"+numero_filas;
                ael.setAttribute('id',stringId);
            var funcion_borrar = "javascript:borrar_fila_companyia("+ numero_filas +")";
          //  var funcion_borrar = "javascript:borrar_fila_renta()";
                ael.setAttribute('href',funcion_borrar);
            var imgel = document.createElement("img");
                imgel.setAttribute('border','0');
                imgel.setAttribute('src','images/delete.gif');
                ael.appendChild(imgel);        
             //Cargamos el icono eliminar en el TD     
            imgtd.appendChild(ael);            
            // Apend en el tr todos los td's de los campos
            mitr.appendChild(mitd);
            mitr.appendChild(agentetd);
            mitr.appendChild(proddEspTD);
            mitr.appendChild(imgtd);  
            //Por último añadimos el TR a la tabla
            table_companyias.appendChild(mitr);    
            revisarEstilos();
             }
    }
    
    // **************************************
    // **************************************
    // Borra una fila determinada
    // **************************************
    // **************************************
    function borrar_fila_companyia(num){         
        //Si elimino una fila con compañia asociada, recargo la pantalla
        if(document.getElementById("COMPANY_"+num).value != <%= Integer.MIN_VALUE %> ){        
            //Es una fila existente en BBDD, lo eliminamos primero en BBDD
            f_ajax_eliminar_companyia(num);            
            }
         //Si es una fila, generada sin compañia asiciada, lo elimino por JS   
         else{            
                borrar_fila_companyia_js(num);               
            }       
    }
    
    // **************************************
    // **************************************
    // Borra una fila determinada por js
    // **************************************
    // **************************************
    function borrar_fila_companyia_js(num){         
         
               //Control de única fila, si es la única del grid no la borramos visualmente
               if(obtenerNuevoIndice() != 1){
                    var table_companyias = document.getElementById("companyias");
                    var elemento = document.getElementById("fila_"+num); //selecciona el tr correspondiente   
                    table_companyias.removeChild(elemento);
                    modificarIdentificadorsPostEliminacioCompanyia(num);
               }else{
               //La fila está vacia, sin compañia, y además es la única, no se puede eliminar
                    var table_companyias = document.getElementById("companyias");
                    var elemento = document.getElementById("fila_"+num); //selecciona el tr correspondiente   
                    table_companyias.removeChild(elemento);
                    modificarIdentificadorsPostEliminacioCompanyia(num);
                  //  anyadir_fila_companyia();
                    
               //alert(objJsMessages.jslit_no_borrar);
               }
    }
    
    function desabilitarCampos(){
        var  totalFilas = obtenerNuevoIndice();
        
         for(i=0; i < (totalFilas) ;i++){
              var elementoCompany = document.getElementById("COMPANY_"+i);
            var elementoProducto = document.getElementById("PROD_"+i);
            var valorCompany = elementoCompany.value;   
            var valorProducto = elementoProducto.value;
            
            if (valorProducto >= 0 && valorCompany >=0){
            objDom.setDisabledPorId("PROD_"+i,true);
            objDom.setDisabledPorId("COMPANY_"+i,true);
            }

        }
    }
     // **************************************
    // **************************************
    // Compueba que la fila no esté repetida(valor de la companyia)
    // **************************************
    // **************************************
    function comprovarCompanyiaRepetida(){
       var  totalFilas = obtenerNuevoIndice()-1;
       var elementoComFinal = document.getElementById("COMPANY_"+totalFilas);        
       var valorCompanyFinal = elementoComFinal.value;
       var elementoProdFinal = document.getElementById("PROD_"+totalFilas);        
       var valorProductoFinal = elementoProdFinal.value;
       //alert(valorCompanyFinal);
       var indiceATratar = 0;
       var filaRepetida = 0;
       for(i=0; i < (totalFilas) ;i++){
       //alert("indice comp repetidos: "+ indiceATratar)
            var elementoCompany = document.getElementById("COMPANY_"+indiceATratar);
            var elementoProducto = document.getElementById("PROD_"+indiceATratar);
            var valorCompany = elementoCompany.value;   
            var valorProducto = elementoProducto.value;
            //alert(valorCompany);
            if(valorCompany == valorCompanyFinal && valorProducto == valorProductoFinal){
                filaRepetida = 1;
                return filaRepetida;
            }
            indiceATratar = indiceATratar +1;
        }
        return filaRepetida;
    }
    
    // **************************************
    // **************************************
    // Actualiza los componentes al eliminar una fila por js
    // **************************************
    // **************************************
    
    function modificarIdentificadorsPostEliminacioCompanyia(filaEliminada){    
        
        var indiceATratar = filaEliminada +1;
        var nuevoIndice = filaEliminada;
        var  totalFilas = obtenerNuevoIndice();
        
        
        for(i=filaEliminada; i < (totalFilas-1) ;i++){
            
            //Recuparamos la fila a tratar
            var elemento = document.getElementById("fila_" + indiceATratar); 
            //Cambiamos class de la fila
            if ((indiceATratar % 2)==0){
                elemento.classname ="";
                elemento.setAttribute('class','gridNotEven');
                elemento.className = "gridEven";            
            }
             else{
                elemento.classname ="";
                elemento.setAttribute('class','gridEven');
                elemento.className = "gridNotEven";            
            }                        
            //Cambiamos title de la fila
            elemento.setAttribute('title','fila_' + nuevoIndice);                                
            //Cambiamos id's y name's de los campos de la fila            
            var elementoCompany = document.getElementById("COMPANY_"+indiceATratar); 
            elementoCompany.name = "name_COMPANY_" + nuevoIndice;           
            elementoCompany.id = "COMPANY_" + nuevoIndice;           
            elementoCompany.setAttribute('title','COMPANY_' + nuevoIndice);  
            //Problemas de asignacion de memoria por tratarse de funcion, el volor pasaba por referencia y siempre quedava el ultimo valor(bug JS)
            //;recuperamos el valor del ID, una vez se ejecuta el onchange, dentro del objeto select.
            elementoCompany.onchange = function (evt) {
                    var cadenaTexto = this.id;                    
                    var fragmentoTexto = cadenaTexto.split('COMPANY_');
                    var numero = fragmentoTexto[1];                    
                    f_guardar_companyia(numero,"1");                        
            };                      
            var elementoAgente = document.getElementById("AGENTE_"+indiceATratar); 
            elementoAgente.name = "name_AGENTE_" + nuevoIndice;            
            elementoAgente.setAttribute('title','AGENTE_' + nuevoIndice);  
            //Problemas de asignacion de memoria por tratarse de funcion, el volor pasaba por referencia y siempre quedava el ultimo valor(bug JS)
            //;recuperamos el valor del ID, una vez se ejecuta el onchange, dentro del objeto input-text.
            elementoAgente.onchange = function (evt) {
                    var cadenaTexto = this.id;                    
                    var fragmentoTexto = cadenaTexto.split('AGENTE_');
                    var numero = fragmentoTexto[1];                    
                    f_guardar_companyia(numero);                        
            };            
            elementoAgente.id = "AGENTE_" + nuevoIndice;                     
            var elementoProd = document.getElementById("PROD_"+indiceATratar); 
            elementoProd.name = "name_PROD_" + nuevoIndice;
            elementoProd.id = "PROD_" + nuevoIndice;
            elementoProd.setAttribute('title','PROD_' + nuevoIndice);             
            //Problemas de asignacion de memoria por tratarse de funcion, el volor pasaba por referencia y siempre quedava el ultimo valor(bug JS)
            //;recuperamos el valor del ID, una vez se ejecuta el onchange, dentro del objeto select.
            elementoProd.onchange = function (evt) {
                    var cadenaTexto = this.id;                    
                    var fragmentoTexto = cadenaTexto.split('PROD_');
                    var numero = fragmentoTexto[1];                    
                    f_guardar_companyia(numero);                        
            };     
            //Cambiamos id's de la fila
            elemento.id = "fila_" + nuevoIndice;                             
            //Cambiamos id del botón eliminar registre
            var elemento = document.getElementById("eliminar_"+indiceATratar);    
            elemento.id = "eliminar_" + nuevoIndice;
            
            var funcion_borrar = "javascript:borrar_fila_companyia("+ nuevoIndice +")";
            elemento.setAttribute('href',funcion_borrar);
          
            nuevoIndice = nuevoIndice + 1;            
            indiceATratar = indiceATratar + 1;    
            
    }
    revisarEstilos();
    
    
}

    function f_onload() {    
            i=0;
            //alert("En onload");
            <c:forEach items="${axispro003_datos_generales.CIAS}" var="compania">
                  companias[i] = new Array ("${compania.CCOMPANI}","${compania.TCOMPANI}");
                  i++;
            </c:forEach>
            //f_cargar_propiedades_pantalla();
             i=0;         
            <c:forEach items="${axispro003_datos_generales.PRODS}" var="producte">
                  productos[i] = new Array ("${producte.SPRODUC}","${producte.TTITULO}");
                  i++;
            </c:forEach>
            
            revisarEstilos();
            var ok = "${__formdata.OK}"; 
            if (!objUtiles.estaVacio(ok) && objUtiles.utilEquals(ok,"0")){
                
                parent.f_aceptar_axispro003('datosgenerales');
            }
            f_cargar_propiedades_pantalla();
        }
    
   
</script>
</head>
<body  onload="f_onload()">
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
    <form name="miForm" action="" method="POST">
        <input type="hidden" name="operation" id="operation" value=""/>
        <!--parametros grabar datos generales -->
        <input type="hidden" name="subpantalla" id="subpantalla_mdl" value="datosgenerales"/>
        <input type="hidden" name="SPRODUC" id="SPRODUC" value="${__formdata.SPRODUC}"/>
        <c:if test="${__formdata.SPRODUC != null}">
        <input type="hidden" name="CRAMO" value="${__formdata.CRAMO}"/>
        </c:if> 
     <%--   <input type="hidden" name="CRAMO" value="${__formdata.CRAMO}"/>
        <input type="hidden" name="CMODALI" value="${__formdata.CMODALI}"/>
        <input type="hidden" name="CCOLECT" value="${__formdata.CCOLECT}"/>
        <input type="hidden" name="CTIPSEG" value="${__formdata.CTIPSEG}"/>--%>
        
        <c:import url="../include/titulo_nt.jsp">
            <c:param name="formulario"><axis:alt f="axispro003" c="TITULO" lit="1000219"/></c:param>
            <c:param name="producto"><axis:alt f="axispro003" c="TITULO" lit="1000219"/></c:param>
            <c:param name="form">axispro003</c:param>
        </c:import>

        <!-- Área de campos  -->
        
        
        <table class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
      
        <tr>
        <td>
            <!--div class="titulo"><img src="images/flecha.gif"/></div-->
             <table class="seccion">
                
                <!-- Subseccion lista -->
                
                <tr>
                    <td>
                        <!-- DisplayTag Lista de productos -->
                        <c:set var="title0"><axis:alt f="axispro003" c="TIT_0" lit="1000246"/></c:set>
                        <c:set var="title1"><axis:alt f="axispro003" c="TIT_1" lit="100785"/></c:set>
                        <c:set var="title2"><axis:alt f="axispro003" c="TIT_2" lit="100727"/></c:set>
                        <div class="displayspace">
                       
                        <c:set var="miI" value="0" />
                          <display:table name="${__formdata.TITULO}" id="T_IAX_IDIOMAS"  export="false" class="dsptgtable" pagesize="6" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                           requestURI="modal_axispro003.do?paginar=true">
                            <%@ include file="../include/displaytag.jsp"%>
                           
                            <display:column title="${title0}" sortable="true" sortProperty="OB_IAX_PRODTITULO.TIDIOMA" headerClass="headwidth20 sortable" media="html" autolink="false" >
                                <div class="dspText">
                                ${T_IAX_IDIOMAS.OB_IAX_PRODTITULO.TIDIOMA}
                                </div>
                                <input type="hidden" name="CIDIOMA_${miI}" id="CIDIOMA_${miI}" value="${T_IAX_IDIOMAS.OB_IAX_PRODTITULO.CIDIOMA}"/>
                                <input type="hidden" name="TIDIOMA_${miI}" id="TIDIOMA_${miI}" value="${T_IAX_IDIOMAS.OB_IAX_PRODTITULO.TIDIOMA}"/>
                            </display:column>
                            <display:column title="${title1}" sortable="true" sortProperty="OB_IAX_PRODTITULO.TTITULO" headerClass="headwidth20 sortable" media="html" autolink="false" >
                                <div class="dspText">
                                <input type="text" class="campowidthinput campo campotexto" style="width:80%" id="TTITULO_${miI}" name="TITULO_${miI}" size="30"
                                value="${T_IAX_IDIOMAS.OB_IAX_PRODTITULO.TTITULO}" onblur="f_guardar_fila(${miI})" />
                                </div>
                            </display:column>
                            <display:column title="${title2}" headerClass="headwidth5 sortable" sortable="true" sortProperty="OB_IAX_PRODTITULO.TROTULO" media="html" autolink="false" >
                                <div class="dspText">
                                <input type="text" class="campowidthinput campo campotexto" style="width:80%" id="TROTULO_${miI}" name="TROTULO_${miI}" size="30"
                                value="${T_IAX_IDIOMAS.OB_IAX_PRODTITULO.TROTULO}" onblur="f_guardar_fila(${miI})" />
                                </div>
                                
                                <%--
                                ${T_IAX_IDIOMAS.OB_IAX_PRODTITULO.TROTULO}</div>
                                <input type="hidden" name="TROTULO_${miI}" id="TROTULO_${miI}" value="${T_IAX_IDIOMAS.OB_IAX_PRODTITULO.TROTULO}"/>--%>
                            </display:column>
                              
                            <c:set var="miI" value="${miI+1}" />
                        </display:table>
                        
                        </div>
                    </td>
                </tr>
                
      <%--  <c:if test="${__formdata.SPRODUC != null}">--%>
                               <!--PRODUCTE -->
                <tr>
                        <td colspan="2" align="left">
                            <div class="titulo" style="margin-left:10px;font-size: 11px;"><img src="images/flecha.gif"/><%--&nbsp;--%><axis:alt f="axispro003" c="TIT_PRODUCTO" lit="100829"/></div>
                        </td>
                </tr>
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
                                <axis:visible f="axispro003" c="CRAMO">
                                    <td class="titulocaja">
                                        <b><axis:alt f="axispro003" c="CRAMO" lit="100784"/></b>
                                    </td>
                                </axis:visible>
                                <axis:visible f="axispro003" c="CMODALI">
                                    <td class="titulocaja">
                                        <b><axis:alt f="axispro003" c="CMODALI" lit="100943"/></b>
                                    </td>
                                </axis:visible>
                                <axis:visible f="axispro003" c="CTIPSEG">
                                <td class="titulocaja">
                                    <b><axis:alt f="axispro003" c="CTIPSEG" lit="102098"/></b>
                                </td>
                                </axis:visible>
                                <axis:visible f="axispro003" c="CCOLECT">
                                    <td class="titulocaja">
                                        <b><axis:alt f="axispro003" c="CCOLECT" lit="102424"/></b>
                                    </td>
                                </axis:visible>
                            </tr>
                            <tr>
                                <axis:visible f="axispro003" c="CRAMO">
                                    <td class="campocaja">
                                        <!-- CRAMO -->
                                        <select name="CRAMO" style="width:93%"   id="CRAMO" size="1"  
                                        <c:if test="${__formdata.SPRODUC != null}">disabled </c:if>  
                                        <c:if test="${empty __formdata.SPRODUC || __formdata.SPRODUC == null}">obligatorio </c:if>  
                                        title="<axis:alt f="axispro003" c="TCOMPANI" lit="9000600"/>"
                                        onchange="" class="campowidthselect campo campotexto">&nbsp;                                        
                                            <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axispro003" c="CRAMO" lit="108341"/> - </option>
                                            <c:forEach var="ramo" items="${axispro003_datos_generales.RAMOS}" varStatus="status">
                                                <option value = "${ramo.CRAMO}" <c:if test="${__formdata.CRAMO==ramo.CRAMO}" >selected</c:if>>
                                                    ${ramo.TRAMO}
                                                </option>
                                            </c:forEach>
                                     
                                       </select>
                                    </td>
                                </axis:visible>
                                <axis:visible f="axispro003" c="CMODALI">
                                    <td class="campocaja" >                                        
                                     <input type="text" <c:if test="${__formdata.SPRODUC != null}">readonly </c:if>
                                     <c:if test="${empty __formdata.SPRODUC || __formdata.SPRODUC == null}">obligatorio </c:if>  
                                     title="<axis:alt f="axispro003" c="CMODALI" lit="100943"/>" style="width:15%"
                                     id="CMODALI" name="CMODALI" size="15"
                                     class="campowidthinput campo campotexto" value="${__formdata.CMODALI}" />    
                                    </td>                           
                                </axis:visible>
                                <axis:visible f="axispro003" c="CTIPSEG">
                                <td class="campocaja">
                                    <input type="text" <c:if test="${__formdata.SPRODUC != null}">readonly </c:if>
                                    <c:if test="${empty __formdata.SPRODUC || __formdata.SPRODUC == null}">obligatorio </c:if>  
                                    title="<axis:alt f="axispro003" c="CTIPSEG" lit="102098"/>" style="width:15%"
                                    id="CTIPSEG" name="CTIPSEG" size="15"
                                    class="campowidthinput campo campotexto" value="${__formdata.CTIPSEG}" />  
                                </td>
                                </axis:visible>
                                <axis:visible f="axispro003" c="CCOLECT">
                                    <td>
                                      <input type="text" <c:if test="${__formdata.SPRODUC != null}">readonly </c:if>   
                                      <c:if test="${empty __formdata.SPRODUC || __formdata.SPRODUC == null}">obligatorio </c:if>  
                                      title="<axis:alt f="axispro003" c="CCOLECT" lit="102424"/>" style="width:15%"
                                      id="CCOLECT" name="CCOLECT" size="15"
                                      class="campowidthinput campo campotexto" value="${__formdata.CCOLECT}"/>     
                                   </td>
                                </axis:visible>
                            </tr>
                        </table>
                    </td>
                </tr>
             <%--   </c:if>--%>
                <!-- Sub-Sección datos productos -->
                <tr>
                        <td colspan="2" align="left">
                            <div class="titulo" style="margin-left:10px;font-size: 11px;"><img src="images/flecha.gif"/><axis:alt f="axispro003" c="TIT_DATOSPROD" lit="103593"/></div>
                        </td>
                </tr>
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
                                <axis:visible f="axispro003" c="CACTIVO">
                                    <td class="titulocaja">
                                        <b><axis:alt f="axispro003" c="CACTIVO" lit="100786"/></b>
                                    </td>
                                </axis:visible>
                                <axis:visible f="axispro003" c="CTERMFIN">
                                    <td class="titulocaja">
                                        <b><axis:alt f="axispro003" c="CTERMFIN" lit="151112"/></b>
                                    </td>
                                </axis:visible>
                                <axis:visible f="axispro003" c="CTIPRIE">
                                <td class="titulocaja">
                                    <b><axis:alt f="axispro003" c="CTIPRIE" lit="1000465"/></b>
                                </td>
                                </axis:visible>
                                <axis:visible f="axispro003" c="COBJASE">
                                    <td class="titulocaja">
                                        <b><axis:alt f="axispro003" c="COBJASE" lit="102666"/></b>
                                    </td>
                                </axis:visible>
                            </tr>
                            <tr>
                                <axis:visible f="axispro003" c="CACTIVO">
                                    <td class="campocaja">
                                        <!-- TACTIVO -->
                                        <select name="CACTIVO" style="width:93%"  id="CACTIVO" size="1" onchange="" class="campowidthselect campo campotexto"
                                        <axis:atr f="axispro003" c="CACTIVO" a="obligatorio=true"/>
                                        title="<axis:alt f="axispro003" c="TCOMPANI" lit="9000600"/>">&nbsp;                                        
                                            <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axispro003" c="CACTIVO" lit="108341"/> - </option>
                                            <c:forEach var="activo" items="${axispro003_datos_generales.ACTIVO}" varStatus="status">
                                                <option value = "${activo.CATRIBU}" <c:if test="${__formdata.CACTIVO==activo.CATRIBU}" >selected</c:if>>
                                                    ${activo.TATRIBU}
                                                </option>
                                            </c:forEach>
                                     
                                       </select>
                                    </td>
                                </axis:visible>
                                <axis:visible f="axispro003" c="CTERMFIN">
                                    <td class="campocaja" >                                        
                                        <select name="CTERMFIN" style="width:93%"  id="CTERMFIN" size="1" onchange="" class="campowidthselect campo campotexto" <axis:atr f="axispro003" c="CTERMFIN" a="obligatorio=false"/>>&nbsp;                                        
                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axispro003" c="CTERMFIN" lit="108341"/> - </option>
                                        <c:forEach var="terminal" items="${axispro003_datos_generales.TERMINAL}" varStatus="status">
                                            <option value = "${terminal.CATRIBU}" <c:if test="${__formdata.CTERMFIN==terminal.CATRIBU}" >selected</c:if> >
                                                ${terminal.TATRIBU}
                                            </option>
                                        </c:forEach>
                                        </select>
                                    </td>                           
                                </axis:visible>
                                <axis:visible f="axispro003" c="CTIPRIE">
                                <td class="campocaja">
                                   <select name="CTIPRIE" style="width:93%"  id="CTIPRIE" size="1" onchange="" class="campowidthselect campo campotexto" 
                                     <axis:atr f="axispro003" c="CTIPRIE" a="obligatorio=true"/>
                                     title="<axis:alt f="axispro003" c="CTIPRIE" lit="1000465"/>">&nbsp;                                        
                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axispro003" c="CTIPRIE" lit="108341"/> - </option>
                                        <c:forEach var="triesgo" items="${axispro003_datos_generales.TIPORIESGO}" varStatus="status">
                                            <option value = "${triesgo.CATRIBU}"  <c:if test="${__formdata.CTIPRIE==triesgo.CATRIBU}" >selected</c:if>  >
                                                ${triesgo.TATRIBU}
                                            </option>
                                        </c:forEach>
                                 
                                   </select>
                                </td>
                                </axis:visible>
                                <axis:visible f="axispro003" c="COBJASE">
                                    <td>
                                    <select name="COBJASE" style="width:93%"  id="COBJASE" size="1" title="<axis:alt f="axispro003" c="COBJASE" lit="102666"/>"  onchange="" class="campowidthselect campo campotexto" <axis:atr f="axispro003" c="COBJASE" a="obligatorio=true"/>>&nbsp;                                        
                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axispro003" c="COBJASE" lit="108341"/> - </option>
                                        <c:forEach var="riesgo" items="${axispro003_datos_generales.RIESGO}" varStatus="status">
                                            <option value = "${riesgo.CATRIBU}" <c:if test="${__formdata.COBJASE==riesgo.CATRIBU}" >selected</c:if> >
                                                ${riesgo.TATRIBU}
                                            </option>
                                        </c:forEach>
                                 
                                   </select>
                                   </td>
                                </axis:visible>
                            </tr>
                            <tr>
                                <axis:visible f="axispro003" c="CSUBPRO">
                                <td class="titulocaja">
                                    <b><axis:alt f="axispro003" c="CSUBPRO" lit="1000377"/></b>
                                </td>
                                </axis:visible>
                                <axis:visible f="axispro003" c="NMAXRIE">
                                    <c:if test="${__formdata.CSUBPRO ==2 ||__formdata.CSUBPRO==3}">
                                    <td class="titulocaja">
                                        <b><axis:alt f="axispro003" c="NMAXRIE" lit="1000303"/></b>
                                    </td>
                                    </c:if>
                                </axis:visible>
                                  <axis:visible f="axispro003" c="CAGRPRO">
                                    <td class="titulocaja">
                                        <b><axis:alt f="axispro003" c="CAGRPRO" lit="111471"/></b>
                                    </td>
                                </axis:visible>
                                <axis:visible f="axispro003" c="C2CABEZAS">
                                    <td class="titulocaja">
                                        <b><axis:alt f="axispro003" c="C2CABEZAS" lit="1000118"/></b>
                                        <input onClick="javascript:actualitzarCheckbox(this)" 
                                        <c:if test="${__formdata.C2CABEZAS == '1'}">checked</c:if> 
                                        type="checkbox" id="C2CABEZAS" name="C2CABEZAS" value="${__formdata.C2CABEZAS}" />
                                    </td>
                                  </axis:visible>
                            </tr>
                            <tr>
                                <axis:visible f="axispro003" c="CSUBPRO">
                            <td class="campocaja">       
                                   <select name="CSUBPRO" style="width:93%"  id="CSUBPRO" size="1" onchange="javascript:f_onchange_CSUBPRO(this.value)" class="campowidthselect campo campotexto" <axis:atr f="axispro003" c="CSUBPRO" a="obligatorio=false"/>>&nbsp;                                        
                                        
                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axispro003" c="CSUBPRO" lit="108341"/> - </option>
                                        <c:forEach var="producto" items="${axispro003_datos_generales.PRODUCTO}" varStatus="status">
                                           
                                            <option value = "${producto.CATRIBU}" <c:if test="${__formdata.CSUBPRO==producto.CATRIBU}" >selected</c:if>>
                                                ${producto.TATRIBU}
                                            </option>
                                        </c:forEach>
                                 
                                   </select>
                                </td>
                                </axis:visible>
                                <axis:visible f="axispro003" c="NMAXRIE">
                                    <c:if test="${__formdata.CSUBPRO ==2 ||__formdata.CSUBPRO==3}">
                                    <td class="campocaja" >                                        
                                        <input type="text" class="campowidthinput campo campotexto" id="NMAXRIE" name="NMAXRIE" size="15" title="<axis:alt f="axispro003" c="TCOMPANI" lit="1000303"/>"
                                        <axis:atr f="axispro003" c="NMAXRIE" a="obligatorio=false"/>
                                        value="${__formdata.NMAXRIE}" />
                                    </td>
                                    </c:if>
                                    
                                </axis:visible>
                                  <axis:visible f="axispro003" c="CAGRPRO">
                                 <td class="campocaja">                                        
                                        <select name="CAGRPRO" style="width:93%"  id="CAGRPRO" size="1" onchange="javascript:f_onchange_CSUBPRO(null)" class="campowidthselect campo campotexto"
                                        title="<axis:alt f="axispro003" c="CAGRPRO" lit="111471"/>" <axis:atr f="axispro003" c="CAGRPRO" a="obligatorio=true"/>>&nbsp;                                        
                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axispro003" c="CAGRPRO" lit="108341"/> - </option>
                                        <c:forEach var="agrupacion" items="${axispro003_datos_generales.AGRUPACION}" varStatus="status">
                                            <option value = "${agrupacion.CATRIBU}" <c:if test="${__formdata.CAGRPRO==agrupacion.CATRIBU}" >selected</c:if>  >
                                                ${agrupacion.TATRIBU}
                                            </option>
                                        </c:forEach>
                                 
                                   </select>
                                    </td>  
                                </axis:visible>
                                <axis:visible f="axispro003" c="C2CABEZAS">
                                    <td class="campocaja">                                        
                                    </td>
                                </axis:visible>
                            </tr>
                            <tr>
                            <c:if test="${__formdata.CAGRPRO ==2 ||__formdata.CAGRPRO==21}">                                   
                                <axis:visible f="axispro003" c="TPRPOD">
                                    <td class="titulocaja">
                                        <b><axis:alt f="axispro003" c="TPRPOD" lit="152640"/></b>
                                    </td>
                                </axis:visible>
                            </c:if>                                
                                <axis:visible f="axispro003" c="CDIVISA">
                                <td class="titulocaja">
                                    <b><axis:alt f="axispro003" c="CDIVISA" lit="108645"/></b>
                                </td>
                                </axis:visible>
                                
                                <axis:visible f="axispro003" c="CCOMPANI">
                                <td class="titulocaja">
                                    <b><axis:alt f="axispro003" c="CCOMPANI" lit="9901223"/></b>
                                </td>
                                </axis:visible>
                            </tr>
                             <tr>
                                <c:if test="${__formdata.CAGRPRO ==2 || __formdata.CAGRPRO==21}">                                   
                                    <axis:visible f="axispro003" c="CPRPROD">
                                         <td class="campocaja" >
                                        
                                         <select name="CPRPROD" style="width:93%"  id="CPRPROD" size="1" onchange="" class="campowidthselect campo campotexto" <axis:atr f="axispro003" c="CPRPROD" a="obligatorio=false"/>>&nbsp;                                        
                                            <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axispro003" c="CPRPROD" lit="108341"/> - </option>
                                            <c:forEach var="prestacion" items="${axispro003_datos_generales.PRESTACION}" varStatus="status">
                                                <option value = "${prestacion.CATRIBU}"  <c:if test="${__formdata.CPRPROD==prestacion.CATRIBU}" >selected</c:if>  >
                                                    ${prestacion.TATRIBU}
                                                </option>
                                            </c:forEach>
                                     
                                       </select><%--
                                            <input type="text" class="campowidthinput campo campotexto" id="TPRPROD" name="TPRPROD" size="15"
                                            value="${__formdata.TPRPROD}"  />--%>
                                        </td>                             
                                    </axis:visible>
                                </c:if>
                                <axis:visible f="axispro003" c="CDIVISA">
                                    <td class="campocaja">                                        
                                            <select name="CDIVISA" style="width:93%"  id="CDIVISA" size="1" onchange="" class="campowidthselect campo campotexto" <axis:atr f="axispro003" c="CDIVISA" a="obligatorio=true"/>
                                                 title="<axis:alt f="axispro003" c="CDIVISA" lit="108645"/>">&nbsp;                                        
                                                <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axispro003" c="CDIVISA" lit="108341"/> - </option>
                                                <c:forEach var="divisa" items="${axispro003_datos_generales.MONEDA}" varStatus="status">
                                                    <option value = "${divisa.CDIVISA}"  <c:if test="${__formdata.CDIVISA==divisa.CDIVISA}" >selected</c:if>  >
                                                        ${divisa.TDIVISA}
                                                    </option>
                                                </c:forEach>                                         
                                           </select>
                                        </td>  
                                </axis:visible>
                                <axis:visible f="axispro003" c="CCOMPANI">
                                    <td class="campocaja">                                        
                                            <select name="CCOMPANI" style="width:93%"  id="CCOMPANI" size="1" onchange="" class="campowidthselect campo campotexto" <axis:atr f="axispro003" c="CCOMPANI" a="obligatorio=false"/>
                                                 title="<axis:alt f="axispro003" c="CCOMPANI" lit="9901223"/>">&nbsp;                                        
                                                <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axispro003" c="CCOMPANI" lit="9901223"/> - </option>
                                                <c:forEach var="cias" items="${axispro003_datos_generales.CIAS}" varStatus="status">
                                                    <option value = "${cias.CCOMPANI}"  <c:if test="${__formdata.CCOMPANI==cias.CCOMPANI}" >selected</c:if>  >
                                                        ${cias.TCOMPANI}
                                                    </option>
                                                </c:forEach>                                         
                                           </select>
                                        </td>  
                                </axis:visible>
                            </tr>
                              <!--Tabla compañías -->
                            <axis:ocultar f="axispro003" c="TABLA_COMPANIAS" dejarHueco="false">                                 
                                 <tr>
                                    <td colspan="4" align="left">
                                        <div class="titulo" style="margin-left:10px;font-size: 11px;"><img src="images/flecha.gif"/><axis:alt f="axispro003" c="TABLA_COMPANIAS" lit="102082"/></div>
                                        &nbsp;
                                        <table class="seccion" cellpadding="0" cellspacing="0" align="right" style="width:99%">
                
                                        <tbody id="companyias" align="right">
                                        
                                           
                                                <tr>
                                                    <th style="width:26%;height:0px;"></th>
                                                    <th style="width:45%;height:0px"></th>
                                                    <th style="width:26%;height:0px;"></th>
                                                    <th style="width:3%;height:0px"></th>   
                                                </tr>
                                                <tr class="gridEvenHover">                                                                               
                                                    <td class="dspText" align="center"><b><axis:alt f="axispro003" c="TIT_0" lit="9000600"/></b></td>
                                                    <td class="dspText" align="center"><b><axis:alt f="axispro003" c="TIT_1" lit="100584"/></b></td>
                                                    <td class="dspText" align="center"><b><axis:alt f="axispro003" c="TIT_2" lit="9901239"/></b></td>                                        
                                                    <td>&nbsp;</td>
                                                    
                                                </tr>
                                                
                                                <!-- C:IF  SI EL OBJETO LISTA ES NULO PINTAMOS UNA LINEA EN BLANCO -->
                                                <%--c:if test="${empty COMPANIASSesion}">   <!-- sessionScope LCF -->
                                                    <%--tr tipo="ri" id="fila_0" class="gridNotEven" >                                        
                                                        <td class="dspText" colspan="4" align="center">
                                                      
                                                            <-select  name = "name_COMPANY_0"  id ="COMPANY_0" size="1" onchange="javascript:f_guardar_companyia(0);" class="campowidthselect campo campotexto" style="width:90%;">
                                                                <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axispro003" c="COMPANY_0" lit="108341"/> - </option>
                                                                <c:forEach items="${axispro003_datos_generales.CIAS}" var="cia">
                                                                    <option value = "${cia.CCOMPANI}">${cia.TCOMPANI}</option>
                                                                </c:forEach>                                                    
                                                            </select>
                                                        </td>
                                                        <td class="dspText">
                                                            <input type="text" class="campowidthinput campo campotexto" style="width:90%;" id="AGENTE_0" name="name_AGENTE_0" 
                                                            title="<axis:alt f="axispro003" c="AGENTE_0" lit="100584"/>"  size="15" onclick=""                                            
                                                            onchange="javascript:f_guardar_companyia(0);"
                                                            value=""/>
                                                        </td>
                                                        <td class="dspText">                                               
                                                            <select name = "name_PROD_0" id ="PROD_0" size="1" onchange="javascript:f_guardar_companyia(0);" class="campowidthselect campo campotexto" style="width:90%;">
                                                                <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axispro003" c="PROD_0" lit="108341"/> - </option>
                                                                <c:forEach items="${axispro003_datos_generales.PRODS}" var="prod">
                                                                    <option value = "${prod.SPRODUC}">${prod.TTITULO}</option>
                                                                </c:forEach>                                                    
                                                            </select>
                                                        </td>                                        
                                                        <td class="dspText">
                                                            <a  href="javascript:borrar_fila_companyia(0)"><img border="0" alt="<axis:alt f="axispro003" c="FILA_COMP_0" lit="1000127"/>" title="<axis:alt f="axispro003" c="FILA_COMP_0" lit="1000127"/>" src="images/delete.gif"/></a>
                                                        </td>                                            
                                                    </tr>
                                                 </c:if--%>
                                                <!--SI NO PINTAMOS LAS FILAS RELLENADAS -->
                                                
                                                
                                                 
                                                <c:if test="${!empty COMPANIASSesion}">         <!-- LCF -->                                                             
                                                
                                                    <c:forEach items="${COMPANIASSesion}" var="lista" varStatus="i">                                    
                                                    
                                                        <tr tipo="ri" id="fila_${i.count-1}" title="fila_${i.count-1}"
                                                            <c:if test="${i.count mod 2 ==0}">                                                                      
                                                                class="gridEven"                                                        
                                                            </c:if>
                                                            <c:if test="${i.count mod 2 !=0}">                                                                      
                                                                class="gridNotEven"                                                        
                                                            </c:if>
                                                        >                                        
                                                       
                                                            <td class="dspText">                                                    
                                                                <select   name = "name_COMPANY_${i.count-1}" obligatorio = "true" id ="COMPANY_${i.count-1}" size="1" onchange="javascript:f_guardar_companyia(${i.count-1},1);" class="campowidthselect campo campotexto" style="width:90%;" disabled="true">
                                                                    <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axispro003" c="COMPANY_${i.count-1}" lit="108341"/> - </option>
                                                                    <c:forEach items="${axispro003_datos_generales.CIAS}" var="cia">
                                                                        <option value = "${cia.CCOMPANI}" <c:if test="${cia.CCOMPANI  == lista.OB_IAX_COMPANIPROD.CCOMPANI}">selected</c:if>>${cia.TCOMPANI}</option>
                                                                    </c:forEach>                                                        
                                                                </select>
                                                            </td>
                                                            
                                                            <td class="dspText">
                                                                <input type="text" class="campowidthinput campo campotexto" style="width:90%;" id="AGENTE_${i.count-1}" name="name_AGENTE_${i.count-1}" 
                                                                title="AGENTE_${i.count-1}" size="15" onclick="" 
                                                                onchange="javascript:f_guardar_companyia(${i.count-1});"
                                                                value="${lista.OB_IAX_COMPANIPROD.CAGENCORR}"/>
                                                            </td> 
                                                            
                                                            <td class="dspText">                                               
                                                                <select  name = "name_PROD_${i.count-1}" id ="PROD_${i.count-1}" size="1" onchange="javascript:f_guardar_companyia(${i.count-1});" obligatorio="true" class="campowidthselect campo campotexto" style="width:90%;" disabled="true">
                                                                    <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axispro003" c="PROD_${i.count-1}" lit="108341"/> - </option>
                                                                    <c:forEach items="${axispro003_datos_generales.PRODS}" var="prod">                                                            
                                                                        <option value = "${prod.SPRODUC}" <c:if test="${prod.SPRODUC  == lista.OB_IAX_COMPANIPROD.SPRODUCESP}">selected</c:if>>${prod.TTITULO}</option>
                                                                    </c:forEach>                                                    
                                                                </select>
                                                            </td>                                                               
                                                            <td class="dspText">
                                                                <a href="javascript:borrar_fila_companyia(${i.count-1})"  id ="eliminar_${i.count-1}"><img border="0" alt="<axis:alt f="axispro003" c="TIT_BORRAR" lit="1000127"/>"  title="<axis:alt f="axispro003" c="TIT_BORRAR" lit="1000127"/>" src="images/delete.gif"/></a>
                                                            </td>                                                         
                                                        </tr>    
                                                    </c:forEach> 
                                                  </c:if>
                                                  <!--SI NO PINTAMOS LAS FILAS RELLENADAS -->
                                            <!-- ******************** fin filas: boton anyadir  ******************************** -->                                            
                                            </tbody>                                            
                                        </table>
                                    </td>
                                </tr>                            
                            <!--Fin tabla compañías -->
                            <tr>
                              <td colspan="4">
                                <table cellpadding="0" cellspacing="0">
                                  <tr>
                                        <th style="width:25%;height:0px;"></th>
                                        <th style="width:40%;height:0px"></th>
                                        <th style="width:25%;height:0px;"></th>
                                        <th style="width:10%;height:0px"></th>   
                                    </tr>
                                    <tr>
                                        <td>&nbsp;</td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                    <tr>                  
                                        <td></td>
                                        <td></td>
                                        <td style="text-align:right">
                                                <input type="button" class="boton" id="but_anadir" value="<axis:alt f="axispro003" c="BUT_ANYADIR" lit="104825"/>" onclick="javascript:anyadir_fila_companyia()" />
                                        </td>
                                        <td></td>
                                    </tr>
                                </table>
                               </td>                                        
                            </tr>
                            </axis:ocultar>

                            <!-- FIN tabala virtual-->
                            
                           
                        </table>

                        </td> 
                </tr>
                
          </table>
          

        </td>
        </tr>
    </table>
        
        
        
        <!-- Área de campos -->
        <c:import url="../include/botonera_nt.jsp">
            <c:param name="f">axispro003</c:param>
            <c:param name="__botones">cancelar,aceptar</c:param>
        </c:import>
    </form>
    
    <c:import url="../include/mensajes.jsp" />
    
</body>
</html>
