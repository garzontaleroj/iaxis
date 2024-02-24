<%
/**
*  Fichero: axisdesc007.jsp
*  @author <a href = "mailto:lcalvo@csi-ti.com">Luz Calvo</a>
*  Fecha: 12/07/2010
*/
%>
<%@ page contentType="text/html;charset=windows-1252" errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>
<% System.out.println("********************************************1"); %>
<html>
  <head>
    <link rel="stylesheet" href="styles/genericosHtml.css" type="text/css">
    <link rel="stylesheet" href="styles/axisnt.css" type="text/css">
    <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>
    <c:import url="../include/carga_framework_js.jsp" />
    
    
    <script language="Javascript" type="text/javascript">
    var garantias = new Array();
    var productos = new Array();
    var actividades = new Array();

    
    
        function f_onload() {
        
        f_cargar_propiedades_pantalla();
        //cargar_combos();
        //alert("Antes de cargar dependencias");
        //f_carga_dependencias();
        <c:if test="${__formdata.CESTADO != 1}">
        try{
           document.miForm.but_nuevo.disabled=true;  
         }catch(e){}
        </c:if>   
            //document.miForm.NPOLIZA.focus();
            // Retocar tabla en IE
        //    if (document.all) // ES Explorer
        //        document.getElementById("tabla1").style.marginLeft="1.3%";
          
       
        
            <c:if test="${__configform.axisdesc007__PDESC__modificable == 'false'}"> 
                <c:if test="${resultadoOK=='KO'}" >
                    f_but_cancelar();
                </c:if>
            </c:if>
            
            <c:if test="${resultadoOK=='OK'}" >
                alert("<axis:alt f='axisdesc007' c='ALERT' lit='1000405' />");
                f_but_cancelar();
            </c:if>
      
        
        <%--c:if test="${BUSQUEDA=='OK'}">
            //alert("Siiii!");
            <c:if test="${__formdata.CESTADO != 2 }">
             document.miForm.but_nuevo.disabled=false;   
          </c:if>
        </c:if--%>

        
	revisarEstilos();
        }
 
        function f_but_cancelar() {
            parent.f_aceptar_axisdesc007();
        }        
        
        function f_but_buscar() {
          if (objValidador.validaEntrada()) objUtiles.ejecutarFormulario("modal_axisdesc007.do", "buscar", document.miForm, "_self", objJsMessages.jslit_cargando);
            
        }
        function f_but_salir() {
          parent.f_cerrar_modal('axisdesc007');
        }
        function f_recargar(){
        //alert("Antes de recargar");
          //aler("ACEPTAR");           
            if (objValidador.validaEntrada()) objUtiles.ejecutarFormulario("modal_axisdesc007.do", "recargar", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
        
        function f_but_recargar(){
            f_cerrar_modal('axisdesc010');
            
            f_recargar();
        }
        
        function f_abrir_modal(cual, noXButton, optionalQueryString) {
            if (objUtiles.estaVacio(optionalQueryString))                
                optionalQueryString = "";
                
            if (noXButton) 
                objDom.setVisibilidadPorId("but_cerrar_modal_" + cual, "hidden");    
                
            objUtiles.abrirModal(cual, "src", "modal_" + cual + ".do?operation=form" + optionalQueryString);        
        }
        
        function f_aceptar_axisdesc010() {  
            f_cerrar_modal('axisdesc010');
        }
         
        function f_cancelar_axisdesc010() {
            f_cerrar_modal('axisdesc010');
        }
        
        function f_cerrar_modal(cual) {
            objUtiles.cerrarModal(cual);
            if(cual=='axisdesc011') f_but_buscar();
        }  
        
        function f_abrir_axisdesc011 (sproduc,cactivi,cgarant,cdesc,cmoddesc,finivig,ffinvig, cestado) {
            objUtiles.abrirModal("axisdesc011", "src", "modal_axisdesc011.do?operation=init&PSPRODUC=" + sproduc+"&PCACTIVI="+cactivi+"&PCGARANT="+cgarant+"&PCDESC="+cdesc+"&PCMODDESC="+cmoddesc+"&PFINIVIG="+finivig+"&PFFINVIG="+ffinvig+"&PCESTADO="+cestado);
        }
        
        function f_but_aceptar (cual) {
           f_but_cancelar();
                                        
         }
         
         function f_but_aceptar () {
            //f_but_cancelar();
            if (objValidador.validaEntrada()) objUtiles.ejecutarFormulario("modal_axisdesc007.do", "aceptar", document.miForm, "_self", objJsMessages.jslit_cargando);            
         }

         function f_cargar_valor_porcentaje(VALOR,NINIALT,NFINALT,MODALIDAD,NIVEL,SPRODUC,CACTIVI,CGARANT){
                    objAjax.invokeAsyncCGI("modal_axisdesc007.do", callbackAjaxCargarDescuentos, "operation=ajax_guardar_porcentaje&PORCENTAJE=" + VALOR + 
                        "&NIVEL=" + NIVEL+"&MODALIDAD="+MODALIDAD+"&CDESC="+document.miForm.CDESC.value+"&FINIVIG="+document.miForm.FINIVIG.value+"&CGARANT="+CGARANT+"&CACTIVI="+CACTIVI+"&SPRODUC="+SPRODUC+"&FFINVIG="+document.miForm.FFINVIG.value+"&NINIALT="+NINIALT+"&NFINALT="+NFINALT, this, objJsMessages.jslit_cargando);
        }      

            function callbackAjaxCargarDescuentos (ajaxResponseText){
                var doc=objAjax.domParse(ajaxResponseText);
                if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                    //var elementos = doc.getElementsByTagName("SPRODUC");
                    
                    //var SPRODUCCombo = document.miForm.SPRODUC;     
                    //objDom.borrarOpcionesDeCombo(SPRODUCCombo);
                    //objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", '- <axis:alt f="axisdesc007" c="MISS" lit="108341"/> - ', SPRODUCCombo, 0);
                      // for (i = 0; i < elementos.length; i++) {
                      //      var SPRODUC = objDom.getValorNodoDelComponente(doc.getElementsByTagName("SPRODUC"), i, 0);
                      //      var TITULO = objDom.getValorNodoDelComponente(doc.getElementsByTagName("TTITULO"), i, 0);                                     
                      //      objDom.addOpcionACombo(SPRODUC, TITULO, SPRODUCCombo, i+1);
                   //     }
                   //amagarDisplay();

                }
            }            
<% System.out.println("********************************************4"); %>
            function amagarDisplay(){
                try{
                    var tbodyadded = objLista.obtenerBodyLista("miListaId");
                    var tradded = objLista.obtenerFilasBodyLista("miListaId", tbodyadded);
                    objLista.borrarFilasDeLista ("miListaId", "5", "<axis:alt f='axisdesc007' c='MISS2' lit='1000254' />");
                    var spanners = document.getElementsByTagName("span");
                    for(var i=0;i<spanners.length;i++) {
                        if (spanners[i].className == "gridpagebanner")
                            spanners[i].innerHTML = "";
                        if (spanners[i].className == "gridpagelinks")
                            spanners[i].innerHTML = ""; 
                    }
               } catch(e){alert(e);}
            }
            
            
            /*  *************************************************************************************************** */
            /*  *************************************************************************************************** */
            /*  **************************************** nuevas funcionalidades *********************************** */
            /*  *************************************************************************************************** */
            /*  *************************************************************************************************** */
            
            
            //////////////////////////////////////////////////////////////////////////////
     
    function actualitzarCheckbox(obj){
         objDom.setValorPorId("C2CABEZAS", ((objDom.getComponenteMarcado(obj))? "1" : "0" ));
    }
    
    function f_but_nuevo(){
    //alert("hola");
    f_abrir_modal('axisdesc010',false,'&CRAMO='+document.miForm.CRAMO.value+'&CDESC='+document.miForm.CDESC.value +"&FINIVIG="+document.miForm.FINIVIG.value + '&SPRODUC='+document.miForm.SPRODUC.value + '&CACTIVI='+document.miForm.CACTIVI.value + '&CGARANT='+document.miForm.CGARANT.value);
    }
        
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
             //primero llamamos a la funcion que nos devuelve el número de filas rellenadas
             //sabremos que el id_ sera i+1
             var numero_filas = obtenerNuevoIndice(); //Si el número de filas =3 la siguiente será 3          
             
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
                    miselect.setAttribute('class','campowidthselect campo campotexto_ob'); //Será obligatorio?
                    miselect.className="campowidthselect campo campotexto_ob";            
                    miselect.style.width="90%";
                    miselect.setAttribute('id',texto_companyia);
                    miselect.setAttribute('name','name_'+texto_companyia);
                    miselect.name=texto_companyia;
                    miselect.style.fontFamily="arial";
                    miselect.style.fontSize="11px";
                    miselect.style.backgroundColor="#F7FFD6";
                    miselect.onchange = function (evt) {
                        f_guardar_companyia(numero_filas);                        
                    };
              
             var mioption = document.createElement("option");
             //Primer option con min value
             mioption.setAttribute('value', <%= Integer.MIN_VALUE %>);
             micompani=document.createTextNode('- ' + '<axis:alt f="axisdesc007" c="MISS" lit="108341"/>' + ' -');
             mioption.appendChild(micompani);
             miselect.appendChild(mioption);
             
             for(i=0;i < garantias.length;i++){
                 var mioption = document.createElement("option");
                 
                 mioption.setAttribute('value', garantias[i][0]);
                 micompani=document.createTextNode(garantias[i][1]);            
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
                    miselectPE.onchange = function (evt) {
                    f_guardar_companyia(numero_filas);                        
                    };
             //Anyadir las options del select 
             var mioptionPE = document.createElement("option");     
             //Primer option con min value
             mioptionPE.setAttribute('value', <%= Integer.MIN_VALUE %>);
             miPE=document.createTextNode('- ' + '<axis:alt f="axisdesc007" c="MISS" lit="108341"/>' + ' -');
             mioptionPE.appendChild(miPE);
             miselectPE.appendChild(mioptionPE);   
             //alert(productos.length);
             for(i=0;i < productos.length;i++){
                var mioptionPE = document.createElement("option");
                //alert(productos[i][0]);
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
    
    // **************************************
    // **************************************
    // Borra una fila determinada
    // **************************************
    // **************************************
    function borrar_fila_companyia(num){         
        //Si elimino una fila con compañia asociada, recargo la pantalla
        if(document.getElementById("COMPANY_"+num).value != <%= Integer.MIN_VALUE %>){        
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
                    anyadir_fila_companyia();
                    
               //alert(objJsMessages.jslit_no_borrar);
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
       //alert(valorCompanyFinal);
       var indiceATratar = 0;
       var filaRepetida = 0;
       for(i=0; i < (totalFilas) ;i++){
       //alert("indice comp repetidos: "+ indiceATratar)
            var elementoCompany = document.getElementById("COMPANY_"+indiceATratar); 
            var valorCompany = elementoCompany.value;   
            //alert(valorCompany);
            if(valorCompany == valorCompanyFinal){
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

    function cargar_combos() {    
    //alert("En cargar combos");
            i=0;
            <c:forEach items="${axisctr_listaGarantia}" var="garantia">
                  garantias[i] = new Array ('${garantia.CRAMO}','${garantia.TRAMO}');
                  i++;
            </c:forEach>
            
             i=0;         
            <c:forEach items="${axisctr_listaActividad}" var="actividad">
            //alert("Antes de inicializar");
                  actividades[i] = new Array ('${actividad.CRAMO}','${actividad.TRAMO}');
                  i++;
            </c:forEach>
            i=0;     
            <c:forEach items="${axisctr_listaProducto}" var="producto">
                  productos[i] = new Array ('${producto.CRAMO}','${producto.TRAMO}');
                  i++;
            </c:forEach>
            //alert("productos 6: "+productos[6]);
            
            revisarEstilos();
            
           
        }
        
        
       // ********************************************************************************* //
       // *************************************** AJAX ************************************ //
       // ********************************************************************************* //
        
       function f_cargar_productos(){
                    CRAMO = objUtiles.utilSplit(objDom.getValorComponente(document.miForm.ramoProducto), "/")[0];
                     if (!objUtiles.estaVacio (CRAMO) ){
                    objDom.setValorComponente(document.miForm.CRAMO, objUtiles.utilSplit(objDom.getValorComponente(document.miForm.ramoProducto), "/")[0]);
                    objDom.setValorComponente(document.miForm.TRAMO, objUtiles.utilSplit(objDom.getValorComponente(document.miForm.ramoProducto), "/")[1]);
                    }else
                    objDom.setValorComponente(document.miForm.CRAMO, null);
                    objAjax.invokeAsyncCGI("modal_axisdesc007.do", callbackAjaxCargarProductos, "operation=ajax_busqueda_productos&CRAMO=" + objDom.getValorComponente(document.miForm.CRAMO) + 
                        "&TRAMO=" + objDom.getValorComponente(document.miForm.TRAMO)+"&tipo="+document.miForm.tipo.value, this, objJsMessages.jslit_cargando);
            }      

        function callbackAjaxCargarProductos (ajaxResponseText){
        //alert(ajaxResponseText);
                var doc=objAjax.domParse(ajaxResponseText);
                if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                    var elementos = doc.getElementsByTagName("SPRODUC");
                    
                    var SPRODUCCombo = document.miForm.SPRODUC; 
                    var SPRODUC1;
                    objDom.borrarOpcionesDeCombo(SPRODUCCombo);
                   objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", '- <axis:alt f="axisdesc007" c="MISS" lit="108341"/> - ', SPRODUCCombo, 0);
                       for (i = 0; i < elementos.length; i++) {
                            if(i== 0)
                                var SPRODUC1 = objDom.getValorNodoDelComponente(doc.getElementsByTagName("SPRODUC"), i, 0);
                            var SPRODUC = objDom.getValorNodoDelComponente(doc.getElementsByTagName("SPRODUC"), i, 0);
                            var TITULO = objDom.getValorNodoDelComponente(doc.getElementsByTagName("TTITULO"), i, 0);                                     
                            objDom.addOpcionACombo(SPRODUC, TITULO, SPRODUCCombo, i+1);
                        }
               

                }
                //alert("Antes de buscar");
                objDom.setValorPorId("SPRODUC",SPRODUC1);
                f_cargar_actividades();
                
               // f_but_buscar();
            }           
            
            
            
            
            
        function f_cargar_actividades(){
                    CRAMO = objUtiles.utilSplit(objDom.getValorComponente(document.miForm.ramoProducto), "/")[0];
                     if (!objUtiles.estaVacio (CRAMO) ){
                    objDom.setValorComponente(document.miForm.CRAMO, objUtiles.utilSplit(objDom.getValorComponente(document.miForm.ramoProducto), "/")[0]);
                    objDom.setValorComponente(document.miForm.TRAMO, objUtiles.utilSplit(objDom.getValorComponente(document.miForm.ramoProducto), "/")[1]);
                    }else
                    objDom.setValorComponente(document.miForm.CRAMO, null);
                    objAjax.invokeAsyncCGI("modal_axisdesc007.do", callbackAjaxCargarActividades, "operation=ajax_busqueda_actividades&CRAMO=" + objDom.getValorComponente(document.miForm.CRAMO) + 
                        "&SPRODUC=" + objDom.getValorComponente(document.miForm.SPRODUC), this, objJsMessages.jslit_cargando);
            }      

        function callbackAjaxCargarActividades (ajaxResponseText){
                //alert(ajaxResponseText);
                var doc=objAjax.domParse(ajaxResponseText);
                if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                    var elementos = doc.getElementsByTagName("element");
                    
                    var CACTIVICombo = document.miForm.CACTIVI;   
                    var CACTIVI1;
                    objDom.borrarOpcionesDeCombo(CACTIVICombo);
                   objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", '- <axis:alt f="axisdesc007" c="MISS" lit="108341"/> - ', CACTIVICombo, 0);
                   //alert("1");
                       for (i = 0; i < elementos.length; i++) {
                        //alert("2");
                            if(i== 0)
                                CACTIVI1 = objDom.getValorNodoDelComponente(doc.getElementsByTagName("CACTIVI"), i, 0);
                            var CACTIVI = objDom.getValorNodoDelComponente(doc.getElementsByTagName("CACTIVI"), i, 0);
                            var TTITULO = objDom.getValorNodoDelComponente(doc.getElementsByTagName("TTITULO"), i, 0);                                     
                            objDom.addOpcionACombo(CACTIVI, TTITULO, CACTIVICombo, i+1);
                        }
                        
                    objDom.setValorPorId("CACTIVI",CACTIVI1);
                    f_cargar_garantias();

                }
                //alert("Antes de buscar");
                //f_but_buscar();
            }
            
            
            
        function f_cargar_garantias(){
        
                    CRAMO = document.miForm.CRAMO.value;
                    SPRODUC = document.miForm.SPRODUC.value;
                    CACTIVI = document.miForm.CACTIVI.value;
                    
                    objAjax.invokeAsyncCGI("modal_axisdesc007.do", callbackAjaxCargarGarantias, "operation=ajax_busqueda_garantias&CRAMO=" + objDom.getValorComponente(document.miForm.CRAMO) + 
                        "&SPRODUC=" + document.miForm.SPRODUC.value +"&CACTIVI="+document.miForm.CACTIVI.value, this, objJsMessages.jslit_cargando);
            }      

        function callbackAjaxCargarGarantias (ajaxResponseText){
                //alert(ajaxResponseText);
                var doc=objAjax.domParse(ajaxResponseText);
                if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                    var elementos = doc.getElementsByTagName("element");
                    
                    var CGARANTCombo = document.miForm.CGARANT;     
                   objDom.borrarOpcionesDeCombo(CGARANTCombo);
                   objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", '- <axis:alt f="axisdesc007" c="MISS" lit="108341"/> - ', CGARANTCombo, 0);
                       for (i = 0; i < elementos.length; i++) {
                            var CGARANT = objDom.getValorNodoDelComponente(doc.getElementsByTagName("CGARANT"), i, 0);
                            var TGARANT = objDom.getValorNodoDelComponente(doc.getElementsByTagName("TGARANT"), i, 0);                                     
                            objDom.addOpcionACombo(CGARANT, TGARANT, CGARANTCombo, i+1);
                        }
                   
                
                }
                //alert("Antes de buscar");
                //f_but_buscar();
            }
       
       
       
            
    </script>
  </head>
    <body class="" onload="f_onload()" >
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">axisdesc010|<axis:alt f="axisdesc007" c="TITULO" lit="9903506" /></c:param>
        </c:import>
        <% System.out.println("********************************************5"); %>
        <form name="miForm" action="" method="POST">
            <input type="hidden" id="operation" name="operation" value=""/>
            <input type="hidden" id="tipo" name="tipo" value="${__formdata.tipo}"/>
            <input type="hidden" id="CRAMO" name="CRAMO" value="${__formdata.CRAMO}"/>
            <input type="hidden" id="TRAMO" name="TRAMO" value="${__formdata.TRAMO}"/>
            <input type="hidden" id="CESTADO" name="CESTADO" value="${__formdata.CESTADO}"/>
           <input type="hidden" id="CONSULTA" name="CONSULTA" value="${__formdata.CONSULTA}"/>
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt f="axisdesc007" c="FORMTIT" lit="9903508" /></c:param>
                <c:param name="producto"><axis:alt f="axisdesc007" c="FORMTIT" lit="9903508"/></c:param>
                <c:param name="form">axisdesc007</c:param>
            </c:import>
            
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt f="axisdesc007" c="NIVELES" lit="9902456" /></c:param>
                <c:param name="nid" value="axisdesc011" />
            </c:import>
            <!-- Area de campos  -->
            <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
              
                <tr>
                    <td>
                        <!--campos-->
                 
                        <table class="seccion" id="LISTA">
                            <tr>
                                <th style="width:25%;height:0px"></th>
                                <th style="width:25%;height:0px"></th>
                                <th style="width:25%;height:0px"></th>
                                <th style="width:25%;height:0px"></th>
                            </tr>
                            <tr>
                                <td class="titulocaja">
                                    <b><axis:alt f="axisdesc007" c="CDESC" lit="109155" /></b><!-- Código -->
                                </td>
                                <td class="titulocaja">
                                    <b><axis:alt f="axisdesc007" c="TDESC" lit="100588" /></b><!-- Descripcion -->
                                </td>
                                <td class="titulocaja">
                                    <b><axis:alt f="axisdesc007" c="FINIVIG" lit="9000526" /></b><!-- Fecha inicio -->
                                </td>
                                <td class="titulocaja">
                                    <b><axis:alt f="axisdesc007" c="FFINVIG" lit="9000527" /></b><!-- Fecha fin -->
                                    
                                </td>
                            </tr>
    
                            <tr>
                                 <td class="campocaja">
                                    <input type="text" readonly class="campowidthinput campo campotexto" title="<axis:alt f="axisdesc007" c="CDESC" lit="109155"/>" size="15" value="${__formdata['CDESC']}" name="CDESC" id="CDESC"/>
                                </td>
                                <td class="campocaja">
                                    <input type="text" readonly class="campowidthinput campo campotexto" title="<axis:alt f="axisdesc007" c="TDESC" lit="100588"/>" value="${__formdata['TDESC']}" name="TDESC" id="TDESC" size="15"/>
                                </td>
                                <td class="campocaja">
                                    <input type="text" readonly  class="campowidthinput campo campotexto" style="width:50%" value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FINIVIG}"/>" name="FINIVIG" id="FINIVIG" size="15"
                                     title="<axis:alt f="axisdesc007" c="FINIVIG" lit="9000526"/>"/>
                                </td>      
                                <td class="titulocaja">
                                    <input type="text"  readonly class="campowidthinput campo campotexto" style="width:50%" value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FFINVIG}"/>" name="FFINVIG" id="FFINVIGFFINVIG" size="15"
                                     title="<axis:alt f="axisdesc007" c="FFINVIG" lit="9000527"/>"/>
                                </td>
                            </tr>
                        </table>
                        
  <% System.out.println("********************************************8"); %>                     
                        
                        <table class="seccion">
                            <tr>
                                <th style="width:30%;height:0px"></th>
                                <th style="width:30%;height:0px"></th>
                                <th style="width:30%;height:0px"></th>
                               
                            </tr>
                            <tr>
                                
                                <td class="titulocaja">
                                    <b><axis:alt f="axisdesc007" c="CATRIBU" lit="111471" /></b> <!-- Agrupacion -->
                                </td>
                                <td class="titulocaja">
                                    <b><axis:alt f="axisdesc007" c="CRAMO" lit="100784" /></b> <!-- Ramo -->
                                </td>
                                 <td class="titulocaja">
                                    <b><axis:alt f="axisdesc007" c="SPRODUC" lit="100829" /></b> <!-- Producto -->
                                </td>
                                
                            </tr>
                            <tr>
    <% System.out.println("********************************************9"); %>                            
                                    <td class="campocaja">
                                        <select name = "CAGRUPA" id="CAGRUPA" style="width:200px;"  size="1" onchange="f_but_buscar();" class="campowidthselect campo campotexo">
                                            <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisdesc007" c="MIN_VALUE" lit="108341"/> - </option>
                                            <c:forEach var="agrupacion" items="${sessionScope.axisctr_listaAgrupacion}">
                                                <option value = "${agrupacion.CATRIBU}"
                                                    <c:if test="${agrupacion.CATRIBU == __formdata.CAGRUPA}">selected</c:if>>
                                                    ${agrupacion.TATRIBU}
                                                </option>
                                            </c:forEach>
                                        </select>
                                    </td>
                                    
                                    <td class="campocaja">
                                       
                                        <select name = "ramoProducto" id="ramoProducto" style="width:200px;" id ="ramoProducto" size="1" onchange="f_cargar_productos();" class="campowidthselect campo campotexto">
                                            <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisdesc007" c="MIN_VALUE" lit="108341"/> - </option>
                                            <c:forEach var="ramos" items="${sessionScope.axisctr_listaRamos}">
                                                <option value = "${ramos.CRAMO}"
                                                    <c:if test="${ramos.CRAMO == __formdata.ramoProducto}">selected</c:if>>
                                                    ${ramos.TRAMO}
                                                </option>
                                            </c:forEach>
                                        </select>
                                    
                                    </td>
                                    
                                    <td class="campocaja">
                                        <select name = "SPRODUC" id ="SPRODUC" size="1" onchange="f_cargar_actividades();" class="campowidthselect campo campotexto">
                                            <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisdesc007" c="MIN_VALUE" lit="108341" /> - </option>
                                            <c:forEach items="${sessionScope.productos}" var="item">
                                            <option value = "${item.SPRODUC}" <c:if test="${__formdata['SPRODUC']==item.SPRODUC}">selected</c:if> >${item.TTITULO}</option>
                                            </c:forEach>
                                        </select>
                                    </td>
        <% System.out.println("********************************************10"); %>                                            
                                
                            </tr>
                            
                            
                            <tr>
                                
                                <td class="titulocaja" >
                                    <b><axis:alt f="axisdesc007" c="CACTIVI" lit="103481" /></b> <!-- Actividad -->
                                </td>
                                <td class="titulocaja">
                                    <b><axis:alt f="axisdesc007" c="CGARANT" lit="110994" /></b> <!-- garantia -->
                                </td>
                                 <td class="titulocaja">
                                   
                                </td>
          <% System.out.println("********************************************11"); %>                      
                            </tr>
                            <tr>
                                
                                    <td class="campocaja">
                                        <select name = "CACTIVI" id="CACTIVI" style="width:200px;"  size="1" onchange="f_cargar_garantias();" class="campowidthselect campo campotexo">
                                            <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisdesc007" c="MIN_VALUE" lit="108341"/> - </option>
                                            <c:forEach var="actividad" items="${sessionScope.axisctr_listaActividades}">
                                                <option value = "${actividad.CACTIVI}"
                                                    <c:if test="${actividad.CACTIVI == __formdata.CACTIVI}">selected</c:if>>
                                                    ${actividad.TTITULO}
                                                </option>
                                            </c:forEach>
                                        </select>
                                    </td>
                                    
                                    <td class="campocaja">
                                        <select name = "CGARANT" id="CGARANT" style="width:200px;"  size="1" onchange="f_but_buscar();" class="campowidthselect campo campotexo">
                                            <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisdesc007" c="MIN_VALUE" lit="108341"/> - </option>
                                            <c:forEach var="garantia" items="${sessionScope.axisctr_listaGarantias}">
                                                <option value = "${garantia.CGARANT}"
                                                    <c:if test="${garantia.CGARANT == __formdata.CGARANT}">selected</c:if>>
                                                    ${garantia.TGARANT}
                                                </option>
                                            </c:forEach>
                                        </select>
                                    </td>
                                    
                                    <td class="campocaja">
                                        
                                    </td>
                    <% System.out.println("********************************************12"); %>                                
                                
                            </tr>
                            <!--tr>
                                <td align="right">
                                    <input align="right" type="button" class="boton" id="but_buscar" value="<axis:alt f="axisdesc007" c="BUSCAR" lit="100797" />" onclick="f_but_buscar()" />
                                </td>
                            </tr-->
                            <tr>
                            	<td colspan="3" align="right">
                            				
                            			<input align="right" type="button" class="boton" id="but_buscar" value="<axis:alt f="axisdesc007" c="BUSCAR" lit="100797" />" onclick="f_but_buscar()" />
                       
                            	</td>
                           </tr>
                            
                        </table>
                    </td>
                    </tr>
                    <div class="separador">&nbsp;</div>
                    <tr>
                    <td>
                        
                        <div class="separador">&nbsp;</div>
                    <% System.out.println("********************************************13"); %>
                        <!-- LISTA DESCUENTOS -->
                        <!--Imatge nou registre-->
                        <!--div style="align:right;">
                              <a href="javascript:f_abrir_modal('axisdesc010');"><img border="0" alt="<axis:alt f="axisdesc007" c="NEW" lit="104825"/>" title="<axis:alt f="axisdesc007" c="NEW" lit="104825"/>" src="images/new.gif"/></a>
                        </div--> 
                        <div class="separador">&nbsp;</div>
                            <!-- DisplayTag Pólizas -->
                            <c:set var="title1"><axis:alt f="axisdesc007" c="SPRODUC" lit="100829"/></c:set><!-- Producto -->
                            <c:set var="title2"><axis:alt f="axisdesc007" c="TACTIVI" lit="103481"/></c:set><!-- Actividad -->
                            <c:set var="title3"><axis:alt f="axisdesc007" c="CGARANT" lit="110994"/></c:set><!--Garantia -->
                            <c:set var="title4"><axis:alt f="axisdesc007" c="TMODCOM" lit="100943"/></c:set><!-- Modalidad -->
                            <c:set var="title5"><axis:alt f="axisdesc007" c="PRODLIST" lit="101467"/></c:set><!-- Procentaje -->
                            <c:set var="title9"><axis:alt f="axisdesc007" c="NINIALT" lit="104095"/></c:set><!--NINIALT-->
                            <c:set var="title10"><axis:alt f="axisdesc007" c="NFINALT" lit="103051"/></c:set><!--NFINALT-->
                            <div class="seccion displayspaceGrande">
                                <display:table name="${sessionScope.axisctr_listaDescuentos}" id="LISTA2" export="false" class="dsptgtable" pagesize="-1" requestURI="modal_axisdesc007.do?paginar=true" sort="list" cellpadding="0" cellspacing="0">
                                    <%@ include file="../include/displaytag.jsp"%>
                                    <display:column title="${title1}" sortable="true" sortProperty="SPRODUCLIST" headerClass="headwidth10 sortable"  media="html" autolink="false" >    
                                         <div class="dspText">${LISTA2.OB_IAX_DETDESCUENTO.TTITULO}</div>
                                    </display:column>
                                    <display:column title="${title2}" sortable="true" sortProperty="TACTIVILIST" headerClass="sortable" media="html" autolink="false" >
                                        <div class="dspText">${LISTA2.OB_IAX_DETDESCUENTO.TACTIVI}</div>
                                    </display:column>
                                    <display:column title="${title3}" sortable="true" sortProperty="CGARANTLIST" headerClass="sortable" media="html" autolink="false" >
                                        <div class="dspText">${LISTA2.OB_IAX_DETDESCUENTO.CGARANT} - ${LISTA2.OB_IAX_DETDESCUENTO.TGARANT}</div>
                                    </display:column>
                                    <display:column title="${title4}" sortable="true" sortProperty="CMODDESCLIST" headerClass="sortable" media="html" autolink="false" >
                                        <div class="dspText">${LISTA2.OB_IAX_DETDESCUENTO.TMODDESC}</div>
                                    </display:column>
                                    
                                    
                                    <c:if test="${__configform.axisdesc007__PDESC__modificable == 'false' || !empty __formdata.CONSULTA}">
                                        <display:column title="${title5}" sortable="true" sortProperty="DESPRODUCTOLIST" headerClass="sortable" media="html" autolink="false" >
                                            <div class="dspText">
                                                <fmt:formatNumber value="${LISTA2.OB_IAX_DETDESCUENTO.PDESC}" pattern="###,##0.00"/>
                                            </div>
                                        </display:column>
                                    </c:if>
                                    <c:if test="${__configform.axisdesc007__PDESC__modificable != 'false' && empty __formdata.CONSULTA}">
                                        <display:column title="${title5}" sortable="true" sortProperty="DESPRODUCTOLIST" headerClass="sortable" media="html" autolink="false" >
                                            <div class="dspText"><input type="text" class="campowidthinput campo campotexto" id="CAMPO" value="<fmt:formatNumber value="${LISTA2.OB_IAX_DETDESCUENTO.PDESC}" pattern="###,##0.00"/>" onchange="javascript:f_cargar_valor_porcentaje(this.value,'${LISTA2.OB_IAX_DETDESCUENTO.NINIALT}','${LISTA2.OB_IAX_DETDESCUENTO.NFINALT}','${LISTA2.OB_IAX_DETDESCUENTO.CMODDESC}','${LISTA2.OB_IAX_DETDESCUENTO.NIVEL}',${LISTA2.OB_IAX_DETDESCUENTO.SPRODUC},'${LISTA2.OB_IAX_DETDESCUENTO.CACTIVI}','${LISTA2.OB_IAX_DETDESCUENTO.CGARANT}')"></input></div>
                                        </display:column>
                                    </c:if>
                                    
                                    <axis:visible f="axisdesc007" c="NINIALT">
                                        <display:column title="${title9}" sortable="true" sortProperty="NINIALT" headerClass="sortable fixed" media="html" autolink="false" >
                                            <div class="dspText">
                                                <fmt:formatNumber value="${LISTA2.OB_IAX_DETDESCUENTO.NINIALT}" pattern="##0"/>
                                            </div>
                                        </display:column>
                                    </axis:visible>
                                    
                                    <axis:visible f="axisdesc007" c="NFINALT">
                                        <display:column title="${title10}" sortable="true" sortProperty="NFINALT" headerClass="sortable fixed" media="html" autolink="false" >
                                            <div class="dspText">
                                                <fmt:formatNumber value="${LISTA2.OB_IAX_DETDESCUENTO.NFINALT}" pattern="##0"/>
                                            </div>
                                        </display:column>
                                    </axis:visible>
                                     <c:if test="${empty __formdata.CONSULTA}">
                                    <axis:visible f="axisdesc007" c="BUT_NIVELES">
                                        <display:column title="" sortable="false" media="html" autolink="false" headerClass="sortable" >
                                            <div class="dspIcons">
                                                <img border="0" alt="<axis:alt f="axisdesc007" c="NIVELES" lit="9902456"/>" title1="<axis:alt f="axisdesc007" c="NIVELES" lit="9902456"/>" src="images/lapiz.gif" 
                                                 style="cursor:pointer;" onclick="javascript:f_abrir_axisdesc011 (${LISTA2.OB_IAX_DETDESCUENTO.SPRODUC},'${LISTA2.OB_IAX_DETDESCUENTO.CACTIVI}','${LISTA2.OB_IAX_DETDESCUENTO.CGARANT}','${LISTA2.OB_IAX_DETDESCUENTO.CDESC}','${LISTA2.OB_IAX_DETDESCUENTO.CMODDESC}','<fmt:formatDate pattern="dd/MM/yyyy" value="${LISTA2.OB_IAX_DETDESCUENTO.FINIVIG}"/>','<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FFINVIG}"/>','${__formdata.CESTADO}')"/>
                                            </div>
                                        </display:column>
                                    </axis:visible>
                                    </c:if>
                                </display:table>
                                <c:choose>
                                <c:when test="${!empty sessionScope.axisctr_listaPolizas}">
                                    <script language="javascript">objUtiles.retocarDsptagtable("miListaId");</script>
                                </c:when>
                                <c:otherwise>
                                    <script language="javascript">
                                       //objLista.esconderListaSpans();
                                       //objLista.esconderListaLinks();     
                                    </script>
                                </c:otherwise>
                                </c:choose>
                            </div>
                    </td>
                </tr>
                
            </table>

            <% System.out.println("********************************************14"); %>
            <c:choose>                        
            <c:when test="${__formdata.CESTADO != 2 && empty __formdata.CONSULTA}">
            <c:import url="../include/botonera_nt.jsp">
                <c:param name="f">axisdesc007</c:param><c:param name="__botones">cancelar,nuevo,aceptar</c:param>
            </c:import>
            </c:when>
            <c:otherwise>
             <c:import url="../include/botonera_nt.jsp">
            <c:param name="f">axisdesc007</c:param><c:param name="__botones">salir</c:param>
             </c:import>
            </c:otherwise>
            </c:choose>
           
     </form>
    <c:import url="../include/mensajes.jsp" />
    </body>
</html>

