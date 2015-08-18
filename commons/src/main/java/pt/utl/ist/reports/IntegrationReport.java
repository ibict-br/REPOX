package pt.utl.ist.reports;


import java.util.Properties;
import org.apache.log4j.Logger;
import pt.utl.ist.util.PropertyUtil;

public class IntegrationReport extends Exception {
   private static final long serialVersionUID = 1L;

   private static final Logger ibictIntReporter  = Logger.getLogger("ibicReporter");

   public final static String IRT_EV_WRONG_UTF_CODE       = "non UTF-8 character identified";
   public final static String IRT_EV_MAX_RETRIES_EXCEEDED = "max number of retries exceeded";
   public final static String IRT_EV_GENERIC_ERROR        = "error returned by the server";
   public final static String IRT_EV_PAGE_NOT_FOUND       = "the requested page was not found";

   public final static String IRTACT_UNMET_CHAR_REPLACED = "non UTF-8 character replaced";
   public final static String IRTACT_HARVESTING_ABORTED  = "harvest aborted";
   public final static String IRTACT_RESUME_FROM_FIRST   = "harvest resumed from the first source";

   public final static String USER_COLLECTORS_KEY        = "userCollectorsID";
   public static       String USER_COLLECTORS_ID         = "";

   public final static String CONFIG_FILE                = "configuration.properties";

   public IntegrationReport() {
        Properties configurationProperties = PropertyUtil.loadCorrectedConfiguration(CONFIG_FILE);
        USER_COLLECTORS_ID = configurationProperties.getProperty(USER_COLLECTORS_KEY);
   }

   /**
    * fills the following fields:
    *    dc.date.occurrence, id, collection, dc.description.report dc.identifier.oai dc.description.action dc.description.details
    * @param string 
    * @param irtactUnmetCharReplaced 
    */

   public static void Report(String event, String url, String identifier, String spec, String action, String detail ){
      ibictIntReporter.info(
          "\t" +                // dc.date.occurrence /*date info on log4j config file*/
          "+\t" +               // id
          USER_COLLECTORS_ID +  // collection
          event + "\t" +        // dc.description.report
          url + "\t" +          // URL
          identifier + "\t" +   // dc.identifier.oai
          spec + "\t" +         // spec
          action + "\t" +       // dc.description.action
          detail                // dc.description.details
      );
   }
}
