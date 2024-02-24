package axis.util.testLiterales;

import java.io.File;
import java.io.FileInputStream;
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.DriverManager;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.AccesoSQL;
import axis.service.axis.AxisBaseService;

public class LiteralesTmp {
    public static void main (String [] var_args) throws Exception{
        Log logger = LogFactory.getLog(LiteralesTmp.class);
        Properties literales_db = new Properties();
        Properties literales_pr = new Properties();
        Connection conn = null;
        try{
            Class c = Class.forName ("oracle.jdbc.driver.OracleDriver");
            logger.debug("Cargado puente java-jdbcOracle " + c);
            
            logger.debug("A conectarse " + c);
            conn = DriverManager.getConnection ("jdbc:oracle:thin:@192.168.10.15:1521:DELTA", "icre_t", "i");
            
            AccesoSQL sqlStmnt = new AccesoSQL (conn);

            String selectStm = "select t1.SLITERA, t1.TLITERA, t2.TLITERA from AXIS_LITERALES t1, LITERALES t2 " +
            "where t1.SLITERA=t2.SLITERA and t1.CIDIOMA=t2.CIDIOMA " +
            "and not (t1.TLITERA = t2.TLITERA) and t2.TLITERA like '%:' and t1.CIDIOMA=1";
            
            List selectedLiterales = sqlStmnt.executeQuery(conn, selectStm);
            List TLITERAS = new ArrayList();
            
            for (int i = 0; i < selectedLiterales.size(); i++) {
                BigDecimal SLITERA = (( !AxisBaseService.isEmpty(selectedLiterales) && 
                    !AxisBaseService.isEmpty(selectedLiterales.get(i)) ) ? 
                        (BigDecimal)((Map)selectedLiterales.get(i)).get("SLITERA") : null );
                String TLITERA = (( !AxisBaseService.isEmpty(selectedLiterales) && 
                    !AxisBaseService.isEmpty(selectedLiterales.get(i)) ) ? 
                        (String)((Map)selectedLiterales.get(i)).get("TLITERA") : null );
                
                TLITERAS.add(TLITERA);
                
                if (AxisBaseService.isEmpty(SLITERA) || AxisBaseService.isEmpty(TLITERA))
                    continue;
                    
                logger.debug("Resultado select: " + SLITERA + "=" + TLITERA);
                literales_db.setProperty(SLITERA.toString(), TLITERA);
            }
            
            //Directorio de properties
            String p = "C:\\Documents and Settings\\CSI\\Escritorio\\jdevstudio10133\\jdev\\mywork\\axisCredit\\axisweb\\src\\mensajes.bck";
            
            // depr. String srcPath = p + File.separator + "mensajes_ca.bck.properties";
            
            // catala: String srcPath = p + File.separator + "mensajes_1.bck.properties";
            // castellano: String srcPath = p + File.separator + "mensajes_2.bck.properties";
            // chile: String srcPath = p + File.separator + "mensajes_3.bck.properties";
            // english: String srcPath = p + File.separator + "mensajes_5.bck.properties";
            
            String srcPath = p + File.separator + "mensajes_1.bck.properties";

            //Cargar literales de properties en una lista
            literales_pr.load(new FileInputStream(new File(srcPath)));
            
            for (Enumeration e = literales_pr.keys(); e.hasMoreElements(); ) {
                Map m = new HashMap();
                Object obj = e.nextElement();
                String SLITERA = obj.toString();
                String TLITERA = literales_pr.getProperty(SLITERA);
                m.put("SLITERA", SLITERA);
                m.put("TLITERA", TLITERA);
                
                if (TLITERAS.contains(TLITERA)) {
                    try {
                        new BigDecimal(SLITERA);
                    } catch (NumberFormatException nfe) {
                        continue;
                    }
                    //listaTLITERA.add(TLITERA);
                    //listaLiterales.add(m);
                    logger.debug(m);
                    TLITERA = TLITERA.replaceAll("'", "''");
                    try{
                        String insertStm = "INSERT INTO AXIS_LITERALES (CIDIOMA, SLITERA, TLITERA) VALUES " +
                        "(1, " + SLITERA + ", '" + TLITERA + "')";
                        sqlStmnt.execute(conn, insertStm);
                        logger.debug("LITERAL " + SLITERA + "a�adido.");
                    }catch(Exception ex){
                        String updateStm = "UPDATE AXIS_LITERALES SET CIDIOMA=1, SLITERA=" + SLITERA + ", TLITERA='" + TLITERA + "' WHERE CIDIOMA=1 AND SLITERA="  + SLITERA;
                        sqlStmnt.execute(conn, updateStm);
                        System.err.println("LITERAL " + SLITERA + "modificado.");
                    }
                }else{
                    
                }
            }
            
        }catch(Exception e){
            e.printStackTrace();
        }
    }
}
