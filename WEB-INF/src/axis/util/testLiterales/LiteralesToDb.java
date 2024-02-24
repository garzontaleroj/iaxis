package axis.util.testLiterales;

import java.sql.Connection;
import java.sql.DriverManager;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.AccesoSQL;

public class LiteralesToDb {
    
    
    public LiteralesToDb() {
    }
    
    public static void main (String [] var_args) throws Exception{
        Log logger = LogFactory.getLog(LiteralesToDb.class);
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

            int SLITERA = 1000358;
            int CLITERA = 6;
            String msg_ca = "Codi de poblaci� incorrecte."; 
            String msg_es = "C�digo de poblaci�n incorrecto."; 
            String msg_en = "C�digo de poblaci�n incorrecto."; 
            String msg_fr = "C�digo de poblaci�n incorrecto."; 
            
            String insertStm1 = "INSERT INTO AXIS_CODLITERALES (SLITERA, CLITERA) VALUES " +
            "(" + SLITERA + ", " + CLITERA + ")";
            
            String updateStm1 = "UPDATE AXIS_CODLITERALES SET SLITERA=" + SLITERA + ", CLITERA=" + CLITERA + " WHERE SLITERA=" + SLITERA;
            String updateStm2 = "UPDATE AXIS_LITERALES SET CIDIOMA=1, SLITERA=" + SLITERA + ", TLITERA='" + msg_ca + "' WHERE CIDIOMA=1 AND SLITERA="  + SLITERA;
            String updateStm3 = "UPDATE AXIS_LITERALES SET CIDIOMA=2, SLITERA=" + SLITERA + ", TLITERA='" + msg_es + "' WHERE CIDIOMA=2 AND SLITERA="  + SLITERA;
                        
            String selectStm1 = "SELECT * FROM AXIS_CODLITERALES WHERE SLITERA=" + SLITERA  + "";
            String selectStm2 = "SELECT * FROM AXIS_LITERALES WHERE SLITERA=" + SLITERA  + "";
            
            String insertStm2 = "INSERT INTO AXIS_LITERALES (CIDIOMA, SLITERA, TLITERA) VALUES " +
            "(1, " + SLITERA + ", '" + msg_ca + "')";
            
            String insertStm3 = "INSERT INTO AXIS_LITERALES (CIDIOMA, SLITERA, TLITERA) VALUES " +
            "(2, " + SLITERA + ", '" + msg_es + "')";
            
            String insertStm4 = "INSERT INTO AXIS_LITERALES (CIDIOMA, SLITERA, TLITERA) VALUES " +
            "(3, " + SLITERA + ", '" + msg_en + "')";
            
            String insertStm5 = "INSERT INTO AXIS_LITERALES (CIDIOMA, SLITERA, TLITERA) VALUES " +
            "(5, " + SLITERA + ", '" + msg_fr + "')";
                        
            String deleteStm1 = "DELETE FROM AXIS_LITERALES WHERE SLITERA=" + SLITERA + "";
            String deleteStm2 = "DELETE FROM AXIS_CODLITERALES WHERE SLITERA=" + SLITERA + "";
            
            String stm1 = "", stm2 = "", stm3 = "", stm4 = "", stm5 = "";
            
            /* INSERTAR  */
            sqlStmnt.execute(conn, insertStm1); stm1 = insertStm1;
            sqlStmnt.execute(conn, insertStm2); stm2 = insertStm2;
            sqlStmnt.execute(conn, insertStm3); stm3 = insertStm3;
            sqlStmnt.execute(conn, insertStm4); stm4 = insertStm4;
            sqlStmnt.execute(conn, insertStm5); stm5 = insertStm5;
            /* MODIFICAR */
            // sqlStmnt.execute(conn, updateStm1); stm1 = updateStm1;
            // sqlStmnt.execute(conn, updateStm2); stm2 = updateStm2;
            // sqlStmnt.execute(conn, updateStm3); stm3 = updateStm3;           
                        
            /* BORRAR */
            //sqlStmnt.execute(conn, deleteStm1); stm1 = deleteStm1;
            //sqlStmnt.execute(conn, deleteStm2); stm2 = deleteStm2;
            
            logger.debug(sqlStmnt.executeQuery(conn, selectStm1));
            logger.debug(sqlStmnt.executeQuery(conn, selectStm2));
            
            logger.debug("\nSENTENCIAS ejecutadas: \n" + stm1);
            logger.debug(stm2 + ";");
            logger.debug(stm3 + (stm3.equals("") ? "" : ";"));
        } catch (Exception e){
            e.printStackTrace();
        } finally {
            if (conn != null)
                conn.close();
        }
    }
}
