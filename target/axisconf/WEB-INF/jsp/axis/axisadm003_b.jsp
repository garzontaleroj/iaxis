<%@ page contentType="text/html;charset=iso-8859-15" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ page import="axis.mvc.control.AbstractDispatchAction"%>
<%@ page import="axis.service.axis.AxisBaseService"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

                        <!-- *************************** SECCION DETALLE RECIBO ********************************* -->
                        <axis:visible f="axisadm003" c="DSP_DETALLE">
                            <tr>
                                <td align="left">
                                    
                                    <table class="area" align="center">
                                               
                                        <tr>
                                            <th style="width:100%;height:0px"></th>
                                        </tr>
                                        
                                        <tr>
                                            <td class="campocaja">
                                                <div style="float:left;">
                                                    <img id="DSP_DETALLE_parent" src="images/mes.gif" onclick="objEstilos.toggleDisplay('DSP_DETALLE', this)" style="cursor:pointer"/>
                                                    <b><axis:alt f="axisadm003" c="DSP_DETALLE_LIT" lit="9904013"/></b>
                                                </div>
                                                <div style="clear:both;">
                                                    <hr class="titulo">
                                                </div>
                                            </td>
                                        </tr>         
                                    
                                        <tr id="DSP_DETALLE_children" style="display:none">
                                            <td class="campocaja" >
                                                <table class="area" align="center">
                                                     <tr>
                                                        <th style="width:20%;height:0px"></th>
                                                        <th style="width:20%;height:0px"></th>
                                                        <th style="width:20%;height:0px"></th>
                                                        <th style="width:20%;height:0px"></th>                                                    
                                                        <th style="width:20%;height:0px"></th>                                                    
                                                    </tr>
                                                    
                                                    <tr>
                                                        <axis:ocultar c="TRIESGO" f="axisadm003" dejarHueco="false">
                                                            <td class="titulocaja" id="LIT_TRIESGO" colspan="4">
                                                                <b><axis:alt f="axisadm003" c="TRIESGO" lit="102524"/></b>
                                                            </td>
                                                        </axis:ocultar>
                                                    </tr>
                                                    <tr>
                                                        <axis:ocultar c="TRIESGO" f="axisadm003" dejarHueco="false">
                                                            <td class="campocaja" id="TD_TRIESGO" colspan="4">
                                                                <input type="text" class="campo campotexto campodisabled" id="TRIESGO" name="TRIESGO" <axis:atr f="axisadm003" c="TRIESGO" a="modificable=false&obligatorio=false"/> size="15" style="width:90%"
                                                                value="${__formdata.OB_IAX_RECIBODET.TRIESGO}" readonly="readonly"/>
                                                            </td>
                                                        </axis:ocultar>
                                                    </tr>
                                                    
                                                    <tr>
                                                        <axis:ocultar c="TGESCOB" f="axisadm003" dejarHueco="false">
                                                            <td class="titulocaja" id="LIT_TGESCOB" colspan="2">
                                                                <b><axis:alt f="axisadm003" c="TGESCOB" lit="9903385"/></b>
                                                            </td>
                                                        </axis:ocultar>
                                                        <axis:ocultar c="TIPNEGOC" f="axisadm003" dejarHueco="false">
                                                            <td class="titulocaja" id="LIT_TIPNEGOC">
                                                                <b><axis:alt f="axisadm003" c="TIPNEGOC" lit="9904000"/></b>
                                                            </td>
                                                        </axis:ocultar>
                                                    </tr>
                                                    <tr>
                                                        <axis:ocultar c="TGESCOB" f="axisadm003" dejarHueco="false">
                                                            <td class="campocaja" id="TD_TGESCOB" colspan="2">
                                                                <input type="text" class="campo campotexto campodisabled" id="TGESCOB" name="TGESCOB" <axis:atr f="axisadm003" c="TGESCOB" a="modificable=false&obligatorio=false"/> size="15" style="width:90%"
                                                                value="${__formdata.OB_IAX_RECIBODET.TGESCOB}" readonly="readonly"/>
                                                            </td>
                                                        </axis:ocultar>
                                                        <axis:ocultar c="TIPNEGOC" f="axisadm003" dejarHueco="false">
                                                            <td class="campocaja" id="TD_TIPNEGOC">
                                                                <input type="text" class="campo campotexto campodisabled" id="TIPNEGOC" name="TIPNEGOC" <axis:atr f="axisadm003" c="TIPNEGOC" a="modificable=false&obligatorio=false"/> size="15" style="width:90%"
                                                                value="${__formdata.OB_IAX_RECIBODET.TIPNEGOC}" readonly="readonly"/>
                                                            </td>
                                                        </axis:ocultar>
                                                    </tr>
                                                    
                                                    <tr>
                                                        <axis:ocultar c="NRELREC" f="axisadm003" dejarHueco="false">
                                                            <td class="titulocaja" id="LIT_NRELREC">
                                                                <b><axis:alt f="axisadm003" c="NRELREC" lit="9904014"/></b>
                                                            </td>
                                                        </axis:ocultar>
                                                        <axis:ocultar c="NREMREC" f="axisadm003" dejarHueco="false">
                                                            <td class="titulocaja" id="LIT_NREMREC">
                                                                <b><axis:alt f="axisadm003" c="NREMREC" lit="9001945"/></b>
                                                            </td>
                                                        </axis:ocultar>
                                                        <axis:ocultar c="NLIQMEN" f="axisadm003" dejarHueco="false">
                                                            <td class="titulocaja" id="LIT_NLIQMEN">
                                                                <b><axis:alt f="axisadm003" c="NLIQMEN" lit="9904002"/></b>
                                                            </td>
                                                        </axis:ocultar>
                                                    </tr>
                                                    <tr>
                                                        <axis:ocultar c="NRELREC" f="axisadm003" dejarHueco="false">
                                                            <td class="campocaja" id="TD_NRELREC">
                                                                <input type="text" class="campo campotexto campodisabled" id="NRELREC" name="NRELREC" <axis:atr f="axisadm003" c="NRELREC" a="modificable=false&obligatorio=false"/> size="15" style="width:90%"
                                                                value="${__formdata.OB_IAX_RECIBODET.NRELREC}" readonly="readonly"/>
                                                            </td>
                                                        </axis:ocultar>
                                                        <axis:ocultar c="NREMREC" f="axisadm003" dejarHueco="false">
                                                            <td class="campocaja" id="TD_NREMREC">
                                                                <input type="text" class="campo campotexto campodisabled" id="NREMREC" name="NREMREC" <axis:atr f="axisadm003" c="NREMREC" a="modificable=false&obligatorio=false"/> size="15" style="width:90%"
                                                                value="${__formdata.OB_IAX_RECIBODET.NREMREC}" readonly="readonly"/>
                                                            </td>
                                                        </axis:ocultar>
                                                        <axis:ocultar c="NLIQMEN" f="axisadm003" dejarHueco="false">
                                                            <td class="campocaja" id="TD_NLIQMEN">
                                                                <input type="text" class="campo campotexto campodisabled" id="NLIQMEN" name="NLIQMEN" <axis:atr f="axisadm003" c="NLIQMEN" a="modificable=false&obligatorio=false"/> size="15" style="width:90%"
                                                                value="${__formdata.OB_IAX_RECIBODET.NLIQMEN}" readonly="readonly"/>
                                                            </td>
                                                        </axis:ocultar>
                                                    </tr>
                                                    
                                                    <tr>
                                                        <axis:ocultar c="NRECLAMSN" f="axisadm003" dejarHueco="false">
                                                            <td class="titulocaja" id="LIT_NRECLAMSN">
                                                                <b><axis:alt f="axisadm003" c="NRECLAMSN" lit="9000974"/></b>
                                                            </td>
                                                        </axis:ocultar>
                                                        <axis:ocultar c="NJUDICISN" f="axisadm003" dejarHueco="false">
                                                            <td class="titulocaja" id="LIT_NJUDICISN">
                                                                <b><axis:alt f="axisadm003" c="NJUDICISN" lit="9904018"/></b>
                                                            </td>
                                                        </axis:ocultar>
                                                        <axis:ocultar c="NRECLAM" f="axisadm003" dejarHueco="false">
                                                            <td class="titulocaja" id="LIT_NRECLAM">
                                                                <b><axis:alt f="axisadm003" c="NRECLAM" lit="9904017"/></b>
                                                            </td>
                                                        </axis:ocultar>
                                                        <axis:ocultar c="NDUPREC" f="axisadm003" dejarHueco="false">
                                                            <td class="titulocaja" id="LIT_NDUPREC">
                                                                <b><axis:alt f="axisadm003" c="NDUPREC" lit="9904016"/></b>
                                                            </td>
                                                        </axis:ocultar>
                                                    </tr>
                                                    <tr>
                                                        <axis:ocultar c="NRECLAMSN" f="axisadm003" dejarHueco="false">
                                                            <td class="campocaja" id="TD_NRECLAMSN">
                                                                <input type="text" class="campo campotexto campodisabled" id="NRECLAMSN" name="NRECLAMSN" <axis:atr f="axisadm003" c="NRECLAMSN" a="modificable=false&obligatorio=false"/> size="15" style="width:90%"
                                                                value="${__formdata.OB_IAX_RECIBODET.NRECLAMSN}" readonly="readonly"/>
                                                            </td>
                                                        </axis:ocultar>
                                                        <axis:ocultar c="NJUDICISN" f="axisadm003" dejarHueco="false">
                                                            <td class="campocaja" id="TD_NJUDICISN">
                                                                <input type="text" class="campo campotexto campodisabled" id="NJUDICISN" name="NJUDICISN" <axis:atr f="axisadm003" c="NJUDICISN" a="modificable=false&obligatorio=false"/> size="15" style="width:90%"
                                                                value="${__formdata.OB_IAX_RECIBODET.NJUDICISN}" readonly="readonly"/>
                                                            </td>
                                                        </axis:ocultar>
                                                        <axis:ocultar c="NRECLAM" f="axisadm003" dejarHueco="false">
                                                            <td class="campocaja" id="TD_NRECLAM">
                                                                <input type="text" class="campo campotexto campodisabled" id="NRECLAM" name="NRECLAM" <axis:atr f="axisadm003" c="NRECLAM" a="modificable=false&obligatorio=false"/> size="15" style="width:90%"
                                                                value="${__formdata.OB_IAX_RECIBODET.NRECLAM}" readonly="readonly"/>
                                                            </td>
                                                        </axis:ocultar>
                                                        <axis:ocultar c="NDUPREC" f="axisadm003" dejarHueco="false">
                                                            <td class="campocaja" id="TD_NDUPREC">
                                                                <input type="text" class="campo campotexto campodisabled" id="NDUPREC" name="NDUPREC" <axis:atr f="axisadm003" c="NDUPREC" a="modificable=false&obligatorio=false"/> size="15" style="width:90%"
                                                                value="${__formdata.OB_IAX_RECIBODET.NDUPREC}" readonly="readonly"/>
                                                            </td>
                                                        </axis:ocultar>
                                                    </tr>
                                                    
                                                    <tr>
                                                        <axis:ocultar c="TACCPRE" f="axisadm003" dejarHueco="false">
                                                            <td class="titulocaja" id="LIT_TACCPRE" colspan="2">
                                                                <b><axis:alt f="axisadm003" c="TACCPRE" lit="9903810"/></b>
                                                            </td>
                                                        </axis:ocultar>
                                                        <axis:ocultar c="TACCRET" f="axisadm003" dejarHueco="false">
                                                            <td class="titulocaja" id="LIT_TACCRET" colspan="2">
                                                                <b><axis:alt f="axisadm003" c="TACCRET" lit="9903811"/></b>
                                                            </td>
                                                        </axis:ocultar>
                                                    </tr>
                                                    <tr>
                                                        <axis:ocultar c="TACCPRE" f="axisadm003" dejarHueco="false">
                                                            <td class="campocaja" id="TD_TACCPRE" colspan="2">
                                                                <input type="text" class="campo campotexto campodisabled" id="TACCPRE" name="TACCPRE" <axis:atr f="axisadm003" c="TACCPRE" a="modificable=false&obligatorio=false"/> size="15" style="width:90%"
                                                                value="${__formdata.OB_IAX_RECIBODET.TACCPRE}" readonly="readonly"/>
                                                            </td>
                                                        </axis:ocultar>
                                                        <axis:ocultar c="TACCRET" f="axisadm003" dejarHueco="false">
                                                            <td class="campocaja" id="TD_TACCRET" colspan="2">
                                                                <input type="text" class="campo campotexto campodisabled" id="TACCRET" name="TACCRET" <axis:atr f="axisadm003" c="TACCRET" a="modificable=false&obligatorio=false"/> size="15" style="width:90%"
                                                                value="${__formdata.OB_IAX_RECIBODET.TACCRET}" readonly="readonly"/>
                                                            </td>
                                                        </axis:ocultar>
                                                    </tr>
                                                    
                                                    <tr>
                                                        <axis:ocultar c="TOBSERV" f="axisadm003" dejarHueco="false">
                                                            <td class="titulocaja" id="LIT_TOBSERV" colspan="4">
                                                                <b><axis:alt f="axisadm003" c="TOBSERV" lit="101162"/></b>
                                                            </td>
                                                        </axis:ocultar>
                                                    </tr>
                                                    <tr>
                                                        <axis:ocultar c="TOBSERV" f="axisadm003" dejarHueco="false">
                                                            <td class="campocaja" id="TOBSERV" colspan="4">
                                                                <textarea  rows="4" class="campo campotexto" <axis:atr f="axisadm003" c="TOBSERV" a="modificable=false&obligatorio=false"/>
                                                                style="width:100%;"  name="TOBSERV" id="TOBSERV">${__formdata.OB_IAX_RECIBODET.TOBSERV}</textarea>
                                                            </td>
                                                        </axis:ocultar>
                                                    </tr>
                                                    
                                                    <tr>
                                                        <axis:ocultar c="ICOMBRU" f="axisadm003" dejarHueco="false">
                                                            <td class="titulocaja" id="LIT_ICOMBRU">
                                                                <b><axis:alt f="axisadm003" c="ICOMBRU" lit="103170"/></b>
                                                            </td>
                                                        </axis:ocultar>
                                                        <axis:ocultar c="ICOMLIQ" f="axisadm003" dejarHueco="false">
                                                            <td class="titulocaja" id="LIT_ICOMLIQ">
                                                                <b><axis:alt f="axisadm003" c="ICOMLIQ" lit="9904019"/></b>
                                                            </td>
                                                        </axis:ocultar>
                                                        <axis:ocultar c="ICOMRET" f="axisadm003" dejarHueco="false">
                                                            <td class="titulocaja" id="LIT_ICOMRET">
                                                                <b><axis:alt f="axisadm003" c="ICOMRET" lit="112579"/></b>
                                                            </td>
                                                        </axis:ocultar>
                                                        <axis:ocultar c="TESTCOM" f="axisadm003" dejarHueco="false">
                                                            <td class="titulocaja" id="LIT_TESTCOM">
                                                                <b><axis:alt f="axisadm003" c="TESTCOM" lit="9904020"/></b>
                                                            </td>
                                                        </axis:ocultar>
                                                        <axis:ocultar c="FESTCOM" f="axisadm003" dejarHueco="false">
                                                            <td class="titulocaja" id="LIT_FESTCOM">
                                                                <b><axis:alt f="axisadm003" c="FESTCOM" lit="9904021"/></b>
                                                            </td>
                                                        </axis:ocultar>
                                                    </tr>
                                                    <tr>
                                                        <axis:ocultar c="ICOMBRU" f="axisadm003" dejarHueco="false">
                                                            <td class="campocaja" id="TD_ICOMBRU">
                                                                <input type="text" class="campo campotexto campodisabled" id="ICOMBRU" name="ICOMBRU" <axis:atr f="axisadm003" c="ICOMBRU" a="modificable=false&obligatorio=false"/> size="15" style="width:90%"
                                                                value="<fmt:formatNumber pattern='${__formatNumberPatterns[__defaultCMONINT]}' value='${__formdata.OB_IAX_RECIBODET.ICOMBRU}'/>" readonly="readonly"/>
                                                            </td>
                                                        </axis:ocultar>
                                                        <axis:ocultar c="ICOMLIQ" f="axisadm003" dejarHueco="false">
                                                            <td class="campocaja" id="TD_ICOMLIQ">
                                                                <input type="text" class="campo campotexto campodisabled" id="ICOMLIQ" name="ICOMLIQ" <axis:atr f="axisadm003" c="ICOMLIQ" a="modificable=false&obligatorio=false"/> size="15" style="width:90%"
                                                                value="<fmt:formatNumber pattern='${__formatNumberPatterns[__defaultCMONINT]}' value='${__formdata.OB_IAX_RECIBODET.ICOMLIQ}'/>" readonly="readonly"/>
                                                            </td>
                                                        </axis:ocultar>
                                                        <axis:ocultar c="ICOMRET" f="axisadm003" dejarHueco="false">
                                                            <td class="campocaja" id="TD_ICOMRET">
                                                                <input type="text" class="campo campotexto campodisabled" id="ICOMRET" name="ICOMRET" <axis:atr f="axisadm003" c="ICOMRET" a="modificable=false&obligatorio=false"/> size="15" style="width:90%"
                                                                value="<fmt:formatNumber pattern='${__formatNumberPatterns[__defaultCMONINT]}' value='${__formdata.OB_IAX_RECIBODET.ICOMRET}'/>" readonly="readonly"/>
                                                            </td>
                                                        </axis:ocultar>
                                                        <axis:ocultar c="TESTCOM" f="axisadm003" dejarHueco="false">
                                                            <td class="campocaja" id="TD_TESTCOM">
                                                                <input type="text" class="campo campotexto campodisabled" id="TESTCOM" name="TESTCOM" <axis:atr f="axisadm003" c="TESTCOM" a="modificable=false&obligatorio=false"/> size="15" style="width:90%"
                                                                value="${__formdata.OB_IAX_RECIBODET.TESTCOM}" readonly="readonly"/>
                                                            </td>
                                                        </axis:ocultar>
                                                        <axis:ocultar c="FESTCOM" f="axisadm003" dejarHueco="false">
                                                            <td class="campocaja" id="TD_FESTCOM">
                                                                <input type="text" class="campo campotexto campodisabled" id="FESTCOM" name="FESTCOM" <axis:atr f="axisadm003" c="FESTCOM" a="modificable=false&obligatorio=false"/> size="15" style="width:90%"
                                                                value="<fmt:formatDate pattern='dd/MM/yyyy' value='${__formdata.OB_IAX_RECIBODET.FESTCOM}'/>" readonly="readonly"/>
                                                            </td>
                                                        </axis:ocultar>
                                                    </tr>
                                                    
                                                    <tr>
                                                        <axis:ocultar c="CDOCCOM" f="axisadm003" dejarHueco="false">
                                                            <td class="titulocaja" id="LIT_CDOCCOM">
                                                                <b><axis:alt f="axisadm003" c="CDOCCOM" lit="9904022"/></b>
                                                            </td>
                                                        </axis:ocultar>
                                                    </tr>
                                                    <tr>
                                                        <axis:ocultar c="CDOCCOM" f="axisadm003" dejarHueco="false">
                                                            <td class="campocaja" id="TD_CDOCCOM">
                                                                <input type="text" class="campo campotexto campodisabled" id="CDOCCOM" name="CDOCCOM" <axis:atr f="axisadm003" c="CDOCCOM" a="modificable=false&obligatorio=false"/> size="15" style="width:90%"
                                                                value="${__formdata.OB_IAX_RECIBODET.CDOCCOM}" readonly="readonly"/>
                                                            </td>
                                                        </axis:ocultar>
                                                        
                                                    </tr>
                                                    
                                                    <tr>
                                                        <axis:ocultar f="axisadm003" c="ICOMBRUI" dejarHueco="false">
                                                            <td class="titulocaja">
                                                            <b><axis:alt f="axisadm003" c="ICOMBRUI" lit="9908172"/></b>
                                                            </td>
                                                        </axis:ocultar>
                                                        
                                                        <axis:ocultar f="axisadm003" c="ICOMDEVI" dejarHueco="false">
                                                            <td class="titulocaja">
                                                            <b><axis:alt f="axisadm003" c="ICOMDEVI" lit="9908174"/></b>
                                                            </td>
                                                        </axis:ocultar>
                                                        
                                                        <axis:ocultar f="axisadm003" c="CAGENIND" dejarHueco="false">
                                                            <td class="titulocaja">
                                                            <b><axis:alt f="axisadm003" c="CAGENIND" lit="9903997"/></b>
                                                            </td>
                                                        </axis:ocultar>
                                                        
                                                    </tr>
                                                    
                                                    <tr>
                                                        <axis:visible f="axisadm003" c="ICOMBRUI">
                                                            <td class="campocaja">
                                                                <input type="text" class="campo campotexto campodisabled" id="ICOMBRUI" name="ICOMBRUI" 
                                                                <axis:atr f="axisadm003" c="ICOMBRUI" a="modificable=false&obligatorio=false"/> 
                                                                value="<fmt:formatNumber pattern='${__formatNumberPatterns[__defaultCMONINT]}' value='${__formdata.OB_IAX_RECIBODET.ICOMBRUI}'/>" readonly="readonly"/>
                                                            </td>
                                                        </axis:visible>
                                                        
                                                        <axis:visible f="axisadm003" c="ICOMDEVI">
                                                            <td class="campocaja">
                                                                <input type="text" class="campo campotexto campodisabled" id="ICOMDEVI" name="ICOMDEVI" 
                                                                <axis:atr f="axisadm003" c="ICOMDEVI" a="modificable=false&obligatorio=false"/> 
                                                                value="<fmt:formatNumber pattern='${__formatNumberPatterns[__defaultCMONINT]}' value='${__formdata.OB_IAX_RECIBODET.ICOMDEVI}'/>" readonly="readonly"/>
                                                            </td>
                                                        </axis:visible>
                                                        
                                                        <axis:visible f="axisadm003" c="CAGENIND">
                                                            <td class="campocaja">
                                                                <input type="text" class="campo campotexto campodisabled" id="CAGENIND" name="CAGENIND" 
                                                                <axis:atr f="axisadm003" c="CAGENIND" a="modificable=false&obligatorio=false"/> 
                                                                value="${__formdata.OB_IAX_RECIBODET.CAGENIND}" readonly="readonly"/>
                                                            </td>
                                                        </axis:visible>
                                                        
                                                        <axis:visible f="axisadm003" c="DSCAGENIND">
                                                            <td class="campocaja" colspan="2">
                                                                <input type="text" class="campo campotexto campodisabled" id="DSCAGENIND" name="DSCAGENIND" 
                                                                <axis:atr f="axisadm003" c="DSCAGENIND" a="modificable=false&obligatorio=false"/> 
                                                                value="${__formdata.OB_IAX_RECIBODET.DSCAGENIND}" readonly="readonly"/>
                                                            </td>
                                                        </axis:visible>
                                                    </tr>
                                                </table>                
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </axis:visible>
                        
                        <!-- *************************** SECCION HISTORICO ACCIONES ********************************* -->
                        <axis:visible f="axisadm003" c="DSP_RECIBOS_COMP">
                            <tr>
                                <td align="left">
                                    
                                    <table class="area" align="center">
                                               
                                        <tr>
                                            <th style="width:100%;height:0px"></th>
                                        </tr>
                                        
                                        <tr>
                                            <td class="campocaja">
                                                <div style="float:left;">
                                                    <img id="DSP_RECIBOS_COMP_parent" src="images/mes.gif" onclick="objEstilos.toggleDisplay('DSP_RECIBOS_COMP', this)" style="cursor:pointer"/>
                                                    <b><axis:alt f="axisadm003" c="DSP_RECIBOS_COMP_LIT" lit="9904099"/></b>
                                                </div>
                                                <div style="clear:both;">
                                                    <hr class="titulo">
                                                </div>
                                            </td>
                                        </tr>         
                                    
                                        <tr id="DSP_RECIBOS_COMP_children" style="display:none">
                                            <td class="campocaja" >
                                                <table class="area" align="center">
                                                     <tr>
                                                        <th style="width:50%;height:0px"></th>
                                                        <th style="width:50%;height:0px"></th>
                                                     </tr>

                                                    <tr>
                                                        <td class="campocaja" colspan="2" style="background-color:white;border-right-width: 0px;" >
                                                            <c:set var="title1"><axis:alt f="axisadm003" c="TACCPRE" lit="9903810"/></c:set>
                                                            <c:set var="title2"><axis:alt f="axisadm003" c="TACCRET" lit="9903811"/></c:set>
                                                            <c:set var="title3"><axis:alt f="axisadm003" c="FALTA" lit="9001192"/></c:set>
                                                            <c:set var="title4"><axis:alt f="axisadm003" c="CUSUALT" lit="100894"/></c:set>
                                                            <c:set var="title5"><axis:alt f="axisadm003" c="TOBSERV" lit="101162"/></c:set>
                                                            
                                                            <display:table name="${__formdata.OB_IAX_RECIBOCOMP}" id="RECIBOCOMP" export="false" class="dsptgtable" pagesize="-1"   sort="list" cellpadding="0" cellspacing="0"
                                                             requestURI="axis_axisadm003.do?paginar=true&subseccion=dsp_recibos_comp">
                                                            <%@ include file="../include/displaytag.jsp"%>
                                                                <display:column title="${title1}"  sortProperty="RECIBOCOMP.TACCPRE" headerClass="sortable" style="width:17%;"  media="html" autolink="false">
                                                                    <div class="dspText">${RECIBOCOMP.TACCPRE}</div>
                                                                </display:column>
                                                                <display:column title="${title2}"  sortProperty="RECIBOCOMP.TACCRET" headerClass="sortable" style="width:17%;"  media="html" autolink="false">
                                                                    <div class="dspText">${RECIBOCOMP.TACCRET}</div>
                                                                </display:column>
                                                                <display:column title="${title3}"  sortProperty="RECIBOCOMP.FALTA" headerClass="sortable" style="width:5%;"  media="html" autolink="false">
                                                                    <div class="dspText"><fmt:formatDate pattern='dd/MM/yyyy' value='${RECIBOCOMP.FALTA}' /></div>
                                                                </display:column>
                                                                <display:column title="${title4}"  sortProperty="RECIBOCOMP.CUSUALT" headerClass="sortable" style="width:5%;"  media="html" autolink="false">
                                                                    <div class="dspText">${RECIBOCOMP.CUSUALT}</div>
                                                                </display:column>
                                                                <display:column title="${title5}"  sortProperty="RECIBOCOMP.TOBSERV" headerClass="sortable" style="width:50%;"  media="html" autolink="false">
                                                                    <div class="dspText">${RECIBOCOMP.TOBSERV}</div>
                                                                </display:column>
                                                            </display:table>
                                                        </td>
                                                    </tr>
                                                </table>                
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </axis:visible>
                        
                        
                        <!-- *************************** SECCION AGRUPA RECIBOS ********************************* -->
                        <axis:visible f="axisadm003" c="DSP_ADM_RECUNIF">
                            <tr>
                                <td align="left">
                                    
                                    <table class="area" align="center">
                                               
                                        <tr>
                                            <th style="width:100%;height:0px"></th>
                                        </tr>
                                        
                                        <tr>
                                            <td class="campocaja">
                                                <div style="float:left;">
                                                    <img id="DSP_ADM_RECUNIF_parent" src="images/mes.gif" onclick="objEstilos.toggleDisplay('DSP_ADM_RECUNIF', this)" style="cursor:pointer"/>
                                                    <b><axis:alt f="axisadm003" c="DSP_ADM_RECUNIF_LIT" lit="9904025"/></b>
                                                </div>
                                                <div style="clear:both;">
                                                    <hr class="titulo">
                                                </div>
                                            </td>
                                        </tr>         
                                    
                                        <tr id="DSP_ADM_RECUNIF_children" style="display:none">
                                            <td class="campocaja" >
                                                <table class="area" align="center">
                                                     <tr>
                                                        <th style="width:50%;height:0px"></th>
                                                        <th style="width:50%;height:0px"></th>
                                                     </tr>

                                                    <tr>
                                                        <td class="campocaja" style="background-color:white;border-right-width: 0px;" >
                                                            <c:set var="title1"><axis:alt f="axisadm003" c="RECUNIFNRECUNIF" lit="9904102"/></c:set>
                                                            <c:set var="title2"><axis:alt f="axisadm003" c="RECUNIFNRECIBO" lit="800636"/></c:set>
                                                            
                                                            <display:table name="${__formdata.OB_IAX_RECUNIF}" id="RECUNIF" export="false" class="dsptgtable" pagesize="10"   sort="list" cellpadding="0" cellspacing="0"
                                                             requestURI="axis_axisadm003.do?paginar=true&subseccion=dsp_adm_recunif">
                                                            <%@ include file="../include/displaytag.jsp"%>
                                                                <display:column title="${title1}"  sortProperty="RECUNIF.NRECUNIF" headerClass="sortable" style="width:20%;"  media="html" autolink="false">
                                                                    <div class="dspNumber">${RECUNIF.NRECUNIF}</div>
                                                                </display:column>
                                                                <display:column title="${title2}"  sortProperty="RECUNIF.NRECIBO" headerClass="sortable" style="width:20%;"  media="html" autolink="false">
                                                                    <div class="dspNumber">${RECUNIF.NRECIBO}</div>
                                                                </display:column>
                                                            </display:table>
                                                        </td>
                                                    </tr>
                                                </table>                
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </axis:visible>
                        
                        
                        <!-- *************************** SECCION IMPORTES DETALLADOS ********************************* -->
                        <axis:visible f="axisadm003" c="DSP_IMP_DETALLE">
                            <tr>
                                <td align="left">
                                    
                                    <table class="area" align="center">
                                               
                                        <tr>
                                            <th style="width:100%;height:0px"></th>
                                        </tr>
                                        
                                        <tr>
                                            <td class="campocaja">
                                                <div style="float:left;">
                                                    <img id="DSP_IMP_DETALLE_parent" src="images/mes.gif" onclick="objEstilos.toggleDisplay('DSP_IMP_DETALLE', this)" style="cursor:pointer"/>
                                                    <b><axis:alt f="axisadm003" c="DSP_IMP_DETALLE_LIT" lit="1000586"/></b>
                                                </div>
                                                <div style="clear:both;">
                                                    <hr class="titulo">
                                                </div>
                                            </td>
                                        </tr>         
                                    
                                        <tr id="DSP_IMP_DETALLE_children" style="display:none">
                                            <td class="campocaja" >
                                                <table class="area" align="center">
                                                     <tr>
                                                        <th style="width:50%;height:0px"></th>
                                                        <th style="width:50%;height:0px"></th>
                                                     </tr>

                                                    <tr>
                                                        <td class="campocaja" colspan="2" style="background-color:white;border-right-width: 0px;" >
                                                            <c:set var="title1"><axis:alt f="axisadm003" c="CGARANT" lit="800440"/></c:set>
                                                            <c:set var="title2"><axis:alt f="axisadm003" c="TGARANT" lit="100561"/></c:set>
                                                            <c:set var="title3"><axis:alt f="axisadm003" c="NRIESGO" lit="800440"/></c:set>
                                                            <c:set var="title4"><axis:alt f="axisadm003" c="TRIESGO" lit="100649"/></c:set>
                                                            <c:set var="title5"><axis:alt f="axisadm003" c="IPRINET" lit="102995"/></c:set>
                                                            <c:set var="title6"><axis:alt f="axisadm003" c="IPRIDEV" lit="9904028"/></c:set>
                                                            <c:set var="title7"><axis:alt f="axisadm003" c="IDESC" lit="9903807"/></c:set>
                                                            <c:set var="title8"><axis:alt f="axisadm003" c="IT1REC" lit="105171"/></c:set>
                                                            <c:set var="title9"><axis:alt f="axisadm003" c="ICONSOR" lit="100916"/></c:set>
                                                            <c:set var="title10"><axis:alt f="axisadm003" c="IIPS" lit="1000253"/></c:set>
                                                            <c:set var="title11"><axis:alt f="axisadm003" c="IDGS" lit="9903065"/></c:set>
                                                            <c:set var="title12"><axis:alt f="axisadm003" c="IARBITR" lit="101705"/></c:set>
                                                            <c:set var="title13"><axis:alt f="axisadm003" c="IFNG" lit="110031"/></c:set>
                                                            <c:set var="title14"><axis:alt f="axisadm003" c="PORC_COMIS" lit="9001923"/></c:set>
                                                            <c:set var="title15"><axis:alt f="axisadm003" c="ICOMBRU" lit="103170"/></c:set>
                                                            <c:set var="title16"><axis:alt f="axisadm003" c="ICOMDEV" lit="9902472"/></c:set>
                                                            <c:set var="title17"><axis:alt f="axisadm003" c="ICOMRET" lit="112579"/></c:set>
                                                            <c:set var="title18"><axis:alt f="axisadm003" c="ICOMLIQ" lit="9904019"/></c:set>
                                                            <c:set var="title19"><axis:alt f="axisadm003" c="IBONUS_MALUS" lit="9001799"/></c:set>
                                                            <c:set var="title20"><axis:alt f="axisadm003" c="IRECFRAC" lit="1000341"/></c:set>
                                                            <c:set var="title21"><axis:alt f="axisadm003" c="ILIQUIDO" lit="9904375"/></c:set>
                                                            
                                                            <script language="Javascript">
                                                                document.write('<div class="seccion displayspaceMaximo" style="overflow-x:auto;width:'+objUtiles.miInnerWidth()*0.85+'px;height:'+${31+(fn:length(__formdata.OB_IAX_RECIBOGTIAS)*19)}+'px;min-height:50px;max-height:350px">');
                                                            </script>
                                                            <%--div class="seccion displayspace"--%>

                                                            <display:table name="${__formdata.OB_IAX_RECIBOGTIAS}" id="RECIBOGTIAS" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0" 
                                                             requestURI="axis_axisadm003.do?paginar=true&subseccion=dsp_imp_detalle" style="width:200%">
                                                            <%@ include file="../include/displaytag.jsp"%>
                                                                <display:column title="${title1}"  sortProperty="RECIBOGTIAS.CGARANT" headerClass="sortable"   media="html" autolink="false">
                                                                    <div class="dspText">${RECIBOGTIAS.CGARANT}</div>
                                                                </display:column>
                                                                <display:column title="${title2}"  sortProperty="RECIBOGTIAS.TGARANT" headerClass="sortable"   media="html" autolink="false">
                                                                    <div class="dspText">${RECIBOGTIAS.TGARANT}</div>
                                                                </display:column>
                                                                <display:column title="${title3}"  sortProperty="RECIBOGTIAS.NRIESGO" headerClass="sortable "  media="html" autolink="false">
                                                                    <div class="dspText">${RECIBOGTIAS.NRIESGO}</div>
                                                                </display:column>
                                                                <display:column title="${title4}"  sortProperty="RECIBOGTIAS.TRIESGO" headerClass="sortable "   media="html" autolink="false">
                                                                    <div class="dspText">${RECIBOGTIAS.TRIESGO}</div>
                                                                </display:column>
                                                                <display:column title="${title5}"  sortProperty="RECIBOGTIAS.IPRINET" headerClass="sortable "   media="html" autolink="false">
                                                                    <div class="dspText"><fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${RECIBOGTIAS.IPRINET}"/></div>
                                                                </display:column>
                                                                <display:column title="${title6}"  sortProperty="RECIBOGTIAS.IPRIDEV" headerClass="sortable "   media="html" autolink="false">
                                                                    <div class="dspText"><fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${RECIBOGTIAS.IPRIDEV}"/></div>
                                                                </display:column>
                                                                <display:column title="${title7}"  sortProperty="RECIBOGTIAS.IDESC" headerClass="sortable "   media="html" autolink="false">
                                                                    <div class="dspText"><fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${RECIBOGTIAS.IDTOTEC + RECIBOGTIAS.IDTOCOM + RECIBOGTIAS.IDTOTOM}"/></div>
                                                                </display:column>
                                                                <display:column title="${title8}"  sortProperty="RECIBOGTIAS.IT1REC" headerClass="sortable "   media="html" autolink="false">
                                                                    <div class="dspText"><fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${RECIBOGTIAS.IT1REC}"/></div>
                                                                </display:column>
                                                                <display:column title="${title9}"  sortProperty="RECIBOGTIAS.ICONSOR" headerClass="sortable "   media="html" autolink="false">
                                                                    <div class="dspText"><fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${RECIBOGTIAS.ICONSOR}"/></div>
                                                                </display:column>
                                                                <display:column title="${title10}"  sortProperty="RECIBOGTIAS.IIPS" headerClass="sortable "   media="html" autolink="false">
                                                                    <div class="dspText"><fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${RECIBOGTIAS.IIPS}"/></div>
                                                                </display:column>
                                                                <display:column title="${title11}"  sortProperty="RECIBOGTIAS.IDGS" headerClass="sortable "   media="html" autolink="false">
                                                                    <div class="dspText"><fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${RECIBOGTIAS.IDGS}"/></div>
                                                                </display:column>
                                                                <display:column title="${title12}"  sortProperty="RECIBOGTIAS.IARBITR" headerClass="sortable "   media="html" autolink="false">
                                                                    <div class="dspText"><fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${RECIBOGTIAS.IARBITR}"/></div>
                                                                </display:column>
                                                                <display:column title="${title13}"  sortProperty="RECIBOGTIAS.IFNG" headerClass="sortable "   media="html" autolink="false">
                                                                    <div class="dspText"><fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${RECIBOGTIAS.IFNG}"/></div>
                                                                </display:column>
                                                                <display:column title="${title14}"  sortProperty="RECIBOGTIAS.PORC_COMIS" headerClass="sortable "   media="html" autolink="false">
                                                                    <div class="dspText"><fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${RECIBOGTIAS.PORC_COMIS}"/></div>
                                                                </display:column>
                                                                <display:column title="${title15}"  sortProperty="RECIBOGTIAS.ICOMBRU" headerClass="sortable "   media="html" autolink="false">
                                                                    <div class="dspText"><fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${RECIBOGTIAS.ICOMBRU}"/></div>
                                                                </display:column>
                                                                <display:column title="${title16}"  sortProperty="RECIBOGTIAS.ICOMDEV" headerClass="sortable "   media="html" autolink="false">
                                                                    <div class="dspText"><fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${RECIBOGTIAS.ICOMDEV}"/></div>
                                                                </display:column>
                                                                <display:column title="${title17}"  sortProperty="RECIBOGTIAS.ICOMRET" headerClass="sortable "   media="html" autolink="false">
                                                                    <div class="dspText"><fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${RECIBOGTIAS.ICOMRET}"/></div>
                                                                </display:column>
                                                                <display:column title="${title18}"  sortProperty="RECIBOGTIAS.ICOMLIQ" headerClass="sortable "  media="html" autolink="false">
                                                                    <div class="dspText"><fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${RECIBOGTIAS.ICOMLIQ}"/></div>
                                                                </display:column>
                                                                <axis:visible c="IBONUS_MALUS" f="axisadm003">
                                                                    <display:column title="${title19}"  sortProperty="RECIBOGTIAS.IBONUS_MALUS" headerClass="sortable "   media="html" autolink="false">
                                                                        <div class="dspText"><fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${RECIBOGTIAS.IBONUS_MALUS}"/></div>
                                                                    </display:column>
                                                                </axis:visible>
                                                                <display:column title="${title20}"  sortProperty="RECIBOGTIAS.IRECFRAC" headerClass="sortable "   media="html" autolink="false">
                                                                    <div class="dspText"><fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${RECIBOGTIAS.IRECFRAC}"/></div>
                                                                </display:column>
                                                                <display:column title="${title21}"  sortProperty="RECIBOGTIAS.ILIQUIDO" headerClass="sortable "   media="html" autolink="false">
                                                                    <div class="dspText"><fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${RECIBOGTIAS.ILIQUIDO}"/></div>
                                                                </display:column>
                                                            </display:table>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                </table>                
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </axis:visible>
<!-- SIGUIENTE SECCION -->