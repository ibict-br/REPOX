package pt.utl.ist.util;

import java.util.HashMap;
import java.util.Map;

public class WrongUTFCodingException extends Exception {
	private static final long serialVersionUID = -7276924149259963512L;

	private HashMap< String, String > description = new HashMap<String, String>();
	private String outText = "";

	public WrongUTFCodingException( String outText, Map< String, String > description ){
		this.description.putAll(description);
		this.outText = outText;
	}

	public HashMap<String, String> getDescription() {
		return description;
	}

	public String getOutText() {
		return outText;
	}

	public void setOutText(String outText) {
		this.outText = outText;
	}
}
