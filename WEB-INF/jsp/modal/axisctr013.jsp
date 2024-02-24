<%/*
*  Fichero: axisctr013.jsp
*
*  @author <a href = "mailto:rkirchner@csi-ti.com">Roger Kirchner</a>
*
*  Fecha: 19/11/2007
*/
%>

<%@ page contentType="text/html;charset=iso-8859-15" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<html>
  <head>
    <link rel="stylesheet" href="styles/genericosHtml.css" type="text/css">
    <link rel="stylesheet" href="styles/axisnt.css" type="text/css">
    <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>
    
    <%-- Especial per controlar els scroll amb iPad --%>
        <link type="text/css" href="styles/jquery.jscrollpane.css" rel="stylesheet" media="only screen and (min-device-width: 768px) and (max-device-width: 1024px)" />
        <style type="text/css" id="page-css"></style>
    <%-- FI Especial per controlar els scroll amb iPad --%>
    
    <c:import url="../include/carga_framework_js.jsp" />
    <script language="Javascript" type="text/javascript">
        
        function f_onload() {
	       	<c:if test="${ (fn:containsIgnoreCase(header['User-Agent'],'ipad') )   }">
				retocarPAGE_CSS('axisctr013');
			</c:if>
          
          	var ok = "${__formdata.ok}";
          
			if (!objUtiles.estaVacio(ok))
			      parent.f_aceptar_axisctr013();
			      
			f_cargar_propiedades_pantalla();
        }
        
        function f_but_cancelar() {
            parent.f_cerrar_axisctr013();
        }
        
       
        function f_but_aceptar() {        
            // Llamada para actualizar los valores de la pantalla
            if (objValidador.validaEntrada()) {
                objUtiles.ejecutarFormulario("modal_axisctr013.do", "guardarCambios", document.miForm, "_self", objJsMessages.jslit_actualizando_garantias);
            }
        }
        
        function f_actualizar_franq(CNIVEL,CGRUP, CSUBGRUPUNIC , CVERSION,IMPVALOR,CVALOR1,CVALOR2,CIMPMIN,CIMPMAX,IMPVALOR2,IMPMIN,IMPMAX){
		    CGARANT = "${__formdata.CGARANT}";
		    
			if(objUtiles.estaVacio(IMPVALOR) || objValidador.esCampoNumerico(IMPVALOR, true, -1,"<axis:alt f='axisctr207' c='IIMPORT' lit='101159'/>")){
			   
			   var strURL="axis_axisctr207.do?operation=actualizar_franq_json&CNIVEL="+CNIVEL+"&CGRUP="+CGRUP+"&CSUBGRUP="+CSUBGRUPUNIC+"&CVERSION="+CVERSION+"&IMPVALOR="+IMPVALOR +"&CVALOR1="+CVALOR1+"&CVALOR2="+CVALOR2+"&CIMPMIN="+CIMPMIN+"&CIMPMAX="+CIMPMAX+"&IMPMIN="+IMPMIN+"&IMPMAX="+IMPMAX+"&IMPVALOR2="+IMPVALOR2+"&CGARANTfranq="+CGARANT;
			   var ajaxTexto=objJsMessages.jslit_cargando;			   
			   objAjax.invokeAsyncCGI_JSON(strURL, callbackselected_franq, ajaxTexto)
			
			 }else{			 
			   var ICAPITAL_Componente =	document.getElementById("IMPVALOR_"+CGRUP);
			   //+"&CVALOR1="+CVALOR1+"&CVALOR2="+CVALOR2+"&CIMPMIN="+CIMPMIN+"&CIMPMAX="+CIMPMAX+"&IMPMIN="+IMPMIN+"&IMPMAX="+IMPMAX        
			   ICAPITAL_Componente.value = '';
			   ICAPITAL_Componente.focus();
			   var strURL="axis_axisctr207.do?operation=actualizar_franq_json&CNIVEL="+CNIVEL+"&CGRUP="+CGRUP+"&CSUBGRUP="+CSUBGRUPUNIC+"&CVERSION="+CVERSION+"&IMPVALOR="+ICAPITAL_Componente.value;
			   var ajaxTexto=objJsMessages.jslit_cargando;                    
			   objAjax.invokeAsyncCGI_JSON(strURL, callbackselected_franq, ajaxTexto)
			 }    
    	}   
    
       function callbackselected_franq(p) {
    	
			objEventos.showHideLoader("ajaxLoader", "ajaxContent", "ajaxText", "", "none");
	    
	    	if(!objAppMensajes.existenErroresEnAplicacion_JSON(p, true, "resultado")){
    
	            try{	            
	            
		            <axis:visible f="axisctr207" c="DSP_TOT_FRANQUICIAS"> 	
		            <axis:visible f="axisctr207" c="DSP_FRANQUICIAS"> 	    
	                  if (!objUtiles.estaVacio(p.JSON2.franqgarlibres) &&  p.JSON2.franqgarlibres.length > 0 ){
	                 
	                    f_pintar_franquicias_libres(p.JSON2.franqgarlibres,'franquicias','franquiciasgarlibres');
	                                                                                    
	                 }else{
		                 try{
		                      var tbody = objLista.obtenerBodyLista('franquiciasgarlibres');
		                      var tr = objLista.obtenerFilasBodyLista('franquiciasgarlibres', tbody);                  
		                      objLista.borrarFilasDeLista ('franquiciasgarlibres', "5", '<axis:alt f="axisctr207" c="NOREG" lit="1000254"/>');
		                      objDom.setVisibilidadPorId("franquiciasgarlibress_hidden","hidden");
		                      objDom.setDisplayPorId("franquiciasgarlibres_hidden","none");
		                      }catch(e){}
	                 }
	             	</axis:visible>
	             	<axis:visible f="axisctr207" c="DSP_BONUSMALUS"> 
	                    if (!objUtiles.estaVacio(p.JSON2.bonusmaluslibres) &&  p.JSON2.bonusmaluslibres.length > 0 ){
	                 
	                    	f_pintar_franquicias_libres(p.JSON2.bonusmaluslibres,'bonusmalus','bonumaluslibres');	                    
	                                                                                    
	                 	}else{
			                 try{
			                      var tbody = objLista.obtenerBodyLista('bonumaluslibres');
			                      var tr = objLista.obtenerFilasBodyLista('bonumaluslibres', tbody);                  
			                      objLista.borrarFilasDeLista ('bonumaluslibres', "5", '<axis:alt f="axisctr207" c="NOREG" lit="1000254"/>');
			                      objDom.setVisibilidadPorId("bonumaluslibres_hidden","hidden");
			                      objDom.setDisplayPorId("bonumaluslibres_hidden","none");
			                      }catch(e){}
	                 }	                 
	             	</axis:visible>
	             	<axis:visible f="axisctr207" c="DSP_FRANQTECNICAS"> 	                 
	                    
	                 	if (!objUtiles.estaVacio(p.JSON2.franqtecnicaslibres) &&  p.JSON2.franqtecnicaslibres.length > 0 ){
	                 
	                    	f_pintar_franquicias_libres(p.JSON2.franqtecnicaslibres,'franquiciastecnicas','franquiciastecnicaslibres');
	                                                                                    
		                 }else{
			                 try{
			                      var tbody = objLista.obtenerBodyLista('franquiciastecnicaslibres');
			                      var tr = objLista.obtenerFilasBodyLista('franquiciastecnicaslibres', tbody);                  
			                      objLista.borrarFilasDeLista ('franquiciastecnicaslibres', "5", '<axis:alt f="axisctr207" c="NOREG" lit="1000254"/>');
			                      objDom.setVisibilidadPorId("franquiciastecnicaslibres_hidden","hidden");
			                      objDom.setDisplayPorId("franquiciastecnicaslibres_hidden","none");
		                      }catch(e){}		
		                 }
	             	</axis:visible>	                
	             	</axis:visible>
	            
	             }catch(e){
	                 alert (e.name + " " + e.message);
	             }
	        }
      }
        
      function f_pintar_franquicias_libres(lista,iddisplay,idtabla) {
    	
           try{        
                 if (!objUtiles.estaVacio(lista) &&  lista.length > 0 ){
                   /* objDom.setVisibilidadPorId(iddisplay+"_hidden","visible");
                   objDom.setDisplayPorId(iddisplay+"_hidden","block");*/
                   var tbody = objLista.obtenerBodyLista(idtabla);
                   var tr = objLista.obtenerFilasBodyLista(idtabla, tbody);   
                   
                   objLista.borrarFilasDeLista (idtabla, "6", '<axis:alt f="axisctr207" c="NOREG" lit="1000254"/>');
                   objLista.borrarFilaVacia(tbody, tr);
                        
                   for (var i = 0 ; i<lista.length;i++){
                   
                    var franquicia = lista[i];
                    
                    var DESCRIPCION = objUtiles.estaVacio(franquicia.OB_IAX_BF_PROACTGRUP.GRUPO.TGRUP)? '' : franquicia.OB_IAX_BF_PROACTGRUP.GRUPO.TGRUP;
                    var CVERSION = objUtiles.estaVacio(franquicia.OB_IAX_BF_PROACTGRUP.GRUPO.CVERSION)? '' : franquicia.OB_IAX_BF_PROACTGRUP.GRUPO.CVERSION;
                    var CNIVEL = objUtiles.estaVacio(franquicia.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.CNIVEL)? '' : franquicia.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.CNIVEL;
                    var IMPVALOR1 = objUtiles.estaVacio(franquicia.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.IMPVALOR1)? '' : objNumero.formateaNumeroCero(franquicia.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.IMPVALOR1, true) ;
                    
                    var LISTANIVELES = objUtiles.estaVacio(franquicia.OB_IAX_BF_PROACTGRUP.LNIVELES)? '' :franquicia.OB_IAX_BF_PROACTGRUP.LNIVELES;
                    var CGRUP = objUtiles.estaVacio(franquicia.OB_IAX_BF_PROACTGRUP.CGRUP)? '' : franquicia.OB_IAX_BF_PROACTGRUP.CGRUP;
                    var TGRUP =  objUtiles.estaVacio(franquicia.OB_IAX_BF_PROACTGRUP.GRUPO.TGRUP)? '' : franquicia.OB_IAX_BF_PROACTGRUP.GRUPO.TGRUP;
                    var CSUBGRUPUNIC = objUtiles.estaVacio(franquicia.OB_IAX_BF_PROACTGRUP.CSUBGRUPUNIC)? '' : franquicia.OB_IAX_BF_PROACTGRUP.CSUBGRUPUNIC;
                    var COBLIGA = objUtiles.estaVacio(franquicia.OB_IAX_BF_PROACTGRUP.COBLIGA)? '' : franquicia.OB_IAX_BF_PROACTGRUP.COBLIGA;
                    
                    var LISTACVALOR1 = LISTANIVELES[0].OB_IAX_BF_DETNIVEL.LISTACVALOR1;
                    var LISTACVALOR2 = LISTANIVELES[0].OB_IAX_BF_DETNIVEL.LISTACVALOR2;
                    var LISTACIMPMIN = LISTANIVELES[0].OB_IAX_BF_DETNIVEL.LISTACIMPMIN;
                    var LISTACIMPMAX = LISTANIVELES[0].OB_IAX_BF_DETNIVEL.LISTACIMPMAX;
                    var IMPVALOR2 = objUtiles.estaVacio(franquicia.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.IMPVALOR2)? '' : objNumero.formateaNumeroCero(franquicia.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.IMPVALOR2, true) ;
                    var IMPMIN = objUtiles.estaVacio(franquicia.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.IMPMIN)? '' : objNumero.formateaNumeroCero(franquicia.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.IMPMIN, true) ;
                    var IMPMAX = objUtiles.estaVacio(franquicia.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.IMPMAX)? '' : objNumero.formateaNumeroCero(franquicia.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.IMPMAX, true) ;
                    var CVALOR1 = objUtiles.estaVacio(franquicia.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.CVALOR1)? '' : franquicia.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.CVALOR1;
                    var CVALOR2 = objUtiles.estaVacio(franquicia.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.CVALOR2)? '' : franquicia.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.CVALOR2;
                    var CIMPMIN = objUtiles.estaVacio(franquicia.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.CIMPMIN)? '' : franquicia.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.CIMPMIN;
                    var CIMPMAX = objUtiles.estaVacio(franquicia.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.CIMPMAX)? '' : franquicia.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.CIMPMAX;

                    if (!objUtiles.estaVacio(CNIVEL) )
                    	CNIVEL = LISTANIVELES[0].OB_IAX_BF_DETNIVEL.CNIVEL;
                  
              		// Obtenemos el estilo para la fila que insertaremos
                    var rowstyle = objLista.addEstiloEnFilaDeLista(tr, "gridEven", "gridNotEven",i);
                    // Creamos una nueva fila vacia y le damos el estilo obtenido
                    var newtr = objLista.crearNuevaFila(rowstyle);
                    newtr.setAttribute("title",DESCRIPCION);
                    // Creamos un array de columnas a añadir a la nueva fila del displayTag
                    var newtd = new Array(5);
                        var jclass  = "campo campotexto";
                    var ttd=0;
                    
                    <axis:visible c="DESCRIPCION" f="axisctr207">									
                   		newtd[ttd] = objLista.addTextoEnListaDim(DESCRIPCION,'','15%');ttd++;
                    </axis:visible>
                    
                    <axis:visible c="CVALOR1" f="axisctr207">	
                       var desctd=document.createElement("td");
                       desctd.style.width='22%';
                       desctd.setAttribute('class','dspText');
                       desctd.className='dspText';
                       var descdiv=document.createElement("div");
                       descdiv.setAttribute('class','dspIcons');
                       descdiv.className="dspIcons";
                       var elementos = LISTACVALOR1;
                       if (!objUtiles.estaVacio(elementos) ){
                     
                          if (elementos.length > 0 ) {
                                //Creamos el select de comppanyia
                          		var miselect = document.createElement("select");            
                                miselect.setAttribute('class',jclass); //Será obligatorio?
                                miselect.className=jclass;            
                                miselect.style.width="60%";
                                
                                if (!objUtiles.estaVacio(COBLIGA) && objUtiles.utilEquals(COBLIGA, "S")){
                                    miselect.setAttribute('class',"campo campotexto_ob"); //Será obligatorio?
                                    miselect.className="campo campotexto_ob";      
                                    miselect.setAttribute('obligatorio',true);
                                }
                                miselect.setAttribute('id','CVALOR1_'+CGRUP);
                                miselect.setAttribute('name','CVALOR1_'+CGRUP);
                                miselect.setAttribute('title',TGRUP+' - '+ '<axis:alt f="axisctr207" c="IMPVALOR" lit="101159"/>');                              
                                miselect.name='CVALOR1_'+CGRUP;
                                miselect.id='CVALOR1_'+CGRUP;
                                //miselect.onchange = new Function("f_actualizar_franq("+CNIVEL+", "+CGRUP+", "+CSUBGRUPUNIC+","+CVERSION+",'"+CVALOR2+"')");
                                miselect.onchange = new Function("f_actualizar_franq("+CNIVEL+", "+CGRUP+", "+CSUBGRUPUNIC+","+CVERSION+",'',this.value,'','','','','','')");                                                                                                                                                               
                               // miselect.setAttribute('onchange',"f_actualizar_franq(this.value, '1', "+CGARANT+")");                                    
                                       
                          }                                       
                          var mioption = document.createElement("option");                                      
                          mioption.setAttribute('value', '');
                          miconcepto=document.createTextNode("- <axis:alt f="axisctr207" c="COMBO_SNV" lit="108341"/> -");
                          mioption.appendChild(miconcepto);
                          miselect.appendChild(mioption);
                          
                          for (var j = 0; j < elementos.length; j++) {
                              CNIVELlista = elementos[j].OB_IAX_BF_LISTLIBRE.CATRIBU;
                              TNIVELlista = elementos[j].OB_IAX_BF_LISTLIBRE.TATRIBU;
                          
                              mioption = document.createElement("option");
                              mioption.setAttribute('value', CNIVELlista);
                              miconcepto=document.createTextNode(TNIVELlista);
                                
                              if (!objUtiles.estaVacio(CNIVEL)  && CNIVELlista == CVALOR1)
                                   mioption.selected= 'true';
                              
                              mioption.appendChild(miconcepto);
                              miselect.appendChild(mioption);
                   
                           }
                           descdiv.appendChild(miselect);}
                           //desctd.appendChild(descdiv);
                               
                           var descinput = document.createElement("input");
                           descinput.setAttribute('class',jclass); //Será obligatorio?
                           descinput.className=jclass;            
                           descinput.style.width="30%";
                            
                           if (!objUtiles.estaVacio(COBLIGA) && objUtiles.utilEquals(COBLIGA, "S")){
                               descinput.setAttribute('class',"campo campotexto_ob"); //Será obligatorio?
                               descinput.className="campo campotexto_ob";      
                               descinput.setAttribute('obligatorio',true);
                           }
                           descinput.setAttribute('id','IMPVALOR1_'+CGRUP);
                           descinput.setAttribute('name','IMPVALOR1_'+CGRUP);
                           descinput.setAttribute('title',TGRUP+' - '+ '<axis:alt f="axisctr207" c="IMPVALOR" lit="101159"/>');                         
                           descinput.name='IMPVALOR1_'+CGRUP;
                           descinput.id='IMPVALOR1_'+CGRUP;
                           descinput.onchange = new Function("f_actualizar_franq("+CNIVEL+", "+CGRUP+", "+CSUBGRUPUNIC+","+CVERSION+",this.value,'"+CVALOR1+"','"+CVALOR2+"','"+CIMPMIN+"','"+CIMPMAX+"','"+IMPVALOR2+"','"+IMPMIN+"','"+IMPMAX+"')");
                           descinput.onfocus = new Function("f_on_focus_impvalor(this)");
                           descinput.value = IMPVALOR1;
                           descinput.formato = "decimal";
                           descdiv.appendChild(descinput);
                           desctd.appendChild(descdiv);  
                           newtd[ttd] = desctd;
                           ttd++;
                        </axis:visible>
                       
                        <axis:visible c="CVALOR2" f="axisctr207">	
                            var desctd=document.createElement("td");
                            desctd.style.width='22%';
                            desctd.setAttribute('class','dspText');
                            desctd.className='dspText';
                            var descdiv=document.createElement("div");
                            descdiv.setAttribute('class','dspIcons');
                            descdiv.className="dspIcons";
                    
                            var elementos = LISTACVALOR2;
                            
                            if (!objUtiles.estaVacio(elementos) ){
                          
                               if (elementos.length > 0 ) {
                                  //Creamos el select de comppanyia
                                 var miselect = document.createElement("select");            
                                        miselect.setAttribute('class',jclass); //Será obligatorio?
                                        miselect.className=jclass;            
                                        miselect.style.width="60%";
                                        
                                        if (!objUtiles.estaVacio(COBLIGA) && objUtiles.utilEquals(COBLIGA, "S")){
                                              miselect.setAttribute('class',"campo campotexto_ob"); //Será obligatorio?
                                               miselect.className="campo campotexto_ob";      
                                            miselect.setAttribute('obligatorio',true);
                                        }
                                        miselect.setAttribute('id','CVALOR2_'+CGRUP);
                                        miselect.setAttribute('name','CVALOR2_'+CGRUP);
                                        miselect.setAttribute('title',TGRUP+' - '+ '<axis:alt f="axisctr207" c="IMPVALOR2" lit="101159"/>2');                                      
                                        miselect.name='CVALOR2_'+CGRUP;
                                        miselect.id='CVALOR2_'+CGRUP;
                                        miselect.onchange = new Function("f_actualizar_franq("+CNIVEL+", "+CGRUP+", "+CSUBGRUPUNIC+","+CVERSION+","+IMPVALOR1+",'"+CVALOR1+"',this.value,'"+CIMPMIN+"','"+CIMPMAX+"','','"+IMPMIN+"','"+IMPMAX+"')");                                                                                                                                                                    
                                       // miselect.setAttribute('onchange',"f_actualizar_franq(this.value, '1', "+CGARANT+")");
                                            
                               }
                                       
                               var mioption = document.createElement("option");
                                
                               mioption.setAttribute('value', '');
                               miconcepto=document.createTextNode("- <axis:alt f="axisctr207" c="COMBO_SNV" lit="108341"/> -");
                               mioption.appendChild(miconcepto);
                               miselect.appendChild(mioption);
	                                 
                               for (var j = 0; j < elementos.length; j++) {
                                   CNIVELlista = elementos[j].OB_IAX_BF_LISTLIBRE.CATRIBU;
                                   TNIVELlista = elementos[j].OB_IAX_BF_LISTLIBRE.TATRIBU;
                               
                                   mioption = document.createElement("option");
                                   mioption.setAttribute('value', CNIVELlista);
                                   miconcepto=document.createTextNode(TNIVELlista);
                                     
                                   if (!objUtiles.estaVacio(CNIVEL)  && CNIVELlista == CVALOR2)
                                        mioption.selected= 'true';
                                   
	                               mioption.appendChild(miconcepto);
	                               miselect.appendChild(mioption);
                        
                                }
                                descdiv.appendChild(miselect);
                                //desctd.appendChild(descdiv);
                               
                                var descinput = document.createElement("input");
                                descinput.setAttribute('class',jclass); //Será obligatorio?
                                descinput.className=jclass;            
                                descinput.style.width="30%";
                                
                                if (!objUtiles.estaVacio(COBLIGA) && objUtiles.utilEquals(COBLIGA, "S")){
                                    descinput.setAttribute('class',"campo campotexto_ob"); //Será obligatorio?
                                    descinput.className="campo campotexto_ob";      
                                    descinput.setAttribute('obligatorio',true);
                                }
                                descinput.setAttribute('id','IMPVALOR2_'+CGRUP);
                                descinput.setAttribute('name','IMPVALOR2_'+CGRUP);
                                descinput.setAttribute('title',TGRUP+' - '+ '<axis:alt f="axisctr207" c="IMPVALOR2" lit="101159"/>2');                              
                                descinput.name='IMPVALOR2_'+CGRUP;
                                descinput.id='IMPVALOR2_'+CGRUP;
                                descinput.onchange = new Function("f_actualizar_franq("+CNIVEL+", "+CGRUP+", "+CSUBGRUPUNIC+","+CVERSION+",'"+IMPVALOR1+"','"+CVALOR1+"','"+CVALOR2+"','"+CIMPMIN+"','"+CIMPMAX+"',this.value,'"+IMPMIN+"','"+IMPMAX+"')");
                                descinput.onfocus = new Function("f_on_focus_impvalor(this)");
                                descinput.value = IMPVALOR2;                                
                                descinput.formato = "decimal";
                                descdiv.appendChild(descinput);
                                desctd.appendChild(descdiv);                                
                               }                               
                               newtd[ttd] = desctd;
                               ttd++;
                        </axis:visible>
                       
                        <axis:visible c="CIMPMIN" f="axisctr207">	
                               var desctd=document.createElement("td");
                               desctd.style.width='22%';
                               desctd.setAttribute('class','dspText');
                               desctd.className='dspText';
                               var descdiv=document.createElement("div");
                               descdiv.setAttribute('class','dspIcons');
                               descdiv.className="dspIcons";
                    
                               var elementos = LISTACIMPMIN;
                                    if (!objUtiles.estaVacio(elementos) ){
                                  
                                       if (elementos.length > 0 ) {
                                            //Creamos el select de comppanyia
                                       		var miselect = document.createElement("select");            
                                            miselect.setAttribute('class',jclass); //Será obligatorio?
                                            miselect.className=jclass;            
                                            miselect.style.width="60%";
                                            
                                            if (!objUtiles.estaVacio(COBLIGA) && objUtiles.utilEquals(COBLIGA, "S")){
                                                miselect.setAttribute('class',"campo campotexto_ob"); //Será obligatorio?
                                                miselect.className="campo campotexto_ob";      
                                                miselect.setAttribute('obligatorio',true);
                                            }
                                            miselect.setAttribute('id','CIMPMIN_'+CGRUP);
                                            miselect.setAttribute('name','CIMPMIN_'+CGRUP);
                                            miselect.setAttribute('title',TGRUP+' - '+ '<axis:alt f="axisctr207" c="CVALORMIN" lit="9904477"/>');
                                            miselect.name='CIMPMIN_'+CGRUP;
                                            miselect.id='CIMPMIN_'+CGRUP;
                                            miselect.onchange = new Function("f_actualizar_franq("+CNIVEL+", "+CGRUP+", "+CSUBGRUPUNIC+","+CVERSION+",'"+IMPVALOR1+"','"+CVALOR1+"','"+CVALOR2+"',this.value,'"+CIMPMAX+"','"+IMPVALOR2+"','','"+IMPMAX+"')");                                                                                                                                                                        
                                           // miselect.setAttribute('onchange',"f_actualizar_franq(this.value, '1', "+CGARANT+")");
                                                    
                                       }
                                       
                                     var mioption = document.createElement("option");                                      
                                     mioption.setAttribute('value', '');
                                     miconcepto=document.createTextNode("- <axis:alt f="axisctr207" c="COMBO_SNV" lit="108341"/> -");                                  
                                     mioption.appendChild(miconcepto);
	                                 miselect.appendChild(mioption);
	                                 
                                   	 for (var j = 0; j < elementos.length; j++) {
	                                     CNIVELlista = elementos[j].OB_IAX_BF_LISTLIBRE.CATRIBU;
	                                     TNIVELlista = elementos[j].OB_IAX_BF_LISTLIBRE.TATRIBU;
                                   
                                         mioption = document.createElement("option");
                                         mioption.setAttribute('value', CNIVELlista);
                                         miconcepto=document.createTextNode(TNIVELlista);
                                           
                                         if (!objUtiles.estaVacio(CNIVEL)  && CNIVELlista == CIMPMIN)
                                             mioption.selected= 'true';
                                         mioption.appendChild(miconcepto);
                                         miselect.appendChild(mioption);
                            
                                     }
	                                 descdiv.appendChild(miselect);
	                                 //desctd.appendChild(descdiv);
                               
                                     var descinput = document.createElement("input");
                                     descinput.setAttribute('class',jclass); //Será obligatorio?
                                     descinput.className=jclass;            
                                     descinput.style.width="30%";
                                     
                                     if (!objUtiles.estaVacio(COBLIGA) && objUtiles.utilEquals(COBLIGA, "S")){
                                         descinput.setAttribute('class',"campo campotexto_ob"); //Será obligatorio?
                                         descinput.className="campo campotexto_ob";      
                                         descinput.setAttribute('obligatorio',true);
                                     }
                                     descinput.setAttribute('id','IMPMIN_'+CGRUP);
                                     descinput.setAttribute('name','IMPMIN_'+CGRUP);
                                     descinput.setAttribute('title',TGRUP+' - '+ '<axis:alt f="axisctr207" c="CVALORMIN" lit="9904477"/>');                                   
                                     descinput.name='IMPMIN_'+CGRUP;
                                     descinput.id='IMPMIN_'+CGRUP;
                                     descinput.onchange = new Function("f_actualizar_franq("+CNIVEL+", "+CGRUP+", "+CSUBGRUPUNIC+","+CVERSION+",'"+IMPVALOR1+"','"+CVALOR1+"','"+CVALOR2+"','"+CIMPMIN+"','"+CIMPMAX+"','"+IMPVALOR2+"',this.value,'"+IMPMAX+"')");
                                     descinput.onfocus = new Function("f_on_focus_impvalor(this)");
                                     descinput.value = IMPMIN;
	                                 descinput.formato = "decimal";
	                                 descdiv.appendChild(descinput);
	                                 desctd.appendChild(descdiv);                               
                               }
                               newtd[ttd] = desctd;
                               ttd++;
                          </axis:visible>                              
                              
                          <axis:visible c="CIMPMAX" f="axisctr207">	
                               var desctd=document.createElement("td");
                               desctd.style.width='22%';
                               desctd.setAttribute('class','dspText');
                               desctd.className='dspText';
                               var descdiv=document.createElement("div");
                               descdiv.setAttribute('class','dspIcons');
                               descdiv.className="dspIcons";                              
                    
                               var elementos = LISTACIMPMAX;
                                    if (!objUtiles.estaVacio(elementos) ){
                                  
                                       if (elementos.length > 0 ) {
                                          //Creamos el select de comppanyia
                                       		var miselect = document.createElement("select");            
                                            miselect.setAttribute('class',jclass); //Será obligatorio?
                                            miselect.className=jclass;            
                                            miselect.style.width="60%";
                                            
                                            if (!objUtiles.estaVacio(COBLIGA) && objUtiles.utilEquals(COBLIGA, "S")){
                                                miselect.setAttribute('class',"campo campotexto_ob"); //Será obligatorio?
                                                miselect.className="campo campotexto_ob";      
                                                miselect.setAttribute('obligatorio',true);
                                            }
                                            miselect.setAttribute('id','CIMPMAX_'+CGRUP);
                                            miselect.setAttribute('name','CIMPMAX_'+CGRUP);
                                            miselect.setAttribute('title',TGRUP+' - '+ '<axis:alt f="axisctr207" c="CVALORMAX" lit="9904478"/>');
                                          
                                            miselect.name='CIMPMAX_'+CGRUP;
                                            miselect.id='CIMPMAX_'+CGRUP;
                                            miselect.onchange = new Function("f_actualizar_franq("+CNIVEL+", "+CGRUP+", "+CSUBGRUPUNIC+","+CVERSION+",'"+IMPVALOR1+"','"+CVALOR1+"','"+CVALOR2+"','"+CIMPMIN+"',this.value,'"+IMPVALOR2+"','"+IMPMIN+"','')");
                                            // miselect.setAttribute('onchange',"f_actualizar_franq(this.value, '1', "+CGARANT+")");     
                                       }
                                       
                                       var mioption = document.createElement("option");                                      
                                       mioption.setAttribute('value', '');
                                       miconcepto=document.createTextNode("- <axis:alt f="axisctr207" c="COMBO_SNV" lit="108341"/> -");
                                       mioption.appendChild(miconcepto);
                                       miselect.appendChild(mioption);
	                                    
                                   for (var j = 0; j < elementos.length; j++) {
                                       CNIVELlista = elementos[j].OB_IAX_BF_LISTLIBRE.CATRIBU;
                                       TNIVELlista = elementos[j].OB_IAX_BF_LISTLIBRE.TATRIBU;
                                   
                                       mioption = document.createElement("option");
                                       mioption.setAttribute('value', CNIVELlista);
                                       miconcepto=document.createTextNode(TNIVELlista);
                                           
                                       if (!objUtiles.estaVacio(CNIVEL)  && CNIVELlista == CIMPMAX)
                                            mioption.selected= 'true';
                                            
                                       mioption.appendChild(miconcepto);
                                       miselect.appendChild(mioption);
                            
                                    }
                                    descdiv.appendChild(miselect);
                                    //desctd.appendChild(descdiv);
                                    var descinput = document.createElement("input");
                                    descinput.setAttribute('class',jclass); //Será obligatorio?
                                    descinput.className=jclass;            
                                    descinput.style.width="30%";
                                    
                                    if (!objUtiles.estaVacio(COBLIGA) && objUtiles.utilEquals(COBLIGA, "S")){
                                        descinput.setAttribute('class',"campo campotexto_ob"); //Será obligatorio?
                                        descinput.className="campo campotexto_ob";      
                                        descinput.setAttribute('obligatorio',true);
                                    }
                                    descinput.setAttribute('id','IMPMIN_'+CGRUP);
                                    descinput.setAttribute('name','IMPMIN_'+CGRUP);
                                    descinput.setAttribute('title',TGRUP+' - '+ '<axis:alt f="axisctr207" c="CVALORMAX" lit="9904478"/>');                                  
                                    descinput.name='IMPMAX_'+CGRUP;
                                    descinput.id='IMPMAX_'+CGRUP;
                                    descinput.onchange = new Function("f_actualizar_franq("+CNIVEL+", "+CGRUP+", "+CSUBGRUPUNIC+","+CVERSION+",'"+IMPVALOR1+"','"+CVALOR1+"','"+CVALOR2+"','"+CIMPMIN+"','"+CIMPMAX+"','"+IMPVALOR2+"','"+IMPMIN+"',this.value)");
                                    descinput.onfocus = new Function("f_on_focus_impvalor(this)");
                                    descinput.value = IMPMAX;                                            
                                    descinput.formato = "decimal";                                            
                                    descdiv.appendChild(descinput);
                                    desctd.appendChild(descdiv);
                               
                               }                               
                               newtd[ttd] = desctd;
                               ttd++;
                     </axis:visible>
                     // Añadimos la nueva fila(con sus nuevas columnas) al cuerpo del displayTag
                     objLista.addNuevaFila(newtd, newtr, tbody);
                   }
                 }
             }catch(e){
            //  if (isDebugAjaxEnabled == "true")
                alert (e.name + " " + e.message);
            }        
        //}
    }        
        
    function f_on_focus_impvalor(obj){
        if(!objUtiles.estaVacio(obj.value) && !obj.readOnly){
            // Quitar puntos de mil
            obj.value = objNumero.quitarSeparadorMiles(obj.value);        
        }
    }
      
  </script>
  </head>
    <body onload="f_onload()" onunload="try { f_clear_resources(document.body) } catch (e) {}">
    	<div id="wrapper" class="wrapper">
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
        
        <form name="miForm" action="" method="POST">
            <input type="hidden" name="operation" value=""/>
            <input type="hidden" name="CGARANT" id="CGARANT" value="${__formdata.CGARANT}"/>
                                                   
                                                   
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario">${sessionScope.axisctr_garantia.DESCRIPCION}</c:param>
                <c:param name="producto"><axis:alt f="axisctr013" c="LIT_FORMULARIO" lit="9001800" /></c:param>
                <c:param name="form">axisctr013</c:param>
            </c:import>
          
             <div class="separador">&nbsp;</div>    <div class="separador">&nbsp;</div>   
            <table class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                    		<%--c:if test="${!empty __formdata.IFRANQU && __formdata.IFRANQU > 0}"--%>
                    
                        <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axisctr013" c="IMG_TITULO_GO" lit="9904188"/>  <axis:visible c="CMONPROD" f="axisctr013"><c:if test="${!empty CMONPROD}"> - <b class="titulocaja" style="color:black"> <axis:alt f="axisctr013" c="CMONPROD" lit="108645"/> : <b> ${CMONPRODINT} - ${requestScope.TMONPROD}</b> </c:if> </axis:visible></div>
                        <!--campos-->
                        <table class="seccion">
                           <tr>
                                <th style="width:20%;height:0px"></th>
                                <th style="width:20%;height:0px"></th>
                                <th style="width:20%;height:0px"></th>
                                <th style="width:20%;height:0px"></th>  
                                <th style="width:20%;height:0px"></th> 
                            </tr>
                            <tr>
                                <td align="left" colspan="5">
                                    <table class="area" align="center">
                                         <tr>
                                            <th style="width:20%;height:0px"></th>
                                            <th style="width:25%;height:0px"></th>
                                            <th style="width:25%;height:0px"></th>
                                            <th style="width:25%;height:0px"></th>
                                        </tr>
                                        <tr>
                                            <axis:ocultar f="axisctr013" c="IFRANQU" dejarHueco="false">
                                                <td class="campocaja titulocampo">
                                                    <b id="label_IFRANQU"><axis:alt f="axisctr013" c="IFRANQU" lit="9001215"></axis:alt></b>
                                                </td>
                                            </axis:ocultar>
                                         
                                        </tr>
                                        <tr>
                                            <axis:ocultar f="axisctr013" c="IFRANQU" dejarHueco="false">
                                                <td class="campocaja">
                                                      <input type="text" class="campowidthinput campo campotexto" size="15" 
                                                value="<fmt:formatNumber pattern='${__formatNumberPatterns[__defaultCMONINT]}' value='${__formdata.IFRANQU}'/>" name="IFRANQU" id="IFRANQU"
                                                 title="<axis:alt f="axisctr013" c="IFRANQU" lit="9001215"/>"
                                                <axis:atr f="axisage006" c="IFRANQU"/> />
                                                </td>
                                            </axis:ocultar>
                                          
                                        </tr>
                                    </table>
                                    
                                    
                                    
                                      
                                     <c:if test="${!empty __formdata.franqgarlibres}">
                                     <c:import url="axisctr013_franqgarlibres.jsp"/>
                                      </c:if>
                                             
                                             </td>
                                             </tr>
                                             </table>
                                    
                                    
                                    <%--/td>
                                    </tr>
                                    </table--%>
                                  <%--/c:if--%>
                                     <axis:visible f="axisctr013" c="DSP_TOT_FRANQUICIAS">
                                    <c:if test="${!empty __formdata.franq || !empty __formdata.franqtecnicas|| !empty __formdata.franqtecnicaslibres||!empty __formdata.franqlibres}">
                                    <table class="seccion">
                                 
                                    <!-- Campos -->
                                    <div class="separador">&nbsp;</div>        
                                        <tr>
                                            <td align="left">
                                                   <table  >
                                                    <tr>
                                                            <td>
                                                              <div class="separador">&nbsp;</div>
               
                                                                <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axisctr013" c="TIT_FRANQ" lit="9001800" /></div>
                                                                <div class="separador">&nbsp;</div>
                                                                </td>
                                                            </tr>
                                                     <c:if test="${!empty __formdata.franq || !empty __formdata.franqlibres}">
                                                        <axis:visible f="axisctr013" c="DSP_FRANQUICIAS">
                                                         <tr>
                                                            <td class="titulocaja">
                                                             
                                                               <c:set var="title0"><axis:alt f="axisctr013" c="DESCRIPCION" lit="100588"></axis:alt></c:set>
                                                                                <c:set var="title1"><axis:alt f="axisctr013" c="IIMPORT" lit="101159"></axis:alt></c:set>
                                                                                
                                                              <c:if test="${!empty __formdata.franq}">
                                                                            <display:table name="${__formdata.franq}" id="franquicias" style="width:60%" export="false" class="dsptgtable" pagesize="-1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                                                                                  requestURI="modal_axisctr013.do?paginar=true">
                                                                                     <%@ include file="../include/displaytag.jsp"%>
                                                                                     <axis:visible f="axisctr013" c="TGRUP">
                                                                                         <display:column title="${title0}" sortable="false" sortProperty="franquicias.OB_IAX_BF_PROACTGRUP.GRUPO.TGRUP" headerClass="headwidth10 sortable"  media="html" autolink="false" >
                                                                                             <div class="dspText">${franquicias.OB_IAX_BF_PROACTGRUP.GRUPO.TGRUP}</div>
                                                                                         </display:column>
                                                                                     </axis:visible>
                                                                                     <axis:visible f="axisctr013" c="TNIVEL">
                                                                                         <display:column title="${title1}" sortable="false" sortProperty="franquicias.OB_IAX_BF_PROACTGRUP.GRUPO.TGRUP" headerClass="headwidth10 sortable"  media="html" autolink="false" >
                                                                                             
                                                                                              <div class="dspText">
                                                                                                ${franquicias.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.TNIVEL}
                                                                                                
                                                                                             </div>
                                                                                         </display:column>
                                                                                         
                                                                                         
                                                                                     </axis:visible>     
                                                                                     
                                                                                 </display:table>
                                                                                 </c:if>
                                                                                  <c:if test="${!empty __formdata.franqlibres}">
                                                                                            <div id="DSP_FRANQUICIASLIBRES" class="displayspaceOver" style="visibility:hidden;">&nbsp;</div>
                                                                                              <c:set var="title3"><axis:alt f="axisctr013" c="IMPVALOR2" lit="101159"></axis:alt>2</c:set>
                                                                                              <c:set var="title4"><axis:alt f="axisctr013" c="VALORMIN" lit="9904477"></axis:alt></c:set>
                                                                                              <c:set var="title5"><axis:alt f="axisctr013" c="VALORMAX" lit="9904478"></axis:alt></c:set>
                                                                                              <b><axis:alt f="axisctr013" c="FRAQNQLIBRES" lit="9904502"></axis:alt></b>
                                                                                          <div id="Dt_FRANQUICIAS" class="displayspace">
                                                                                          <display:table name="${__formdata.franqlibres}" id="franquiciaslibres"  export="false" class="dsptgtable" pagesize="-1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                                                                                          requestURI="modal_axisctr013.do?paginar=true">
                                                                                             <%@ include file="../include/displaytag.jsp"%>
                                                                                             <axis:visible f="axisctr013" c="TGRUP">
                                                                                                 <display:column title="${title0}" sortable="false" style="width:15%" sortProperty="franquiciaslibres.OB_IAX_BF_PROACTGRUP.GRUPO.TGRUP" headerClass="sortable"  media="html" autolink="false" >
                                                                                                     <div class="dspText">${franquiciaslibres.OB_IAX_BF_PROACTGRUP.GRUPO.TGRUP}</div>
                                                                                                 </display:column>
                                                                                             </axis:visible>
                                                                                             <axis:visible f="axisctr013" c="CVALOR1">
                                                                                                 <display:column title="${title1}" sortable="false" style="width:22%" sortProperty="franquiciaslibres.OB_IAX_BF_PROACTGRUP.GRUPO.TGRUP" headerClass="sortable"  media="html" autolink="false" >
                                                                                                     <div class="dspText">
                                                                                                                <c:if test="${!empty franquiciaslibres.OB_IAX_BF_PROACTGRUP.GRUPO.LSUBGRUPOS && franquiciaslibres.OB_IAX_BF_PROACTGRUP.GRUPO.LSUBGRUPOS[0].OB_IAX_BF_GRUPSUBGRUP.CTIPGRUPSUBGRUP == 3}">
                                                                                                                    ${franquiciaslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.TVALOR1} -
                                                                                                                   <fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${franquiciaslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.IMPVALOR1}"/>
                                                                                                                 </c:if>
                                                                                                     </div>
                                                                                                 </display:column>
                                                                                                 </axis:visible>
                                                                                                  <axis:visible f="axisctr013" c="CVALOR2">
                                                                                                  <display:column title="${title3}" sortable="false"  style="width:22%" sortProperty="franquiciaslibres.OB_IAX_BF_PROACTGRUP.GRUPO.TGRUP" headerClass="sortable"  media="html" autolink="false" >
                                                                                                      <div class="dspText">
                                                                                                                <c:if test="${!empty franquiciaslibres.OB_IAX_BF_PROACTGRUP.LNIVELES[0].OB_IAX_BF_DETNIVEL.LISTACVALOR2}">
                                                                                                                        ${franquiciaslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.TVALOR2} -
                                                                                                                <fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${franquiciaslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.IMPVALOR2}"/>
                                                                                                            </c:if>
                                                                                                     </div>
                                                                                                 </display:column>
                                                                                                 </axis:visible>
                                                                                                 <axis:visible f="axisctr013" c="CIMPMIN">
                                                                                                  <display:column title="${title4}" sortable="false" style="width:22%" sortProperty="franquiciaslibres.OB_IAX_BF_PROACTGRUP.GRUPO.TGRUP" headerClass="sortable"  media="html" autolink="false" >
                                                                                                      <div class="dspText">
                                                                                                           <c:if test="${!empty franquiciaslibres.OB_IAX_BF_PROACTGRUP.LNIVELES[0].OB_IAX_BF_DETNIVEL.LISTACIMPMIN}">
                                                                                                                        ${franquiciaslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.TIMPMIN} - <fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${franquiciaslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.IMPMIN}"/>
                                                                                                            </c:if>
                                                                                                     </div>
                                                                                                 </display:column>
                                                                                                  </axis:visible>
                                                                                                 <axis:visible f="axisctr013" c="CIMPMAX">
                                                                                                  <display:column title="${title5}" sortable="false" style="width:22%" sortProperty="franquiciaslibres.OB_IAX_BF_PROACTGRUP.GRUPO.TGRUP" headerClass="sortable"  media="html" autolink="false" >
                                                                                                      <div class="dspText">
                                                                                                           <c:if test="${!empty franquiciaslibres.OB_IAX_BF_PROACTGRUP.LNIVELES[0].OB_IAX_BF_DETNIVEL.LISTACIMPMAX}">
                                                                                                                 ${franquiciaslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.TIMPMAX} - <fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${franquiciaslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.IMPMAX}"/>
                                                                                                                 
                                                                                                            </c:if>
                                                                                                     </div>
                                                                                                 </display:column>
                                                                                             </axis:visible>     
                                                                                         </display:table>
                                                                                         </div>
                                                                                         </c:if>
                                                                         </td>
                                                                    </tr>
                                                                    </axis:visible>
                                                                </c:if>
                                                        
                                                          <c:if test="${!empty __formdata.franqtecnicas || !empty __formdata.franqtecnicaslibres }">
                                                            <axis:visible f="axisctr013" c="DSP_FRANQTECNICAS"> 
                                                           
                                                         <tr>
                                                            <td class="titulocaja">
                                                              <div class="separador">&nbsp;</div>
                                                            <b><axis:alt c="LIT_FRANTECNICAS" f="axisctr013" lit="9904198"/></b>
                                                               
                                                                <div class="separador">&nbsp;</div>
                                                               <c:set var="title0"><axis:alt f="axisctr013" c="DESCRIPCION" lit="100588"></axis:alt></c:set>
                                                                                <c:set var="title1"><axis:alt f="axisctr013" c="IIMPORT" lit="101159"></axis:alt></c:set>
                                                                         
                                                                         <c:if test="${!empty __formdata.franqtecnicas}">        
                                                              
                                                                            <display:table name="${__formdata.franqtecnicas}" id="franquicias" style="width:60%" export="false" class="dsptgtable" pagesize="-1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                                                                                  requestURI="modal_axisctr013.do?paginar=true">
                                                                                     <%@ include file="../include/displaytag.jsp"%>
                                                                                     <axis:visible f="axisctr013" c="TGRUP">
                                                                                         <display:column title="${title0}" sortable="false" sortProperty="franquicias.OB_IAX_BF_PROACTGRUP.GRUPO.TGRUP" headerClass="headwidth10 sortable"  media="html" autolink="false" >
                                                                                             <div class="dspText">${franquicias.OB_IAX_BF_PROACTGRUP.GRUPO.TGRUP}</div>
                                                                                         </display:column>
                                                                                     </axis:visible>
                                                                                     <axis:visible f="axisctr013" c="TNIVEL">
                                                                                         <display:column title="${title1}" sortable="false" sortProperty="franquicias.OB_IAX_BF_PROACTGRUP.GRUPO.TGRUP" headerClass="headwidth10 sortable"  media="html" autolink="false" >
                                                                                             
                                                                                              <div class="dspText">
                                                                                                ${franquicias.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.TNIVEL}
                                                                                                
                                                                                             </div>
                                                                                         </display:column>
                                                                                         
                                                                                         
                                                                                     </axis:visible>     
                                                                                     
                                                                                 </display:table>
                                                                                 </c:if>
                                                                                    <c:if test="${!empty __formdata.franqtecnicaslibres}">
                                                                                        <div id="DSP_FRANQUICIASTECNICASLIBRES" class="displayspaceOver" style="visibility:hidden;">&nbsp;</div>
                                                                                          <c:set var="title3"><axis:alt f="axisctr013" c="IIMPORT" lit="101159"></axis:alt>2</c:set>
                                                                                          <c:set var="title4"><axis:alt f="axisctr013" c="VALORMIN" lit="9904477"></axis:alt></c:set>
                                                                                          <c:set var="title5"><axis:alt f="axisctr013" c="VALORMAX" lit="9904478"></axis:alt></c:set>
                                                                                     <b>    <axis:alt f="axisctr013" c="FRAQNQTECNICASLIBRES" lit="9904501"></axis:alt></b>
                                                                                         
                                                                                              <div id="Dt_FRANQUICIAS" class="displayspace">
                                                                                          <display:table name="${__formdata.franqtecnicaslibres}" id="franquiciastecnicaslibres"  export="false" class="dsptgtable" pagesize="-1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                                                                                          requestURI="modal_axisctr013.do?paginar=true">
                                                                                             <%@ include file="../include/displaytag.jsp"%>
                                                                                             <axis:visible f="axisctr013" c="TGRUP">
                                                                                                 <display:column title="${title0}" sortable="false" style="width:15%" sortProperty="franquiciastecnicaslibres.OB_IAX_BF_PROACTGRUP.GRUPO.TGRUP" headerClass="sortable"  media="html" autolink="false" >
                                                                                                     <div class="dspText">${franquiciastecnicaslibres.OB_IAX_BF_PROACTGRUP.GRUPO.TGRUP}</div>
                                                                                                 </display:column>
                                                                                             </axis:visible>
                                                                                             <axis:visible f="axisctr013" c="CVALOR1">
                                                                                                 <display:column title="${title1}"  sortable="false" style="width:22%" sortProperty="franquiciastecnicaslibres.OB_IAX_BF_PROACTGRUP.GRUPO.TGRUP" headerClass="sortable"  media="html" autolink="false" >
                                                                                                     
                                                                                                      <div class="dspText">
                                                                                                      
                                                                                                         
                                                                                                                <c:if test="${!empty franquiciastecnicaslibres.OB_IAX_BF_PROACTGRUP.GRUPO.LSUBGRUPOS && franquiciastecnicaslibres.OB_IAX_BF_PROACTGRUP.GRUPO.LSUBGRUPOS[0].OB_IAX_BF_GRUPSUBGRUP.CTIPGRUPSUBGRUP == 3}">
                                                                                                                        ${franquiciastecnicaslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.TVALOR1} - <fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${franquiciastecnicaslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.IMPVALOR1}"/>
                                                                                                            
                                                                                                                </c:if>
                                                                                                          
                                                                                                     </div>
                                                                                                 </display:column>
                                                                                                        </axis:visible>
                                                                                                 <axis:visible f="axisctr013" c="CVALOR2">
                                                                                                  <display:column title="${title3}" sortable="false"  style="width:22%" sortProperty="franquiciastecnicaslibres.OB_IAX_BF_PROACTGRUP.GRUPO.TGRUP" headerClass="sortable"  media="html" autolink="false" >
                                                                                                     
                                                                                                      <div class="dspIcons">
                                                                                                      
                                                                                                                <c:if test="${!empty franquiciastecnicaslibres.OB_IAX_BF_PROACTGRUP.LNIVELES[0].OB_IAX_BF_DETNIVEL.LISTACVALOR2}">
                                                                                                                  ${franquiciastecnicaslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.TVALOR2} - <fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${franquiciastecnicaslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.IMPVALOR2}"/>
                                                                                                                </c:if>
                                                                                                     
                                                                                                          
                                                                                                     </div>
                                                                                                 </display:column>
                                                                                                        </axis:visible>
                                                                                                 <axis:visible f="axisctr013" c="CIMPMIN">
                                                                                                  <display:column title="${title4}" sortable="false" style="width:22%" sortProperty="franquiciastecnicaslibres.OB_IAX_BF_PROACTGRUP.GRUPO.TGRUP" headerClass="sortable"  media="html" autolink="false" >
                                                                                                     
                                                                                                      <div class="dspIcons">
                                                                                                      
                                                                                                           <c:if test="${!empty franquiciastecnicaslibres.OB_IAX_BF_PROACTGRUP.LNIVELES[0].OB_IAX_BF_DETNIVEL.LISTACIMPMIN}">
                                                                                                                ${franquiciastecnicaslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.TIMPMIN} - <fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${franquiciastecnicaslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.IMPMIN}"/>
                                                                                                            </c:if>
                                                                                                          
                                                                                                     </div>
                                                                                                 </display:column>
                                                                                                        </axis:visible>
                                                                                                 <axis:visible f="axisctr013" c="CIMPMAX">
                                                                                                  <display:column title="${title5}" sortable="false" style="width:22%" sortProperty="franquiciastecnicaslibres.OB_IAX_BF_PROACTGRUP.GRUPO.TGRUP" headerClass="sortable"  media="html" autolink="false" >
                                                                                                     
                                                                                                      <div class="dspIcons">
                                                                                                           <c:if test="${!empty franquiciastecnicaslibres.OB_IAX_BF_PROACTGRUP.LNIVELES[0].OB_IAX_BF_DETNIVEL.LISTACIMPMAX}">
                                                                                                                ${franquiciastecnicaslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.TIMPMAX} - <fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${franquiciastecnicaslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.IMPMAX}"/>
                                                                                                            </c:if>                                                                                                          
                                                                                                     </div>
                                                                                                 </display:column>
                                                                                                 
                                                                                             </axis:visible>     
                                                                                             
                                                                                         </display:table>
                                                                                         </div>
                                                                                                 </c:if>
                                                                         </td>
                                                                    </tr>
                                                                    </axis:visible>
                                                        </c:if>
                                                      
                                                        
                                                    </table>
                                                    
                                                    </c:if>
                                                    
                                                    
                                                    <%--BONUS MALUS--%>
                                                    
                                                     <c:if test="${!empty __formdata.bonusmalus ||  !empty __formdata.bonusmaluslibres}">
                                    <table class="seccion">
                                 
                                    <!-- Campos -->
                                    <div class="separador">&nbsp;</div>        
                                        <tr>
                                            <td align="left">
                                                   <table  >
                                                    <tr>
                                                            <td>
                                                              <div class="separador">&nbsp;</div>
               
                                                                <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axisctr013" c="TIT_BONUS" lit="9001799" /></div>
                                                                <div class="separador">&nbsp;</div>
                                                                </td>
                                                            </tr>
                                                    
                                                         <c:if test="${!empty __formdata.bonusmalus || !empty __formdata.bonusmaluslibres}">
                                                           <axis:visible f="axisctr013" c="DSP_BONUSMALUS"> 
                                                         <tr>
                                                            <td class="titulocaja">
                                                              <div class="separador">&nbsp;</div>
               
                                                                 <b><axis:alt c="LIT_BONUSMALUS" f="axisctr013" lit="9001799"/></b>
                                                                <div class="separador">&nbsp;</div>
                                                               <c:set var="title0"><axis:alt f="axisctr013" c="DESCRIPCION" lit="100588"></axis:alt></c:set>
                                                                                <c:set var="title1"><axis:alt f="axisctr013" c="IIMPORT" lit="101159"></axis:alt></c:set>
                                                                                
                                                                         <c:if test="${!empty __formdata.bonusmalus}">
                                                                            <display:table name="${__formdata.bonusmalus}" id="franquicias" style="width:60%" export="false" class="dsptgtable" pagesize="-1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                                                                                  requestURI="modal_axisctr013.do?paginar=true">
                                                                                     <%@ include file="../include/displaytag.jsp"%>
                                                                                     <axis:visible f="axisctr013" c="TGRUP">
                                                                                         <display:column title="${title0}" sortable="false" sortProperty="franquicias.OB_IAX_BF_PROACTGRUP.GRUPO.TGRUP" headerClass="headwidth10 sortable"  media="html" autolink="false" >
                                                                                             <div class="dspText">${franquicias.OB_IAX_BF_PROACTGRUP.GRUPO.TGRUP}</div>
                                                                                         </display:column>
                                                                                     </axis:visible>
                                                                                     <axis:visible f="axisctr013" c="TNIVEL">
                                                                                         <display:column title="${title1}" sortable="false" sortProperty="franquicias.OB_IAX_BF_PROACTGRUP.GRUPO.TGRUP" headerClass="headwidth10 sortable"  media="html" autolink="false" >
                                                                                             
                                                                                              <div class="dspText">
                                                                                                ${franquicias.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.TNIVEL}
                                                                                                
                                                                                             </div>
                                                                                         </display:column>
                                                                                         
                                                                                         
                                                                                     </axis:visible>     
                                                                                     
                                                                                 </display:table>
                                                                                </c:if>
                                                                             <c:if test="${!empty __formdata.bonusmaluslibres}">
                                                                                <div id="DSP_BONUMASNULIBRES" class="displayspaceOver" style="visibility:hidden;">&nbsp;</div>
                                                                                  <c:set var="title3"><axis:alt f="axisctr013" c="IIMPORT" lit="101159"></axis:alt>2</c:set>
                                                                                  <c:set var="title4"><axis:alt f="axisctr013" c="VALORMIN" lit="9904477"></axis:alt></c:set>
                                                                                  <c:set var="title5"><axis:alt f="axisctr013" c="VALORMAX" lit="9904478"></axis:alt></c:set>
                                                                                <b> <axis:alt f="axisctr013" c="BONUMASNULIBRES" lit="9904503"></axis:alt></b>
                                                                                 
                                                                                      <div id="Dt_FRANQUICIAS" class="displayspace">
                                                                                  <display:table name="${__formdata.bonusmaluslibres}" id="bonumaluslibres"  export="false" class="dsptgtable" pagesize="-1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                                                                                  requestURI="modal_axisctr013.do?paginar=true">
                                                                                     <%@ include file="../include/displaytag.jsp"%>
                                                                                     <axis:visible f="axisctr013" c="TGRUP">
                                                                                         <display:column title="${title0}" sortable="false" style="width:15%" sortProperty="bonumaluslibres.OB_IAX_BF_PROACTGRUP.GRUPO.TGRUP" headerClass="sortable"  media="html" autolink="false" >
                                                                                             <div class="dspText">${bonumaluslibres.OB_IAX_BF_PROACTGRUP.GRUPO.TGRUP}</div>
                                                                                         </display:column>
                                                                                     </axis:visible>
                                                                                     <axis:visible f="axisctr013" c="CVALOR1">
                                                                                         <display:column title="${title1}" sortable="false" style="width:22%" sortProperty="bonumaluslibres.OB_IAX_BF_PROACTGRUP.GRUPO.TGRUP" headerClass="sortable"  media="html" autolink="false" >
                                                                                             
                                                                                              <div class="dspText">
                                                                                              
                                                                                                 
                                                                                                        <c:if test="${!empty bonumaluslibres.OB_IAX_BF_PROACTGRUP.GRUPO.LSUBGRUPOS && bonumaluslibres.OB_IAX_BF_PROACTGRUP.GRUPO.LSUBGRUPOS[0].OB_IAX_BF_GRUPSUBGRUP.CTIPGRUPSUBGRUP == 3}">
                                                                                                          ${bonumaluslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.TVALOR1} - <fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${bonumaluslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.IMPVALOR1}"/>
                                                                                                    </c:if>
                                                                                                    
                                                                                             </div>
                                                                                         </display:column>
                                                                                         </axis:visible>
                                                                                     <axis:visible f="axisctr013" c="CVALOR2">
                                                                                          <display:column title="${title3}" sortable="false"  style="width:22%" sortProperty="bonumaluslibres.OB_IAX_BF_PROACTGRUP.GRUPO.TGRUP" headerClass="sortable"  media="html" autolink="false" >
                                                                                             
                                                                                              <div class="dspIcons">
                                                                                              
                                                                                                        <c:if test="${!empty bonumaluslibres.OB_IAX_BF_PROACTGRUP.LNIVELES[0].OB_IAX_BF_DETNIVEL.LISTACVALOR2}">
                                                                                                          ${bonumaluslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.TVALOR2} - <fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${bonumaluslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.IMPVALOR2}"/>
                                                                                                    </c:if>
                                                                                            
                                                                                             </div>
                                                                                         </display:column>
                                                                                         </axis:visible>
                                                                                     <axis:visible f="axisctr013" c="CIMPMIN">
                                                                                          <display:column title="${title4}" sortable="false" style="width:22%" sortProperty="bonumaluslibres.OB_IAX_BF_PROACTGRUP.GRUPO.TGRUP" headerClass="sortable"  media="html" autolink="false" >
                                                                                             
                                                                                              <div class="dspIcons">
                                                                                              
                                                                                                   <c:if test="${!empty bonumaluslibres.OB_IAX_BF_PROACTGRUP.LNIVELES[0].OB_IAX_BF_DETNIVEL.LISTACIMPMIN}">
                                                                                                         ${bonumaluslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.TIMPMIN} - <fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${bonumaluslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.IMPMIN}"/>
                                                                                                    </c:if>
                                                                                             </div>
                                                                                         </display:column>
                                                                                         </axis:visible>
                                                                                     <axis:visible f="axisctr013" c="CIMPMAX">
                                                                                          <display:column title="${title5}" sortable="false" style="width:22%" sortProperty="bonumaluslibres.OB_IAX_BF_PROACTGRUP.GRUPO.TGRUP" headerClass="sortable"  media="html" autolink="false" >
                                                                                             
                                                                                              <div class="dspIcons">
                                                                                              
                                                                                                  
                                                                                                   <c:if test="${!empty bonumaluslibres.OB_IAX_BF_PROACTGRUP.LNIVELES[0].OB_IAX_BF_DETNIVEL.LISTACIMPMAX}">
                                                                                                        ${bonumaluslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.TIMPMAX} - <fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${bonumaluslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.IMPMAX}"/>
                                                                                                    </c:if>
                                                                                                  
                                                                                             </div>
                                                                                         </display:column>
                                                                                         
                                                                                         
                                                                                     </axis:visible>     
                                                                                     
                                                                                 </display:table>
                                                                                 </div>
                                                                                 </c:if>   
                                                                         </td>
                                                                    </tr>
                                                                    </axis:visible>
                                                        </c:if>
                                                        
                                                    </table>
                                                    
                                                    </c:if>
                                                    
                                                    
                                                    
                                                    
                                                    
                                                    
                                                    
                                                    
                                                    
                                                    
                                                    </axis:visible>
                                            </td>
                                        </tr>
                                        
                                       
                                    </table>
                                </td>
                            </tr>
                            
                        </table>
                    </td>
                </tr>
            </table>

            <!-- Botonera -->
            <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisctr013</c:param>
                <c:param name="__botones">cancelar,aceptar</c:param>
            </c:import>
            <c:import url="../include/mensajes.jsp" />
        </form>
    </div>
    </body>
</html>
