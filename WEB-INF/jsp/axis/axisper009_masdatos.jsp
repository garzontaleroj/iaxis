<%/* Revision:# NQr6MApMrdXST2EVmPIjDw== # */%>
<%@ page contentType="text/html;charset=windows-1252" errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page import="axis.util.Constantes"%>
<%@ page import="java.util.*"%>
<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<% String CMODO = (String) axis.mvc.control.AbstractDispatchAction.topPila(request, "CMODO"); %>
<c:set var="ocultarIconosEdicion">
	<%= "CONSULTA_PERSONA".equals(CMODO) %>
</c:set>



<axis:visible c="DSP_PER_REL" f="axisper009">
    <!-- *************************  PERSONAS RELACIONADAS SIN AGRUPACION ********************* -->
    <div class="titulo"><a name="posicionPorColorcar__PER_REL" id="posicionPorColorcar__PER_REL" ></a>
      <b><axis:alt f="axisper009" c="LIT_DSP_PERREL" lit="9902247"/></b>
    </div>
     <table class="seccion" style="border: none;" onclick="objSeccion.actualizarPosicionPorColocarCookie('axisper009','PER_REL');return true;">
    <axis:visible f="axisper009" c="BT_NVPERREL">
      <c:if test="${! ocultarIconosEdicion && __configform.axisper009__BT_ANADIR_PERREL__visible != 'false'}">
        <div style="float:right;">

          <img border="0" alt="&lt;axis:alt f='axisper009' c='LIT_ANADIR_G' lit='104825'/> &lt;axis:alt f='axisper009' c='LIT_PERREL' lit='9901375'/>" title="&lt;axis:alt f='axisper009' c='LIT_ANADIR_F' lit='104825'/> &lt;axis:alt f='axisper009' c='LIT_PERREL' lit='9901375'/>" src="images/new.gif" onclick="f_abrir_axisper025('${dades_persona.SPERSON}','${FECHA_AGRUPAC}')"/>





        </div>
      </c:if>


    </axis:visible>
     
    <tr>
      <td class="campocaja">
        <a name="posicionPorColorcar__DSP_SAC" id="posicionPorColorcar__DSP_SAC"></a>
        <div style="float:left;">
        <c:if test="${CONT_PERSONAS_REL['0'] >0}"> 
          <img id="DSP_SAC_parent" src="images/mes.gif" onclick="objEstilos.toggleDisplay('DSP_SAC', this);objSeccion.actualizarSeccionPorAbrirCookie('axisper009','DSP_AC${element.CATRIBU}');" style="cursor:pointer"/>
           </c:if>
          
          <b><axis:alt f="axisper009" c="LIT_DSP_SAC" lit="89906196"/>          (${CONT_PERSONAS_REL['0']})</b>
        </div>
        <div style="clear:both;">
          <hr class="titulo"></hr>
        </div>
      </td>
    </tr>
      
      <tr id="DSP_SAC_children" style="display:none">
        <td>
          <c:set var="title1">
            <axis:alt f="axisper009" c="TTIPPER_REL" lit="9902248"/>
          </c:set>
          <c:set var="title2">
            <axis:alt f="axisper009" c="NNUMIDE" lit="105330"/>
          </c:set>
          <c:set var="title3">
            <axis:alt f="axisper009" c="TNOMBRE" lit="105940"/>
          </c:set>
          <c:set var="title4">
            <axis:alt f="axisper009" c="DIRECCION" lit="105889"/>
          </c:set>
          <c:set var="title5">
            <axis:alt f="axisper009" c="TELEFONO" lit="9000992"/>
          </c:set>
          <c:set var="title6">
            <axis:alt f="axisper009" c="MAIL" lit="109792"/>
          </c:set>                              
          <axis:visible f="axisper009" c="PPARTICIPACION">
          <c:set var="title7">
            <axis:alt f="axisper009" c="PPARTICIPACION" lit="104818"/>
          </c:set>  
          <c:set var="title8">
            <axis:alt f="axisper009" c="ISLIDER" lit="9906692"/>
          </c:set> 
          </axis:visible>
          <c:if test="${CONT_PERSONAS_REL['0'] >0}"> 
          <div class="displayspace">
            <display:table name="${dades_persona.PERSONAS_REL}"
                           id="T_IAX_PERSONAS_REL" export="false"
                           class="dsptgtable" pagesize="-1"
                           defaultsort="1"
                           defaultorder="ascending"
                           sort="list" cellpadding="0"
                           cellspacing="0"
                           requestURI="axis_axisper009.do?paginar=true&subpantalla=datosgenerales">
              <%@ include file="../include/displaytag.jsp"%>
              <display:column title="${title1}"
                              sortable="true"
                              sortProperty="OB_IAX_PERSONAS_REL.TTIPPER_REL"
                              headerClass="sortable fixed"
                              media="html" autolink="false">
                <c:if test="${T_IAX_PERSONAS_REL.OB_IAX_PERSONAS_REL.CTIPPER_REL!=0}"> <%--18/01/2019 TCS 468A AP--%> 
                <div class="dspText">
                  ${T_IAX_PERSONAS_REL.OB_IAX_PERSONAS_REL.TTIPPER_REL}
                </div>
                </c:if>
              </display:column>
              <display:column title="${title2}"
                              sortable="true"
                              sortProperty="OB_IAX_PERSONAS_REL.NNUMIDE"
                              headerClass="sortable fixed"
                              media="html" autolink="false">
                <c:if test="${T_IAX_PERSONAS_REL.OB_IAX_PERSONAS_REL.CTIPPER_REL!=0}">  <%--18/01/2019 TCS 468A AP--%> 
                <div class="dspText">
                  ${T_IAX_PERSONAS_REL.OB_IAX_PERSONAS_REL.NNUMIDE}
                </div>
                </c:if>
              </display:column>
              <display:column title="${title3}"
                              sortable="true"
                              sortProperty="OB_IAX_PERSONAS_REL.TNOMBRE"
                              headerClass="sortable fixed"
                              media="html" autolink="false">
                <c:if test="${T_IAX_PERSONAS_REL.OB_IAX_PERSONAS_REL.CTIPPER_REL!=0}"> <%--18/01/2019 TCS 468A AP--%> 
                <div class="dspText">
                    ${T_IAX_PERSONAS_REL.OB_IAX_PERSONAS_REL.TNOMBRE} 
                </div>
                </c:if>
              </display:column>
              <display:column title="${title4}"
                              sortable="true"
                              sortProperty="OB_IAX_PERSONAS_REL.DIRECCION"
                              headerClass="sortable fixed"
                              media="html" autolink="false">
              <c:if test="${T_IAX_PERSONAS_REL.OB_IAX_PERSONAS_REL.CTIPPER_REL!=0}"> <%--18/01/2019 TCS 468A AP--%> 
               <div class="dspText">
                    ${T_IAX_PERSONAS_REL.OB_IAX_PERSONAS_REL.DIRECCION} 
                </div>
                </c:if>
              </display:column>
              <display:column title="${title5}"
                              sortable="true"
                              sortProperty="OB_IAX_PERSONAS_REL.TELEFONO"
                              headerClass="sortable fixed"
                              media="html" autolink="false">
               <c:if test="${T_IAX_PERSONAS_REL.OB_IAX_PERSONAS_REL.CTIPPER_REL!=0}"> <%--18/01/2019 TCS 468A AP--%> 
               <div class="dspText">
                    ${T_IAX_PERSONAS_REL.OB_IAX_PERSONAS_REL.TELEFONO} 
                </div>
                </c:if>
              </display:column>
              <display:column title="${title6}"
                              sortable="true"
                              sortProperty="OB_IAX_PERSONAS_REL.MAIL"
                              headerClass="sortable fixed"
                              media="html" autolink="false">
               <c:if test="${T_IAX_PERSONAS_REL.OB_IAX_PERSONAS_REL.CTIPPER_REL!=0}"> <%--18/01/2019 TCS 468A AP--%> 
               <div class="dspText">
                    ${T_IAX_PERSONAS_REL.OB_IAX_PERSONAS_REL.MAIL} 
                </div>
                </c:if>
              </display:column>    
              <axis:visible f="axisper009" c="PPARTICIPACION">
              <display:column title="${title7}"
                              sortable="true"
                              sortProperty="OB_IAX_PERSONAS_REL.PPARTICIPACION"
                              headerClass="sortable fixed"
                              media="html" autolink="false">
               <c:if test="${T_IAX_PERSONAS_REL.OB_IAX_PERSONAS_REL.CTIPPER_REL!=0}"> <%--18/01/2019 TCS 468A AP--%> 
               <div class="dspText">
                    ${T_IAX_PERSONAS_REL.OB_IAX_PERSONAS_REL.PPARTICIPACION} 
                </div>
                </c:if>
              </display:column>    
              </axis:visible> 
              
               <axis:visible f="axisper009" c="ISLIDER">
              <display:column title="${title8}"
                              sortable="true"
                              sortProperty="OB_IAX_PERSONAS_REL.ISLIDER"
                              headerClass="sortable fixed"
                              media="html" autolink="false">
               <c:if test="${T_IAX_PERSONAS_REL.OB_IAX_PERSONAS_REL.CTIPPER_REL!=0}"> <%--18/01/2019 TCS 468A AP--%> 
               <div class="dspText">
                    <c:if test="${T_IAX_PERSONAS_REL.OB_IAX_PERSONAS_REL.ISLIDER==0}"> 
                  <axis:alt f='axisper009' c='NO' lit='101779'/>
                   </c:if>
                   <c:if test="${T_IAX_PERSONAS_REL.OB_IAX_PERSONAS_REL.ISLIDER==1}"> 
                 <axis:alt f='axisper009' c='SI' lit='101778'/>
                   </c:if>
                </div>
                </c:if>
              </display:column>    
              </axis:visible> 
              
             
              <axis:visible f="axisper009" c="BT_DELPERREL">
              <c:if test="${! ocultarIconosEdicion && __configform.axisper009__BT_BORRAR_PERREL__visible != 'false'}">
                <display:column title="" sortable="false"
                                sortProperty=""
                                headerClass="headwidth5 sortable fixed"
                                media="html"
                                autolink="false">
                  <c:if test="${T_IAX_PERSONAS_REL.OB_IAX_PERSONAS_REL.CTIPPER_REL!=0}"> <%--18/01/2019 TCS 468A AP--%> 
                  <div class="dspIcons">
                    
                      <img border="0"
                           alt="<axis:alt f='axisper009' c='LIT_ELIMINAR' lit='1000127'/> <axis:alt f='axisper009' c='LIT_PERREL' lit='9901375'/>"
                           title="<axis:alt f='axisper009' c='LIT_ELIMINAR' lit='1000127'/> <axis:alt f='axisper009' c='LIT_PERREL' lit='9901375'/>"
                           src="images/delete.gif"
                           onclick="f_borrar_persona_rel('${T_IAX_PERSONAS_REL.OB_IAX_PERSONAS_REL.SPERSON_REL}','${dades_persona.SPERSON}','${dades_persona.CAGENTE}','${T_IAX_PERSONAS_REL.OB_IAX_PERSONAS_REL.CAGRUPA}')"/>
                    
                  </div>
                  </c:if>
                </display:column>
              </c:if>
              </axis:visible>
              
               <axis:visible f="axisper009" c="BT_CONS_PERREL">              
                <display:column title="" sortable="false"
                                sortProperty=""
                                headerClass="headwidth5 sortable fixed"
                                media="html"
                                autolink="false">
                 <c:if test="${T_IAX_PERSONAS_REL.OB_IAX_PERSONAS_REL.CTIPPER_REL!=0}"> <%--18/01/2019 TCS 468A AP--%> 
                  <div class="dspIcons">
                    
                      <img border="0"
                           alt="<axis:alt f='axisper009' c='LIT_MASDATOS' lit='1000439'/> <axis:alt f='axisper009' c='LIT_PERREL' lit='9901375'/>"
                           title="<axis:alt f='axisper009' c='LIT_MASDATOS' lit='1000439'/> <axis:alt f='axisper009' c='LIT_PERREL' lit='9901375'/>"
                           src="images/mas.gif"
                           onclick="f_consultar_per_rel('${T_IAX_PERSONAS_REL.OB_IAX_PERSONAS_REL.SPERSON_REL}','${dades_persona.CAGENTE}')"/>
                    
                  </div>
                  </c:if>
                </display:column>
             
              </axis:visible>
            </display:table>
          </div>
          </c:if>
          
        </td>
      </tr>
    </table>
	
    <!-- *************************  PERSONAS RELACIONADAS CON AGRUPACION ********************* -->
    
     <c:forEach var="element" items="${__formdata.listValores.agrupacionesConsorcio }" varStatus="loop">
    <c:if test="${ loop.index  != fn:length(__formdata.listValores.agrupacionesConsorcio )}">
      <table class="seccion" style="border: none;" onclick="objSeccion.actualizarPosicionPorColocarCookie('axisper009','PER_REL');return true;">
    
     
    <tr>
      <td class="campocaja">
        <a name="posicionPorColorcar__DSP_AC${element.CATRIBU}" id="posicionPorColorcar__DSP_AC${element.CATRIBU}"></a>
        <div style="float:left;">
          <img id="DSP_AC${element.CATRIBU}_parent" src="images/mes.gif" onclick="objEstilos.toggleDisplay('DSP_AC${element.CATRIBU}', this);objSeccion.actualizarSeccionPorAbrirCookie('axisper009','DSP_AC${element.CATRIBU}');" style="cursor:pointer"/>
          <c:set var="var" value="element.CATRIBU.toString()"  />
          <c:set var="idAsString">${element.CATRIBU}</c:set>
           <c:set var="ContAC" value="${CONT_PERSONAS_REL[idAsString]}"  />
          <b>  <axis:alt f="axisper009" c="LIT9" lit="111471"/> ${element.TATRIBU}          (${ContAC}) </b>&nbsp;&nbsp;</b>
      
        <c:out value="${CONT_PERSONAS_REL[var]}"/>
         
        
        

         
       
       
        </div>
        <div style="clear:both;">
          <hr class="titulo"></hr>
        </div>
      </td>
    </tr>
      
      <tr id="DSP_AC${element.CATRIBU}_children" style="display:none">
        <td>
          <c:set var="title1">
            <axis:alt f="axisper009" c="TTIPPER_REL" lit="9902248"/>
          </c:set>
          <c:set var="title2">
            <axis:alt f="axisper009" c="NNUMIDE" lit="105330"/>
          </c:set>
          <c:set var="title3">
            <axis:alt f="axisper009" c="TNOMBRE" lit="105940"/>
          </c:set>
          <c:set var="title4">
            <axis:alt f="axisper009" c="DIRECCION" lit="105889"/>
          </c:set>
          <c:set var="title5">
            <axis:alt f="axisper009" c="TELEFONO" lit="9000992"/>
          </c:set>
          <c:set var="title6">
            <axis:alt f="axisper009" c="MAIL" lit="109792"/>
          </c:set>                              
          <axis:visible f="axisper009" c="PPARTICIPACION">
          <c:set var="title7">
            <axis:alt f="axisper009" c="PPARTICIPACION" lit="104818"/>
          </c:set>  
          <c:set var="title8">
            <axis:alt f="axisper009" c="ISLIDER" lit="9906692"/>
          </c:set> 
          </axis:visible>
          
          <div class="displayspace">
            <display:table name="${dades_persona.PERSONAS_REL}"

                           uid="T_IAX_PERSONAS_REL" htmlId="T_IAX_PERSONAS_REL${element.CATRIBU}" export="false"
                           class="dsptgtable" pagesize="-1"
                           defaultsort="1"
                           defaultorder="ascending"
                           sort="list" cellpadding="0"
                           cellspacing="0"
                           requestURI="axis_axisper009.do?paginar=true&subpantalla=datosgenerales">
              <%@ include file="../include/displaytag.jsp"%>
              <display:column title="${title1}"
                              sortable="true"
                              sortProperty="OB_IAX_PERSONAS_REL.TTIPPER_REL"
                              headerClass="sortable fixed"
                              media="html" autolink="false">
                <c:if test="${T_IAX_PERSONAS_REL.OB_IAX_PERSONAS_REL.CAGRUPA eq element.CATRIBU}"> 
                <div class="dspText">
                  ${T_IAX_PERSONAS_REL.OB_IAX_PERSONAS_REL.TTIPPER_REL}
                </div>
                </c:if>
              </display:column>
              <display:column title="${title2}"
                              sortable="true"
                              sortProperty="OB_IAX_PERSONAS_REL.NNUMIDE"
                              headerClass="sortable fixed"
                              media="html" autolink="false">
                <c:if test="${T_IAX_PERSONAS_REL.OB_IAX_PERSONAS_REL.CAGRUPA eq element.CATRIBU}"> 
                <div class="dspText">
                  ${T_IAX_PERSONAS_REL.OB_IAX_PERSONAS_REL.NNUMIDE}
                </div>
                </c:if>
              </display:column>
              <display:column title="${title3}"
                              sortable="true"
                              sortProperty="OB_IAX_PERSONAS_REL.TNOMBRE"
                              headerClass="sortable fixed"
                              media="html" autolink="false">
                <c:if test="${T_IAX_PERSONAS_REL.OB_IAX_PERSONAS_REL.CAGRUPA eq element.CATRIBU}"> 
                <div class="dspText">
                    ${T_IAX_PERSONAS_REL.OB_IAX_PERSONAS_REL.TNOMBRE} 
                </div>
                </c:if>
              </display:column>
              <display:column title="${title4}"
                              sortable="true"
                              sortProperty="OB_IAX_PERSONAS_REL.DIRECCION"
                              headerClass="sortable fixed"
                              media="html" autolink="false">
              <c:if test="${T_IAX_PERSONAS_REL.OB_IAX_PERSONAS_REL.CAGRUPA eq element.CATRIBU}"> 
               <div class="dspText">
                    ${T_IAX_PERSONAS_REL.OB_IAX_PERSONAS_REL.DIRECCION} 
                </div>
                </c:if>
              </display:column>
              <display:column title="${title5}"
                              sortable="true"
                              sortProperty="OB_IAX_PERSONAS_REL.TELEFONO"
                              headerClass="sortable fixed"
                              media="html" autolink="false">
               <c:if test="${T_IAX_PERSONAS_REL.OB_IAX_PERSONAS_REL.CAGRUPA eq element.CATRIBU}"> 
               <div class="dspText">
                    ${T_IAX_PERSONAS_REL.OB_IAX_PERSONAS_REL.TELEFONO} 
                </div>
                </c:if>
              </display:column>
              <display:column title="${title6}"
                              sortable="true"
                              sortProperty="OB_IAX_PERSONAS_REL.MAIL"
                              headerClass="sortable fixed"
                              media="html" autolink="false">
               <c:if test="${T_IAX_PERSONAS_REL.OB_IAX_PERSONAS_REL.CAGRUPA eq element.CATRIBU}"> 
               <div class="dspText">
                    ${T_IAX_PERSONAS_REL.OB_IAX_PERSONAS_REL.MAIL} 
                </div>
                </c:if>
              </display:column>    
              <axis:visible f="axisper009" c="PPARTICIPACION">
              <display:column title="${title7}"
                              sortable="true"
                              sortProperty="OB_IAX_PERSONAS_REL.PPARTICIPACION"
                              headerClass="sortable fixed"
                              media="html" autolink="false">
               <c:if test="${T_IAX_PERSONAS_REL.OB_IAX_PERSONAS_REL.CAGRUPA eq element.CATRIBU}"> 
               <div class="dspText">
                    ${T_IAX_PERSONAS_REL.OB_IAX_PERSONAS_REL.PPARTICIPACION} 
                </div>
                </c:if>
              </display:column>    
              </axis:visible> 
              
               <axis:visible f="axisper009" c="ISLIDER">
              <display:column title="${title8}"
                              sortable="true"
                              sortProperty="OB_IAX_PERSONAS_REL.ISLIDER"
                              headerClass="sortable fixed"
                              media="html" autolink="false">
               <c:if test="${T_IAX_PERSONAS_REL.OB_IAX_PERSONAS_REL.CAGRUPA eq element.CATRIBU}"> 
               <div class="dspText">
                    <c:if test="${T_IAX_PERSONAS_REL.OB_IAX_PERSONAS_REL.ISLIDER==0}"> 
                  <axis:alt f='axisper009' c='NO' lit='101779'/>
                   </c:if>
                   <c:if test="${T_IAX_PERSONAS_REL.OB_IAX_PERSONAS_REL.ISLIDER==1}"> 
                 <axis:alt f='axisper009' c='SI' lit='101778'/>
                   </c:if>
                </div>
                </c:if>
              </display:column>    
              </axis:visible> 
              
             
              <axis:visible f="axisper009" c="BT_DELPERREL">
              <c:if test="${! ocultarIconosEdicion && __configform.axisper009__BT_BORRAR_PERREL__visible != 'false'}">
                <display:column title="" sortable="false"
                                sortProperty=""
                                headerClass="headwidth5 sortable fixed"
                                media="html"
                                autolink="false">
                  <c:if test="${T_IAX_PERSONAS_REL.OB_IAX_PERSONAS_REL.CAGRUPA eq element.CATRIBU}"> 
                  <div class="dspIcons">
                    
                      <img border="0"
                           alt="<axis:alt f='axisper009' c='LIT_ELIMINAR' lit='1000127'/> <axis:alt f='axisper009' c='LIT_PERREL' lit='9901375'/>"
                           title="<axis:alt f='axisper009' c='LIT_ELIMINAR' lit='1000127'/> <axis:alt f='axisper009' c='LIT_PERREL' lit='9901375'/>"
                           src="images/delete.gif"
                           onclick="f_borrar_persona_rel('${T_IAX_PERSONAS_REL.OB_IAX_PERSONAS_REL.SPERSON_REL}','${dades_persona.SPERSON}','${dades_persona.CAGENTE}','${T_IAX_PERSONAS_REL.OB_IAX_PERSONAS_REL.CAGRUPA}')"/>                    
                    
                  </div>
                  </c:if>
                </display:column>
              </c:if>
              </axis:visible>
              
               <axis:visible f="axisper009" c="BT_CONS_PERREL">              
                <display:column title="" sortable="false"
                                sortProperty=""
                                headerClass="headwidth5 sortable fixed"
                                media="html"
                                autolink="false">
                 <c:if test="${T_IAX_PERSONAS_REL.OB_IAX_PERSONAS_REL.CAGRUPA eq element.CATRIBU}"> 
                  <div class="dspIcons">
                    
                      <img border="0"
                           alt="<axis:alt f='axisper009' c='LIT_MASDATOS' lit='1000439'/> <axis:alt f='axisper009' c='LIT_PERREL' lit='9901375'/>"
                           title="<axis:alt f='axisper009' c='LIT_MASDATOS' lit='1000439'/> <axis:alt f='axisper009' c='LIT_PERREL' lit='9901375'/>"
                           src="images/mas.gif"
                           onclick="f_consultar_per_rel('${T_IAX_PERSONAS_REL.OB_IAX_PERSONAS_REL.SPERSON_REL}','${dades_persona.CAGENTE}')"/>
                    
                  </div>
                  </c:if>
                </display:column>
             
              </axis:visible>
            </display:table>
          </div>
        </td>
      </tr>
    </table>
    </c:if>
    </c:forEach>
    <!-- ************************* FIN DATOS PERSONAS RELACIONADAS ********************* -->
</axis:visible>

<axis:visible c="DSP_PER_CS_Y_UT " f="axisper009">

    <!-- *************************  DSP_PER_CS_Y_UT  ********************* -->
    <div class="titulo"><a name="posicionPorColorcar__DSP_UT" id="posicionPorColorcar__DSP_UT" ></a>
      <b><axis:alt f="axisper009" c="LIT_DSP_PER_CS_Y_UT " lit="89906195"/></b>
    </div>
     <table class="seccion"  onclick="objSeccion.actualizarPosicionPorColocarCookie('axisper009','DSP_UT');return true;">
     
    <tr>
      <td class="campocaja">
        <a name="posicionPorColorcar__DSP_UT" id="posicionPorColorcar__DSP_UT"></a>
        
      </td>
    </tr>
      
      <tr id="DSP_UT_children">
        <td>
          <c:set var="title1">
            <axis:alt f="axisper009" c="TTIPPER_REL" lit="9902248"/>
          </c:set>
          <c:set var="title2">
            <axis:alt f="axisper009" c="NNUMIDE" lit="105330"/>
          </c:set>
          <c:set var="title3">
            <axis:alt f="axisper009" c="TNOMBRE" lit="105940"/>
          </c:set>
          <c:set var="title4">
            <axis:alt f="axisper009" c="DIRECCION" lit="105889"/>
          </c:set>
          <c:set var="title5">
            <axis:alt f="axisper009" c="TELEFONO" lit="9000992"/>
          </c:set>
          <c:set var="title6">
            <axis:alt f="axisper009" c="AGRUPACIN" lit="111471"/>
          </c:set>                              
          <axis:visible f="axisper009" c="PPARTICIPACION">
          <c:set var="title7">
            <axis:alt f="axisper009" c="PPARTICIPACION" lit="104818"/>
          </c:set>  
        
          </axis:visible>
          
          <div class="displayspace">
            <display:table name="${dades_persona.PERSONAS_REL}"
                           id="T_IAX_PERSONAS_REL_CUT" export="false"
                           class="dsptgtable" pagesize="-1"
                           defaultsort="1"
                           defaultorder="ascending"
                           sort="list" cellpadding="0"
                           cellspacing="0"
                           requestURI="axis_axisper009.do?paginar=true&subpantalla=datosgenerales">
              <%@ include file="../include/displaytag.jsp"%>
              <display:column title="${title1}"
                              sortable="true"
                              sortProperty="OB_IAX_PERSONAS_REL.TTIPPER_REL"
                              headerClass="sortable fixed"
                              media="html" autolink="false">
                <c:if test="${T_IAX_PERSONAS_REL_CUT.OB_IAX_PERSONAS_REL.CTIPPER_REL eq 0}"> 
                <div class="dspText">
                  ${T_IAX_PERSONAS_REL_CUT.OB_IAX_PERSONAS_REL.TTIPPER_REL}
                </div>
                </c:if>
              </display:column>
              <display:column title="${title2}"
                              sortable="true"
                              sortProperty="OB_IAX_PERSONAS_REL.NNUMIDE"
                              headerClass="sortable fixed"
                              media="html" autolink="false">
                <c:if test="${T_IAX_PERSONAS_REL_CUT.OB_IAX_PERSONAS_REL.CTIPPER_REL eq 0}"> 
                <div class="dspText">
                  ${T_IAX_PERSONAS_REL_CUT.OB_IAX_PERSONAS_REL.NNUMIDE}
                </div>
                </c:if>
              </display:column>
              <display:column title="${title3}"
                              sortable="true"
                              sortProperty="OB_IAX_PERSONAS_REL.TNOMBRE"
                              headerClass="sortable fixed"
                              media="html" autolink="false">
                <c:if test="${T_IAX_PERSONAS_REL_CUT.OB_IAX_PERSONAS_REL.CTIPPER_REL eq 0}"> 
                <div class="dspText">
                    ${T_IAX_PERSONAS_REL_CUT.OB_IAX_PERSONAS_REL.TNOMBRE} 
                </div>
                </c:if>
              </display:column>
              <display:column title="${title4}"
                              sortable="true"
                              sortProperty="OB_IAX_PERSONAS_REL.DIRECCION"
                              headerClass="sortable fixed"
                              media="html" autolink="false">
              <c:if test="${T_IAX_PERSONAS_REL_CUT.OB_IAX_PERSONAS_REL.CTIPPER_REL eq 0}"> 
               <div class="dspText">
                    ${T_IAX_PERSONAS_REL_CUT.OB_IAX_PERSONAS_REL.DIRECCION} 
                </div>
                </c:if>
              </display:column>
              <display:column title="${title5}"
                              sortable="true"
                              sortProperty="OB_IAX_PERSONAS_REL.TELEFONO"
                              headerClass="sortable fixed"
                              media="html" autolink="false">
               <c:if test="${T_IAX_PERSONAS_REL_CUT.OB_IAX_PERSONAS_REL.CTIPPER_REL eq 0}"> 
               <div class="dspText">
                    ${T_IAX_PERSONAS_REL_CUT.OB_IAX_PERSONAS_REL.TELEFONO} 
                </div>
                </c:if>
              </display:column>
              <display:column title="${title6}"
                              sortable="true"
                              sortProperty="OB_IAX_PERSONAS_REL.NAGRUPA"
                              headerClass="sortable fixed"
                              media="html" autolink="false">
               <c:if test="${T_IAX_PERSONAS_REL_CUT.OB_IAX_PERSONAS_REL.CTIPPER_REL eq 0}"> 
               <div class="dspText">
                    ${T_IAX_PERSONAS_REL_CUT.OB_IAX_PERSONAS_REL.NAGRUPA} 
                </div>
                </c:if>
              </display:column>    
              <axis:visible f="axisper009" c="PPARTICIPACION">
              <display:column title="${title7}"
                              sortable="true"
                              sortProperty="OB_IAX_PERSONAS_REL.PPARTICIPACION"
                              headerClass="sortable fixed"
                              media="html" autolink="false">
               <c:if test="${T_IAX_PERSONAS_REL_CUT.OB_IAX_PERSONAS_REL.CTIPPER_REL eq 0}"> 
               <div class="dspText">
                    ${T_IAX_PERSONAS_REL_CUT.OB_IAX_PERSONAS_REL.PPARTICIPACION} 
                </div>
                </c:if>
              </display:column>    
              </axis:visible> 
              
              
            </display:table>
          </div>
          
          
        </td>
      </tr>
    </table>
    </axis:visible>
	
<axis:visible c="DSP_HISPER_REL" f="axisper009">
<c:if test="${not empty dades_persona.HISPERSONAS_REL}">
    <!-- *************************  HISTORICO DE PERSONAS RELACIONADAS  ********************* -->
    <div class="titulo"><a name="posicionPorColorcar__HISPER_REL" id="posicionPorColorcar__HISPER_REL" ></a>
      <b><axis:alt f="axisper009" c="LIT_DSP_HISPERREL" lit="9909324"/></b>
    </div>
    <table class="seccion"  onclick="objSeccion.actualizarPosicionPorColocarCookie('axisper009','HISPER_REL');return true;">      
      <tr>
        <td>
        
        
          <!-- DisplayTag PERREL -->
          <c:set var="title1">
            <axis:alt f="axisper009" c="TTIPPER_REL" lit="9902248"/>
          </c:set>
          <c:set var="title2">
            <axis:alt f="axisper009" c="NNUMIDE" lit="105330"/>
          </c:set>
          <c:set var="title3">
            <axis:alt f="axisper009" c="TNOMBRE" lit="105940"/>
          </c:set>
          <c:set var="title4">
            <axis:alt f="axisper009" c="DIRECCION" lit="105889"/>
          </c:set>
          <c:set var="title5">
            <axis:alt f="axisper009" c="FALTA" lit="9001192"/>
          </c:set>
          <c:set var="title6">
            <axis:alt f="axisper009" c="FBAJA" lit="9001510"/>
          </c:set>                              
          <axis:visible f="axisper009" c="PPARTICIPACION">
          <c:set var="title7">
            <axis:alt f="axisper009" c="PPARTICIPACION" lit="104818"/>
          </c:set>  
          <c:set var="title8">
            <axis:alt f="axisper009" c="ISLIDER" lit="9906692"/>
          </c:set> 
          </axis:visible>
          
          <div class="displayspace">
            <display:table name="${dades_persona.HISPERSONAS_REL}"
                           id="T_IAX_PERSONAS_REL" export="false"
                           class="dsptgtable" pagesize="-1"
                           defaultsort="1"
                           defaultorder="ascending"
                           sort="list" cellpadding="0"
                           cellspacing="0"
                           requestURI="axis_axisper009.do?paginar=true&subpantalla=datosgenerales">
              <%@ include file="../include/displaytag.jsp"%>
              <display:column title="${title1}"
                              sortable="true"
                              sortProperty="OB_IAX_PERSONAS_REL.TTIPPER_REL"
                              headerClass="sortable fixed"
                              media="html" autolink="false">
                <div class="dspText">
                  ${T_IAX_PERSONAS_REL.OB_IAX_PERSONAS_REL.TTIPPER_REL}
                </div>
              </display:column>
              <display:column title="${title2}"
                              sortable="true"
                              sortProperty="OB_IAX_PERSONAS_REL.NNUMIDE"
                              headerClass="sortable fixed"
                              media="html" autolink="false">
                <div class="dspText">
                  ${T_IAX_PERSONAS_REL.OB_IAX_PERSONAS_REL.NNUMIDE}
                </div>
              </display:column>
              <display:column title="${title3}"
                              sortable="true"
                              sortProperty="OB_IAX_PERSONAS_REL.TNOMBRE"
                              headerClass="sortable fixed"
                              media="html" autolink="false">
                <div class="dspText">
                    ${T_IAX_PERSONAS_REL.OB_IAX_PERSONAS_REL.TNOMBRE} 
                </div>
              </display:column>
              <display:column title="${title4}"
                              sortable="true"
                              sortProperty="OB_IAX_PERSONAS_REL.DIRECCION"
                              headerClass="sortable fixed"
                              media="html" autolink="false">
               <div class="dspText">
                    ${T_IAX_PERSONAS_REL.OB_IAX_PERSONAS_REL.DIRECCION} 
                </div>
              </display:column>
              <display:column title="${title5}"
                              sortable="true"
                              sortProperty="OB_IAX_PERSONAS_REL.FMOVIMI"
                              headerClass="sortable fixed"
                              media="html" autolink="false">
               <div class="dspText">
                    ${T_IAX_PERSONAS_REL.OB_IAX_PERSONAS_REL.FMOVIMI} 
                </div>
              </display:column>
              <display:column title="${title6}"
                              sortable="true"
                              sortProperty="OB_IAX_PERSONAS_REL.FUSUMOD"
                              headerClass="sortable fixed"
                              media="html" autolink="false">
               <div class="dspText">
                    ${T_IAX_PERSONAS_REL.OB_IAX_PERSONAS_REL.FUSUMOD} 
                </div>
              </display:column>    
              <axis:visible f="axisper009" c="PPARTICIPACION">
              <display:column title="${title7}"
                              sortable="true"
                              sortProperty="OB_IAX_PERSONAS_REL.PPARTICIPACION"
                              headerClass="sortable fixed"
                              media="html" autolink="false">
               <div class="dspText">
                    ${T_IAX_PERSONAS_REL.OB_IAX_PERSONAS_REL.PPARTICIPACION} 
                </div>
              </display:column>    
              </axis:visible> 
              
               <axis:visible f="axisper009" c="ISLIDER">
              <display:column title="${title8}"
                              sortable="true"
                              sortProperty="OB_IAX_PERSONAS_REL.ISLIDER"
                              headerClass="sortable fixed"
                              media="html" autolink="false">
               <div class="dspText">
                    <c:if test="${T_IAX_PERSONAS_REL.OB_IAX_PERSONAS_REL.ISLIDER==0}"> 
                  <axis:alt f='axisper009' c='NO' lit='101779'/>
                   </c:if>
                   <c:if test="${T_IAX_PERSONAS_REL.OB_IAX_PERSONAS_REL.ISLIDER==1}"> 
                 <axis:alt f='axisper009' c='SI' lit='101778'/>
                   </c:if>
                </div>
              </display:column>    
              </axis:visible> 
                            
               <axis:visible f="axisper009" c="BT_CONS_PERREL">              
                <display:column title="" sortable="false"
                                sortProperty=""
                                headerClass="headwidth5 sortable fixed"
                                media="html"
                                autolink="false">
                  <div class="dspIcons">
                    
                      <img border="0"
                           alt="<axis:alt f='axisper009' c='LIT_MASDATOS' lit='1000439'/> <axis:alt f='axisper009' c='LIT_PERREL' lit='9901375'/>"
                           title="<axis:alt f='axisper009' c='LIT_MASDATOS' lit='1000439'/> <axis:alt f='axisper009' c='LIT_PERREL' lit='9901375'/>"
                           src="images/mas.gif"
                           onclick="f_consultar_per_rel('${T_IAX_PERSONAS_REL.OB_IAX_PERSONAS_REL.SPERSON_REL}','${dades_persona.CAGENTE}')"/>
                    
                  </div>
                </display:column>
             
              </axis:visible>
            </display:table>
          </div>
        </td>
      </tr>
    </table>
    </c:if>
    <!-- ************************* FIN DATOS HISTORICO DE PERSONAS RELACIONADAS ********************* -->
</axis:visible>



<axis:visible c="DSP_REGFISC" f="axisper009">
    <!-- *************************  REGIMEN_FISCAL  ********************* -->
    <div class="titulo"><a name="posicionPorColorcar__REGFISC" id="posicionPorColorcar__REGFISC" ></a>
      <b><axis:alt f="axisper009" c="LIT_DSP_REGFISC" lit="9902256"/></b>
    </div>  
    <table class="seccion"  onclick="objSeccion.actualizarPosicionPorColocarCookie('axisper009','REGFISC');return true;">
      <axis:visible f="axisper009" c="BT_NVREGFISC">
      <c:if test="${! ocultarIconosEdicion && __configform.axisper009__BT_ANADIR_REGFISC__visible != 'false'}">
        <div style="float:right;">
          
            <img border="0"
                 alt="<axis:alt f='axisper009' c='LIT_ANADIR_S' lit='104825'/> <axis:alt f='axisper009' c='LIT_REGFISC' lit='9902256'/>"
                 title="<axis:alt f='axisper009' c='LIT_ANADIR_B' lit='104825'/> <axis:alt f='axisper009' c='LIT_REGFISC' lit='9902256'/>"
                 src="images/new.gif"
                 onclick="f_abrir_axisper026('${dades_persona.SPERSON}','${dades_persona.CTIPPER}')"/>
          
        </div>
      </c:if>
      </axis:visible>
      <tr>
        <td>        
          <!-- DisplayTag REGFISC -->
          <c:set var="title1">
            <axis:alt f="axisper009" c="TREGFISCAL" lit="9902257"/>
          </c:set>
          <c:set var="title2">
            <axis:alt f="axisper009" c="FEFECTO" lit="100883"/>
          </c:set>
          <c:set var="title3">
            <axis:alt f="axisper009" c="ANUALIDAD" lit="9902258"/>
          </c:set>
            <c:set var="title4">
            <axis:alt f="axisper009" c="CREGFISEXEIVA" lit="9909209"/>
          </c:set>
          <!--ADDED FOR iaxis 4697  --> 
           <c:set var="title5">
            <axis:alt f="axisper009" c="IVA" lit="101515"/>
          </c:set> 
          <!--ENDED FOR iaxis 4697  -->  
          <div class="displayspace">
            <display:table name="${dades_persona.REGIMEN_FISCAL}"
                           id="T_IAX_REGIMENFISCAL" export="false"
                           class="dsptgtable" pagesize="-1"
                           defaultsort="1"
                           defaultorder="ascending"
                           sort="list" cellpadding="0"
                           cellspacing="0"
                           requestURI="axis_axisper009.do?paginar=true&subpantalla=datosgenerales">
              <%@ include file="../include/displaytag.jsp"%>
              <display:column title="${title1}"
                              sortable="true"
                              sortProperty="OB_IAX_REGIMENFISCAL.TREGFISCAL"
                              headerClass="sortable fixed"
                              media="html" autolink="false">
                <div class="dspText">
                  ${T_IAX_REGIMENFISCAL.OB_IAX_REGIMENFISCAL.TREGFISCAL}
                </div>
              </display:column>
              <display:column title="${title2}"
                              sortable="true"
                              sortProperty="OB_IAX_REGIMENFISCAL.FEFECTO"
                              headerClass="sortable fixed"
                              media="html" autolink="false">
                <div class="dspText">
                  <fmt:formatDate pattern="dd/MM/yyyy"
                                                      value="${T_IAX_REGIMENFISCAL.OB_IAX_REGIMENFISCAL.FEFECTO}"/>
                  
                </div>
              </display:column>
              <display:column title="${title3}"
                              sortable="true"
                              sortProperty="OB_IAX_REGIMENFISCAL.ANUALIDAD"
                              headerClass="sortable fixed"
                              media="html" autolink="false">
                <div class="dspText">
                    ${T_IAX_REGIMENFISCAL.OB_IAX_REGIMENFISCAL.ANUALIDAD} 
                </div>
              </display:column>
              <!-- AP -->
              <display:column title="${title4}"
                              sortable="true"
                              sortProperty="OB_IAX_REGIMENFISCAL.CREGFISEXEIVA" 
                              headerClass="sortable fixed"
                              media="html" autolink="false">
                <div class="dspText" width="20%">
                <input type="checkbox" name="CREGFISEXEIVA" disabled <c:if test="${T_IAX_REGIMENFISCAL.OB_IAX_REGIMENFISCAL.CREGFISEXEIVA == 1}">checked</c:if> 
                 value="${T_IAX_REGIMENFISCAL.OB_IAX_REGIMENFISCAL.CREGFISEXEIVA}"  <axis:atr f="axisper009" c="CREGFISEXEIVA" a="modificable=false"/>/>    
                </div>
              </display:column>
         <!-- START ADDED FOR IAXIS 4697 BY RL-->
              <display:column title="${title5}"
                              sortable="true"
                              sortProperty="OB_IAX_REGIMENFISCAL.CTIPIVA" 
                            headerClass="sortable fixed"
                              media="html" autolink="false">
                <div class="dspText">
                  ${T_IAX_REGIMENFISCAL.OB_IAX_REGIMENFISCAL.CTIPIVA}
                </div>
              </display:column>
              <!-- end ADDED FOR IAXIS 4697 BY RL-->
              <!-- AP -->
              <axis:visible f="axisper009" c="BT_DELREGFISC">
              <c:if test="${! ocultarIconosEdicion && __configform.axisper009__BT_BORRAR_REGFISC__visible != 'false'}">
                <display:column title="" sortable="false"
                                sortProperty=""
                                headerClass="headwidth5 sortable fixed"
                                media="html"
                                autolink="false">
                  <div class="dspIcons">
                    
                      <img border="0"
                           alt="<axis:alt f='axisper009' c='LIT_ELIMINAR' lit='1000127'/> <axis:alt f='axisper009' c='LIT_REGFISC' lit='9902256'/>"
                           title="<axis:alt f='axisper009' c='LIT_ELIMINAR' lit='1000127'/> <axis:alt f='axisper009' c='LIT_REGFISC' lit='9902256'/>"
                           src="images/delete.gif"
                           onclick="f_borrar_regfisc('<fmt:formatDate pattern="dd/MM/yyyy"
                                                      value="${T_IAX_REGIMENFISCAL.OB_IAX_REGIMENFISCAL.FEFECTO}"/>','${dades_persona.SPERSON}','${dades_persona.CAGENTE}')"/>
                    
                  </div>
                </display:column>
              </c:if>
              </axis:visible>
            </display:table>
          </div>
        </td>
      </tr>
    </table>
    <!-- ************************* FIN DATOS REGIMENFISCAL ********************* -->
</axis:visible>

<!--INI--WAJ  -->
<axis:visible c="DSP_NVIMPUESTO" f="axisper009">
    <!-- *************************  IMPUESTOS  ********************* -->
    <div class="titulo"><a name="posicionPorColorcar__REGFISC" id="posicionPorColorcar__NVIMPUESTO" ></a>
      <b><axis:alt f="axisper009" c="LIT_DSP_NVIMPUESTO" lit="9906563"/></b>
    </div>  
    <table class="seccion"  onclick="objSeccion.actualizarPosicionPorColocarCookie('axisper009','NVIMPUESTO');return true;">
      <axis:visible f="axisper009" c="BT_NVIMPUESTO">
      <c:if test="${! ocultarIconosEdicion && __configform.axisper009__BT_ANADIR_NVIMPUESTO__visible != 'false'}">
        <div style="float:right;">
          
            <img border="0"
                 alt=" <axis:alt f='axisper009' c='LIT_NVIMPUESTO' lit='9906560'/>"
                 title="<axis:alt f='axisper009' c='LIT_NVIMPUESTO' lit='9906560'/>"
                 src="images/new.gif"
                 onclick="f_abrir_axisper053('${dades_persona.SPERSON}','${dades_persona.CTIPPER}')"/>
                     
        </div>
      </c:if>
      </axis:visible>
      <tr>
        <td>        
          <!-- DisplayTag REGFISC -->
            <c:set var="title0"><axis:alt f="axisper009" c="TDESIMP" lit="9906564"/></c:set>
      		<c:set var="title1"><axis:alt f="axisper009" c="TINDICA" lit="9906486"/></c:set>
      		<c:set var="title2"><axis:alt f="axisper009" c="CUSUARI" lit="9902948"/></c:set>
      		<c:set var="title3"><axis:alt f="axisper009" c="FALTA" lit="100562"/></c:set>
      		<c:set var="title5"><axis:alt f="axisper009" c="ELIMINAR" lit="1000127" /></c:set>       
          
      <div class="displayspace">
      <display:table name="${dades_persona.IMPUESTOS}"
                     id="T_IAX_IMPUESTOS" export="false"
                     class="dsptgtable" pagesize="-1"
                     defaultsort="1"
                     defaultorder="ascending"
                     sort="list" cellpadding="0"
                     cellspacing="0"
                     requestURI="axis_axisper009.do?paginar=true&subpantalla=datosgenerales">
      <%@ include file="../include/displaytag.jsp"%>
   //   <axis:visible f="axisper009" c="TDESIMP">
      <display:column title="${title0}"
                      sortable="true"
                      sortProperty="OB_IAX_IMPUESTOS.TDESIMP"
                      headerClass="sortable fixed"
                      media="html" autolink="false">
      <div class="dspText">${T_IAX_IMPUESTOS.OB_IAX_IMPUESTOS.TDESIMP}</div>
      </display:column>
      </axis:visible>
      <display:column title="${title1}"
                      sortable="true"
                      sortProperty="OB_IAX_IMPUESTOS.TINDICA"
                      headerClass="sortable fixed"
                      media="html" autolink="false">
      <div class="dspText">${T_IAX_IMPUESTOS.OB_IAX_IMPUESTOS.TINDICA}</div>
      </display:column>
      <display:column title="${title2}"
                      sortable="true"
                      sortProperty="OB_IAX_SEGUIMIENTO.CUSUARI"
                      headerClass="sortable fixed"
                      media="html" autolink="false">
      <div class="dspText">${T_IAX_IMPUESTOS.OB_IAX_IMPUESTOS.CUSUARI}</div>
      </display:column>
      <display:column title="${title3}"
                      sortable="true"
                      sortProperty="OB_IAX_IMPUESTOS.FALTA"
                      headerClass="sortable fixed"
                      media="html" autolink="false">
      <div class="dspText">
      <fmt:formatDate pattern="dd/MM/yyyy" value="${T_IAX_IMPUESTOS.OB_IAX_IMPUESTOS.FALTA}"/>   
      </div>
      </display:column>
      
      
       <axis:visible f="axisper009" c="BT_DELIMPUESTO">
              <c:if test="${! ocultarIconosEdicion && __configform.axisper009__BT_BORRAR_IMPUESTO__visible != 'false'}">
                <display:column title="" sortable="false"
                                sortProperty=""
                                headerClass="headwidth5 sortable fixed"
                                media="html"
                                autolink="false">
                  <div class="dspIcons">
                    
                      <img border="0"
                           alt="<axis:alt f='axisper009' c='LIT_ELIMINAR' lit='1000127'/> <axis:alt f='axisper009' c='LIT_IMPUESTO' lit='9902256'/>"
                           title="<axis:alt f='axisper009' c='LIT_ELIMINAR' lit='1000127'/> <axis:alt f='axisper009' c='LIT_IMPUESTO' lit='9902256'/>"
                           src="images/delete.gif"
                           onclick="f_borrar_fila('${dades_persona.SPERSON}','${T_IAX_IMPUESTOS.OB_IAX_IMPUESTOS.CTIPIND}')"/>
                    
                  </div>
                </display:column>
              </c:if>
              </axis:visible>
      
      

      
      </display:table>                                  
      </div>     
        </td>
      </tr>
    </table>
    <!-- ************************* FIN DATOS IMPUESTOS ********************* -->
</axis:visible>
<!--FIN--WAJ  -->

<!-- ****************** IAXIS-13881 : Cambios de facturacion electronica : start ********************* -->
<axis:visible c="DSP_FACTURACION_ELECTRONICA" f="axisper009">
    <!-- *************************  FACTURACION ELECTRONICA  ********************* -->
    <div class="titulo">
   	  <a name="posicionPorColorcar__FACTURACION_ELECTRONICA" id="posicionPorColorcar__FACTURACION_ELECTRONICA" ></a>
      <b><axis:alt f="axisper009" c="LIT_DSP_FACTURACION_ELECTRONICA" lit="89908046"/></b>
    </div>  
    
    <table class="seccion"  onclick="objSeccion.actualizarPosicionPorColocarCookie('axisper009','FACTURACION_ELECTRONICA');return true;">                 
      	<axis:visible f="axisper009" c="BT_NUEVO_FE">
      		<c:if test="${empty dades_persona.FACT_ELECTRONICA}">
	        <div style="float:right;">          
	            <img border="0"
	                 alt=" <axis:alt f='axisper009' c='LIT_NUEVO_FE' lit='9906560'/>"
	                 title="<axis:alt f='axisper009' c='LIT_NUEVO_FE' lit='9906560'/>"
	                 src="images/new.gif"
	                 onclick="f_abrir_axisper053_FE('${dades_persona.SPERSON}',
	               							        '',
	               							      	'',
	               							      	'',
	               							      	'',             							                 							  
	               							        'EDITA_DATOS_PERSONA')"/>                     
	        </div>
	        </c:if>	        
        </axis:visible>                                    	              
      <tr>
        <td>        
          <!-- DisplayTag FACTURACION ELECTRONICA -->
            <c:set var="title0"><axis:alt f="axisper009" c="TNIT_PROVEEDOR" 	   lit="89908047"/></c:set>
      		<c:set var="title1"><axis:alt f="axisper009" c="TRESPONSABLE_IVA" 	   lit="89908048"/></c:set>
      		<c:set var="title2"><axis:alt f="axisper009" c="TFISCALES_ADQUIRIENTE" lit="89908049"/></c:set>
      		<c:set var="title3"><axis:alt f="axisper009" c="TCORREO_FACT_ELECT"    lit="89908050"/></c:set>      		
      		<c:set var="title4"><axis:alt f="axisper009" c="CUSUARI" 			   lit="9902948"/></c:set>
      		<c:set var="title5"><axis:alt f="axisper009" c="FALTA" 				   lit="100562"/></c:set>      		
          
		      <div class="displayspace">
			      <display:table name="${dades_persona.FACT_ELECTRONICA}"
			                     id="T_IAX_FACT_ELECTRONICA_PER" export="false"
			                     class="dsptgtable" pagesize="-1"
			                     defaultsort="1"
			                     defaultorder="ascending"
			                     sort="list" cellpadding="0"
			                     cellspacing="0"
			                     requestURI="axis_axisper009.do?paginar=true&subpantalla=datosgenerales">
			      <%@ include file="../include/displaytag.jsp"%>
			      
			      <display:column title="${title0}"
			                      sortable="true"
			                      sortProperty="OB_IAX_FACT_ELECTRONICA_PER.NIT_PROVEEDOR"
			                      headerClass="sortable fixed"
			                      media="html" autolink="false">
			      <div class="dspText">${T_IAX_FACT_ELECTRONICA_PER.OB_IAX_FACT_ELECTRONICA_PER.NIT_PROVEEDOR}</div>
			      </display:column>
			      
			      <display:column title="${title1}"
			                      sortable="true"
			                      sortProperty="OB_IAX_FACT_ELECTRONICA_PER.TRESPONSABLE_IVA"
			                      headerClass="sortable fixed"
			                      media="html" autolink="false">
			      <div class="dspText">${T_IAX_FACT_ELECTRONICA_PER.OB_IAX_FACT_ELECTRONICA_PER.TRESPONSABLE_IVA}</div>
			      </display:column>
			      
			      <display:column title="${title2}"
			                      sortable="true"
			                      sortProperty="OB_IAX_FACT_ELECTRONICA_PER.TFISCALES_ADQUIRIENTE"
			                      headerClass="sortable fixed"
			                      media="html" autolink="false">
			      <div class="dspText">${T_IAX_FACT_ELECTRONICA_PER.OB_IAX_FACT_ELECTRONICA_PER.TFISCALES_ADQUIRIENTE}</div>
			      </display:column>
			      
			      <display:column title="${title3}"
			                      sortable="true"
			                      sortProperty="OB_IAX_FACT_ELECTRONICA_PER.CORREO_FACT_ELECT"
			                      headerClass="sortable fixed"
			                      media="html" autolink="false">
			      <div class="dspText">${T_IAX_FACT_ELECTRONICA_PER.OB_IAX_FACT_ELECTRONICA_PER.CORREO_FACT_ELECT}</div>
			      </display:column>
			      
			      <display:column title="${title4}"
			                      sortable="true"
			                      sortProperty="OB_IAX_FACT_ELECTRONICA_PER.CUSUARI"
			                      headerClass="sortable fixed"
			                      media="html" autolink="false">
			      <div class="dspText">${T_IAX_FACT_ELECTRONICA_PER.OB_IAX_FACT_ELECTRONICA_PER.CUSUARI}</div>
			      </display:column>
			      
			      <display:column title="${title5}"
			                      sortable="true"
			                      sortProperty="OB_IAX_FACT_ELECTRONICA_PER.FALTA"
			                      headerClass="sortable fixed"
			                      media="html" autolink="false">
			      <div class="dspText">
			     	 <fmt:formatDate pattern="dd/MM/yyyy" value="${T_IAX_FACT_ELECTRONICA_PER.OB_IAX_FACT_ELECTRONICA_PER.FALTA}"/>   
			      </div>
			      </display:column>
			      
			      <axis:visible f="axisper009" c="BT_EDITAR_FE">
       				<c:if test="${not empty dades_persona.FACT_ELECTRONICA}">
       				
       				<display:column title="" sortable="false"
                                sortProperty=""
                                headerClass="headwidth5 sortable fixed"
                                media="html"
                                autolink="false">
				        <div style="float:right;">   				                               
				          <img border="0" 
				          	   alt="<axis:alt f='axisper009' c='LIT_EDITAR' lit='9901356'/>" 
				               title="<axis:alt f='axisper009' c='LIT_EDITAR' lit='9901356'/>" 
				               src="images/lapiz.gif"
				               onclick="f_abrir_axisper053_FE('${dades_persona.SPERSON}',
				               							      '${T_IAX_FACT_ELECTRONICA_PER.OB_IAX_FACT_ELECTRONICA_PER.NIT_PROVEEDOR}',
				               							      '${T_IAX_FACT_ELECTRONICA_PER.OB_IAX_FACT_ELECTRONICA_PER.CRESPONSABLE_IVA}',
				               							      '${T_IAX_FACT_ELECTRONICA_PER.OB_IAX_FACT_ELECTRONICA_PER.CFISCALES_ADQUIRIENTE}',
				               							      '${T_IAX_FACT_ELECTRONICA_PER.OB_IAX_FACT_ELECTRONICA_PER.CORREO_FACT_ELECT}',               							                 							  
				               							      'EDITA_DATOS_PERSONA')"/>                                      
				        </div>
					</display:column>				        
	        		</c:if>  
				</axis:visible>
			</display:table>                                       
	      </div>     
        </td>
      </tr>
    </table>    
</axis:visible>
<!-- ****************** IAXIS-13881 : Cambios de facturacion electronica : end ********************* -->

<!-- ****************************************** DATOS SARLAFT ************************************* -->

<axis:visible c="DSP_SARLAFT" f="axisper009">
   
    <div class="titulo"><a name="posicionPorColorcar__SARLAFT" id="posicionPorColorcar__SARLAFT" ></a>
      <b><axis:alt f="axisper009" c="LIT_DSP_SARLAFT" lit="9902423"/></b>
    </div>
    <table class="seccion"  onclick="objSeccion.actualizarPosicionPorColocarCookie('axisper009','SARLAFT');return true;">
      <tr>
        <td> 
          <!-- DisplayTag REGFISC -->
          <c:set var="title1"><axis:alt f="axisper009" c="ESTADO" lit="9908430"/></c:set>
          <c:set var="title2"><axis:alt f="axisper009" c="USUARIO" lit="100894"/></c:set>
          <c:set var="title3"><axis:alt f="axisper009" c="FALTA" lit="9001192"/></c:set>
          <c:set var="title4"><axis:alt f="axisper009" c="ESTACT" lit="9002027"/></c:set>          
         
          <div class="displayspace">
          
          <display:table name="${dades_persona.ULTIMOS_ESTADOS}"  id="T_IAX_SARLAFT" export="false" class="dsptgtable" pagesize="-1"
            defaultsort="1" defaultorder="descending" sort="list" cellpadding="0" cellspacing="0" requestURI="axis_axisper009.do?paginar=true&subpantalla=datosgenerales">
              <%@ include file="../include/displaytag.jsp"%>
              
              <display:column title="${title1}" sortable="true" headerClass="sortable fixed" media="html" autolink="false">
                <div class="dspText">${T_IAX_SARLAFT.VERSION}
                </div>
              </display:column>
              
              <display:column title="${title2}" sortable="true" sortProperty="T_IAX_SARLAFT.CUSER" headerClass="sortable fixed" media="html" autolink="false">
                <div class="dspText">
                  ${T_IAX_SARLAFT.CUSER}
                </div>
              </display:column>
              
              <display:column title="${title3}" sortable="true" sortProperty="T_IAX_SARLAFT.FALTA" headerClass="sortable fixed" media="html" autolink="false">
                <div class="dspText">
                  <fmt:formatDate pattern="dd/MM/yyyy" value="${T_IAX_SARLAFT.FALTA}"/>
                </div>
              </display:column>
              
              <display:column title="${title4}" sortable="true" sortProperty="OB_IAX_SARLAFT.ESTACT" headerClass="sortable fixed" media="html" autolink="false">
                <div class="dspText">${T_IAX_SARLAFT.ESTADO}
                </div>
              </display:column>
              
            </display:table>
          </div>
        </td>
      </tr>
    </table>
    
</axis:visible>


<axis:visible c="DSP_DETSARLAFT" f="axisper009">
	   
    <div class="titulo"><a name="posicionPorColorcar__SARLAFT" id="posicionPorColorcar__SARLAFT" ></a>
      <b><axis:alt f="axisper009" c="LIT_DSP_DETSARLAFT" lit="9909964"/></b>
    </div>
    <table class="seccion"  onclick="objSeccion.actualizarPosicionPorColocarCookie('axisper009','DETSARLAFT');return true;">
      <axis:visible f="axisper009" c="BT_NUEVO_DETSARLAFT">
      <c:if test="${! ocultarIconosEdicion && __configform.axisper009__BT_ANADIR_SARLAFT__visible != 'false'}">
          <div style="float:right;">
                  
                    <img border="0" alt="<axis:alt f='axisper009' c='LIT_REGFISC' lit='9902424'/>"
                         title="<axis:alt f='axisper009' c='LIT_ANADIR_ES' lit='9902424'/>" src="images/new.gif"
                          	onclick="f_abrir_axisper047('${dades_persona.SPERSON}','${dades_persona.CAGENTE}','${T_IAX_SARLAFT.OB_IAX_SARLAFT.SSARLAFT}','<fmt:formatDate pattern="dd/MM/yyyy" value="${T_IAX_SARLAFT.OB_IAX_SARLAFT.FRADICA}"/>','NUEVO_SARLAFT')"/> <%-- IAXIS-3287 01/04/2017 --%>
                  
          </div>
      </c:if>
      </axis:visible>
      <tr>
        <td> 
          <!-- DisplayTag REGFISC -->
          <c:set var="title1"><axis:alt f="axisper009" c="VERSION" lit="9908430"/></c:set>
          <c:set var="title2"><axis:alt f="axisper009" c="FRADICA" lit="9909579"/></c:set>
          <c:set var="title3"><axis:alt f="axisper009" c="FDILIGENCI" lit="9909578"/></c:set>
          <c:set var="title4"><axis:alt f="axisper009" c="CESTCONF" lit="9909582"/></c:set>
          <c:set var="title5"><axis:alt f="axisper009" c="FCONFIR" lit="9909583"/></c:set>
          <c:set var="title6"><axis:alt f="axisper009" c="CUSER" lit="9900985"/></c:set>
          <c:set var="title7"><axis:alt f="axisper009" c="FALTA" lit="9900983"/></c:set>
         <%int contador = 1;%>
          <div class="displayspace">
          
          <display:table name="${dades_persona.LISTAARLAF}"  id="T_IAX_PER_DETSARLAFT" export="false" class="dsptgtable" pagesize="-1"
            defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0" requestURI="axis_axisper009.do?paginar=true&subpantalla=datosgenerales">
              <%@ include file="../include/displaytag.jsp"%>
              
              <display:column title="${title1}" sortable="true" headerClass="sortable fixed" media="html" autolink="false">
                <div class="dspText"><%= contador %></div>
              </display:column>
              
              <display:column title="${title2}" sortable="true" sortProperty="OB_IAX_PER_DETSARLAFT.FRADICA" headerClass="sortable fixed" media="html" autolink="false">
                <div class="dspText">
                  <fmt:formatDate pattern="dd/MM/yyyy" value="${T_IAX_PER_DETSARLAFT.FRADICA}"/>
                </div>
              </display:column>
              
              <display:column title="${title3}" sortable="true" sortProperty="OB_IAX_PER_DETSARLAFT.FDILIGENCIA" headerClass="sortable fixed" media="html" autolink="false">
                <div class="dspText">
                  <fmt:formatDate pattern="dd/MM/yyyy" value="${T_IAX_PER_DETSARLAFT.FDILIGENCIA}"/>
                </div>
              </display:column>
              
              <display:column title="${title4}" sortable="true" sortProperty="OB_IAX_PER_DETSARLAFT.ESTADO" headerClass="sortable fixed" media="html" autolink="false">
                <div class="dspText">${T_IAX_PER_DETSARLAFT.ESTADO}</div>
              </display:column>
              
              <display:column title="${title5}" sortable="true" sortProperty="OB_IAX_SARLAFT.FCONFIR" headerClass="sortable fixed" media="html" autolink="false">
                <div class="dspText">
                  <fmt:formatDate pattern="dd/MM/yyyy" value="${T_IAX_PER_DETSARLAFT.FCONFIR}"/>
                </div>
              </display:column>
              
              <display:column title="${title6}" sortable="true" sortProperty="OB_IAX_PER_DETSARLAFT.CUSER" headerClass="sortable fixed" media="html" autolink="false">
                <div class="dspText">${T_IAX_PER_DETSARLAFT.CUSER}</div>
              </display:column>
              
              <display:column title="${title7}" sortable="true" sortProperty="OB_IAX_SARLAFT.FALTA" headerClass="sortable fixed" media="html" autolink="false">
                <div class="dspText">
                  <fmt:formatDate pattern="dd/MM/yyyy" value="${T_IAX_PER_DETSARLAFT.FALTA}"/>
                </div>
              </display:column>
              
              <!--IAXIS-4899 INI-->
              <c:if test="${! ocultarIconosEdicion && __configform.axisper009__BT_BORRAR_REGFISC__visible != 'false'}">
                <display:column title="" sortable="false" sortProperty="" headerClass="headwidth5 sortable fixed" media="html" autolink="false">
                  <div class="dspIcons">
                    <axis:visible f="axisper009" c="BT_DEL_REGSARLAFT">
                      <img border="0" alt="<axis:alt f='axisper009' c='LIT_ELIMINAR' lit='9902979'/>" title="<axis:alt f='axisper009' c='LIT_ELIMINAR' lit='9902979'/>" src="images/delete.gif"
                      	onclick="borrar_sarlaft('${dades_persona.SPERSON}','${T_IAX_PER_DETSARLAFT.SSARLAFT}')"/>
                    </axis:visible>
                    <axis:visible f="axisper009" c="BT_EDIT_REGSARLAFT">
                      	<c:if test="${dades_persona.ultima_version == T_IAX_PER_DETSARLAFT.SSARLAFT}">
                      		<img border="0" alt="<axis:alt f='axisper009' c='LIT_EDITAR' lit='9901356'/>" title="<axis:alt f='axisper009' c='LIT_EDITAR' lit='9901356'/>" src="images/lapiz.gif"
                      		onclick="f_abrir_axisper047('${dades_persona.SPERSON}','${dades_persona.CAGENTE}','${T_IAX_PER_DETSARLAFT.SSARLAFT}','<fmt:formatDate pattern="dd/MM/yyyy" value="${T_IAX_PER_DETSARLAFT.FRADICA}"/>','EDITA_DATOS_PERSONA')"/>
                      	</c:if>
                    </axis:visible> 	
                    <axis:visible f="axisper009" c="BT_PRINT_REGSARLAFT">
                 			<c:if test="${T_IAX_PER_DETSARLAFT.CCONFIR == 1}"> <%--  IAXIS-3287 01/04/2019 --%>
                 			<img border="0" onclick="javascript:f_but_FCC('${dades_persona.ultima_version}', '${dades_persona.tipo_persona}', '${T_IAX_PER_DETSARLAFT.SSARLAFT}')" alt="<axis:alt f="axisper009" c="DOCPER" lit="100001"/>"
          						title="<axis:alt f="axisper009" c="DOCPER" lit="100001"/>"
          						src="images/print.gif" />
          						</c:if> <%--  IAXIS-3287 01/04/2019 --%>
                    </axis:visible>
                    <axis:visible f="axisper009" c="BT_FIND_DETSARLAFT">
                      <img border="0" alt="<axis:alt f='axisper009' c='LIT_CONSULTAR' lit='109142'/>" title="<axis:alt f='axisper009' c='LIT_CONSULTAR' lit='109142'/>" src="images/find.gif"
                          onclick="f_abrir_axisper047('${dades_persona.SPERSON}','${dades_persona.CAGENTE}','${T_IAX_PER_DETSARLAFT.SSARLAFT}','<fmt:formatDate pattern="dd/MM/yyyy" value="${T_IAX_PER_DETSARLAFT.FRADICA}"/>','CONSULTA')"/>
                    </axis:visible>
                  <!--IAXIS-4899 FIN-->
                  </div>
                </display:column>
              </c:if>
              
              <%contador++;%>
            </display:table>
          </div>
        </td>
      </tr>
    </table>
    
</axis:visible>






<!-- ********************************* INICIO DATOS AGENDA CONF-347 ********************************* -->

<axis:visible c="DSP_AGENDA" f="axisper009">
  <div class="titulo"><a name="posicionPorColorcar__AGENDA" id="posicionPorColorcar__AGENDA" ></a>
    <b><axis:alt f="axisper009" c="DSP_AGENDA" lit="89906230"/></b> <%--TCS-809 26/02/2019 AP--%>
  </div>
  <axis:visible f="axisper009" c="BT_NUEVO_AGENDA">
      <c:if test="${! ocultarIconosEdicion && __configform.axisper009__BT_ANADIR_AGENDA__visible != 'false'}">
          <div style="float:right;">
                  
                    <img border="0" alt="<axis:alt f='axisper009' c='LIT_AGENDA' lit='104825'/>"
                         title="<axis:alt f='axisper009' c='LIT_ANADIR_ES' lit='104825'/>" src="images/new.gif"
                         	onclick="f_but_nueva_agenda()"/>
                  
          </div>
      </c:if>
      </axis:visible>
  
  <table class="seccion"  onclick="objSeccion.actualizarPosicionPorColocarCookie('axisper009','AGENDA');return true;">
    <tr>
      <td>
        <!-- DisplayTag datos parametros persona -->
        <c:set var="title1"><axis:alt f="axisper009" c="IDAPUNTE" lit="9001189" /></c:set>
        <c:set var="title2"><axis:alt c="CCLAGD" f="axisper009" lit="9901654"/></c:set>
        <c:set var="title3"><axis:alt f="axisper009" c="CCONAPU" lit="9000715"/></c:set>                           
        <c:set var="title4"><axis:alt f="axisper009" c="CTIPAPU" lit="9001195"/></c:set>
        <c:set var="title5"><axis:alt f="axisper009" c="FALTA" lit="9001192"/></c:set>
        <c:set var="title6"><axis:alt f="axisper009" c="TITULO" lit="100785"/></c:set>
        <c:set var="title7"><axis:alt f="axisper009" c="CUSUARI" lit="9902245"/></c:set> 
        <c:set var="title8"><axis:alt f="axisper009" c="CGRUPO" lit="9001801"/></c:set>
        <c:set var="title9"><axis:alt f="axisper009" c="CESTAPU" lit="9001191"/></c:set>
        <c:set var="title10"><axis:alt f="axisper009" c="FRECORDATORIO" lit="9901674"/></c:set>
        
         <!--INI Bug 0036507 - 06/10/2015 - KJSC -->
        <c:set var="title13"><axis:alt f="axisper009" c="TITTAPU1" lit="9001196"/></c:set>
        <c:set var="title14"><axis:alt f="axisper009" c="FALTA1" lit="9001192"/></c:set>
         <!--FIN Bug 0036507 - 06/10/2015 - KJSC -->
        <c:set var="title15"><axis:alt f="axisper009" c="TAPUNTE" lit="9001197"/></c:set>
        <!-- Bug 0017744 - 25/02/2011 - JMF -->
        <c:set var="title11"><axis:alt f="axisper009" c="CUSUARI_REG" lit="9902246"/></c:set>
        
        <div class="displayspace">
          <display:table name="${__formdata.resultagenda}" id="miListaId" export="false" class="dsptgtable" pagesize="-1"  defaultorder="ascending" requestURI="axis_axisper009.do?paginar=true" sort="list" cellpadding="0" cellspacing="0">
                                    <%@ include file="../include/displaytag.jsp"%>
                                    <axis:visible f="axisper009" c="IDAPUNTE">
                                    <!-- Bug 0017744 - 25/02/2011 - JMF tamany 8 -->
                                    <display:column title="${title1}" sortable="true" sortProperty="IDAPUNTE" headerClass="sortable fixed"  media="html" autolink="false" >    
                                        <div class="dspNumber">${miListaId['IDAPUNTE']}</div>
                                    </display:column>
                                    </axis:visible>
                                     <axis:visible f="axisper009" c="CCLAGD">
                                    <!-- Bug 0017744 - 25/02/2011 - JMF tamany 15 -->
                                    <display:column title="${title2}" sortable="true" sortProperty="CCLAGDx" headerClass="sortable fixed"  media="html" autolink="false" >    
                                        <div class="dspNumber">
                                            <c:if test="${!empty miListaId['DESTCLAGD']}">
                                                ${miListaId['DESTCLAGD']} - ${miListaId['TCLAGD_OUT']}
                                            </c:if>
                                        </div>
                                            
                                    </display:column>
                                    </axis:visible>
                                    
                                    <axis:visible f="axisper009" c="CCONAPU">
                                    <display:column title="${title3}" sortable="true" sortProperty="TCONAPU" headerClass="sortable fixed" media="html"  autolink="false" >
                                        <div class="dspText">${miListaId['TCONAPU']}</div>
                                    </display:column>
                                    </axis:visible>
                                    
                                    
                                    <!--INI Bug 0036507 - 06/10/2015 - KJSC -->
                                    <axis:visible f="axisper009" c="TITTAPU1">
                                    <display:column title="${title13}" sortable="true" sortProperty="TITTAPU1" headerClass="sortable fixed" media="html"  autolink="false" >
                                        <div class="dspText">${miListaId['TTITAPU']}</div>
                                    </display:column>
                                    </axis:visible>
                                   
                                    <axis:visible f="axisper009" c="FALTA1">
                                    <display:column title="${title14}" sortable="true" sortProperty="FALTA1" headerClass="sortable fixed" media="html"  autolink="false" >
                                        <div class="dspText">
                                        <fmt:formatDate pattern="dd/MM/yyyy" 
                                                        value="${miListaId['FALTA']}"/>
                                        </div>
                                    </display:column>
                                    </axis:visible>
                                    <!--FIN Bug 0036507 - 06/10/2015 - KJSC -->
                                    <axis:visible f="axisper009" c="CUSUARI_REG">
                                    <display:column title="${title7}" sortable="true" sortProperty="CUSUARI_REG" headerClass="sortable fixed" media="html"  autolink="false" >
                                        <div class="dspText">${miListaId['TORIGEN']}<c:if test="${!empty miListaId['TUSUORIDESC']}"> - ${miListaId['TUSUORIDESC']}</c:if></div>
                                    </display:column>
                                    </axis:visible>

                                    <!-- Bug 0017744 - 25/02/2011 - JMF -->
                                    <axis:visible f="axisper009" c="CUSUARI_ASI">
                                    <display:column title="${title11}" sortable="true" sortProperty="CUSUARI_ASI" headerClass="sortable fixed" media="html"  autolink="false" >
                                        <div class="dspText">${miListaId['TDESTINO']} - ${miListaId['TDESCGRUPO']}</div>
                                    </display:column>
                                    </axis:visible>

                                    <axis:visible f="axisper009" c="CTIPAPU">
                                    <display:column title="${title4}" sortable="true" sortProperty="TTIPAPU" headerClass="sortable fixed" media="html"  autolink="false" >
                                        <div class="dspText">${miListaId['TTIPAPU']}</div>
                                    </display:column>
                                    </axis:visible>
                                    
                                     <axis:visible f="axisper009" c="FESTAPU">
                                    <display:column title="${title12}" sortable="true" sortProperty="FESTAPU" headerClass="sortable fixed" media="html"  autolink="false" >
                                        <div class="dspText">
                                       
                                        
                                        <fmt:formatDate pattern="dd/MM/yyyy" 
                                                        value="${miListaId['FESTAPU']}"/>
                                       </div>
                                    </display:column>
                                    </axis:visible>
                                     <axis:visible f="axisper009" c="FRECOR">
                                    <display:column title="${title10}" sortable="true" sortProperty="FRECORDATORIO" headerClass="sortable fixed" media="html"  autolink="false" >
                                        <div class="dspText">
                                         <c:set var="color">
                                                        <c:choose>
                                                            <c:when test="${axis:compararFechas(miListaId['FRECORDATORIO'],today)<0}">
                                                                red
                                                            </c:when>
                                                            <c:otherwise>
                                                                black
                                                               </c:otherwise>
                                                        </c:choose>
                                                    </c:set>
                                        
                                         <font color = "${color}"><fmt:formatDate pattern="dd/MM/yyyy" 
                                                        value="${miListaId['FRECORDATORIO']}"/></font>
                                       </div>
                                    </display:column>
                                    </axis:visible>
                                   
                                    <axis:visible f="axisper009" c="CGRUPO_DSP">
                                    <display:column title="${title8}" sortable="true" sortProperty="CGRUPO" headerClass="sortable fixed" media="html"  autolink="false" >
                                        <div class="dspText">
                                            <c:if test="${!empty miListaId['TLISTGRUPO']}">
                                                ${miListaId['TLISTGRUPO']}
                                            </c:if>
                                            <c:if test="${!empty miListaId['DESTGRUPO']}">
                                                <c:if test="${!empty miListaId['TLISTGRUPO']}">-</c:if>
                                            </c:if>
                                            <c:if test="${!empty miListaId['DESTGRUPO']}">
                                                ${miListaId['DESTGRUPO']} 
                                            </c:if>
                                        </div>
                                    </display:column>
                                    </axis:visible>
                                     <axis:visible f="axisper009" c="CESTAPU">
                                    <display:column title="${title9}" sortable="true" sortProperty="TESTAPU" headerClass="sortable fixed" media="html" autolink="false" >
                                        <div class="dspText">${miListaId['TESTAPU']}</div>
                                    </display:column>
                                    </axis:visible>
                                    
                                    <axis:visible f="axisper009" c="TAPUNTE">
                                    <display:column title="${title15}" 
                                                    sortable="true" 
                                                    sortProperty="TAPUNTE" 
                                                    headerClass="sortable fixed" 
                                                    media="html" 
                                                    autolink="false" >
                                    <div class="dspText">
                                        ${miListaId['TAPUNTE']}
                                    </div>
                                    </display:column>
                                    </axis:visible>
                                    
                                     <axis:visible f="axisper009" c="BT_SIN_EDITAR_AGD">
				                         <display:column  headerClass="sortable fixed" media="html" style="width:2%;" autolink="false"  >
				                             <div class="dspIcons">
				                             <img border="0" alt="<axis:alt f="axisper009" c="AGENDACESTADOFINALIZADO_LIT" lit="9001330"/>" title1="<axis:alt f="axisper009" c="AGENDACESTADOFINALIZADO_LIT" lit="9001330"/>" src="images/lapiz.gif"
				                             style="cursor:pointer;" onclick="f_agd_gestioagenda('${miListaId['IDAPUNTE']}','${miListaId['IDAGENDA']}','MODIF_AGEN')"/></div>
				                        </display:column>
				                    </axis:visible>
                        
                           			<axis:visible f="axisper009" c="BT_MASDATOS_AGENDA">
                                		<display:column  headerClass="sortable fixed" media="html" style="width:2%;" autolink="false" >
		                                    <div class="dspIcons">
		                                    	<img border="0" alt="<axis:alt c="BT_MASDATOS_AGENDA" f="axisper009" lit="1000113"/>" title1="<axis:alt c="BT_MASDATOS_AGENDA" f="axisper009" lit="1000113"/>" src="images/mes.gif" width="11px" height="11px"
		                                 			style="cursor:pointer;"  onclick="f_agd_gestioagenda('${miListaId['IDAPUNTE']}','${miListaId['IDAGENDA']}','CONSULTA')"  />
		                                 	</div>
		                                </display:column>   
		                            </axis:visible>
                                <!-- *************************** SECCION MS DATOS ********************************* -->
                                
                                <display:column class="seccion_informacion">
                                <div id="SECCION_A${miListaId['IDAPUNTE']}" class="seccion_informacion">
                                    <!-- INICIO SECCION -->
                                   
    
                                    <table class="area" align="center">
                                         <tr>
                                            <th style="width:50%;height:0px"></th>
                                            <th style="width:50%;height:0px"></th>
                                            
                                         </tr>
                                         <tr>
                                            <%-- Campo 1 --%>
                                            <td class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;">
                                                <b>${title5}</b>
                                            </td>
                                            <td class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;">
                                                <b>${title7}</b>
                                            </td>
                                        </tr>
                                         <tr>
                                      
                                      
                                      
                                          <axis:visible f="axisper009" c="FALTA">
                                            <%-- Campo 1 --%>
                                              <td class="campocaja" style="background-color:white;border-right-width: 0px;">
                                                <input type="text" class="campo campotexto" id="FALTA_" name="FALTA_" size="15" style="width:90%"
                                                value="<fmt:formatDate pattern="dd/MM/yyyy" 
                                                        value="${miListaId['FALTA']}"/>" readonly="readonly"/>
    
                                            </td>
                                          </axis:visible>
                                          <axis:visible f="axisper009" c="CUSUARI_MD">
                                            <%-- Campo 1 --%>
                                              <td class="campocaja" style="background-color:white;border-right-width: 0px;">
                                                <input type="text" class="campo campotexto" id="CUSUARI_MD" name="CUSUARI_MD" size="15" style="width:90%"
                                                value="${miListaId['CUSUARI']}" readonly="readonly"/>
                                              
                                              </td>
                                          </axis:visible>
                                            
                                        </tr>
                                         <tr>
                                            <%-- Campo 1 --%>
                                            <td class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;">
                                                <b>${title6}</b>
                                            </td>
                                        </tr>
                                        <tr>
                                      
                                      
                                      
                                          <axis:visible f="axisper009" c="TITTAPU">
                                            <%-- Campo 1 --%>
                                              <td class="campocaja" colspan="2" style="background-color:white;border-right-width: 0px;">
                                                <input type="text" class="campo campotexto" id="TITTAPU__" name="TITTAPU__" size="15" style="width:90%"
                                                value="${miListaId['TTITAPU']}" readonly="readonly"/>
    
                                            </td>
                                          </axis:visible>
                                            
                                            
                                        </tr>
                                        </table>
    
    
                                </div>
                            </display:column>
                                    </display:table>
        </div>
      </td>
    </tr>
  </table>
  
  
</axis:visible>



<!-- ************************* FIN DATOS AGENDA CONF-347********************* -->


<!-- ********************************* INICIO DATOS APUNTES CONF-347 ********************************* -->

<axis:visible c="DSP_TAREAS_USUARIO" f="axisper009">
                <div class="titulo"><a name="posicionPorColorcar__TAREAS_USUARIO" id="posicionPorColorcar__TAREAS_USUARIO" ></a>
                   <b><axis:alt f="axisper009" c="DSP_TAREAS_USUARIO" lit="9901963"/></b>
                </div>
                
                 <%--TCS-809 26/02/2019 AP <axis:visible c="BT_NUEVO_APUNTE" f="axisper009">
                    <div style="float:right;" id="BT_NUEVO_APUNTE">
                       <img border="0" alt="<axis:alt f="axisper009" c="AGENDA_LIT" lit="9901437"/>" title="<axis:alt f="axisper009" c="AGENDA_LIT" lit="9901437"/>" src="images/agenda.gif"
                       onclick="f_gestioagenda_apuntes()"/>
                	</div>
                </axis:visible> TCS-809 26/02/2019 AP--%>
				
				<table class="seccion"  onclick="objSeccion.actualizarPosicionPorColocarCookie('axisper009','TAREAS_USUARIO');return true;">
                <tr>
                  <td>
	<%--INI TCS-809 26/02/2019 AP--%>
        <!-- DisplayTag datos parametros persona -->
        <c:set var="title1"><axis:alt f="axisper009" c="IDAPUNTE" lit="9001189" /></c:set>
        <c:set var="title2"><axis:alt c="CCLAGD" f="axisper009" lit="9901654"/></c:set>
        <c:set var="title3"><axis:alt f="axisper009" c="CCONAPU" lit="9000715"/></c:set>                           
        <c:set var="title4"><axis:alt f="axisper009" c="CTIPAPU" lit="9001195"/></c:set>
        <c:set var="title5"><axis:alt f="axisper009" c="FALTA" lit="9001192"/></c:set>
        <c:set var="title6"><axis:alt f="axisper009" c="TITULO" lit="100785"/></c:set>
        <c:set var="title7"><axis:alt f="axisper009" c="CUSUARI" lit="9902245"/></c:set> 
        <c:set var="title8"><axis:alt f="axisper009" c="CGRUPO" lit="9001801"/></c:set>
        <c:set var="title9"><axis:alt f="axisper009" c="CESTAPU" lit="9001191"/></c:set>
        <c:set var="title10"><axis:alt f="axisper009" c="FRECORDATORIO" lit="9901674"/></c:set>
         <!--INI Bug 0036507 - 06/10/2015 - KJSC -->
        <c:set var="title13"><axis:alt f="axisper009" c="TITTAPU1" lit="9001196"/></c:set>
        <c:set var="title14"><axis:alt f="axisper009" c="FALTA1" lit="9001192"/></c:set>
         <!--FIN Bug 0036507 - 06/10/2015 - KJSC -->
        <c:set var="title15"><axis:alt f="axisper009" c="TAPUNTE" lit="9001197"/></c:set>
        <!-- Bug 0017744 - 25/02/2011 - JMF -->
        <c:set var="title11"><axis:alt f="axisper009" c="CUSUARI_REG" lit="9902246"/></c:set>
        <div class="displayspace">
          <display:table name="${__formdata.resultagenda1}" id="miListaId1" export="false" class="dsptgtable" pagesize="-1"  defaultorder="ascending" requestURI="axis_axisper009.do?paginar=true" sort="list" cellpadding="0" cellspacing="0">
                                    <%@ include file="../include/displaytag.jsp"%>
                                    <axis:visible f="axisper009" c="IDAPUNTE">
                                    <!-- Bug 0017744 - 25/02/2011 - JMF tamany 8 -->
                                    <display:column title="${title1}" sortable="true" sortProperty="IDAPUNTE" headerClass="sortable fixed"  media="html" autolink="false" >    
                                        <div class="dspNumber">${miListaId1['IDAPUNTE']}</div>
                                    </display:column>
                                    </axis:visible>
                                     <axis:visible f="axisper009" c="CCLAGD">
                                    <!-- Bug 0017744 - 25/02/2011 - JMF tamany 15 -->
                                    <display:column title="${title2}" sortable="true" sortProperty="CCLAGDx" headerClass="sortable fixed"  media="html" autolink="false" >    
                                        <div class="dspNumber">
                                            <c:if test="${!empty miListaId1['DESTCLAGD']}">
                                                ${miListaId1['DESTCLAGD']} - ${miListaId1['TCLAGD_OUT']}
                                            </c:if>
                                        </div>
                                    </display:column>
                                    </axis:visible>
                                    <axis:visible f="axisper009" c="CCONAPU">
                                    <display:column title="${title3}" sortable="true" sortProperty="TCONAPU" headerClass="sortable fixed" media="html"  autolink="false" >
                                        <div class="dspText">${miListaId1['TCONAPU']}</div>
                                    </display:column>
                                    </axis:visible>
                                    <!--INI Bug 0036507 - 06/10/2015 - KJSC -->
                                    <axis:visible f="axisper009" c="TITTAPU1">
                                    <display:column title="${title13}" sortable="true" sortProperty="TITTAPU1" headerClass="sortable fixed" media="html"  autolink="false" >
                                        <div class="dspText">${miListaId1['TTITAPU']}</div>
                                    </display:column>
                                    </axis:visible>
                                    <axis:visible f="axisper009" c="FALTA1">
                                    <display:column title="${title14}" sortable="true" sortProperty="FALTA1" headerClass="sortable fixed" media="html"  autolink="false" >
                                        <div class="dspText">
                                        <fmt:formatDate pattern="dd/MM/yyyy" 
                                                        value="${miListaId1['FALTA']}"/>
                                        </div>
                                    </display:column>
                                    </axis:visible>
                                    <!--FIN Bug 0036507 - 06/10/2015 - KJSC -->
                                    <axis:visible f="axisper009" c="CUSUARI_REG">
                                    <display:column title="${title7}" sortable="true" sortProperty="CUSUARI_REG" headerClass="sortable fixed" media="html"  autolink="false" >
                                        <div class="dspText">${miListaId1['TORIGEN']}<c:if test="${!empty miListaId1['TUSUORIDESC']}"> - ${miListaId1['TUSUORIDESC']}</c:if></div>
                                    </display:column>
                                    </axis:visible>
                                    <!-- Bug 0017744 - 25/02/2011 - JMF -->
                                    <axis:visible f="axisper009" c="CUSUARI_ASI">
                                    <display:column title="${title11}" sortable="true" sortProperty="CUSUARI_ASI" headerClass="sortable fixed" media="html"  autolink="false" >
                                        <div class="dspText">${miListaId1['TDESTINO']} - ${miListaId1['TDESCGRUPO']}</div>
                                    </display:column>
                                    </axis:visible>
                                    <axis:visible f="axisper009" c="CTIPAPU">
                                    <display:column title="${title4}" sortable="true" sortProperty="TTIPAPU" headerClass="sortable fixed" media="html"  autolink="false" >
                                        <div class="dspText">${miListaId1['TTIPAPU']}</div>
                                    </display:column>
                                    </axis:visible>
                                     <axis:visible f="axisper009" c="FESTAPU">
                                    <display:column title="${title12}" sortable="true" sortProperty="FESTAPU" headerClass="sortable fixed" media="html"  autolink="false" >
                                        <div class="dspText">
                                        <fmt:formatDate pattern="dd/MM/yyyy" 
                                                        value="${miListaId1['FESTAPU']}"/>
                                       </div>
                                    </display:column>
                                    </axis:visible>
                                     <axis:visible f="axisper009" c="FRECOR">
                                    <display:column title="${title10}" sortable="true" sortProperty="FRECORDATORIO" headerClass="sortable fixed" media="html"  autolink="false" >
                                        <div class="dspText">
                                         <c:set var="color">
                                                        <c:choose>
                                                            <c:when test="${axis:compararFechas(miListaId1['FRECORDATORIO'],today)<0}">
                                                                red
                                                            </c:when>
                                                            <c:otherwise>
                                                                black
                                                               </c:otherwise>
                                                        </c:choose>
                                                    </c:set>
                                         <font color = "${color}"><fmt:formatDate pattern="dd/MM/yyyy" 
                                                        value="${miListaId1['FRECORDATORIO']}"/></font>
                                       </div>
                                    </display:column>
                                    </axis:visible>
                                    <axis:visible f="axisper009" c="CGRUPO_DSP">
                                    <display:column title="${title8}" sortable="true" sortProperty="CGRUPO" headerClass="sortable fixed" media="html"  autolink="false" >
                                        <div class="dspText">
                                            <c:if test="${!empty miListaId1['TLISTGRUPO']}">
                                                ${miListaId1['TLISTGRUPO']}
                                            </c:if>
                                            <c:if test="${!empty miListaId1['DESTGRUPO']}">
                                                <c:if test="${!empty miListaId1['TLISTGRUPO']}">-</c:if>
                                            </c:if>
                                            <c:if test="${!empty miListaId1['DESTGRUPO']}">
                                                ${miListaId1['DESTGRUPO']} 
                                            </c:if>
                                        </div>
                                    </display:column>
                                    </axis:visible>
                                     <axis:visible f="axisper009" c="CESTAPU">
                                    <display:column title="${title9}" sortable="true" sortProperty="TESTAPU" headerClass="sortable fixed" media="html" autolink="false" >
                                        <div class="dspText">${miListaId1['TESTAPU']}</div>
                                    </display:column>
                                    </axis:visible>
                                    <axis:visible f="axisper009" c="TAPUNTE">
                                    <display:column title="${title15}" 
                                                    sortable="true" 
                                                    sortProperty="TAPUNTE" 
                                                    headerClass="sortable fixed" 
                                                    media="html" 
                                                    autolink="false" >
                                    <div class="dspText">
                                        ${miListaId1['TAPUNTE']}
                                    </div>
                                    </display:column>
                                    </axis:visible>
                                     <axis:visible f="axisper009" c="BT_SIN_EDITAR_AGD">
				                         <display:column  headerClass="sortable fixed" media="html" style="width:2%;" autolink="false"  >
				                             <div class="dspIcons">
				                             <img border="0" alt="<axis:alt f="axisper009" c="AGENDACESTADOFINALIZADO_LIT" lit="9001330"/>" title1="<axis:alt f="axisper009" c="AGENDACESTADOFINALIZADO_LIT" lit="9001330"/>" src="images/lapiz.gif"
				                             style="cursor:pointer;" onclick="f_agd_gestioagenda('${miListaId1['IDAPUNTE']}','${miListaId1['IDAGENDA']}','MODIF_AGEN')"/></div>
				                        </display:column>
				                    </axis:visible>
                           			<axis:visible f="axisper009" c="BT_MASDATOS_AGENDA">
                                		<display:column  headerClass="sortable fixed" media="html" style="width:2%;" autolink="false" >
		                                    <div class="dspIcons">
		                                    	<img border="0" alt="<axis:alt c="BT_MASDATOS_AGENDA" f="axisper009" lit="1000113"/>" title1="<axis:alt c="BT_MASDATOS_AGENDA" f="axisper009" lit="1000113"/>" src="images/mes.gif" width="11px" height="11px"
		                                 			style="cursor:pointer;"  onclick="f_agd_gestioagenda('${miListaId1['IDAPUNTE']}','${miListaId1['IDAGENDA']}','CONSULTA')"  />
		                                 	</div>
		                                </display:column>   
		                            </axis:visible>
                                <!-- *************************** SECCION MS DATOS ********************************* -->
                                <display:column class="seccion_informacion">
                                <div id="SECCION_A${miListaId1['IDAPUNTE']}" class="seccion_informacion">
                                    <!-- INICIO SECCION -->
                                    <table class="area" align="center">
                                         <tr>
                                            <th style="width:50%;height:0px"></th>
                                            <th style="width:50%;height:0px"></th>
                                         </tr>
                                         <tr>
                                            <%-- Campo 1 --%>
                                            <td class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;">
                                                <b>${title5}</b>
                                            </td>
                                            <td class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;">
                                                <b>${title7}</b>
                                            </td>
                                        </tr>
                                         <tr>
                                          <axis:visible f="axisper009" c="FALTA">
                                            <%-- Campo 1 --%>
                                              <td class="campocaja" style="background-color:white;border-right-width: 0px;">
                                                <input type="text" class="campo campotexto" id="FALTA_" name="FALTA_" size="15" style="width:90%"
                                                value="<fmt:formatDate pattern="dd/MM/yyyy" 
                                                        value="${miListaId1['FALTA']}"/>" readonly="readonly"/>
                                            </td>
                                          </axis:visible>
                                          <axis:visible f="axisper009" c="CUSUARI_MD">
                                            <%-- Campo 1 --%>
                                              <td class="campocaja" style="background-color:white;border-right-width: 0px;">
                                                <input type="text" class="campo campotexto" id="CUSUARI_MD" name="CUSUARI_MD" size="15" style="width:90%"
                                                value="${miListaId1['CUSUARI']}" readonly="readonly"/>
                                              </td>
                                          </axis:visible>
                                        </tr>
                                         <tr>
                                            <%-- Campo 1 --%>
                                            <td class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;">
                                                <b>${title6}</b>
                                            </td>
                                        </tr>
                                        <tr>
                                          <axis:visible f="axisper009" c="TITTAPU">
                                            <%-- Campo 1 --%>
                                              <td class="campocaja" colspan="2" style="background-color:white;border-right-width: 0px;">
                                                <input type="text" class="campo campotexto" id="TITTAPU__" name="TITTAPU__" size="15" style="width:90%"
                                                value="${miListaId1['TTITAPU']}" readonly="readonly"/>
                                            </td>
                                          </axis:visible>
                                        </tr>
                                        </table>
                                </div>
                            </display:column>
                                    </display:table>
        </div>
      </td>
      <%--FIN TCS-809 26/02/2019 AP--%>
                   <%-- INI TCS-809 26/02/2019 AP <c:set var="title1"><axis:alt f="axisper009" c="IDOBS" lit="9001189"/></c:set> 
                    <c:set var="title2"><axis:alt f="axisper009" c="TCONOBS" lit="9000715"/></c:set> 
                    <c:set var="title14"><axis:alt f="axisper009" c="TTIPOBS" lit="9001195"/></c:set> 
                    <c:set var="title3"><axis:alt f="axisper009" c="TTITOBS" lit="9001196"/></c:set>
                    <c:set var="title4"><axis:alt f="axisper009" c="FALTA" lit="9001192"/></c:set> 
                    <c:set var="title6"><axis:alt f="axisper009" c="CUSUALT" lit="100894"/></c:set> 
                    <c:set var="title8"><axis:alt f="axisper009" c="TESTOBS" lit="100587"/></c:set>
                    <c:set var="title13"><axis:alt f="axisper009" c="BT_MASDATOS_APUNTE" lit="1000113"/></c:set> 
                    <c:set var="title12"><axis:alt f="axisper009" c="BT_EDIT_APUNTE" lit="9000552"/></c:set> 
                    <c:set var="title9"><axis:alt f="axisper009" c="BT_BORRAR_APUNTE" lit="100587"/></c:set>
					
					<div class="displayspace">
					
					<display:table name="${__formdata.PLSTAGENDA_TRAMI}" id="LISTAAPUNTESAGENDA" export="false" class="dsptgtable" pagesize="-1"  defaultorder="ascending" requestURI="axis_axisper009.do?paginar=true" sort="list" cellpadding="0" cellspacing="0">
						<%@ include file="../include/displaytag.jsp"%>
						<axis:visible f="axisper009" c="IDAPUNTE">
							<display:column title="${title1}" sortable="true" sortProperty="IDOBS" style="width:5%;" headerClass="sortable fixed"  media="html" autolink="false" >    
							<div class="dspNumber">${LISTAAPUNTESAGENDA['IDOBS']}</div>
							</display:column>
						</axis:visible>
						<!--  -->
						
						<axis:visible c="TCONAPU" f="axisper009">
                            <display:column title="${title2}" sortable="true" sortProperty="TCONOBS" style="width:15%;" headerClass="sortable fixed"  media="html" autolink="false" >
                                <div class="dspText">${LISTAAPUNTESAGENDA['TCONOBS']}</div>
                            </display:column>
                        </axis:visible>   
                        <axis:visible c="TCONAPU" f="axisper009">
                            <display:column title="${title14}" sortable="true" sortProperty="TTIPOBS" style="width:10%;" headerClass="sortable fixed"  media="html" autolink="false" >
                                <div class="dspText">${LISTAAPUNTESAGENDA['TTIPOBS']}</div>
                            </display:column>
                        </axis:visible>
                        <axis:visible c="TTITAPU" f="axisper009">
                            <display:column title="${title3}" sortable="true" sortProperty="TTITOBS" style="width:18%;" headerClass="sortable fixed"  media="html" autolink="false" >
                                <div class="dspText">${LISTAAPUNTESAGENDA['TTITOBS']}</div>
                            </display:column>
                        </axis:visible>    
                        <axis:visible c="FALTA" f="axisper009">
                            <display:column title="${title4}" sortable="true" sortProperty="FALTA" style="width:10%;" headerClass="sortable fixed"  media="html" autolink="false" >
                                <div class="dspText"><fmt:formatDate pattern="dd/MM/yyyy" value="${LISTAAPUNTESAGENDA['FALTA']}"/></div>
                            </display:column>
                        </axis:visible>
                        <axis:visible c="CUSUARI" f="axisper009">
                            <display:column title="${title6}" sortable="true" sortProperty="CUSUALT" style="width:10%;" headerClass="sortable fixed"  media="html" autolink="false" >
                                <div class="dspText">${LISTAAPUNTESAGENDA['CUSUALT']}</div>
                            </display:column>
                        </axis:visible>
                        <axis:visible c="TESTAPU" f="axisper009">
                            <display:column title="${title8}" sortable="true" sortProperty="TESTOBS" style="width:15%;" headerClass="sortable fixed"  media="html" autolink="false" >
                                <div class="dspText">${LISTAAPUNTESAGENDA['TESTOBS']}</div>
                            </display:column>
                        </axis:visible>    
                        
                        <!--  -->
						 <axis:visible f="axisper009" c="BT_SIN_CONSULTAR_AGD">
                             <display:column title="${title13}" headerClass="sortable fixed" media="html" style="width:7%;" autolink="false" >
                                <div class="dspIcons"><img border="0" alt="<axis:alt f="axisper009" c="MASDATOS_AGENDA_LIT" lit="1000113"/>" title1="<axis:alt f="axisper009" c="MASDATOS_AGENDA_LIT" lit="1000113"/>" src="images/mes.gif" width="11px" height="11px"
                                style="cursor:pointer;"   onclick="f_gestioagenda_apunte('${LISTAAPUNTESAGENDA['IDOBS']}',4,1)"  />
                                </div>
                            </display:column>   
                        </axis:visible>
						
						
						<axis:visible f="axissin006" c="BT_EDIT_APUNTE">
	                      <display:column title="${title12}" headerClass="sortable fixed" media="html" style="width:7%;" autolink="false"  >
	               
	                            <div class="dspIcons" align="left"><img border="0" alt="<axis:alt f="axissin006" c="AGENDACESTADOFINALIZADO_LIT" lit="9001330"/>" title1="<axis:alt f="axissin006" c="AGENDACESTADOFINALIZADO_LIT" lit="9001330"/>" src="images/lapiz.gif"
	                            style="cursor:pointer;" onclick="f_gestioagenda_apunte('${LISTAAPUNTESAGENDA['IDOBS']}',4,0)"/></div>
	                      
	                      </display:column>
	                    </axis:visible>
						
                     <axis:visible f="axissin006" c="BT_BORRAR_APUNTE">
	                     <display:column title="" headerClass="sortable fixed" media="html" style="width:7%;" autolink="false"  >
	                     
	                         <div class="dspIcons" align="left"><img border="0" alt="<axis:alt f="axissin006" c="AGENDACESTADOFINALIZADO_LIT" lit="9001330"/>" title1="<axis:alt f="axissin006" c="AGENDACESTADOFINALIZADO_LIT" lit="9001330"/>" src="images/delete.gif"
	                         style="cursor:pointer;" onclick="f_borrar_agenda('${LISTAAPUNTESAGENDA['IDOBS']}')"/></div>
	                     
	                     </display:column>
                      </axis:visible>
                        
                       
					</display:table>
					
					</div> FIN TCS-809 26/02/2019 AP--%>
                </tr>
			</table>
				
</axis:visible>


<!-- ************************* FIN DATOS AGENDA CONF-347********************* -->





<!-- ********************************************************************************************** -->

<axis:visible c="DSP_PARPER" f="axisper009">
  <div class="titulo"><a name="posicionPorColorcar__PARPER" id="posicionPorColorcar__PARPER" ></a>
    <b><axis:alt f="axisper009" c="DSP_PARPER" lit="9001817"/></b>
  </div>
  <axis:visible f="axisper009" c="BT_EDITPROPI">
  <c:if test="${! ocultarIconosEdicion && __configform.axisper009__BT_EDITAR_PROPIEDAD__visible != 'false'}">
    <div style="float:right;">
      
        <img border="0" alt='<axis:alt f="axisper009" c="LIT_EDITAR" lit="100002"/>'
             title='<axis:alt f="axisper009" c="LIT_EDITAR" lit="100002"/>' src="images/lapiz.gif"
             	onclick="f_abrir_axisper023('${dades_persona.SPERSON}','${dades_persona.CAGENTE}')"/>
      
    </div>
  </c:if>
  </axis:visible>
  <table class="seccion"  onclick="objSeccion.actualizarPosicionPorColocarCookie('axisper009','PARPER');return true;">
    <tr>
      <td>
        <!-- DisplayTag datos parametros persona -->
        <c:set var="title1">
          <axis:alt f="axisper009" c="TPARAM" lit="9001819"/>
        </c:set>
        <c:set var="title2">
          <axis:alt f="axisper009" c="TVALPAR" lit="101159"/>
        </c:set>
        <c:set var="title3">
          <axis:alt f="axisper009" c="TVALPAR" lit="111471"/>
        </c:set>
        <div class="displayspace">
          <display:table name="${dades_persona.PARPER}" id="T_IAX_PARPER"
                         export="false" class="dsptgtable" pagesize="-1"
                         sort="list"
                         cellpadding="0" cellspacing="0"
                         requestURI="axis_axisper009.do?operation=form&paginar=true&subpantalla=masdatos">
            <%@ include file="../include/displaytag.jsp"%>
            <display:column headerClass="sortable fixed" title="${title3}"
                            sortable="true" sortProperty="TPARAM" media="html"
                            style="width:20%" autolink="false">
              <div class="dspText">
                <b> ${T_IAX_PARPER.TGRPPAR}</b>
              </div>
            </display:column>
            <display:column headerClass="sortable fixed" title="${title1}"
                            sortable="true" sortProperty="TPARAM" media="html"
                            style="width:25%" autolink="false">
              <div class="dspText">
                ${T_IAX_PARPER.TPARAM}
              </div>
            </display:column>
            <display:column title="${title2}" sortable="true"
                            sortProperty="XVALPAR" headerClass="sortable fixed"
                            media="html" style="width:25%" autolink="false">
              <c:if test="${T_IAX_PARPER.CTIPO==1}">
                <div class="dspText">
                  ${T_IAX_PARPER.TVALPAR}
                </div>
              </c:if>
              <c:if test="${T_IAX_PARPER.CTIPO==2}">
                <div class="dspText">
                  ${T_IAX_PARPER.NVALPAR}
                </div>
              </c:if>
              <c:if test="${T_IAX_PARPER.CTIPO==3}">
                <div class="dspText">
                  <fmt:formatDate value="${T_IAX_PARPER.FVALPAR}"
                                  pattern="dd/MM/yyyy"/>
                </div>
              </c:if>
              <c:if test="${T_IAX_PARPER.CTIPO==4 || T_IAX_PARPER.CTIPO==5}">
                <div class="dspText">
                  ${T_IAX_PARPER.RESP}
                </div>
              </c:if>
            </display:column>
          </display:table>
        </div>
      </td>
    </tr>
  </table>
</axis:visible>

<axis:visible c="DSP_IRPF" f="axisper009">
  <!-- Datos IRPF  -->
  <c:if test="${empty dades_persona.CTIPPER || dades_persona.CTIPPER != 2}">
    <div class="titulo"><a name="posicionPorColorcar__IRPF" id="posicionPorColorcar__IRPF" ></a>
      <b><axis:alt f="axisper009" c="DSP_IRPF" lit="112579"/></b>
    </div>
    <table class="seccion"  onclick="objSeccion.actualizarPosicionPorColocarCookie('axisper009','IRPF');return true;">
      <c:if test="${! ocultarIconosEdicion}">
        <div style="float:right;">
          <axis:visible f="axisper009" c="BT_EDITIRPF">
          <c:if test="${__configform.axisper009__BT_EDITAR_IRPF__visible != 'false'}">
              
                <img border="0"
                     alt='<axis:alt f="axisper009" c="LIT_EDITAR" lit="100002"/><axis:alt f="axisper009" c="LIT_EDITAR_IRPF" lit="112579"/>'
                     title='<axis:alt f="axisper009" c="LIT_EDITAR" lit="100002"/><axis:alt f="axisper009" c="LIT_EDITAR_IRPF" lit="112579"/>'
                     src="images/lapiz.gif"
                     onclick="f_abrir_axiper018('${dades_persona.SPERSON}','${dades_persona.CAGENTE}','${dades_persona.OB_IAX_IRPF.NANO}')"/>
              
              &nbsp;&nbsp; 
          </c:if>
          </axis:visible>
          <axis:visible f="axisper009" c="BT_DELIRPF">
          <c:if test="${__configform.axisper009__BT_BORRAR_IRPF__visible != 'false'}">
              
                <img border="0"
                     alt='<axis:alt f="axisper009" c="LIT_ELIMINAR" lit="1000127"/><axis:alt f="axisper009" c="LIT_EDITAR_IRPF" lit="112579"/>'
                     title='<axis:alt f="axisper009" c="LIT_ELIMINAR" lit="1000127"/><axis:alt f="axisper009" c="LIT_EDITAR_IRPF" lit="112579"/>'
                     src="images/delete.gif"
                     onclick="f_borrar_IRPF('${dades_persona.SPERSON}')"/>
              
              &nbsp;&nbsp; 
          </c:if>
          </axis:visible>
          <axis:visible f="axisper009" c="BT_NVIRPF">
          <c:if test="${__configform.axisper009__BT_ANADIR_IRPF__visible != 'false'}">
              
                <img border="0"
                     alt='<axis:alt f="axisper009" c="LIT_ANADIR_D" lit="104825"/><axis:alt f="axisper009" c="LIT_EDITAR_IRPF" lit="112579"/>'
                     title='<axis:alt f="axisper009" c="LIT_ANADIR_T" lit="104825"/><axis:alt f="axisper009" c="LIT_EDITAR_IRPF" lit="112579"/>'
                     src="images/new.gif"
                     onclick="f_abrir_axiper018('${dades_persona.SPERSON}','${dades_persona.CAGENTE}')"/>
              
          </c:if>
          </axis:visible>
        </div>
      </c:if>
    
      <tr>
        <td>
                          <!-- Datos IRPF  -->
                    <table class="area">
                        <tr>
                            <th style="width:2%;height:0px"></th>
                            <th style="width:22%;height:0px"></th>
                            <th style="width:22%;height:0px"></th>
                            <th style="width:22%;height:0px"></th>
                            <th style="width:22%;height:0px"></th>                                            
                            <th style="width:8%;height:0px"></th>
                        <tr>
                        <tr>
                            <td class="campocaja" colspan="6">
                                <div style="float:left;">
                                    <b><axis:alt f="axisper009" c="TIT_PERCEP" lit="9901095"/></b>
                                </div>
                                <div style="clear:both;">
                                    <hr class="titulo">
                                </div>
                            </td>
                        </tr>
                         
                        <tr>
                            <td></td>
                            <td class="titulocaja">
                                <b><axis:alt f="axisper009" c="NANO" lit="101606"/></b>
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td class="campocaja"  colspan="3">                                                        
                                <select name="NANO" id="NANO" size="1" style="width:10%"
                                        onchange="actualitza_any(this.value)"
                                        class="campowidthselect campo campotexto_ob">
                                    &nbsp;
                                    <c:if test="${empty __formdata.NANO}">
                                        <option value="<%= Integer.MIN_VALUE %>">
                                            -<axis:alt f="axisper009" c="LIT_SELECT" lit="1000348"/>-
                                        </option>
                                    </c:if>
                                    <c:forEach var="element" items="${__formdata.listValores.lstNanos}">
                                        <option value="${element.NANO}"
                                        <c:if test="${element.NANO == __formdata.NANO}"> selected </c:if>/>
                                        ${element.NANO}
                                    </c:forEach>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td class="titulocaja"><b><axis:alt f="axisper009" c="CSITFAM" lit="9000879"/></b></td>
                            <c:if test="${dades_persona.OB_IAX_IRPF.CSITFAM == 2}"> 
                                <td class="titulocaja"><b><axis:alt f="axisper009" c="CNIFCON" lit="9000880"/></b></td>
                            </c:if>
                            <td class="titulocaja"><b><axis:alt f="axisper009" c="TGRADO" lit="9000882"/></b></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td class="campocaja">
                                <input type="text" name="TSITFAM" value="${dades_persona.OB_IAX_IRPF.TSITFAM}"
                                        class="campowidthinput campo campotexto" style="width:95%"
                                        <axis:atr f="axisper009" c="TSITFAM" a="modificable=false"/>/>
                            </td>  
                            
                            <c:if test="${dades_persona.OB_IAX_IRPF.CSITFAM == 2}"> 
                            <td class="campocaja" id="CCNIFCON">
                                <input type="text" name="CNIFCON" id="CNIFCON" value="${dades_persona.OB_IAX_IRPF.CNIFCON}"  class="campowidthinput campo campotexto" style="width:95%"
                                    <axis:atr f="axisper009" c="CNIFCON" a="modificable=false"/>/>
                            </td>  
                           </c:if>
                            
                            <td class="campocaja">
                                <input type="text" name="TGRADO" value="${dades_persona.OB_IAX_IRPF.TGRADO}"
                                       class="campowidthinput campo campotexto" style="width:95%"
                                        <axis:atr f="axisper009" c="TGRADO" a="modificable=false"/>/>                                                       
                            </td>                                                          
                        </tr>  
                        
                        <tr>
                            <td></td>
                            <td class="titulocaja">
                                <b><axis:alt f="axisper009" c="FMOVGEO" lit="9000885"/></b>
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td class="titulocaja" >
                                <input   type="text"  class="campowidthinput campo campotexto" id="FMOVGEO"  style="width:40%" name="FMOVGEO"  
                                            <axis:atr f="axisper009" c="FMOVGEO" a="modificable=false&formato=fecha"/> value="<fmt:formatDate pattern="dd/MM/yyyy" value="${dades_persona.OB_IAX_IRPF.FMOVGEO}"/>"/>                                    
                            </td>
                            <td class="titulocaja" colspan="2"><b><axis:alt f="axisper009" c="LIT_PROLON" lit="9000886"/></b>
                                <input type="checkbox" name="PROLON" disabled <c:if test="${dades_persona.OB_IAX_IRPF.PROLON == 1}">checked</c:if> 
                                    value="${dades_persona.OB_IAX_IRPF.PROLON}"  <axis:atr f="axisper009" c="PROLON" a="modificable=false"/>/>    
                            </td>                                                             
                        </tr>   
                        <tr>
                            <td colspan="6">
                                <table class="area" >                         
                                    <tr>
                                        <td class="campocaja" colspan="6" >
                                            <div class="separador">&nbsp;</div>   
                                            <div style="float:left;">
                                                <img id="descendents_parent" src="images/mes.gif" onclick="objEstilos.toggleDisplay('descendents', this);objSeccion.actualizarSeccionPorAbrirCookie('axisper009','descendents');" style="cursor:pointer"/>
                                                <b><axis:alt f="axisper009" c="TIT_DESCEN" lit="9001276"/></b>&nbsp;&nbsp;
                                            </div>
                                            <div style="clear:both;">
                                                <hr class="titulo">
                                            </div>
                                        </td>
                                    </tr>
                                    <!--  INICIO SECCION CAMPOS **********************************************************  -->
                                    <tr id="descendents_children" style="display:none">                                        
                                        <td>&nbsp;&nbsp;</td>   
                                        <td class="campocaja">
                                            <c:if test="${!empty dades_persona.OB_IAX_IRPF.DESCENDIENTES}">
                                                 <div class="displayspace">
                                                    <c:set var="title1"><axis:alt f="axisper009" c="NORDEN" lit="500102"/></c:set>
                                                    <c:set var="title2"><axis:alt f="axisper009" c="FNACIMI" lit="101606"/></c:set>
                                                    <c:set var="title0"><axis:alt f="axisper009" c="TGRADO" lit="9000882"/></c:set>
                                                    <c:set var="title3"><axis:alt f="axisper009" c="CENTER" lit="9000887"/></c:set>
                                                    <c:set var="title4"><axis:alt f="axisper009" c="FADOPCION" lit="9901108"/></c:set>
                                                    
                                                    <display:table name="${dades_persona.OB_IAX_IRPF.DESCENDIENTES}" id="DESCENDIENTES" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" cellpadding="0" cellspacing="0"
                                                               requestURI="axis_axisper009.do?paginar=true&subpantalla=datosgenerales">                                                     
                                                               <%@ include file="../include/displaytag.jsp"%>
                                                               <display:column title="${title1}" sortable="true" style="width:10%;" sortProperty="NORDEN" headerClass="sortable"   media="html" autolink="false" >
                                                                   <div class="dspText">${DESCENDIENTES.OB_IAX_IRPFDESCEN.NORDEN}</div>
                                                               </display:column>
                                                                <display:column title="${title2}" sortable="true" style="width:10%;" sortProperty="NANO" headerClass="sortable"   media="html" autolink="false" >
                                                                   <div class="dspText"><fmt:formatDate pattern="dd/MM/yyyy" value="${DESCENDIENTES.OB_IAX_IRPFDESCEN.FNACIMI}"/></div>
                                                               </display:column>
                                                                <display:column title="${title4}" sortable="true" style="width:10%;" sortProperty="NANO" headerClass="sortable"   media="html" autolink="false" >
                                                                   <div class="dspText"><fmt:formatDate pattern="dd/MM/yyyy" value="${DESCENDIENTES.OB_IAX_IRPFDESCEN.FADOPCION}"/></div>
                                                               </display:column>
                                                               <display:column title="${title0}" sortable="true" style="width:55%;" sortProperty="TGRADO" headerClass="headwidth5 sortable"  media="html" autolink="false" >
                                                                   <div class="dspText">${DESCENDIENTES.OB_IAX_IRPFDESCEN.TGRADO}</div>
                                                               </display:column>
                                                               <display:column title="${title3}" sortable="true" style="width:15%;" sortProperty="CENTER" headerClass="headwidth5 sortable"  media="html" autolink="false" >
                                                                    <div class="dspText" align="center"><input type="checkbox" name="OB_IAX_IRPFDESCEN.CENTER" disabled <c:if test="${DESCENDIENTES.OB_IAX_IRPFDESCEN.CENTER == 1}">checked</c:if> /></div>                                                           
                                                               </display:column>      
                                                    </display:table>
                                                </div>
                                            </c:if>
                                            <c:if test="${empty dades_persona.OB_IAX_IRPF.DESCENDIENTES}">
                                                <b><axis:alt f="axisper009" c="LIT_NO_DATA" lit="120135"/></b>
                                            </c:if>                                      
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="6">
                            <table class="area" >                         
                                <tr>
                                    <td class="campocaja" colspan="6" >
                                            <div class="separador">&nbsp;</div>   
                                            <div style="float:left;">
                                                <img id="mayores_parent" src="images/mes.gif" onclick="objEstilos.toggleDisplay('mayores', this);objSeccion.actualizarSeccionPorAbrirCookie('axisper009','mayores');" style="cursor:pointer"/>
                                                <b><axis:alt f="axisper009" c="TIT_ASCEN" lit="9001277"/></b>&nbsp;&nbsp;
                                            </div>
                                            <div style="clear:both;">
                                                <hr class="titulo">
                                            </div>
                                    </td>
                                </tr>
                                <!--  INICIO SECCION CAMPOS **********************************************************  -->
                                <tr id="mayores_children" style="display:none">
                                    <td>&nbsp;&nbsp;</td>           
                                    <td class="campocaja" > 
                                        <c:if test="${!empty dades_persona.OB_IAX_IRPF.MAYORES}">
                                                <div class="displayspace">
                                                    <c:set var="title1"><axis:alt f="axisper009" c="NORDEN" lit="500102"/></c:set>
                                                    <c:set var="title2"><axis:alt f="axisper009" c="NANO" lit="101606"/></c:set>
                                                    <c:set var="title0"><axis:alt f="axisper009" c="TGRADO" lit="9000882"/></c:set>
                                                    <c:set var="title3"><axis:alt f="axisper009" c="NVIVEN" lit="9000889"/></c:set>
                                                    <c:set var="title4"><axis:alt f="axisper009" c="CRENTA" lit="9000890"/></c:set>
                                                    <display:table name="${dades_persona.OB_IAX_IRPF.MAYORES}" id="MAYORES" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" cellpadding="0" cellspacing="0"
                                                               requestURI="axis_axisper018.do?paginar=true&subpantalla=datosgenerales">                                                     
                                                               <%@ include file="../include/displaytag.jsp"%>
                                                        <display:column title="${title1}" sortable="true" style="width:10%;" sortProperty="NORDEN" headerClass="sortable"   media="html" autolink="false" >
                                                            <div class="dspText">${MAYORES.OB_IAX_IRPFMAYORES.NORDEN}</div>
                                                        </display:column>
                                                        <display:column title="${title2}" sortable="true" style="width:10%;" sortProperty="NANO" headerClass="sortable"   media="html" autolink="false" >
                                                            <div class="dspText"><fmt:formatDate pattern="dd/MM/yyyy" value="${MAYORES.OB_IAX_IRPFMAYORES.FNACIMI}"/></div>
                                                        </display:column>
                                                        <display:column title="${title0}" sortable="true" style="width:45%;" sortProperty="TGRADO" headerClass="headwidth5 sortable"  media="html" autolink="false" >
                                                            <div class="dspText">${MAYORES.OB_IAX_IRPFMAYORES.TGRADO}</div>
                                                        </display:column>
                                                        <display:column title="${title3}" sortable="true" style="width:10%;" sortProperty="NVIVEN" headerClass="headwidth5 sortable"  media="html" autolink="false" >
                                                            <div class="dspText" align="center"><input type="checkbox" name="OB_IAX_IRPFMAYORES.NVIVEN" disabled <c:if test="${MAYORES.OB_IAX_IRPFMAYORES.NVIVEN == 1}">checked</c:if> /></div>
                                                        </display:column> 
                                                        <display:column title="${title4}" sortable="true" style="width:15%;" sortProperty="CRENTA" headerClass="headwidth5 sortable"  media="html" autolink="false" >
                                                            <div class="dspText" align="center"><input type="checkbox" name="OB_IAX_IRPFMAYORES.CRENTA" disabled <c:if test="${MAYORES.OB_IAX_IRPFMAYORES.CRENTA == 1}">checked</c:if> /></div>
                                                        </display:column>         
                                                    </display:table>    
                                                </div>
                                        </c:if>
                                        <c:if test="${empty dades_persona.OB_IAX_IRPF.MAYORES}">
                                            <b><axis:alt f="axisper009" c="LIT_NO_DATA" lit="120135"/></b>
                                        </c:if>
                                    </td>
                                </tr>
                            </table>
                            </td>
                        </tr>
                        
                        <tr>
                            <td class="campocaja" colspan="6">
                                <div style="float:left;">
                                    <b><axis:alt f="axisper009" c="TIT_PENSIO" lit="9901097"/></b>
                                </div>
                                <div style="clear:both;">
                                    <hr class="titulo">
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <c:if test="${dades_persona.OB_IAX_IRPF.CSITFAM == 2}"> 
                                <td class="titulocaja" id="TIPENSION"><b ><axis:alt f="axisper009" c="TIPENSION" lit="9000881"/></b></td>
                            </c:if>
                            <td class="titulocaja"><b><axis:alt f="axisper009" c="IANUHIJOS" lit="9000883"/></b></td> 
                        </tr>
                        <tr>
                           <td></td> 
                           <c:if test="${dades_persona.OB_IAX_IRPF.CSITFAM == 2}"> 
                           <td class="campocaja" id="IIPENSION">
                                <input type="text" name="IPENSION" id="IPENSION" value="${dades_persona.OB_IAX_IRPF.IPENSION}"  class="campowidthinput campo campotexto" style="width:30%"
                                    <axis:atr f="axisper009" c="IPENSION" a="modificable=false"/>/>
                            
                            </td>
                            </c:if>
                            <td class="campocaja">
                                <input type="text" name="IANUHIJOS" value="${dades_persona.OB_IAX_IRPF.IANUHIJOS}"  class="campowidthinput campo campotexto" style="width:30%"
                                    <axis:atr f="axisper009" c="IANUHIJOS" a="modificable=false"/>/>
                            </td> 
                        </tr>
                        <tr>
                            <td class="campocaja" colspan="6">
                                <div style="float:left;">
                                    <b><axis:alt f="axisper009" c="TIT_PAGOS" lit="9901098"/></b>
                                </div>
                                <div style="clear:both;">
                                    <hr class="titulo">
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td class="titulocaja" colspan="3"><b><axis:alt f="axisper009" c="CPAGO" lit="9901099"/></b>
                                <input type="checkbox" name="CPAGO" id="CPAGO" disabled  <c:if test="${dades_persona.OB_IAX_IRPF.CPAGO == 1}">checked</c:if> value="${dades_persona.OB_IAX_IRPF.CPAGO}"  
                                        <axis:atr f="axisper009" c="CPAGO" a="modificable=false"/>/>
                            </td>
                        </tr>
                    
                    </table> 
        </td>
        </tr>
      
    </table>
  </c:if>
</axis:visible>
<!-- ************************* FIN DATOS IRPF  ********************* -->

<!-- ************************* DOCUMENTOS  ********************* -->
<axis:visible c="DSP_DOCUMENTOS" f="axisper009">

<%--c:if test="${ ! empty __formdata.axisgedox }"--%>
<div class="titulo"><a name="posicionPorColorcar__DATOS_DOCUMENTACION" id="posicionPorColorcar__DATOS_DOCUMENTACION" ></a>
      <b><axis:alt f="axisper009" c="LIT_DSP_DOCUM" lit="9001358"/></b>
    </div>
    <table class="seccion" onclick="objSeccion.actualizarPosicionPorColocarCookie('axisper009','DATOS_DOCUMENTACION');return true;">
      <axis:visible f="axisper009" c="BT_NVPERREL">
      <c:if test="${! ocultarIconosEdicion && __configform.axisper009__BT_ANADIR_PERREL__visible != 'false'}">
        <axis:visible c="BT_ALTA_FILE" f="axisper009">
                            <div style="float:right;">
                                
                                	<img onclick="f_but_1000615()" border="0" alt="<axis:alt f="axisper009" c="FILE" lit="1000615"/>" 
                                			title="<axis:alt f="axisper009" c="FILE" lit="1000615"/>" src="images/new.gif"/>
                                
                            </div>
                        </axis:visible>
      </c:if>
      </axis:visible>
      <tr>
        <td class="campocaja" >
                            <c:set var="title0"><axis:alt f="${pantalla}" c="DESCRIPCION" lit="100588"></axis:alt></c:set>
                            <c:set var="title1"><axis:alt f="${pantalla}" c="FICHERO" lit="105940"></axis:alt></c:set>
                            <c:set var="title2"><axis:alt f="${pantalla}" c="TORIGEN" lit="101162"></axis:alt></c:set>
                            <c:set var="title3"><axis:alt f="${pantalla}" c="TUSUARIO" lit="9001356"></axis:alt></c:set>
                            <c:set var="title4"><axis:alt f="${pantalla}" c="FALTA" lit="105887"></axis:alt></c:set>
                            <c:set var="title5"><axis:alt f="${pantalla}" c="TMOTMOV" lit="100565"></axis:alt></c:set>
                            <display:table name="${dades_persona.DATOS_DOCUMENTACION}" id="documento" export="false" class="dsptgtable" pagesize="-1"  sort="list" cellpadding="0" cellspacing="0"
                             requestURI="modal_axisper009.do?paginar=true">
                                <%@ include file="../include/displaytag.jsp"%>
                                <display:column title="${title0}" sortable="true" sortProperty="TDESCRIP" headerClass="sortable"  media="html" autolink="false" >
                                            <div class="dspText">${documento.OB_IAX_DOCPERSONA.TDESCRIP}</div>
                                </display:column>
                                
                                <display:column title="${title1}" sortable="true" sortProperty="FICHERO" headerClass="sortable"  media="html" autolink="false" >
                                            <div class="dspText" onclick="f_ver_doc('${documento.OB_IAX_DOCPERSONA.IDDOCGEDOX}');"><a hrefx="#">${documento.OB_IAX_DOCPERSONA.FICHERO}</a></div>
                                </display:column>
                                <display:column title="${title4}" sortable="true" sortProperty="FALTA" headerClass="sortable"  media="html" autolink="false" >
                                            <div class="dspDate"><fmt:formatDate value="${documento.OB_IAX_DOCPERSONA.FALTA}" pattern="dd/MM/yyyy"/></div>
                                </display:column>
                                <display:column title="${title2}" sortable="true" sortProperty="TOBSERVA" headerClass="sortable"  media="html" autolink="false" >
                                            <div class="dspText">${documento.OB_IAX_DOCPERSONA.TOBSERVA}</div>
                                </display:column>
                                <display:column title="${title3}" sortable="true" sortProperty="FCADUCA" headerClass="sortable"  media="html" autolink="false" >
                                            <div class="dspDate"><fmt:formatDate value="${documento.OB_IAX_DOCPERSONA.FCADUCA}" pattern="dd/MM/yyyy"/></div>
                                </display:column>
                                  <axis:visible f="axisper009" c="BT_MODIFDOCUM">
                                <display:column title="" headerClass="headwidth5 sortable" media="html" autolink="false" >
                                   <div class="dspIcons"><img border="0"  src="images/lapiz.gif" width="15px" height="15px"
                                        style="cursor:pointer;" onclick="f_modifdocum('${documento.OB_IAX_DOCPERSONA.SPERSON}','${documento.OB_IAX_DOCPERSONA.IDDOCGEDOX}')"/>
                                        </div>
                                </display:column> 
                                </axis:visible>
                            </display:table>
                            <c:if test="${!empty __formdata.dades_persona.DATOS_DOCUMENTACION}">
                                <c:if test="${ !(fn:containsIgnoreCase(header['User-Agent'],'ipad') ) }">
                                    <script language="javascript">objUtiles.retocarDsptagtable("documento");</script>
                                </c:if>
                            </c:if>
        </td>
      </tr>
    <%--    </c:if>--%>
    </table>
</axis:visible>
<!-- ************************* DOCUMENTOS  ********************* -->
<!-- ************************* MARCAS  ********************* -->
<axis:visible c="DSP_MARCAS" f="axisper009">
<%--c:if test="${ ! empty __formdata.axisgedox }"--%>
<div class="titulo"><a name="posicionPorColorcar__PERMARCAS" id="posicionPorColorcar__PERMARCAS" ></a>
      <b><axis:alt f="axisper009" c="LIT_DSP_MARCAS" lit="9909288"/></b>
    </div>
    
  <axis:visible f="axisper009" c="BT_EDITMARCAS"><!--IAXIS-5125-->
  <c:if test="${! ocultarIconosEdicion && __configform.axisper009__BT_EDITMARCAS__visible != 'false'}"><!--IAXIS-4888-->
    <div style="float:right;">
      
        <img border="0" alt='<axis:alt f="axisper009" c="LIT_EDITAR" lit="100002"/>'
             title='<axis:alt f="axisper009" c="LIT_EDITAR" lit="100002"/>' src="images/lapiz.gif"
             	onclick="f_abrir_axisper044('${dades_persona.SPERSON}')"/>
      
    </div>
  </c:if>
  </axis:visible>
        
    <table class="seccion" onclick="objSeccion.actualizarPosicionPorColocarCookie('axisper009','PERMARCAS');return true;">
     
      <tr>
        <td class="campocaja" >
                            <c:set var="title0"><axis:alt f="${pantalla}" c="CMARCA" lit="1000109"></axis:alt></c:set>
                            <c:set var="title1"><axis:alt f="${pantalla}" c="CMARCA" lit="9001046"></axis:alt></c:set>
                            <c:set var="title2"><axis:alt f="${pantalla}" c="CMARCA" lit="101159"></axis:alt></c:set>                            
                                                        
                            <display:table name="${dades_persona.PERMARCAS}" id="marca" export="false" class="dsptgtable" pagesize="-1"  sort="list" cellpadding="0" cellspacing="0"
                             requestURI="modal_axisper009.do?paginar=true">
                                <%@ include file="../include/displaytag.jsp"%>
                                <display:column title="${title0}" sortable="true" sortProperty="CMARCA" headerClass="sortable"  media="html" autolink="false" >
                                            <div class="dspText">${marca.OB_IAX_PERMARCAS.CMARCA}</div>
                                </display:column>
                                
                                <display:column title="${title1}" sortable="true" sortProperty="DESCRIPCION" headerClass="sortable"  media="html" autolink="false" >
                                            <div class="dspText">${marca.OB_IAX_PERMARCAS.DESCRIPCION}</div>
                                </display:column>

                               <display:column title="${title2}" sortable="true" style="width:15%;" sortProperty="CENTER" headerClass="headwidth5 sortable"  media="html" autolink="false" >
                                            <div class="dspText" align="center"><input type="checkbox" name="marca.OB_IAX_PERMARCAS.CVALOR" disabled <c:if test="${marca.OB_IAX_PERMARCAS.CVALOR == 1}">checked</c:if> /></div>                                                           
                                </display:column>        
                                                                  
                            </display:table>                            
        </td>
      </tr>
    <%--    </c:if>--%>
    </table>
</axis:visible>
<!-- ************************* MARCAS  ********************* -->
<!-- ************************* RIESGO  ********************* -->

<%--<c:if test="${empty dades_persona.CTIPPER || dades_persona.CTIPPER == 2}">--%>
<axis:visible c="DSP_RIESGO" f="axisper009">

<div class="titulo"><a name="posicionPorColorcar__RIESGO" id="posicionPorColorcar__RIESGO" ></a>
      <b><axis:alt f="axisper009" c="LIT_DSP_RIESGO" lit="9910011"/></b>
    </div>
    <table class="seccion" onclick="objSeccion.actualizarPosicionPorColocarCookie('axisper009','DATOS_RIESGO_FINANCIERO');return true;">
      <axis:visible f="axisper009" c="BT_NVRIESGO">
        <axis:visible c="BT_ALTA_RIESGO" f="axisper009">
                            <div style="float:right;">
                                
                                	<img onclick="f_but_9910012()" border="0" alt="<axis:alt f="axisper009" c="FILE" lit="9910012"/>" 
                                			title="<axis:alt f="axisper009" c="FILE" lit="9910012"/>" src="images/new.gif"/>
                                
                            </div>
                        </axis:visible>
     
      </axis:visible>
      <tr>
        <td class="campocaja" >
        <!-- INI - AXIS 2554 - 13/5/2019 - AABG - SE REALIZA VALIDACION PARA MOSTRAR CAMPOS RESPECTIVOS EN PERSONA NATURAL O JURIDICA -->
        <c:if test="${dades_persona.DATOS_RIESGO_FINANCIERO[0].OB_IAX_RIESGO_FINANCIERO.STIPOPERSONA == 'J'}">
        	<c:set var="title0"><axis:alt f="${pantalla}" c="NRIESGO" lit="9001802"></axis:alt></c:set>
        	<c:set var="title1"><axis:alt f="${pantalla}" c="NPROBINCUMPLIMIENTO" lit="89906301"></axis:alt></c:set>
            <c:set var="title2"><axis:alt f="${pantalla}" c="DESRIESGO" lit="100588"></axis:alt></c:set>
            <c:set var="title3"><axis:alt f="${pantalla}" c="FCALCULO" lit="9910013"></axis:alt></c:set>
            <c:set var="title4"><axis:alt f="${pantalla}" c="MONTO" lit="9910014"></axis:alt></c:set>
        </c:if>
        <c:if test="${dades_persona.DATOS_RIESGO_FINANCIERO[0].OB_IAX_RIESGO_FINANCIERO.STIPOPERSONA == 'N'}">
        	<c:set var="title0"><axis:alt f="${pantalla}" c="NPUNTAJESCORE" lit="9909106"></axis:alt></c:set>
        	<c:set var="title1"><axis:alt f="${pantalla}" c="SCALIFICACION" lit="89906304"></axis:alt></c:set>
        	<c:set var="title2"><axis:alt f="${pantalla}" c="NINGMINIMOPROBABLE" lit="9909097"></axis:alt></c:set>
        	<c:set var="title3"><axis:alt f="${pantalla}" c="NCUPOGARANTIZADO" lit="9909108"></axis:alt></c:set>
        	<c:set var="title4"><axis:alt f="${pantalla}" c="FCALCULO" lit="9910013"></axis:alt></c:set>
        	<c:set var="title5"><axis:alt f="${pantalla}" c="MONTO" lit="9910014"></axis:alt></c:set>
        </c:if>
                         	
                         	
                           
                          
                            <display:table name="${dades_persona.DATOS_RIESGO_FINANCIERO}" id="riesgo" export="false" class="dsptgtable" pagesize="-1"  sort="list" cellpadding="0" cellspacing="0"
                             requestURI="modal_axisper009.do?paginar=true">
                                <%@ include file="../include/displaytag.jsp"%>
                               
                                 <c:if test="${riesgo.OB_IAX_RIESGO_FINANCIERO.STIPOPERSONA == 'J'}">
                                    <display:column title="${title0}"  headerClass="sortable"  media="html" autolink="false" >
                                             <div class="dspText">${riesgo.OB_IAX_RIESGO_FINANCIERO.NRIESGO}</div>
	                                </display:column> 
	                                <display:column title="${title1}"  headerClass="sortable"  media="html" autolink="false" >
	                                             <div class="dspText">${riesgo.OB_IAX_RIESGO_FINANCIERO.NPROBINCUMPLIMIENTO}</div>
	                                </display:column>                                  
	                                 <display:column title="${title2}"  headerClass="sortable"  media="html" autolink="false" >
	                                            <div class="dspText">${riesgo.OB_IAX_RIESGO_FINANCIERO.SDESCRIPCION}</div>
	                                </display:column>                                
	                                <display:column title="${title3}"  headerClass="sortable"  media="html" autolink="false" >
	                                            <div class="dspDate"><fmt:formatDate value="${riesgo.OB_IAX_RIESGO_FINANCIERO.FEFECTO}" pattern="dd/MM/yyyy"/></div>
	                                </display:column>
	                                <display:column title="${title4}"  headerClass="sortable"  media="html" autolink="false" >
	                                            <div class="dspText">${riesgo.OB_IAX_RIESGO_FINANCIERO.MONTO}</div>
	                                </display:column>
                           		</c:if>
                           		<c:if test="${riesgo.OB_IAX_RIESGO_FINANCIERO.STIPOPERSONA == 'N'}">
                                    <display:column title="${title0}"  headerClass="sortable"  media="html" autolink="false" >
                                             <div class="dspText">${riesgo.OB_IAX_RIESGO_FINANCIERO.NPUNTAJESCORE}</div>
	                                </display:column> 
	                                <display:column title="${title1}"  headerClass="sortable"  media="html" autolink="false" >
	                                             <div class="dspText">${riesgo.OB_IAX_RIESGO_FINANCIERO.SCALIFICACION}</div>
	                                </display:column>                                  
	                                 <display:column title="${title2}"  headerClass="sortable"  media="html" autolink="false" >
	                                            <div class="dspText">${riesgo.OB_IAX_RIESGO_FINANCIERO.NINGMINIMOPROBABLE}</div>
	                                </display:column> 
	                                <display:column title="${title3}"  headerClass="sortable"  media="html" autolink="false" >
	                                            <div class="dspText">${riesgo.OB_IAX_RIESGO_FINANCIERO.NCUPOGARANTIZADO}</div>
	                                </display:column>                               
	                                <display:column title="${title4}"  headerClass="sortable"  media="html" autolink="false" >
	                                            <div class="dspDate"><fmt:formatDate value="${riesgo.OB_IAX_RIESGO_FINANCIERO.FEFECTO}" pattern="dd/MM/yyyy"/></div>
	                                </display:column>
	                                <display:column title="${title5}"  headerClass="sortable"  media="html" autolink="false" >
	                                            <div class="dspText">${riesgo.OB_IAX_RIESGO_FINANCIERO.MONTO}</div>
	                                </display:column>
                           		</c:if>
                               
                              
                                 
                            </display:table>
                  <!-- FIN - AXIS 2554 - 13/5/2019 - AABG - SE REALIZA VALIDACION PARA MOSTRAR CAMPOS RESPECTIVOS EN PERSONA NATURAL O JURIDICA -->          
        </td>
      </tr>
    <%--    </c:if>--%>
    </table>
</axis:visible>
<%--</c:if>--%>
<!-- ************************* RIESGO  ********************* -->
