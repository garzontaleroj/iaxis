<%/***Fichero: axisctr148.jsp,Autos*/%>
<%@ page contentType="text/html;charset=windows-1252"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

    <axis:visible c="DSP_OTROS" f="axisctr148">
    <tr>
     <td>
      <div  class="titulo"><img src="images/flecha.gif"/><b><axis:alt c="OTROS_DATOS" f="axisctr148" lit="9001071" /></div>
      
      <!--campos-->
             <table class="seccion">
                <tr>
                    <td align="left" >
                         <table class="area" align="center">
                            <tr>
                                <th style="width:20%;height:0px"></th>
                                <th style="width:20%;height:0px"></th>
                                <th style="width:20%;height:0px"></th>
                                <th style="width:40%;height:0px"></th>
                            </tr>
                            <tr>
                                <axis:ocultar f="axisctr148" c="CUSO" dejarHueco="false">
                                    <!-- ¿Us del vehicle? -->
                                    <td class="titulocaja">
                                        <b><axis:alt c="CUSO" f="axisctr148" lit="9001072" /></b>
                                    </td>
                                </axis:ocultar> 
                                <axis:ocultar f="axisctr148" c="CSUBUSO" dejarHueco="false">
                                    <!-- ¿Quan utilitza el seu vehicle ? -->
                                    <td class="titulocaja">
                                        <b><axis:alt c="CSUBUSO" f="axisctr148" lit="9001073" /></b>
                                    </td>  
                                </axis:ocultar> 
                                <axis:ocultar f="axisctr148" c="CGARAJE" dejarHueco="false">
                                    <!-- Garaje -->
                                    <td class="titulocaja">
                                        <b><axis:alt c="CGARAJE" f="axisctr148" lit="9001078" /></b>
                                    </td>  
                                </axis:ocultar> 
                            </tr>
                            <tr>
                                <axis:ocultar f="axisctr148" c="CUSO" dejarHueco="false">
                                    <td class="campocaja">
                                            <select name = "CUSO" id="CUSO"  <axis:atr f="axisctr148" c="CUSO" a="obligatorio=true&modificable=true&isInputText=false"/>
                                             title="<axis:alt c="CUSO" f="axisctr148" lit="9001072" />"
                                            value="${__formdata.CUSO}" size="1" onchange="f_llenar_subusos(document.axisctr148.CTIPVEH.value,document.axisctr148.CCLAVEH.value,this.value)" class="campowidthselect campo campotexto">
                                                <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisctr148" c="SELECCIONAR" lit="108341"/> - </option>    
                                                <c:forEach var="us_vehicle" items="${USOS}">
                                                    <option value = "${us_vehicle.CUSO}"
                                                       <c:if test="${(!empty __formdata.CUSO)&& us_vehicle.CUSO == __formdata.CUSO}"> selected </c:if>>
                                                        ${us_vehicle.TUSO}</option>
                                                </c:forEach>
                                            </select>   
                                    </td>
                                </axis:ocultar> 
                                <axis:ocultar f="axisctr148" c="CSUBUSO" dejarHueco="false">
                                    <td class="campocaja">
                                            <select name = "CSUBUSO" id="CSUBUSO" <axis:atr f="axisctr148" c="CSUBUSO" a="obligatorio=true&modificable=true&isInputText=false"/>
                                             title="<axis:alt c="CSUBUSO" f="axisctr148" lit="9001073" />"
                                            value="${__formdata.CSUBUSO}" size="1"  class="campowidthselect campo campotexto">
                                                <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisctr148" c="SELECCIONAR" lit="108341"/> - </option>    
                                                <c:forEach var="csubuso" items="${SUBUSOS}">
                                                    <option value = "${csubuso.CSUBUSO}"
                                                       <c:if test="${(!empty __formdata.CSUBUSO)&& csubuso.CSUBUSO == __formdata.CSUBUSO}"> selected </c:if>>
                                                        ${csubuso.TSUBUSO}</option>
                                                </c:forEach>
                                            </select>
                                    </td> 
                                </axis:ocultar> 
                                <axis:ocultar f="axisctr148" c="CGARAJE" dejarHueco="false">
                                    <td class="campocaja">
                                        <select name = "CGARAJE" id="CGARAJE"  <axis:atr f="axisctr148" c="CGARAJE" a="obligatorio=true&modificable=true&isInputText=false"/>
                                         title="<axis:alt c="CGARAJE" f="axisctr148" lit="9001078" />"
                                        size="1" onchange="" class="campowidthselect campo campotexto">
                                                <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisctr148" c="SELECCIONAR" lit="108341"/> - </option>    
                                                <c:forEach var="garaje" items="${GARAJE}">
                                                    <option value = "${garaje.CATRIBU}"
                                                       <c:if test="${(!empty __formdata.CGARAJE) && garaje.CATRIBU == __formdata.CGARAJE}"> selected </c:if>>
                                                        ${garaje.TATRIBU}
                                                    </option>                                                          
                                                </c:forEach>
                                            </select>
                                    </td>
                                </axis:ocultar> 
                            </tr>
                            <tr>
                                <td class="titulocaja"></td>
                                <axis:ocultar f="axisctr148" c="FLANZAM" dejarHueco="false">
                                    <!-- Data primera matriculació -->
                                    <td class="titulocaja">
                                        <b><axis:alt c="FLANZAM" f="axisctr148" lit="9001074" /></b>
                                    </td>  
                                </axis:ocultar> 
                            </tr>
                            <tr>
                                <axis:ocultar f="axisctr148" c="VEHICLE_NOU" dejarHueco="false">
                                    <td class="campocaja" colspan="2">
                                       <b><axis:alt c="VEHICLE_NOU" f="axisctr148" lit="9001075" /></b>
                                       <input type="radio" name="VEHICLE_NOU" <axis:atr f="axisctr148" c="VEHICLE_NOU1" a="modificable=true&isInputText=false"/>
                                        title="<axis:alt c="VEHICLE_NOU" f="axisctr148" lit="101778" />"
                                       id="VEHICLE_NOU" value="${__formdata.CVEHNUE}" onclick="f_vehnuevo(1)" <c:if test="${__formdata.CVEHNUE == 1}"> checked </c:if>><b><axis:alt c="SI" f="axisctr148" lit="101778" /></b>
                                       <input type="radio" name="VEHICLE_NOU" id="VEHICLE_NOU" <axis:atr f="axisctr148" c="VEHICLE_NOU2" a="modificable=true&isInputText=false"/>
                                       title="<axis:alt c="VEHICLE_NOU" f="axisctr148" lit="101779" />"
                                       value="${__formdata.CVEHNUE}" onclick="f_vehnuevo(0)" <c:if test="${__formdata.CVEHNUE == 0}"> checked </c:if>><b><axis:alt c="NO" f="axisctr148" lit="101779"/></b>
                                    </td>
                                </axis:ocultar>            
                                 <axis:ocultar f="axisctr148" c="FLANZAM" dejarHueco="false">
                               
                                    <td class="campocaja">
                                        <input type="text" name="FLANZAM" id="FLANZAM" formato="fecha" <axis:atr f="axisctr148" c="FLANZAM" a="modificable=true&isInputText=false"/>
                                         title="<axis:alt c="FLANZAM" f="axisctr148" lit="9001074" />"
                                            value="<fmt:formatDate value="${__formdata.FMATRIC}" pattern="dd/MM/yyyy" />" style="width:100px;" class="campowidthinput campo campotexto"/>
                                            <axis:visible c="ICO_FLANZAM" f="axisctr148">
                                                 <a id="icon_FLANZAM" style="vertical-align:middle;">
                                                 <img alt="<axis:alt f="axisctr148" c="SELECCIONAR" lit="108341"/>" title="<axis:alt c="FECHA_EFECTO" f="axisctr148" lit="100883" />" src="images/calendar.gif"/></a>
                                            </axis:visible>
                                    </td>
                                </axis:ocultar>
                            </tr>
                            <tr>
                            <td colspan=2>
                            <table>
                                <tr>
                                    <td class="titulocaja" ></td>
                                    <!-- Total accesorios -->
                                    <td class="titulocaja" nowrap>
                                        <b><axis:alt c="ITOTACC" f="axisctr148" lit="9001497" /></b>
                                    </td>
                                </tr>
                                <tr>
                                    <!-- ¿Desea asegurar... -->
                                    <td class="titulocaja" nowrap>
                                        <b><axis:alt c="ACCESORIOS" f="axisctr148" lit="9001077"/></b>
                                        <a href="javascript:f_abrir_axisctr059(document.axisctr148.CVERSION.value,document.axisctr148.NRIESGO.value)" style="text-decoration:none">
                                        <axis:visible c="ICO_EDITACCESORIOS" f="axisctr148">
                                            <img border="0" alt="<axis:alt c="DESC_ACCESORIO" f="axisctr148" lit="9001364"/>" title="<axis:alt c="DESC_ACCESORIO" f="axisctr148" lit="9904884"/>" src="images/lapiz.gif"/>
                                        </axis:visible>
                                        <axis:visible c="ICO_CONSACCESORIOS" f="axisctr148">
                                            <img border="0" alt="<axis:alt c="DESC_ACCESORIO" f="axisctr148" lit="9001364"/>" title="<axis:alt c="DESC_ACCESORIO" f="axisctr148" lit="9001364"/>" src="images/mes.gif"/>
                                        </axis:visible>                                
                                        </a>
                                    </td>
                                    <td class="titulocaja" >
                                        <input type="text" name="TOTALACC" id="TOTALACC"  <axis:atr f="axisctr148" c="TOTALACC" a="modificable=false"/> value="<fmt:formatNumber value="${__formdata.TOTALACC}" pattern='###,##0.00' />"  class="campowidthinput campo campotexto"/> 
                                    </td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td class="titulocaja" >
                                        <axis:visible c="ICO_EDITACCESORIOS" f="axisctr148">
                                            <b><axis:alt c="ACCESORIOS_CLAUSULA" f="axisctr148" lit="9001504"/></b>
                                        </axis:visible>
                                    </td>
                                </tr>
                            </table>
                            </td>
                            </tr>
                            <tr>
                             <td colspan=2>
                            <table>
                                
                                <tr>
                                    <!-- ¿Desea asegurar... -->
                                    <td class="titulocaja" nowrap>
                                        <b><axis:alt c="DESC_DISPOSTIVOS" f="axisctr148" lit="9905022"/></b>                                        
                                        <a href="javascript:f_abrir_axisctr206(document.axisctr148.CVERSION.value,document.axisctr148.NRIESGO.value)" style="text-decoration:none">
                                        <axis:visible c="ICO_EDITDISPOSTIVOS" f="axisctr148">
                                            <img border="0" alt="<axis:alt c="DESC_DISPOSTIVOS" f="axisctr148" lit="9904763"/>" title="<axis:alt c="DESC_DISPOSTIVOS" f="axisctr148" lit="9905022"/>" src="images/lapiz.gif"/>
                                        </axis:visible>
                                        <axis:visible c="ICO_CONSDISPOSTIVOS" f="axisctr148">
                                            <img border="0" alt="<axis:alt c="DESC_DISPOSTIVOS" f="axisctr148" lit="9904763"/>" title="<axis:alt c="DESC_DISPOSTIVOS" f="axisctr148" lit="9904763"/>" src="images/mes.gif"/>
                                        </axis:visible>                                
                                        </a>
                                    </td>
                                    
                                    <td></td>
                                </tr>
                                
                            </table>
                            </td>
                            </tr>
                         </table>
                     </td>
                  </tr>   
            </table>      
     </td>
    </tr>
</axis:visible>
