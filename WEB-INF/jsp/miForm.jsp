<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=windows-1252"%>
<%@ include file="/scripts/cargarBundle.jsp"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
        <title>Demo validación fechas y números CSI</title>
        <script type="text/javascript" src="js/jsValidador.js"></script>
        <script type="text/javascript" src="js/jsAlert.js"></script>
        <script type="text/javascript" src="js/jsUtiles.js"></script>
        <script type="text/javascript" src="js/jsFecha.js"></script>
        <script type="text/javascript" src="js/jsNumero.js"></script>
        <script type="text/javascript" src="js/jsDom.js"></script>
        <script type="text/javascript" src="js/jsAjax.js"></script>
        <script type="text/javascript" src="js/jsEstilos.js"></script>
        <link rel="StyleSheet" href="css/corners.css" type="text/css">
        <script type="text/javascript">
                //Tenemos que definir siempre esta variable como global y con este nombre (objAlert)
                var objAlert = new JsAlert();
                var objValidador = new JsValidador();
                //Objeto para printear las validaciones segun locale (partiendo de jsMesssages.properties)
                var objJsMessages = new JsMessages();
        </script>
    </head>
    <body>
    <form name="form1" method="post" target="_self">
    <h1>Demo validación fechas y números CSI</h1>	
    <div style="width:550px;">
            <b class="corners">
            <b class="corners1"><b></b></b>
            <b class="corners2"><b></b></b>
            <b class="corners3"></b>
            <b class="corners4"></b>
            <b class="corners5"></b></b>
            <div class="cornersfg" id="mainDate" style="height:150px;background-color:#0066CC;padding:10px 10px 10px 10px;">
                <div id="title" style="width:90%;">
                        <span style="color:white;font-family:Verdana;font-size:10px;">Entre una fecha válida en formato "ddmmyy" o "ddmmyyyy". Puedes usar "/", "-" , "." o nada para separar los valores. <BR>La fecha tiene que ser real. Por ej: 30/2/2000 no será aceptado.</span>	
                </div>
                <div id="divInputDate" style="float:left;margin-top:20px;">
                        <input formato="fecha" type="text" size="20" id="normalDate_date" name="normalDate_date">
                </div>
                <div id="divInputDateMsg" style="float:left;margin-left:25px;margin-top:20px;">
                        <span id="inputDateMsg" style="font-family:verdana;font-size:10px;color:white;">&nbsp;</span>
                </div>
                <div style="clear:both;">&nbsp;</div>
            </div>
            <b class="corners">
            <b class="corners5"></b>
            <b class="corners4"></b>
            <b class="corners3"></b>
            <b class="corners2"><b></b></b>
            <b class="corners1"><b></b></b></b>
    </div>
            
    <div style="margin-top:30px;width:550px;">
            <b class="corners">
            <b class="corners1"><b></b></b>
            <b class="corners2"><b></b></b>
            <b class="corners3"></b>
            <b class="corners4"></b>
            <b class="corners5"></b></b>	
            <div class="cornersfg"  id="mainIntNumber" style="height:100px;background-color:#0066CC;padding:10px 10px 10px 10px;">
                <div id="title" style="width:90%;">
                        <span style="color:white;font-family:Verdana;font-size:10px;">Validación números enteros. </span>	
                </div>
                <div id="divInputIntNumber" style="float:left;margin-top:20px;">
                        <input formato="entero" type="text" size="20" id="numeroEnter_number" name="numeroEnter_number">
                </div>
                <div id="divInputIntNumberMsg" style="float:left;margin-left:25px;margin-top:20px;">
                        <span id="inputIntNumberMsg" style="font-family:verdana;font-size:10px;color:white;">&nbsp;</span>
                </div>
                <div style="clear:both;">&nbsp;</div>
            </div>
            <b class="corners">
            <b class="corners5"></b>
            <b class="corners4"></b>
            <b class="corners3"></b>
            <b class="corners2"><b></b></b>
            <b class="corners1"><b></b></b></b>
    </div>
    
    <div style="margin-top:30px;width:550px;">
            <b class="corners">
            <b class="corners1"><b></b></b>
            <b class="corners2"><b></b></b>
            <b class="corners3"></b>
            <b class="corners4"></b>
            <b class="corners5"></b></b>
            <div class="cornersfg" id="mainDecNumber" style="height:100px;background-color:#0066CC;padding:10px 10px 10px 10px;">
                <div id="title" style="width:90%;">
                        <span style="color:white;font-family:Verdana;font-size:10px;">Validación números decimales. </span>	
                </div>
                <div id="divInputDecNumber" style="float:left;margin-top:20px;">
                        <input title="Numeros decimales" formato="decimal" type="text" size="20" id="inputDecNumber" name="numeroDecimal_number">
                </div>
                <div id="divInputDecNumberMsg" style="float:left;margin-left:25px;margin-top:20px;">
                        <span id="inputDecNumberMsg" style="font-family:verdana;font-size:10px;color:white;">&nbsp;</span>
                </div>
                <div style="clear:both;">&nbsp;</div>
            </div>
            <b class="corners">
            <b class="corners5"></b>
            <b class="corners4"></b>
            <b class="corners3"></b>
            <b class="corners2"><b></b></b>
            <b class="corners1"><b></b></b></b>
    </div>
    <div id="divDecButton" style="margin-left:25px;margin-top:30px;">
            <input type="button" value="Valida" 
            onclick="objValidador.validaEntrada('input');">
    </div>
    
            
    </form>
    <script type="text/javascript">
           // var objValidador = new JsValidador();
    
            /**
             * @deprecated
             * Funció que executa un mètode en funció d'un event (ampliable a una classe d'events)
             * 
             * @param {Object} event
             * @param {Object} inputTag
             * @param {Object} divId
             * @param {Object} formatType
             */
            function apretarEnter(event, inputTag, divId, formatType) {
                    if(event && event.keyCode==13)
                            objValidador.validaEntrada(inputTag, divId, formatType);
                    else
                    return true;
            }
    </script>
    </body>

</html>