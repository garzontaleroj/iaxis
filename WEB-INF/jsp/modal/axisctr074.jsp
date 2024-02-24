<%/*
*  Fichero: axisctr074.jsp
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
<%System.out.println("1");%>
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

     var toggles = new Array();
    
    
	 function toggleDisplay2 (ths, objeto, img_mes, img_menys) {
            var pimg_mes="images/mes.gif"
            var pimg_menys="images/menys.gif"
            
            if (img_mes!=undefined || img_mes!=null) pimg_mes=img_mes;
            if (img_menys!=undefined || img_menys!=null) pimg_menys=img_menys;
            
	   			  var thisChildrenId=ths+"_children";
            if (document.getElementById(thisChildrenId)!=null){
                var actualDisplayValue=document.getElementById(thisChildrenId).style.display;
            }
                
            var resto = document.getElementsByTagName("tr");
		
            for (i=0; i < resto.length; i++) {            
                if(resto[i].getAttribute("tipo")=='cont'){
                     resto[i].style.display="none";
                }
            }

            if (actualDisplayValue=="none"){ 
                  actualDisplayValue="";// en vez de "block", mejor "" para evitar FireFox bug
                  var imagen =	document.getElementById("img_"+ths);
                  
                  toggles[toggles.length]= ths;
                if ( !objUtiles.estaVacio(imagen)) imagen.src=pimg_menys;//"images/menys.gif";
                
            }else{ 
                actualDisplayValue="none";
                 var imagen =	document.getElementById("img_"+ths);
                   toggles[toggles.length]= ths;
                if ( !objUtiles.estaVacio(imagen)) imagen.src=pimg_mes;//"images/mes.gif";
            }
            if (document.getElementById(thisChildrenId)!=null){
                document.getElementById(thisChildrenId).style.display=actualDisplayValue;
            }
          }   
          
        
        function f_onload() {
        
        	 <c:if test="${ (fn:containsIgnoreCase(header['User-Agent'],'ipad') )   }">
						retocarPAGE_CSS('axisctr074');
					</c:if>
          
         
                
           f_cargar_propiedades_pantalla();
                      
        }
        
        function f_but_cancelar() {
            parent.f_cerrar_axisctr074();
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
        
              <%System.out.println("3");
        
              %>
                                                 
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt f="axisctr074" c="LIT_FORMULARIO" lit="1000113" /></c:param>
                <c:param name="producto">
                <!-- Bug 0027955/0152240 - JSV (17/09/2013) => ctipo=0 => FRANQUICIAS / ctipo=1 ==> BONUS MALUS -->
                <c:if test="${CTIPO==0}">
                    <axis:alt f="axisctr074" c="LIT_FORMULARIO" lit="9001800" />
                </c:if>    
                <c:if test="${CTIPO==1}">
                    <axis:alt f="axisctr074" c="LIT_FORMULARIO" lit="9001799" />
                </c:if>    
                </c:param>
                <c:param name="form">axisctr074</c:param>
            </c:import>
          
             <div class="separador">&nbsp;</div>    <div class="separador">&nbsp;</div>   
          <table class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                    	           <%System.out.println("4");%>   
                    <c:if test="${!empty __formdata.resultat || !empty __formdata.franqgarantias}">
                        <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axisctr074" c="IMG_TITULO_GO" lit="9904188"/>  <axis:visible c="CMONPROD" f="axisctr074"><c:if test="${!empty CMONPROD}"> - <b class="titulocaja" style="color:black"> <axis:alt f="axisctr074" c="CMONPROD" lit="108645"/> : <b> ${CMONPRODINT} - ${requestScope.TMONPROD}</b> </c:if> </axis:visible></div>
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
                                        <td colspan="2">
                                               <c:set var="title0"><axis:alt f="axisctr074" c="TGARANT" lit="100561"></axis:alt></c:set>
                                               <c:set var="title1"><axis:alt f="axisctr074" c="IIMPORT" lit="101159"></axis:alt></c:set>
                                               
                                                     <%System.out.println("5");%>                                
                                                           
                                                <display:table name="${__formdata.resultat}" id="resultat" style="width:100%" export="false" class="dsptgtable" pagesize="-1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                                                      requestURI="modal_axisctr074.do?paginar=true">
                                                         <%@ include file="../include/displaytag.jsp"%>
                                                         <axis:visible f="axisctr074" c="TGARANT">
                                                             <display:column title="${title0}" sortable="false"  style="width:70%" sortProperty="resultat.CGARANT" headerClass="headwidth10 sortable"  media="html" autolink="false" >
                                                                 <div class="dspText">${resultat.OB_IAX_GARANTIAS.CGARANT} - <c:choose> <c:when test="${!empty resultat.OB_IAX_GARANTIAS.DESCRIPCION}">${resultat.OB_IAX_GARANTIAS.DESCRIPCION} </c:when><c:when test="${!empty resultat.OB_IAX_GARANTIAS.TGARANT}">${resultat.OB_IAX_GARANTIAS.TGARANT}</c:when></c:choose> </div>
                                                             </display:column>
                                                         </axis:visible>
                                                         <axis:visible f="axisctr074" c="TNIVEL">
                                                             <display:column title="${title1}" sortable="false"  style="width:30%" sortProperty="franquicias.OB_IAX_BF_PROACTGRUP.GRUPO.TGRUP" headerClass="headwidth10 sortable"  media="html" autolink="false" >
                                                                 
                                                                  <div class="dspNumber">
                                                                  	
                                                                  	<c:choose>
                                                                  		<c:when test="${!empty resultat.OB_IAX_GARANTIAS.IFRANQ}">
                                                                  			<fmt:formatNumber pattern='###,##0.00' value='${resultat.OB_IAX_GARANTIAS.IFRANQ}'/>
                                                                  		</c:when>
	                                                                  	<c:otherwise>
	                                                                  			<fmt:formatNumber pattern='###,##0.00' value='${resultat.OB_IAX_GARANTIAS.IFRANQU}'/>
	                                                                	  </c:otherwise>
                                                                	</c:choose>
                                                                    
                                                                    
                                                                 </div>
                                                             </display:column>
                                                             
                                                             
                                                         </axis:visible>     
                                                         
                                                     </display:table>
                                                     </td>
                                                     </tr>
                                                     
                                                     
                                                     
                                                     <!-- Bug 0027955/0152240 - JSV (17/09/2013) => ctipo=0 => FRANQUICIAS / ctipo=1 ==> BONUS MALUS -->
                                                      <c:if test="${!empty __formdata.franqgarantias && CTIPO==0}">
                                                      
                                                      <tr>
                                                      <td colspan="4">
                                                      	
                                                                                       <c:set var="title3"><axis:alt f="axisctr013" c="IMPVALOR2" lit="101159"></axis:alt>2</c:set>
                                                                                            <c:set var="title00"><axis:alt f="axisctr074" c="TGARANT" lit="100561"></axis:alt></c:set>
                                                                                              <c:set var="title0"><axis:alt f="axisctr009" c="DESCRIPCION" lit="100588"></axis:alt></c:set>
                                                                                              <c:set var="title4"><axis:alt f="axisctr013" c="VALORMIN" lit="9904477"></axis:alt></c:set>
                                                                                              <c:set var="title5"><axis:alt f="axisctr013" c="VALORMAX" lit="9904478"></axis:alt></c:set>
                                                                                              <b class="titulocaja"><axis:alt f="axisctr013" c="FRAQNQLIBRES" lit="9904502"></axis:alt></b>
                                                                                          <div id="Dt_FRANQUICIAS" class="displayspace">
                                                                                          <display:table name="${__formdata.franqgarantias}" id="franquiciaslibres"  export="false" class="dsptgtable" pagesize="-1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                                                                                          requestURI="modal_axisctr013.do?paginar=true">
                                                                                             <%@ include file="../include/displaytag.jsp"%>
                                                                                             <axis:visible f="axisctr074" c="TGARANT">
                                                                                                 <display:column title="${title00}" sortable="false"  style="width:15%" sortProperty="resultat.CGARANT" headerClass="headwidth10 sortable"  media="html" autolink="false" >
                                                                                                     <div class="dspText">
                                                                                                     	  ${franquiciaslibres.OB_IAX_BF_PROACTGRUP.GARANTIAS[0].CGARANT} - ${franquiciaslibres.OB_IAX_BF_PROACTGRUP.GARANTIAS[0].TGARANT}
                                                                                                     </div>
                                                                                                 </display:column>
                                                                                             </axis:visible>
                                                                                             <axis:visible f="axisctr013" c="TGRUP">
                                                                                                 <display:column title="${title0}" sortable="false" style="width:15%" sortProperty="franquiciaslibres.OB_IAX_BF_PROACTGRUP.GRUPO.TGRUP" headerClass="sortable"  media="html" autolink="false" >
                                                                                                     <div class="dspText">${franquiciaslibres.OB_IAX_BF_PROACTGRUP.GRUPO.TGRUP}</div>
                                                                                                 </display:column>
                                                                                             </axis:visible>
                                                                                             <axis:visible f="axisctr013" c="CVALOR1">
                                                                                                 <display:column title="${title1}" sortable="false" style="width:15%" sortProperty="franquiciaslibres.OB_IAX_BF_PROACTGRUP.GRUPO.TGRUP" headerClass="sortable"  media="html" autolink="false" >
                                                                                                     <div class="dspText">
                                                                                                                    ${franquiciaslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.TVALOR1} -
                                                                                                                   <fmt:formatNumber pattern="###,##0.00" value="${franquiciaslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.IMPVALOR1}"/>
                                                                                                           
                                                                                                     </div>
                                                                                                 </display:column>
                                                                                                 </axis:visible>
                                                                                                  <axis:visible f="axisctr013" c="CVALOR2">
                                                                                                  <display:column title="${title3}" sortable="false"  style="width:15%" sortProperty="franquiciaslibres.OB_IAX_BF_PROACTGRUP.GRUPO.TGRUP" headerClass="sortable"  media="html" autolink="false" >
                                                                                                      <div class="dspText">
                                                                                                                <c:if test="${!empty franquiciaslibres.OB_IAX_BF_PROACTGRUP.LNIVELES[0].OB_IAX_BF_DETNIVEL.LISTACVALOR2}">
                                                                                                                        ${franquiciaslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.TVALOR2} -
                                                                                                                <fmt:formatNumber pattern="###,##0.00" value="${franquiciaslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.IMPVALOR2}"/>
                                                                                                            </c:if>
                                                                                                     </div>
                                                                                                 </display:column>
                                                                                                 </axis:visible>
                                                                                                 <axis:visible f="axisctr013" c="CIMPMIN">
                                                                                                  <display:column title="${title4}" sortable="false" style="width:15%" sortProperty="franquiciaslibres.OB_IAX_BF_PROACTGRUP.GRUPO.TGRUP" headerClass="sortable"  media="html" autolink="false" >
                                                                                                      <div class="dspText">
                                                                                                           <c:if test="${!empty franquiciaslibres.OB_IAX_BF_PROACTGRUP.LNIVELES[0].OB_IAX_BF_DETNIVEL.LISTACIMPMIN}">
                                                                                                                        ${franquiciaslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.TIMPMIN} - <fmt:formatNumber pattern="###,##0.00" value="${franquiciaslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.IMPMIN}"/>
                                                                                                            </c:if>
                                                                                                     </div>
                                                                                                 </display:column>
                                                                                                  </axis:visible>
                                                                                                 <axis:visible f="axisctr013" c="CIMPMAX">
                                                                                                  <display:column title="${title5}" sortable="false" style="width:15%" sortProperty="franquiciaslibres.OB_IAX_BF_PROACTGRUP.GRUPO.TGRUP" headerClass="sortable"  media="html" autolink="false" >
                                                                                                      <div class="dspText">
                                                                                                           <c:if test="${!empty franquiciaslibres.OB_IAX_BF_PROACTGRUP.LNIVELES[0].OB_IAX_BF_DETNIVEL.LISTACIMPMAX}">
                                                                                                                 ${franquiciaslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.TIMPMAX} - <fmt:formatNumber pattern="###,##0.00" value="${franquiciaslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.IMPMAX}"/>
                                                                                                                 
                                                                                                            </c:if>
                                                                                                     </div>
                                                                                                 </display:column>
                                                                                             </axis:visible>     
                                                                                         </display:table>
                                                                                         </div>   
                                                                                         </td>
                                                                                         </tr>
                                                                            </c:if>
                                                     
                                                     
                                    </table>
                                    </td>
                                    </tr>
                                    </table>
                                    </c:if>
                                    
                                    
                                    <axis:visible f="axisctr074" c="DSP_TOT_FRANQUICIAS">
                                    <!-- Bug 0027955/0152240 - JSV (17/09/2013) => ctipo=0 => FRANQUICIAS / ctipo=1 ==> BONUS MALUS -->
                                    	 <c:if test="${(!empty __formdata.franq || !empty  __formdata.franqtecnicas) && CTIPO==0}">
                                   
                                      <c:set var="title0"><axis:alt f="axisctr074" c="TGARANT" lit="100561"></axis:alt></c:set>
                                    <table class="seccion">
                                 <tr>
                                <th style="width:20%;height:0px"></th>
                                <th style="width:20%;height:0px"></th>
                                <th style="width:20%;height:0px"></th>
                                <th style="width:20%;height:0px"></th>  
                                <th style="width:20%;height:0px"></th> 
                            </tr>
                                    <!-- Campos -->
                                    <div class="separador">&nbsp;</div>        
                                        <tr>
                                            <td align="left" colspan="5">
                                                   <table class="area" >
                                                   <tr>
                                                            <th style="width:20%;height:0px"></th>
                                                            <th style="width:25%;height:0px"></th>
                                                            <th style="width:25%;height:0px"></th>
                                                            <th style="width:25%;height:0px"></th>
                                                        </tr>
                                                         <tr>
                                                            <td colspan="5">
                                                              <div class="separador">&nbsp;</div>
               
                                                                <div class="titulo"><img src="images/flecha.gif"/>
                                                                <axis:alt f="axisctr074" c="TIT_FRANQ" lit="9001800" />
                                                                </div>
                                                                <div class="separador">&nbsp;</div>
                                                                <table  class="area">
                                                                 <tr>
                                                                 <th style="width:2%;height:0px"></th>
                                                            <th style="width:20%;height:0px"></th>
                                                            <th style="width:25%;height:0px"></th>
                                                            <th style="width:25%;height:0px"></th>
                                                            <th style="width:25%;height:0px"></th>
                                                        </tr>
                                                           
                                                          <c:if test="${!empty __formdata.franq}">
                                                             <axis:visible f="axisctr074" c="DSP_FRANQUICIAS">
                                                             <c:forEach items="${__formdata.franq}" var="garafranq">
                                                             <tr>
                                                             <td></td>
                                                                 <td class="titulocaja" colspan="4">
                                                                 <c:choose>
                                                                   <c:when test="${garafranq.OB_IAX_BF_PROACTGRUP.GRUPO.LSUBGRUPOS[0].OB_IAX_BF_GRUPSUBGRUP.CTIPGRUPSUBGRUP == 3 || garafranq.OB_IAX_BF_PROACTGRUP.GRUPO.LSUBGRUPOS[0].OB_IAX_BF_GRUPSUBGRUP.CTIPGRUPSUBGRUP == 4}">
                                                                   <b>  ${garafranq.OB_IAX_BF_PROACTGRUP.GRUPO.TGRUP} 
                                                                   <c:if test="${!empty garafranq.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.CVALOR1}"><br>&nbsp;&nbsp; <axis:alt f="axisctr074" c="IIMPORT" lit="101159"></axis:alt> - ${garafranq.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.TVALOR1} : ${garafranq.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.IMPVALOR1} </c:if>
                                                                   <c:if test="${!empty garafranq.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.CVALOR2}"><br>&nbsp;&nbsp; <axis:alt f="axisctr074" c="IMPVALOR2" lit="101159"></axis:alt>2 - ${garafranq.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.TVALOR2} : ${garafranq.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.IMPVALOR2} </c:if>
                                                                   <c:if test="${!empty garafranq.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.CIMPMIN}"><br>&nbsp;&nbsp; <axis:alt f="axisctr074" c="VALORMIN" lit="9904477"></axis:alt> - ${garafranq.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.TIMPMIN} : ${garafranq.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.IMPMIN} </c:if>
                                                                   <c:if test="${!empty garafranq.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.CIMPMAX}"><br>&nbsp;&nbsp; <axis:alt f="axisctr074" c="VALORMAX" lit="9904478"></axis:alt> - ${garafranq.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.TIMPMAX} : ${garafranq.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.IMPMAX} </c:if></b>
                                                                   </c:when>
                                                                   <c:otherwise>
                                                                   <b>  ${garafranq.OB_IAX_BF_PROACTGRUP.GRUPO.TGRUP} - ${garafranq.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.TNIVEL}</b>
                                                                   </c:otherwise>
                                                                   </c:choose>
                                                                         <div class="separador">&nbsp;</div>
                                                                         <table>
                                                                           <tr>
                                                                           	         
                                                                                <th style="width:2%;height:0px"></th>
                                                                                <th style="width:20%;height:0px"></th>
                                                                                <th style="width:10%;height:0px"></th>
                                                                               <th style="width:25%;height:0px"></th>
                                                                               <th style="width:25%;height:0px"></th>
                                                                            </tr>
                                                                             <tr>
                                                                                 <td></td>
                                                                                 <td align="left" colspan="3">
                                                                                 
                                                                                    <div class="displayspace">   
                                                                                        <table class="seccion" cellpadding="0" cellspacing="0" align="right" style="width:99%" id="miListaIdGarantias">
                                                                                                  <thead>
                                                                                                        <tr>
                                                                                                            
                                                                                                        <axis:visible f="axisctr074" c="DESCRIPCION">
                                                                                                            <th style="width:100%;height:0px"></th>
                                                                                                        </axis:visible>
                                                                                                        
                                                                                                    </tr>
                                                                                                    <tr>   
                                                                                                            
                                                                                                        <axis:visible f="axisctr074" c="DESCRIPCION">
                                                                                                            <td class="sortable"><b>${title0}</b></td>
                                                                                                        </axis:visible>
                                                                                                       
                                                                                                    </tr>   
                                                                                                    </thead>
                                                                                                       <tbody >
                                                                                              
                                                                                                              
                                                                                                               <c:forEach items="${garafranq.OB_IAX_BF_PROACTGRUP.GARANTIAS}" var="miListaIdGarantias" varStatus="x"> 
                                                                                                             
                                                                                                                  <tr  tipo="ri" id="g_${miListaIdGarantias.CGARANT}" title="${miListaIdGarantias.CGARANT}-${miListaIdGarantias.TGARANT}"
                                                                                                                    <c:if test="${x.count mod 2 ==0}">                                                                      
                                                                                                                        class="gridEven"                                                        
                                                                                                                    </c:if>
                                                                                                                    <c:if test="${x.count mod 2 !=0}">                                                                      
                                                                                                                        class="gridNotEven"                                                        
                                                                                                                    </c:if>
                                                                                                                      >
                                                                                                             <axis:visible f="axisctr074" c="DESCRIPCION">
                                                                                                                        <td class="dspText" align="left" colspan="2">   
                                                                                                                               <div class="titulocaja">
                                                                                                                              <c:choose>
                                                                                                                                  <c:when test="${!empty miListaIdGarantias.T_IAX_HIJOS}">
                                                                                                                                    <img id="img_DSP_DATOS_${miListaIdGarantias.CGARANT}_${garafranq.OB_IAX_BF_PROACTGRUP.GRUPO.CGRUP}" src="images/mes.gif" 
                                                                                                                                    onclick="toggleDisplay2('DSP_DATOS_${miListaIdGarantias.CGARANT}_${garafranq.OB_IAX_BF_PROACTGRUP.GRUPO.CGRUP}', this)" style="cursor:pointer"/> 
                                                                                                                                  </c:when>
                                                                                                                                  <c:otherwise>
                                                                                                                                  
                                                                                                                                   <img src="images/blank.gif"/>
                                                                                                                                    </c:otherwise>
                                                                                                                                </c:choose>
                                                                                                                             
                                                                                                                        <%--/td>
                                                                                                                     
                                                                                                                     
                                                                                                                            <td class="dspText"--%>   
                                                                                                                                ${miListaIdGarantias.TGARANT}</div>
                                                                                                                            </td>
                                                                                                                      </axis:visible>
                                                                                                                                        </tr>
                                                                       <c:if test="${!empty miListaIdGarantias.T_IAX_HIJOS}">
                                                                      <tr id="DSP_DATOS_${miListaIdGarantias.CGARANT}_${garafranq.OB_IAX_BF_PROACTGRUP.GRUPO.CGRUP}_children" style="display:none" >
                                                                    <td colspan="10">
                                                                    
                                                                    <%--table class="area" align="right"  --%>
                                                                    <table class="area" cellpadding="0" cellspacing="0" align="right" style="width:99%">
                                                                                               <tbody id="garantias" align="right">
                                                                                                   <tr>
                                                                                                    
                                                                                                            <%--th style="width:15%;height:0px"></th--%>
                                                                                                          
                                                                                                        <axis:visible f="axisctr074" c="DESCRIPCION">
                                                                                                            <th style="width:95%;height:0px"></th>
                                                                                                        </axis:visible>
                                                                                                       
                                                                                                    </tr>
                                                                                                 <c:set var="tamanyo">${fn:length(miListaIdGarantias.T_IAX_HIJOS)}</c:set>
                                                                         <c:forEach items="${miListaIdGarantias.T_IAX_HIJOS}" var="miListaIdGarantiasHijos" varStatus="y"> 
                                                                            <tr tipo="ri" id="g_${miListaIdGarantiasHijos.CGARANT}" title="${miListaIdGarantiasHijos.CGARANT}-${miListaIdGarantiasHijos.TGARANT}"
                                                                                onmouseover="this.className = 'resaltar'" onmouseout="this.className = null"
                                                                              >
                                                                               <axis:visible f="axisctr074" c="DESCRIPCION">
                                                                              <td class="dspText">  
                                                                               <div class="titulocaja">
                                                                                    <c:set var="ultimo_nodo" value="0"/>
                                                                              <c:choose>
                                                                                  <c:when test="${!empty miListaIdGarantiasHijos.T_IAX_HIJOS}">
                                                                                
                                                                                  
                                                                                   <c:choose>
                                                                                     <c:when test="${tamanyo==(y.count)}">
                                                                                          <c:set var="imagen_mes">images/plusbottom.gif</c:set>
                                                                                          <c:set var="imagen_minus">images/minusbottom.gif</c:set>
                                                                                          <c:set var="ultimo_nodo" value="1"/>
                                                                                     </c:when>
                                                                                     <c:otherwise>
                                                                                         <c:set var="imagen_mes">images/plus.gif</c:set>
                                                                                         <c:set var="imagen_minus">images/minus.gif</c:set>
                                                                                     </c:otherwise>
                                                                                     </c:choose>
                                                                                 
                                                                                  <c:if test="${miListaIdGarantiasHijos.CNIVGAR== 2}">
                                                                                    <img src="images/blank.gif"/>
                                                                                  </c:if>
                                                                                  
                                                                                    <img id="img_DSP_DATOS_${miListaIdGarantiasHijos.CGARANT}_${garafranq.OB_IAX_BF_PROACTGRUP.GRUPO.CGRUP}" src="${imagen_mes}" 
                                                                                    onclick="toggleDisplay2('DSP_DATOS_${miListaIdGarantiasHijos.CGARANT}_${garafranq.OB_IAX_BF_PROACTGRUP.GRUPO.CGRUP}', this,'${imagen_mes}','${imagen_minus}')" style="cursor:pointer"/> 
                                                                                     
                                                                                  </c:when>
                                                                                  <c:otherwise>
                                                                                 
                                                                                  <c:if test="${miListaIdGarantiasHijos.CNIVGAR>2 && (empty ultimo_nodo || ultimo_nodo eq '0')}">
                                                                                  <%--c:if test="${miListaIdGarantiasHijos.CNIVGAR>2}"--%>
                                                                                    <img src="images/line.gif"/>
                                                                                  </c:if>
                                                                                  <c:if test="${miListaIdGarantiasHijos.CNIVGAR== 2}">
                                                                                  <%--c:if test="${miListaIdGarantiasHijos.CNIVGAR== 2}"--%>
                                                                                    <img src="images/blank.gif"/>
                                                                                  </c:if>
                                                                                   <c:if test="${(!empty ultimo_nodo && ultimo_nodo eq '1')}">
                                                                                    <img src="images/blank.gif"/><img src="images/blank.gif"/>
                                                                                  </c:if>
                                                                                     <c:choose>
                                                                                     <c:when test="${tamanyo==(y.count)}">
                                                                                      <img src="images/joinbottom.gif"/>
                                                                                     </c:when>
                                                                                     <c:otherwise>
                                                                                     <img src="images/join.gif"/>
                                                                                     </c:otherwise>
                                                                                     </c:choose>
                                                                                     
                                                                                </c:otherwise>
                                                                                </c:choose>
                                                                         
                                                                               
                                                                    <%--/td--%>
                                                                    
                                                                 
                                                                        <%--td class="dspText"--%>   
                                                                           ${miListaIdGarantiasHijos.TGARANT}
                                                                           
                                                                         
                                                                           </div>
                                                                        </td>
                                                                  </axis:visible>
                                                                  
                                                                            </tr>
                                                                            <c:if test="${!empty miListaIdGarantiasHijos.T_IAX_HIJOS}">
                                                                            	<tr id="DSP_DATOS_${miListaIdGarantiasHijos.CGARANT}_${garafranq.OB_IAX_BF_PROACTGRUP.GRUPO.CGRUP}_children" style="display:none" >
                                                                  				  <td colspan="10">
                                                                  				  	<table class="area" cellpadding="0" cellspacing="0" align="right" style="width:99%">
                                                                                               <tbody id="garantias" align="right">
                                                                                                   <tr>
                                                                                                    
                                                                                                            <%--th style="width:15%;height:0px"></th--%>
                                                                                                          
                                                                                                        <axis:visible f="axisctr074" c="DESCRIPCION">
                                                                                                            <th style="width:95%;height:0px"></th>
                                                                                                        </axis:visible>
                                                                                                       
                                                                                                    </tr>
                                                                             <c:set scope="session" var="hijos" value="${miListaIdGarantiasHijos.T_IAX_HIJOS}"/>
                                                                                 <c:set var="tamanyo">${fn:length(miListaIdGarantiasHijos.T_IAX_HIJOS)}</c:set>
                                                                         <c:forEach items="${miListaIdGarantiasHijos.T_IAX_HIJOS}" var="miListaIdGarantiasHijosHijos" varStatus="y"> 
                                                                            <tr tipo="ri" id="g_${miListaIdGarantiasHijosHijos.CGARANT}" title="${miListaIdGarantiasHijosHijos.CGARANT}-${miListaIdGarantiasHijosHijos.TGARANT}"
                                                                                onmouseover="this.className = 'resaltar'" onmouseout="this.className = null"
                                                                              >
                                                                               <axis:visible f="axisctr074" c="DESCRIPCION">
                                                                              <td class="dspText">  
                                                                               <div class="titulocaja">
                                                                                    <c:set var="ultimo_nodo" value="0"/>
                                                                              <c:choose>
                                                                                  <c:when test="${!empty miListaIdGarantiasHijosHijos.T_IAX_HIJOS}">
                                                                                
                                                                                  
                                                                                   <c:choose>
                                                                                     <c:when test="${tamanyo==(y.count)}">
                                                                                          <c:set var="imagen_mes">images/plusbottom.gif</c:set>
                                                                                          <c:set var="imagen_minus">images/minusbottom.gif</c:set>
                                                                                          <c:set var="ultimo_nodo" value="1"/>
                                                                                     </c:when>
                                                                                     <c:otherwise>
                                                                                         <c:set var="imagen_mes">images/plus.gif</c:set>
                                                                                         <c:set var="imagen_minus">images/minus.gif</c:set>
                                                                                     </c:otherwise>
                                                                                     </c:choose>
                                                                                 
                                                                                  <c:if test="${miListaIdGarantiasHijosHijos.CNIVGAR== 2}">
                                                                                    <img src="images/blank.gif"/>
                                                                                  </c:if>
                                                                                  
                                                                                    <img id="img_DSP_DATOS_${miListaIdGarantiasHijosHijos.CGARANT}_${garafranq.OB_IAX_BF_PROACTGRUP.GRUPO.CGRUP}" src="${imagen_mes}" 
                                                                                    onclick="toggleDisplay2('DSP_DATOS_${miListaIdGarantiasHijosHijos.CGARANT}_${garafranq.OB_IAX_BF_PROACTGRUP.GRUPO.CGRUP}', this,'${imagen_mes}','${imagen_minus}')" style="cursor:pointer"/> 
                                                                                     
                                                                                  </c:when>
                                                                                  <c:otherwise>
                                                                                 
                                                                                  <c:if test="${miListaIdGarantiasHijosHijos.CNIVGAR>2 && (empty ultimo_nodo || ultimo_nodo eq '0')}">
                                                                                  <%--c:if test="${miListaIdGarantiasHijosHijos.CNIVGAR>2}"--%>
                                                                                    <img src="images/line.gif"/>
                                                                                  </c:if>
                                                                                  <c:if test="${miListaIdGarantiasHijosHijos.CNIVGAR== 2}">
                                                                                  <%--c:if test="${miListaIdGarantiasHijosHijos.CNIVGAR== 2}"--%>
                                                                                    <img src="images/blank.gif"/>
                                                                                  </c:if>
                                                                                   <c:if test="${(!empty ultimo_nodo && ultimo_nodo eq '1')}">
                                                                                    <img src="images/blank.gif"/><img src="images/blank.gif"/>
                                                                                  </c:if>
                                                                                     <c:choose>
                                                                                     <c:when test="${tamanyo==(y.count)}">
                                                                                      <img src="images/joinbottom.gif"/>
                                                                                     </c:when>
                                                                                     <c:otherwise>
                                                                                     <img src="images/join.gif"/>
                                                                                     </c:otherwise>
                                                                                     </c:choose>
                                                                                     
                                                                                </c:otherwise>
                                                                                </c:choose>
                                                                         
                                                                               
                                                                    <%--/td--%>
                                                                    
                                                                 
                                                                        <%--td class="dspText"--%>   
                                                                           ${miListaIdGarantiasHijosHijos.TGARANT}</div>
                                                                        </td>
                                                                  </axis:visible>
                                                                  
                                                                            </tr>
                                                                           
                                                                    </c:forEach>
                                                                                
                                                                                
                                                                                
                                                                              </td>
                                                                            </tr>
                                                                          </table>
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                            </c:if>
                                                                    </c:forEach>
                                                                    </table>
                                                                    </td>
                                                                    </tr>
                                                                                       
                                                                                       
                                                                                       
                                                                                     
                                                                                </c:if>
                                                                            </c:forEach>
                                                                            </tbody>
                                                                            </table>
                                                                                        
                                                                                        
                                                                                        
                                                                                        
                                                                                    </div>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                           <%System.out.println("9");%>  
                                                                              <div class="separador">&nbsp;</div>
                                                                 </td>
                                                             </tr>
                                                      
                                                             </c:forEach>
                                                             </axis:visible>
                                                             </c:if>
                                                              <c:if test="${!empty __formdata.franqtecnicas}">
                                                               <axis:visible f="axisctr074" c="DSP_FRANQTECNICAS"> 
                                                               	    <%System.out.println("10");%>  
                                                             <tr>
                                                              <td></td>
                                                                 <td class="titulo" colspan="4">
                                                              <b><axis:alt c="LIT_FRANQTECNICAS" f="axisctr074" lit="9904198"/></b>
                                                             </td>
                                                             </tr>
                                                              <c:forEach items="${__formdata.franqtecnicas}" var="garafranq">
                                                             <%--c:if test="${!empty garafranq.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.CNIVEL}"--%>
                                                             <tr>
                                                             <td></td>
                                                                 <td class="titulocaja" colspan="4">
                                                                   <b>  ${garafranq.OB_IAX_BF_PROACTGRUP.GRUPO.TGRUP} - ${garafranq.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.TNIVEL}</b>
                                                             
                                                                         <div class="separador">&nbsp;</div>
                                                                         <table>
                                                                           <tr>
                                                                                <th style="width:2%;height:0px"></th>
                                                                                <th style="width:20%;height:0px"></th>
                                                                                <th style="width:10%;height:0px"></th>
                                                                               <th style="width:25%;height:0px"></th>
                                                                               <th style="width:25%;height:0px"></th>
                                                                            </tr>
                                                                             <tr>
                                                                                 <td></td>
                                                                                 <td align="left" colspan="3">
                                                                                    <div class="displayspace">   
                                                                                        <table class="seccion" cellpadding="0" cellspacing="0" align="right" style="width:99%" id="miListaIdGarantias">
                                                                                                  <thead>
                                                                                                        <tr>
                                                                                                            <%--th style="width:10%;height:0px"></th--%>
                                                                                                        <axis:visible f="axisctr074" c="DESCRIPCION">
                                                                                                            <th style="width:100%;height:0px"></th>
                                                                                                        </axis:visible>
                                                                                                        
                                                                                                    </tr>
                                                                                                    <tr>   
                                                                                                            <%--td class="sortable" align="center"></td--%>
                                                                                                        <axis:visible f="axisctr074" c="DESCRIPCION">
                                                                                                            <td class="sortable"><b>${title0}</b></td>
                                                                                                        </axis:visible>
                                                                                                       
                                                                                                    </tr>   
                                                                                                    </thead>
                                                                                                       <tbody >
                                                                                              
                                                                                                               
                                                                                                               <c:forEach items="${garafranq.OB_IAX_BF_PROACTGRUP.GARANTIAS}" var="miListaIdGarantias" varStatus="x"> 
                                                                                                             
                                                                                                                  <tr  tipo="ri" id="g_${miListaIdGarantias.CGARANT}" title="${miListaIdGarantias.CGARANT}-${miListaIdGarantias.TGARANT}"
                                                                                                                    <c:if test="${x.count mod 2 ==0}">                                                                      
                                                                                                                        class="gridEven"                                                        
                                                                                                                    </c:if>
                                                                                                                    <c:if test="${x.count mod 2 !=0}">                                                                      
                                                                                                                        class="gridNotEven"                                                        
                                                                                                                    </c:if>
                                                                                                                      >
                                                                                                             <axis:visible f="axisctr074" c="DESCRIPCION">
                                                                                                                        <td class="dspText" align="left" colspan="2">   
                                                                                                                               <div class="titulocaja">
                                                                                                                              <c:choose>
                                                                                                                                  <c:when test="${!empty miListaIdGarantias.T_IAX_HIJOS}">
                                                                                                                                    <img id="img_DSP_DATOS_${miListaIdGarantias.CGARANT}_${garafranq.OB_IAX_BF_PROACTGRUP.GRUPO.CGRUP}" src="images/mes.gif" 
                                                                                                                                    onclick="toggleDisplay2('DSP_DATOS_${miListaIdGarantias.CGARANT}_${garafranq.OB_IAX_BF_PROACTGRUP.GRUPO.CGRUP}', this)" style="cursor:pointer"/> 
                                                                                                                                  </c:when>
                                                                                                                                  <c:otherwise>
                                                                                                                                  
                                                                                                                                   <img src="images/blank.gif"/>
                                                                                                                                    </c:otherwise>
                                                                                                                                </c:choose>
                                                                                                                             
                                                                                                                        <%--/td>
                                                                                                                     
                                                                                                                     
                                                                                                                            <td class="dspText"--%>   
                                                                                                                                ${miListaIdGarantias.TGARANT}</div>
                                                                                                                            </td>
                                                                                                                      </axis:visible>
                                                                                                                                        </tr>
                                                                       <c:if test="${!empty miListaIdGarantias.T_IAX_HIJOS}">
                                                                      <tr id="DSP_DATOS_${miListaIdGarantias.CGARANT}_${garafranq.OB_IAX_BF_PROACTGRUP.GRUPO.CGRUP}_children" style="display:none" >
                                                                    <td colspan="10">
                                                                    
                                                                    <%--table class="area" align="right"  --%>
                                                                    <table class="area" cellpadding="0" cellspacing="0" align="right" style="width:99%">
                                                                                               <tbody id="garantias" align="right">
                                                                                                   <tr>
                                                                                                    
                                                                                                            <%--th style="width:15%;height:0px"></th--%>
                                                                                                          
                                                                                                        <axis:visible f="axisctr074" c="DESCRIPCION">
                                                                                                            <th style="width:95%;height:0px"></th>
                                                                                                        </axis:visible>
                                                                                                       
                                                                                                    </tr>
                                                                                                 <c:set var="tamanyo">${fn:length(miListaIdGarantias.T_IAX_HIJOS)}</c:set>
                                                                         <c:forEach items="${miListaIdGarantias.T_IAX_HIJOS}" var="miListaIdGarantiasHijos" varStatus="y"> 
                                                                            <tr tipo="ri" id="g_${miListaIdGarantiasHijos.CGARANT}" title="${miListaIdGarantiasHijos.CGARANT}-${miListaIdGarantiasHijos.TGARANT}"
                                                                                onmouseover="this.className = 'resaltar'" onmouseout="this.className = null"
                                                                              >
                                                                               <axis:visible f="axisctr074" c="DESCRIPCION">
                                                                              <td class="dspText">  
                                                                               <div class="titulocaja">
                                                                                    <c:set var="ultimo_nodo" value="0"/>
                                                                              <c:choose>
                                                                                  <c:when test="${!empty miListaIdGarantiasHijos.T_IAX_HIJOS}">
                                                                                
                                                                                  
                                                                                   <c:choose>
                                                                                     <c:when test="${tamanyo==(y.count)}">
                                                                                          <c:set var="imagen_mes">images/plusbottom.gif</c:set>
                                                                                          <c:set var="imagen_minus">images/minusbottom.gif</c:set>
                                                                                          <c:set var="ultimo_nodo" value="1"/>
                                                                                     </c:when>
                                                                                     <c:otherwise>
                                                                                         <c:set var="imagen_mes">images/plus.gif</c:set>
                                                                                         <c:set var="imagen_minus">images/minus.gif</c:set>
                                                                                     </c:otherwise>
                                                                                     </c:choose>
                                                                                 
                                                                                  <c:if test="${miListaIdGarantiasHijos.CNIVGAR== 2}">
                                                                                    <img src="images/blank.gif"/>
                                                                                  </c:if>
                                                                                  
                                                                                    <img id="img_DSP_DATOS_${miListaIdGarantiasHijos.CGARANT}_${garafranq.OB_IAX_BF_PROACTGRUP.GRUPO.CGRUP}" src="${imagen_mes}" 
                                                                                    onclick="toggleDisplay2('DSP_DATOS_${miListaIdGarantiasHijos.CGARANT}_${garafranq.OB_IAX_BF_PROACTGRUP.GRUPO.CGRUP}', this,'${imagen_mes}','${imagen_minus}')" style="cursor:pointer"/> 
                                                                                     
                                                                                  </c:when>
                                                                                  <c:otherwise>
                                                                                 
                                                                                  <c:if test="${miListaIdGarantiasHijos.CNIVGAR>2 && (empty ultimo_nodo || ultimo_nodo eq '0')}">
                                                                                  <%--c:if test="${miListaIdGarantiasHijos.CNIVGAR>2}"--%>
                                                                                    <img src="images/line.gif"/>
                                                                                  </c:if>
                                                                                  <c:if test="${miListaIdGarantiasHijos.CNIVGAR== 2}">
                                                                                  <%--c:if test="${miListaIdGarantiasHijos.CNIVGAR== 2}"--%>
                                                                                    <img src="images/blank.gif"/>
                                                                                  </c:if>
                                                                                   <c:if test="${(!empty ultimo_nodo && ultimo_nodo eq '1')}">
                                                                                    <img src="images/blank.gif"/><img src="images/blank.gif"/>
                                                                                  </c:if>
                                                                                     <c:choose>
                                                                                     <c:when test="${tamanyo==(y.count)}">
                                                                                      <img src="images/joinbottom.gif"/>
                                                                                     </c:when>
                                                                                     <c:otherwise>
                                                                                     <img src="images/join.gif"/>
                                                                                     </c:otherwise>
                                                                                     </c:choose>
                                                                                     
                                                                                </c:otherwise>
                                                                                </c:choose>
                                                                         
                                                                               
                                                                    <%--/td--%>
                                                                    
                                                                 
                                                                        <%--td class="dspText"--%>   
                                                                           ${miListaIdGarantiasHijos.TGARANT}
                                                                           
                                                                         
                                                                           </div>
                                                                        </td>
                                                                  </axis:visible>
                                                                  
                                                                            </tr>
                                                                            <c:if test="${!empty miListaIdGarantiasHijos.T_IAX_HIJOS}">
                                                                            	<tr id="DSP_DATOS_${miListaIdGarantiasHijos.CGARANT}_${garafranq.OB_IAX_BF_PROACTGRUP.GRUPO.CGRUP}_children" style="display:none" >
                                                                  				  <td colspan="10">
                                                                  				  	<table class="area" cellpadding="0" cellspacing="0" align="right" style="width:99%">
                                                                                               <tbody id="garantias" align="right">
                                                                                                   <tr>
                                                                                                    
                                                                                                            <%--th style="width:15%;height:0px"></th--%>
                                                                                                          
                                                                                                        <axis:visible f="axisctr074" c="DESCRIPCION">
                                                                                                            <th style="width:95%;height:0px"></th>
                                                                                                        </axis:visible>
                                                                                                       
                                                                                                    </tr>
                                                                             <c:set scope="session" var="hijos" value="${miListaIdGarantiasHijos.T_IAX_HIJOS}"/>
                                                                                 <c:set var="tamanyo">${fn:length(miListaIdGarantiasHijos.T_IAX_HIJOS)}</c:set>
                                                                         <c:forEach items="${miListaIdGarantiasHijos.T_IAX_HIJOS}" var="miListaIdGarantiasHijosHijos" varStatus="y"> 
                                                                            <tr tipo="ri" id="g_${miListaIdGarantiasHijosHijos.CGARANT}" title="${miListaIdGarantiasHijosHijos.CGARANT}-${miListaIdGarantiasHijosHijos.TGARANT}"
                                                                                onmouseover="this.className = 'resaltar'" onmouseout="this.className = null"
                                                                              >
                                                                               <axis:visible f="axisctr074" c="DESCRIPCION">
                                                                              <td class="dspText">  
                                                                               <div class="titulocaja">
                                                                                    <c:set var="ultimo_nodo" value="0"/>
                                                                              <c:choose>
                                                                                  <c:when test="${!empty miListaIdGarantiasHijosHijos.T_IAX_HIJOS}">
                                                                                
                                                                                  
                                                                                   <c:choose>
                                                                                     <c:when test="${tamanyo==(y.count)}">
                                                                                          <c:set var="imagen_mes">images/plusbottom.gif</c:set>
                                                                                          <c:set var="imagen_minus">images/minusbottom.gif</c:set>
                                                                                          <c:set var="ultimo_nodo" value="1"/>
                                                                                     </c:when>
                                                                                     <c:otherwise>
                                                                                         <c:set var="imagen_mes">images/plus.gif</c:set>
                                                                                         <c:set var="imagen_minus">images/minus.gif</c:set>
                                                                                     </c:otherwise>
                                                                                     </c:choose>
                                                                                 
                                                                                  <c:if test="${miListaIdGarantiasHijosHijos.CNIVGAR== 2}">
                                                                                    <img src="images/blank.gif"/>
                                                                                  </c:if>
                                                                                  
                                                                                    <img id="img_DSP_DATOS_${miListaIdGarantiasHijosHijos.CGARANT}_${garafranq.OB_IAX_BF_PROACTGRUP.GRUPO.CGRUP}" src="${imagen_mes}" 
                                                                                    onclick="toggleDisplay2('DSP_DATOS_${miListaIdGarantiasHijosHijos.CGARANT}_${garafranq.OB_IAX_BF_PROACTGRUP.GRUPO.CGRUP}', this,'${imagen_mes}','${imagen_minus}')" style="cursor:pointer"/> 
                                                                                     
                                                                                  </c:when>
                                                                                  <c:otherwise>
                                                                                 
                                                                                  <c:if test="${miListaIdGarantiasHijosHijos.CNIVGAR>2 && (empty ultimo_nodo || ultimo_nodo eq '0')}">
                                                                                  <%--c:if test="${miListaIdGarantiasHijosHijos.CNIVGAR>2}"--%>
                                                                                    <img src="images/line.gif"/>
                                                                                  </c:if>
                                                                                  <c:if test="${miListaIdGarantiasHijosHijos.CNIVGAR== 2}">
                                                                                  <%--c:if test="${miListaIdGarantiasHijosHijos.CNIVGAR== 2}"--%>
                                                                                    <img src="images/blank.gif"/>
                                                                                  </c:if>
                                                                                   <c:if test="${(!empty ultimo_nodo && ultimo_nodo eq '1')}">
                                                                                    <img src="images/blank.gif"/><img src="images/blank.gif"/>
                                                                                  </c:if>
                                                                                     <c:choose>
                                                                                     <c:when test="${tamanyo==(y.count)}">
                                                                                      <img src="images/joinbottom.gif"/>
                                                                                     </c:when>
                                                                                     <c:otherwise>
                                                                                     <img src="images/join.gif"/>
                                                                                     </c:otherwise>
                                                                                     </c:choose>
                                                                                     
                                                                                </c:otherwise>
                                                                                </c:choose>
                                                                         
                                                                               
                                                                    <%--/td--%>
                                                                    
                                                                 
                                                                        <%--td class="dspText"--%>   
                                                                           ${miListaIdGarantiasHijosHijos.TGARANT}</div>
                                                                        </td>
                                                                  </axis:visible>
                                                                  
                                                                            </tr>
                                                                           
                                                                    </c:forEach>
                                                                                
                                                                                
                                                                                
                                                                              </td>
                                                                            </tr>
                                                                          </table>
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                            </c:if>
                                                                    </c:forEach>
                                                                    </table>
                                                                    </td>
                                                                    </tr>
                                                                                       
                                                                                       
                                                                                       
                                                                                     
                                                                                </c:if>
                                                                            </c:forEach>
                                                                            </tbody>
                                                                            </table>
                                                                                    </div>
                                                                                    <%System.out.println("11");%>  
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                        
                                                                              <div class="separador">&nbsp;</div>
                                                                 </td>
                                                             </tr>
                                                             <%--/c:if--%>
                                                             </c:forEach>
                                                             </axis:visible>
                                                             </c:if>
                                                             
                                                             
                                                          
                                                             </table>
                                                             
                                                             
                                                             </td>
                                                        </tr>
                                                    </table>
                                            </td>
                                        </tr>
                                        
                                       
                                    </table>
                                  </c:if>
                                   
                                        <%--Bonus Malus%--%>
                                        <!-- Bug 0027955/0152240 - JSV (17/09/2013) => ctipo=0 => FRANQUICIAS / ctipo=1 ==> BONUS MALUS -->
                                         <c:if test="${!empty  __formdata.bonusmalus && CTIPO==1}">
                                   
                                      
                                    <table class="seccion">
                                 <tr>
                                <th style="width:20%;height:0px"></th>
                                <th style="width:20%;height:0px"></th>
                                <th style="width:20%;height:0px"></th>
                                <th style="width:20%;height:0px"></th>  
                                <th style="width:20%;height:0px"></th> 
                            </tr>
                                    <!-- Campos -->
                                    <div class="separador">&nbsp;</div>        
                                        <tr>
                                            <td align="left" colspan="5">
                                                   <table class="area" >
                                                   <tr>
                                                            <th style="width:20%;height:0px"></th>
                                                            <th style="width:25%;height:0px"></th>
                                                            <th style="width:25%;height:0px"></th>
                                                            <th style="width:25%;height:0px"></th>
                                                        </tr>
                                                         <tr>
                                                            <td colspan="5">
                                                              <div class="separador">&nbsp;</div>
               
                                                                <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axisctr074" c="TIT_BONUSMALUS" lit="9001799" /></div>
                                                                <div class="separador">&nbsp;</div>
                                                                <table  class="area">
                                                                 <tr>
                                                                 <th style="width:2%;height:0px"></th>
                                                            <th style="width:20%;height:0px"></th>
                                                            <th style="width:25%;height:0px"></th>
                                                            <th style="width:25%;height:0px"></th>
                                                            <th style="width:25%;height:0px"></th>
                                                        </tr>
                                                           
                                                          
                                                             
                                                             
                                                             <c:if test="${!empty __formdata.bonusmalus}">
                                                                  
                                                                 <axis:visible f="axisctr074" c="DSP_BONUSMALUS"> 
                                                                 
                                                            
                                                              <c:forEach items="${__formdata.bonusmalus}" var="garafranq">
                                                             <%--c:if test="${!empty garafranq.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.CNIVEL}"--%>
                                                             <tr>
                                                             <td></td>
                                                                 <td class="titulocaja" colspan="4">
                                                                   <b>  ${garafranq.OB_IAX_BF_PROACTGRUP.GRUPO.TGRUP} - ${garafranq.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.TNIVEL}</b>
                                                             
                                                                         <div class="separador">&nbsp;</div>
                                                                         <table>
                                                                           <tr>
                                                                                <th style="width:2%;height:0px"></th>
                                                                                <th style="width:20%;height:0px"></th>
                                                                                <th style="width:10%;height:0px"></th>
                                                                               <th style="width:25%;height:0px"></th>
                                                                               <th style="width:25%;height:0px"></th>
                                                                            </tr>
                                                                             <tr>
                                                                                 <td></td>
                                                                                 <td align="left" colspan="3">
                                                                                    <div class="displayspace">   
                                                                                         <table class="seccion" cellpadding="0" cellspacing="0" align="right" style="width:99%" id="miListaIdGarantias">
                                                                                                  <thead>
                                                                                                        <tr>
                                                                                                            <%--th style="width:10%;height:0px"></th--%>
                                                                                                        <axis:visible f="axisctr074" c="DESCRIPCION">
                                                                                                            <th style="width:100%;height:0px"></th>
                                                                                                        </axis:visible>
                                                                                                        
                                                                                                    </tr>
                                                                                                    <tr>   
                                                                                                            <%--td class="sortable" align="center"></td--%>
                                                                                                        <axis:visible f="axisctr074" c="DESCRIPCION">
                                                                                                            <td class="sortable"><b>${title0}</b></td>
                                                                                                        </axis:visible>
                                                                                                       
                                                                                                    </tr>   
                                                                                                    </thead>
                                                                                                       <tbody >
                                                                                              
                                                                                                               <c:forEach items="${garafranq.OB_IAX_BF_PROACTGRUP.GARANTIAS}" var="miListaIdGarantias" varStatus="x"> 
                                                                                                             
                                                                                                                  <tr  tipo="ri" id="g_${miListaIdGarantias.CGARANT}" title="${miListaIdGarantias.CGARANT}-${miListaIdGarantias.TGARANT}"
                                                                                                                    <c:if test="${x.count mod 2 ==0}">                                                                      
                                                                                                                        class="gridEven"                                                        
                                                                                                                    </c:if>
                                                                                                                    <c:if test="${x.count mod 2 !=0}">                                                                      
                                                                                                                        class="gridNotEven"                                                        
                                                                                                                    </c:if>
                                                                                                                      >
                                                                                                             <axis:visible f="axisctr074" c="DESCRIPCION">
                                                                                                                        <td class="dspText" align="left" colspan="2">   
                                                                                                                               <div class="titulocaja">
                                                                                                                              <c:choose>
                                                                                                                                  <c:when test="${!empty miListaIdGarantias.T_IAX_HIJOS}">
                                                                                                                                    <img id="img_DSP_DATOS_${miListaIdGarantias.CGARANT}_${garafranq.OB_IAX_BF_PROACTGRUP.GRUPO.CGRUP}" src="images/mes.gif" 
                                                                                                                                    onclick="toggleDisplay2('DSP_DATOS_${miListaIdGarantias.CGARANT}_${garafranq.OB_IAX_BF_PROACTGRUP.GRUPO.CGRUP}', this)" style="cursor:pointer"/> 
                                                                                                                                  </c:when>
                                                                                                                                  <c:otherwise>
                                                                                                                                  
                                                                                                                                   <img src="images/blank.gif"/>
                                                                                                                                    </c:otherwise>
                                                                                                                                </c:choose>
                                                                                                                             
                                                                                                                        <%--/td>
                                                                                                                     
                                                                                                                     
                                                                                                                            <td class="dspText"--%>   
                                                                                                                                ${miListaIdGarantias.TGARANT}</div>
                                                                                                                            </td>
                                                                                                                      </axis:visible>
                                                                                                                                        </tr>
                                                                                                                                            <c:if test="${!empty miListaIdGarantias.T_IAX_HIJOS}">
                                                                                                                                                 <tr id="DSP_DATOS_${miListaIdGarantias.CGARANT}_${garafranq.OB_IAX_BF_PROACTGRUP.GRUPO.CGRUP}_children" style="display:none" >
                                                                    <td colspan="10">
                                                                    
                                                                    <%--table class="area" align="right"  --%>
                                                                    <table class="area" cellpadding="0" cellspacing="0" align="right" style="width:99%">
                                                                                               <tbody id="garantias" align="right">
                                                                                                   <tr>
                                                                                                    
                                                                                                            <%--th style="width:15%;height:0px"></th--%>
                                                                                                          
                                                                                                        <axis:visible f="axisctr074" c="DESCRIPCION">
                                                                                                            <th style="width:95%;height:0px"></th>
                                                                                                        </axis:visible>
                                                                                                       
                                                                                                    </tr>
                                                                                                 <c:set var="tamanyo">${fn:length(miListaIdGarantias.T_IAX_HIJOS)}</c:set>
                                                                         <c:forEach items="${miListaIdGarantias.T_IAX_HIJOS}" var="miListaIdGarantiasHijos" varStatus="y"> 
                                                                            <tr tipo="ri" id="g_${miListaIdGarantiasHijos.CGARANT}" title="${miListaIdGarantiasHijos.CGARANT}-${miListaIdGarantiasHijos.TGARANT}"
                                                                                onmouseover="this.className = 'resaltar'" onmouseout="this.className = null"
                                                                              >
                                                                               <axis:visible f="axisctr074" c="DESCRIPCION">
                                                                              <td class="dspText">  
                                                                               <div class="titulocaja">
                                                                                    <c:set var="ultimo_nodo" value="0"/>
                                                                              <c:choose>
                                                                                  <c:when test="${!empty miListaIdGarantiasHijos.T_IAX_HIJOS}">
                                                                                
                                                                                  
                                                                                   <c:choose>
                                                                                     <c:when test="${tamanyo==(y.count)}">
                                                                                          <c:set var="imagen_mes">images/plusbottom.gif</c:set>
                                                                                          <c:set var="imagen_minus">images/minusbottom.gif</c:set>
                                                                                          <c:set var="ultimo_nodo" value="1"/>
                                                                                     </c:when>
                                                                                     <c:otherwise>
                                                                                         <c:set var="imagen_mes">images/plus.gif</c:set>
                                                                                         <c:set var="imagen_minus">images/minus.gif</c:set>
                                                                                     </c:otherwise>
                                                                                     </c:choose>
                                                                                 
                                                                                  <c:if test="${miListaIdGarantiasHijos.CNIVGAR== 2}">
                                                                                    <img src="images/blank.gif"/>
                                                                                  </c:if>
                                                                                  
                                                                                    <img id="img_DSP_DATOS_${miListaIdGarantiasHijos.CGARANT}_${garafranq.OB_IAX_BF_PROACTGRUP.GRUPO.CGRUP}" src="${imagen_mes}"
                                                                                     onclick="toggleDisplay2('DSP_DATOS_${miListaIdGarantiasHijos.CGARANT}_${garafranq.OB_IAX_BF_PROACTGRUP.GRUPO.CGRUP}', this,'${imagen_mes}','${imagen_minus}')" style="cursor:pointer"/> 
                                                                                     
                                                                                  </c:when>
                                                                                  <c:otherwise>
                                                                                 
                                                                                  <c:if test="${miListaIdGarantiasHijos.CNIVGAR>2 && (empty ultimo_nodo || ultimo_nodo eq '0')}">
                                                                                  <%--c:if test="${miListaIdGarantiasHijos.CNIVGAR>2}"--%>
                                                                                    <img src="images/line.gif"/>
                                                                                  </c:if>
                                                                                  <c:if test="${miListaIdGarantiasHijos.CNIVGAR== 2}">
                                                                                  <%--c:if test="${miListaIdGarantiasHijos.CNIVGAR== 2}"--%>
                                                                                    <img src="images/blank.gif"/>
                                                                                  </c:if>
                                                                                   <c:if test="${(!empty ultimo_nodo && ultimo_nodo eq '1')}">
                                                                                    <img src="images/blank.gif"/><img src="images/blank.gif"/>
                                                                                  </c:if>
                                                                                     <c:choose>
                                                                                     <c:when test="${tamanyo==(y.count)}">
                                                                                      <img src="images/joinbottom.gif"/>
                                                                                     </c:when>
                                                                                     <c:otherwise>
                                                                                     <img src="images/join.gif"/>
                                                                                     </c:otherwise>
                                                                                     </c:choose>
                                                                                     
                                                                                </c:otherwise>
                                                                                </c:choose>
                                                                         
                                                                               
                                                                    <%--/td--%>
                                                                    
                                                                 
                                                                        <%--td class="dspText"--%>   
                                                                           ${miListaIdGarantiasHijos.TGARANT}</div>
                                                                        </td>
                                                                  </axis:visible>
                                                                  
                                                                            </tr>
                                                                            <c:if test="${!empty miListaIdGarantiasHijos.T_IAX_HIJOS}">
                                                                             <c:set scope="session" var="hijos" value="${miListaIdGarantiasHijos.T_IAX_HIJOS}"/>
                                                                                 <c:set var="tamanyo">${fn:length(miListaIdGarantiasHijos.T_IAX_HIJOS)}</c:set>
                                                                         <c:forEach items="${miListaIdGarantiasHijos.T_IAX_HIJOS}" var="miListaIdGarantiasHijosHijos" varStatus="y"> 
                                                                            <tr tipo="ri" id="g_${miListaIdGarantiasHijosHijos.CGARANT}" title="${miListaIdGarantiasHijosHijos.CGARANT}-${miListaIdGarantiasHijosHijos.TGARANT}"
                                                                                onmouseover="this.className = 'resaltar'" onmouseout="this.className = null"
                                                                              >
                                                                               <axis:visible f="axisctr074" c="DESCRIPCION">
                                                                              <td class="dspText">  
                                                                               <div class="titulocaja">
                                                                                    <c:set var="ultimo_nodo" value="0"/>
                                                                              <c:choose>
                                                                                  <c:when test="${!empty miListaIdGarantiasHijosHijos.T_IAX_HIJOS}">
                                                                                
                                                                                  
                                                                                   <c:choose>
                                                                                     <c:when test="${tamanyo==(y.count)}">
                                                                                          <c:set var="imagen_mes">images/plusbottom.gif</c:set>
                                                                                          <c:set var="imagen_minus">images/minusbottom.gif</c:set>
                                                                                          <c:set var="ultimo_nodo" value="1"/>
                                                                                     </c:when>
                                                                                     <c:otherwise>
                                                                                         <c:set var="imagen_mes">images/plus.gif</c:set>
                                                                                         <c:set var="imagen_minus">images/minus.gif</c:set>
                                                                                     </c:otherwise>
                                                                                     </c:choose>
                                                                                 
                                                                                  <c:if test="${miListaIdGarantiasHijosHijos.CNIVGAR== 2}">
                                                                                    <img src="images/blank.gif"/>
                                                                                  </c:if>
                                                                                  
                                                                                    <img id="img_DSP_DATOS_${miListaIdGarantiasHijosHijos.CGARANT}_${garafranq.OB_IAX_BF_PROACTGRUP.GRUPO.CGRUP}" src="${imagen_mes}"
                                                                                     onclick="toggleDisplay2('DSP_DATOS_${miListaIdGarantiasHijosHijos.CGARANT}_${garafranq.OB_IAX_BF_PROACTGRUP.GRUPO.CGRUP}', this,'${imagen_mes}','${imagen_minus}')" style="cursor:pointer"/> 
                                                                                     
                                                                                  </c:when>
                                                                                  <c:otherwise>
                                                                                 
                                                                                  <c:if test="${miListaIdGarantiasHijosHijos.CNIVGAR>2 && (empty ultimo_nodo || ultimo_nodo eq '0')}">
                                                                                  <%--c:if test="${miListaIdGarantiasHijosHijos.CNIVGAR>2}"--%>
                                                                                    <img src="images/line.gif"/>
                                                                                  </c:if>
                                                                                  <c:if test="${miListaIdGarantiasHijosHijos.CNIVGAR== 2}">
                                                                                  <%--c:if test="${miListaIdGarantiasHijosHijos.CNIVGAR== 2}"--%>
                                                                                    <img src="images/blank.gif"/>
                                                                                  </c:if>
                                                                                   <c:if test="${(!empty ultimo_nodo && ultimo_nodo eq '1')}">
                                                                                    <img src="images/blank.gif"/><img src="images/blank.gif"/>
                                                                                  </c:if>
                                                                                     <c:choose>
                                                                                     <c:when test="${tamanyo==(y.count)}">
                                                                                      <img src="images/joinbottom.gif"/>
                                                                                     </c:when>
                                                                                     <c:otherwise>
                                                                                     <img src="images/join.gif"/>
                                                                                     </c:otherwise>
                                                                                     </c:choose>
                                                                                     
                                                                                </c:otherwise>
                                                                                </c:choose>
                                                                         
                                                                               
                                                                    <%--/td--%>
                                                                    
                                                                 
                                                                        <%--td class="dspText"--%>   
                                                                           ${miListaIdGarantiasHijos.TGARANT}</div>
                                                                        </td>
                                                                  </axis:visible>
                                                                  
                                                                            </tr>
                                                                           
                                                                    </c:forEach>
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                            </c:if>
                                                                    </c:forEach>
                                                                    </table>
                                                                    </td>
                                                                    </tr>
                                                                                       
                                                                                       
                                                                                       
                                                                                     
                                                                                </c:if>
                                                                            </c:forEach>
                                                                            </tbody>
                                                                            </table>
                                                                                    </div>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                        
                                                                              <div class="separador">&nbsp;</div>
                                                                 </td>
                                                             </tr>
                                                             <%--/c:if--%>
                                                             </c:forEach>
                                                             </axis:visible>
                                                             </c:if>
                                                             </table>
                                                             
                                                             
                                                             </td>
                                                        </tr>
                                                    </table>
                                            </td>
                                        </tr>
                                        
                                       
                                    </table>
                                  </c:if>
                                        
                                    </axis:visible>
                                    
                                    
                                    
                                    
                               
                            <%System.out.println("14");%>  
                    </td>
                </tr>
            </table>
            

            <!-- Botonera -->
            <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisctr074</c:param>
                <c:param name="__botones">cancelar</c:param>
            </c:import>
            <c:import url="../include/mensajes.jsp" />
        </form>
    </div>
    </body>
</html>
            
            