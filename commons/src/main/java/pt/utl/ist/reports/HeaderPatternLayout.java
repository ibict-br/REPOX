package pt.utl.ist.reports;

import org.apache.log4j.PatternLayout;

public class HeaderPatternLayout extends PatternLayout {
    private String header;

    public void setHeader(String header){
        this.header = header;
    }

    public String getHeader(){
        return this.header + System.getProperty("line.separator");
    }
}
