<%--
      NOMBRE:    axisctr160.jsp
      @author <a href = "mailto:joan_torres@csi-ti.com">Joan Torres</a>
      Fecha: 20/10/2010
      PROPÓSITO (descripción pantalla): Definición de reglas de colectivo
  
      REVISIONES:
      Ver        Fecha        Autor             Descripción
      ---------  ----------  ---------------  ------------------------------------
      1.0        20/10/2010   JTS               1. Creación de la pantalla. Bug.16106
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
	    
            function f_cargar_propiedades_pantalla(){
 	    	f_cargapropietatexpander();
                f_cargar_valores_defecto();
                objDependencias.modificarPropiedadesSegunModificableYVisible();
                f_carga_dependencias();
                revisarEstilos();
            }
           
           function f_but_aceptar() {
                 try{
                    var LMINEMP = document.getElementById("LMINEMP").value;
                 }catch(e){}
                 try{
                    var LMINTRA = document.getElementById("LMINTRA").value;
                 }catch(e){}
                 try{
                    var LMAXEMP = document.getElementById("LMAXEMP").value;
                 }catch(e){}
                 try{
                    var LMAXTRA = document.getElementById("LMAXTRA").value;
                 }catch(e){}
                 var err = 0;
                 
                 if(LMINEMP>LMAXEMP){
                    err = 1;
                    alert("<fmt:message key="9901612"/>");
                 }
                 if(LMINTRA>LMAXTRA){
                    err = 1;
                    alert("<fmt:message key="9901612"/>");
                 }
                 if (err == 0){
                    objAjax.invokeAsyncCGI("modal_axisctr160.do?LMINEMP="+LMINEMP+"&LMINTRA="+LMINTRA+"&LMAXEMP="+LMAXEMP+"&LMAXTRA="+LMAXTRA, callbackAjaxAceptar, "operation=ajax_guardar", this, objJsMessages.jslit_cargando,1);  
                 }
           }
           
           function f_but_cancelar() {
                parent.f_cerrar_axisctr160('axisctr160');
           }
           
            // **************************************
            // **************************************
            // Recalculammos el índice de una nueva fila
            // **************************************
            // **************************************
            function obtenerNuevoIndice(){    
                    var table_tramos = document.getElementById("tramos");
                     if(table_tramos!=null){
                     var tr_companyias = table_tramos.getElementsByTagName("tr");
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
                     return 0;
                     }          
            }
            
            // **************************************
            // **************************************
            // Añadir nueva fila a tabla tramos
            // **************************************
            // **************************************
                
            function anyadir_fila_tramos(){    
                     //primero llamamos a la funcion que nos devuelve el número de filas rellenadas
                     //sabremos que el id_ sera i+1
                     var numero_filas = obtenerNuevoIndice(); //Si el número de filas =3 la siguiente será 3
                     //
                     objAjax.invokeAsyncCGI("modal_axisctr160.do?PNUMBLOQ="+(numero_filas+1), callbackAjaxAltaTramo, "operation=ajax_new_detalle", this, objJsMessages.jslit_cargando,(numero_filas+1));
                     //                     
                     //alert("valor de la nueva fila:"+numero_filas)
                     // recogemos el tag de companyias
                     var table_tramos = document.getElementById("tramos");     
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
 
                     <axis:visible f="axisctr160" c="EDADINI">
                         //creamos nuevo TD de agentes y le damos la apariéncia    
                         var edini=document.createElement("td");
                         edini.setAttribute('class','dspText');
                         edini.className="dspText";
                         var descinput = document.createElement("input");
                                //anyadir variables al input
                                var texto_desc='EDADINI_'+numero_filas;
                                descinput.setAttribute('id',texto_desc);  
                                descinput.setAttribute('obligatorio','true');   
                                descinput.setAttribute('class','campowidthinput campo campotexto'); //Será obligatorio?
                                descinput.className="campowidthinput campo campotexto";                    
                                descinput.setAttribute('title','EDADINI_'+numero_filas);
                                descinput.setAttribute('name',texto_desc);
                                descinput.name=texto_desc;
                                descinput.setAttribute('type','text');
                                descinput.type="text";
                                descinput.value="0";
                                descinput.style.width="90%";
                                descinput.style.fontFamily="arial";
                                descinput.style.fontSize="11px";                               
                                //Asignar al onchange la función AJAX de actualixación.
                                descinput.onchange = function (evt) {
                                    //f_guardar_desglose(numero_filas);                        
                                    //alert(numero_filas);
                                    f_guardar_tramo(numero_filas);
                                };
                         //Cargamos el campo agente en el TD de agente.
                         edini.appendChild(descinput);
                     </axis:visible>
                     
                     <axis:visible f="axisctr160" c="EDADFIN">
                         //creamos nuevo TD de agentes y le damos la apariéncia    
                         var edfin=document.createElement("td");
                         edfin.setAttribute('class','dspText');
                         edfin.className="dspText";
                         var descinput = document.createElement("input");
                                //anyadir variables al input
                                var texto_desc='EDADFIN_'+numero_filas;
                                descinput.setAttribute('id',texto_desc);  
                                descinput.setAttribute('obligatorio','true');   
                                descinput.setAttribute('class','campowidthinput campo campotexto'); //Será obligatorio?
                                descinput.className="campowidthinput campo campotexto";                    
                                descinput.setAttribute('title','EDADFIN_'+numero_filas);
                                descinput.setAttribute('name',texto_desc);
                                descinput.name=texto_desc;
                                descinput.setAttribute('type','text');
                                descinput.type="text";
                                descinput.value="0";
                                descinput.style.width="90%";
                                descinput.style.fontFamily="arial";
                                descinput.style.fontSize="11px";                               
                                //Asignar al onchange la función AJAX de actualixación.
                                descinput.onchange = function (evt) {
                                    //f_guardar_desglose(numero_filas);                        
                                    //alert(numero_filas);
                                    f_guardar_tramo(numero_filas);
                                };
                         //Cargamos el campo agente en el TD de agente.
                         edfin.appendChild(descinput);
                     </axis:visible>
                     
                     <axis:visible f="axisctr160" c="T1EMP">
                         //creamos nuevo TD de agentes y le damos la apariéncia    
                         var t1emp=document.createElement("td");
                         t1emp.setAttribute('class','dspText');
                         t1emp.className="dspText";
                         var descinput = document.createElement("input");
                                //anyadir variables al input
                                var texto_desc='T1EMP_'+numero_filas;
                                descinput.setAttribute('id',texto_desc);  
                                descinput.setAttribute('obligatorio','true');   
                                descinput.setAttribute('class','campowidthinput campo campotexto'); //Será obligatorio?
                                descinput.className="campowidthinput campo campotexto";                    
                                descinput.setAttribute('title','T1EMP_'+numero_filas);
                                descinput.setAttribute('name',texto_desc);
                                descinput.name=texto_desc;
                                descinput.setAttribute('type','text');
                                descinput.type="text";
                                descinput.value="0";
                                descinput.style.width="90%";
                                descinput.style.fontFamily="arial";
                                descinput.style.fontSize="11px";                               
                                //Asignar al onchange la función AJAX de actualixación.
                                descinput.onchange = function (evt) {
                                    //f_guardar_desglose(numero_filas);                        
                                    //alert(numero_filas);
                                    f_guardar_tramo(numero_filas);
                                };
                         //Cargamos el campo agente en el TD de agente.
                         t1emp.appendChild(descinput);
                     </axis:visible>
                     <axis:visible f="axisctr160" c="T2EMP">
                         //creamos nuevo TD de agentes y le damos la apariéncia    
                         var t2emp=document.createElement("td");
                         t2emp.setAttribute('class','dspText');
                         t2emp.className="dspText";
                         var descinput = document.createElement("input");
                                //anyadir variables al input
                                var texto_desc='T2EMP_'+numero_filas;
                                descinput.setAttribute('id',texto_desc);  
                                descinput.setAttribute('obligatorio','true');   
                                descinput.setAttribute('class','campowidthinput campo campotexto'); //Será obligatorio?
                                descinput.className="campowidthinput campo campotexto";                    
                                descinput.setAttribute('title','T2EMP_'+numero_filas);
                                descinput.setAttribute('name',texto_desc);
                                descinput.name=texto_desc;
                                descinput.setAttribute('type','text');
                                descinput.type="text";
                                descinput.value="0";
                                descinput.style.width="90%";
                                descinput.style.fontFamily="arial";
                                descinput.style.fontSize="11px";                               
                                //Asignar al onchange la función AJAX de actualixación.
                                descinput.onchange = function (evt) {
                                    //f_guardar_desglose(numero_filas);                        
                                    //alert(numero_filas);
                                    f_guardar_tramo(numero_filas);
                                };
                         //Cargamos el campo agente en el TD de agente.
                         t2emp.appendChild(descinput);
                     </axis:visible>
                     <axis:visible f="axisctr160" c="T3EMP">
                         //creamos nuevo TD de agentes y le damos la apariéncia    
                         var t3emp=document.createElement("td");
                         t3emp.setAttribute('class','dspText');
                         t3emp.className="dspText";
                         var descinput = document.createElement("input");
                                //anyadir variables al input
                                var texto_desc='T3EMP_'+numero_filas;
                                descinput.setAttribute('id',texto_desc);  
                                descinput.setAttribute('obligatorio','true');   
                                descinput.setAttribute('class','campowidthinput campo campotexto'); //Será obligatorio?
                                descinput.className="campowidthinput campo campotexto";                    
                                descinput.setAttribute('title','T3EMP_'+numero_filas);
                                descinput.setAttribute('name',texto_desc);
                                descinput.name=texto_desc;
                                descinput.setAttribute('type','text');
                                descinput.type="text";
                                descinput.value="0";
                                descinput.style.width="90%";
                                descinput.style.fontFamily="arial";
                                descinput.style.fontSize="11px";                               
                                //Asignar al onchange la función AJAX de actualixación.
                                descinput.onchange = function (evt) {
                                    //f_guardar_desglose(numero_filas);                        
                                    //alert(numero_filas);
                                    f_guardar_tramo(numero_filas);
                                };
                         //Cargamos el campo agente en el TD de agente.
                         t3emp.appendChild(descinput);
                     </axis:visible>
                     <axis:visible f="axisctr160" c="T4EMP">
                         //creamos nuevo TD de agentes y le damos la apariéncia    
                         var t4emp=document.createElement("td");
                         t4emp.setAttribute('class','dspText');
                         t4emp.className="dspText";
                         var descinput = document.createElement("input");
                                //anyadir variables al input
                                var texto_desc='T4EMP_'+numero_filas;
                                descinput.setAttribute('id',texto_desc);  
                                descinput.setAttribute('obligatorio','true');   
                                descinput.setAttribute('class','campowidthinput campo campotexto'); //Será obligatorio?
                                descinput.className="campowidthinput campo campotexto";                    
                                descinput.setAttribute('title','T4EMP_'+numero_filas);
                                descinput.setAttribute('name',texto_desc);
                                descinput.name=texto_desc;
                                descinput.setAttribute('type','text');
                                descinput.type="text";
                                descinput.value="0";
                                descinput.style.width="90%";
                                descinput.style.fontFamily="arial";
                                descinput.style.fontSize="11px";                               
                                //Asignar al onchange la función AJAX de actualixación.
                                descinput.onchange = function (evt) {
                                    //f_guardar_desglose(numero_filas);                        
                                    //alert(numero_filas);
                                    f_guardar_tramo(numero_filas);
                                };
                         //Cargamos el campo agente en el TD de agente.
                         t4emp.appendChild(descinput);
                     </axis:visible>
                     
                     <axis:visible f="axisctr160" c="T1TRA">
                         //creamos nuevo TD de agentes y le damos la apariéncia    
                         var t1tra=document.createElement("td");
                         t1tra.setAttribute('class','dspText');
                         t1tra.className="dspText";
                         var descinput = document.createElement("input");
                                //anyadir variables al input
                                var texto_desc='T1TRA_'+numero_filas;
                                descinput.setAttribute('id',texto_desc);  
                                descinput.setAttribute('obligatorio','true');   
                                descinput.setAttribute('class','campowidthinput campo campotexto'); //Será obligatorio?
                                descinput.className="campowidthinput campo campotexto";                    
                                descinput.setAttribute('title','T1TRA_'+numero_filas);
                                descinput.setAttribute('name',texto_desc);
                                descinput.name=texto_desc;
                                descinput.setAttribute('type','text');
                                descinput.type="text";
                                descinput.value="0";
                                descinput.style.width="90%";
                                descinput.style.fontFamily="arial";
                                descinput.style.fontSize="11px";                               
                                //Asignar al onchange la función AJAX de actualixación.
                                descinput.onchange = function (evt) {
                                    //f_guardar_desglose(numero_filas);                        
                                    //alert(numero_filas);
                                    f_guardar_tramo(numero_filas);
                                };
                         //Cargamos el campo agente en el TD de agente.
                         t1tra.appendChild(descinput);
                     </axis:visible>
                     <axis:visible f="axisctr160" c="T2TRA">
                         //creamos nuevo TD de agentes y le damos la apariéncia    
                         var t2tra=document.createElement("td");
                         t2tra.setAttribute('class','dspText');
                         t2tra.className="dspText";
                         var descinput = document.createElement("input");
                                //anyadir variables al input
                                var texto_desc='T2TRA_'+numero_filas;
                                descinput.setAttribute('id',texto_desc);  
                                descinput.setAttribute('obligatorio','true');   
                                descinput.setAttribute('class','campowidthinput campo campotexto'); //Será obligatorio?
                                descinput.className="campowidthinput campo campotexto";                    
                                descinput.setAttribute('title','T2TRA_'+numero_filas);
                                descinput.setAttribute('name',texto_desc);
                                descinput.name=texto_desc;
                                descinput.setAttribute('type','text');
                                descinput.type="text";
                                descinput.value="0";
                                descinput.style.width="90%";
                                descinput.style.fontFamily="arial";
                                descinput.style.fontSize="11px";                               
                                //Asignar al onchange la función AJAX de actualixación.
                                descinput.onchange = function (evt) {
                                    //f_guardar_desglose(numero_filas);                        
                                    //alert(numero_filas);
                                    f_guardar_tramo(numero_filas);
                                };
                         //Cargamos el campo agente en el TD de agente.
                         t2tra.appendChild(descinput);
                     </axis:visible>
                     <axis:visible f="axisctr160" c="T3TRA">
                         //creamos nuevo TD de agentes y le damos la apariéncia    
                         var t3tra=document.createElement("td");
                         t3tra.setAttribute('class','dspText');
                         t3tra.className="dspText";
                         var descinput = document.createElement("input");
                                //anyadir variables al input
                                var texto_desc='T3TRA_'+numero_filas;
                                descinput.setAttribute('id',texto_desc);  
                                descinput.setAttribute('obligatorio','true');   
                                descinput.setAttribute('class','campowidthinput campo campotexto'); //Será obligatorio?
                                descinput.className="campowidthinput campo campotexto";                    
                                descinput.setAttribute('title','T3TRA_'+numero_filas);
                                descinput.setAttribute('name',texto_desc);
                                descinput.name=texto_desc;
                                descinput.setAttribute('type','text');
                                descinput.type="text";
                                descinput.value="0";
                                descinput.style.width="90%";
                                descinput.style.fontFamily="arial";
                                descinput.style.fontSize="11px";                               
                                //Asignar al onchange la función AJAX de actualixación.
                                descinput.onchange = function (evt) {
                                    //f_guardar_desglose(numero_filas);                        
                                    //alert(numero_filas);
                                    f_guardar_tramo(numero_filas);
                                };
                         //Cargamos el campo agente en el TD de agente.
                         t3tra.appendChild(descinput);
                     </axis:visible>
                     <axis:visible f="axisctr160" c="T4TRA">
                         //creamos nuevo TD de agentes y le damos la apariéncia    
                         var t4tra=document.createElement("td");
                         t4tra.setAttribute('class','dspText');
                         t4tra.className="dspText";
                         var descinput = document.createElement("input");
                                //anyadir variables al input
                                var texto_desc='T4TRA_'+numero_filas;
                                descinput.setAttribute('id',texto_desc);  
                                descinput.setAttribute('obligatorio','true');   
                                descinput.setAttribute('class','campowidthinput campo campotexto'); //Será obligatorio?
                                descinput.className="campowidthinput campo campotexto";                    
                                descinput.setAttribute('title','T4TRA_'+numero_filas);
                                descinput.setAttribute('name',texto_desc);
                                descinput.name=texto_desc;
                                descinput.setAttribute('type','text');
                                descinput.type="text";
                                descinput.value="0";
                                descinput.style.width="90%";
                                descinput.style.fontFamily="arial";
                                descinput.style.fontSize="11px";                               
                                //Asignar al onchange la función AJAX de actualixación.
                                descinput.onchange = function (evt) {
                                    //f_guardar_desglose(numero_filas);                        
                                    //alert(numero_filas);
                                    f_guardar_tramo(numero_filas);
                                };
                         //Cargamos el campo agente en el TD de agente.
                         t4tra.appendChild(descinput);
                     </axis:visible>
                     
                    <axis:visible f="axisctr160" c="ELIMINAR">
                        //Creamos TD para el sigo de eliminación de fila 
                        var imgtd=document.createElement("td");
                        imgtd.setAttribute('class','dspText');       
                        imgtd.className="dspText";
                        var ael = document.createElement("a");
                            var stringId = "eliminar_"+numero_filas;
                            ael.setAttribute('id',stringId);
                        var funcion_borrar = "javascript:borrar_fila("+ numero_filas +")";
                            ael.setAttribute('href',funcion_borrar);
                        var imgel = document.createElement("img");
                            imgel.setAttribute('border','0');
                            imgel.setAttribute('src','images/delete.gif');
                            ael.appendChild(imgel);        
                         //Cargamos el icono eliminar en el TD     
                        imgtd.appendChild(ael);   
                    </axis:visible>
                   
                   
                    // Apend en el tr todos los td's de los campos
                    <axis:visible f="axisctr160" c="EDADINI">
                        mitr.appendChild(edini);
                    </axis:visible>
                    <axis:visible f="axisctr160" c="EDADFIN">
                        mitr.appendChild(edfin);
                    </axis:visible>
                    
                    <axis:visible f="axisctr160" c="T1EMP">
                        mitr.appendChild(t1emp);
                    </axis:visible>
                    <axis:visible f="axisctr160" c="T2EMP">
                        mitr.appendChild(t2emp);
                    </axis:visible>
                    <axis:visible f="axisctr160" c="T3EMP">
                        mitr.appendChild(t3emp);
                    </axis:visible>
                    <axis:visible f="axisctr160" c="T4EMP">
                        mitr.appendChild(t4emp);
                    </axis:visible>
                    
                    <axis:visible f="axisctr160" c="T1TRA">
                        mitr.appendChild(t1tra);
                    </axis:visible>
                    <axis:visible f="axisctr160" c="T2TRA">
                        mitr.appendChild(t2tra);
                    </axis:visible>
                    <axis:visible f="axisctr160" c="T3TRA">
                        mitr.appendChild(t3tra);
                    </axis:visible>
                    <axis:visible f="axisctr160" c="T4TRA">
                        mitr.appendChild(t4tra);
                    </axis:visible>
                     
                    <axis:visible f="axisctr160" c="ELIMINAR">
                        mitr.appendChild(imgtd);  
                    </axis:visible>
                    //Por último añadimos el TR a la tabla
                    table_tramos.appendChild(mitr);    
                    revisarEstilos();

            }
            
            function borrar_fila(num){         
                borrar_fila_js(num);                   
            }
            
            // **************************************
            // **************************************
            // Borra una fila determinada por js
            // **************************************
            // **************************************
            function borrar_fila_js(num){         
               f_del_tramo(num);  
                   //Control de única fila, si es la única del grid no la borramos visualmente
                   if(obtenerNuevoIndice() != 1){
                        var table_tramos = document.getElementById("tramos");
                        var elemento = document.getElementById("fila_"+num); //selecciona el tr correspondiente  
                        table_tramos.removeChild(elemento);
                   }else{
                   //La fila está vacia, sin compañia, y además es la única, no se puede eliminar
                        try{
                            document.getElementById("EDADINI_"+num).value = 0;
                            document.getElementById("EDADFIN_"+num).value = 0;
                            document.getElementById("T1EMP_"+num).value = 0;
                            document.getElementById("T2EMP_"+num).value = 0;
                            document.getElementById("T3EMP_"+num).value = 0;
                            document.getElementById("T4EMP_"+num).value = 0;
                            document.getElementById("T1TRA_"+num).value = 0;
                            document.getElementById("T2TRA_"+num).value = 0;
                            document.getElementById("T3TRA_"+num).value = 0;
                            document.getElementById("T4TRA_"+num).value = 0;
                        }catch(e){}
                   }          
            }
            
            function f_del_tramo(num_fila_guardar){                 
                 objAjax.invokeAsyncCGI("modal_axisctr160.do?PNUMBLOQ="+(num_fila_guardar+1), callbackAjaxEliminarTramo, "operation=ajax_del_detalle", this, objJsMessages.jslit_cargando,(num_fila_guardar+1));
            }
            
             function f_guardar_tramo(num_fila_guardar){                 
                 var err = 0;
                 
                 try{
                    var EDADINI = document.getElementById("EDADINI_"+num_fila_guardar).value;
                 }catch(e){}
                 try{
                    var EDADFIN = document.getElementById("EDADFIN_"+num_fila_guardar).value;
                 }catch(e){}
                 
                 if(EDADINI > EDADFIN){
                    //alert("ERROR FATAL!!!!");
                    err = 1;
                 }
                 
                 var x = document.getElementsByTagName('input');
                 for (var i=0;i<x.length;i++){
                        if (x[i].type == "text") {   
                            if (x[i].id != "EDADFIN_"+num_fila_guardar){
                                if (x[i].id.indexOf("EDADFIN") != -1){
                                    if(x[i].value >= EDADINI){
                                        //alert("ERROR FATAL!!!! 2");
                                        err = 2;
                                    }
                                }
                            }
                        }
                 }
                     
                 if (err == 0){
                     try{
                        var T1E = document.getElementById("T1EMP_"+num_fila_guardar).value;
                     }catch(e){}
                     try{
                        var T2E = document.getElementById("T2EMP_"+num_fila_guardar).value;
                     }catch(e){}
                     try{
                        var T3E = document.getElementById("T3EMP_"+num_fila_guardar).value;
                     }catch(e){}
                     try{
                        var T4E = document.getElementById("T4EMP_"+num_fila_guardar).value;
                     }catch(e){}
                     try{
                        var T1T = document.getElementById("T1TRA_"+num_fila_guardar).value;
                     }catch(e){}
                     try{
                        var T2T = document.getElementById("T2TRA_"+num_fila_guardar).value;
                     }catch(e){}
                     try{
                        var T3T = document.getElementById("T3TRA_"+num_fila_guardar).value;
                     }catch(e){}
                     try{
                        var T4T = document.getElementById("T4TRA_"+num_fila_guardar).value;
                     }catch(e){}
                     objAjax.invokeAsyncCGI("modal_axisctr160.do?PNUMBLOQ="+(num_fila_guardar+1)+"&EDADINI="+EDADINI+"&EDADFIN="+EDADFIN+"&T1E="+T1E+"&T2E="+T2E+"&T3E="+T3E+"&T4E="+T4E+"&T1T="+T1T+"&T2T="+T2T+"&T3T="+T3T+"&T4T="+T4T, callbackAjaxGuardarTramo, "operation=ajax_guardar_detalle", this, objJsMessages.jslit_cargando,(num_fila_guardar+1));     
                 }
                 if (err == 1){
                    alert("<fmt:message key="9901608"/>");
                 }
                 if (err == 2){
                    alert("<fmt:message key="9901609"/>");
                 }
            }
            
            //*************************//
            //******Funcions AJAX******//
            //*************************//
            function callbackAjaxAltaTramo(ajaxResponseText, num_fila) {
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

            function callbackAjaxEliminarTramo(ajaxResponseText, num_fila) {
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
            
            function callbackAjaxGuardarTramo(ajaxResponseText, num_fila) {
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
            
            function callbackAjaxAceptar(ajaxResponseText, num_fila) {
                try {                
                    var doc = objAjax.domParse(ajaxResponseText);
                    if (!objAppMensajes.existenErroresEnAplicacion(doc)){                
                        // Verificamos que no se han producido excepciones JAVA ni errores en la peticion PL (en este orden)
                        parent.f_aceptar_axisctr160();
                    }
                } catch (e) {
                    if (isDebugAjaxEnabled == "true")
                        alert (e.name + " " + e.message);
                }   
            }
            
        </script>
    </head>
 <body class=" " onload="f_onload()">
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
        <form name="miForm" action="" method="POST">
            <input type="hidden" id="operation" name="operation" value=""/>
            
            <input type="hidden" id="tipo" name="tipo" value="${__formdata.tipo}"/>
            
            
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt c="lit_form" f="axisctr160" lit="9901558"/></c:param>
                <c:param name="producto"><axis:alt c="lit_form" f="axisctr160" lit="9901558"/></c:param>
                <c:param name="form">axisctr160</c:param>
            </c:import>
            
            <!-- Area de campos -->  
            
<%--
[12:43:14] Iván Cañada: validarNumeros(objNumero.toDoNumberView(icapital));
[12:43:40] Iván Cañada: la validarnumeros te la coges de la axissin032
--%>
             
            <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <!--Def Primas-->
                        <div class="separador">&nbsp;</div>
                        <div class="titulo">
                            <img src="images/flecha.gif"/>
                            <axis:alt f="axisctr160" c="DSP_PRIMAS" lit="9901563" ></axis:alt>
                        </div>
                        <table class="seccion">
                            <tr>
                                <th style="width:15%;height:0px"></th>
                                <th style="width:20%;height:0px"></th>
                                <th style="width:10%;height:0px"></th>
                                <th style="width:15%;height:0px"></th>
                                <th style="width:20%;height:0px"></th>
                                <th style="width:20%;height:0px"></th>
                            </tr>
                            <tr>
                                <td></td>
                                <axis:ocultar f="axisctr160" c="LIT_EMPRESARIO" dejarHueco="false">
                                    <td class="titulocaja">
                                        <b id="LIT_EMPRESARIO"><axis:alt c="LIT_EMPRESARIO" f="axisctr160" lit="9901559"/></b>
                                    </td>
                                </axis:ocultar>
                                <td></td>
                                <td></td>
                                <axis:ocultar f="axisctr160" c="LIT_TRABAJADOR" dejarHueco="false">
                                    <td class="titulocaja">
                                        <b id="LIT_TRABAJADOR"><axis:alt c="LIT_TRABAJADOR" f="axisctr160" lit="9901560"/></b>
                                    </td>
                                </axis:ocultar>
                            </tr>
                            <tr>
                                <axis:ocultar f="axisctr160" c="LMINEMP" dejarHueco="false">
                                    <td class="titulocaja">
                                        <b id="label_LMINEMP"><axis:alt c="LMINEMP" f="axisctr160" lit="9901561"/></b>
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axisctr160" c="LMINEMP" dejarHueco="false">
                                    <td class="campocaja">
                                        <input type="text" class="campowidthinput campo campotexto" 
                                         <axis:atr f="axisctr160" c="LMINEMP" a="obligatorio=true&modificable=true&formato=decimal"/>
                                         style="width:55%;" size="15" pattern="###,##0.00" value="${OB_IAX_REGLASSEG.CAPMINEMP}" name="LMINEMP" id="LMINEMP"
                                         title="<fmt:message key="9901561"/>"/>
                                    </td>
                                </axis:ocultar>
                                <td></td>
                                <axis:ocultar f="axisctr160" c="LMINTRA" dejarHueco="false">
                                    <td class="titulocaja">
                                        <b id="label_LMINTRA"><axis:alt c="LMINTRA" f="axisctr160" lit="9901561"/></b>
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axisctr160" c="LMINTRA" dejarHueco="false">
                                    <td class="campocaja">
                                        <input type="text" class="campowidthinput campo campotexto" 
                                         <axis:atr f="axisctr160" c="LMINTRA" a="obligatorio=true&modificable=true&formato=decimal"/>
                                         style="width:55%;" size="15" pattern="###,##0.00" value="${OB_IAX_REGLASSEG.CAPMINTRA}" name="LMINTRA" id="LMINTRA"
                                         title="<fmt:message key="9901561"/>"/>
                                    </td>
                                </axis:ocultar>
                            </tr>
                            <tr>
                                 <axis:ocultar f="axisctr160" c="LMAXEMP" dejarHueco="false">
                                    <td class="titulocaja">
                                        <b id="label_LMAXEMP"><axis:alt c="LMAXEMP" f="axisctr160" lit="9901562"/></b>
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axisctr160" c="LMAXEMP" dejarHueco="false">
                                    <td class="campocaja">
                                        <input type="text" class="campowidthinput campo campotexto" 
                                         <axis:atr f="axisctr160" c="LMAXEMP" a="obligatorio=true&modificable=true&formato=decimal"/>
                                         style="width:55%;" size="15" pattern="###,##0.00" value="${OB_IAX_REGLASSEG.CAPMAXEMP}" name="LMAXEMP" id="LMAXEMP"
                                         title="<fmt:message key="9901562"/>"/>
                                    </td>
                                </axis:ocultar>
                                <td></td>
                                <axis:ocultar f="axisctr160" c="LMAXTRA" dejarHueco="false">
                                    <td class="titulocaja">
                                        <b id="label_LMAXTRA"><axis:alt c="LMAXTRA" f="axisctr160" lit="9901562"/></b>
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axisctr160" c="LMAXTRA" dejarHueco="false">
                                    <td class="campocaja">
                                        <input type="text" class="campowidthinput campo campotexto" 
                                         <axis:atr f="axisctr160" c="LMAXTRA" a="obligatorio=true&modificable=true&formato=decimal"/>
                                         style="width:55%;" size="15" pattern="###,##0.00" value="${OB_IAX_REGLASSEG.CAPMAXTRA}" name="LMAXTRA" id="LMAXTRA"
                                         title="<fmt:message key="9901562"/>"/>
                                    </td>
                                </axis:ocultar>
                            </tr>
                        </table>
                        
                        <div class="separador">&nbsp;</div>
                        
                        <!--Calculo Primas-->
                        <div class="titulo">
                            <img src="images/flecha.gif"/>
                            <axis:alt f="axisctr160" c="DSP_TRAMOS" lit="9901564" ></axis:alt>
                        </div>
                        
                        <table class="seccion">
                            <tr>
                                <th style="width:25%;height:0px"></th>
                                <th style="width:25%;height:0px"></th>
                                <th style="width:25%;height:0px"></th>
                                <th style="width:25%;height:0px"></th>
                            </tr>
                            <axis:ocultar f="axisctr160" c="DSP_TRAMOS" dejarHueco="false"> 
                                <tr>
                                    <td class="campocaja" colspan="4">
                                        <table class="dsptgtable grid" cellpadding="0" cellspacing="0">
                                            <tbody id="tramos" align="right">
                                                <tr>
                                                    <th style="width:5%;height:0px"></th>
                                                    <th style="width:5%;height:0px"></th>
                                                    <th style="width:15%;height:0px"></th>
                                                    <th style="width:10%;height:0px"></th>
                                                    <th style="width:10%;height:0px"></th>
                                                    <th style="width:10%;height:0px"></th>
                                                    <th style="width:15%;height:0px"></th>
                                                    <th style="width:10%;height:0px"></th>
                                                    <th style="width:10%;height:0px"></th>
                                                    <th style="width:10%;height:0px"></th>
                                                </tr>
                                                <tr class="gridEvenHover">        
                                                    <axis:ocultar f="axisctr160" c="EDADINI" dejarHueco="false">
                                                        <td class="dspText" align="center">
                                                            <b><axis:alt c="EDADINI" f="axisctr160" lit="104095"/></b>
                                                        </td>
                                                    </axis:ocultar>
                                                    <axis:ocultar f="axisctr160" c="EDADFIN" dejarHueco="false">
                                                        <td class="dspText" align="center">
                                                            <b><axis:alt c="EDADFIN" f="axisctr160" lit="103051"/></b>
                                                        </td>
                                                    </axis:ocultar>
                                                    <axis:ocultar f="axisctr160" c="T1EMP" dejarHueco="false">
                                                        <td class="dspText" align="center">
                                                            <b><axis:alt c="T1EMP" f="axisctr160" lit="9901565"/></b>
                                                        </td>
                                                    </axis:ocultar>
                                                    <axis:ocultar f="axisctr160" c="T2EMP" dejarHueco="false">
                                                        <td class="dspText" align="center">
                                                            <b><axis:alt c="T2EMP" f="axisctr160" lit="9901568"/></b>
                                                        </td>
                                                    </axis:ocultar>
                                                    <axis:ocultar f="axisctr160" c="T3EMP" dejarHueco="false">
                                                        <td class="dspText" align="center">
                                                            <b><axis:alt c="T3EMP" f="axisctr160" lit="9901569"/></b>
                                                        </td>
                                                    </axis:ocultar>
                                                    <axis:ocultar f="axisctr160" c="T4EMP" dejarHueco="false">
                                                        <td class="dspText" align="center">
                                                            <b><axis:alt c="T4EMP" f="axisctr160" lit="9901570"/></b>
                                                        </td>
                                                    </axis:ocultar>
                                                    
                                                    <axis:ocultar f="axisctr160" c="T1TRA" dejarHueco="false">
                                                        <td class="dspText" align="center">
                                                            <b><axis:alt c="T1TRA" f="axisctr160" lit="9901566"/></b>
                                                        </td>
                                                    </axis:ocultar>
                                                    <axis:ocultar f="axisctr160" c="T2TRA" dejarHueco="false">
                                                        <td class="dspText" align="center">
                                                            <b><axis:alt c="T2TRA" f="axisctr160" lit="9901568"/></b>
                                                        </td>
                                                    </axis:ocultar>
                                                    <axis:ocultar f="axisctr160" c="T3TRA" dejarHueco="false">
                                                        <td class="dspText" align="center">
                                                            <b><axis:alt c="T3TRA" f="axisctr160" lit="9901569"/></b>
                                                        </td>
                                                    </axis:ocultar>
                                                    <axis:ocultar f="axisctr160" c="T4TRA" dejarHueco="false">
                                                        <td class="dspText" align="center">
                                                            <b><axis:alt c="T4TRA" f="axisctr160" lit="9901570"/></b>
                                                        </td>
                                                    </axis:ocultar>
                                                    <axis:ocultar f="axisctr160" c="ELIMINAR" dejarHueco="false">
                                                        <td class="dspText">
                                                        </td>   
                                                    </axis:ocultar>
                                                </tr>
                                                
                                                
                                                <c:forEach items="${OB_IAX_REGLASSEG.REGLASSEGTRAMOS}" var="lista" varStatus="i">                                    
                                                    
                                                    <tr tipo="ri" id="fila_${i.count-1}" title="fila_${i.count-1}"
                                                        <c:if test="${i.count mod 2 ==0}">                                                                      
                                                            class="gridEven"                                                        
                                                        </c:if>
                                                        <c:if test="${i.count mod 2 !=0}">                                                                      
                                                            class="gridNotEven"                                                        
                                                        </c:if>
                                                    >                                        
                                                        <axis:ocultar f="axisctr160" c="EDADINI" dejarHueco="false">
                                                            <td class="dspText">                                               
                                                               <input type="text" class="campowidthinput campo campotexto" style="width:90%;" id="EDADINI_${i.count-1}" name="EDADINI_${i.count-1}" 
                                                                title="<axis:alt c='EDADINI' f='axisctr160' lit='104095'/>" size="5" onclick="" 
                                                                onchange="javascript:f_guardar_tramo(${i.count-1});" 
                                                                <axis:atr f="axisctr160" c="EDADINI" a="obligatorio=true&modificable=true&formato=decimal"/>
                                                                value="<fmt:formatNumber pattern='##0' value='${lista.OB_IAX_REGLASSEGTRAMOS.EDADINI}'/>"/>
                                                            </td>     
                                                        </axis:ocultar>
                                                        <axis:ocultar f="axisctr160" c="EDADFIN" dejarHueco="false">
                                                            <td class="dspText">                                               
                                                               <input type="text" class="campowidthinput campo campotexto" style="width:90%;" id="EDADFIN_${i.count-1}" name="EDADFIN_${i.count-1}" 
                                                                title="<axis:alt c='EDADFIN' f='axisctr160' lit='103051'/>" size="5" onclick="" 
                                                                onchange="javascript:f_guardar_tramo(${i.count-1});" 
                                                                <axis:atr f="axisctr160" c="EDADFIN" a="obligatorio=true&modificable=true&formato=decimal"/>
                                                                value="<fmt:formatNumber pattern='##0' value='${lista.OB_IAX_REGLASSEGTRAMOS.EDADFIN}'/>"/>
                                                            </td>     
                                                        </axis:ocultar>
                                                        
                                                        <axis:ocultar f="axisctr160" c="T1EMP" dejarHueco="false">
                                                            <td class="dspText">                                               
                                                               <input type="text" class="campowidthinput campo campotexto" style="width:90%;" id="T1EMP_${i.count-1}" name="T1EMP_${i.count-1}" 
                                                                title="<axis:alt c='T1EMP' f='axisctr160' lit='9901565'/>" size="11" onclick="" 
                                                                onchange="javascript:f_guardar_tramo(${i.count-1});" 
                                                                <axis:atr f="axisctr160" c="T1EMP" a="obligatorio=true&modificable=true&formato=decimal"/>
                                                                value="<fmt:formatNumber pattern='##0.00' value='${lista.OB_IAX_REGLASSEGTRAMOS.T1COPAGEMP}'/>"/>
                                                            </td>     
                                                        </axis:ocultar>
                                                        <axis:ocultar f="axisctr160" c="T2EMP" dejarHueco="false">
                                                            <td class="dspText">                                               
                                                               <input type="text" class="campowidthinput campo campotexto" style="width:90%;" id="T2EMP_${i.count-1}" name="T2EMP_${i.count-1}" 
                                                                title="<axis:alt c='T2EMP' f='axisctr160' lit='9901568'/>" size="11" onclick="" 
                                                                onchange="javascript:f_guardar_tramo(${i.count-1});" 
                                                                <axis:atr f="axisctr160" c="T2EMP" a="obligatorio=true&modificable=true&formato=decimal"/>
                                                                value="<fmt:formatNumber pattern='##0.00' value='${lista.OB_IAX_REGLASSEGTRAMOS.T2COPAGEMP}'/>"/>
                                                            </td>     
                                                        </axis:ocultar>
                                                        <axis:ocultar f="axisctr160" c="T3EMP" dejarHueco="false">
                                                            <td class="dspText">                                               
                                                               <input type="text" class="campowidthinput campo campotexto" style="width:90%;" id="T3EMP_${i.count-1}" name="T3EMP_${i.count-1}" 
                                                                title="<axis:alt c='T3EMP' f='axisctr160' lit='9901569'/>" size="11" onclick="" 
                                                                onchange="javascript:f_guardar_tramo(${i.count-1});" 
                                                                <axis:atr f="axisctr160" c="T3EMP" a="obligatorio=true&modificable=true&formato=decimal"/>
                                                                value="<fmt:formatNumber pattern='##0.00' value='${lista.OB_IAX_REGLASSEGTRAMOS.T3COPAGEMP}'/>"/>
                                                            </td>     
                                                        </axis:ocultar>
                                                        <axis:ocultar f="axisctr160" c="T4EMP" dejarHueco="false">
                                                            <td class="dspText">                                               
                                                               <input type="text" class="campowidthinput campo campotexto" style="width:90%;" id="T4EMP_${i.count-1}" name="T4EMP_${i.count-1}" 
                                                                title="<axis:alt c='T4EMP' f='axisctr160' lit='9901570'/>" size="11" onclick="" 
                                                                onchange="javascript:f_guardar_tramo(${i.count-1});" 
                                                                <axis:atr f="axisctr160" c="T4EMP" a="obligatorio=true&modificable=true&formato=decimal"/>
                                                                value="<fmt:formatNumber pattern='##0.00' value='${lista.OB_IAX_REGLASSEGTRAMOS.T4COPAGEMP}'/>"/>
                                                            </td>     
                                                        </axis:ocultar>
                                                        
                                                        <axis:ocultar f="axisctr160" c="T1TRA" dejarHueco="false">
                                                            <td class="dspText">                                               
                                                               <input type="text" class="campowidthinput campo campotexto" style="width:90%;" id="T1TRA_${i.count-1}" name="T1TRA_${i.count-1}" 
                                                                title="<axis:alt c='T1TRA' f='axisctr160' lit='9901566'/>" size="11" onclick="" 
                                                                onchange="javascript:f_guardar_tramo(${i.count-1});" 
                                                                <axis:atr f="axisctr160" c="T1TRA" a="obligatorio=true&modificable=true&formato=decimal"/>
                                                                value="<fmt:formatNumber pattern='##0.00' value='${lista.OB_IAX_REGLASSEGTRAMOS.T1COPAGTRA}'/>"/>
                                                            </td>     
                                                        </axis:ocultar>
                                                        <axis:ocultar f="axisctr160" c="T2TRA" dejarHueco="false">
                                                            <td class="dspText">                                               
                                                               <input type="text" class="campowidthinput campo campotexto" style="width:90%;" id="T2TRA_${i.count-1}" name="T2TRA_${i.count-1}" 
                                                                title="<axis:alt c='T2TRA' f='axisctr160' lit='9901568'/>" size="11" onclick="" 
                                                                onchange="javascript:f_guardar_tramo(${i.count-1});" 
                                                                <axis:atr f="axisctr160" c="T2TRA" a="obligatorio=true&modificable=true&formato=decimal"/>
                                                                value="<fmt:formatNumber pattern='##0.00' value='${lista.OB_IAX_REGLASSEGTRAMOS.T2COPAGTRA}'/>"/>
                                                            </td>     
                                                        </axis:ocultar>
                                                        <axis:ocultar f="axisctr160" c="T3TRA" dejarHueco="false">
                                                            <td class="dspText">                                               
                                                               <input type="text" class="campowidthinput campo campotexto" style="width:90%;" id="T3TRA_${i.count-1}" name="T3TRA_${i.count-1}" 
                                                                title="<axis:alt c='T3TRA' f='axisctr160' lit='9901569'/>" size="11" onclick="" 
                                                                onchange="javascript:f_guardar_tramo(${i.count-1});" 
                                                                <axis:atr f="axisctr160" c="T3TRA" a="obligatorio=true&modificable=true&formato=decimal"/>
                                                                value="<fmt:formatNumber pattern='##0.00' value='${lista.OB_IAX_REGLASSEGTRAMOS.T3COPAGTRA}'/>"/>
                                                            </td>     
                                                        </axis:ocultar>
                                                        <axis:ocultar f="axisctr160" c="T4TRA" dejarHueco="false">
                                                            <td class="dspText">                                               
                                                               <input type="text" class="campowidthinput campo campotexto" style="width:90%;" id="T4TRA_${i.count-1}" name="T4TRA_${i.count-1}" 
                                                                title="<axis:alt c='T4TRA' f='axisctr160' lit='9901570'/>" size="11" onclick="" 
                                                                onchange="javascript:f_guardar_tramo(${i.count-1});" 
                                                                <axis:atr f="axisctr160" c="T4TRA" a="obligatorio=true&modificable=true&formato=decimal"/>
                                                                value="<fmt:formatNumber pattern='##0.00' value='${lista.OB_IAX_REGLASSEGTRAMOS.T4COPAGTRA}'/>"/>
                                                            </td>     
                                                        </axis:ocultar>
                                                        <axis:ocultar f="axisctr160" c="ELIMINAR" dejarHueco="false">
                                                            <td class="dspText">
                                                                <a href="javascript:borrar_fila(${i.count-1});"  id ="eliminar_${i.count-1}"><img border="0" alt="<fmt:message key="1000127" />"  title="<fmt:message key="1000127"/>" src="images/delete.gif"/></a>
                                                            </td>   
                                                        </axis:ocultar>
                                                    </tr>    
                                                    </c:forEach>
                                            </tbody>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align:right" colspan="4">
                                        <input type="button" class="boton" id="but_anadir" value="<fmt:message key="104825" />" onclick="javascript:anyadir_fila_tramos();" />
                                    </td>
                                </tr>
                            </axis:ocultar>
                            
                        </table>
                    </td>
                </tr>
            </table>
    
     </form>
    
    

<c:import url="../include/botonera_nt.jsp">
           <c:param name="f">axisctr160</c:param>
            <c:param name="__botones"><axis:ocultar f="axisctr160" c = "BT_ACEPTAR" dejarHueco="false">,aceptar</axis:ocultar> </c:param>

</c:import>
<c:import url="../include/mensajes.jsp" />
    
</body>
</html>