<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN"
"http://www.w3.org/TR/html4/strict.dtd">
<html>
      <head>
        <script language="Javascript" type="text/javascript" src="scripts/general.js"></script>
        <link rel="stylesheet" href="styles/genericosHtml.css"></link>
        <link rel="stylesheet" href="styles/axisnt.css"></link>
        <link rel="stylesheet" href="styles/displaytag.css"></link>
        <c:import url="../include/carga_framework_js.jsp"/>
        
        <script type="text/javascript">
            function f_validar_anadir(CLAVE){
                if(objUtiles.estaVacio(objDom.getValorPorId("CLAVE")))
                    alert(objJsMessages.jslit_error_gfi_anadir_param);
                else
                    parent.f_abrir_axisgfi003(CLAVE);                
            }
    
            function f_abrir_axisgfi031() {
                parent.f_abrir_axisgfi031();
            }
            
            function f_recargar_axisgfi031(CLAVE) {
                parent.f_recargar_axisgfi031(CLAVE);
            }
        
            function f_cerrar_axisgfi031() {
                parent.f_cerrar_axisgfi031();
            }
            
            var indice=0;
            function anyadir_linea_js(){    
          
                try{
                    var tr=document.createElement("tr");
                    tr.setAttribute("id","tr_pregunta_"+indice);
                    tr.setAttribute("class","gridEven");
                    var desctd=document.createElement("td");
                    desctd.setAttribute("id","td_pregunta_"+indice);
                    var descdiv=document.createElement("div_preg_"+indice);
                    descdiv.setAttribute("id","div_preg_"+indice);
                    var descinput = document.createElement("input");
                    descinput.setAttribute("id","PREGUN_"+indice);
                    descinput.setAttribute("onblur","if(!objUtiles.estaVacio(this.value))if(!objValidador.esCampoNumerico(this.value, false, -1,'pregunta')){this.value='';this.focus()}else{this.value=objNumero.stripNonNumeric(this.value)}");
                    descinput.setAttribute("class","campo campotexto");
                    descinput.setAttribute("name","PREGUN_"+indice);
                    descinput.setAttribute("type","text");
                    descinput.style.width="80%";
                    descdiv.appendChild(descinput);
                    desctd.appendChild(descdiv);
                    
                    var desctd2=document.createElement("td");
                    desctd2.setAttribute("id","td_pregunta_valor_"+indice);
                    var descdiv2=document.createElement("div_preg_valor_"+indice);
                    descdiv2.setAttribute("id","div_preg_valor_"+indice);
                    var descinput2 = document.createElement("input");
                    descinput2.setAttribute("id",'PREG_VALOR_'+indice);
                    descinput2.setAttribute("onblur","if(!objUtiles.estaVacio(this.value)) if(!objValidador.esCampoNumerico(this.value, true, -1,'valor pregunta')){this.value='';this.focus()}else{this.value=objNumero.stripNonNumeric(this.value)}");
                    descinput2.setAttribute("class","campo campotexto"); 
                    descinput2.setAttribute("name","PREG_VALOR_"+indice);
                    descinput2.setAttribute("type","text");
                    descinput2.style.width="80%";
                    descdiv2.appendChild(descinput2);
                    desctd2.appendChild(descdiv2);
                    
                    var desctd3=document.createElement("td");
                    desctd3.setAttribute("id","td_del_preg_"+indice);
                    var descdiv3=document.createElement("div_del_preg_"+indice);
                    descdiv3.setAttribute("id","div_del_preg_"+indice);
                    var descinput3 = document.createElement("img");
                    descinput3.setAttribute("src","images/delete.gif");
                    descinput3.setAttribute("border","0");                    
                    var link = document.createElement('a'); // create the link
                    link.setAttribute("href", "javascript:f_del_pregunta("+indice+")"); 
                    link.appendChild(descinput3); // append to link                    
                    descdiv3.appendChild(link);
                    desctd3.appendChild(descdiv3);
                    
                    
                    tr.appendChild(desctd);
                    tr.appendChild(desctd2);
                    tr.appendChild(desctd3);
                    
                    var tpreguntas=document.getElementById("table_preguntas");
                    tpreguntas.appendChild(tr);
                    
                    indice = indice+1;
                } catch (e) {
                    
                }
          }
        function f_del_pregunta(indice){            
            var tabPreguntas = document.getElementById("table_preguntas");
            var filaPreg=document.getElementById("tr_pregunta_"+indice); 
            tabPreguntas.removeChild(filaPreg);
            indice = indice-1;
        }
        
        function f_ejecutar(){
            
            var totalParams="";
                       
            $("#miForm3").find('input[name^=PARAM_]').each(function() {
                var elemento= this;
                if (!objUtiles.estaVacio(elemento)){
                    totalParams=totalParams+elemento.id+"="+elemento.value+"&";
                }                
            });
            
            $("#miForm3").find('input[name^=PREGUN_]').each(function() {
                var elemento= this;
                if (!objUtiles.estaVacio(elemento)){
                    totalParams=totalParams+elemento.id+"="+elemento.value+"&";
                }   
            });            
            
            $("#miForm3").find('input[name^=PREG_VALOR_]').each(function() {
                var elemento= this;
                if (!objUtiles.estaVacio(elemento)){
                    totalParams=totalParams+elemento.id+"="+elemento.value+"&";
                }   
            });
            
            var clave=$("#CLAVE").val();
            totalParams=totalParams+"PCLAVE="+ clave;
            parent.f_ejecutar_formula(totalParams);
        }
        
        function setResultado(valor){
            $("#resultado").val(valor);
        }
       
        
    </script>
      </head>
      <body style="width:97%;" onload="parent.f_iframe_cargado();revisarEstilos();">
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="titulo"><axis:alt f="axisgfi031" c="TITULO_AXISGFI003" lit="1000204" /></c:param>
            <c:param name="nid" value="axisgfi031" />
        </c:import>
      
        <form id="miForm3" name="miForm3" action="" method="POST">
              <table>
                <tr>
                    <th style="width:33%;height:0px">&nbsp;</th>
                    <th style="width:33%;height:0px">&nbsp;</th>
                    <th style="width:33%;height:0px">&nbsp;</th>
                </tr>
                <tr>
                	<td colspan="3">
                      <axis:visible f="axisgfi002" c="BT_EDITGFI">
                		 <div style="float:right;">    
                              <c:if test="${!empty axisgfi002_detalle_formula.CLAVE}">
                                <img border="0"
                               alt="<axis:alt f="axisgfi002" c="BT_EDITGFI" lit="9901356"/>"
                               title="<axis:alt f="axisgfi002" c="BT_EDITGFI" lit="9901356"/>"
                               src="images/lapiz.gif"
                               onclick="f_recargar_axisgfi031('${axisgfi002_detalle_formula.CLAVE}')"/>
                             </c:if>
                       </div>
                       </axis:visible>
                                    </td>
                </tr>
                <tr>
                    <td class="titulocaja">
                        <b><axis:alt f="axisgfi002" c="CLAVE" lit="1000085"/></b>
                    </td>
                    <axis:visible f="axisgfi002" c="CRASTRO">
                    <td class="titulocaja">
                        <b><axis:alt f="axisgfi002" c="CRASTROE" lit="1000105"/></b>
                    </td>
                  </axis:visible>
                  <axis:visible f="axisgfi002" c="SUMATORIO">
                    <td class="titulocaja">
                        <b><axis:alt f="axisgfi002" c="SUMATORIO" lit="151750"/></b>
                        <input onclick="" type="checkbox"
                               id="SUMATORIO" name="SUMATORIO"
                               <c:if test="${axisgfi002_detalle_formula.SUMATORIO == 1}">checked</c:if>
                               value="${axisgfi002_detalle_formula.SUMATORIO}"
                               disabled />
                               
                    </td>
                  </axis:visible>
                </tr>
                <tr>
                    <td class="campocaja">
                        <input type="text" style="width:75%"
                               class="campowidthinput campo campotexto"
                               id="CLAVE" name="CLAVE" size="15"
                               value="${axisgfi002_detalle_formula.CLAVE}" 
                               <axis:atr f="axisgfi002" c="CLAVE" a="modificable=false"/> />
                    </td>
                    <axis:visible f="axisgfi002" c="CRASTRO">
                    <td class="campocaja">
                                <select name="CRASTRO" style="width:93%"
                                        id="CRASTRO" size="1" onchange=""
                                        class="campowidthselect campo campotexto"
                                        disabled >&nbsp;
                                      <option value="null">
                                            - <axis:alt f="axisgfi002" c="BLANCO" lit="108341"/> -
                                      </option>
                                      <c:forEach var="rastro"
                                                 items="${axisgfi002_datos_formula.RASTRO}"
                                                 varStatus="status">
                                            <option value="${rastro.CATRIBU}"
                                                    <c:if test="${axisgfi002_detalle_formula.CRASTRO == rastro.CATRIBU}">selected</c:if>>
                                                  ${rastro.TATRIBU}
                                            </option>
                                      </c:forEach>
                                </select>
                    </td>
                  </axis:visible>
                </tr>
                <tr>
                    <td class="titulocaja">
                        <b><axis:alt f="axisgfi002" c="CODIGO" lit="1000109"/></b>
                    </td>
                    <td class="titulocaja">
                            <b><axis:alt f="axisgfi002" c="DESCRIPCION" lit="100588"/></b>
                      </td>
                </tr>
                <tr>
                  <td class="campocaja" colspan="1">
                        <input type="text" style="width:75%"
                               class="campowidthinput campo campotexto"
                               id="CODIGO" name="CODIGO" size="15"
                               value="${axisgfi002_detalle_formula.CODIGO}" 
                               <axis:atr f="axisgfi002" c="CODIGO" a="modificable=false"/> />
                  </td>
                  <td class="campocaja" colspan="2">
                            <input type="text" style="width:93%"
                                   class="campowidthinput campo campotexto"
                                   id="DESCRIPCION" name="DESCRIPCION"
                                   size="15"
                                   value="${axisgfi002_detalle_formula.DESCRIPCION}" 
                                   <axis:atr f="axisgfi002" c="DESCRIPCION" a="modificable=false"/> />
                      </td>
                </tr>
                <tr>
                      <td class="titulocaja">
                            <b><axis:alt f="axisgfi002" c="FORMULA" lit="149926"/></b>
                      </td>
                </tr>
                <tr>
                      <td class="campocaja" colspan="3">
                            <textarea class="campo campotexto" style="width:100%;height:40px;font-size:11px;font-family:Arial;" name="FORMULA" id="FORMULA"
                                      <axis:atr f="axisgfi002" c="FORMULA" a="modificable=false"/> >${axisgfi002_detalle_formula.FORMULA}</textarea>
                      </td>
                </tr>
                <tr>
                    <td class="titulocaja">
                        <b><axis:alt f="axisgfi002" c="CRAMO" lit="100784"/></b>
                    </td>
                    <td class="titulocaja">
                                <b><axis:alt f="axisgfi002" c="UTILI" lit="108616"/></b>
                    </td>
                </tr>
                <tr>
                      <td class="campocaja">
                            <select name="CRAMO" style="width:93%"
                                    id="CRAMO" size="1" onchange=""
                                    class="campowidthselect campo campotexto"
                                    disabled >&nbsp;
                                  <option value="null">
                                        - <axis:alt f="axisgfi002" c="BLANCO" lit="108341"/> -
                                  </option>
                                  <c:forEach var="ramo"
                                             items="${axisgfi002_datos_formula.RAMO}"
                                             varStatus="status">
                                        <option value="${ramo.CRAMO}"
                                                <c:if test="${axisgfi002_detalle_formula.CRAMO == ramo.CRAMO}">selected</c:if>>
                                              ${ramo.TRAMO}
                                        </option>
                                  </c:forEach>
                            </select>
                      </td>
                      <td class="campocaja" colspan="2">
                                <select name="CUTILI" style="width:93%"
                                        id="CUTILI" size="1" onchange=""
                                        class="campowidthselect campo campotexto"
                                        disabled >&nbsp;
                                      <option value="null">
                                            - <axis:alt f="axisgfi002" c="BLANCO" lit="108341"/> -
                                      </option>
                                      <c:forEach var="util"
                                                 items="${axisgfi002_datos_formula.UTIL}"
                                                 varStatus="status">
                                            <option value="${util.CATRIBU}"
                                                    <c:if test="${axisgfi002_detalle_formula.CUTILI == util.CATRIBU}">selected</c:if>>
                                                  ${util.TATRIBU}
                                            </option>
                                      </c:forEach>
                                </select>
                        </td>
                </tr>
                    <!-- Parametres -->
                    <tr>
                          <td class="campocaja" colspan="6">
                                <b><axis:alt f="axisgfi002" c="PARAMETROS" lit="103694"/></b>
                          </td>
                    </tr>
                    <tr>
                          <td class="campocaja" colspan="6">
                                <!-- DisplayTag Lista de parámetros -->
                                <c:set var="title0">
                                      <axis:alt f="axisgfi002" c="CODIGO" lit="1000109"/>
                                </c:set>
                                <c:set var="title1">
                                      <axis:alt f="axisgfi002" c="DESCRIPCION" lit="100588"/>
                                </c:set>

                                <div class="displayspace">
                                      <display:table name="${axisgfi002_detalle_formula.PARAMS}"
                                                     id="T_IAX_GFIPARAM"
                                                     export="false"
                                                     class="dsptgtable"
                                                     pagesize="-1"
                                                     defaultsort="1"
                                                     defaultorder="ascending"
                                                     sort="list"
                                                     cellpadding="0"
                                                     cellspacing="0"
                                                     requestURI="">
                                            <%@ include file="../include/displaytag.jsp"%>
                                            <display:column title="${title0}"
                                                            sortable="true"
                                                            sortProperty=""
                                                            headerClass="headwidth20 sortable"
                                                            media="html"
                                                            autolink="false">
                                                  <div class="dspText">
                                                        ${T_IAX_GFIPARAM.OB_IAX_GFIPARAM.PARAMETRO}
                                                  </div>
                                            </display:column>
                                            <display:column title="${title1}"
                                                            sortable="true"
                                                            sortProperty=""
                                                            headerClass="sortable"
                                                            media="html"
                                                            autolink="false">
                                                  <div class="dspText">
                                                        ${T_IAX_GFIPARAM.OB_IAX_GFIPARAM.TPARAM}
                                                  </div>
                                            </display:column>
                                      </display:table>
                                </div>
                          </td>
                    </tr>
                    <tr>
                        <td align="right" colspan="6">
                               <axis:visible f="axisgfi002" c="BT_ANADIR">
                            <div class="separador">&nbsp;</div>
                            <input type="button" class="boton"
                                   id="but_anadir"
                                   value='<axis:alt f="axisgfi002" c="BT_ANADIR" lit="104825" />'
                                   onclick="javascript:f_validar_anadir('${axisgfi002_detalle_formula.CLAVE}')"/>
                            <div class="separador">&nbsp;</div>
                            </axis:visible>
                        </td>
                    </tr>
                    <tr>
                        <td  align="right" colspan="6"> 
                          <axis:visible f="axisgfi002" c="BT_TERMINOS">
                            <input type="button" class="boton" id="but_terminos" value='<axis:alt f="axisgfi002" c="BT_TERMINOS" lit="9001990" />' onclick="javascript:parent.f_consultar_terminos()"/>
                          </axis:visible>
                          <axis:visible f="axisgfi002" c="BT_TRAMOS">
                            <input type="button" class="boton" id="but_tramos" value='<axis:alt f="axisgfi002" c="BT_TRAMOS" lit="108676" />' onclick="javascript:parent.f_consultar_tramos()"/>
                          </axis:visible>
                          <axis:visible f="axisgfi002" c="BT_BUCLE">
                            <input type="button" class="boton" id="but_bucles" value='<axis:alt f="axisgfi002" c="BT_BUCLE" lit="9002036" />' onclick="javascript:parent.f_consultar_bucles()"/>
                          </axis:visible>
                        </td>
                    </tr>
                    <axis:visible f="axisgfi002" c="DSP_EJEC_FORMULAS">
                        <tr><td colspan="4"><div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axisgfi002" c="DSP_EJECUTA_FORMULA" lit="108347" /></div></td></tr>
                        <tr>                        
                            <td colspan="2">                            
                                <c:set var="title2">
                                      <axis:alt f="axisgfi002" c="PARAMETRO" lit="1000506"/>
                                </c:set>
                                <c:set var="title3">
                                      <axis:alt f="axisgfi002" c="VALOR" lit="101159"/>
                                </c:set>
                                <div class="displayspace">
                                <display:table name="${axisgfi002_detalle_formula.PARAMS}"
                                             id="T_IAX_GFIPARAM2"
                                             export="false"
                                             class="dsptgtable"
                                             pagesize="-1"
                                             defaultsort="1"
                                             defaultorder="ascending"
                                             sort="list"
                                             cellpadding="0"
                                             cellspacing="0"
                                             requestURI="">
                                    <%@ include file="../include/displaytag.jsp"%>
                                    <display:column title="${title2}"
                                                    sortable="false"
                                                    headerClass="sortable"
                                                    media="html"
                                                    autolink="false">
                                                ${T_IAX_GFIPARAM2.OB_IAX_GFIPARAM.PARAMETRO}
                                    </display:column>
                                    <display:column title="${title3}"
                                                    sortable="false"
                                                    headerClass="sortable"
                                                    media="html"
                                                    autolink="false">
                                          <c:if test="${T_IAX_GFIPARAM2.OB_IAX_GFIPARAM.PARAMETRO ne null}">                                                                                    
                                            <input type="text" style="width:80%"
                                               class="campo campotexto" onblur="if(!objUtiles.estaVacio(this.value))if(!objValidador.esCampoNumerico(this.value, true, -1,'${T_IAX_GFIPARAM2.OB_IAX_GFIPARAM.PARAMETRO}')){objDom.setValorPorId('PARAM_${T_IAX_GFIPARAM2.OB_IAX_GFIPARAM.PARAMETRO}', '');this.focus()}else{this.value=objNumero.stripNonNumeric(this.value)}"
                                               id="PARAM_${T_IAX_GFIPARAM2.OB_IAX_GFIPARAM.PARAMETRO}" name="PARAM_${T_IAX_GFIPARAM2.OB_IAX_GFIPARAM.PARAMETRO}"
                                               <axis:atr f="axisgfi002" c="VALOR_PARAM" a="modificable=true"/> />
                                          </c:if>
                                    </display:column>
                                </display:table>
                                </div>
                            </td>
                            <td> 
                                <c:set var="title4">
                                    <axis:alt f="axisgfi002" c="PREGUNTA" lit="9906457"/>
                                </c:set>
                                <div class="displayspace">
                                <table class="dsptgtable" cellpadding="0" cellspacing="0">                                   
                                    <thead>
                                        <tr>
                                            <th class="sortable">${title4}</th>
                                            <th class="sortable">${title3}</th>
                                            <th class="sortable"><a href="javascript:anyadir_linea_js()"><img border="0" alt="<axis:alt f="axisgfi002" c="ADD_PREGUNTA" lit="9001332"/>" title="<axis:alt f="axisgfi002" c="ADD_PREGUNTA_LIT" lit="9001332"/>" src="images/agenda.gif"/></a></th>
                                        </tr>
                                    </thead>
                                    <tbody id="table_preguntas"></tbody>
                                </table>
                                </div>
                            </td>
                        </tr>
                        <tr>                        
                            <td align="right" colspan="2">
                                <axis:visible f="axisgfi002" c="BT_EJECUTAR">                            
                                    <input type="button" class="boton"
                                           id="but_ejecutar"
                                           value='<axis:alt f="axisgfi002" c="BT_EJECUTAR" lit="109006" />'
                                           onclick="javascript:f_ejecutar()"/>                                
                                </axis:visible>                            
                            </td>
                            <td align="right">                            
                                <axis:visible f="axisgfi002" c="RESULTADO">
                                    <b><axis:alt f="axisgfi002" c="RESULTADO" lit="111046"/></b>
                                </axis:visible>
                                <axis:visible f="axisgfi002" c="RESULTADO">
                                    <input type="text" style="width:50%"
                                               class="campo campotexto"
                                               id="resultado" name="resultado"
                                               <axis:atr f="axisgfi002" c="RESULTADO" a="modificable=false"/> />
                                </axis:visible>
                            </td>
                        </tr>
                    </axis:visible>
              </table>
            </form></body>
</html>