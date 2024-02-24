<%--
      NOMBRE:    axiscomi011.jsp
      @author <a href = "mailto:joan_torres@csi-ti.com">Joan Torres</a>
      Fecha: 06/10/2011
      PROPÓSITO (descripción pantalla):  Alta/Edicion de Alturas de comisión
  
      REVISIONES:
      Ver        Fecha        Autor             Descripción
      ---------  ----------  ---------------  ------------------------------------
      1.0        06/10/2011   JTS(iniciales)     1. 18852: LCOL_C001 - Incorporar nuevas alturas de comisión

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
               <c:if test="${resultadoOK=='OK'}" >
                    alert("<axis:alt f='axiscomi011' c='ALERT' lit='1000405' />");
                    parent.f_cerrar_modal('axiscomi011');
               </c:if>
               <c:if test="${resultadoOK=='K'}" >
                    parent.f_cerrar_modal('axiscomi011');
               </c:if>
           }
            
           function f_but_aceptar() {
                if (objValidador.validaEntrada()){
                    //parent.f_cerrar_modal('axiscomi011');
                    if (objValidador.validaEntrada()) objUtiles.ejecutarFormulario("modal_axiscomi011.do", "aceptar", document.miForm, "_self", objJsMessages.jslit_cargando);
                }
           }
           
           function f_but_cancelar(){
	             try{
                    var PSPRODUC = document.getElementById("PSPRODUC").value;
                    }catch(e){}
                 try{
                    var PCACTIVI = document.getElementById("PCACTIVI").value;
                    }catch(e){}
                 try{
                    var PCGARANT = document.getElementById("PCGARANT").value;
                    }catch(e){}
                 try{
                    var PCCOMISI = document.getElementById("PCCOMISI").value;
                    }catch(e){}
                 try{
                    var PCMODCOM = document.getElementById("PCMODCOM").value;
                    }catch(e){}
                 try{
                    var PFINIVIG = document.getElementById("PFINIVIG").value;
                    }catch(e){}
                 objAjax.invokeAsyncCGI("modal_axiscomi011.do?PSPRODUC="+PSPRODUC+"&PCACTIVI="+PCACTIVI+"&PCGARANT="+PCGARANT
                                 +"&PCCOMISI="+PCCOMISI+"&PCMODCOM="+PCMODCOM+"&PFINIVIG="+PFINIVIG,
                                 callbackAjaxCancelarDesglose, "operation=ajax_cancelar_desglose", this, objJsMessages.jslit_cargando);
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
             
             <axis:visible f="axiscomi011" c="NDESDE">
                 //creamos nuevo TD y le damos la apariéncia    
                 var ndesde=document.createElement("td");
                 ndesde.setAttribute('class','dspText');
                 ndesde.className="dspText";
                 var descinput = document.createElement("input");
                 //anyadir variables al input
                 var texto_desc='NDESDE_'+numero_filas;
                 descinput.setAttribute('id',texto_desc);    
                 descinput.setAttribute('obligatorio','true');   
                 descinput.setAttribute('class','campowidthinput campo campotexto'); //Será obligatorio?
                 descinput.className="campowidthinput campo campotexto";                    
                 descinput.setAttribute('title','NDESDE_'+numero_filas);
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
                //Cargamos el campo en el TD
                 ndesde.appendChild(descinput);
                 
                 var deschidden = document.createElement("input");
                        //anyadir variables al input
                        var texto_desc='H_NDESDE_'+numero_filas;
                        deschidden.setAttribute('id',texto_desc);    
                        deschidden.setAttribute('name',texto_desc);
                        deschidden.name=texto_desc;
                        deschidden.setAttribute('type','hidden');
                        deschidden.type="hidden";
                        ndesde.appendChild(deschidden);
            </axis:visible>       
            <axis:visible f="axiscomi011" c="NHASTA">
                 //creamos nuevo TD y le damos la apariéncia    
                 var nhasta=document.createElement("td");
                 nhasta.setAttribute('class','dspText');
                 nhasta.className="dspText";
                 var descinput = document.createElement("input");
                 //anyadir variables al input
                 var texto_desc='NHASTA_'+numero_filas;
                 descinput.setAttribute('id',texto_desc);    
                 descinput.setAttribute('obligatorio','true');   
                 descinput.setAttribute('class','campowidthinput campo campotexto'); //Será obligatorio?
                 descinput.className="campowidthinput campo campotexto";                    
                 descinput.setAttribute('title','NHASTA_'+numero_filas);
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
                //Cargamos el campo en el TD
                 nhasta.appendChild(descinput);
                 
                 var deschidden = document.createElement("input");
                        //anyadir variables al input
                        var texto_desc='H_NHASTA_'+numero_filas;
                        deschidden.setAttribute('id',texto_desc);    
                        deschidden.setAttribute('name',texto_desc);
                        deschidden.name=texto_desc;
                        deschidden.setAttribute('type','hidden');
                        deschidden.type="hidden";
                        nhasta.appendChild(deschidden);
            </axis:visible>

            <axis:visible f="axiscomi011" c="NINIALT">
                 //creamos nuevo TD y le damos la apariéncia    
                 var ninitd=document.createElement("td");
                 ninitd.setAttribute('class','dspText');
                 ninitd.className="dspText";
                 var descinput = document.createElement("input");
                 //anyadir variables al input
                 var texto_desc='NINIALT_'+numero_filas;
                 descinput.setAttribute('id',texto_desc);     
                 descinput.setAttribute('obligatorio','true');   
                 descinput.setAttribute('class','campowidthinput campo campotexto'); //Será obligatorio?
                 descinput.className="campowidthinput campo campotexto";                    
                 descinput.setAttribute('title','NINIALT_'+numero_filas);
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
                //Cargamos el campo en el TD
                 ninitd.appendChild(descinput);
                 
                 var ninihidden = document.createElement("input");
                        //anyadir variables al input
                        var texto_desc='H_NINIALT_'+numero_filas;
                        ninihidden.setAttribute('id',texto_desc);    
                        ninihidden.setAttribute('name',texto_desc);
                        ninihidden.name=texto_desc;
                        ninihidden.setAttribute('type','hidden');
                        ninihidden.type="hidden";
                        ninitd.appendChild(ninihidden);
            </axis:visible>
            
            <axis:visible f="axiscomi011" c="NFINALT">
                 //creamos nuevo TD y le damos la apariéncia    
                 var nfintd=document.createElement("td");
                 nfintd.setAttribute('class','dspText');
                 nfintd.className="dspText";
                 var descinput = document.createElement("input");
                 //anyadir variables al input
                 var texto_desc='NFINALT_'+numero_filas;
                 descinput.setAttribute('id',texto_desc);     
                 descinput.setAttribute('obligatorio','true');   
                 descinput.setAttribute('class','campowidthinput campo campotexto'); //Será obligatorio?
                 descinput.className="campowidthinput campo campotexto";                    
                 descinput.setAttribute('title','NFINALT_'+numero_filas);
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
                //Cargamos el campo en el TD
                 nfintd.appendChild(descinput);
                 
                 
            </axis:visible>
            <axis:visible f="axiscomi011" c="PCOMISI">
                 //creamos nuevo TD y le damos la apariéncia    
                 var pcomtd=document.createElement("td");
                 pcomtd.setAttribute('class','dspText');
                 pcomtd.className="dspText";
                 var descinput = document.createElement("input");
                 //anyadir variables al input
                 var texto_desc='PCOMISI_'+numero_filas;
                 descinput.setAttribute('id',texto_desc);    
                 descinput.setAttribute('obligatorio','true');   
                 descinput.setAttribute('class','campowidthinput campo campotexto'); //Será obligatorio?
                 descinput.className="campowidthinput campo campotexto";                    
                 descinput.setAttribute('title','PCOMISI_'+numero_filas);
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
                //Cargamos el campo en el TD
                 pcomtd.appendChild(descinput);
                 
                 var deschidden = document.createElement("input");
                        //anyadir variables al input
                        var texto_desc='NORDEN_'+numero_filas;
                        deschidden.setAttribute('id',texto_desc);    
                        deschidden.setAttribute('name',texto_desc);
                        deschidden.name=texto_desc;
                        deschidden.setAttribute('type','hidden');
                        deschidden.type="hidden";
                        pcomtd.appendChild(deschidden);
            </axis:visible>
            <axis:visible f="axiscomi011" c="ELIMINAR">
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
            <axis:visible f="axiscomi011" c="NDESDE">
                mitr.appendChild(ndesde);
            </axis:visible>
             <axis:visible f="axiscomi011" c="NHASTA">
                mitr.appendChild(nhasta);
            </axis:visible>
            <axis:visible f="axiscomi011" c="NINIALT">
                mitr.appendChild(ninitd);
            </axis:visible>
            <axis:visible f="axiscomi011" c="NFINALT">
                mitr.appendChild(nfintd);
            </axis:visible>
                        
            <axis:visible f="axiscomi011" c="PCOMISI">
                mitr.appendChild(pcomtd);
            </axis:visible>
            <axis:visible f="axiscomi011" c="ELIMINAR">
                mitr.appendChild(imgtd);  
            </axis:visible>
            //Por último añadimos el TR a la tabla
            table_desglose.appendChild(mitr);    
            revisarEstilos();
             
    }
    
    
         // **************************************
        // **************************************
        // Recalculammos el índice de una nueva fila
        // **************************************
        // **************************************
        function obtenerNuevoIndice(){    
                var table_desglose = document.getElementById("desglose");
                 if(table_desglose!=null){
                 var tr_companyias = table_desglose.getElementsByTagName("tr");
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
    function borrar_fila_desglose(num){         
        borrar_fila_desglose_js(num);                 
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
               }else{
               //La fila está vacia, sin compañia, y además es la única, no se puede eliminar
                    
                    try{
                    document.getElementById("PCOMISI_"+num).value = '';
                     document.getElementById("NINIALT_"+num).value = '';
                    document.getElementById("NFINALT_"+num).value = '';
                    document.getElementById("NDESDE_"+num).value = '';
                    document.getElementById("NHASTA_"+num).value = '';
                    document.getElementById("CCRITERIO").value = '';
                    
                    }catch(e){}
               }
               
    }
    

    function f_guardar_desglose(num_fila_guardar){                 
         var NINIALT;
         var H_NINIALT;
         
         
         
         try{
            var PCOMISI = document.getElementById("PCOMISI_"+num_fila_guardar).value;
            }catch(e){}
         try{
            NINIALT = document.getElementById("NINIALT_"+num_fila_guardar).value;
            }catch(e){}
         try{
            H_NINIALT = document.getElementById("H_NINIALT_"+num_fila_guardar).value;
            }catch(e){}
         try{
            var NFINALT = document.getElementById("NFINALT_"+num_fila_guardar).value;
            }catch(e){}
            
         // TODOC: nous camps--
         try{
            var NDESDE = document.getElementById("NDESDE_"+num_fila_guardar).value;
            }catch(e){}
         try{
            var NHASTA = document.getElementById("NHASTA_"+num_fila_guardar).value;
            }catch(e){}
          try{
            var CCRITERIO = document.getElementById("CCRITERIOCmb").value;
            }catch(e){}
         
         
         try{
            var PSPRODUC = document.getElementById("PSPRODUC").value;
            }catch(e){}
         try{
            var PCACTIVI = document.getElementById("PCACTIVI").value;
            }catch(e){}
         try{
            var PCGARANT = document.getElementById("PCGARANT").value;
            }catch(e){}
         try{
            var PCCOMISI = document.getElementById("PCCOMISI").value;
            }catch(e){}
         try{
            var PCMODCOM = document.getElementById("PCMODCOM").value;
            }catch(e){}
         try{
            var PFINIVIG = document.getElementById("PFINIVIG").value;
            }catch(e){}
         
         
         if (NINIALT!=H_NINIALT || (H_NINIALT=null && NINIALT!=null)){
             document.getElementById("H_NINIALT_"+num_fila_guardar).value = NINIALT;
             
             objAjax.invokeAsyncCGI("modal_axiscomi011.do?PSPRODUC="+PSPRODUC+"&PCACTIVI="+PCACTIVI+"&PCGARANT="+PCGARANT
                                     +"&PCCOMISI="+PCCOMISI+"&PCMODCOM="+PCMODCOM+"&PFINIVIG="+PFINIVIG
                                     +"&PCOMISI="+PCOMISI+"&NINIALT="+NINIALT+"&HNINIALT="+H_NINIALT+"&NFINALT="+NFINALT+"&CCRITERIO="+CCRITERIO+"&NHASTA="+NHASTA+"&NDESDE="+NDESDE,
                                     callbackAjaxGuardarDesglose, "operation=ajax_guardar_detalle", this,
                                     objJsMessages.jslit_cargando,num_fila_guardar);

         }else{
             objAjax.invokeAsyncCGI("modal_axiscomi011.do?PSPRODUC="+PSPRODUC+"&PCACTIVI="+PCACTIVI+"&PCGARANT="+PCGARANT
                                     +"&PCCOMISI="+PCCOMISI+"&PCMODCOM="+PCMODCOM+"&PFINIVIG="+PFINIVIG
                                     +"&PCOMISI="+PCOMISI+"&NINIALT="+NINIALT+"&NFINALT="+NFINALT+"&CCRITERIO="+CCRITERIO+"&NHASTA="+NHASTA+"&NDESDE="+NDESDE,
                                     callbackAjaxGuardarDesglose, "operation=ajax_guardar_detalle", this,
                                     objJsMessages.jslit_cargando,num_fila_guardar);
         }
    }
    
    function f_del_desglose(num_fila_guardar){                 
         try{
            var NINIALT = document.getElementById("NINIALT_"+num_fila_guardar).value;
            }catch(e){}
           
                try{
            var ccriterio = document.getElementById("CCRITERIOCmb").value;
            }catch(e){}
               try{
            var nhasta = document.getElementById("NHASTA_"+num_fila_guardar).value;
            }catch(e){}
               try{
            var ndesde = document.getElementById("NDESDE_"+num_fila_guardar).value;
            }catch(e){}
         try{
            var PSPRODUC = document.getElementById("PSPRODUC").value;
            }catch(e){}
         try{
            var PCACTIVI = document.getElementById("PCACTIVI").value;
            }catch(e){}
         try{
            var PCGARANT = document.getElementById("PCGARANT").value;
            }catch(e){}
         try{
            var PCCOMISI = document.getElementById("PCCOMISI").value;
            }catch(e){}
         try{
            var PCMODCOM = document.getElementById("PCMODCOM").value;
            }catch(e){}
         try{
            var PFINIVIG = document.getElementById("PFINIVIG").value;
            }catch(e){}
         objAjax.invokeAsyncCGI("modal_axiscomi011.do?PSPRODUC="+PSPRODUC+"&PCACTIVI="+PCACTIVI+"&PCGARANT="+PCGARANT
                                 +"&PCCOMISI="+PCCOMISI+"&PCMODCOM="+PCMODCOM+"&PFINIVIG="+PFINIVIG+"&NINIALT="+NINIALT+"&CCRITERIO="+ccriterio+"&NHASTA="+nhasta+"&NDESDE="+ndesde,
         callbackAjaxEliminarDesglose, "operation=ajax_del_detalle", this,
         objJsMessages.jslit_cargando,num_fila_guardar);
    }

    function callbackAjaxGuardarDesglose(ajaxResponseText, num_fila) {
                try {                
                var doc = objAjax.domParse(ajaxResponseText);
                if (!objAppMensajes.existenErroresEnAplicacion(doc)){                
                    null;
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
                    parent.f_cerrar_modal('axiscomi011');
                 }
                
                } catch (e) {
                    if (isDebugAjaxEnabled == "true")
                        alert (e.name + " " + e.message);
                }
    } 
      function f_cargar_criterios(){
               //TODOC: Montarcombo. 
               var comboCriterios = document.miForm.CCRITERIOCmb;
               comboCriterios.addOpcionACombo("CCRITERIO-Falta montar combo",1,0);
               alert("f_cargar_criterios");
               objAjax.invokeAsyncCGI("modal_axiscomi011.do", callbackAjaxCargarCriterios, "operation=ajax_busqueda_criterios", this, objJsMessages.jslit_cargando);
               
        }
        
        function callbackAjaxCargarCriterios(ajaxResponseText){
              var doc=objAjax.domParse(ajaxResponseText);
                if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                    var elementos = doc.getElementsByTagName("element");
                    
                    var CCRITERIOCombo = document.miForm.CCRITERIOCmb;     
                   objDom.borrarOpcionesDeCombo(CCRITERIOCombo);
                   objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", '- <axis:alt f="axiscomi011" c="MIN_VALUE" lit="108341"/> - ', CCRITERIOCombo, 0);
                       for (i = 0; i < elementos.length; i++) {
                            var CCRITERIO= objDom.getValorNodoDelComponente(doc.getElementsByTagName("CATRIBU"), i, 0);
                            var TCRITERIO = objDom.getValorNodoDelComponente(doc.getElementsByTagName("TATRIBU"), i, 0);                                     
                            objDom.addOpcionACombo(CCRITERIO, TCRITERIO, CCRITERIOCombo, i+1);
                        }
                   

                }
                alert("fin callbackAjaxCargarCriterios");
        
        
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
            
            <input type="hidden" id="PSPRODUC" name="PSPRODUC" value="${__formdata.PSPRODUC}"/>
            <input type="hidden" id="PCACTIVI" name="PCACTIVI" value="${__formdata.PCACTIVI}"/>
            <input type="hidden" id="PCGARANT" name="PCGARANT" value="${__formdata.PCGARANT}"/>
            <input type="hidden" id="PCCOMISI" name="PCCOMISI" value="${__formdata.PCCOMISI}"/>
            <input type="hidden" id="PCMODCOM" name="PCMODCOM" value="${__formdata.PCMODCOM}"/>
            <input type="hidden" id="PFINIVIG" name="PFINIVIG" value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.PFINIVIG}"/>"/>
            <!-- TODOC:nuevos campos-->
            <input type="hidden" id="CCRITERIO" name="CCRITERIO" value="${__formdata.CCRITERIO}"/>
            <input type="hidden" id="TCRITERIO" name="TCRITERIO" value="${__formdata.TCRITERIO}"/>
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt c="LIT_FORM" f="axiscomi011" lit="9902456"/></c:param>
                <c:param name="producto"><axis:alt c="LIT_FORM" f="axiscomi011" lit="9902456"/></c:param>
                <c:param name="form">axiscomi011</c:param>
            </c:import>
            <!-- Area de campos  -->

            <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <!--campos-->
                        <table class="seccion">
                            <tr>
                                <th style="width:15%;height:0px"></th>
                                <th style="width:15%;height:0px"></th>
                                <th style="width:15%;height:0px"></th>
                                <th style="width:15%;height:0px"></th>
                                 <th style="width:15%;height:0px"></th>
                                  <th style="width:15%;height:0px"></th>
                                  <th style="width:15%;height:0px"></th>
                            </tr>
                            
                                <axis:ocultar f="axiscomi011" c="DSP_DESGLOSE" dejarHueco="false"> <!-- TODO C -->
                                <tr>
                                    <td class="campocaja" colspan="4">
                                                                                        
                                               <div class="titulo"><img src="images/flecha.gif"/>${__formdata.TMODCOM} - <axis:alt c="DSP_TITULO" f="axiscomi011" lit="9902457"/></div>
                                        &nbsp;
                                       </td>
                                            <!-- TODOC: Añadir campos -->
                                 </tr>
                                 <tr>
                                 <td>
                                <table class="seccion" cellpadding="0" cellspacing="2" align="left" style="width:99%;margin-left:4%">
                                <tr>
                                 <axis:visible f="axiscomi011" c="CCRITERIO">
                                     <td class="campocaja">
                                            <select name = "CCRITERIOCmb" id="CCRITERIOCmb"  style="width:200px;" size="1" <axis:atr f="axiscomi011" c="CCRITERIO" a="modificable=true&isInputText=false"/> <c:if test="${!empty __formdata.CCRITERIO}">disabled="true"</c:if> onchange="f_cargar_criterios()" class="campowidthselect campo campotexto_ob">
                                                <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt f="axiscomi011" c="MIN_VALUE" lit="108341"/> - </option>
                                                <c:forEach var="criterio" items="${sessionScope.criterios}">
                                                    <option value = "${criterio.CATRIBU}"
                                                        <c:if test="${criterio.CATRIBU ==__formdata.CCRITERIO}">selected</c:if>>
                                                        ${criterio.TATRIBU}
                                                    </option>
                                                </c:forEach>
                                            </select>
                                     </td>
                                 </axis:visible>
                                </tr>
                                </table>
                                 </td>
                                 </tr>
                                 <tr>
                                 <td colspan="4">
                                 <!-- TODOC: Fin Añadir campos -->
                                <table class="seccion" cellpadding="0" cellspacing="0" align="right" style="width:99%">
                
                                        <tbody id="desglose" align="right">
                                        
                                           
                                                <tr>
                                                   <axis:ocultar f="axiscomi011" c="NDESDE" dejarHueco="false">
                                                        <th style="width:10%;height:0px"></th>
                                                    </axis:ocultar>
                                                    <axis:ocultar f="axiscomi011" c="NHASTA" dejarHueco="false">
                                                        <th style="width:10%;height:0px"></th>
                                                    </axis:ocultar>
                                                    
                                                    <axis:ocultar f="axiscomi011" c="NINIALT" dejarHueco="false">
                                                        <th style="width:10%;height:0px"></th>
                                                    </axis:ocultar>
                                                    <axis:ocultar f="axiscomi011" c="NFINALT" dejarHueco="false">
                                                        <th style="width:10%;height:0px"></th>                                    
                                                    </axis:ocultar>
                                                    <axis:ocultar f="axiscomi011" c="PCOMISI" dejarHueco="false">
                                                        <th style="width:10%;height:0px"></th>
                                                    </axis:ocultar>
                                                    <axis:ocultar f="axiscomi011" c="ELIMINAR" dejarHueco="false">
                                                        <th style="width:3%;height:0px"></th>
                                                    </axis:ocultar>  
                                                </tr>
                                                <tr class="gridEvenHover">   

                                                     <axis:ocultar f="axiscomi011" c="NDESDE" dejarHueco="false">
                                                        <td class="dspText" align="center"><b><axis:alt c="NDESDE" f="axiscomi011" lit="104095"/>(<axis:alt f="axiscomi011" c="CCRITERIO" lit="9901472"/>)</b></td>                                        
                                                    </axis:ocultar>
                                                    <axis:ocultar f="axiscomi011" c="NHASTA" dejarHueco="false">
                                                        <td class="dspText" align="center"><b><axis:alt c="NHASTA" f="axiscomi011" lit="103051"/>(<axis:alt f="axiscomi011" c="CCRITERIO" lit="9901472"/>)</b></td>                                        
                                                    </axis:ocultar>
                                                    <axis:ocultar f="axiscomi011" c="NINIALT" dejarHueco="false">
                                                        <td class="dspText" align="center"><b><axis:alt c="NINIALT" f="axiscomi011" lit="104095"/></b></td>                                        
                                                    </axis:ocultar>
                                                    <axis:ocultar f="axiscomi011" c="NFINALT" dejarHueco="false">
                                                        <td class="dspText" align="center"><b><axis:alt c="NFINALT" f="axiscomi011" lit="103051"/></b></td>                                        
                                                    </axis:ocultar>
                                                     <axis:ocultar f="axiscomi011" c="PCOMISI" dejarHueco="false">
                                                        <td class="dspText" align="center"><b><axis:alt c="PCOMISI" f="axiscomi011" lit="101467"/></b></td>
                                                    </axis:ocultar>
                                                    <axis:ocultar f="axiscomi011" c="ELIMINAR" dejarHueco="false">
                                                        <td>&nbsp;</td>
                                                    </axis:ocultar>  
                                                </tr>
                                                
                                                <!-- C:IF  SI EL OBJETO LISTA ES NULO PINTAMOS UNA LINEA EN BLANCO -->
                                                <c:if test="${empty __formdata.PT_COMISION}">  
                                                    <tr tipo="ri" id="fila_0" class="gridNotEven" >   
                                                     <axis:visible f="axiscomi011" c="NDESDE">
                                                        <td class="dspText">
                                                            <input type="text" class="campowidthinput campo campotexto" style="width:100px;"  value=""  name="NDESDE_0" id="NDESDE_0"
                                                                title="<axis:alt c='NDESDE' f='axiscomi011' lit='103051'/>(<axis:alt f="axiscomi011" c="CCRITERIO" lit="9901472"/>)"
                                                                <axis:atr f="axiscomi011" c="NDESDE" a="obligatorio=true&modificable=true"/>
                                                                onchange="javascript:f_guardar_desglose(${i.count-1});"/>
                                                        
                                                         <input type="hidden" class="campowidthinput campo campotexto" id="H_NDESDE_0" name="H_NDESDE_0" 
                                                             size="5" onclick="" value=""/>
                                                             </td>
                                                    </axis:visible>
                                                    <axis:visible f="axiscomi011" c="NHASTA">
                                                        <td >
                                                            <input type="text" class="campowidthinput campo campotexto"  value=""  name="NHASTA_0" id="NHASTA_0"
                                                                    title="<axis:alt c='NDESDE' f='axiscomi011' lit='103051'/>(<axis:alt f="axiscomi011" c="CCRITERIO" lit="9901472"/>)"
                                                                    <axis:atr f="axiscomi011" c="NHASTA" a="obligatorio=true&modificable=true"/>
                                                                     onchange="javascript:f_guardar_desglose(${i.count-1});"/>
                                                        
                                                         <input type="hidden" class="campowidthinput campo campotexto" id="H_NHASTA_0" name="H_NHASTA_0" 
                                                             size="5" onclick="" value=""/>
                                                         </td>
                                                    </axis:visible>
                                                   
                                                    <axis:ocultar f="axiscomi011" c="NINIALT" dejarHueco="false">
                                                        <td class="dspText">                                               
                                                            <input type="text" class="campowidthinput campo campotexto" style="width:90%;" id="NINIALT_0" name="NINIALT_0" 
                                                            title="<axis:alt c='NINIALT' f='axiscomi011' lit='104095'/>"  size="5" onclick=""
                                                            <axis:atr f="axiscomi011" c="NINIALT" a="obligatorio=true&modificable=true"/>
                                                            onchange="javascript:f_guardar_desglose(0);" value=""/>
                                                            
                                                            <input type="hidden" class="campowidthinput campo campotexto" id="H_NINIALT_0" name="H_NINIALT_0" 
                                                             size="5" onclick="" value=""/>
                                                        </td>        
                                                    </axis:ocultar>
                                                    
                                                    <axis:ocultar f="axiscomi011" c="NFINALT" dejarHueco="false">
                                                        <td class="dspText">                                               
                                                            <input type="text" class="campowidthinput campo campotexto" style="width:90%;" id="NFINALT_0" name="NFINALT_0" 
                                                            title="<axis:alt c='NFINALT' f='axiscomi011' lit='103051'/>"  size="5" onclick=""
                                                            <axis:atr f="axiscomi011" c="NFINALT" a="obligatorio=true&modificable=true"/>
                                                            onchange="javascript:f_guardar_desglose(0);" value=""/>
                                                        </td>        
                                                    </axis:ocultar>
                                                     <axis:ocultar f="axiscomi011" c="PCOMISI" dejarHueco="false">
                                                        <td class="dspText">                                               
                                                            <input type="text" class="campowidthinput campo campotexto" style="width:90%;" id="PCOMISI_0" name="PCOMISI_0" 
                                                            title="<axis:alt c='PCOMISI' f='axiscomi011' lit='101467'/>"  size="5" onclick=""
                                                            <axis:atr f="axiscomi011" c="PCOMISI" a="obligatorio=true&modificable=true"/>
                                                            onchange="javascript:f_guardar_desglose(0);" value=""/>
                                                            
                                                            <input type="hidden"  id="NORDEN_0" name="NORDEN_0" value=""/>
                                                        </td>        
                                                    </axis:ocultar>
                                                    <axis:ocultar f="axiscomi011" c="ELIMINAR" dejarHueco="false">
                                                        <td class="dspText">
                                                            <a  href="javascript:borrar_fila_desglose(0)"><img border="0" alt="<axis:alt f="axiscomi011" c="DELETE" lit="1000127" />" title="<axis:alt f="axiscomi011" c="DELETE" lit="1000127" />" src="images/delete.gif"/></a>
                                                        </td>  
                                                    </axis:ocultar>
                                                    </tr>
                                                 </c:if>
                                                <!--SI NO PINTAMOS LAS FILAS RELLENADAS -->
                                                
                                                
                                                 
                                                <c:if test="${!empty __formdata.PT_COMISION}">                                                                      
                                                
                                                    <c:forEach items="${__formdata.PT_COMISION}" var="lista" varStatus="i">                                    
                                                    
                                                        <tr tipo="ri" id="fila_${i.count-1}" title="fila_${i.count-1}"
                                                            <c:if test="${i.count mod 2 ==0}">                                                                      
                                                                class="gridEven"                                                        
                                                            </c:if>
                                                            <c:if test="${i.count mod 2 !=0}">                                                                      
                                                                class="gridNotEven"                                                        
                                                            </c:if>
                                                        >                                        
                                                            <axis:visible f="axiscomi011" c="NDESDE">
                                                                <td class="dspText">
                                                                    <input type="text" class="campowidthinput campo campotexto" 
                                                                    title="<axis:alt c='NDESDE' f='axiscomi011' lit='104095'/>(<axis:alt f="axiscomi011" c="CCRITERIO" lit="9901472"/>)" style="width:90%;"  
                                                                    <axis:atr f="axiscomi011" c="NDESDE" a="obligatorio=true&modificable=true"/>
                                                                    onchange="javascript:f_guardar_desglose(${i.count-1});"
                                                                    value="${lista.OB_IAX_DETCOMISION.NDESDE}"  name="NDESDE_${i.count-1}" id="NDESDE_${i.count-1}" />
                                                                </td>
                                                            </axis:visible>
                                                            
                                                            <axis:visible f="axiscomi011" c="NHASTA">
                                                                <td class="dspText">
                                                                    <input type="text" class="campowidthinput campo campotexto" 
                                                                     title="<axis:alt c='NDESDE' f='axiscomi011' lit='103051'/>(<axis:alt f="axiscomi011" c="CCRITERIO" lit="9901472"/>)" style="width:90%;"  
                                                                     <axis:atr f="axiscomi011" c="NHASTA" a="obligatorio=true&modificable=true"/>
                                                                     onchange="javascript:f_guardar_desglose(${i.count-1});"
                                                                     value="${lista.OB_IAX_DETCOMISION.NHASTA}"  name="NHASTA_${i.count-1}" id="NHASTA_${i.count-1}"/>
                                                                </td>
                                                            </axis:visible>

                                                            <axis:ocultar f="axiscomi011" c="NINIALT" dejarHueco="false">
                                                                <td class="dspText">                                               
                                                                    <input type="text" class="campowidthinput campo campotexto" style="width:90%;" id="NINIALT_${i.count-1}" name="NINIALT_${i.count-1}" 
                                                                    title="<axis:alt c='NINIALT' f='axiscomi011' lit='104095'/>"  size="5" onclick=""
                                                                    <axis:atr f="axiscomi011" c="NINIALT" a="obligatorio=true&modificable=true"/>
                                                                    onchange="javascript:f_guardar_desglose(${i.count-1});"
                                                                    value="${lista.OB_IAX_DETCOMISION.NINIALT}"/>
                                                                    
                                                                    <input type="hidden" class="campowidthinput campo campotexto" id="H_NINIALT_${i.count-1}" name="H_NINIALT_${i.count-1}" 
                                                                    size="5" onclick="" value="${lista.OB_IAX_DETCOMISION.NINIALT}"/>
                                                                </td>        
                                                            </axis:ocultar>
                                                            <axis:ocultar f="axiscomi011" c="NFINALT" dejarHueco="false">
                                                                <td class="dspText">                                               
                                                                    <input type="text" class="campowidthinput campo campotexto" style="width:90%;" id="NFINALT_${i.count-1}" name="NFINALT_${i.count-1}" 
                                                                    title="<axis:alt c='NFINALT' f='axiscomi011' lit='103051'/>"  size="5" onclick=""
                                                                    <axis:atr f="axiscomi011" c="NFINALT" a="obligatorio=true&modificable=true"/>
                                                                    onchange="javascript:f_guardar_desglose(${i.count-1});"
                                                                    value="${lista.OB_IAX_DETCOMISION.NFINALT}"/>
                                                                </td>        
                                                            </axis:ocultar>
                                                            <axis:ocultar f="axiscomi011" c="PCOMISI" dejarHueco="false">
                                                                <td class="dspText">                                               
                                                                    <input type="text" class="campowidthinput campo campotexto" style="width:90%;" id="PCOMISI_${i.count-1}" name="PCOMISI_${i.count-1}" 
                                                                    title="<axis:alt c='PCOMISI' f='axiscomi011' lit='101467'/>"  size="5" onclick=""
                                                                    <axis:atr f="axiscomi011" c="PCOMISI" a="obligatorio=true&modificable=true"/>
                                                                    onchange="javascript:f_guardar_desglose(${i.count-1});"
                                                                    value="<fmt:formatNumber value="${lista.OB_IAX_DETCOMISION.PCOMISI}" pattern="#0.00"/>"/>

                                                                    <input type="hidden"  id="NORDEN_${i.count-1}" name="NORDEN_${i.count-1}"  
                                                                           value="${i.count-1}"/>
                                                                </td>        
                                                            </axis:ocultar>
                                                            <axis:ocultar f="axiscomi011" c="ELIMINAR" dejarHueco="false">
                                                                <td class="dspText">
                                                                    <a href="javascript:borrar_fila_desglose(${i.count-1})"  id ="eliminar_${i.count-1}"><img border="0" alt="<axis:alt f="axiscomi011" c="DELETE" lit="1000127" />"  title="<axis:alt f="axiscomi011" c="DELETE" lit="1000127"/>" src="images/delete.gif"/></a>
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
                                        <axis:visible f="axiscomi011" c="BUT_ANADIR" >
                                            <td style="text-align:right" colspan="4">
                                                    <input type="button" class="boton" id="but_anadir" value="<axis:alt f="axiscomi011" c="ANADIR" lit="104825" />" onclick="javascript:anyadir_fila_desglose()" />
                                            </td>
                                        </axis:visible>
                                     </tr>       
                                </axis:ocultar> 
                            
                        </table>
                       
                     
                    </td>
                </tr>
            </table>
    
     </form>
    
    

<c:import url="../include/botonera_nt.jsp">
           <c:param name="f">axiscomi011</c:param>
            <c:param name="__botones">
                cancelar,aceptar
            </c:param>

</c:import>
<c:import url="../include/mensajes.jsp" />
    
</body>
</html>
