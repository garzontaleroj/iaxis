<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<c:choose>
    <c:when test="${empty param.f}">
        <c:set var="pantalla" value="axisctr120"/>
    </c:when>
    <c:otherwise>
        <c:set var="pantalla" value="${param.f}"/>
    </c:otherwise>
</c:choose>
                <tr>
                    <td class="titulo">
                            <img src="images/flecha.gif"/>
                                <c:if test="${!empty datos_poliza.TPRODUC}">&nbsp;${datos_poliza.TPRODUC}</c:if><c:if test="${!empty datos_poliza.NPOLIZA}">&nbsp;-&nbsp;${datos_poliza.NPOLIZA}</c:if> <axis:visible f="${pantalla}" c="NCERTIF" ><c:if test="${!empty datos_poliza.NCERTIF}">-${datos_poliza.NCERTIF}</c:if></axis:visible> <c:if test="${!empty datos_poliza.CRETENI && datos_poliza.CRETENI != 0 && !empty tmotret}">&nbsp;-&nbsp;<axis:alt f="axisctr120" c="TMOTRETEN" lit="152427" />&nbsp;${tmotret}&nbsp;&nbsp;</c:if> <c:if test="${ADMITECERTIFICADOS == '1'}">- <axis:alt f="axisctr120" c="CCOLECT" lit="9001021"/>: ${NAMETOMADORCERO}</c:if>
                                <axis:visible f="${pantalla}" c="BT_BUSCAR_POLIZA">
                               <img id="find" border="0" src="images/find.gif" onclick="f_abrir_axisctr019()" style="cursor:pointer"/> 
                             </axis:visible>
                    </td>
                    <axis:ocultar f="${pantalla}" c="MODIFICAR" dejarHueco="false">
                    <td>&nbsp;
                    </td>
                     </axis:ocultar>
                </tr>
                <tr>
                    <td>
                        <table class="seccion">
                            <tr>
                                <td align="left">
                                    <table class="area" align="center">
                                         <tr>
                                            <th style="height:0px"></th>
                                        </tr>
                                    <c:if test="${! empty datos_poliza}">
                                        <tr>
                                            <td class="campocaja" >
                                                <div style="float:left;">
                                                    <img id="DSP_DATOS_POLIZA_parent" src="images/mes.gif" onclick="objEstilos.toggleDisplay('DSP_DATOS_POLIZA', this)" style="cursor:pointer"/> 
                                                <b><axis:alt f="axisctr120" c="DATOS_POLIZA" lit="104925" /></b>&nbsp;&nbsp;${datos_poliza.NPOLIZA} <c:if test="${datos_poliza.NCERTIF!=null}" ><axis:visible f="${pantalla}" c="NCERTIF" >&nbsp;-&nbsp;${datos_poliza.NCERTIF}</axis:visible></c:if><c:if test="${datos_poliza.TSITUAC!=null}" >&nbsp;-&nbsp;${datos_poliza.TSITUAC}</c:if><c:if test="${datos_poliza.TRETENI!=null}" >&nbsp;-&nbsp;${datos_poliza.TRETENI}</c:if><c:if test="${!empty datos_poliza.TINCIDE}">&nbsp;-&nbsp;${datos_poliza.TINCIDE}</c:if><c:if test="${datos_poliza.FEFECTO!=null}">&nbsp;-&nbsp;<axis:alt f="axisctr120" c="FFECTO" lit="100883" />&nbsp;<fmt:formatDate value="${datos_poliza.FEFECTO}" pattern="dd/MM/yyyy"/></c:if><c:if test="${datos_poliza.FVENCIM!=null}">&nbsp;-&nbsp;<axis:alt f="axisctr120" c="FVENCIM" lit="100885" />&nbsp;<fmt:formatDate value="${datos_poliza.FVENCIM}" pattern="dd/MM/yyyy"/></c:if><axis:visible c="CPOLCIA" f="${pantalla}"><c:if test="${datos_poliza.CPOLCIA!=null}" >&nbsp;-&nbsp;<axis:alt f="axisctr120" c="CPOLCIA" lit="9001766" />&nbsp;${datos_poliza.CPOLCIA}</c:if></axis:visible>
                                                </div>
                                                        <div style="clear:both;">
                                                    <hr class="titulo">
                                                </div>
                                            </td>
                                        </tr>
                                        <c:if test="${! empty mvtretencion_sup}">
                                       <tr>
                                            <td class="campocaja">
                                                <div class="displayspace">
                                                  <c:set var="title0"><axis:alt f="axisctr120" c="CMOTRETEN" lit="1000297" /></c:set>
                                                  <c:set var="title1"><axis:alt f="axisctr120" c="FRECEP" lit="1000148" /></c:set>
                                                  <c:set var="title2"><axis:alt f="axisctr120" c="CUSUARI" lit="100894" /></c:set>
                                                  <c:set var="title3"><axis:alt f="axisctr120" c="FREVISIO" lit="105403" /></c:set>
                                                  <c:set var="title4"><axis:alt f="axisctr120" c="CSUSREV" lit="105404" /></c:set>
                                                  <c:set var="title5"><axis:alt f="axisctr120" c="NRIESGO" lit="100649" /></c:set>
                                                  <c:set var="title6"><axis:alt f="axisctr120" c="NRESUL" lit="1000345" /></c:set>
                                                   <axis:tabla name="${mvtretencion_sup}" miid="mimvtretencion" objeto="OB_IAX_POLMVTRETEN" campos="TMOTRET(O)#FRETEN(O)#CUSURET(O)#FREVRET(O)#CUSUREF(O)#TRIESGO(O)#TRESULTA(O)" estilos="dspText#dspDate#dspText#dspDate#dspText#dspText#dspText" titulos="${title0}@@${title1}@@${title2}@@${title3}@@${title4}@@${title5}@@${title6}"  columnHeaderClass="sortable gridsorted gridasc#sortable#sortable#sortable#sortable#sortable#sortable" cellpadding="0" cellspacing="0"/>
                                                </div>
                                                <hr />
                                               
                                            </td>
                                        </tr>
                                        </c:if>

                                        <tr id="DSP_DATOS_POLIZA_children" style="display:none">
                                            <td align="left" >
                                                 <table class="area" align="center">
                                                     <tr>
                                                        <th style="width:15%;height:0px"></th>
                                                        <th style="width:5%;height:0px"></th>
                                                        <th style="width:20%;height:0px"></th>
                                                        <th style="width:20%;height:0px"></th>
                                                        <th style="width:20%;height:0px"></th>
                                                        <th style="width:20%;height:0px"></th>
                                                    </tr>
                                                    <tr>
                                                        <td class="titulocaja" id="tit_NPOLIZA">
                                                            <b id="label_NPOLIZA"><axis:alt f="axisctr120" c="NPOLIZA" lit="100624" /></b>
                                                        </td>
                                                        <axis:ocultar f="${pantalla}" c="NCERTIF" >
                                                        <td class="titulocaja">
                                                            <b><axis:alt f="axisctr120" c="NCERTIF" lit="101236" /></b>
                                                        </td>
                                                        </axis:ocultar>
                                                        
                                                         <td class="titulocaja">
                                                            <b><axis:alt f="axisctr120" c="CSITUAC" lit="100874" /></b>
                                                        </td>
                                                         <c:if test="${!empty datos_poliza.TRETENI}">
                                                             <td class="titulocaja">
                                                                <b><axis:alt f="axisctr120" c="CESTADO" lit="100587" /></b>
                                                            </td>
                                                        </c:if>
                                                        <td class="titulocaja" colspan="2">
                                                            <b><axis:alt f="axisctr120" c="SPRODUC" lit="100829" /></b>
                                                        </td>
                                                       <axis:visible f="${pantalla}" c="TACTIVI">
                                                        <td class="titulocaja">
                                                            <b><axis:alt f="axisctr120" c="TACTIVI" lit="103481" /></b>
                                                        </td>
                                                        </axis:visible>
                                                    </tr>
                                                    <tr>
                                                        <td class="campocaja">
                                                            <input type="text" class="campo campotexto" id="NPOLIZA" name="NPOLIZA" size="15" style="width:90px"
                                                            value="${datos_poliza.NPOLIZA}" readonly="true" />
                                                        </td>    
                                                         <axis:ocultar f="${pantalla}" c="NCERTIF">
                                                        <td class="campocaja">
                                                           
                                                                    <input type="text" class="campo campotexto" id="NCERTIF" name="NCERTIF" size="3" style="width:90%"
                                                                    value="${datos_poliza.NCERTIF}" readonly="true" />
                                                            
                                                        </td>
                                                        </axis:ocultar>
                                                        
                                                                                                                <td class="campocaja">
                                                            <input type="text" class="campowidthinput campo campotexto" id="TSITUAC" name="TSITUAC" size="15"
                                                            value="${datos_poliza.TSITUAC}" readonly="true" />
                                                        </td>
                                                         <c:if test="${!empty datos_poliza.TRETENI}">
                                                             
                                                             <td class="campocaja">
                                                                <input type="text" class="campowidthinput campo campotexto" id="TRETENI" name="TRETENI" size="15"
                                                                value="${datos_poliza.TRETENI}" readonly="true" />
                                                            </td>
                                                        </c:if>
                                                         
                                                        <td class="campocaja" colspan="2">
                                                            <input type="text" style="width:95%" class="campowidthinput campo campotexto" id="TPRODUC" name="TPRODUC" size="15"
                                                            value="${datos_poliza.TPRODUC}" readonly="true" />
                                                        </td>
                                                         <axis:visible f="${pantalla}" c="TACTIVI">
                                                         <td class="campocaja">
                                                            <input type="text" class="campowidthinput campo campotexto" id="TACTIVI" name="TACTIVI" size="15"
                                                            value="${datosgestion.TACTIVI}" readonly="true"/>
                                                        </td>
                                                        </axis:visible>

                                                    </tr>
                                                    <tr>
                                                         
                                                        <td class="titulocaja" colspan="2">
                                                            <b><axis:alt f="axisctr120" c="FFECTO" lit="100883" /></b>
                                                        </td>                                                    
                                                       
                                                        
                                                        <axis:visible c="TDURACI" f="${pantalla}">
                                                        <td class="titulocaja">
                                                            <b><axis:alt f="axisctr120" c="TDURACI" lit="1000120" /></b>
                                                        </td>
                                                        </axis:visible>
                                                        <axis:visible c="NDURCOB" f="${pantalla}">
                                                        
                                                        <td class="titulocaja">
                                                            <b><axis:alt f="axisctr120" c="NDURCOB" lit="9000814" /></b>
                                                        </td>  
                                                        </axis:visible>
                                                        <axis:ocultar f="${pantalla}" c="FVENCIM" dejarHueco="false">
                                                        
                                                        <td class="titulocaja">
                                                            <b><axis:alt f="axisctr120" c="FVENCIM" lit="100885" /></b>
                                                        </td>     
                                                        </axis:ocultar>
                                                                                                             
                                                    </tr>
                                                    <tr>
                                                        
                                                        <td class="campocaja" colspan="2">
                                                            <input type="text" class="campowidthinput campo campotexto" id="FEFECTO" name="FEFECTO" size="15"
                                                            value="<fmt:formatDate value="${datos_poliza.FEFECTO}" pattern="dd/MM/yyyy" />" readonly="true" />
                                                        </td>
                                                        
                                                        <axis:visible c="TDURACI" f="${pantalla}">
                                                        <td class="campocaja">
                                                            <input type="text" class="campowidthinput campo campotexto" id="TDURACI" name="TDURACI" size="15" style="width:150px"
                                                            value="${datos_poliza.TDURACI}" readonly="true" />
                                                        </td>
                                                        </axis:visible>
                                                        <axis:visible c="NDURCOB" f="${pantalla}">
                                                        
                                                        <td class="campocaja">
                                                            <input type="text" class="campowidthinput campo campotexto" id="NDURCOB" name="NDURCOB" size="15" style="width:60%;"
                                                            value="${datos_poliza.NDURCOB}" readonly="true" />
                                                        </td>                                    
                                                        </axis:visible>
                                                        <axis:ocultar f="${pantalla}" c="FVENCIM" dejarHueco="false">
                                                        
                                                        <td class="campocaja">
                                                            <input type="text" class="campowidthinput campo campotexto" id="FVENCIM" name="FVENCIM" size="10"
                                                            value="<fmt:formatDate value="${datos_poliza.FVENCIM}" pattern="dd/MM/yyyy" />" readonly="true" />
                                                        </td>  
                                                        </axis:ocultar>
                                                       
                                                       

                                                    </tr>
                                                    
                                                    
                                                       <tr> 
                                                    <axis:ocultar f="${pantalla}" c="CAGENTE" dejarHueco="false">
                                                        
                                                        <td class="titulocaja">
                                                            <b><axis:alt f="axisctr120" c="CAGENTE" lit="100584" /></b>
                                                        </td>
                                                        <td>
                                                        </td>
                                                        </axis:ocultar>  
                                                       </tr>
                                                    
                                                    
                                                    <tr> 
                                                     <axis:ocultar f="${pantalla}" c="CAGENTE" dejarHueco="false">
                                                        
                                                         <td class="campocaja" colspan="6" nowrap="nowrap">
                                                         <axis:visible f="${pantalla}" c="CAGENTE" >
                                                            <input type="text" class="campowidthinput campo campotexto" id="CAGENTE" name="CAGENTE" size="11" style="width:60px"
                                                                value="${datos_poliza.CAGENTE}" readonly="true" />
                                                         </axis:visible>   
                                                         <input type="text" class="campowidthinput campo campotexto" id="TAGENTE" name="TAGENTE" size="40" style="width:420px" 
                                                            value="${datos_poliza.axisctr120_agente.NOMBRE}" readonly="true" />
                                                         </td>
                                                         </axis:ocultar>
                                                    
                                                    
                                                    
                                                    
                                                    
                                                    
                                                    
                                                    
                                                    
                                                       <tr> 
                                                       	 <axis:visible f="${pantalla}" c="POLISSA_INI">
                                                        <td class="titulocaja" colspan="2">
                                                            <b><axis:alt f="axisctr120" c="NPOLINI" lit="1000017" /></b>
                                                        </td>
                                                         </axis:visible>
  	 																										<axis:visible f="${pantalla}" c="NCONTRATO">
                                                        <td class="titulocaja">
                                                            <b><axis:alt f="axisctr120" c="NCONTRATO" lit="9000536" /></b>
                                                        </td>
                                                         </axis:visible>  
                                                         
                                                         <axis:ocultar f="${pantalla}" c="CPOLCIA" dejarHueco="false">
                                                        
                                                        <td class="titulocaja">
                                                            <b><axis:alt f="axisctr120" c="CPOLCIA" lit="9001766" /></b>
                                                        </td>
                                                        </axis:ocultar>
                                                        </tr>                                                        
                                                        
                                                    <tr>
                                                    <axis:visible f="${pantalla}" c="POLISSA_INI">
                                                        <td class="campocaja" colspan="2">
                                                            <input readonly="true" type="text" class="campowidthinput campo campotexto" id="polissa_ini" name="polissa_ini" 
                                                            title="<axis:alt f="axisctr120" c="NOPOLINI" lit="1000017"/>" size="15" value ="${datos_poliza.POLISSA_INI}"/>&nbsp;
                                                        </td>
                                                    </axis:visible>
                                                    <axis:visible f="${pantalla}" c="NCONTRATO">
                                                        <td class="campocaja">
                                                            <input readonly="true" type="text" class="campowidthinput campo campotexto" id="NCONTRATO" name="NCONTRATO" 
                                                            title="<axis:alt f="axisctr120" c="NCONTRATO" lit="9000536"/>" size="15" value ="${datos_poliza.NCONTRATO}"/>&nbsp;
                                                        </td>
                                                    </axis:visible>
                                                    
                                                     
                                                        <axis:visible c="CPOLCIA" f="${pantalla}">
                                                        <td class="campocaja">
                                                            <input type="text" class="campowidthinput campo campotexto" id="CPOLCIA" name="CPOLCIA" size="15"
                                                            value="${datos_poliza.CPOLCIA}" readonly="true" />
                                                        </td>
                                                        </axis:visible>
                                                    
                                                        
                                                            <td colspan="2">&nbsp;</td>
                                                            <td class="campocaja" colspan="2" style="color:red;">
                                                            <b>${datos_poliza.TINCIDE}</b>
                                                        </td> 
                                                    </tr>
                                                    <tr>
                                                     <axis:ocultar f="${pantalla}" c="CMONPROD" dejarHueco="false">
                                                     
                                                        <td class="titulocaja" colspan="2">
                                                            <b><axis:alt f="${pantalla}" c="CMONPROD" lit="9903008" /></b>
                                                        </td>
                                                        </axis:ocultar>
                                                        <axis:ocultar f="${pantalla}" c="CPROMOTOR" dejarHueco="false">
                                                     
                                                        <td class="titulocaja">
                                                            <b><axis:alt f="${pantalla}" c="CPROMOTOR" lit="151522" /></b>
                                                        </td>
                                                        </axis:ocultar>
                                                        
                                                       
                                                        
                                                        
                                                        </tr>
                                                        <tr>
                                                         <axis:ocultar f="${pantalla}" c="CMONPROD" dejarHueco="false">
                                                        <td class="campocaja" colspan="2">
                                                               <input type="text" class="campowidthinput campo campotexto" id="CMONPROD" name="CMONPROD" size="15" style="width:95%"
                                                                  value="${CMONPRODINT} - ${requestScope.TMONPROD}" readonly="true" />
                                                        </td>
                                                        </axis:ocultar>
                                                        <axis:ocultar f="${pantalla}" c="CPROMOTOR" dejarHueco="false">
                                                        <td class="campocaja" colspan="4">
                                                               <input type="text" class="campowidthinput campo campotexto" id="TPROMOTOR" name="TPROMOTOR" size="15" style="width:68%"
                                                                  value="${datos_poliza.axisctr120_promotor}" readonly="true" />
                                                        </td>
                                                        </axis:ocultar>
                                                        
                                                       
                                                        
                                                        
                                                        
                                                        
                                                    </tr>
                                                    <axis:visible f="${pantalla}" c="REEMPLAZOS">
                                                        <c:if test="${!empty datos_poliza.REEMPLAZOS && fn:length(datos_poliza.REEMPLAZOS)>0}">                                                    
                                                            <tr>
                                                                <td align="left" colspan="6">
                                                                    <div class="displayspace">
                                                                         <c:set var="title0"><axis:alt f="axisctr120" c="NPOLIZAREEMPL" lit="9902381" /></c:set>
                                                                         <c:set var="title1"><axis:alt f="axisctr120" c="NPOLIZANUEVA" lit="9902382" /></c:set>
                                                                         <c:set var="title2"><axis:alt f="axisctr120" c="FMOVDIA" lit="100562" /></c:set>                               
                                                                         <c:set var="title3"><axis:alt f="axisctr120" c="CUSUARIO" lit="100894" /></c:set>
                                                                         <c:set var="title4"><axis:alt f="axisctr120" c="CAGENTE" lit="100584" /></c:set>
                                                                         <display:table name="${datos_poliza.REEMPLAZOS}" id="reemplazo" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                                                                         requestURI="axis_${pantalla}.do?paginar=true&tabla=tomador"> 
                                                                           <%@ include file="../include/displaytag.jsp"%>
                                                                           <display:column title="${title0}" sortable="true" sortProperty="OB_IAX_TOMADORES.TTIPIDE" headerClass="sortable"  style="width:20%" media="html" autolink="false" >
                                                                               <div class="dspText">${reemplazo.OB_IAX_REEMPLAZOS.NPOLIZAREEMPL}</div>
                                                                           </display:column>
                                                                           <display:column title="${title1}" sortable="true" sortProperty="OB_IAX_TOMADORES.NNUMIDE" headerClass="headwidth5 sortable"   style="width:20%" media="html" autolink="false" >
                                                                               <div class="dspText">${reemplazo.OB_IAX_REEMPLAZOS.NPOLIZANUEVA}</div>
                                                                           </display:column>
                                                                            <display:column title="${title2}" sortable="true" sortProperty="OB_IAX_TOMADORES.TNOMBRE" headerClass="sortable" style="width:20%" media="html" autolink="false" >
                                                                               <div class="dspText"><fmt:formatDate pattern="dd/MM/yyyy" value="${reemplazo.OB_IAX_REEMPLAZOS.FMOVDIA}"/></div>
                                                                           </display:column>
                                                                            <display:column title="${title3}" sortable="true" sortProperty="OB_IAX_TOMADORES.TSEXPER" headerClass="headwidth5 sortable" style="width:20%"  media="html" autolink="false" >
                                                                               <div class="dspText">${reemplazo.OB_IAX_REEMPLAZOS.CUSUARIO}</div>
                                                                           </display:column>                                   
                                                                            <display:column title="${title4}" sortable="true" sortProperty="OB_IAX_TOMADORES.FNACIMI" headerClass="sortable" style="width:20%" media="html" autolink="false" >
                                                                               <div class="dspText">${reemplazo.OB_IAX_REEMPLAZOS.TAGENTE}</div>
                                                                           </display:column>                        
                                                                        </display:table>
                                                                    </div>
                                                                </td> 
                                                            </tr>
                                                        </c:if>
                                                </axis:visible>
                                                </table>        
                                            </td> 
                                        </tr>       
                                    </c:if>
                                    <c:if test="${! empty datosgestion}">
                                         <axis:visible f="${pantalla}" c="DSP_DATOS_GESTION">
                                        <tr>
                                            <td class="campocaja" >
                                                <div style="float:left;">
                                                    <img id="DSP_DATOS_GESTION_parent" src="images/mes.gif" onclick="objEstilos.toggleDisplay('DSP_DATOS_GESTION', this)" style="cursor:pointer"/> 
                                                    <b><axis:alt f="axisctr120" c="DATOS_GESTION" lit="140502" />
                                                    </b>&nbsp;&nbsp; ${datos_poliza.TTIPCOB}&nbsp;
                                                    <c:if test="${datos_poliza.CTIPCOB}=='2'">
                                                    <c:if test="${datos_poliza.CBANCAR!=null}">&nbsp;-&nbsp;${datos_poliza.CBANCAR}</c:if>
                                                    </c:if> &nbsp;-&nbsp;&nbsp;<axis:alt f="axisctr120" c="CFORPAG" lit="100712" /> : &nbsp;${datos_poliza.TFORPAG}
                                                  <axis:ocultar f="${pantalla}" c="FCARPRO" dejarHueco="false">    <c:if test="${datos_poliza.FCARPRO!=null}" > &nbsp;-&nbsp;<axis:alt f="axisctr120" c="FCARPRO" lit="151215" />&nbsp;<fmt:formatDate value="${datos_poliza.FCARPRO}" pattern="dd/MM/yyyy"/></c:if>  </axis:ocultar>
                                                  <axis:ocultar f="${pantalla}" c="FCARANU" dejarHueco="false">  <c:if test="${datos_poliza.FCARANU!=null}" > &nbsp;-&nbsp;<axis:alt f="axisctr120" c="FRENOVA" lit="102626" />&nbsp;<fmt:formatDate value="${datos_poliza.FCARANU}" pattern="dd/MM/yyyy"/> </c:if></axis:ocultar>
                                                    <axis:visible c="CMONPOL" f="axisctr120">  <c:if test="${!empty datos_poliza.CMONPOL}"> - <axis:alt f="axisctr120" c="CMONPOL" lit="108645"/> :  ${datos_poliza.TMONPOL} </c:if> </axis:visible>
                                                </div>
                                               <!-- <div style="float:right;" id="DATOS_GESTION"></div>-->
                                                <!--<div class="seccion_suplementos" id="SECCION_DATOS_GESTION"></div>-->
                                                <div style="clear:both;">
                                                    <hr class="titulo">
                                                </div>
                                            </td>
                                        </tr>         
                                        <tr id="DSP_DATOS_GESTION_children" style="display:none">
                                           <td align="left" >
                                                 <table class="area" align="center">
                                                     <tr>
                                                        <th style="width:20%;height:0px"></th>
                                                        <th style="width:20%;height:0px"></th>
                                                        <th style="width:20%;height:0px"></th>
                                                        <th style="width:20%;height:0px"></th>
                                                        <th style="width:20%;height:0px"></th>
                                                    </tr>
                                                    <!-- Datos Gesti?n -->
                                                    <tr>
                                                        <!-- TIPO_COBRO -->
                                                        <td class="titulocaja">
                                                            <b><axis:alt f="axisctr120" c="CTIPCOB" lit="151348" /></b>
                                                        </td>
                                                        <!-- CUENTA BANCARIA -->
                                                        <axis:ocultar f="${pantalla}" c="CBANCAR" dejarHueco="false"> 
                                                          <td class="titulocaja" colspan="2">                                                        
                                                         <b><axis:alt f="axisctr120" c="CBANCAR" lit="100965" /></b>                                                       
                                                        </td>
                                                        </axis:ocultar>
                                                        <!-- FECHA ANULACION -->
                                                        <axis:ocultar f="${pantalla}" c="FANULAC" dejarHueco="false">
                                                        <td class="titulocaja">
                                                            <b><axis:alt f="axisctr120" c="FANUL" lit="101244" /></b>
                                                        </td>
                                                        </axis:ocultar>
                                                        <!-- CUOTAS TARJETA bug 20761 -->
                                                        <td class="tit_TARJETA">
                                                            <b id = "label_NCUOTAR" ><axis:alt f="axisctr120" c="NCUOTAR" lit="9901245" /></b>
                                                        </td>
                                                       
                                                    </tr>
                                                    <tr>
                                                        <!-- TIPO_COBRO -->
                                                        <td class="campocaja">
                                                            <input type="text" class="campowidthinput campo campotexto" id="TTIPCOB" name="TTIPCOB" size="15"
                                                            value="${datos_poliza.TTIPCOB}" readonly="true"/>
                                                        </td>
                                                        <!-- CUENTA BANCARIA -->                                                      
                                                      <axis:ocultar f="${pantalla}" c="CBANCAR" dejarHueco="false">
                                                       <td class="campocaja" colspan="2">                                                          
                                                            <input type="text" style="width:100%" class="campowidthinput campo campotexto" id="CBANCAR" name="CBANCAR" size="15"
                                                            value="<axis:masc f="axisctr120" c="CBANCAR" value="${datos_poliza.CBANCAR}" />" readonly="true"/>
                                                         </td>
                                                        </axis:ocultar> 
                                                        <!-- FECHA ANULACION -->
                                                         <axis:ocultar f="${pantalla}" c="FANULAC" dejarHueco="false">
                                                        <td class="campocaja">
                                                            <input type="text" class="campowidthinput campo campotexto" id="FANULAC" name="FANULAC" size="15"
                                                            value="<fmt:formatDate value="${datos_poliza.FANULAC}" pattern="dd/MM/yyyy"/>" readonly="true" />
                                                        </td>
                                                        </axis:ocultar>
                                                        <!-- CUOTAS TARJETA bug 20761 -->
                                                        <td class="campocaja">
                                                            <axis:ocultar f="${pantalla}" c="NCUOTAR" dejarHueco="false">
                                                            <input type="text" style="width:100%" class="campowidthinput campo campotexto" id="NCUOTAR" name="NCUOTAR" size="15"
                                                            value="${datos_poliza.NCUOTAR}" readonly="true"/>
                                                            </axis:ocultar>
                                                        </td>
                                                        <!-- CUOTAS TARJETA bug 20761 -->
                                                        <td class="campocaja">
                                                            <axis:ocultar f="${pantalla}" c="TARJETA" dejarHueco="false">
                                                            <input type="hidden" style="width:100%" class="campowidthinput campo campotexto" id="TARJETA" name="TARJETA" size="15"
                                                            value="${datos_poliza.TARJETA}" readonly="true"/>
                                                            </axis:ocultar>
                                                        </td>                                                        
                                                        
                                                    </tr>
                                                    <tr>
                                                    
                                                        <!-- FECHA TIPO FORMA DE PAGO -->
                                                        <td class="titulocaja">
                                                            <b><axis:alt f="axisctr120" c="CFORPAG" lit="100712" /></b>
                                                        </td>
                                                        <!-- FECHA REnovacio -->
                                                        <axis:ocultar f="${pantalla}" c="FCARANU" dejarHueco="false">
                                                        <td class="titulocaja">
                                                            <b><axis:alt f="axisctr120" c="FRENOVA" lit="102626" /></b>
                                                         </td>
                                                           </axis:ocultar>
                                                        <axis:ocultar f="${pantalla}" c="FCARPRO" dejarHueco="false">
                                                         <!--F Proper Rebut -->
                                                        <td class="titulocaja">
                                                            <b><axis:alt f="axisctr120" c="FCARPROREB" lit="1000462" /></b>
                                                        </td>
                                                        </axis:ocultar>
                                                         <axis:ocultar f="${pantalla}" c="FCARANT" dejarHueco="false">
                                                        <!--fecha recibo anterior -->
                                                        <td class="titulocaja">
                                                            <b><axis:alt f="axisctr120" c="FCARANT" lit="9000501" /></b>
                                                        </td>
                                                        </axis:ocultar>
                                                         <axis:ocultar f="${pantalla}" c="CRECFRA" dejarHueco="false">
                                                        <!--recarrec fraccionament -->
                                                        <td class="titulocaja">
                                                            <b><axis:alt f="axisctr120" c="CRECFRA" lit="1000483" /></b>
                                                        </td>
                                                        </axis:ocultar>                                                        
                                                        
                                                    </tr>
                                                    <tr>
                                                        <!-- FECHA TIPO FORMA DE PAGO -->
                                                        <td class="campocaja">
                                                            <input type="text" class="campowidthinput campo campotexto" id="TFORPAG" name="TFORPAG" size="15"
                                                            value="${datos_poliza.TFORPAG}"  readonly="true"/>
                                                        </td>  
                                                        <!-- FECHA Renovacio -->
                                                         <axis:ocultar f="${pantalla}" c="FCARANU" dejarHueco="false">
                                                        <td class="campocaja">
                                                            <input type="text" class="campowidthinput campo campotexto" id="FCARANU" name="FCARANU" size="15"
                                                            value="<fmt:formatDate value="${datos_poliza.FCARANU}" pattern="dd/MM/yyyy"/>" readonly="true" />
                                                        </td>
                                                          </axis:ocultar>
                                                        <axis:ocultar f="${pantalla}" c="FCARPRO" dejarHueco="false">
                                                        <!--F Proper Rebut -->
                                                        <td class="campocaja">
                                                            <input type="text" class="campowidthinput campo campotexto" id="FCARPRO" name="FCARPRO" size="15"
                                                            value="<fmt:formatDate value="${datos_poliza.FCARPRO}" pattern="dd/MM/yyyy"/>" readonly="true"/>
                                                        </td>
                                                        </axis:ocultar>
                                                         <axis:ocultar f="${pantalla}" c="FCARANT" dejarHueco="false">
                                                        <!--fecha recibo anterior -->
                                                        <td class="campocaja">
                                                            <input type="text" class="campowidthinput campo campotexto" id="FCARANT" name="FCARANT" size="15"
                                                            value="<fmt:formatDate value="${datos_poliza.FCARANT}" pattern="dd/MM/yyyy"/>"  readonly="true"/>
                                                        </td>
                                                        </axis:ocultar>
                                                         <axis:ocultar f="${pantalla}" c="CRECFRA">
                                                          <td class="campocaja">
                                                            <input  <c:if test="${datos_poliza.CRECFRA == '1'}">checked="true"</c:if>  
                                                            type="checkbox" disabled id="CRECFRA" name="CRECFRA" value="${datos_poliza.CRECFRA}"/>
                                                          </td>
                                                        </axis:ocultar>
                                                        
                                                    </tr>
                                                   
                                                     <tr>

                                                         <axis:visible f="${pantalla}" c="TDURPER">
                                                            <!-- Periodo de revisión -->
                                                            <td class="titulocaja">
                                                                <b><axis:alt f="axisctr120" c="TDURPER" lit="1000558" /></b>
                                                            </td>
                                                         </axis:visible>
                                                         <axis:visible f="${pantalla}" c="PCAPFALL">
                                                            <!-- Pct. Fallecimiento -->
                                                            <td class="titulocaja">
                                                                <b><axis:alt f="axisctr120" c="PCAPFALL" lit="1000547" /></b>
                                                            </td>
                                                         </axis:visible>
                                                         <axis:visible f="${pantalla}" c="PDOSCAB">
                                                            <!-- Pct. Reversión -->
                                                            <td class="titulocaja">
                                                                <b><axis:alt f="axisctr120" c="PCTREV" lit="1000548" /></b>
                                                            </td>
                                                         </axis:visible>
                                                         <axis:visible f="${pantalla}" c="TFORPAGREN">
                                                            <!-- Forma pago renta -->
                                                            <td class="titulocaja">
                                                                <b><axis:alt f="axisctr120" c="TFORPAGREN" lit="1000180" /></b>
                                                            </td>
                                                         </axis:visible>
                                                        </tr>
                                                            
                                                        <tr>
                                                            <axis:visible f="${pantalla}" c="TDURPER">
                                                             <!-- Periodo de revisión -->
                                                                <td class="campocaja">
                                                                    <input type="text" class="campowidthinput campo campotexto" id="NDURPER" name="NDURPER" size="15"
                                                                    value="${datos_poliza.NDURPER}"  readonly="true"/>
                                                                </td>  
                                                            </axis:visible>
                                                            <axis:visible f="${pantalla}" c="PCAPFALL">
                                                                <!-- Pct. Fallecimiento -->
                                                                <td class="campocaja">
                                                                    <input type="text" class="campowidthinput campo campotexto" id="PCAPFALL " name="PCAPFALL " size="15"
                                                                    value="${datos_poliza.PCAPFALL}" readonly="true" />
                                                                </td>
                                                            </axis:visible>
                                                            <axis:visible f="${pantalla}" c="PDOSCAB">
                                                                <!-- Pct. Reversión -->
                                                                <td class="campocaja">
                                                                    <input type="text" class="campowidthinput campo campotexto" id="PDOSCAB " name="PDOSCAB " size="15"
                                                                    value="${datos_poliza.PDOSCAB }" readonly="true" />
                                                                </td>
                                                            </axis:visible>
                                                            <axis:visible f="${pantalla}" c="TFORPAGREN">
                                                                <!-- Forma pago renta -->
                                                                <td class="campocaja">
                                                                    <input type="text" class="campowidthinput campo campotexto" id="TFORPAGREN " name="TFORPAGREN " size="15"
                                                                    value="${datos_poliza.TFORPAGREN }" readonly="true" />
                                                                </td>
                                                            </axis:visible>
                                                    </tr>
                                                    
                                                    
                                                    <tr>
                                                    <axis:visible f="${pantalla}" c="FREVISIO">
                                                       <!-- Fecha de revisión -->
                                                        <td class="titulocaja">
                                                            <b><axis:alt f="axisctr120" c="FREVISIO" lit="105403" /></b>
                                                        </td>
                                                    </axis:visible>
                                                    <axis:visible f="${pantalla}" c="NDURPRO">
                                                          <!-- Duración próxima -->
                                                        <td class="titulocaja">
                                                            <b><axis:alt f="axisctr120" c="NDURPRO" lit="1000549" /></b>
                                                        </td>
                                                    </axis:visible>
                                                    <axis:visible f="${pantalla}" c="INTPRO">
                                                          <!--	Interés próximo -->
                                                        <td class="titulocaja">
                                                            <b><axis:alt f="axisctr120" c="INTPRO" lit="1000550" /></b>
                                                        </td>
                                                    </axis:visible>
                                                        
                                                        <tr>
                                                        <axis:visible f="${pantalla}" c="FREVISIO">
                                                     <!-- Fecha de revisión -->
                                                        <td class="campocaja">
                                                            <input type="text" class="campowidthinput campo campotexto" id="FREVISIO " name="FREVISIO " size="15"
                                                            value="<fmt:formatDate value="${datos_poliza.FREVISIO}" pattern="dd/MM/yyyy"/>"  readonly="true"/>
                                                        </td>  
                                                        </axis:visible>
                                                        <axis:visible f="${pantalla}" c="NDURPRO">
                                                        <!-- Duración próxima -->
                                                        <td class="campocaja">
                                                            <input type="text" class="campowidthinput campo campotexto" id="NDURPRO" name="NDURACI" size="15"
                                                            value="${datos_poliza.NDURPRO}" readonly="true" />
                                                        </td>
                                                        </axis:visible>
                                                        <axis:visible f="${pantalla}" c="INTPRO">
                                                        <!--	Interés próximo -->
                                                        <td class="campocaja">
                                                            <input type="text" class="campowidthinput campo campotexto" id="INTPRO" name="IPROX" size="15"
                                                            value="${datos_poliza.INTPRO}" readonly="true" />
                                                        </td>
                                                        </axis:visible>
                                                    </tr>
                                                 
                                                    <tr>
                                                        <axis:ocultar f="axisctr120" c="CTIPCOM" dejarHueco="false">
                                                            <td class="titulocaja">
                                                                <b id="label_CTIPCOM"><axis:alt f="axisctr120" c="LIT_101509" lit="101509" /></b>
                                                            </td>
                                                        </axis:ocultar>
                                                        
                                                         <axis:visible f="axisctr120" c="CMONPOL">
                                                              <!--	Inter�s pr�ximo -->
                                                            <td class="titulocaja">
                                                                <b><axis:alt f="axisctr120" c="CMONPOL" lit="108645"/></b>
                                                            </td>
                                                        </axis:visible>

                                                    </tr>
                                                    
                                                    <tr>
                                                        <axis:ocultar f="axisctr120" c="CTIPCOM" dejarHueco="false">
                                                        <td class="campocaja">
															<input type="text" class="campowidthinput campo campotexto" id="TTIPCOM" name="TTIPCOM" size="15"
                                                            value="${datos_poliza.TTIPCOM}" readonly="true" style="width:70%"/>
                                                            <input type="hidden" class="campowidthinput campo campotexto" id="CTIPCOM" name="CTIPCOM" size="15"
                                                            value="${datos_poliza.CTIPCOM}" style="width:70%"/>
                                                          <!--  <a id="icon_CTIPCOM" name="icon_CTIPCOM"  href="javascript:f_abrir_axisctr010('CONSULTA')"><img onclick="javascript:f_abrir_axisctr010('CONSULTA')" border="0" alt="<axis:alt f="axisctr120" c="LIT_1000125" lit="1000125"/>" title="<axis:alt f="axisctr120" c="LIT_1000125" lit="1000125"/>" src="images/informacion.gif"/></a>-->
                                                        </td>
                                                        </axis:ocultar>
                                                        
                                                          <axis:visible f="axisctr120" c="CMONPOL">
                                        <!--	Moneda -->
                                        <td class="campocaja">
                                            <input type="text" class="campowidthinput campo campotexto" id="CMONPOL" name="CMONPOL" size="15"
                                            value="${datos_poliza.TMONPOL}" readonly="true" />
                                        </td>
                                        </axis:visible>
                                                    </tr>
                                                    
                                                    <tr>
                                                     <axis:visible f="axisctr120" c="TCOMPANI">
                                                            <td class="titulocaja">
                                                                <b><axis:alt f="axisctr120" c="TCOMPANI" lit="9000600"/></b>
                                                            </td>
                                                        </axis:visible>
                                        <axis:visible f="axisctr120" c="TBLOQUEOCOL">
                                            <td class="titulocaja">
                                                <b><axis:alt f="axisctr120" c="TBLOQUEOCOL" lit="9904677"/></b>
                                            </td>
                                        </axis:visible>
                                                    </tr>
                                                    <tr>
                                                        <axis:visible f="axisctr120" c="TCOMPANI">
                                                            <td class="campocaja"> 
                                                                <input type="text" class="campowidthinput campo campotexto" id="TCOMPANI" name="TCOMPANI" size="15"
                                                                 value="${datos_poliza.TCOMPANI}" readonly="true" />
                                                            </td>
                                                        </axis:visible>
                                        <axis:visible f="axisctr120" c="TBLOQUEOCOL">
                                            <td class="campocaja"> 
                                                <input type="text" class="campowidthinput campo campotexto" id="TBLOQUEOCOL" name="TBLOQUEOCOL" size="15"
                                                        value="${datos_poliza.TBLOQUEOCOL}" readonly="true" />
                                            </td>
                                        </axis:visible>                                                        
                                                    </tr>
                                                 
                                                 </table>
                                            </td> 
                                        </tr>  
                                      </axis:visible>
                                    </c:if>
<axis:visible c="DSP_GESTORCOBRO" f="${pantalla}">
                                    <c:if test="${!empty gestorescobro && fn:length(gestorescobro)>0}">
                                        <tr>
                                            <td class="campocaja" >
                                                <div style="float:left;">fffff
                                                    <img  id="DSP_GESTORCOBRO_parent" src="images/mes.gif" onclick="objEstilos.toggleDisplay('DSP_GESTORCOBRO', this)" style="cursor:pointer"/> 
                                                     <b><axis:alt f="axisctr120" c="NGESTORCOBRO" lit="9903385" /></b>
                                                </div>
                                                <!--<div style="float:right;" id="GESTORCOBRO"></div>
                                                <div class="seccion_suplementos" id="SECCION_GESTORCOBRO"></div>-->
                                                <div style="clear:both;">
                                                    <hr class="titulo">
                                                </div> 
                                            </td>
                                        </tr>
                                        <tr id="DSP_GESTORCOBRO_children" style="display:none">
                                            <td align="left" >
                                                <div class="displayspace">
                                                     <c:set var="title0"><axis:alt f="axisctr120" c="CTIPDOC" lit="109774" /></c:set>
                                                     <c:set var="title1"><axis:alt f="axisctr120" c="TDOCUME" lit="105330" /></c:set>
                                                     <c:set var="title2"><axis:alt f="axisctr120" c="TNOMBRE" lit="105940" /></c:set>  
                                                     <c:set var="title5"><axis:alt f="axisctr120" c="TDOMICI" lit="101078" /></c:set>
                                                     <display:table name="${gestorescobro}" id="gestorescobro" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                                                     requestURI="axis_${pantalla}.do?paginar=true&tabla=tomador"> 
                                                       <%@ include file="../include/displaytag.jsp"%>
                                                       <display:column title="${title0}" sortable="true" sortProperty="OB_IAX_GESCOBROS.TTIPIDE" headerClass="sortable"  style="width:15%" media="html" autolink="false" >
                                                           <div class="dspText">${gestorescobro.OB_IAX_GESCOBROS.TTIPIDE}</div>
                                                       </display:column>
                                                       <display:column title="${title1}" sortable="true" sortProperty="OB_IAX_GESCOBROS.NNUMIDE" headerClass="headwidth5 sortable" style="width:15%" media="html" autolink="false" >
                                                           <div class="dspText">${gestorescobro.OB_IAX_GESCOBROS.NNUMIDE}</div>
                                                       </display:column>
                                                       <display:column title="${title2}" sortable="true" sortProperty="OB_IAX_GESCOBROS.TNOMBRE" headerClass="sortable" style="width:25%" media="html" autolink="false" >
                                                           <div class="dspText">${gestorescobro.OB_IAX_GESCOBROS.TAPELLI1} ${gestorescobro.OB_IAX_GESCOBROS.TAPELLI2}, ${gestorescobro.OB_IAX_GESCOBROS.TNOMBRE}</div>
                                                       </display:column>                                                                 
                                                       <display:column title="${title5}" sortable="true" sortProperty="OB_IAX_GESCOBROS.DIRECCIONES[0].OB_IAX_DIRECCIONES.TDOMICI" headerClass="sortable" style="width:40%" media="html" autolink="false" >
                                                           <div class="dspText">${gestorescobro.OB_IAX_GESCOBROS.TDOMICIGESTCOBRO}</div>
                                                       </display:column> 
                                                    </display:table> 
                                                </div>
                                                <div class="separador">&nbsp;</div>
                                            </td> 
                                        </tr>
                                    </c:if>
                                </axis:visible>                                    


                                <axis:visible c="DSP_TOMADORES" f="${pantalla}">
                                    <c:if test="${!empty tomadores && fn:length(tomadores)>0}">
                                        <tr>
                                            <td class="campocaja" >
                                                <div style="float:left;">
                                                    <img  id="DSP_TOMADOR_parent" src="images/mes.gif" onclick="objEstilos.toggleDisplay('DSP_TOMADOR', this)" style="cursor:pointer"/> 
                                                     <b id="label_NTOMADOR"><axis:alt f="axisctr120" c="NTOMADOR" lit="1000380" /></b>&nbsp;&nbsp;<c:if test="${tomadores[0].OB_IAX_TOMADORES.TTIPIDE!=null}" >${tomadores[0].OB_IAX_TOMADORES.TTIPIDE}&nbsp;-&nbsp;</c:if>${tomadores[0].OB_IAX_TOMADORES.NNUMIDE} - ${datos_poliza.TNOMTOM}
                                                </div>
                                                <!--<div style="float:right;" id="TOMADORES"></div>
                                                <div class="seccion_suplementos" id="SECCION_TOMADORES"></div>-->
                                                <div style="clear:both;">
                                                    <hr class="titulo">
                                                </div>
                                            </td>
                                        </tr>
                                        <tr id="DSP_TOMADOR_children" style="display:none">
                                            <td align="left" >
                                                <div class="displayspace">
                                                     <c:set var="title0"><axis:alt f="axisctr120" c="CTIPDOC" lit="109774" /></c:set>
                                                     <c:set var="title1"><axis:alt f="axisctr120" c="TDOCUME" lit="105330" /></c:set>
                                                     <c:set var="title2"><axis:alt f="axisctr120" c="TNOMBRE" lit="105940" /></c:set>                               
                                                     <c:set var="title3"><axis:alt f="axisctr120" c="NSEXO" lit="100962" /></c:set>
                                                     <c:set var="title4"><axis:alt f="axisctr120" c="FNACIMI" lit="1000064" /></c:set>
                                                     <c:set var="title5"><axis:alt f="axisctr120" c="TDOMICI" lit="101078" /></c:set>
                                                     <display:table name="${tomadores}" id="tomadores" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                                                     requestURI="axis_${pantalla}.do?paginar=true&tabla=tomador"> 
                                                       <%@ include file="../include/displaytag.jsp"%>
                                                       <display:column title="${title0}" sortable="true" sortProperty="OB_IAX_TOMADORES.TTIPIDE" headerClass="sortable"  style="width:11%" media="html" autolink="false" >
                                                           <div class="dspText">${tomadores.OB_IAX_TOMADORES.TTIPIDE} </div> 
                                                           <c:forEach  items="${tomadores.OB_IAX_TOMADORES.CONTACTOS}" var="varcontacto">
                                                               <c:if test="${varcontacto.OB_IAX_CONTACTOS.CTIPCON == 3}">
                                                                    <input id="CONTACTOEMAIL" name="CONTACTOEMAIL" type="hidden" value="${varcontacto.OB_IAX_CONTACTOS.TVALCON}">
                                                               </c:if>
                                                           </c:forEach>
                                                       </display:column>
                                                       <display:column title="${title1}" sortable="true" sortProperty="OB_IAX_TOMADORES.NNUMIDE" headerClass="headwidth5 sortable"  media="html" autolink="false" >
                                                           <div class="dspText">${tomadores.OB_IAX_TOMADORES.NNUMIDE}</div>
                                                       </display:column>
                                                        <display:column title="${title2}" sortable="true" sortProperty="OB_IAX_TOMADORES.TNOMBRE" headerClass="sortable" style="width:23%" media="html" autolink="false" >
                                                           <div class="dspText">${tomadores.OB_IAX_TOMADORES.TAPELLI1} ${tomadores.OB_IAX_TOMADORES.TAPELLI2}, ${tomadores.OB_IAX_TOMADORES.TNOMBRE}</div>
                                                       </display:column>
                                                        <display:column title="${title3}" sortable="true" sortProperty="OB_IAX_TOMADORES.TSEXPER" headerClass="headwidth5 sortable"  media="html" autolink="false" >
                                                           <div class="dspText">${tomadores.OB_IAX_TOMADORES.TSEXPER}</div>
                                                       </display:column>                                   
                                                        <display:column title="${title4}" sortable="true" sortProperty="OB_IAX_TOMADORES.FNACIMI" headerClass="sortable" style="width:20%" media="html" autolink="false" >
                                                           <div class="dspText"><fmt:formatDate value='${tomadores.OB_IAX_TOMADORES.FNACIMI}' pattern='dd/MM/yyyy'/></div>
                                                       </display:column>                                                                      
                                                       <display:column title="${title5}" sortable="true" sortProperty="OB_IAX_TOMADORES.DIRECCIONES[0].OB_IAX_DIRECCIONES.TDOMICI" headerClass="sortable" style="width:33%" media="html" autolink="false" >
                                                           <div class="dspText">${tomadores.OB_IAX_TOMADORES.DIRECCIONES[0].OB_IAX_DIRECCIONES.TDOMICI}</div>
                                                       </display:column> 
                                                     </display:table>
                                                </div>
                                            </td> 
                                        </tr>
                                    </c:if>
                                </axis:visible>