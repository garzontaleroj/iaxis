<%/* Revision:# 6Lg1fjFFTc1A4ehrVi6c5A== # */%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>


<c:set var="pantalla" value="${param.nombrePantalla}"/>
 
<c:choose>
    <c:when test="${param.multiPantalla == 'true'}">
        <c:set var="literalPantalla">
            <axis:alt f="axisctr006" c="TIT1" lit="1000183"/>/<axis:alt f="axisctr006" c="TIT2" lit="1000079"/>
        </c:set>
    </c:when>
    <c:otherwise>
        <c:set var="literalPantalla">
            <axis:alt f="axisctr006" c="TIT3" lit="1000079"/>
        </c:set>
    </c:otherwise>
</c:choose>

<c:import url="../include/modal_estandar.jsp">
	<c:param name="titulo"><axis:alt f="axisctr006" c="TIT_AXISCTR177" lit="9902578" /></c:param>
	<c:param name="nid" value="axisctr177" />
</c:import>
<c:import url="../include/modal_estandar.jsp">
	<c:param name="titulo"><axis:alt f="axisctr006" c="TIT_AXISCTR178" lit="9902497" /></c:param>
	<c:param name="nid" value="axisctr178" />
</c:import>
<c:import url="../include/modal_estandar.jsp">
	<c:param name="titulo"><axis:alt f="axisctr006" c="TIT_AXISCTR179" lit="9902585" /></c:param>
	<c:param name="nid" value="axisctr179" />
</c:import>
<c:import url="../include/modal_estandar.jsp">
	<c:param name="titulo"><axis:alt f="axisctr006" c="TIT_AXISPER001" lit="1000235" /></c:param>
	<c:param name="nid" value="axisper001" />
</c:import>

<c:import url="../include/modal_estandar.jsp">
	<c:param name="titulo"><axis:alt f="axisctr006" c="TIT_AXISPER005" lit="1000235" /></c:param>
	<c:param name="nid" value="axisper005" />
</c:import>

<input type="hidden" name="opBENEIDENT" value="${__formdata.opBENEIDENT}" />
<input type="hidden" name="SPERSON_BENEIDENT" value="" />
<input type="hidden" name="CGARANT_BENEIDENT" value="" />
<input type="hidden" name="NORDEN_BENEIDENT" value="" />
<input type="hidden" name="NRIESGO_BENEIDENT" value="${NRIESGO_BENEIDENT}" />



<script language="Javascript">
	var seccionglobal ;
	
 function  f_abrir_axisper005(faceptar, nuevaPers) {
       /* var SPERSON = "";
        
        if (objUtiles.estaVacio(faceptar))
            faceptar = "";
            
        if (objUtiles.estaVacio(nuevaPers)) {
            if (faceptar.indexOf("tomadores") > 0)
                SPERSON = document.axisctr002Form.SPERSON_TOMAD.value;        
            else if (faceptar.indexOf("asegurados") > 0)
                SPERSON = document.axisctr003Form.SPERSON_ASEG.value;
        }*/
        objUtiles.cerrarModal("axisper001");
        objUtiles.abrirModal("axisper005", "src", "modal_axisper005.do?operation=form&faceptar=f_aceptar_axisper005"+seccionglobal+"&ORIGEN=AXISCTR006" );
    }
    
    function f_cerrar_axisper005(faceptar) {
        objUtiles.cerrarModal("axisper005");
    }
    


 function f_aceptar_axisper005 (faceptar, SPERSON) {
        objUtiles.cerrarModal("axisper005");
         
     
         if (faceptar == "f_aceptar_axisper005BENRIESGO")
         	f_aceptar_axisper001BENRIESGO(SPERSON);
         	
         	
         	if (faceptar == "f_aceptar_axisper005GAR_BENEF_AMPARO")
         		f_aceptar_axisper001GARBENEFAMPARO(SPERSON);
        
    }    
    

	
	
function f_aceptar_axisper001BENRIESGO(SPERSON_OUT){
    
	objUtiles.cerrarModal("axisper001");
    document.${pantalla}Form.opBENEIDENT.value="ANADIR_BENRIESGO";
    document.${pantalla}Form.SPERSON_BENEIDENT.value=SPERSON_OUT
    objUtiles.ejecutarFormulario("axis_${pantalla}.do", "form", document.${pantalla}Form, "_self", objJsMessages.jslit_cargando);
}

function f_aceptar_axisper001GARBENEFAMPARO(SPERSON_OUT){
    
	objUtiles.cerrarModal("axisper001");
    document.${pantalla}Form.opBENEIDENT.value="ANADIR_GAR_BENEF_AMPARO";
    document.${pantalla}Form.CGARANT_BENEIDENT.value=document.${pantalla}Form.CGARANT_BENEIDENT.value;//TODO:
    document.${pantalla}Form.SPERSON_BENEIDENT.value=SPERSON_OUT
    
    objUtiles.ejecutarFormulario("axis_${pantalla}.do", "form", document.${pantalla}Form, "_self", objJsMessages.jslit_cargando);
}


function f_aceptar_axisper001GAR_BENEF(SPERSON_OUT){
	objUtiles.cerrarModal("axisper001")
}
function f_aceptar_axisper001GAR_BENEF_AMPARO(SPERSON_OUT){
	objUtiles.cerrarModal("axisper001")
    
}

function f_cerrar_axisper001() {
	objUtiles.cerrarModal("axisper001")
}    
function f_cerrar_axisctr177() {

	objUtiles.cerrarModal("axisctr177");
        objUtiles.ejecutarFormulario("axis_${pantalla}.do", "form", document.${pantalla}Form, "_self", objJsMessages.jslit_cargando);
}    
function f_abrir_axisctr178() {
	objUtiles.abrirModal("axisctr178","src","modal_axisctr178.do?operation=init", 700,500);
}
function f_cerrar_axisctr178() {
	objUtiles.cerrarModal("axisctr178");
}   

function f_aceptar_axisctr178() {
	objUtiles.cerrarModal("axisctr178");
        objUtiles.ejecutarFormulario("axis_${pantalla}.do", "form", document.${pantalla}Form, "_self", objJsMessages.jslit_cargando);
} 
function f_abrir_axisctr179() {
	objUtiles.abrirModal("axisctr179","src","modal_axisctr179.do?operation=init");
}
function f_cerrar_axisctr179() {
	objUtiles.cerrarModal("axisctr179")
}    

function f_aceptar_axisctr179() {
	objUtiles.cerrarModal("axisctr179");
        objUtiles.ejecutarFormulario("axis_${pantalla}.do", "form", document.${pantalla}Form, "_self", objJsMessages.jslit_cargando);
} 
function f_benef_ident(seccion,op,dato1,dato2,dato3,dato4,dato5,dato6) {
    //alert(seccion+" "+op+" "+dato1+" "+dato2+" "+dato3+" "+dato4+" "+dato5+" "+dato6)
    seccionglobal = seccion;
    ORIGEN = "${__formdata.ORIGEN}";
	
	MAS_BENEF = "${__formdata.MAS_BENEF}";

    if (MAS_BENEF != '2') {
	
    if (seccion=='BENRIESGO') {
        if (op=='ANADIR' &&      (objUtiles.estaVacio(ORIGEN) )) {
        	//objUtiles.abrirModal("axisper001","src","modal_axisper001.do?operation=init&faceptar=f_aceptar_axisper001"+seccion); //f_aceptar_axisper001BENRIESGO
			objUtiles.abrirModal("axisper001","src","modal_axisper001.do?operation=init&faceptar=f_aceptar_axisper001"+seccion+"&ORIGEN="+"AXISCTR006&SPERSON=");
        }else{
         if   (op=='ANADIR' && !objUtiles.estaVacio(ORIGEN) ) {
            f_abrir_axisctr101();
         }
        }
        if (op=='MODIFICAR' && objUtiles.estaVacio(ORIGEN) ) {
        
            var url="modal_axisctr177.do?operation=init&NRIESGO="+document.${pantalla}Form.NRIESGO_BENEIDENT.value+"&NORDEN="+dato1;
        	objUtiles.abrirModal("axisctr177","src",url);
        }else{
             if   (op=='MODIFICAR' && !objUtiles.estaVacio(ORIGEN) ){
                var url="modal_axisctr177.do?operation=init&NRIESGO="+document.${pantalla}Form.NRIESGO_BENEIDENT.value+"&NORDEN="+dato1;
        	objUtiles.abrirModal("axisctr177","src",url);
             }
        
        }
        if (op=='ELIMINAR') {
            document.${pantalla}Form.opBENEIDENT.value="ELIMINAR_BENRIESGO";
            document.${pantalla}Form.NORDEN_BENEIDENT.value=dato1;
            document.${pantalla}Form.SPERSON_BENEIDENT.value=dato2;
            objUtiles.ejecutarFormulario("axis_${pantalla}.do", "form", document.${pantalla}Form, "_self", objJsMessages.jslit_cargando);
        }
    }
    if (seccion=='GAR_BENEF') {
        if (op=='ANADIR') {
        	 var url="modal_axisctr178.do?operation=init&NRIESGO="+document.${pantalla}Form.NRIESGO_BENEIDENT.value+"&NORDEN="+dato1+"&SPERSON=";
        	objUtiles.abrirModal("axisctr178","src",url,600,400);
        }
        if (op=='MODIFICAR') {
            var url="modal_axisctr178.do?operation=init&NRIESGO="+document.${pantalla}Form.NRIESGO_BENEIDENT.value+"&NORDEN="+dato1;
        	objUtiles.abrirModal("axisctr178","src",url);
        }
        if (op=='ELIMINAR') {
            document.${pantalla}Form.opBENEIDENT.value="ELIMINAR_GAR_BENEF";
            document.${pantalla}Form.CGARANT_BENEIDENT.value=dato1
            objUtiles.ejecutarFormulario("axis_${pantalla}.do", "form", document.${pantalla}Form, "_self", objJsMessages.jslit_cargando);
        }
    }
    if (seccion=='GAR_BENEF_AMPARO') {
        if (op=='ANADIR') {
                document.${pantalla}Form.CGARANT_BENEIDENT.value=dato1
        	objUtiles.abrirModal("axisper001","src","modal_axisper001.do?operation=init&faceptar=f_aceptar_axisper001GARBENEFAMPARO&ORIGEN=AXISCTR006&SPERSON="); //f_aceptar_axisper001GAR_BENEF_AMPARO
        }
        if (op=='MODIFICAR') {
        
            var url="modal_axisctr179.do?operation=init&NRIESGO="+document.${pantalla}Form.NRIESGO_BENEIDENT.value+"&NORDEN="+dato1+"&CGARANT="+dato2+"&TGARANT="+dato3;
        	objUtiles.abrirModal("axisctr179","src",url);
        }
        if (op=='ELIMINAR') {
            document.${pantalla}Form.opBENEIDENT.value="ELIMINAR_GAR_BENEF_AMPARO";
             document.${pantalla}Form.NORDEN_BENEIDENT.value=dato1
            document.${pantalla}Form.CGARANT_BENEIDENT.value=dato2
            document.${pantalla}Form.SPERSON_BENEIDENT.value=dato3;
            objUtiles.ejecutarFormulario("axis_${pantalla}.do", "form", document.${pantalla}Form, "_self", objJsMessages.jslit_cargando);
        }
    }
	}else {
		alert('<axis:alt f="axisctr006" c="MASBEN" lit="89908097"></axis:alt>');
	}
}


  
    function f_abrir_axisctr101(){
       objUtiles.abrirModal("axisctr101","src","modal_axisctr101.do?operation=init&TIPO_AXISCTR101=3&ORIGEN=AXISCTR006&TIPO=3&SPERSON=");
    }
     function f_cerrar_axisctr101 () {
                objUtiles.cerrarModal("axisctr101");
                //objUtiles.ejecutarFormulario("axis_axisctr100.do", "form", document.miForm, "_self");
    }    
    function f_aceptar_axisctr101 (nombre,nombre1,nombre2,ape1,ape2,ctipide,tidenti,csexper,fnacimi,fnif,sperson_anti,NORDEN) {
        document.${pantalla}Form.TNOMBRE.value=nombre;
        document.${pantalla}Form.TNOMBRE1.value=nombre1;
        document.${pantalla}Form.TNOMBRE2.value=nombre2;
        document.${pantalla}Form.TAPELLI1.value=ape1;
        document.${pantalla}Form.TAPELLI2.value=ape2;
        document.${pantalla}Form.CTIPIDE.value=ctipide;
        document.${pantalla}Form.TIDENTI.value=tidenti;
        document.${pantalla}Form.CSEXPER.value=csexper;
        document.${pantalla}Form.FNACIMI.value=fnacimi;
        document.${pantalla}Form.NNUMNIF.value=fnif;                
        document.${pantalla}Form.NORDEN.value=NORDEN;      
        objUtiles.cerrarModal("axisctr101");
      //  objUtiles.ejecutarFormulario("axis_axisctr100.do?TIPO="+TIPO_AXISCTR101, "guardar_riesgo", document.miForm, "_self");
      
    document.${pantalla}Form.opBENEIDENT.value="ANADIR_BENRIESGO";
    document.${pantalla}Form.SPERSON_BENEIDENT.value=sperson_anti;
     objUtiles.ejecutarFormulario("axis_${pantalla}.do?SIMUL=1", "form", document.${pantalla}Form, "_self", objJsMessages.jslit_cargando);
     
    }
    
    function callbackAjaxAvisos (ajaxResponseText) {
        try{
            //alert(ajaxResponseText);
            var doc = objAjax.domParse(ajaxResponseText);
            
            if(!objAppMensajes.existenErroresEnAplicacion(doc)) {
               
               if(objUtiles.hayValorElementoXml(doc.getElementsByTagName("TMENSAJE")[0])){
                    alert(objDom.getValorNodoDelComponente(doc.getElementsByTagName("TMENSAJE"),0, 0) );
                    
               }
               else{
                    document.${pantalla}Form.buscaravisos.value = 'NO';
                    f_abrir_axisper001_asegurados(); 
                }
                
            }
        } catch (e) {
            if (isDebugAjaxEnabled == "true")
                alert (e.name + " " + e.message);
        }
    }
    
</script>


<axis:ocultar f="axisctr006" c="DSP_BENEIDENT">
                <axis:ocultar f="axisctr006" c="DSP_BENRIESGO">
                <table class="seccion">
                    <tr>
                    <td>
	                    <table class="area" align="center">
		                    <tr>
		                        <td align="left">
		                            <div class="titulo" style="margin-left:10px;font-size: 11px;"><img src="images/flecha.gif"/><axis:alt f="axisctr006" c="TIT_DSP_BENEIDENT" lit="9902578"/>    </div>
                                    <axis:visible f="axisctr006" c="BT_NUEVO_BENEF">
                                    	<div style="float:right;"><img onclick="javascript:f_benef_ident('BENRIESGO','ANADIR')" border="0" alt="<axis:alt f="axisctr006" c="NUEVO_BENE" lit="1000428"/>" title="<axis:alt f="axisctr006" c="NUEVO_BENE" lit="1000428"/>" src="images/agenda.gif"/></div>
                                    </axis:visible>
                                        </td>
		                    </tr>
		                    <tr>
		                        <td>
		                            <!-- DisplayTag beneficiarios identificados a nivel de riesgo -->
		                            <c:set var="title0"><axis:alt f="axisctr006" c="TIPODOC" lit="109774"/></c:set><%--tip doc--%>
		                            <c:set var="title1"><axis:alt f="axisctr006" c="DOCUMENTO" lit="105330"/></c:set><%--documento--%>
		                            <c:set var="title2"><axis:alt f="axisctr006" c="NOMBRE" lit="105940"/></c:set><%--nombre--%>
		                            <c:set var="title3"><axis:alt f="axisctr006" c="CTIPBEN" lit="9901522"/></c:set><%--tipo ben--%>
		                            <c:set var="title4"><axis:alt f="axisctr006" c="CPAREN" lit="9902580"/></c:set><%--parent--%>
		                            <c:set var="title5"><axis:alt f="axisctr006" c="PORBENF" lit="9902581"/></c:set><%--porbenf--%>
		                            <c:set var="title6"><axis:alt f="axisctr006" c="CONTIGENTE" lit="9902583"/></c:set><%--continentede--%>
                                            <c:set var="title7"><axis:alt f="axisctr006" c="CESTADO" lit="9000793"/></c:set><%--testado--%>
                                            <c:set var="title8"><axis:alt f="axisctr006" c="CTTIPOCON" lit="9908388"/></c:set><%--contingency type--%>
						
                                    <c:set var="axisctr006_lista_beneficiarios_identificados_nivel_rieso" value="${__formdata.OB_IAX_RIESGOS.BENEFICIARIO.BENEFESP.BENEF_RIESGO}" />
		                            <div class="separador">&nbsp;</div>
		                            <div class="displayspaceGrande">
                                            
		                                <display:table name="${axisctr006_lista_beneficiarios_identificados_nivel_rieso}" id="miL01" export="false" class="dsptgtable" pagesize="-1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0" requestURI="axis_${pantalla}.do?paginar=true">
		                                    <%@ include file="../include/displaytag.jsp"%>
		                                    <display:column title="${title0}" sortable="true" sortProperty="OB_IAX_BENEIDENTIFICADOS.TTIPIDE" headerClass="sortable" style="width:10%;"  media="html" autolink="false" >
		                                        <div class="dspText">${miL01.OB_IAX_BENEIDENTIFICADOS.TTIPIDE}</div>
		                                    </display:column>
		                                    <display:column title="${title1}" sortable="true" sortProperty="OB_IAX_BENEIDENTIFICADOS.NNUMIDE" headerClass="sortable" style="width:10%;"  media="html" autolink="false" >
		                                        <div class="dspText">${miL01.OB_IAX_BENEIDENTIFICADOS.NNUMIDE}</div>
		                                    </display:column>
		                                    <display:column title="${title2}" sortable="true" sortProperty="OB_IAX_BENEIDENTIFICADOS.NOMBRE_BEN" headerClass="sortable" style="width:20%;"  media="html" autolink="false" >
		                                        <div class="dspText">${miL01.OB_IAX_BENEIDENTIFICADOS.NOMBRE_BEN}</div>
		                                    </display:column>
											<axis:visible f="axisctr006" c="TTIPBEN">
		                                    <display:column title="${title3}" sortable="true" sortProperty="OB_IAX_BENEIDENTIFICADOS.TTIPBEN" headerClass="sortable"  style="width:10%;" media="html" autolink="false" >
		                                        <div class="dspText">${miL01.OB_IAX_BENEIDENTIFICADOS.TTIPBEN}</div>
		                                    </display:column>
                                            </axis:visible> 
                                            <axis:visible f="axisctr006" c="CPAREN">
		                                      <display:column title="${title4}" sortable="true" sortProperty="OB_IAX_BENEIDENTIFICADOS.TPAREN" headerClass="sortable" style="width:10%;"  media="html" autolink="false" >
		                                        <div class="dspText">${miL01.OB_IAX_BENEIDENTIFICADOS.TPAREN}</div>
		                                      </display:column>
                                            </axis:visible> 
                                            <axis:visible f="axisctr006" c="PORBENF">
		                                      <display:column title="${title5}" sortable="true" sortProperty="OB_IAX_BENEIDENTIFICADOS.PPARTICIP" headerClass="sortable"  style="width:10%;" media="html" autolink="false" >
		                                        <div class="dspText">${miL01.OB_IAX_BENEIDENTIFICADOS.PPARTICIP}</div>
		                                      </display:column>
                                            </axis:visible> 
                                             <axis:visible f="axisctr006" c="CESTADO">
                                                 <display:column title="${title7}" sortable="true" sortProperty="OB_IAX_BENEIDENTIFICADOS.TESTADO" headerClass="sortable"  style="width:10%;" media="html" autolink="false" >
                                                    <div class="dspText">${miL01.OB_IAX_BENEIDENTIFICADOS.TESTADO}</div>
                                                </display:column>
                                            </axis:visible> 
											<axis:visible f="axisctr006" c="NOMBRE_TIT">
		                                    <display:column  title="${title6}" sortable="true" sortProperty="SCLABEN" headerClass="sortable" style="width:15%;"  media="html" autolink="false" >
		                                        <div class="dspText">${miL01.OB_IAX_BENEIDENTIFICADOS.NOMBRE_TIT}</div>
		                                    </display:column>
											</axis:visible>
									
                                            <axis:visible f="axisctr006" c="CTTIPOCON">                            		
                                                <display:column  title="${title8}" sortable="true" sortProperty="TTIPOCON" 
                                                                                   headerClass="sortable" style="width:12%;"  media="html" autolink="false" >
                                                        <div class="dspText">${miL01.OB_IAX_BENEIDENTIFICADOS.TTIPOCON}</div>
                                                </display:column>      
                                            </axis:visible>
									
                                            <display:column title="" sortable="false" headerClass="sortable" style="width:5%;"  media="html" autolink="false" >                                    
                                                <div style="float:left;"> 
                                                    <!-- BJHB INICIO IAXIS-16577 04/04/2022 -->
                                                    <c:if test="${(empty miL01.OB_IAX_BENEIDENTIFICADOS.CHEREDADO || miL01.OB_IAX_BENEIDENTIFICADOS.CHEREDADO == 0) || __formdata.ISPROPERTY == 1}">
                                                    <!-- BJHB FIN IAXIS-16577 04/04/2022 -->

                                                    <axis:visible f="axisctr006" c="BT_MODIF_BENEF">
                                                    	<img border="0" onclick="javascript:f_benef_ident('BENRIESGO','MODIFICAR','${miL01.OB_IAX_BENEIDENTIFICADOS.NORDEN}')" alt="<axis:alt f="axisctr006" c="ALT_IMG_BENRIESGO_MODIFICAR" lit="9000552"/>" title="<axis:alt f="axisctr006" c="ALT_IMG_BENRIESGO_MODIFICAR" lit="9000552"/>" src="images/lapiz.gif"/>                                                                         
                                                    </axis:visible>
                                                    <axis:visible f="axisctr006" c="BT_DELETE_BENEF">
                                                    	<img border="0" onclick="javascript:f_benef_ident('BENRIESGO','ELIMINAR','${miL01.OB_IAX_BENEIDENTIFICADOS.NORDEN}','${miL01.OB_IAX_BENEIDENTIFICADOS.SPERSON}')" alt="<axis:alt f="axisctr006" c="ALT_IMG_BENRIESGO_ELIMINAR" lit="9001333"/>" title="<axis:alt f="axisctr006" c="ALT_IMG_BENRIESGO_ELIMINAR" lit="9001333"/>" src="images/delete.gif"/>
                                                    </axis:visible>
                                                    </c:if>
                                                </div>     
                                            </display:column>
		                                </display:table>
		                            </div>
		                            <div class="separador">&nbsp;</div>
		                        </td>
		                    </tr>
	                    </table>
                    </td>
                    </tr>
                </table>
              </axis:ocultar>




                <axis:ocultar f="axisctr006" c="DSP_GAR_BENEF">
                <table class="seccion">
                    <tr>
                    <td>
	                    <table class="area" align="center">
		                    <tr>
		                        <td align="left">
		                            <div class="titulo" style="margin-left:10px;font-size: 11px;"><img src="images/flecha.gif"/><axis:alt f="axisctr006" c="TIT_BENGAR" lit="9902585"/></div>
                                    <axis:visible f="axisctr006" c="BT_NUEVO_BENEF">
                                    	<div style="float:right;"><img onclick="javascript:f_benef_ident('GAR_BENEF','ANADIR')" border="0" alt="<axis:alt f="axisctr006" c="NUEVO_BENGAR" lit="1000428"/>" title="<axis:alt f="axisctr006" c="NUEVO_BENGAR" lit="1000428"/>" src="images/agenda.gif"/></div>
		                        	</axis:visible>	
		                        </td>
		                    </tr>
                                    
                                    <c:if test="${!empty __formdata.OB_IAX_RIESGOS.BENEFICIARIO.BENEFESP.BENEFESP_GAR}">
                                   
                                    
                                    <c:forEach var="element"  items="${__formdata.OB_IAX_RIESGOS.BENEFICIARIO.BENEFESP.BENEFESP_GAR}"> 
		                    <tr>
                                    <td colspan="5">
                                     <table class="area" align="right">
                                        <tr>
		                        <td align="left">
		                            <div class="titulo" style="margin-left:10px;font-size: 11px;"><img src="images/flecha.gif"/><axis:alt f="axisctr006" c="TIT_BENGAR2" lit="9902498"/>
                                            <b style="color:black">${element.OB_IAX_BENESPECIALES_GAR.TGARANT}<b>
                                            </div>
                                    <div style="float:right;"><img onclick="javascript:f_benef_ident('GAR_BENEF_AMPARO','ANADIR','${element.OB_IAX_BENESPECIALES_GAR.CGARANT}')" border="0" alt="<axis:alt f="axisctr006" c="NUEVO_BENGAR" lit="1000428"/>" title="<axis:alt f="axisctr006" c="NUEVO_BENGAR" lit="1000428"/>" src="images/agenda.gif"/>
                                    <img onclick="javascript:f_benef_ident('GAR_BENEF','ELIMINAR','${element.OB_IAX_BENESPECIALES_GAR.CGARANT}')" border="0" alt="<axis:alt f="axisctr006" c="ALT_IMG_BENRIESGO_ELIMINAR" lit="9001333"/>" title="<axis:alt f="axisctr006" c="ALT_IMG_BENRIESGO_ELIMINAR" lit="9001333"/>" src="images/delete.gif"/>
                                    </div>
		                        </td>
		                    </tr>
                                    <tr>
		                        <td>
		                            <!-- DisplayTag beneficiarios identificados a nivel de garantia/amparo -->
		                           
		                            <c:set var="title0"><axis:alt f="axisctr006" c="TIPODOC" lit="109774"/></c:set><%--tip doc--%>
		                            <c:set var="title1"><axis:alt f="axisctr006" c="DOCUMENTO" lit="105330"/></c:set><%--documento--%>
		                            <c:set var="title2"><axis:alt f="axisctr006" c="NOMBRE" lit="105940"/></c:set><%--nombre--%>
		                            <c:set var="title3"><axis:alt f="axisctr006" c="CTIPBEN" lit="9901522"/></c:set><%--tipo ben--%>
		                            <c:set var="title4"><axis:alt f="axisctr006" c="CPAREN" lit="9902580"/></c:set><%--parent--%>
		                            <c:set var="title5"><axis:alt f="axisctr006" c="PORBENF" lit="9902581"/></c:set><%--porbenf--%>
		                            <c:set var="title6"><axis:alt f="axisctr006" c="CONTIGENTE" lit="9902583"/></c:set><%--continentede--%>
                                    
		                            <div class="separador">&nbsp;</div>
		                            <div class="displayspace">
                                          
                                                <display:table name="${element.OB_IAX_BENESPECIALES_GAR.BENEF_IDENT}" id="miL02" export="false" class="dsptgtable" pagesize="-1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0" requestURI="axis_${pantalla}.do?paginar=true">
		                                    <%@ include file="../include/displaytag.jsp"%>
		                                   <display:column title="${title0}" sortable="true" sortProperty="OB_IAX_BENEIDENTIFICADOS.TTIPIDE" headerClass="sortable" style="width:10%;"  media="html" autolink="false" >
		                                        <div class="dspText">${miL02.OB_IAX_BENEIDENTIFICADOS.TTIPIDE}</div>
		                                    </display:column>
		                                    <display:column title="${title1}" sortable="true" sortProperty="OB_IAX_BENEIDENTIFICADOS.NNUMIDE" headerClass="sortable" style="width:10%;"  media="html" autolink="false" >
		                                        <div class="dspText">${miL02.OB_IAX_BENEIDENTIFICADOS.NNUMIDE}</div>
		                                    </display:column>
		                                    <display:column title="${title2}" sortable="true" sortProperty="OB_IAX_BENEIDENTIFICADOS.NOMBRE_BEN" headerClass="sortable" style="width:20%;"  media="html" autolink="false" >
		                                        <div class="dspText">${miL02.OB_IAX_BENEIDENTIFICADOS.NOMBRE_BEN}</div>
		                                    </display:column>
		                                    <axis:visible f="axisctr006" c="CTIPBEN_GAR">
		                                    <display:column title="${title3}" sortable="true" sortProperty="OB_IAX_BENEIDENTIFICADOS.TTIPBEN" headerClass="sortable"  style="width:10%;" media="html" autolink="false" >
		                                        <div class="dspText">${miL02.OB_IAX_BENEIDENTIFICADOS.TTIPBEN}</div>
		                                    </display:column>
		                                  </axis:visible>		                                  
		                                  <axis:visible f="axisctr006" c="CPAREN_GAR">
		                                    <display:column title="${title4}" sortable="true" sortProperty="OB_IAX_BENEIDENTIFICADOS.TPAREN" headerClass="sortable" style="width:10%;"  media="html" autolink="false" >
		                                        <div class="dspText">${miL02.OB_IAX_BENEIDENTIFICADOS.TPAREN}</div>
		                                    </display:column>
		                                  </axis:visible>		                  
		                                  <axis:visible f="axisctr006" c="PPARTICIP_GAR">                  
		                                    <display:column title="${title5}" sortable="true" sortProperty="OB_IAX_BENEIDENTIFICADOS.PPARTICIP" headerClass="sortable"  style="width:10%;" media="html" autolink="false" >
		                                        <div class="dspText">${miL02.OB_IAX_BENEIDENTIFICADOS.PPARTICIP}</div>
		                                    </display:column>
		                                    </axis:visible>		                  
                                            <!-- Aqui -->																				
                                        <axis:visible f="axisctr006" c="CONTIGENTE_GAR">                  
		                                    <display:column title="${title6}" sortable="true" sortProperty="SCLABEN" headerClass="sortable" style="width:15%;"  media="html" autolink="false" >
		                                        <div class="dspText">${miL02.OB_IAX_BENEIDENTIFICADOS.NOMBRE_TIT}</div>
		                                    </display:column>
		                                    </axis:visible>		                  
                                                    <display:column title="" sortable="false" headerClass="sortable"   style="width:4%;" media="html" autolink="false" >                                    
                                                <div style="float:left;"> 
                                                    <div style="float:left;"> 
                                                    <c:if test="${empty miL02.OB_IAX_BENEIDENTIFICADOS.CHEREDADO || miL02.OB_IAX_BENEIDENTIFICADOS.CHEREDADO == 0}">
                                                    <axis:visible f="axisctr006" c="BT_MODIF_BENEF">
                                                    	<img border="0" onclick="javascript:f_benef_ident('GAR_BENEF_AMPARO','MODIFICAR','${miL02.OB_IAX_BENEIDENTIFICADOS.NORDEN}','${element.OB_IAX_BENESPECIALES_GAR.CGARANT}','${element.OB_IAX_BENESPECIALES_GAR.TGARANT}')" alt="<axis:alt f="axisctr006" c="ALT_IMG_BENRIESGO_MODIFICAR" lit="9000552"/>" title="<axis:alt f="axisctr006" c="ALT_IMG_BENRIESGO_MODIFICAR" lit="9000552"/>" src="images/lapiz.gif"/>                                                                         
                                                    </axis:visible>	
                                                    <axis:visible f="axisctr006" c="BT_DELETE_BENEF">
                                                    	<img border="0" onclick="javascript:f_benef_ident('GAR_BENEF_AMPARO','ELIMINAR','${miL02.OB_IAX_BENEIDENTIFICADOS.NORDEN}','${element.OB_IAX_BENESPECIALES_GAR.CGARANT}','${miL02.OB_IAX_BENEIDENTIFICADOS.SPERSON}')" alt="<axis:alt f="axisctr006" c="ALT_IMG_BENRIESGO_ELIMINAR" lit="9001333"/>" title="<axis:alt f="axisctr006" c="ALT_IMG_BENRIESGO_ELIMINAR" lit="9001333"/>" src="images/delete.gif"/>
                                                    </axis:visible>	
                                                    </c:if>
                                                </div>     
                                                </div>     
                                            </display:column>
		                                </display:table>
		                            </div>
		                            <div class="separador">&nbsp;</div>
		                        </td>
		                    </tr>
                                    </table>
                                    </td>
                                    </tr>
                                    </c:forEach>
                                    </c:if>
	                    </table>
                    </td>
                    </tr>
                </table>

              </axis:ocultar>

</axis:ocultar>
                