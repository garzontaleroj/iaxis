<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ page contentType="text/html;charset=windows-1252"%>

<!-- Sub form seccion datos generales -->
<c:set var="pantalla" value="axispro001_datosgenerales"/>

<script type="text/javascript">
  //  function f_aceptar_axispro003(SPRODUC,CRAMO,CMODALI,CTIPSEG,CCOLECT,CACTIVO,CTERMFIN,CTIPRIE,COBJASE,CSUBPRO,C2CABEZAS,CAGRPRO,CDIVISA,NMAXRIE,CPRPROD){
    function f_aceptar_axispro003(seccion){
        //parámetros generales
        /*document.${pantalla}.SPRODUC.value=SPRODUC;
        document.${pantalla}.CRAMO.value=CRAMO;
        document.${pantalla}.CMODALI.value=CMODALI;
        document.${pantalla}.CTIPSEG.value=CTIPSEG;
        document.${pantalla}.CCOLECT.value=CCOLECT;
        document.${pantalla}.CACTIVO.value=CACTIVO;
        document.${pantalla}.CTERMFIN.value=CTERMFIN;
        document.${pantalla}.CTIPRIE.value=CTIPRIE;
        document.${pantalla}.COBJASE.value=COBJASE;
        document.${pantalla}.CSUBPRO.value=CSUBPRO;
        
        document.${pantalla}.C2CABEZAS.value=C2CABEZAS;
        document.${pantalla}.CAGRPRO.value=CAGRPRO;
        document.${pantalla}.CDIVISA.value=CDIVISA;
        document.${pantalla}.CPRPROD.value=CPRPROD;
        
        if (document.${pantalla}.NMAXRIE!=undefined)
        document.${pantalla}.NMAXRIE.value = NMAXRIE;

        */
        f_cargar_propiedades_pantalla();
        
        /*
        objDom.setValorPorId("SPRODUC", SPRODUC);
        objDom.setValorPorId("CRAMO", CRAMO);
        objDom.setValorPorId("CMODALI", CMODALI);
        objDom.setValorPorId("CTIPSEG", CTIPSEG);
        objDom.setValorPorId("CCOLECT", CCOLECT);
        //parametros grabar datos generales
        objDom.setValorPorId("CACTIVO", CACTIVO);
        alert("7");
        objDom.setValorPorId("CTERMFIN", CTERMFIN);
        alert("8");
        objDom.setValorPorId("CTIPRIE", CTIPRIE);
        alert("9");
        objDom.setValorPorId("COBJASE", COBJASE);
        alert("10");
        objDom.setValorPorId("CSUBPRO", CSUBPRO);
        alert("11");
       
        objDom.setValorPorId("C2CABEZAS", C2CABEZAS);
        alert("12");
        objDom.setValorPorId("CAGRPRO", CAGRPRO);
        alert("13");
        objDom.setValorPorId("CDIVISA", CDIVISA);*/
        f_cerrar_modal("axispro003");
        document.${pantalla}.subpantalla.value = seccion;
       // objUtiles.ejecutarFormulario("axis_axispro001.do", "cargar_datos_generales", document.${pantalla}, "_self", objJsMessages.jslit_cargando);
        objUtiles.ejecutarFormulario("axis_axispro001.do?subpantalla_mdl="+seccion, "form", document.${pantalla}, "_self", objJsMessages.jslit_cargando);

    }
</script>

<form name="${pantalla}" action="axis_axispro001.do">
    <%-- Hiddens necesarios para actualizar datos del modal --%>
    <input type="hidden" name="SPRODUC" id="SPRODUC" value="${mntproducto.SPRODUC}"/>
    <input type="hidden" name="CRAMO" id="CRAMO" value=""/>
    <input type="hidden" name="CMODALI" id="CMODALI" value=""/>
    <input type="hidden" name="CTIPSEG" id="CTIPSEG" value=""/>
    <input type="hidden" name="TACTIVO" id="TACTIVO" value=""/>
    <input type="hidden" name="CACTIVO" id="CACTIVO" value=""/>
    <input type="hidden" name="CTERMFIN" id="CTERMFIN" value=""/>
    <input type="hidden" name="CTIPRIE" id="CTIPRIE" value=""/>
    <input type="hidden" name="COBJASE" id="COBJASE" value=""/>
    <input type="hidden" name="CSUBPRO" id="CSUBPRO" value=""/>
    <input type="hidden" name="C2CABEZAS"  id="C2CABEZAS" value=""/>
    <input type="hidden" name="CAGRPRO" id="CAGRPRO" value=""/>
    <input type="hidden" name="CDIVISA" id="CDIVISA" value=""/>
    <input type="hidden" name="CCOLECT" id="CCOLECT" value=""/>
    <input type="hidden" name="operation" id="operation" value=""/>        
    <input type="hidden" name="CPRPROD" id="CPRPROD" value=""/>  
    <input type="hidden" name="NMAXRIE" id="NMAXRIE" value=""/>  
    <input type="hidden" name="subpantalla" id="subpantalla" value=""/>  
            
    <!-- Area de campos  -->
    <table class="seccion" align="center" cellpadding="0" cellspacing="5" style="padding:1%;">
        <tr>
          <td>
            <!--div class="titulo"><img src="images/flecha.gif"/></div-->
             <table>
                <tr>
                    <td>
                        <!-- DisplayTag Lista de productos -->
                        <c:set var="title0"><axis:alt f="axispro001" c="TIT_0" lit="1000246"/></c:set>
                        <c:set var="title1"><axis:alt f="axispro001" c="TIT_1" lit="100785"/></c:set>
                        <c:set var="title2"><axis:alt f="axispro001" c="TIT_2" lit="100727"/></c:set>
                        <div class="displayspace">
                          <display:table name="${mntproducto.TITULO}" id="T_IAX_IDIOMAS" export="false" class="dsptgtable" pagesize="6" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                           requestURI="axis_axispro001.do?paginar=true&operation=datosgenerales">
                            <%@ include file="../include/displaytag.jsp"%>
                            <display:column title="${title0}" sortable="true" sortProperty="OB_IAX_PRODTITULO.TIDIOMA" headerClass="headwidth10 sortable" media="html" autolink="false" >
                                <div class="dspText">${T_IAX_IDIOMAS.OB_IAX_PRODTITULO.TIDIOMA}</div>
                            </display:column>
                            <display:column title="${title1}" sortable="true" sortProperty="OB_IAX_PRODTITULO.TTITULO" headerClass="headwidth20 sortable" media="html" autolink="false" >
                                <div class="dspText">${T_IAX_IDIOMAS.OB_IAX_PRODTITULO.TTITULO}</div>
                            </display:column>
                            <display:column title="${title2}" headerClass="headwidth20 sortable" sortable="true" sortProperty="OB_IAX_PRODTITULO.TROTULO" media="html" autolink="false" >
                                <div class="dspText">${T_IAX_IDIOMAS.OB_IAX_PRODTITULO.TROTULO}</div>
                            </display:column>
                        </display:table>
                        </div>
                    </td>
                </tr>
              
                <!-- Sub-Sección datos productos -->
                <tr>
                        <td colspan="2" align="left">
                            <!--div class="titulo" style="margin-left:10px;font-size: 11px;"><img src="images/flecha.gif"/></div-->
                        </td>
                </tr>
                <tr>
                        <td align="left">
                         <table>
                             <tr>
                                <th style="width:25%;height:0px"></th>
                                <th style="width:25%;height:0px"></th>
                                <th style="width:25%;height:0px"></th>
                                <th style="width:25%;height:0px"></th>
                            </tr>
                            
                            <tr>
                                <axis:visible f="axispro001" c="TACTIVO">
                                <td class="titulocaja">
                                    <b><axis:alt f="axispro001" c="TACTIVO" lit="100786"/></b>
                                </td>
                                </axis:visible>
                                <axis:visible f="axispro001" c="TTERMFIN">
                                    <td class="titulocaja">
                                        <b><axis:alt f="axispro001" c="TTERMFIN" lit="151112"/></b>
                                    </td>
                                </axis:visible>
                                <axis:visible f="axispro001" c="TDIVISA">
                                <td class="titulocaja">
                                    <b><axis:alt f="axispro001" c="TDIVISA" lit="108645"/></b>
                                </td>
                                </axis:visible>
                                <axis:visible f="axispro001" c="TTIPRIE">
                                <td class="titulocaja">
                                    <b><axis:alt f="axispro001" c="TTIPRIE" lit="1000465"/></b>
                                </td>
                                </axis:visible>
                            </tr>
                            <tr>
                                <axis:visible f="axispro001" c="TACTIVO">
                                <td class="campocaja">
                                    <input type="text" style="width:75%" class="campowidthinput campo campotexto" id="TACTIVO" name="TACTIVO" size="15"
                                    value="${mntproducto.TACTIVO}" readonly="true" />
                                </td>
                                </axis:visible>
                                <axis:visible f="axispro001" c="TTERMFIN">
                                    <td class="campocaja" >                                        
                                        <input type="text" class="campowidthinput campo campotexto" id="TTERMFIN" name="TTERMFIN" size="15"
                                        value="${mntproducto.TTERMFIN}" readonly="true" />
                                    </td>                           
                                </axis:visible>
                                <axis:visible f="axispro001" c="TDIVISA">
                                <td class="campocaja">                                        
                                        <input type="text" class="campowidthinput campo campotexto" id="TDIVISA" name="TDIVISA" size="15"
                                        value="${mntproducto.TDIVISA}" readonly="true" />
                                    </td>  
                                </axis:visible>
                                <axis:visible f="axispro001" c="TTIPRIE">
                                <td class="campocaja">
                                    <input type="text" style="width:75%" class="campowidthinput campo campotexto" id="TTIPRIE" name="TTIPRIE" size="15"
                                    value="${mntproducto.TTIPRIE}" readonly="true" />
                                </td>
                                </axis:visible>
                            </tr>
                            <tr>
                                
                                <axis:visible f="axispro001" c="TOBJASE">
                                    <td class="titulocaja">
                                        <b><axis:alt f="axispro001" c="TOBJASE" lit="102666"/></b>
                                    </td>
                                </axis:visible>
                                <axis:visible f="axispro001" c="TAGRPRO">
                                    <td class="titulocaja">
                                        <b><axis:alt f="axispro001" c="TAGRPRO" lit="111471"/></b>
                                    </td>
                                </axis:visible>
                                <axis:visible f="axispro001" c="TSUBPRO">
                                    <td class="titulocaja">
                                        <b><axis:alt f="axispro001" c="TSUBPRO" lit="1000377"/></b>
                                    </td>
                                </axis:visible>
                                <axis:visible f="axispro001" c="NMAXRIE">
                                    <c:if test="${mntproducto.CSUBPRO ==2 || mntproducto.CSUBRPO==3}">
                                    <td class="titulocaja">
                                        <b><axis:alt f="axispro001" c="NMAXRIE" lit="1000303"/></b>
                                    </td>
                                    </c:if>
                                </axis:visible>
                            </tr>
                            <tr>
                                
                                <axis:visible f="axispro001" c="TOBJASE">
                                    <td class="campocaja" >                                        
                                        <input type="text" class="campowidthinput campo campotexto" id="TOBJASE" name="TOBJASE" size="15"
                                        value="${mntproducto.TOBJASE}" readonly="true" />
                                    </td>                           
                                </axis:visible>
                                <axis:visible f="axispro001" c="TAGRPRO">
                                    <td class="campocaja">                                        
                                        <input type="text" class="campowidthinput campo campotexto" id="TAGRPRO" name="TAGRPRO" size="15"
                                        value="${mntproducto.TAGRPRO}" readonly="true" />
                                    </td>  
                                </axis:visible>
                                <axis:visible f="axispro001" c="TSUBPRO">
                                    <td class="campocaja">
                                        <input type="text" style="width:75%" class="campowidthinput campo campotexto" id="TSUBPRO" name="TSUBPRO" size="15"
                                        value="${mntproducto.TSUBPRO}" readonly="true" />
                                    </td>
                                </axis:visible>
                                <axis:visible f="axispro001" c="NMAXRIE">
                                    <c:if test="${mntproducto.CSUBPRO ==2 || mntproducto.CSUBRPO==3}">
                                    <td class="campocaja" >                                        
                                        <input type="text" class="campowidthinput campo campotexto" id="NMAXRIE_1" name="NMAXRIE_1" size="15"
                                        value="${mntproducto.NMAXRIE}" readonly="true" />
                                    </td>
                                    </c:if>
                                </axis:visible>
                            </tr>
                            <tr>
                                <axis:visible f="axispro001" c="TCOMPANI">
                                    <td class="titulocaja" colspan="2">
                                        <b><axis:alt f="axispro001" c="TCOMPANI" lit="9000600"/></b>
                                    </td>
                                </axis:visible>
                                    <td></td>
                                    <td></td>
                                    
                                    
                            </tr>
                            <tr>
                            <axis:visible f="axispro001" c="TCOMPANI">
                                    <td class="campocaja" colspan="2" >                                        
                                        <input type="text" class="campowidthinput campo campotexto" id="TCOMPANI" name="TCOMPANI" style="width:60%" size="15"
                                        value="${mntproducto.TCOMPANI}" readonly="true" />
                                    </td>
                            </axis:visible>
                                    <td></td>
                                    <td></td>
                            </tr>
                            
                            <tr>
                                <axis:visible f="axispro001" c="C2CABEZAS">
                                    <td class="titulocaja">
                                        <b><axis:alt f="axispro001" c="C2CABEZAS" lit="1000118"/></b>
                                        <input onClick="javascript:f_actualiza_casilla_c2cabeza(this,'${mntproducto.C2CABEZAS}')" 
                                        <c:if test="${mntproducto.C2CABEZAS == '1'}">checked</c:if> 
                                        type="checkbox" id="C2CABEZAS" name="C2CABEZAS" value="" disabled/>
                                    </td>
                                  </axis:visible>
                            <c:if test="${mntproducto.CAGRPRO ==2 || mntproducto.CAGRPRO==21}">                                  
                                <axis:visible f="axispro001" c="TPRPROD">
                                    <td class="titulocaja">
                                        <b><axis:alt f="axispro001" c="TPRPROD" lit="152640"/></b>
                                    </td>
                                </axis:visible>
                                </c:if>
                            </tr>
                            <tr>
                                <axis:visible f="axispro001" c="C2CABEZAS">
                                    <td class="titulocaja">
                                    </td>
                                  </axis:visible>
                             <c:choose>     
                                <c:when test="${mntproducto.CAGRPRO ==2 || mntproducto.CAGRPRO==21}">                                          
                                    <axis:visible f="axispro001" c="TPRPROD">
                                         <td class="campocaja" >                                        
                                            <input type="text"  style="width:75%" class="campowidthinput campo campotexto" id="TPRPROD" name="TPRPROD" size="15"
                                            value="${mntproducto.TPRPROD}" readonly="true" />
                                        </td>                             
                                    </axis:visible>
                                </c:when>
                                <c:otherwise>
                                     <input type="hidden" name="TPRPROD" value=""/>   
                                </c:otherwise>
                            </c:choose>                            
                            </tr>
                        </table>
                    </td> 
                </tr>
                <axis:ocultar f="axispro001" c="TABLA_COMPANIAS" dejarHueco="false">                                 
                    <tr>
                        <td>
                         <table class="area" align="center">
                             <tr>
                                 <td>
                                    <div class="titulo" align="left" style="font-size: 11px;"><img src="images/flecha.gif"/><axis:alt f="axispro001" c="TITULO_CIAS" lit="102082"/></div>
                                 </td>
                             </tr>
                             <tr>
                                  <td>
                                  &nbsp;&nbsp;                                           
                                        <!-- DisplayTag Lista de companyias -->
                                        <c:set var="title0"><axis:alt f="axispro001" c="TIT_0" lit="9000600"/></c:set>
                                        <c:set var="title1"><axis:alt f="axispro001" c="TIT_1" lit="100584"/></c:set>
                                        <c:set var="title2"><axis:alt f="axispro001" c="TIT_2" lit="9901239"/></c:set>
                                        <div class="displayspace" >
                                              <display:table name="${mntproducto.COMPANIAS}" id="T_IAX_COMPANIAS" export="false" class="dsptgtable" pagesize="6" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0" 
                                                   requestURI="axis_axispro001.do?paginar=true&operation=datosgenerales">
                                                    <%@ include file="../include/displaytag.jsp"%>
                                                    <display:column title="${title0}" sortable="true" sortProperty="OB_IAX_COMPANIPROD.TCOMPANI" headerClass="headwidth10 sortable" media="html" autolink="false" >
                                                        <div class="dspText">${T_IAX_COMPANIAS.OB_IAX_COMPANIPROD.TCOMPANI}</div>
                                                    </display:column>
                                                    <display:column title="${title1}" sortable="true" sortProperty="OB_IAX_COMPANIPROD.CAGENCORR" headerClass="headwidth20 sortable" media="html" autolink="false" >
                                                        <div class="dspText">${T_IAX_COMPANIAS.OB_IAX_COMPANIPROD.CAGENCORR}</div>
                                                    </display:column>
                                                    <display:column title="${title2}" headerClass="headwidth20 sortable" sortable="true" sortProperty="OB_IAX_COMPANIPROD.TPRODUCESP" media="html" autolink="false" >
                                                        <div class="dspText">${T_IAX_COMPANIAS.OB_IAX_COMPANIPROD.TPRODUCESP}</div>
                                                    </display:column>
                                             </display:table>
                                        </div>                            
                                   </td> 
                               </tr>   
                         </table>                          
                        </td> 
                    </tr>
              </axis:ocultar>      
          </table>
        </td>
        </tr>
    </table>
        
  
    </form>
  