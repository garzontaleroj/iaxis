<%/***Fichero: axisctr148.jsp,Autos*/%>
<%@ page contentType="text/html;charset=windows-1252"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<c:set var="literalPantalla" value="9001037"/>
   <c:if test="${Mostrar==1}">
                                        <tr>
                                            <td>
                                                <div class="titulo">
                                                    <img src="images/flecha.gif"/><b><axis:alt c="TITULO_FORM"
                                                                                               f="axisctr148"
                                                                                               lit="${literalPantalla}"/></b>
                                                </div>
                                                <!--campos-->
                                                <table class="seccion">
                                                    <tr>
                                                        <td align="left">
                                                            <table class="area"
                                                                   align="center">
                                                                <tr>
                                                                    <th style="width:25%;height:0px">
                                                                        &nbsp;
                                                                    </th>
                                                                    <th style="width:25%;height:0px">
                                                                        &nbsp;
                                                                    </th>
                                                                    <th style="width:25%;height:0px">
                                                                        &nbsp;
                                                                    </th>
                                                                    <th style="width:25%;height:0px">
                                                                        &nbsp;
                                                                    </th>
                                                                </tr>
                                                                <tr>
                                                                    <axis:ocultar f="axisctr148"
                                                                                  c="CVERSION"
                                                                                  dejarHueco="false">
                                                                        <td class="titulocaja">
                                                                            <b><axis:alt c="CVERSION"
                                                                                         f="axisctr148"
                                                                                         lit="9001146"/></b>
                                                                        </td>
                                                                    </axis:ocultar>
                                                                </tr>
                                                                <tr>
                                                                    <axis:ocultar f="axisctr148"
                                                                                  c="CVERSION"
                                                                                  dejarHueco="false">
                                                                        <td class="campocaja">
                                                                            <input type="text"
                                                                                   name="CVERSION"
                                                                                   id="CVERSION"
                                                                                   onchange="f_recuperar_version(this.value)"
                                                                                   value="${__formdata.CVERSION}"
                                                                                   class="campowidthinput campo campotexto"
                                                                                   title='<axis:alt c="CVERSION" f="axisctr148" lit="9001146" />'
                                                                                   <axis:atr f="axisctr148" c="CVERSION" a="obligatorio=true&modificable=true"/>/>
                                                                        </td>
                                                                    </axis:ocultar>
                                                                    <axis:ocultar f="axisctr148"
                                                                                  c="TVERSION"
                                                                                  dejarHueco="false">
                                                                        <td class="campocaja">
                                                                            <input type="text"
                                                                                   name="TVERSION"
                                                                                   id="TVERSION"
                                                                                   value="${__formdata.TVERSION}"
                                                                                   <axis:atr f="axisctr148" c="TVERSION" a="modificable=false&isInputText=true"/>
                                                                                   style="background-color:transparent;border:0px;font-weight:bold;color:orange"
                                                                                   class="campowidthinput campo campotexto"/>
                                                             </td>
                                                                    </axis:ocultar>
                                                                </tr>
                                                                <tr>
                                                                    <axis:ocultar f="axisctr148"
                                                                                  c="CMARCA"
                                                                                  dejarHueco="false">
                                                                        <!-- Marca -->
                                                                        <td class="titulocaja">
                                                                            <b><axis:alt c="CMARCA"
                                                                                         f="axisctr148"
                                                                                         lit="9001046"/></b>
                                                                        </td>
                                                                    </axis:ocultar>                                                                   
                                                                    <axis:ocultar f="axisctr148"
                                                                                  c="CMODELO"
                                                                                  dejarHueco="false">
                                                                        <!-- Model -->
                                                                        <td class="titulocaja"
                                                                            id="LCMODELO">
                                                                            <b><axis:alt c="CMODELO"
                                                                                         f="axisctr148"
                                                                                         lit="108515"/></b>
                                                                        </td>
                                                                    </axis:ocultar>
                                                                     <axis:ocultar f="axisctr148"
                                                                                  c="CTIPVEH"
                                                                                  dejarHueco="false">
                                                                        <!-- tipo vehicle -->
                                                                        <td class="titulocaja">
                                                                            <b><axis:alt c="CTIPVEH"
                                                                                         f="axisctr148"
                                                                                         lit="9001059"/></b>
                                                                        </td>
                                                                    </axis:ocultar>
                                                                </tr>
                                                                <tr>
                                                                    <axis:ocultar f="axisctr148"
                                                                                  c="CMARCA"
                                                                                  dejarHueco="false">
                                                                        <td class="campocaja">
                                                                            <select name="CMARCA"
                                                                                    id="CMARCA"
                                                                                    size="1"
                                                                                    onchange="f_llenar_tipo(this.value)"
                                                                                    title='<axis:alt c="CMARCA" f="axisctr148" lit="9001046" />'
                                                                                    class="campowidthselect campo campotexto"
                                                                                    <axis:atr f="axisctr148" c="CMARCA" a="modificable=true&isInputText=false&obligatorio=true"/>>
                                                                                <option value="<%= Integer.MIN_VALUE %>">
                                                                                    -
                                                                                    <axis:alt f="axisctr148"
                                                                                              c="SELECCIONAR"
                                                                                              lit="108341"/>
                                                                                    -
                                                                                </option>
                                                                                     <c:forEach var="marcas" items="${MARCAS}">
                                                                                    <option value = "${marcas.CMARCA}"
                                                                                     <c:if test="${(!empty __formdata.CMARCA)&& marcas.CMARCA == __formdata.CMARCA}"> selected </c:if> value="${marcas.TMARCA}">
                                                                                     ${marcas.TMARCA}<axis:visible f="axisctr148" c="CODIGOS">&nbsp&nbsp(${marcas.CMARCA})</axis:visible>  </option>
                                                                                     </c:forEach>
                                                                            </select>
                                                                        </td>
                                                                    </axis:ocultar>                                                                  
                                                                    <axis:ocultar f="axisctr148"
                                                                                  c="CMODELO"
                                                                                  dejarHueco="false">
                                                                        <td class="campocaja">
                                                                            <select name="CMODELO"
                                                                                    id="CMODELO"
                                                                                    size="1"
                                                                                    onchange="f_llenar_puertas(document.axisctr148.CMARCA.value,this.value); f_llenar_tipo_xmod(document.axisctr148.CMARCA.value,this.value);"
                                                                                    class="campowidthselect campo campotexto"
                                                                                    title='<axis:alt c="CMODELO" f="axisctr148" lit="108515" />'
                                                                                    <axis:atr f="axisctr148" c="CMODELO" a="obligatorio=true&modificable=true&isInputText=false"/>>
                                                                                <option value="<%= Integer.MIN_VALUE %>">
                                                                                    -
                                                                                    <axis:alt f="axisctr148"
                                                                                              c="SELECCIONAR"
                                                                                              lit="108341"/>
                                                                                    -
                                                                                </option>
                                                                                <c:forEach var="modelos"
                                                                                           items="${MODELOS}">
                                                                                    <option value="${modelos.CMODELO}"
                                                                                            <c:if test="${(!empty __formdata.CMODELO) && modelos.CMODELO == __formdata.CMODELO}"> selected </c:if>>
                                                                                        ${modelos.TMODELO}
                                                                                    </option>
                                                                                </c:forEach>
                                                                            </select>
                                                                        </td>
                                                                    </axis:ocultar>
                                                                    <axis:visible c="EDIT_VERSION"
                                                                                  f="axisctr148">
                                                                        <td colspan="2"
                                                                            id="BUT_EDIT">
                                                                            <b><axis:alt c="EDIT_VERSION"
                                                                                         f="axisctr148"
                                                                                         lit="9001051"/></b>
                                                                            &amp;nbsp&amp;nbsp&amp;nbsp
                                                                            <a href="javascript:f_abrir_axisctr058(document.axisctr148.CMARCA.value,document.axisctr148.CMODELO.value,document.axisctr148.CMOTOR.value)">
                                                                                <img border="0"
                                                                                     src="images/car.gif"/>
                                                                            </a>
                                                                        </td>
                                                                    </axis:visible>
                                                                      <axis:ocultar f="axisctr148"
                                                                                  c="CTIPVEH"
                                                                                  dejarHueco="false">
                                                                        <td class="campocaja">
                                                                            <select name="CTIPVEH"
                                                                                    id="CTIPVEH"
                                                                                    size="1"
                                                                                    onchange="f_llenar_clase(this.value)"
                                                                                    class="campowidthselect campo campotexto"
                                                                                    title='<axis:alt c="CTIPVEH" f="axisctr148" lit="9001059" />'
                                                                                    <axis:atr f="axisctr148" c="CTIPVEH" a="modificable=true&obligatorio=true&isInputText=false"/>>
                                                                                <option value="${axisctr065_Version.CTIPVEH}">
                                                                                    -
                                                                                    <axis:alt f="axisctr148"
                                                                                              c="CTIPVEH_1V"
                                                                                              lit="108341"/>
                                                                                    -
                                                                                </option>
                                                                                <c:forEach var="tipveh"
                                                                                           items="${LSTCTIPVEH}">
                                                                                    <option value="${tipveh.CTIPVEH}"
                                                                                            <c:if test="${tipveh.CTIPVEH == __formdata.CTIPVEH}"> selected </c:if>>
                                                                                        ${tipveh.TTIPVEH}
                                                                                    </option>
                                                                                </c:forEach>
                                                                            </select>
                                                                        </td>
                                                                    </axis:ocultar>
                                                                </tr>
                                                                <tr>
                                                                    <axis:ocultar f="axisctr148"
                                                                                  c="CCLAVEH"
                                                                                  dejarHueco="false">
                                                                        <!-- clase vehicle -->
                                                                        <td class="titulocaja">
                                                                            <b><axis:alt c="CCLAVEH"
                                                                                         f="axisctr148"
                                                                                         lit="9001060"/></b>
                                                                        </td>
                                                                    </axis:ocultar>
                                                                    <axis:ocultar f="axisctr148"
                                                                                  c="ANYO"
                                                                                  dejarHueco="false">
                                                                        <!-- Model -->
                                                                        <td class="titulocaja"
                                                                            id="td_ANYO">
                                                                            <b><axis:alt c="ANYO"
                                                                                         f="axisctr148"
                                                                                         lit="101606"/></b>
                                                                        </td>
                                                                    </axis:ocultar>
                                                                </tr>
                                                                <tr>
                                                                    <axis:ocultar f="axisctr148"
                                                                                  c="CCLAVEH"
                                                                                  dejarHueco="false">
                                                                        <td class="campocaja">
                                                                            <select name="CCLAVEH"
                                                                                    id="CCLAVEH"
                                                                                    size="1"
                                                                                    onchange="f_llenar_modelo_porclase(this.value)"
                                                                                    title='<axis:alt c="CCLAVEH" f="axisctr148" lit="9001060" />'
                                                                                    <axis:atr f="axisctr148" c="CCLAVEH" a="modificable=true&isInputText=false&obligatorio=true"/>
                                                                                    class="campowidthselect campo campotexto">
                                                                                <option value="${__formdata.CCLAVEH}">
                                                                                    -
                                                                                    <axis:alt f="axisctr148"
                                                                                              c="CCLAVEH_1V"
                                                                                              lit="108341"/>
                                                                                    -
                                                                                </option>
                                                                                <c:forEach var="claveh"
                                                                                           items="${LSTCCLAVEH}">
                                                                                    <option value="${claveh.CCLAVEH}"
                                                                                            <c:if test="${__formdata.CCLAVEH != 'null' && claveh.CCLAVEH == __formdata.CCLAVEH}"> selected </c:if>>
                                                                                        ${claveh.TCLAVEH}
                                                                                        <axis:visible f="axisctr148"
                                                                                                      c="CODIGOS">
                                                                                            &amp;nbsp&amp;nbsp&amp;nbsp&amp;nbsp&amp;nbsp&amp;nbsp&amp;nbsp&amp;nbsp&amp;nbsp(
                                                                                            ${claveh.CCLAVEH}
                                                                                            )
                                                                                        </axis:visible>
                                                                                    </option>
                                                                                </c:forEach>
                                                                            </select>
                                                                        </td>
                                                                    </axis:ocultar>
                                                                    <axis:ocultar f="axisctr148"
                                                                                  c="ANYO"
                                                                                  dejarHueco="false">
                                                                        <c:choose>
                                                                            <c:when test="${empty AUT_ANYOTEXTO || (!empty AUT_ANYOTEXTO && AUT_ANYOTEXTO == 0)}">
                                                                                <td class="campocaja">
                                                                                    <select name="ANYO"
                                                                                            id="ANYO"
                                                                                            size="1"
                                                                                            onchange="f_cambiar_anyo(this.value)"
                                                                                            class="campowidthselect campo campotexto"
                                                                                            title='<axis:alt c="ANYO" f="axisctr148" lit="101606" />'
                                                                                            <axis:atr f="axisctr148" c="ANYO" a="obligatorio=true&modificable=true&isInputText=false"/>>
                                                                                        <option value="<%= Integer.MIN_VALUE %>">
                                                                                            -
                                                                                            <axis:alt f="axisctr148"
                                                                                                      c="SELECCIONAR"
                                                                                                      lit="108341"/>
                                                                                            -
                                                                                        </option>
                                                                                        <c:forEach var="modelos"
                                                                                                   items="${LSTANYOS}">
                                                                                            <option value="${modelos.ANYO}"
                                                                                                    <c:if test="${(!empty __formdata.ANYO) && modelos.ANYO == __formdata.ANYO}"> selected </c:if>>
                                                                                                ${modelos.ANYO}
                                                                                            </option>
                                                                                        </c:forEach>
                                                                                    </select>
                                                                                </td>
                                                                            </c:when>
                                                                            <c:otherwise>
                                                                                <td class="campocaja">
                                                                                    <input type="text"
                                                                                           name="ANYO"
                                                                                           title='<axis:alt c="ANYO" f="axisctr148" lit="101606" />'
                                                                                           id="ANYO"
                                                                                           <axis:atr f="axisctr148" c="ANYO" a="obligatorio=false"/>
                                                                                           value="${__formdata.ANYO}"
                                                                                           class="campowidthinput campo campotexto" formato="entero" maxlength="4" />
                                                                                </td>
                                                                            </c:otherwise>
                                                                        </c:choose>
                                                                    </axis:ocultar>
                                                                </tr>
                                                                <tr>
                                                                    <axis:visible c="NPUERTAS"
                                                                                  f="axisctr148">
                                                                        <!-- Nº de puertas -->
                                                                        <td class="titulocaja"
                                                                            id="LNPUERTAS">
                                                                            <b><axis:alt c="NPUERTAS"
                                                                                         f="axisctr148"
                                                                                         lit="9001053"/></b>
                                                                        </td>
                                                                    </axis:visible>
                                                                </tr>
                                                                <tr>
                                                                    <axis:visible c="NPUERTAS"
                                                                                  f="axisctr148">
                                                                        <td class="campocaja">
                                                                            <select name="NPUERTAS"
                                                                                    id="NPUERTAS"
                                                                                    value="${__formdata.NPUERTAS}"
                                                                                    size="1"
                                                                                    onchange="f_limpiar(2)"
                                                                                    class="campowidthselect campo campotexto"
                                                                                    title='<axis:alt c="NPUERTAS" f="axisctr148" lit="9001053" />'
                                                                                    <axis:atr f="axisctr148" c="NPUERTAS" a="modificable=true&isInputText=false&obligatorio=false"/>>
                                                                                <option value="<%= Integer.MIN_VALUE %>">
                                                                                    -
                                                                                    <axis:alt f="axisctr148"
                                                                                              c="SELECCIONAR"
                                                                                              lit="108341"/>
                                                                                    -
                                                                                </option>
                                                                                <c:forEach var="puertas"
                                                                                           items="${PUERTAS}">
                                                                                    <option value="${puertas.NPUERTA}"
                                                                                            <c:if test="${(!empty __formdata.NPUERTAS) && puertas.NPUERTA == __formdata.NPUERTAS}"> selected </c:if>>
                                                                                        ${puertas.NPUERTA}
                                                                                    </option>
                                                                                </c:forEach>
                                                                            </select>
                                                                        </td>
                                                                    </axis:visible>
                                                                </tr>
                                                                <tr>
                                                                    <axis:visible c="TRIESGO"
                                                                                  f="axisctr148">
                                                                        <!-- Desc -->
                                                                        <td class="titulocaja"
                                                                            colspan="2">
                                                                            <b><axis:alt c="TRIESGO"
                                                                                         f="axisctr148"
                                                                                         lit="100588"/></b>
                                                                        </td>
                                                                    </axis:visible>
                                                                </tr>
                                                                <tr>
                                                                    <axis:ocultar f="axisctr148"
                                                                                  c="TRIESGO"
                                                                                  dejarHueco="false">
                                                                        <td class="campocaja"
                                                                            colspan="2">
                                                                            <input type="text"
                                                                                   name="TRIESGO"
                                                                                   title='<axis:alt c="TRIESGO" f="axisctr148" lit="100588" />'
                                                                                   id="TRIESGO"
                                                                                   <axis:atr f="axisctr148" c="TRIESGO" a="obligatorio=false"/>
                                                                                   value="${__formdata.TRIESGO}"
                                                                                   class="campowidthinput campo campotexto"/>
                                                                        </td>
                                                                    </axis:ocultar>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </c:if>