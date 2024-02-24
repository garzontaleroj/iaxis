package axis.util.testLiterales;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.DriverManager;
import java.util.ArrayList;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.AccesoSQL;


public class LiteralesToAxisLiterales {
    
    
    public LiteralesToAxisLiterales() {
    }
    
    public static void main (String [] var_args) throws Exception{
        Log logger = LogFactory.getLog(LiteralesToAxisLiterales.class);
        Connection conn = null;
                
        try{
            Class c = Class.forName ("oracle.jdbc.driver.OracleDriver");
            logger.debug("Cargado puente java-jdbcOracle " + c);
            
            logger.debug("A conectarse " + c);
            conn = DriverManager.getConnection ("jdbc:oracle:thin:@192.168.10.15:1521:DELTA", "icre_t", "i");
            
            AccesoSQL sqlStmnt = new AccesoSQL (conn);
            
            /*
            Valores para CLITERA
            1 T�tulo de programa
            2 R�tulo (literal en pantalla)
            3 Ayuda campos
            4 Mensaje informativo
            5 Mensaje de aviso
            6 Mensaje de error
            7 Etiqueta bot�n
            8 Nombre de tabla
            9 Elemento Fijo
            10 Mensaje de acci�n
            11 Ayudas mouse en botones
            12 Elemento de men�
            14 Lit. Empresa n� 900.0ee
            */
             
             

            BufferedReader fr = new BufferedReader (new FileReader(new File("C:\\littmp.txt")));
            String linia;
                    
            while((linia = fr.readLine()) != null)                         // While it's not the end of the file
            {
                try {
                    String selectStm1 = "SELECT * FROM CODLITERALES WHERE SLITERA=" + linia  + "";
                    String selectStm2 = "SELECT * FROM LITERALES WHERE SLITERA=" + linia  + " AND CIDIOMA=1";    
                    String selectStm3 = "SELECT * FROM LITERALES WHERE SLITERA=" + linia  + " AND CIDIOMA=2";    
                    
                    ArrayList CODLITERALES_LIST = sqlStmnt.executeQuery(conn, selectStm1);
                    ArrayList LITERALES_LIST_CA  = sqlStmnt.executeQuery(conn, selectStm2);
                    ArrayList LITERALES_LIST_ES  = sqlStmnt.executeQuery(conn, selectStm3);
                    
                    logger.debug("CODLITERALES_LIST" + CODLITERALES_LIST);
                    logger.debug("LITERALES_LIST_CA" + LITERALES_LIST_CA);
                    logger.debug("LITERALES_LIST_ES" + LITERALES_LIST_ES);
                    
                    if (CODLITERALES_LIST != null && !CODLITERALES_LIST.isEmpty()) {
                        Map CODLITERALES = (Map) CODLITERALES_LIST.get(0);
                        BigDecimal SLITERA = (BigDecimal) CODLITERALES.get("SLITERA");
                        BigDecimal CLITERA = (BigDecimal) CODLITERALES.get("CLITERA");
                        
                        String insertStm1 = "INSERT INTO AXIS_CODLITERALES (SLITERA, CLITERA) VALUES " +
                        "(" + SLITERA + ", " + CLITERA + ")";                    
                        sqlStmnt.execute(conn, insertStm1);
                        logger.debug("CODLITERALES: Literal " + linia + " ejecutado bien");                        
                        
                        if (LITERALES_LIST_CA != null && !LITERALES_LIST_CA.isEmpty()) {
                            Map LITERALES_CA = (Map) LITERALES_LIST_CA.get(0);
                            BigDecimal CIDIOMA = (BigDecimal) LITERALES_CA.get("CIDIOMA");
                            SLITERA = (BigDecimal) LITERALES_CA.get("SLITERA");
                            String TLITERA = (String) LITERALES_CA.get("TLITERA");                        
                            
                            String insertStm2 = "INSERT INTO AXIS_LITERALES (CIDIOMA, SLITERA, TLITERA) VALUES " +
                            "(" + CIDIOMA +", " + SLITERA + ", '" + TLITERA + "')";     
                            
                            sqlStmnt.execute(conn, insertStm2);                        
                            logger.debug("LITERALES_CA: Literal " + linia + " ejecutado bien");
                        }
    
                        if (LITERALES_LIST_ES != null && !LITERALES_LIST_ES.isEmpty()) {
                            Map LITERALES_ES = (Map) LITERALES_LIST_ES.get(0);
                            BigDecimal CIDIOMA = (BigDecimal) LITERALES_ES.get("CIDIOMA");
                            SLITERA = (BigDecimal) LITERALES_ES.get("SLITERA");
                            String TLITERA = (String) LITERALES_ES.get("TLITERA");                        
                            
                            String insertStm2 = "INSERT INTO AXIS_LITERALES (CIDIOMA, SLITERA, TLITERA) VALUES " +
                            "(" + CIDIOMA +", " + SLITERA + ", '" + TLITERA + "')";     
                            
                            sqlStmnt.execute(conn, insertStm2);                        
                            logger.debug("LITERALES_ES: Literal " + linia + " ejecutado bien");
                        }                                        
                        
                    } else {                        
                        System.err.println("CODLITERALES: Literal " + linia + " no encontrado!!!");
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                    continue;
                }
                
            }
            
            fr.close();        
            
        } catch (Exception e){
            e.printStackTrace();
        } finally {
            if (conn != null)
                conn.close();
        }
    }
}
