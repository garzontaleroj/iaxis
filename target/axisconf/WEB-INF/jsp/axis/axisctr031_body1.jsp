<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=windows-1252"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>

<table  cellpadding="0" cellspacing="5" class="area">      
    <tr><td>
        &nbsp;<input type="hidden" value="${PCMODEXTRA}" id="PCMODEXTRA" name="PCMODEXTRA">
    </td>
    <td class="titulocaja">
        &nbsp;&nbsp;<u><b><axis:alt f="axisctr031" c="MPEXTRA" lit="9000670"/></b></u>
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
            <!-- bug 24735.NMM.#6.i.02/2013 Afegir camps imports pagues extra -->
            <tr class="gridNotEven">
            <td>
              <table>
                <tr>
		  <th style="width:50%;height:0%;"/>   
		  <th style="width:20%;height:0%;"/>
                  <th style="width:20%;height:0%;"/>
                </tr>
		<tr>
		  <td> <axis:alt f="axisctr031" c="CPAGA1" lit="9000674"/> </td>
                 <axis:ocultar c="IMP_CPAGA1" f="axisctr031" dejarHueco="false">
                  <td> <!-- Import paga renda mes gener -->
                       <input type="text" class="campowidthinput campo campotexto" id="IMP_CPAGA1" name="IMP_CPAGA1" size="7"
                       value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONPRODINT]}' value='${NMESEXTRA.IMP_NMES1}'/>" />
                  </td>
                  </axis:ocultar>
                  <axis:ocultar c="CHECK_CPAGA1" f="axisctr031" dejarHueco="false">
                  <td> <input type="checkbox" name="CPAGA1" id="CPAGA1" value = "${NMESEXTRA.NMES1}" onclick="f_onclickCheckbox(this);" 
                       <c:if test="${NMESEXTRA.NMES1 == 1}"> checked</c:if>
                       <c:if test="${PCMODEXTRA == 0}"> disabled</c:if> >
                  </td>
                  </axis:ocultar>
                </tr>
              </table>
            </td>
                
            <td>
              <table>
                <tr>
		  <th style="width:50%;height:0%;"/>   
		  <th style="width:20%;height:0%;"/>
                  <th style="width:20%;height:0%;"/>
                </tr>
		<tr>
		  <td> <axis:alt f="axisctr031" c="CPAGA4" lit="9000677"/> </td>
                  <axis:ocultar c="IMP_CPAGA4" f="axisctr031" dejarHueco="false">
                  <td> <!-- Import paga renda mes abril -->
                       <input type="text" class="campowidthinput campo campotexto" id="IMP_CPAGA4" name="IMP_CPAGA4" size="7"
                       value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONPRODINT]}' value='${NMESEXTRA.IMP_NMES4}'/>" />
                  </td>
                  </axis:ocultar>
                  <axis:ocultar c="CHECK_CPAGA4" f="axisctr031" dejarHueco="false">
                  <td> <input type="checkbox" name="CPAGA4" id="CPAGA4" value = "${NMESEXTRA.NMES4}" onclick="f_onclickCheckbox(this);"
                       <c:if test="${NMESEXTRA.NMES4 == 1}"> checked</c:if>
                       <c:if test="${PCMODEXTRA == 0}"> disabled</c:if> >
                  </td>
                  </axis:ocultar>
                </tr>
              </table>
            </td>

            <td>
              <table>
                <tr>
		  <th style="width:50%;height:0%;"/>   
		  <th style="width:20%;height:0%;"/>
                  <th style="width:20%;height:0%;"/>
                </tr>
		<tr>
		  <td> <axis:alt f="axisctr031" c="CPAGA7" lit="9000680"/> </td>
                  <axis:ocultar c="IMP_CPAGA7" f="axisctr031" dejarHueco="false">
		  <td> <!-- Import paga renda mes juliol -->
                       <input type="text" class="campowidthinput campo campotexto" id="IMP_CPAGA7" name="IMP_CPAGA7" size="7"
                       value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONPRODINT]}' value='${NMESEXTRA.IMP_NMES7}'/>" />
		  </td>
                  </axis:ocultar>
                  <axis:ocultar c="CHECK_CPAGA7" f="axisctr031" dejarHueco="false">
                  <td> <input type="checkbox" name="CPAGA7" id="CPAGA7" value = "${NMESEXTRA.NMES7}" onclick="f_onclickCheckbox(this);"
                       <c:if test="${NMESEXTRA.NMES7 == 1}"> checked</c:if>
                       <c:if test="${PCMODEXTRA == 0}"> disabled</c:if> > 
                  </td>
                  </axis:ocultar>
                </tr>
              </table>
            </td>
            
            <td>
              <table>
                <tr>
		  <th style="width:50%;height:0%;"/>   
		  <th style="width:20%;height:0%;"/>
                  <th style="width:20%;height:0%;"/>
                </tr>
		<tr>
		  <td> <axis:alt f="axisctr031" c="CPAGA10" lit="9000683"/> </td>
                  <axis:ocultar c="IMP_CPAGA10" f="axisctr031" dejarHueco="false">
                  <td> <!-- Import paga renda mes octubre -->
                       <input type="text" class="campowidthinput campo campotexto" id="IMP_CPAGA10" name="IMP_CPAGA10" size="7"
                       value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONPRODINT]}' value='${NMESEXTRA.IMP_NMES10}'/>" />
                  </td>
                  </axis:ocultar>
                  <axis:ocultar c="CHECK_CPAGA10" f="axisctr031" dejarHueco="false">
                  <td> <input type="checkbox" name="CPAGA10" id="CPAGA10" value = "${NMESEXTRA.NMES10}" onclick="f_onclickCheckbox(this);"
                       <c:if test="${NMESEXTRA.NMES10 == 1}"> checked</c:if>
                       <c:if test="${PCMODEXTRA == 0}"> disabled</c:if> > 
                  </td>
                  </axis:ocultar>
                </tr>
              </table>
            </td>
            </tr>

            <tr class="gridEven">
            <td>
              <table>
                <tr>
		  <th style="width:50%;height:0%;"/>   
		  <th style="width:20%;height:0%;"/>
                  <th style="width:20%;height:0%;"/>
                </tr>
		<tr>
		  <td> <axis:alt f="axisctr031" c="CPAGA2" lit="9000675"/> </td>
                  <axis:ocultar c="IMP_CPAGA2" f="axisctr031" dejarHueco="false">
                  <td> <!-- Import paga renda mes febrer -->
                       <input type="text" class="campowidthinput campo campotexto" id="IMP_CPAGA2" name="IMP_CPAGA2" size="7"
                       value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONPRODINT]}' value='${NMESEXTRA.IMP_NMES2}'/>" />
                  </td> 
                  </axis:ocultar>
                  <axis:ocultar c="CHECK_CPAGA2" f="axisctr031" dejarHueco="false">
                  <td> <input type="checkbox" name="CPAGA2" id="CPAGA2" value = "${NMESEXTRA.NMES2}" onclick="f_onclickCheckbox(this);"
                       <c:if test="${NMESEXTRA.NMES2 == 1}"> checked</c:if>
                       <c:if test="${PCMODEXTRA == 0}"> disabled</c:if> > 
                  </td>
                  </axis:ocultar>
                </tr>
              </table>
            </td>

            <td>
              <table>
                <tr>
		  <th style="width:50%;height:0%;"/>   
		  <th style="width:20%;height:0%;"/>
                  <th style="width:20%;height:0%;"/>
                </tr>
		<tr>
		  <td> <axis:alt f="axisctr031" c="CPAGA5" lit="9000678"/> </td>
                  <axis:ocultar c="IMP_CPAGA5" f="axisctr031" dejarHueco="false">
		  <td> <!-- Import paga renda mes maig -->
                       <input type="text" class="campowidthinput campo campotexto" id="IMP_CPAGA5" name="IMP_CPAGA5" size="7"
                       value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONPRODINT]}' value='${NMESEXTRA.IMP_NMES5}'/>" />
                  </td>
                  </axis:ocultar>
                  <axis:ocultar c="CHECK_CPAGA5" f="axisctr031" dejarHueco="false">
		  <td> <input type="checkbox" name="CPAGA5" id="CPAGA5" value = "${NMESEXTRA.NMES5}" onclick="f_onclickCheckbox(this);"
                       <c:if test="${NMESEXTRA.NMES5 == 1}"> checked</c:if>
                       <c:if test="${PCMODEXTRA == 0}"> disabled</c:if> > 
                  </td>
                  </axis:ocultar>
                </tr>
              </table>
            </td>

            <td>
              <table>
                <tr>
		  <th style="width:50%;height:0%;"/>   
		  <th style="width:20%;height:0%;"/>
                  <th style="width:20%;height:0%;"/>
                </tr>
		<tr>
		  <td> <axis:alt f="axisctr031" c="CPAGA8" lit="9000681"/> </td>
                  <axis:ocultar c="IMP_CPAGA8" f="axisctr031" dejarHueco="false">
		  <td> <!-- Import paga renda mes agost -->
                       <input type="text" class="campowidthinput campo campotexto" id="IMP_CPAGA8" name="IMP_CPAGA8" size="7"
                       value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONPRODINT]}' value='${NMESEXTRA.IMP_NMES8}'/>" />
                  </td>
                  </axis:ocultar>
                  <axis:ocultar c="CHECK_CPAGA8" f="axisctr031" dejarHueco="false">
		  <td> <input type="checkbox" name="CPAGA8" id="CPAGA8" value = "${NMESEXTRA.NMES8}" onclick="f_onclickCheckbox(this);"
                       <c:if test="${NMESEXTRA.NMES8 == 1}"> checked</c:if>
                       <c:if test="${PCMODEXTRA == 0}"> disabled</c:if> > 
                  </td>
                  </axis:ocultar>
                </tr>
              </table>
            </td>
            <td>
              <table>
                <tr>
		  <th style="width:50%;height:0%;"/>   
		  <th style="width:20%;height:0%;"/>
                  <th style="width:20%;height:0%;"/>
                </tr>
		<tr>
		  <td> <axis:alt f="axisctr031" c="CPAGA11" lit="9000684"/> </td>
                  <axis:ocultar c="IMP_CPAGA11" f="axisctr031" dejarHueco="false">
		  <td> <!-- Import paga renda mes novembre -->
                       <input type="text" class="campowidthinput campo campotexto" id="IMP_CPAGA11" name="IMP_CPAGA11" size="7"
                       value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONPRODINT]}' value='${NMESEXTRA.IMP_NMES11}'/>" />
                  </td>
                  </axis:ocultar>
                  <axis:ocultar c="CHECK_CPAGA11" f="axisctr031" dejarHueco="false">
		  <td> <input type="checkbox" name="CPAGA11" id="CPAGA11" value = "${NMESEXTRA.NMES11}" onclick="f_onclickCheckbox(this);"
                       <c:if test="${NMESEXTRA.NMES11 == 1}"> checked</c:if>
                       <c:if test="${PCMODEXTRA == 0}"> disabled</c:if> > 
                  </td>
                  </axis:ocultar>
                </tr>
              </table>
            </td>
            </tr>

            <tr class="gridNotEven">
            <td>
              <table>
                <tr>
		  <th style="width:50%;height:0%;"/>   
		  <th style="width:20%;height:0%;"/>
                  <th style="width:20%;height:0%;"/>
                </tr>
		<tr>
		  <td> <axis:alt f="axisctr031" c="CPAGA3" lit="9000676"/> </td>
                  <axis:ocultar c="IMP_CPAGA3" f="axisctr031" dejarHueco="false">
		  <td> <!-- Import paga renda mes març -->
                       <input type="text" class="campowidthinput campo campotexto" id="IMP_CPAGA3" name="IMP_CPAGA3" size="7"
                       value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONPRODINT]}' value='${NMESEXTRA.IMP_NMES3}'/>" />
                  </td>
                  </axis:ocultar>
                  <axis:ocultar c="CHECK_CPAGA3" f="axisctr031" dejarHueco="false">
                  <td> <input type="checkbox" name="CPAGA3" id="CPAGA3" value = "${NMESEXTRA.NMES3}" onclick="f_onclickCheckbox(this);"
                       <c:if test="${NMESEXTRA.NMES3 == 1}"> checked</c:if>
                       <c:if test="${PCMODEXTRA == 0}"> disabled</c:if> > 
                  </td>
                  </axis:ocultar>
                </tr>
              </table>
            </td>
                
            <td>
              <table>
                <tr>
		  <th style="width:50%;height:0%;"/>   
		  <th style="width:20%;height:0%;"/>
                  <th style="width:20%;height:0%;"/>
                </tr>
		<tr>
              
		  <td> <axis:alt f="axisctr031" c="CPAGA6" lit="9000679"/> </td>
                  <axis:ocultar c="IMP_CPAGA6" f="axisctr031" dejarHueco="false">
		  <td> <!-- Import paga renda mes juny -->
                       <input type="text" class="campowidthinput campo campotexto" id="IMP_CPAGA6" name="IMP_CPAGA6" size="7"
                       value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONPRODINT]}' value='${NMESEXTRA.IMP_NMES6}'/>" />
                  </td>
                  </axis:ocultar>
                  <axis:ocultar c="CHECK_CPAGA6" f="axisctr031" dejarHueco="false">
		  <td> <input type="checkbox" name="CPAGA6" id="CPAGA6" value = "${NMESEXTRA.NMES6}" onclick="f_onclickCheckbox(this);"
                       <c:if test="${NMESEXTRA.NMES6 == 1}"> checked</c:if>
                       <c:if test="${PCMODEXTRA == 0}"> disabled</c:if> > 
                  </td>
                  </axis:ocultar>
                </tr>
              </table>
            </td>

             <td>
              <table>
                <tr>
		  <th style="width:50%;height:0%;"/>   
		  <th style="width:20%;height:0%;"/>
                  <th style="width:20%;height:0%;"/>
                </tr>
		<tr>
		  <td> <axis:alt f="axisctr031" c="CPAGA9" lit="9000682"/> </td>
                  <axis:ocultar c="IMP_CPAGA9" f="axisctr031" dejarHueco="false">
		  <td> <!-- Import paga renda mes setembre -->
                       <input type="text" class="campowidthinput campo campotexto" id="IMP_CPAGA9" name="IMP_CPAGA9" size="7"
                       value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONPRODINT]}' value='${NMESEXTRA.IMP_NMES9}'/>" />
                  </td>
                  </axis:ocultar>
                  <axis:ocultar c="CHECK_CPAGA9" f="axisctr031" dejarHueco="false">
		  <td> <input type="checkbox" name="CPAGA9" id="CPAGA9" value = "${NMESEXTRA.NMES9}" onclick="f_onclickCheckbox(this);"
                       <c:if test="${NMESEXTRA.NMES9 == 1}"> checked</c:if>
                       <c:if test="${PCMODEXTRA == 0}"> disabled</c:if> > 
                  </td>
                  </axis:ocultar>
                </tr>
              </table>
            </td>

            <td>
              <table>
                <tr>
		  <th style="width:50%;height:0%;"/>   
		  <th style="width:20%;height:0%;"/>
                  <th style="width:20%;height:0%;"/>
                </tr>
		<tr>
		  <td> <axis:alt f="axisctr031" c="CPAGA12" lit="9000685"/> </td>
                  <axis:ocultar c="IMP_CPAGA12" f="axisctr031" dejarHueco="false">
		  <td> <!-- Import paga renda mes desembre -->
                       <input type="text" class="campowidthinput campo campotexto" id="IMP_CPAGA12" name="IMP_CPAGA12" size="7"
                       value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONPRODINT]}' value='${NMESEXTRA.IMP_NMES12}'/>" />
                  </td>
                  </axis:ocultar>
                  <axis:ocultar c="CHECK_CPAGA12" f="axisctr031" dejarHueco="false">
		  <td> <input type="checkbox" name="CPAGA12" id="CPAGA12" value = "${NMESEXTRA.NMES12}" onclick="f_onclickCheckbox(this);"
                       <c:if test="${NMESEXTRA.NMES12 == 1}"> checked</c:if>
                       <c:if test="${PCMODEXTRA == 0}"> disabled</c:if> > 
                  </td>
                  </axis:ocultar>
                </tr>
              </table>
            </td>
              <!-- bug 24735.#6.f.02/2013  -->
            </tr>
        </table>   
    </td>
</table>