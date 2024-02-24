<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>

<c:set var="nombrePantalla" value="datosrentas"/>

<script type="text/javascript">

</script>

<form name="${nombrePantalla}" action="" method="POST">
        
    <table cellpadding="0" cellspacing="5" class="seccion">
        <tr>
            <th style="width:25%;height:0px"></th>
            <th style="width:25%;height:0px"></th>
            <th style="width:25%;height:0px"></th>
            <th style="width:25%;height:0px"></th>
        </tr>
        <tr>
            <td class="titulocaja">
                <b><axis:alt f="axispro001" c="CTIPOREN" lit="109382" /><</b>
            </td>
            <td class="titulocaja">
                <b><axis:alt f="axispro001" c="CCLASEREN" lit="108831"/></b>
            </td>
            <td class="titulocaja" >
                <b><axis:alt f="axispro001" c="FPAGO1REN" lit="108971"/></b>
            </td>
            <td class="titulocaja">
                <b><axis:alt f="axispro001" c="CPORRETEN" lit="180148"/></b>
            </td>
        </tr>
        <tr>
            <td align="left">
                <input type="text" name="TTIPREN" value="${mntproducto.DATRENT.TTIPREN}" class="campowidthinput campo campotexto" style="width:90%"
                <axis:atr f="axispro001" c="TTIPREN" a="modificable=false"/> />
            </td>
            
            <td align="left">
                <input type="text" name="TCLAREN" value="${mntproducto.DATRENT.TCLAREN}" class="campowidthinput campo campotexto" style="width:90%"
                <axis:atr f="axispro001" c="TCLAREN" a="modificable=false"/> />
            </td>
            <td align="left">
                <input type="text" name="TPA1REN" value="${mntproducto.DATRENT.TPA1REN}" class="campowidthinput campo campotexto" style="width:65%"
                <axis:atr f="axispro001" c="TPA1REN" a="modificable=false"/> />
            <c:if test="${mntproducto.DATRENT.CPA1REN != 0}">
                    <input type="text" name="NPA1REN" value="${mntproducto.DATRENT.NPA1REN}" class="campowidthinput campo campotexto" style="width:25%"
                    <axis:atr f="axispro001" c="NPA1REN" a="modificable=false"/> />
            </c:if>
            </td>
            <td align="left">
                <input type="text" name="TPCTREV" value="${mntproducto.DATRENT.TPCTREV}" class="campowidthinput campo campotexto" style="width:65%"
                <axis:atr f="axispro001" c="TPCTREV" a="modificable=false"/> />
            <%-- <c:set target="${mntproducto.DATRENT}" property="CPCTREV" value="1"/> <!-- TODO: Poner CPCTREV a saco para pruebas --> --%>
            <c:if test="${mntproducto.DATRENT.CPCTREV  == 1}">
                    <input type="text" name="NPCTREV" value="${mntproducto.DATRENT.NPCTREV}" class="campowidthinput campo campotexto" style="width:25%"
                    <axis:atr f="axispro001" c="NPCTREV" a="modificable=false"/> />
            </c:if>
            </td>
            
        </tr>
        <tr>
            <c:if test="${mntproducto.DATRENT.CPCTREV  == 2}">
                <td class="titulocaja">
                    <b><axis:alt f="axispro001" c="MINIMO" lit="103342"/></b>
                </td>
                <td class="titulocaja">
                    <b><axis:alt f="axispro001" c="MAXIMO" lit="112412"/></b>
                </td>
            </c:if>
            <c:if test="${mntproducto.DATRENT.CCLAREN == 1 || mntproducto.DATRENT.CCLAREN == 2}">
                <c:set var="literalTiempo">
                    ${mntproducto.CCLAREN == 1 ? 108973 : 108972}
                </c:set>
                <td class="titulocaja" style="text-align:left">
                    <b><axis:alt f="axispro001" c="LITERALTIEMPO" lit="${literalTiempo}"/></b>
                </td>
            </c:if>
        </tr>
        <tr>
            <c:if test="${mntproducto.DATRENT.CPCTREV  == 2}">
                <td align="left">
                    <input type="text" name="NPCTREVMIN" value="${mntproducto.DATRENT.NPCTREVMIN}" class="campowidthinput campo campotexto" style="width:25%"
                    <axis:atr f="axispro001" c="NPCTREVMIN" a="modificable=false"/> />
                </td>
                <td align="left">
                    <input type="text" name="NPCTREVMAX" value="${mntproducto.DATRENT.NPCTREVMAX}" class="campowidthinput campo campotexto" style="width:25%"
                    <axis:atr f="axispro001" c="NPCTREVMAX" a="modificable=false"/> />
                </td>
            </c:if>
            <c:if test="${mntproducto.DATRENT.CCLAREN == 1 || mntproducto.DATRENT.CCLAREN == 2}">
                <td align="left">
                    <input type="text" name="NNUMREN" value="${mntproducto.DATRENT.NNUMREN}" class="campowidthinput campo campotexto" style="width:90%"
                    <axis:atr f="axispro001" c="NNUMREN" a="modificable=false"/> />
                </td>
            </c:if>
        </tr>
    </table>
    <div class="separador">&nbsp;</div>
    <table cellpadding="0" cellspacing="5" class="seccion" width="100%">
        <tr>
            <td width="100%" >
                <table width="100%">
                    <tr>
                        <th style="width:25%;height:0px"></th>
                        <th style="width:25%;height:0px"></th>
                        <th style="width:25%;height:0px"></th>
                        <th style="width:25%;height:0px"></th>
                    </tr>
                    <tr>
                        <td class="titulocaja"  nowrap>
                            <b><axis:alt f="axispro001" c="MUEREASEGURADO" lit="1000352"/></b>
                        </td>
                        <%-- <c:set target="${mntproducto.DATRENT}" property="CMUNREC" value="0"/> <!-- TODO: Poner CMUNREC a saco para pruebas --> --%>
                        <c:if test="${mntproducto.DATRENT.CMUNREC == 0}">
                            <td class="titulocaja" nowrap>
                                <b><axis:alt f="axispro001" c="CESTPAGO" lit="101307"/></b>
                            </td>
                        </c:if>
                        <td class="titulocaja" nowrap>
                            <b><axis:alt f="axispro001" c="PAGOSGENERAR" lit="1000323"/></b>
                        </td>
                    </tr>
                    <tr>
                        <td class="campocaja">
                            <input type="text" style="10px" name="TMUNREC" value="${mntproducto.DATRENT.TMUNREC}" class="campowidthinput campo campotexto" 
                            <axis:atr f="axispro001" c="TMUNREC" a="modificable=false"/> />
                        </td>
                        <%-- <c:set target="${mntproducto.DATRENT}" property="CMUNREC" value="0"/> <!-- TODO: Poner CMUNREC a saco para pruebas --> --%>
                        <c:if test="${mntproducto.DATRENT.CMUNREC == 0}">
                            <td class="campocaja">
                                <input type="text" name="TESTMRE" value="${mntproducto.DATRENT.TESTMRE}" class="campowidthinput campo campotexto" 
                                <axis:atr f="axispro001" c="TESTMRE" a="modificable=false"/> />
                            </td>
                        </c:if>
                        <td align="left">
                            <input type="text"  name="TRECREN" value="${mntproducto.DATRENT.TRECREN}" class="campowidthinput campo campotexto" style="width:90%"
                            <axis:atr f="axispro001" c="TRECREN" a="modificable=false"/> />
                        </td>
                    </tr>
                </table>                
            </td>
        </tr>
    </table>
    <div class="separador">&nbsp;</div>
    <table cellpadding="0" cellspacing="5" class="seccion">
        <tr>
            <th style="width:1%;height:0%;"/>
            <th style="width:45%;height:0%;"/>
            <th style="width:1%;height:0%;"/>
            <th style="width:45%;height:0%;"/>
        </tr>
        <tr>
            <td>
                &nbsp;
            </td>
            <td class="titulocaja">
                <u><b><axis:alt f="axispro001" c="FORMULASPAGO" lit="1000237"/></b></u>
                <div class="separador">&nbsp;</div>
                <div class="displayspace" style="height:170px">
                     <c:set var="title0"><axis:alt f="axispro001" c="CCAMPO" lit="109373"/></c:set>
                     <c:set var="title1"><axis:alt f="axispro001" c="CFORMULA" lit="108347" /></c:set>
                     <display:table name="${mntproducto.DATRENT.RENTASFORMULA}" id="RENTASFORMULA" export="false" class="dsptgtable" pagesize="6" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                     requestURI="axis_axispro001.do?paginar=true&operation=datosrentas"> 
                       <%@ include file="../include/displaytag.jsp"%>
                       <display:column title="" sortable="false" sortProperty="OB_IAX_PRODRENTASFORMULA.CCAMPO" headerClass="headwidth10 sortable"  media="html" autolink="false" >
                           <div class="dspNumber">${RENTASFORMULA.OB_IAX_PRODRENTASFORMULA.CCAMPO}</div>
                       </display:column>
                       <display:column title="${title0}" sortable="true" sortProperty="OB_IAX_PRODRENTASFORMULA.TCAMPO" headerClass="sortable"  media="html" autolink="false" >
                           <div class="dspText">${RENTASFORMULA.OB_IAX_PRODRENTASFORMULA.TCAMPO}</div>
                       </display:column>
                       <display:column title="" sortable="false" sortProperty="OB_IAX_PRODRENTASFORMULA.CCLAVE" headerClass="headwidth10 sortable"  media="html" autolink="false" >
                           <div class="dspNumber">${RENTASFORMULA.OB_IAX_PRODRENTASFORMULA.CLAVE}</div>
                       </display:column>
                       <display:column title="${title1}" sortable="true" sortProperty="OB_IAX_PRODRENTASFORMULA.FORMULA" headerClass="sortable"  media="html" autolink="false" >
                           <div class="dspText">${RENTASFORMULA.OB_IAX_PRODRENTASFORMULA.FORMULA}</div>
                       </display:column>
                    </display:table>
                </div>
            </td>
            <td>
                &nbsp;
            </td>
            <td class="titulocaja">
                <u><b><axis:alt f="axispro001" c="FORMASPAGO" lit="103313"/></b></u>
                <div class="separador">&nbsp;</div>
                <div class="displayspace" style="height:170px">
                    <c:set var="title0"><axis:alt f="axispro001" c="FORMAPAGO" lit="100712" /></c:set>
                    <display:table name="${mntproducto.DATRENT.FORPAGREN}" id="FORPAGREN" export="false" class="dsptgtable" pagesize="6" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                    requestURI="axis_axispro001.do?paginar=true&operation=datosrentas">
                      <%@ include file="../include/displaytag.jsp"%>
                      <display:column title="${title0}" sortable="true" sortProperty="OB_IAX_PRODFORPAGREN.TFORPAG" headerClass="sortable"  media="html" autolink="false" >
                          <div class="dspText">${FORPAGREN.OB_IAX_PRODFORPAGREN.TFORPAG}</div>
                      </display:column>
                      <display:column sortable="false" sortProperty="OB_IAX_PRODFORPAGREN.COBLIGA" headerClass="headwidth10 sortable"  media="html" autolink="false" >
                          <div class="dspIcons">
                               <input type="checkbox" name="COBLIGA" 
                               <c:if test="${FORPAGREN.OB_IAX_PRODFORPAGREN.COBLIGA == 1}"> checked</c:if>
                               <axis:atr f="axispro001" c="OB_IAX_PRODFORPAGREN.COBLIGA" a="modificable=false"/> disabled /> <!-- TODO: Modificar tag axis:atr para que deshabilite checkbox's-->
                          </div>
                      </display:column>
                    </display:table>
                </div>
            </td>
        </tr>
    </table>
    
    <div class="separador">&nbsp;</div>
    <table  cellpadding="0" cellspacing="5" class="seccion">      
        <tr><td>
                &nbsp;
            </td>
            <td class="titulocaja">
                &nbsp;&nbsp;<u><b><axis:alt f="axispro001" c="MESESPAGOS" lit="9000670"/></b></u>
            </td>
        </tr>
        <tr><td>
                &nbsp;
            </td>
            <td align="left" class="titulocaja">   
            <div class="separador">&nbsp;</div>
             <table class="seccion" style="width:75%;">
                <tr>
                  <th style="width:20%;height:0%;"/>   
                  <th style="width:20%;height:0%;"/>
                  <th style="width:20%;height:0%;"/>
                  <th style="width:20%;height:0%;"/>
                </tr>  
                <tr class="gridNotEven">
                    <td><div style="float:left;"><axis:alt f="axispro001" c="MES1" lit="9000674"/></div> <div style="float:right;"> 
                            <input type="checkbox" name="CPAGA" 
                            <c:if test="${mntproducto.DATRENT.NMESEXTRA.NMES1 == 1}"> checked</c:if> disabled>
                    </div></td>
                    <td><div style="float:left;"><axis:alt f="axispro001" c="MES4" lit="9000677"/></div> <div style="float:right;"> 
                            <input type="checkbox" name="CPAGA"
                            <c:if test="${mntproducto.DATRENT.NMESEXTRA.NMES4 == 1}"> checked</c:if> disabled>
                    </div> </td>
                    <td><div style="float:left;"><axis:alt f="axispro001" c="MES7" lit="9000680"/></div> <div style="float:right;"> 
                            <input type="checkbox" name="CPAGA"
                            <c:if test="${mntproducto.DATRENT.NMESEXTRA.NMES7 == 1}"> checked</c:if> disabled>
                    </div> </td>
                    <td><div style="float:left;"><axis:alt f="axispro001" c="MES10" lit="9000683"/></div> <div style="float:right;"> 
                            <input type="checkbox" name="CPAGA"
                            <c:if test="${mntproducto.DATRENT.NMESEXTRA.NMES10 == 1}"> checked</c:if> disabled>
                    </div> </td>
                </tr>
                <tr class="gridEven">
                    <td><div style="float:left;"><axis:alt f="axispro001" c="MES2" lit="9000675"/></div> <div style="float:right;"> 
                        <input type="checkbox" name="CPAGA"
                         <c:if test="${mntproducto.DATRENT.NMESEXTRA.NMES2 == 1}"> checked</c:if> disabled>
                    </div> </td>
                    <td><div style="float:left;"><axis:alt f="axispro001" c="MES5" lit="9000678"/></div> <div style="float:right;"> 
                        <input type="checkbox" name="CPAGA"
                        <c:if test="${mntproducto.DATRENT.NMESEXTRA.NMES5 == 1}"> checked</c:if> disabled>
                    </div> </td>
                    <td><div style="float:left;"><axis:alt f="axispro001" c="MES8" lit="9000681"/></div> <div style="float:right;"> 
                        <input type="checkbox" name="CPAGA"
                        <c:if test="${mntproducto.DATRENT.NMESEXTRA.NMES8 == 1}"> checked</c:if> disabled>
                    </div> </td>
                    <td><div style="float:left;"><axis:alt f="axispro001" c="MES11" lit="9000684"/></div> <div style="float:right;"> 
                        <input type="checkbox" name="CPAGA"
                        <c:if test="${mntproducto.DATRENT.NMESEXTRA.NMES11 == 1}"> checked</c:if> disabled>
                    </div> </td>
                </tr>
                <tr class="gridNotEven">
                    <td><div style="float:left;"><axis:alt f="axispro001" c="MES3" lit="9000676"/></div> <div style="float:right;"> 
                        <input type="checkbox" name="CPAGA"
                        <c:if test="${mntproducto.DATRENT.NMESEXTRA.NMES3 == 1}"> checked</c:if> disabled>
                    </div> </td>
                    <td><div style="float:left;"><axis:alt f="axispro001" c="MES6" lit="9000679"/></div> <div style="float:right;"> 
                        <input type="checkbox" name="CPAGA"
                        <c:if test="${mntproducto.DATRENT.NMESEXTRA.NMES6 == 1}"> checked</c:if> disabled>
                    </div> </td>
                    <td><div style="float:left;"><axis:alt f="axispro001" c="MES9" lit="9000682"/></div> <div style="float:right;"> 
                        <input type="checkbox" name="CPAGA"
                        <c:if test="${mntproducto.DATRENT.NMESEXTRA.NMES9 == 1}"> checked</c:if> disabled>
                    </div> </td>
                    <td><div style="float:left;"><axis:alt f="axispro001" c="MES12" lit="9000685"/></div> <div style="float:right;"> 
                        <input type="checkbox" name="CPAGA"
                        <c:if test="${mntproducto.DATRENT.NMESEXTRA.NMES12 == 1}"> checked</c:if> disabled>
                    </div> </td>
                </tr>
             </table>   
            </td>
           
        <tr> <td>
                &nbsp;
            </td>
            <td align="left" class="titulocaja">
               &nbsp;&nbsp;<u><b><axis:alt f="axispro001" c="MODIFPOLIZA" lit="9000673"/></b></u>
            </td>
        </tr>
        <tr><td>
                &nbsp;
            </td>
            <td align="left">
              &nbsp;&nbsp;<input type="text" name="MODPOLIZA" value="${mntproducto.DATRENT.TMODEXTRA}" class="campowidthinput campo campotexto" style="width:20%" 
              <axis:atr f="axispro001" c="MODPOLIZA" a="modificable=false"/> />
            </td>
        </tr>
            
            
       </tr>
    </table>
    
</form>