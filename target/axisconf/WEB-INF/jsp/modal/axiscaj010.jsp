<%/*
*  Fichero: axiscaj010.jsp
*
*  Fecha: 29/06/2009
*/
%>
<%@ page contentType="text/html;charset=windows-1252" errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="java.util.*" %>


<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<html>
  <head>
    <link rel="stylesheet" href="styles/genericosHtml.css" type="text/css">
    <link rel="stylesheet" href="styles/axisnt.css" type="text/css">
    <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>
    <link type="text/css" href="styles/jquery.jscrollpane.css" rel="stylesheet" media="only screen and (min-device-width: 768px) and (max-device-width: 1024px)" />
    <link rel="stylesheet" type="text/css" media="all" href="styles/calendar-green.css" title="green" />
    <script type="text/javascript" src="scripts/calendar.js"></script>    
    <script type="text/javascript" src="scripts/calendar-${sessionScope.__locale}.js"></script>
    <script type="text/javascript" src="scripts/calendar-setup.js"></script>           
    <style type="text/css" id="page-css"> </style>
    <c:import url="../include/carga_framework_js.jsp" />
    <script language="Javascript" type="text/javascript">
        
        function f_onload() {
        	f_cargar_propiedades_pantalla();
            var guardat = "${__formdata.guardat}";
            if ((!objUtiles.estaVacio(guardat))&&(guardat=="0")){
               parent.f_aceptar_modal("axiscaj010", "&SPERSON="+$("#SPERSON").val()+
                                                    "&IMPASIG="+$("#IMPASIG").val()+
                                                    "&FICHEROS="+$("#FICHEROS").val());
            }
        }  
        
        function f_but_cancelar() {
            parent.f_cerrar_modal('axiscaj010');                      
        }           
        
        function f_but_aceptar(){    
          f_but_9000479();
                  
          if ($("#IMPASIG").val()!=$("#IMPCAJA").val()) {
                alert("<axis:alt f="axiscaj010" c="AVISO" lit="9906289" />");
                return false;
          }
     
          if ($("#IMPASIGALP").val()!=$("#IMPCAJAALP").val()) {
                alert("<axis:alt f="axiscaj010" c="AVISO" lit="9905611" />");
                return false;
          }
                   
          if ($("#IMPASIGALI").val()!=$("#IMPCAJAALI").val()) {
                alert("<axis:alt f="axiscaj010" c="AVISO" lit="9905611" />");
                return false;
          }
      
          if ($("#IMPASIGALD").val()!=$("#IMPCAJAALD").val()) {
                alert("<axis:alt f="axiscaj010" c="AVISO" lit="9905611" />");
                return false;
          }
          
            $(".f_ficheros:checkbox:checked").each(function(){
                $("#FICHEROS").val($("#FICHEROS").val()+"-"+$(this).val()+"_"+(parseFloat($("#total-"+$(this).attr("id")).val())-parseFloat($("#imp-"+$(this).attr("id")).val()) )+"_"+$("#AUTOLIQUIDACIONI-"+$(this).attr("id")).val() +"_"+$("#sproduc-"+$(this).attr("id")).val()  +"_"+$("#cagente-"+$(this).attr("id")).val() +"_"+$("#AUTOLIQUIDACIONP-"+$(this).attr("id")).val()+"_"+$("#DIFERENCIAL-"+$(this).attr("id")).val());
            });           
            objUtiles.ejecutarFormulario("modal_axiscaj010.do", "guardar", document.miForm, "_self", objJsMessages.jslit_cargando); 
         
        }
        
        /* VALIDAR */
        function f_but_9000479(){
            var importes = null;
             var total = null;
            var autliqp = null;
            var autliqi = null;
            var difere = null;
            $(".f_ficheros:checkbox:checked").each(function(){
                    total+=parseFloat($("#total-"+$(this).attr("id")).val());
                    importes+=parseFloat($("#imp-"+$(this).attr("id")).val());
                    autliqp+= getNum(parseFloat(objNumero.stripNonNumeric($("#AUTOLIQUIDACIONP-"+$(this).attr("id")).val())));
                    autliqi+= getNum(parseFloat(objNumero.stripNonNumeric($("#AUTOLIQUIDACIONI-"+$(this).attr("id")).val())));
                    difere+= getNum(parseFloat(objNumero.stripNonNumeric($("#DIFERENCIAL-"+$(this).attr("id")).val())));
                });
               
                
            if (importes!=null){
                $("#IMPASIG").val(total-autliqp-autliqi-difere);              
                $("#IMPPEND").val(parseFloat($("#IMPCAJA").val()-(total-autliqp-autliqi-difere)));
            }else{
                $("#IMPASIG").val('');
                $("#IMPPEND").val('');
            }
            if (autliqp!=null){
                $("#IMPASIGALP").val(autliqp);
                $("#IMPPENDALP").val(parseFloat($("#IMPCAJAALP").val())-autliqp)
            }else{
                $("#IMPASIGALP").val('');
                $("#IMPPENDALP").val('');
            }
               if (autliqi!=null){
                $("#IMPASIGALI").val(autliqi);
                $("#IMPPENDALI").val(parseFloat($("#IMPCAJAALI").val())-autliqi)
            }else{
                $("#IMPASIGALI").val('');
                $("#IMPPENDALI").val('');
            }
             if (difere!=null){
                $("#IMPASIGALD").val(difere);
                $("#IMPPENDALD").val(parseFloat($("#IMPCAJAALD").val())-difere)
            }else{
                $("#IMPASIGALD").val('');
                $("#IMPPENDALD").val('');
            }
            
            
        }
        function getNum(val)
        {
    if (isNaN(val)) 
         return 0;
    else
     return val;
}
    </script>
    
  </head>
  <body onload="f_onload()">
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
    <form name="miForm" action="" method="POST">
        <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt f="axiscaj010" c="TITULO" lit="9905082" /></c:param>
                <c:param name="producto"><axis:alt c="form" f="axiscaj010" lit="9905082"/></c:param>
                <c:param name="nid" value="axiscaj010" />
        </c:import>
        <input type="hidden" name="operation" value=""/>  
        <input type="hidden" id="SPERSON"  name="SPERSON"  value="${__formdata.SPERSON}"/>
        <input type="hidden" id="FICHEROS" name="FICHEROS" value="${__formdata.FICHEROS}"/>
        <input type="hidden" id="CAGENTE_BUSCAR" name="CAGENTE_BUSCAR" value="${__formdata.CAGENTE_BUSCAR}"/>
        <input type="hidden" id="CLIQUIDOALI" name="CLIQUIDOALI" value="${__formdata.CLIQUIDO}"/>
        <input type="hidden" id="CLIQUIDOALP" name="CLIQUIDOALP" value="${__formdata.PCLIQUIDO}"/>
        <c:import url="../include/titulo_nt.jsp">
           <c:param name="formulario"><axis:alt c="formulario" f="axiscaj010" lit="9905082" /></c:param>
           <c:param name="form">axiscaj010</c:param>
        </c:import>             
        <div class="separador">&nbsp;</div>        
        <!-- Area de campos  -->
        <table class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0" style="height:10px;">
            <tr>
                <th style="width:25%;height:0px"></th>
                <th style="width:25%;height:0px"></th>
                <th style="width:25%;height:0px"></th>                                
                <th style="width:25%;height:0px"></th>
            </tr>        
            <tr>
                    <axis:ocultar f="axiscaj010" c="NNUMIDE" dejarHueco="false"> 
                        <td class="titulocaja">
                           <b><axis:alt f="axiscaj010" c="NNUMIDE" lit="9903661"/></b>
                        </td>
                    </axis:ocultar>
                    <axis:ocultar f="axiscaj010" c="TNOMBRE" dejarHueco="false"> 
                        <td class="titulocaja" colspan="2">
                           <b><axis:alt f="axiscaj010" c="TNOMBRE" lit="9902363"/></b>
                        </td>
                    </axis:ocultar>
             </tr>
             <tr>
                    <axis:ocultar f="axiscaj010" c="NNUMIDE" >
                        <td class="campocaja">
                            <input type="text" class="campodisabled campo campotexto" value="${__formdata.NNUMIDE}" name="NNUMIDE" id="NNUMIDE" 
                                   readonly="true" style="width:75%" size="15" />
                        </td>
                    </axis:ocultar>
                    <axis:ocultar f="axiscaj010" c="TNOMBRE" >
                        <td class="campocaja" colspan="2">
                            <input type="text" class="campodisabled campo campotexto" value="${__formdata.TNOMBRE}" name="TNOMBRE" id="TNOMBRE" 
                                   readonly="true" size="15" />
                        </td>
                    </axis:ocultar>
             </tr>
             <tr>
                <td colspan="4">
                    <div class="separador">&nbsp;</div>
                </td>
             </tr>
             <tr>
                <axis:ocultar f="axiscaj010" c="IMPCAJA" dejarHueco="false">                 
                    <td class="titulocaja">
                              <b><axis:alt f="axiscaj010" c="IMPCAJA" lit="9905083"/></b>
                    </td> 
                </axis:ocultar>
                <axis:ocultar f="axiscaj010" c="CMONOPE" dejarHueco="false">                 
                    <td class="titulocaja">
                              <b><axis:alt f="axiscaj010" c="CMONOPE" lit="108645"/></b>
                    </td> 
                </axis:ocultar>
                <axis:ocultar f="axiscaj010" c="IMPASIG" dejarHueco="false">                 
                    <td class="titulocaja">
                              <b><axis:alt f="axiscaj010" c="IMPASIG" lit="9905084"/></b>
                    </td> 
                </axis:ocultar>
                <axis:ocultar f="axiscaj010" c="IMPPEND" dejarHueco="false">                 
                    <td class="titulocaja">
                              <b><axis:alt f="axiscaj010" c="IMPPEND" lit="9905085"/></b>
                    </td> 
                </axis:ocultar>
            </tr> 
            <tr>
            <axis:ocultar f="axiscaj010" c="IMPCAJA" >
                <td class="campocaja">
                     <input type="text" class="campodisabled campo campotexto"
                     value="${__formdata.IMPCAJA}"  name="IMPCAJA" id="IMPCAJA" 
                           readonly="true" style="width:75%" size="15" />
                </td>
            </axis:ocultar>
            <axis:ocultar f="axiscaj010" c="CMONOPE" >
                <td class="campocaja">
                    <input type="text" class="campodisabled campo campotexto" value="${__formdata.CMONOPE}" name="CMONOPE" id="CMONOPE" 
                           readonly="true" style="width:75%" size="15" />
                </td>
            </axis:ocultar>
            <axis:ocultar f="axiscaj010" c="IMPASIG" >
                <td class="campocaja">
                    <input type="text" class="campodisabled campo campotexto" value="${__formdata.IMPASIG}" name="IMPASIG" id="IMPASIG" 
                           readonly="true" style="width:75%" size="15" />
                </td>
            </axis:ocultar>
            <axis:ocultar f="axiscaj010" c="IMPPEND" >
                <td class="campocaja">
                    <input type="text" class="campodisabled campo campotexto" value="${__formdata.IMPPEND}" name="IMPPEND" id="IMPPEND" 
                           readonly="true" style="width:75%" size="15" />
                </td>
            </axis:ocultar>
            </tr>
            
            <!--  autoliquidacion partner-->
            <tr>
            
                     <axis:ocultar f="axiscaj010" c="IMPCAJAALP" dejarHueco="false">   
                        <td class="titulocaja" id="tit_IMPCAJAALP">
                                  <b id="label_IMPCAJAALP"><axis:alt f="axiscaj010"  c="IMPCAJAALP" lit="9906372"/></b>
                        </td> 
                     </axis:ocultar >
                     <axis:ocultar f="axiscaj010" c="CMONOPEALP" dejarHueco="false">  
                    <td class="titulocaja" id="tit_CMONOPEALP">
                              <b id="label_CMONOPEALP"><axis:alt f="axiscaj010" c="CMONOPEALP" lit="108645"/></b>
                    </td> 
                    </axis:ocultar >
                     <axis:ocultar f="axiscaj010" c="IMPASIGALP" dejarHueco="false">       
                    <td class="titulocaja" id="tit_IMPASIGALP">
                              <b id="label_IMPASIGALP"><axis:alt f="axiscaj010" c="IMPASIGALP" lit="9906375"/></b>
                    </td> 
                    </axis:ocultar >
                    <axis:ocultar f="axiscaj010" c="IMPPENDALP" dejarHueco="false">         
                    <td class="titulocaja" id="tit_IMPPENDALP">
                              <b id="label_IMPPENDALP"><axis:alt f="axiscaj010" c="IMPPENDALP" lit="9906378"/></b>
                    </td> 
                    </axis:ocultar >
              
            </tr> 
           
            <tr>
           
            <axis:ocultar f="axiscaj010" c="IMPCAJAALP" dejarHueco="false">   
                <td class="campocaja" id="td_IMPCAJAALP">
                     <input type="text" class="campodisabled campo campotexto" value="${__formdata.IAUTOLIQP}" name="IMPCAJAALP" id="IMPCAJAALP" 
                           readonly="true" style="width:75%" size="15" />
                </td>
           
            </axis:ocultar>
              <axis:ocultar f="axiscaj010" c="CMONOPEALP" dejarHueco="false">   
                <td class="campocaja" id="td_CMONOPEALP">
                    <input type="text" class="campodisabled campo campotexto" value="${__formdata.CMONOPE}" name="CMONOPEALP" id="CMONOPEALP" 
                           readonly="true" style="width:75%" size="15" />
                </td>
           </axis:ocultar>
             <axis:ocultar f="axiscaj010" c="IMPASIGALP" dejarHueco="false">   
                <td class="campocaja" id="td_IMPASIGALP">
                    <input type="text" class="campodisabled campo campotexto" value="${__formdata.IMPASIGALP}" name="IMPASIGALP" id="IMPASIGALP" 
                           readonly="true" style="width:75%" size="15" />
                </td>
            </axis:ocultar>
              <axis:ocultar f="axiscaj010" c="IMPPENDALP" dejarHueco="false">   
                <td class="campocaja" id="td_IMPPENDALP">
                    <input type="text" class="campodisabled campo campotexto" value="${__formdata.IMPPENDALP}" name="IMPPENDALP" id="IMPPENDALP" 
                           readonly="true" style="width:75%" size="15" />
                </td>
          </axis:ocultar>
           
            </tr>
         
         <!--  autoliquidacion intermediario-->
         
          <tr>
            
                     <axis:ocultar f="axiscaj010" c="IMPCAJAALI" dejarHueco="false">   
                        <td class="titulocaja" id="tit_IMPCAJAALI">
                                  <b id="label_IMPCAJAALI"><axis:alt f="axiscaj010"  c="IMPCAJAALI" lit="9906373"/></b>
                        </td> 
                     </axis:ocultar >
                     <axis:ocultar f="axiscaj010" c="CMONOPEALI" dejarHueco="false">  
                    <td class="titulocaja" id="tit_CMONOPEALI">
                              <b id="label_CMONOPEALI"><axis:alt f="axiscaj010" c="CMONOPEALI" lit="108645"/></b>
                    </td> 
                    </axis:ocultar >
                     <axis:ocultar f="axiscaj010" c="IMPASIGALI" dejarHueco="false">       
                    <td class="titulocaja" id="tit_IMPASIGALI">
                              <b id="label_IMPASIGALI"><axis:alt f="axiscaj010" c="IMPASIGALI" lit="9906376"/></b>
                    </td> 
                    </axis:ocultar >
                    <axis:ocultar f="axiscaj010" c="IMPPENDALI" dejarHueco="false">         
                    <td class="titulocaja" id="tit_IMPPENDALI">
                              <b id="label_IMPPENDALI"><axis:alt f="axiscaj010" c="IMPPENDALI" lit="9906379"/></b>
                    </td> 
                    </axis:ocultar >
              
            </tr> 
           
            <tr>
           
            <axis:ocultar f="axiscaj010" c="IMPCAJAALI" dejarHueco="false">   
                <td class="campocaja" id="td_IMPCAJAALI">
                     <input type="text" class="campodisabled campo campotexto" value="${__formdata.IAUTOLIQI}" name="IMPCAJAALI" id="IMPCAJAALI" 
                           readonly="true" style="width:75%" size="15" />
                </td>
           
            </axis:ocultar>
              <axis:ocultar f="axiscaj010" c="CMONOPEALI" dejarHueco="false">   
                <td class="campocaja" id="td_CMONOPEALI">
                    <input type="text" class="campodisabled campo campotexto" value="${__formdata.CMONOPE}" name="CMONOPEALI" id="CMONOPEALI" 
                           readonly="true" style="width:75%" size="15" />
                </td>
           </axis:ocultar>
             <axis:ocultar f="axiscaj010" c="IMPASIGALI" dejarHueco="false">   
                <td class="campocaja" id="td_IMPASIGALI">
                    <input type="text" class="campodisabled campo campotexto" value="${__formdata.IMPASIGALI}" name="IMPASIGALI" id="IMPASIGALI" 
                           readonly="true" style="width:75%" size="15" />
                </td>
            </axis:ocultar>
              <axis:ocultar f="axiscaj010" c="IMPPENDALI" dejarHueco="false">   
                <td class="campocaja" id="td_IMPPENDALI">
                    <input type="text" class="campodisabled campo campotexto" value="${__formdata.IMPPENDALI}" name="IMPPENDALI" id="IMPPENDALI" 
                           readonly="true" style="width:75%" size="15" />
                </td>
          </axis:ocultar>
           
            </tr>
         
            <!--  diferencial-->
         
          <tr>
            
                     <axis:ocultar f="axiscaj010" c="IMPCAJAALD" dejarHueco="false">   
                        <td class="titulocaja" id="tit_IMPCAJAALD">
                                  <b id="label_IMPCAJAALD"><axis:alt f="axiscaj010"  c="IMPCAJAALD" lit="9002191"/></b>
                        </td> 
                     </axis:ocultar >
                     <axis:ocultar f="axiscaj010" c="CMONOPEALD" dejarHueco="false">  
                    <td class="titulocaja" id="tit_CMONOPEALD">
                              <b id="label_CMONOPEALD"><axis:alt f="axiscaj010" c="CMONOPEALD" lit="108645"/></b>
                    </td> 
                    </axis:ocultar >
                     <axis:ocultar f="axiscaj010" c="IMPASIGALD" dejarHueco="false">       
                    <td class="titulocaja" id="tit_IMPASIGALD">
                              <b id="label_IMPASIGALD"><axis:alt f="axiscaj010" c="IMPASIGALD" lit="9906377"/></b>
                    </td> 
                    </axis:ocultar >
                    <axis:ocultar f="axiscaj010" c="IMPPENDALD" dejarHueco="false">         
                    <td class="titulocaja" id="tit_IMPPENDALD">
                              <b id="label_IMPPENDALD"><axis:alt f="axiscaj010" c="IMPPENDALD" lit="9906380"/></b>
                    </td> 
                    </axis:ocultar >
              
            </tr> 
           
            <tr>
           
            <axis:ocultar f="axiscaj010" c="IMPCAJAALD" dejarHueco="false">   
                <td class="campocaja" id="td_IMPCAJAALD">
                     <input type="text" class="campodisabled campo campotexto" value="${__formdata.DIFERENCIAL}" name="IMPCAJAALD" id="IMPCAJAALD" 
                           readonly="true" style="width:75%" size="15" />
                </td>
           
            </axis:ocultar>
              <axis:ocultar f="axiscaj010" c="CMONOPEALD" dejarHueco="false">   
                <td class="campocaja" id="td_CMONOPEALD">
                    <input type="text" class="campodisabled campo campotexto" value="${__formdata.CMONOPE}" name="CMONOPEALD" id="CMONOPEALD" 
                           readonly="true" style="width:75%" size="15" />
                </td>
           </axis:ocultar>
             <axis:ocultar f="axiscaj010" c="IMPASIGALD" dejarHueco="false">   
                <td class="campocaja" id="td_IMPASIGALD">
                    <input type="text" class="campodisabled campo campotexto" value="${__formdata.IMPASIGALD}" name="IMPASIGALD" id="IMPASIGALD" 
                           readonly="true" style="width:75%" size="15" />
                </td>
            </axis:ocultar>
              <axis:ocultar f="axiscaj010" c="IMPPENDALD" dejarHueco="false">   
                <td class="campocaja" id="td_IMPPENDALD">
                    <input type="text" class="campodisabled campo campotexto" value="${__formdata.IMPPENDALD}" name="IMPPENDALD" id="IMPPENDALD" 
                           readonly="true" style="width:75%" size="15" />
                </td>
          </axis:ocultar>
           
            </tr>
         
         
            <tr>
                <td colspan="4">
                    <div class="separador">&nbsp;</div>
                </td>
             </tr>
            <tr>
                <td colspan="4">
                    <b style="font-size:11px"><axis:alt c="LIT_PREGUNTES" f="axiscaj010" lit="9906322"/></b>
                    <!-- DisplayTag ficheros -->
                    <c:set var="title0"><axis:alt f="axiscaj010" c="LIT_1000574" lit="1000574"/></c:set><!--Fichero-->
                    <c:set var="title1"><axis:alt f="axiscaj010" c="LIT_100562" lit="100562"/></c:set><!--Fecha-->
                    <c:set var="title2"><axis:alt f="axiscaj010" c="LIT_9906372" lit="9906372"/></c:set><!--Autoliquidación Partner-->
                    <c:set var="title3"><axis:alt f="axiscaj010" c="LIT_100563" lit="100563"/></c:set><!-- 9902656 Importe-->
                     <c:set var="title4"><axis:alt f="axiscaj010" c="LIT_9906287" lit="9906287"/></c:set><!-- 9906287 Importe cargado-->
                    <c:set var="title5"><axis:alt f="axiscaj010" c="LIT_9906288" lit="9906288"/></c:set><!-- 9906288 Importe fichero-->
                    <c:set var="title6"><axis:alt f="axiscaj010" c="LIT_9902656" lit="9902656"/></c:set><!-- 9905074 -->
                    <c:set var="title7"><axis:alt f="axiscaj010" c="LIT_9002191" lit="9002191"/></c:set><!-- diferencial -->
                     <c:set var="title8"><axis:alt f="axiscaj010" c="LIT_9906373" lit="9906373"/></c:set><!-- diferencial -->
                   
                    <div id="DSP_PREG" class="displayspaceOver" style="visibility:hidden;">&nbsp;</div>
                    <div id="Dt_PREG" class="displayspace" style="max-height:none"> 
                    <display:table name="${__formdata.LSTFICHEROS}" id="listFICHEROS" export="false" class="dsptgtable" 
                                   pagesize="-1"  sort="list" cellpadding="0" cellspacing="0"
                                   style="border:1px"  requestURI="axis_${pantalla}.do?paginar=true">
                        <%@ include file="../include/displaytag.jsp"%>
                        <axis:ocultar f="axiscaj010" c="CFICHERO" dejarHueco="false">
                            <display:column title="" sortable="false" sortProperty="" headerClass="headwidth5 sortable"  media="html" autolink="false" style="width:20px" >
                                <div class="dspIcons">
                                        <input type="checkbox" id="${listFICHEROS.SPROCES}-${listFICHEROS.CMONEOP}-${listFICHEROS.CAGENTE}-${listFICHEROS.SPRODUC}" name="f_ficheros"  
                                        <c:if test="${listFICHEROS.IIMPOPE == 0 }">disabled="disabled" </c:if> class="f_ficheros" value="${listFICHEROS.SPROCES}"/> 
                                </div>
                            </display:column>
                        </axis:ocultar>
                        <axis:ocultar f="axiscaj010" c="CFICHERO" dejarHueco="false">
                            <display:column title="${title0}" sortable="false" sortProperty="CFICHERO" headerClass="headwidth5 sortable"  media="html" autolink="false" >
                                <div class="dspText">
                                    <span>${listFICHEROS.TFICHERO}</span>
                                </div>
                            </display:column>
                        </axis:ocultar>
                        <axis:ocultar f="axiscaj010" c="FFECHA" dejarHueco="false">
                            <display:column title="${title1}" sortable="false" sortProperty="FFECHA" headerClass="headwidth5 sortable"  media="html" autolink="false" >
                                <div class="dspDate">
                                     <fmt:formatDate pattern="dd/MM/yyyy" value="${listFICHEROS.FCARGA}"/>   
                                </div>
                            </display:column>
                        </axis:ocultar>
                          <axis:ocultar f="axiscaj010" c="AUTOLIQP">
                            <display:column title="${title2}" sortProperty="CFICHERO" sortable="false" headerClass="headwidth5 sortable"  media="html" autolink="false" >
                                <div class="dspNumber">
                                      <input type="text"  class="campodisabled campo campotexto" id="AUTOLIQUIDACIONP-${listFICHEROS.SPROCES}-${listFICHEROS.CMONEOP}-${listFICHEROS.CAGENTE}-${listFICHEROS.SPRODUC}" name="AUTOLIQUIDACIONP-${listFICHEROS.SPROCES}-${listFICHEROS.CMONEOP}-${listFICHEROS.CAGENTE}-${listFICHEROS.SPRODUC}"  
                                        <c:if test="${listFICHEROS.IIMPOPE == 0 }">disabled="disabled" </c:if> class="AUTOLIQUIDACIONP" format="decimal" value="0" />  
                                </div>
                            </display:column>
                        </axis:ocultar>
                         <axis:ocultar f="axiscaj010" c="AUTOLIQI">
                            <display:column title="${title8}" sortProperty="CFICHERO" sortable="false" headerClass="headwidth5 sortable"  media="html" autolink="false" >
                                <div class="dspNumber">
                                      <input type="text"  class="campodisabled campo campotexto" id="AUTOLIQUIDACIONI-${listFICHEROS.SPROCES}-${listFICHEROS.CMONEOP}-${listFICHEROS.CAGENTE}-${listFICHEROS.SPRODUC}" name="AUTOLIQUIDACIONI-${listFICHEROS.SPROCES}-${listFICHEROS.CMONEOP}-${listFICHEROS.CAGENTE}-${listFICHEROS.SPRODUC}"  
                                        <c:if test="${listFICHEROS.IIMPOPE == 0 }">disabled="disabled" </c:if> class="AUTOLIQUIDACIONI" format="decimal" value="0" />  
                                </div>
                            </display:column>
                        </axis:ocultar>
                         <axis:ocultar f="axiscaj010" c="DIFERENCIAL">
                            <display:column title="${title7}" sortProperty="CFICHERO" sortable="false" headerClass="headwidth5 sortable"  media="html" autolink="false" >
                                <div class="dspNumber">
                                      <input type="text"  class="campodisabled campo campotexto" id="DIFERENCIAL-${listFICHEROS.SPROCES}-${listFICHEROS.CMONEOP}-${listFICHEROS.CAGENTE}-${listFICHEROS.SPRODUC}" name="DIFERENCIAL-${listFICHEROS.SPROCES}-${listFICHEROS.CMONEOP}-${listFICHEROS.CAGENTE}-${listFICHEROS.SPRODUC}"  
                                        <c:if test="${listFICHEROS.IIMPOPE == 0 || listFICHEROS.CDIVISA == __formdata.CMONOPE}">disabled="disabled" </c:if>  class="DIFERENCIAL" format="decimal" value="0"/>  
                                </div>
                            </display:column>
                        </axis:ocultar>
                        <axis:ocultar f="axiscaj010" c="IMPORTE" dejarHueco="false">
                            <display:column title="${title3}" sortable="false" sortProperty="IMPORTE" headerClass="headwidth5 sortable"  media="html" autolink="false" >
                                <div class="dspNumber" >
                                   <fmt:formatNumber pattern="${__formatNumberPatterns[__formdata.CMONOPE]}" value="${listFICHEROS.IIMPOPE}"/> 
                                  <input type="hidden" id="imp-${listFICHEROS.SPROCES}-${listFICHEROS.CMONEOP}-${listFICHEROS.CAGENTE}-${listFICHEROS.SPRODUC}" name="imp-${listFICHEROS.SPROCES}-${listFICHEROS.CMONEOP}-${listFICHEROS.CAGENTE}-${listFICHEROS.SPRODUC}"  
                                         class="imp-${listFICHEROS.SPROCES}-${listFICHEROS.CMONEOP}-${listFICHEROS.CAGENTE}-${listFICHEROS.SPRODUC}" value="${listFICHEROS.IIMPOPE}"/> 
                                
                                     <input type="hidden" id="sproduc-${listFICHEROS.SPROCES}-${listFICHEROS.CMONEOP}-${listFICHEROS.CAGENTE}-${listFICHEROS.SPRODUC}" name="sproduc-${listFICHEROS.SPROCES}-${listFICHEROS.CMONEOP}-${listFICHEROS.CAGENTE}-${listFICHEROS.SPRODUC}"  
                                        class="sproduc-${listFICHEROS.SPROCES}-${listFICHEROS.CMONEOP}-${listFICHEROS.CAGENTE}-${listFICHEROS.SPRODUC}" value="${listFICHEROS.SPRODUC}"/> 
                                
                                 <input type="hidden" id="cagente-${listFICHEROS.SPROCES}-${listFICHEROS.CMONEOP}-${listFICHEROS.CAGENTE}-${listFICHEROS.SPRODUC}" name="cagente-${listFICHEROS.SPROCES}-${listFICHEROS.CMONEOP}-${listFICHEROS.CAGENTE}-${listFICHEROS.SPRODUC}"  
                                        class="cagente-${listFICHEROS.SPROCES}-${listFICHEROS.CMONEOP}-${listFICHEROS.CAGENTE}-${listFICHEROS.SPRODUC}" value="${listFICHEROS.CAGENTE}"/> 
                            
                                </div>
                            </display:column>         
                        </axis:ocultar>
                        
                        
                        
                        
                        <axis:ocultar f="axiscaj010" c="IIMPPRO" dejarHueco="false">
                            <display:column title="${title4}" sortable="false" sortProperty="IIMPOPEORI" headerClass="headwidth5 sortable"  media="html" autolink="false" >
                                <div class="dspNumber" >
                                   <fmt:formatNumber pattern="${__formatNumberPatterns[listFICHEROS.CMONEDAINT]}" value="${listFICHEROS.IIMPOPEORI}"/> 
                                </div>
                            </display:column>
                        </axis:ocultar>
                          <axis:ocultar f="axiscaj010" c="IIMPTOT" dejarHueco="false">
                            <display:column title="${title5}" sortable="false" sortProperty="IIMPOPEORI" headerClass="headwidth5 sortable"  media="html" autolink="false" >
                                <div class="dspNumber" >
                                   <fmt:formatNumber pattern="${__formatNumberPatterns[listFICHEROS.CMONEDAINT]}" value="${listFICHEROS.IIMPTOT}"  /> 
                                     <input type="hidden" id="total-${listFICHEROS.SPROCES}-${listFICHEROS.CMONEOP}-${listFICHEROS.CAGENTE}-${listFICHEROS.SPRODUC}" name="total-${listFICHEROS.SPROCES}-${listFICHEROS.CMONEOP}-${listFICHEROS.CAGENTE}-${listFICHEROS.SPRODUC}"  
                                        class="total-${listFICHEROS.SPROCES}-${listFICHEROS.CMONEOP}-${listFICHEROS.CAGENTE}-${listFICHEROS.SPRODUC}" value="${listFICHEROS.IIMPTOT}"/> 
                                </div>
                            </display:column>
                            
                            
                            
                        </axis:ocultar>
                         <axis:ocultar f="axiscaj010" c="CMONEDAINT" dejarHueco="false">
                            <display:column title="${title6}" sortable="false" sortProperty="CMONEDAINT" headerClass="headwidth5 sortable"  media="html" autolink="false" >
                                <div class="dspText" >
                                   ${listFICHEROS.CMONEDAINT} 
                                </div>
                            </display:column>
                        </axis:ocultar>
                    </display:table>
                    </div>
                    <div class="separador">&nbsp;</div>
                </td>
            </tr>
        </table>	
        <c:import url="../include/botonera_nt.jsp"><c:param name="f">axiscaj010</c:param><c:param name="f">axiscaj010</c:param>
            <c:param name="__botones"><axis:ocultar f="axiscaj001" c = "BT_CANCELAR" dejarHueco="false">cancelar</axis:ocultar><axis:ocultar f="axiscaj001" c="BT_VALIDAR">,9000479</axis:ocultar><axis:ocultar f="axiscaj001" c="BT_ACEPTAR">,aceptar</axis:ocultar></c:param>
        </c:import>
    </form>
        
    <c:import url="../include/mensajes.jsp" />
   </body>
</html>
