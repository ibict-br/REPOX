package pt.utl.ist.reports;

import java.util.HashMap;
import java.util.Map;

import org.apache.log4j.Logger;

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

	/**
	 * fills the following fields:
	 * 	dc.date.occurrence, id, collection, dc.description.report dc.identifier.oai dc.description.action dc.description.details
	 */
	public static void Report(String event, String identifier, String action, String detail){
		ibictIntReporter.info(
		    "\t" +                // dc.date.occurrence /*date info on log4j config file*/
		    "+\t" +               // id
		    "000\t" +             // collection
		    event + "\t" +        // dc.description.report
		    identifier + "\t" +   // dc.identifier.oai
		    action + "\t" +       // dc.description.action
		    detail                // dc.description.details
		);
	}
}
