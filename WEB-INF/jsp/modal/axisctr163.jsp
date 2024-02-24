

<%--
      NOMBRE:    axisctr163.jsp
      @author <a href = "mailto:xpastor@csi-ti.com">Xavi Pastor</a>
      Fecha: 02/11/2010
      PROPÓSITO (descripción pantalla):  Desglose de Garantías
  
      REVISIONES:
      Ver        Fecha        Autor             Descripción
      ---------  ----------  ---------------  ------------------------------------
      1.0        02/11/2010   XPL(iniciales)     1. 16191: CRT - Detalle de capitales por garantia

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

            /****************************************************************************************/
            /*********************************** NAVEGACION *****************************************/
            /****************************************************************************************/            
            function f_onload(){
	 	f_cargar_propiedades_pantalla();
	    }
            
            
           
           function f_but_aceptar() {
                if (objValidador.validaEntrada()){
                 parent.f_cerrar_modal('axisctr163');
                }
           }
           
           function f_but_cancelar() {
           	     objAjax.invokeAsyncCGI("modal_axisctr163.do", callbackAjaxCancelarDesglose, "operation=ajax_cancelar_desglose", this, objJsMessages.jslit_cargando);
           }
           function f_but_salir(){
	           parent.f_cerrar_modal('axisctr163');
           }
        
  // **************************************
    // **************************************
    // Añadir nueva fila a tabla compañía
    // **************************************
    // **************************************
        
    function anyadir_fila_desglose(){    
             //primero llamamos a la funcion que nos devuelve el número de filas rellenadas
             //sabremos que el id_ sera i+1
             var numero_filas = obtenerNuevoIndice(); //Si el número de filas =3 la siguiente será 3          
             
             //alert("valor de la nueva fila:"+numero_filas)
             // recogemos el tag de companyias
             var table_desglose = document.getElementById("desglose");     
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
              <axis:visible f="axisctr163" c="CCONCEPTO">
             //creamos el td de companyia i la apariencia
             var mitd = document.createElement("td");         
             mitd.setAttribute('class','dspText');     
             mitd.className ="dspText";                  
             //Creamos el select de comppanyia
             var miselect = document.createElement("select");            
                    var texto_concepto = 'CCONCEPTO_'+numero_filas;
                    miselect.setAttribute('class','campowidthselect campo campotexto'); //Será obligatorio?
                    miselect.className="campowidthselect campo campotexto";            
                    miselect.style.width="90%";
                    miselect.setAttribute('id',texto_concepto);
                    miselect.setAttribute('name',texto_concepto);
                    miselect.name=texto_concepto;
                    miselect.style.fontFamily="arial";
                    miselect.style.fontSize="11px";
                    miselect.style.backgroundColor="#F7FFD6";
                    miselect.onchange = function (evt) {
                    f_guardar_desglose(numero_filas);                        
                    };
              
             var mioption = document.createElement("option");
             //Primer option con min value
             mioption.setAttribute('value', <%= Integer.MIN_VALUE %>);
             miconcepto=document.createTextNode('- ' + '<axis:alt f="axisctr163" c="SNV_COMBO" lit="108341"/>' + ' -');
             mioption.appendChild(miconcepto);
             miselect.appendChild(mioption);
            
            /* for(i=0;i < companias.length;i++){
                 var mioption = document.createElement("option");
                 
                 mioption.setAttribute('value', companias[i][0]);
                 micompani=document.createTextNode(companias[i][1]);            
                 mioption.appendChild(micompani);
                 miselect.appendChild(mioption);
             } */
             
             
             //Cargamos select copmpañías en el TD
             mitd.appendChild(miselect);
             </axis:visible>
             <axis:visible f="axisctr163" c="TDESCRIPCION">
             //creamos nuevo TD de agentes y le damos la apariéncia    
             var desctd=document.createElement("td");
             desctd.setAttribute('class','dspText');
             desctd.className="dspText";
             var descinput = document.createElement("input");
                    //anyadir variables al input
                    var texto_desc='TDESCRIPCION_'+numero_filas;
                    descinput.setAttribute('id',texto_desc);  
                    descinput.setAttribute('obligatorio','true');   
                    descinput.setAttribute('class','campowidthinput campo campotexto'); //Será obligatorio?
                    descinput.className="campowidthinput campo campotexto";                    
                    descinput.setAttribute('title','TDESCRIPCION_'+numero_filas);
                    descinput.setAttribute('name',texto_desc);
                    descinput.name=texto_desc;
                    descinput.setAttribute('type','text');
                    descinput.type="text";
                    descinput.style.width="90%";
                    descinput.style.fontFamily="arial";
                    descinput.style.fontSize="11px";                               
                    //Asignar al onchange la función AJAX de actualixación.
                    descinput.onchange = function (evt) {
                        f_guardar_desglose(numero_filas);                        
                    };
            //Cargamos el campo agente en el TD de agente.
             desctd.appendChild(descinput);
               
            </axis:visible>
             <axis:visible f="axisctr163" c="ICAPITAL">
             //creamos nuevo TD de agentes y le damos la apariéncia    
             var icaptd=document.createElement("td");
             icaptd.setAttribute('class','dspText');
             icaptd.className="dspText";
             var descinput = document.createElement("input");
                    //anyadir variables al input
                    var texto_desc='ICAPITAL_'+numero_filas;
                    descinput.setAttribute('id',texto_desc);    
                    descinput.setAttribute('formato','decimal');   
                    descinput.setAttribute('obligatorio','true');   
                    descinput.setAttribute('class','campowidthinput campo campotexto'); //Será obligatorio?
                    descinput.className="campowidthinput campo campotexto";                    
                    descinput.setAttribute('title','ICAPITAL_'+numero_filas);
                    descinput.setAttribute('name',texto_desc);
                    descinput.name=texto_desc;
                    descinput.setAttribute('type','text');
                    descinput.type="text";
                    descinput.style.width="90%";
                    descinput.style.fontFamily="arial";
                    descinput.style.fontSize="11px";                               
                    //Asignar al onchange la función AJAX de actualixación.
                    descinput.onchange = function (evt) {
                        f_guardar_desglose(numero_filas);                        
                    };
            //Cargamos el campo agente en el TD de agente.
             icaptd.appendChild(descinput);
             
             var deschidden = document.createElement("input");
                    //anyadir variables al input
                    var texto_desc='NORDEN_'+numero_filas;
                    deschidden.setAttribute('id',texto_desc);    
                    deschidden.setAttribute('name',texto_desc);
                    deschidden.name=texto_desc;
                    deschidden.setAttribute('type','hidden');
                    deschidden.type="hidden";
                    icaptd.appendChild(deschidden);
            </axis:visible>
              <axis:visible f="axisctr163" c="ELIMINAR">
            //Creamos TD para el sigo de eliminación de fila 
            var imgtd=document.createElement("td");
            imgtd.setAttribute('class','dspText');       
            imgtd.className="dspText";
            var ael = document.createElement("a");
                var stringId = "eliminar_"+numero_filas;
                ael.setAttribute('id',stringId);
            var funcion_borrar = "javascript:borrar_fila_desglose("+ numero_filas +")";
                ael.setAttribute('href',funcion_borrar);
            var imgel = document.createElement("img");
                imgel.setAttribute('border','0');
                imgel.setAttribute('src','images/delete.gif');
                ael.appendChild(imgel);        
             //Cargamos el icono eliminar en el TD     
            imgtd.appendChild(ael);   
            </axis:visible>
            // Apend en el tr todos los td's de los campos
            <axis:visible f="axisctr163" c="CCONCEPTO">
            mitr.appendChild(mitd);
            </axis:visible>
            <axis:visible f="axisctr163" c="TDESCRIPCION">
            mitr.appendChild(desctd);
            </axis:visible>
             <axis:visible f="axisctr163" c="ICAPITAL">
             mitr.appendChild(icaptd);
             </axis:visible>
              <axis:visible f="axisctr163" c="ELIMINAR">
            mitr.appendChild(imgtd);  
            </axis:visible>
            //Por último añadimos el TR a la tabla
            table_desglose.appendChild(mitr);
            revisarEstilos();
            sumaIndice();
    }
         // **************************************
        // **************************************
        // Sumamos uno al número total de filas
        // **************************************
        // **************************************
        function sumaIndice(){    
            var filas = 0;
            filas = document.getElementById("NCONCEP").value;
            filas = ++filas;
            document.getElementById("NCONCEP").value = filas;   
        } 

         // **************************************
        // **************************************
        // Recalculammos el índice de una nueva fila
        // **************************************
        // **************************************
        function obtenerNuevoIndice(){    
            var filas = 0;
            filas = document.getElementById("NCONCEP").value;
            filas = ++filas;
            return filas;   
        }

    function borrar_fila_desglose(num){         
        //Si elimino una fila con compañia asociada, recargo la pantalla
      /*  if(document.getElementById("COMPANY_"+num).value != <%= Integer.MIN_VALUE %>){        
            //Es una fila existente en BBDD, lo eliminamos primero en BBDD
            f_ajax_eliminar_companyia(num);            
            }
         //Si es una fila, generada sin compañia asiciada, lo elimino por JS   
         else{       */     
                borrar_fila_desglose_js(num);               
          //  }       
    }
    // **************************************
    // **************************************
    // Borra una fila determinada por js
    // **************************************
    // **************************************
    function borrar_fila_desglose_js(num){         
           f_del_desglose(num);  
               //Control de única fila, si es la única del grid no la borramos visualmente
               if(obtenerNuevoIndice() != 1){
                    var table_desglose = document.getElementById("desglose");
                    var elemento = document.getElementById("fila_"+num); //selecciona el tr correspondiente  
                    
                    
                   
                    table_desglose.removeChild(elemento);
                    
                    
                   // modificarIdentificadorsPostEliminacioDesglose(num);
               }else{
               //La fila está vacia, sin compañia, y además es la única, no se puede eliminar
                  /*  var table_companyias = document.getElementById("companyias");
                    var elemento = document.getElementById("fila_"+num); //selecciona el tr correspondiente   
                    table_companyias.removeChild(elemento);*/
                    
                    try{
                    document.getElementById("ICAPITAL_"+num).value = '';
                     document.getElementById("TDESCRIPCION_"+num).value = '';
                    document.getElementById("NORDEN_"+num).value = '';
                    document.getElementById("CCONCEPTO_"+num).value = '';
                    document.getElementById("TCONCEPTO_"+num).value = '';
                    }catch(e){}
                    

               }
               
               
           
               
    }
    
     // **************************************
    // **************************************
    // Actualiza los componentes al eliminar una fila por js
    // **************************************
    // **************************************
    
    function modificarIdentificadorsPostEliminacioDesglose(filaEliminada){    
        
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
                    f_guardar_companyia(numero);                        
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

 function f_guardar_desglose(num_fila_guardar){                 
      try{
                 var CCONCEPTO = document.getElementById("CCONCEPTO_"+num_fila_guardar).value;
                 }catch(e){}
                 try{
                    var TDESCRIPCION = document.getElementById("TDESCRIPCION_"+num_fila_guardar).value;
                    }catch(e){}
                 try{
                    var ICAPITAL = document.getElementById("ICAPITAL_"+num_fila_guardar).value;
                    }catch(e){}
                 try{
                    var NORDEN = document.getElementById("NORDEN_"+num_fila_guardar).value;
                    }catch(e){}
                 try{
                    var CGARANT = document.getElementById("CGARANT").value;
                    }catch(e){}
                 
                    
                    objAjax.invokeAsyncCGI("modal_axisctr163.do?CCONCEPTO="+CCONCEPTO+"&TDESCRIPCION="+TDESCRIPCION+"&ICAPITAL="+ICAPITAL+"&NORDEN="+NORDEN+"&CGARANT="+CGARANT, callbackAjaxGuardarDesglose, "operation=ajax_guardar_detalle", this, objJsMessages.jslit_cargando,num_fila_guardar);
          
    }
    
    function f_del_desglose(num_fila_guardar){                 
  
                 try{
                    var NORDEN = document.getElementById("NORDEN_"+num_fila_guardar).value;
                    }catch(e){}
                 try{
                    var CGARANT = document.getElementById("CGARANT").value;
                    }catch(e){}
                 objAjax.invokeAsyncCGI("modal_axisctr163.do?NORDEN="+NORDEN+"&CGARANT="+CGARANT, callbackAjaxEliminarDesglose, "operation=ajax_del_detalle", this, objJsMessages.jslit_cargando,num_fila_guardar);
          
    }

    function callbackAjaxGuardarDesglose(ajaxResponseText, num_fila) {
                try {                
                var doc = objAjax.domParse(ajaxResponseText);
                if (!objAppMensajes.existenErroresEnAplicacion(doc)){                
                    // Verificamos que no se han producido excepciones JAVA ni errores en la peticion PL (en este orden)
                    if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("PNSEQ_OUT")[0]) ) {  
                          
                          document.getElementById("NORDEN_"+num_fila).value  = objDom.getValorNodoDelComponente(doc.getElementsByTagName("PNSEQ_OUT"), 0, 0)
                            
                    }
                 }
                
                } catch (e) {
                    if (isDebugAjaxEnabled == "true")
                        alert (e.name + " " + e.message);
                }
                   
    }     
    
     function callbackAjaxEliminarDesglose(ajaxResponseText, num_fila) {
                try {                
                var doc = objAjax.domParse(ajaxResponseText);
                if (!objAppMensajes.existenErroresEnAplicacion(doc)){                
                    // Verificamos que no se han producido excepciones JAVA ni errores en la peticion PL (en este orden)
                 null;
                 }
                
                } catch (e) {
                    if (isDebugAjaxEnabled == "true")
                        alert (e.name + " " + e.message);
                }
                   
    }  
    
    function callbackAjaxCancelarDesglose(ajaxResponseText) {
                try {                
                var doc = objAjax.domParse(ajaxResponseText);
                if (!objAppMensajes.existenErroresEnAplicacion(doc)){                
                    // Verificamos que no se han producido excepciones JAVA ni errores en la peticion PL (en este orden)
                    parent.f_cerrar_modal('axisctr163');
                 }
                
                } catch (e) {
                    if (isDebugAjaxEnabled == "true")
                        alert (e.name + " " + e.message);
                }
                   
    } 
              
        </script>
    </head>
 <body class=" " onload="f_onload()" onkeypress="if (event.keyCode==13)  { f_but_buscar() }">
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
        <form name="miForm" action="" method="POST">
            <input type="hidden" id="operation" name="operation" value=""/>
            
            <input type="hidden" id="tipo" name="tipo" value="${__formdata.tipo}"/>
            
            <input type="hidden" id="SSEGURO" name="SSEGURO" value="${__formdata.SSEGURO}"/>
            <input type="hidden" id="NRIESGO" name="NRIESGO" value="${__formdata.NRIESGO}"/>
            <input type="hidden" id="NMOVIMI" name="NMOVIMI" value="${__formdata.NMOVIMI}"/>
            <input type="hidden" id="CGARANT" name="CGARANT" value="${__formdata.CGARANT}"/>
            <input type="hidden" id="TGARANT" name="TGARANT" value="${__formdata.TGARANT}"/>
            <input type="hidden" id="NCONCEP" name="NCONCEP" value="0"/>
            
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt c="LIT_FORM" f="axisctr163" lit="180183"/></c:param>
                <c:param name="producto"><axis:alt c="LIT_FORM" f="axisctr163" lit="180183"/></c:param>
                <c:param name="form">axisctr163</c:param>
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
                            
                                <axis:ocultar f="axisctr163" c="DSP_DESGLOSE" dejarHueco="false"> <!-- TODO C -->
                                <tr>
                                    <td class="campocaja" colspan="4">
                                                                                        
                                               <div class="titulo"><img src="images/flecha.gif"/><axis:alt c="DSP_TITULO" f="axisctr163" lit="180183"/> - ${__formdata.TGARANT}</div>
                                        &nbsp;
                                        <table class="seccion" cellpadding="0" cellspacing="0" align="right" style="width:99%">
                
                                        <tbody id="desglose" align="right">
                                        
                                           
                                                <tr>
                                                <axis:ocultar f="axisctr163" c="CCONCEPTO" dejarHueco="false">
                                                    <th style="width:26%;height:0px;"></th>
                                                </axis:ocultar>
                                                    <th style="width:45%;height:0px"></th>
                                                    <th style="width:26%;height:0px;"></th>
                                                    <th style="width:3%;height:0px"></th>   
                                                </tr>
                                                <tr class="gridEvenHover">   
                                                
                                                <axis:ocultar f="axisctr163" c="CCONCEPTO" dejarHueco="false">
                                                    <td class="dspText" align="center"><b><axis:alt c="CCONCEPTO" f="axisctr163" lit="9000715"/></b></td>
                                                </axis:ocultar>
                                                
                                                <axis:ocultar f="axisctr163" c="TDESCRIPCION" dejarHueco="false">
                                                    <td class="dspText" align="center"><b><axis:alt c="TDESCRIPCION" f="axisctr163" lit="100588"/></b></td>
                                                </axis:ocultar>
                                                <axis:ocultar f="axisctr163" c="ICAPITAL" dejarHueco="false">
                                                    <td class="dspText" align="center"><b><axis:alt c="ICAPITAL" f="axisctr163" lit="1000073"/></b></td>                                        
                                                </axis:ocultar>
                                                <axis:ocultar f="axisctr163" c="ELIMINAR" dejarHueco="false">
                                                    <td>&nbsp;</td>
                                                  </axis:ocultar>  
                                                </tr>
                                                
                                                <!-- C:IF  SI EL OBJETO LISTA ES NULO PINTAMOS UNA LINEA EN BLANCO -->
                                                <c:if test="${empty __formdata.DESGLOSE}">  
                                                    <tr tipo="ri" id="fila_0" class="gridNotEven" >   
                                                     
                                                    <axis:ocultar f="axisctr163" c="CCONCEPTO" dejarHueco="false">
                                                        <td class="dspText">                                        
                                                                 <select  name = "CCONCEPTO_0" id ="CCONCEPTO_0" size="1" 
                                                                title="<axis:alt c='CCONCEPTO' f='axisctr163' lit='9000715'/>"  
                                                                <axis:atr f="axisctr163" c="CCONCEPTO" a="obligatorio=true&modificable=true&isInputText=false"/>
                                                                onchange="javascript:f_guardar_desglose(0);" class="campowidthselect campo campotexto" style="width:90%;">
                                                                    <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisctr163" c="SNV_COMBO" lit="108341"/> - </option>
                                                                    <c:forEach items="${__formdata.listValores.conceptos}" var="con">                                                            
                                                                        <option value = "${con.CCONCEPTO}">${con.TCONCEPTO}</option>
                                                                    </c:forEach>                                                    
                                                            </select>
                                                        </td>
                                                    </axis:ocultar>
                                                   
                                                    <axis:ocultar f="axisctr163" c="TDESCRIPCION" dejarHueco="false">
                                                        <td class="dspText">
                                                            <input type="text" class="campowidthinput campo campotexto" style="width:90%;" id="TDESCRIPCION_0" 
                                                            name="TDESCRIPCION_0" 
                                                            <axis:atr f="axisctr163" c="TDESCRIPCION" a="obligatorio=true&modificable=true"/>
                                                            title="<axis:alt c='TDESCRIPCION' f='axisctr163' lit='100588'/>"  size="15" onclick=""                                            
                                                            onchange="javascript:f_guardar_desglose(0);"
                                                            value=""/>
                                                        </td>
                                                    </axis:ocultar>
                                                     <axis:ocultar f="axisctr163" c="ICAPITAL" dejarHueco="false">
                                                        <td class="dspText">                                               
                                                            <input type="text" class="campowidthinput campo campotexto" style="width:90%;" id="ICAPITAL_0" name="ICAPITAL_0" 
                                                            title="<axis:alt c='ICAPITAL' f='axisctr163' lit='1000073'/>"  size="15" onclick=""
                                                            <axis:atr f="axisctr163" c="ICAPITAL" a="obligatorio=true&modificable=true&formato=decimal"/>
                                                            onchange="javascript:f_guardar_desglose(0);"
                                                            value=""/>
                                                            <input type="hidden"  id="NORDEN_0" name="NORDEN_0"  
                                                                value=""/>
                                                        </td>        
                                                    </axis:ocultar>
                                                    <axis:ocultar f="axisctr163" c="ELIMINAR" dejarHueco="false">
                                                        <td class="dspText">
                                                            <a  href="javascript:borrar_fila_desglose(0)"><img border="0" alt="<axis:alt f="axisctr163" c="DELETE" lit="1000127" />" title="<axis:alt f="axisctr163" c="DELETE" lit="1000127" />" src="images/delete.gif"/></a>
                                                        </td>  
                                                    </axis:ocultar>
                                                    </tr>
                                                 </c:if>
                                                <!--SI NO PINTAMOS LAS FILAS RELLENADAS -->
                                                
                                                
                                                 
                                                <c:if test="${!empty __formdata.DESGLOSE}">                                                                      
                                                
                                                    <c:forEach items="${__formdata.DESGLOSE}" var="lista" varStatus="i">                                    
                                                    
                                                        <tr tipo="ri" id="fila_${i.count-1}" title="fila_${i.count-1}"
                                                            <c:if test="${i.count mod 2 ==0}">                                                                      
                                                                class="gridEven"                                                        
                                                            </c:if>
                                                            <c:if test="${i.count mod 2 !=0}">                                                                      
                                                                class="gridNotEven"                                                        
                                                            </c:if>
                                                        >                                        
                                                       <axis:ocultar f="axisctr163" c="CCONCEPTO" dejarHueco="false">
                                                            <td class="dspText">                                                    
                                                                <select  name = "CCONCEPTO_${i.count-1}" id ="CCONCEPTO_${i.count-1}" size="1" 
                                                                title="<axis:alt c='CCONCEPTO' f='axisctr163' lit='9000715'/>"
                                                                <axis:atr f="axisctr163" c="CCONCEPTO" a="obligatorio=true&modificable=true&isInputText=false"/>
                                                                onchange="javascript:f_guardar_desglose(${i.count-1});" class="campowidthselect campo campotexto" style="width:90%;">
                                                                    <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisctr163" c="SNV_COMBO" lit="108341"/> - </option>
                                                                    <c:forEach items="${__formdata.listValores.conceptos}" var="con">                                                            
                                                                        <option value = "${con.CCONCEPTO}" <c:if test="${con.CCONCEPTO  == lista.OB_IAX_GARANTIAS.desglose[i].CCONCEPTO}">selected</c:if>>${con.TCONCEPTO}</option>
                                                                    </c:forEach>                                                    
                                                                </select>
                                                            </td>
                                                            </axis:ocultar>
                                                             <axis:ocultar f="axisctr163" c="TDESCRIPCION" dejarHueco="false">
                                                            <td class="dspText">
                                                                <input type="text" class="campowidthinput campo campotexto" style="width:90%;" id="TDESCRIPCION_${i.count-1}" name="TDESCRIPCION_${i.count-1}" 
                                                                 title="<axis:alt c='TDESCRIPCION' f='axisctr163' lit='100588'/>" size="15" onclick="" 
                                                                onchange="javascript:f_guardar_desglose(${i.count-1});"
                                                                <axis:atr f="axisctr163" c="TDESCRIPCION" a="obligatorio=true&modificable=true"/>
                                                                value="${lista.OB_IAX_DESGLOSE_GAR.TDESCRIPCION}"/>
                                                               
                                                                <input type="hidden"  id="NORDEN_${i.count-1}" name="NORDEN_${i.count-1}"  
                                                                value="${lista.OB_IAX_DESGLOSE_GAR.NORDEN}"/>
                                                            </td> 
                                                            </axis:ocultar>
                                                            <axis:ocultar f="axisctr163" c="ICAPITAL" dejarHueco="false">
                                                            <td class="dspText">                                               
                                                               <input type="text" class="campowidthinput campo campotexto" style="width:90%;" id="ICAPITAL_${i.count-1}" name="ICAPITAL_${i.count-1}" 
                                                                title="<axis:alt c='ICAPITAL' f='axisctr163' lit='1000073'/>" size="15" onclick="" 
                                                                onchange="javascript:f_guardar_desglose(${i.count-1});" 
                                                                <axis:atr f="axisctr163" c="ICAPITAL" a="obligatorio=true&modificable=true&formato=decimal"/>
                                                                value="<fmt:formatNumber pattern='${__formatNumberPatterns[__defaultCMONINT]}' value='${lista.OB_IAX_DESGLOSE_GAR.ICAPITAL}'/>"/>
                                                            </td>     
                                                            </axis:ocultar>
                                                              <axis:ocultar f="axisctr163" c="ELIMINAR" dejarHueco="false">
                                                            <td class="dspText">
                                                                <a href="javascript:borrar_fila_desglose(${i.count-1})"  id ="eliminar_${i.count-1}"><img border="0" alt="<axis:alt f="axisctr163" c="DELETE" lit="1000127" />"  title="<axis:alt f="axisctr163" c="DELETE" lit="1000127"/>" src="images/delete.gif"/></a>
                                                                <script type="text/javascript">
                                                                    document.getElementById("NCONCEP").value = "${i.count-1}";
                                                                </script>
                                                            </td>   
                                                            </axis:ocultar>
                                                        </tr>    
                                                    </c:forEach> 
                                                  </c:if>
                                                <!--SI NO PINTAMOS LAS FILAS RELLENADAS -->
                                            <!-- ******************** fin filas: boton anyadir  ******************************** -->                                            
                                            </tbody>  
                                            
                                        </table>
                                             
                                            
                                    </td>
                                    </tr>
                                    <tr>
                                    	 <axis:visible f="axisctr163" c="BUT_ANADIR" >
                                        <td style="text-align:right" colspan="4">
                                                    <input type="button" class="boton" id="but_anadir" value="<axis:alt f="axisctr163" c="ANADIR" lit="104825" />" onclick="javascript:anyadir_fila_desglose()" />
                                        </td>
                                        </axis:visible>
                                     </tr>       
                                </axis:ocultar> 
                               
                            
                               
                           
                            
                            
                        </table>
                       
                     
                    </td>
                </tr>
            </table>
    
     </form>
    
    

<c:import url="../include/botonera_nt.jsp"><c:param name="f">axisctr163</c:param><c:param name="f">axisctr163</c:param>
           <c:param name="f">axisctr163</c:param>
            <c:param name="__botones"><axis:ocultar f="axisctr163" c = "BT_SALIR">salir,</axis:ocultar><axis:ocultar f="axisctr163" c = "BT_CANCELAR" dejarHueco="false">cancelar</axis:ocultar><axis:ocultar f="axisctr163" c = "BT_ACEPTAR" dejarHueco="false">,aceptar</axis:ocultar> </c:param>

</c:import>
<c:import url="../include/mensajes.jsp" />
    
</body>
</html>


