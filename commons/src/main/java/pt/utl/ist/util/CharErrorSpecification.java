package pt.utl.ist.util;

public class CharErrorSpecification {

	private String spec;
	private int codePoint;
	private String replacement;

	public CharErrorSpecification(String spec, int codePoint, String replacement) {
		this.spec = spec;
		this.codePoint = codePoint;
		this.replacement = replacement;
	}

	public String getSpec() {
		return spec;
	}

	public void setSpec(String spec) {
		this.spec = spec;
	}

	public int getCodePoint() {
		return codePoint;
	}

	public void setCodePoint(int codePoint) {
		this.codePoint = codePoint;
	}

	public String getReplacement() {
		return replacement;
	}

	public void setReplacement(String replacement) {
		this.replacement = replacement;
	}
}
