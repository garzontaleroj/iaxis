<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ page contentType="text/html;charset=windows-1252"%>

<c:set var="pantalla" value="axispro001_gestion"/>

<script type="text/javascript">
    function f_aceptar_axispro005(pantalla_que_llama) {
        //Que pantalla modal llama a esta función. En función de quien sea, lo borramos
        if(!objUtiles.estaVacio(pantalla_que_llama) && objUtiles.utilEquals(pantalla_que_llama, "axispro005")) 
            f_cerrar_modal("axispro005");
        else if(!objUtiles.estaVacio(pantalla_que_llama) && objUtiles.utilEquals(pantalla_que_llama, "axispro011")) 
            f_cerrar_modal("axispro011");
        objDom.setValorComponente(document.miForm.subpantalla, "gestion");
        objUtiles.ejecutarFormulario("axis_axispro001.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);
    }
</script>

<form name="${pantalla}">

<input type="hidden" name="subpantalla" value="${pantalla}"/>
            <!-- Seccion Datos Gestion -->
                <div class="notitulo"></div>
                                <div class="notitulo"></div>
                                <table class="seccion" align="center" cellpadding="0" cellspacing="5" style="padding-left:1%;">
                                    <tr>
                                        <td align="left">
                                            <tr>
                                                <th style="width:25%;height:0px"></th>
                                                <th style="width:25%;height:0px"></th>
                                                <th style="width:25%;height:0px"></th>
                                                <th style="width:25%;height:0px"></th>
                                            </tr>
                                            <tr>
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axispro001" c="TIT1" lit="1000120" /></b>
                                                </td>
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axispro001" c="TIT2" lit="1000466"/></b>
                                                </td>
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axispro001" c="TIT3" lit="1000467"/></b>
                                                </td>
                                                <td rowspan="2">
                                                    <table>
                                                        <tr>
                                                            <td>
                                                                 <!-- DisplayTag Lista de duraciones permitidas -->
                                                                <c:set var="title0"><axis:alt f="axispro001" c="DURPERIOD" lit="152979" /></c:set>
                                                                <div class="displayspace" style="height:45px;">
                                                                    <display:table name="${mntproducto.GESTION.DURPERIODOPROD}" id="LISTA" export="false" class="dsptgtable" pagesize="6" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                                                                    requestURI="axis_axispro001.do?paginar=true&operation=gestion">
                                                                    <%@ include file="../include/displaytag.jsp"%>
                                                                        <display:column title="${title0}" sortable="true" sortProperty="OB_IAX_PRODDURPERIODO.NDURPER" headerClass="sortable" media="html" autolink="false" >
                                                                            <div class="dspText">${LISTA.OB_IAX_PRODDURPERIODO.NDURPER}</div>
                                                                        </display:column>
                                                                   </display:table>
                                                                </div>
                                                            <td>
                                                                <axis:visible f="axispro001" c="EDIT_DURACION">
                                                                <div style="float:right;">
                                                                    <a href="javascript:f_abrir_modal('axispro011')">
                                                                        <img border="0" alt="<axis:alt f="axispro001" c="EDIT" lit="100002"/> <axis:alt f="axispro001" c="EDIT" lit="152979"/>" title="<axis:alt f="axispro001" c="EDIT" lit="100002"/> <axis:alt f="axispro001" c="EDIT" lit="152979"/>" src="images/lapiz.gif"/>
                                                                    </a>
                                                                </div>
                                                                </axis:visible>
                                                            </td>
                                                            </td>
                                                        </tr>
                                                    </table>
                                      </td>     
                            </tr>
                            <tr>
                                <td class="campocaja">
                                    <input type="text" class="campowidthinput campo campotexto" id="TDURACI" name="TDURACI" size="15"
                                    value="${mntproducto.GESTION.TDURACI}" readonly="true" />
                                </td>
                                <td class="campocaja">                                        
                                    <input type="text" class="campowidthinput campo campotexto" id="TTEMPOR" name="TTEMPOR" size="15"
                                        value="${mntproducto.GESTION.TTEMPOR}" readonly="true" />
                                </td> 
                                <td class="campocaja">                                        
                                    <input type="text"  class="campowidthinputsmall campo campotexto" id="NDURCOB" name="NDURCOB" size="15"
                                        value="${mntproducto.GESTION.NDURCOB}" readonly="true" />
                                </td>
                                    </tr>
                                            <tr>
                                            <c:if test="${!empty mntproducto.GESTION.CDURMIN}">
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axispro001" c="CDURMIN" lit="1000468" /></b>
                                                </td>
                                                
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axispro001" c="NVTOMIN" lit="9000510" /></b>
                                                </td>
                                                </c:if>
                                                 <c:if test="${!empty mntproducto.GESTION.CDURMAX}">
                                                <td class="titulocaja" >
                                                    <b><axis:alt f="axispro001" c="TDURMAX" lit="1000469" /></b>
                                                </td>
                                               
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axispro001" c="NVTOMAX" lit="9000511" /></b>
                                                </td>
                                                </c:if>
                                            </tr>
                                            <tr>
                                            <c:if test="${!empty mntproducto.GESTION.CDURMIN}">
                                                 <td class="campocaja">
                                                    <input type="text" class="campowidthinput campo campotexto" id="TDURMIN" name="TDURMIN" size="15"
                                                    value="${mntproducto.GESTION.TDURMIN}" readonly="true" />
                                                </td>
                                                 
                                                 <td class="campocaja"> 
                                                    <input type="text" class="campowidthinput campo campotexto" id="NVTOMIN" name="NVTOMIN" size="15"
                                                        value="${mntproducto.GESTION.NVTOMIN}" readonly="true" />
                                                 </td> 
                                                 </c:if>
                                              <c:if test="${!empty mntproducto.GESTION.CDURMAX}">   
                                               <td class="campocaja">
                                                    <input type="text" class="campowidthinput campo campotexto" id="TDURMAX" name="TDURMAX" size="15"
                                                    value="${mntproducto.GESTION.TDURMAX}" readonly="true" />
                                                </td>
                                                 
                                                <td class="campocaja">
                                                            <input formato="entero" maxlength="2" type="text" class="campowidthinput campo campotexto" id="NVTOMAX" name="NVTOMAX" size="15"
                                                            value="${mntproducto.GESTION.NVTOMAX}" readonly/>
                                                </td>
                                                </c:if>
                                            </tr>
                                        </td>
                                    </tr>
                                </table>
                                <!--SEGUNDA SUBSECCION -->
                                <div class="notitulo">&nbsp;</div>
                                <table class="seccion" align="center" cellpadding="0" cellspacing="5">
                                    <tr>
                                        <td align="left">
                                            <tr>
                                                    <th style="width:25%;height:0px"></th>
                                                    <th style="width:25%;height:0px"></th>
                                                    <th style="width:25%;height:0px"></th>
                                                    <th style="width:25%;height:0px"></th>
                                            </tr>
                                            <tr>
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axispro001" c="CMODNRE" lit="1000470" /></b>
                                                </td>
                                                <c:if test="${mntproducto.GESTION.CTIPEFE==1}">
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axispro001" c="CPRODCAR" lit="1000597" /></b>
                                                </td>
                                                </c:if>
                                                <td class="titulocaja" >
                                                    <b><axis:alt f="axispro001" c="CMOD" lit="1000290"/></b>
                                                    <input <c:if test="${mntproducto.GESTION.CMODNRE == 1}">checked</c:if>  onClick="javascript:actualitzarCheckbox(this)"
                                                    type="checkbox" disabled  id="CMODNRE" name="CMODNRE" value="${__formdata.CMODNRE}" />
                                                </td> 
                                                
                                                <td class="titulocaja" >
                                                    <b><axis:alt f="axispro001" c="POCAR" lit="112523"/></b>
                                                    <input <c:if test="${mntproducto.GESTION.CPRODCAR == 1}">checked</c:if> 
                                                    type="checkbox" disabled  id="CPRODCAR" name="CPRODCAR" value="${__formdata.CPRODCAR}" />
                                                </td> 
                                               
                                                                         
                                            </tr>
                                            <tr>
                                                <td class="campocaja">
                                                    <input type="text" class="campowidthinput campo campotexto" id="TTIPEFE" name="TTIPEFE" size="15"
                                                    value="${mntproducto.GESTION.TTIPEFE}" readonly="true" />
                                                </td>
                                                <c:if test="${mntproducto.GESTION.CTIPEFE==1}">
                                                <td class="campocaja">
                                                    <input type="text" class="campowidthinput campo campotexto" id="NRENOVA" name="NRENOVA" size="15"
                                                    value="${mntproducto.GESTION.NRENOVA}" readonly  />
                                                </td>
                                                </c:if>
                                                 
                                            </tr>
                                            <tr>
                                                <c:choose>
                                                    <c:when test="${mntproducto.GESTION.CREVALI == 2 || mntproducto.GESTION.CREVALI == 6 || mntproducto.GESTION.CREVALI == 1}">
                                                           <td class="titulocaja" colspan="2">
                                                    </c:when>
                                                    <c:otherwise>
                                                        <td class="titulocaja">
                                                    </c:otherwise>
                                                </c:choose>
                                                    <b><axis:alt f="axispro001" c="TREVALI" lit="109951" /></b>
                                                </td>
                                                <td class="titulocaja" >
                                                    <b><axis:alt f="axispro001" c="TTARMAN" lit="100772" /></b>
                                                </td>
                                                
                                            </tr>
                                            <tr>
                                             
                                                <td class="campocaja">
                                                    <input type="text" class="campowidthinput campo campotexto" id="TREVALI" name="TREVALI" size="15"
                                                    value="${mntproducto.GESTION.TREVALI}" readonly="true" />
                                                </td>
                                                 <c:if test="${mntproducto.GESTION.CREVALI == 2 || mntproducto.GESTION.CREVALI == 6}">
                                                <td class="campocaja">   
                                                   <input type="text" style="width:90%" class="campowidthinputsmall campo campotexto" id="PREVALI" name="PREVALI" size="15"
                                                    value="<fmt:formatNumber pattern='###.##' value='${mntproducto.GESTION.PREVALI}'/>" readonly="true" />%
                                                </td>
                                                </c:if>
                                                <c:if test="${mntproducto.GESTION.CREVALI == 1}">
                                                <td class="campocaja">   
                                                    <input type="text" class="campowidthinputsmall campo campotexto" id="IREVALI" name="IREVALI" size="15"
                                                    value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONEDAPROD]}' value='${mntproducto.GESTION.IREVALI}'/>" readonly="true" />
                                                </td>                         
                                                </c:if>
                                                <td  class="campocaja"> 
                                                        <input type="text" class="campowidthinputbig campo campotexto" id="TTARMAN" name="TTARMAN" size="15"
                                                         value="${mntproducto.GESTION.TTARMAN}" readonly="true" />
                                                </td>
                                            </tr>
                                        </td>
                                    </tr>
                                </table>
                                <!--TERCERA SUBSECCION -->
                                <div class="notitulo">&nbsp;</div>
                                <table class="seccion" align="center" cellpadding="0" cellspacing="5">                
                                    <tr>
                                        <td align="left">
                                            <tr>
                                                    <th style="width:100%;height:0px"></th>
                                            </tr>
                                            <tr>
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axispro001" c="TREASEG" lit="100956" /></b>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="campocaja">
                                                    <input type="text"  style="width:20%" class="campowidthinput campo campotexto" id="TREASEG" name="TREASEG" size="15"
                                                    value="${mntproducto.GESTION.TREASEG}" readonly="true" />
                                                </td>
                                            </tr>
                                        </td>
                                    </tr>
                                </table>
                                <!--CUARTA SUBSECCION -->
                                <div class="notitulo">&nbsp;</div>
                                <table class="seccion" align="center" cellpadding="0" cellspacing="5">
                                    <tr>
                                        <td align="left">
                                            <tr>
                                                <th style="width:25%;height:0px"></th>
                                                <th style="width:25%;height:0px"></th>
                                                <th style="width:25%;height:0px"></th>
                                                <th style="width:25%;height:0px"></th>
                                            </tr>
                                            <tr>
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axispro001" c="TRETENI" lit="1000471" /></b>
                                                </td>
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axispro001" c="TPROPORRA" lit="1000472"/></b>
                                                </td>
                                                
                                            </tr>
                                            <tr>
                                                <td class="campocaja">
                                                   <input type="text" class="campowidthinput campo campotexto" id="TRETENI" name="TRETENI" size="15"
                                                    value="${mntproducto.GESTION.TRETENI}" readonly="true" />
                                                </td>
                                                <td class="campocaja" >                                        
                                                    <input type="text" class="campowidthinputmiddlepercent campo campotexto" id="TPRORRA" name="TPRORRA" size="15"
                                                    value="${mntproducto.GESTION.TPRORRA}" readonly="true" />
                                                </td>
                                                <tr>
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axispro001" c="TRIPIMIN" lit="1000473" /></b>
                                                </td>
                                                 <c:if test="${mntproducto.GESTION.CPRIMIN==0}"> 
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axispro001" c="IPRIMIN" lit="1000477"/></b>
                                                </td>
                                                </c:if>
                                                
                                                 <c:if test="${mntproducto.GESTION.CPRIMIN==1}"> 
                                                <td class="titulocaja" colspan="2">
                                                    <b><axis:alt f="axispro001" c="TCLAPRI" lit="108347"/>&nbsp;<axis:alt f="axispro001" c="TCLAPRI2" lit="1000491"/></b>
                                                </td>
                                                </c:if>
                                                <td class="titulocaja" colspan="2">
                                                    <b><axis:alt f="axispro001" c="IPMINFRA" lit="109608"/></b>
                                                </td>
                                                </tr>
                                                <tr>
                                                <td class="campocaja">
                                                    <input type="text" class="campowidthinput campo campotexto" id="TPRIMIN" name="TPRIMIN" size="15"
                                                    value="${mntproducto.GESTION.TPRIMIN}" readonly="true" />
                                                </td>
                                                <c:if test="${mntproducto.GESTION.CPRIMIN==0}"> 
                                                <td class="campocaja">
                                                        <input type="text" class="campowidthinputmiddlepercent campo campotexto" id="IPRIMIN" name="IPRIMIN" size="15"
                                                        value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONEDAPROD]}' value='${mntproducto.GESTION.IPRIMIN}'/>" readonly="true" />
                                                </td>
                                                </c:if>
                                                
                                                <c:if test="${mntproducto.GESTION.CPRIMIN==1}"> 
                                                <td class="campocaja" colspan="2">
                                                        <input type="text" class="campowidthinputmiddlepercent campo campotexto" id="TCLAPRI" name="TCLAPRI" size="15"
                                                        value="${mntproducto.GESTION.TCLAPRI}" readonly="true" />
                                                </td>
                                                </c:if>
                                                
                                                <td class="campocaja">     
                                                    <input type="text" class="campowidthinput campo campotexto" id="IPMINFRA" name="IPMINFRA" size="15"
                                                    value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONEDAPROD]}' value='${mntproducto.GESTION.IPMINFRA}'/>" readonly="true" />
                                                </td>
                                                <td></td>
                                            </tr>
                                        </td>
                                    </tr>
                                </table>
                                <!--QUINTA SUBSECCION -->
                                <div class="notitulo">&nbsp;</div>
                                <table class="seccion" align="center" cellpadding="0" cellspacing="5">
                                    <tr>
                                        <td align="left">
                                            <tr>
                                                <th style="width:16.66%;height:0px"></th>
                                                <th style="width:16.66%;height:0px"></th>
                                                <th style="width:16.66%;height:0px"></th>
                                                <th style="width:16.66%;height:0px"></th>
                                                <th style="width:16.66%;height:0px"></th>
                                                <th style="width:16.66%;height:0px"></th>
                                            </tr>
                                            <tr>
                                                <td class="campocaja" align="left" colspan="2">
                                                    <b><axis:alt f="axispro001" c="CIEDMIC" lit="9001544"/></b>
                                                    <input  <c:if test="${mntproducto.GESTION.CIEDMIC == 1}">checked</c:if> 
                                                    type="checkbox" disabled  id="CIEDMIC" name="CIEDMIC" value="${mntproducto.GESTION.CIEDMIC}" />&nbsp;&nbsp;
                                                    
                                                    <input maxlength="3" type="text" class="campowidthinput campo campotexto" style="width:10%" id="NEDAMIC" name="NEDAMIC" size="15"
                                                    value="${mntproducto.GESTION.NEDAMIC}" readonly="true" formato="entero" title="<axis:alt f="axispro001" c="NEDAMIC" lit="100717" />"/>
                                                </td>   
                                                <%-- <c:if test="${mntproducto.GESTION.CIEDMIC==1}"> --%>
                                                <%--</c:if>--%>
                                               
                                                <td class="campocaja" align="left" colspan="2">
                                                    <b><axis:alt f="axispro001" c="CIEDMAC" lit="9001545"/></b>
                                                    <input <c:if test="${mntproducto.GESTION.CIEDMAC == 1}">checked</c:if> 
                                                    type="checkbox" disabled id="CIEDMAC"  name="CIEDMAC" value="${mntproducto.GESTION.CIEDMAC}" />&nbsp;&nbsp;
                                                    
                                                    <input maxlength="3" type="text" class="campowidthinput campo campotexto" style="width:10%" id="NEDAMAC" name="NEDAMAC" size="15"
                                                    value="${mntproducto.GESTION.NEDAMAC}" readonly="true" formato="entero" title="<axis:alt f="axispro001" c="NEDAMAC" lit="100718" />"/>
                                                </td>  
                                                <%--<c:if test="${mntproducto.GESTION.CIEDMAC==1}"> --%>
                                                <%--</c:if>--%>
                                                <td class="campocaja" align="left" colspan="2">
                                                    <b><axis:alt f="axispro001" c="CIEDMAR" lit="9001546"/></b>
                                                    <input <c:if test="${mntproducto.GESTION.CIEDMAR == 1}">checked</c:if> 
                                                    type="checkbox" disabled id="CIEDMAR"  name="CIEDMAR" value="${mntproducto.GESTION.CIEDMAR}" />&nbsp;&nbsp;
                                                    
                                                    <input maxlength="3" type="text" class="campowidthinput campo campotexto" style="width:10%" id="NEDAMAR" name="NEDAMAR" size="15"
                                                    value="${mntproducto.GESTION.NEDAMAR}" readonly="true" formato="entero" title="<axis:alt f="axispro001" c="NEDAMAR" lit="100719" />"/>
                                                </td>
                                                <%-- <c:if test="${mntproducto.GESTION.CIEDMAR==1}"> --%>
                                                <%--</c:if>--%>
                                            </tr>
                                            <tr>
                                              
                                                
                                                
                                            </tr>
                                            <c:if test="${!empty OB_IAX_PRODUCTO.C2CABEZAS && OB_IAX_PRODUCTO.C2CABEZAS == 1}">
                                            <tr>
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axispro001" c="CIEMI2C" lit="1000122"/></b>
                                                    <input <c:if test="${mntproducto.GESTION.CIEMI2C == 1}">checked</c:if> 
                                                    type="checkbox" disabled id="CIEMI2C" name="CIEMI2C" value="${mntproducto.GESTION.CIEMI2C}" />
                                                </td>
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axispro001" c="CIEMA2C" lit="9001548"/></b>
                                                    <input <c:if test="${mntproducto.GESTION.CIEMA2C == 1}">checked</c:if> 
                                                    type="checkbox" disabled id="CIEMA2C" name="CIEMA2C" value="${mntproducto.GESTION.CIEMA2C}" />
                                                </td>
                                                <td class="titulocaja">
                                                     <b><axis:alt f="axispro001" c="CIEMA2R" lit="9001547"/></b>
                                                     <input <c:if test="${mntproducto.GESTION.CIEMA2R == 1}">checked</c:if> 
                                                    type="checkbox"  disabled id="CIEMA2R" name="CIEMA2R" value="${mntproducto.GESTION.CIEMA2R}" />
                                                </td>
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axispro001" c="CISEMAC" lit="9001549"/></b>
                                                    <input <c:if test="${mntproducto.GESTION.CISEMAC == 1}">checked</c:if> 
                                                    type="checkbox" disabled id="CISEMAC" name="CISEMAC" value="${mntproducto.GESTION.CISEMAC}" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="campocaja">
                                                    <input maxlength="3" type="text" class="campowidthinputbig campo campotexto" id="NEDMI2C" name="NEDMI2C" size="15"
                                                    value="${mntproducto.GESTION.NEDMI2C}" readonly="true" formato="entero" title="<axis:alt f="axispro001" c="NMI2C" lit="1000122" />"/>
                                                </td>
                                                <td class="campocaja">
                                                    <input maxlength="3" type="text" class="campowidthinputbig campo campotexto" id="NEDMA2C" name="NEDMA2C" size="15"
                                                    value="${mntproducto.GESTION.NEDMA2C}" readonly="true" formato="entero" title="<axis:alt f="axispro001" c="NMA2C" lit="1000121" />"/>
                                                </td>
                                                <td class="campocaja">
                                                    <input maxlength="3" type="text" class="campowidthinputbig campo campotexto" id="NEDMA2R" name="NEDMA2R" size="15"
                                                    value="${mntproducto.GESTION.NEDMA2R}" readonly="true" formato="entero" title="<axis:alt f="axispro001" c="NMA2R" lit="1000123" />"/>
                                                </td>
                                                <td class="campocaja">
                                                    <input type="text" class="campowidthinputbig campo campotexto" id="NSEDMAC" name="NSEDMAC" size="15"
                                                    value="${mntproducto.GESTION.NSEDMAC}" readonly="true"  formato="entero" title="<axis:alt f="axispro001" c="NMIAC" lit="1000353" />"/>
                                                </td>
                                            </tr>
                                            </c:if>
                                         </td>
                                    </tr>
                                </table>
                                <!--SEXTA SUBSECCION -->
                                <div class="notitulo">&nbsp;</div>
                                <table class="seccion" align="center" cellpadding="0" cellspacing="5">
                                    <tr>
                                        <td align="left">
                                            <tr>
                                                <th style="width:20%;height:0px"></th>
                                                <th style="width:20%;height:0px"></th>
                                                <th style="width:20%;height:0px"></th>
                                                <th style="width:20%;height:0px"></th>
                                                <th style="width:20%;height:0px"></th>
                                            </tr>
                                            <tr>        
                                <td class="titulocaja" >
                                    <b><axis:alt f="axispro001" c="CVINPOL" lit="1000474" /></b>
                                    <input <c:if test="${mntproducto.GESTION.CVINPOL == 1}">checked</c:if> 
                                        type="checkbox" id="CVINPOL" name="CVINPOL" value="${mntproducto.GESTION.CVINPOL}" disabled/>
                                </td>                           
                                <td class="titulocaja" >
                                    <b><axis:alt f="axispro001" c="CVINPRE" lit="9000507" /></b>
                                    <input <c:if test="${mntproducto.GESTION.CVINPRE == 1}">checked</c:if> 
                                        type="checkbox" id="CVINPRE" name="CVINPRE" value="${mntproducto.GESTION.CVINPRE}" disabled/>
                                </td>                           
                                <td class="titulocaja" >
                                    <b><axis:alt f="axispro001" c="CCUESTI" lit="104734" /></b>
                                    <input <c:if test="${mntproducto.GESTION.CCUESTI == 1}">checked</c:if> 
                                        type="checkbox" id="CCUESTI"" name="CCUESTI"" value="${mntproducto.GESTION.CCUESTI}" disabled/>
                                </td>                           
                                <td class="titulocaja" >
                                    <b><axis:alt f="axispro001" c="CCTACOR" lit="151638" /></b>
                                    <input <c:if test="${mntproducto.GESTION.CCTACOR == 1}">checked</c:if> 
                                        type="checkbox" id="CCTACOR" name="CCTACOR" value="${mntproducto.GESTION.CCTACOR}" disabled/>
                                </td> 
                                <axis:ocultar c="CPREAVISO" f="axispro001" dejarHueco="false">
	                                <td class="titulocaja" >
	                                    <b><axis:alt f="axispro001" c="CPREAVISO" lit="9903597" /></b>
	                                    <input <c:if test="${mntproducto.GESTION.CPREAVISO == 1}">checked</c:if> 
	                                        type="checkbox" id="CPREAVISO" name="CPREAVISO" value="${mntproducto.GESTION.CPREAVISO}" disabled/>
	                                </td>
                                </axis:ocultar>
                            </tr>
                                        </td>
                                    </tr>
                                </table>
                            
                
                <!-- FIN SUBSECCIONES -->
          <!-- Fin seccion -->

</form>