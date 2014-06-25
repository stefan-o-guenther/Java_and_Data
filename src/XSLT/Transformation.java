package XSLT;

import java.io.File;

import javax.xml.transform.OutputKeys;
import javax.xml.transform.Result;
import javax.xml.transform.Source;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.stream.StreamSource;

public class Transformation {

    /**
     * XSLT-Transformation durchführen und Ergebnis
     * an System.out schicken.
     */
    public static void main(String[] args) throws Exception {   		
    	
    	// load xml and xslt file
        File xmlFile = new File("src/XSLT/cdsammlung.xml");
        File xsltFile = new File("src/XSLT/xslt.xsl");

        // JAXP liest Daten über die Source-Schnittstelle
        Source xmlSource = new StreamSource(xmlFile);
        Source xsltSource = new StreamSource(xsltFile);
        
        // Ausgabe des Ergebnisses
        Result result = new StreamResult(System.out);

        // das Factory-Pattern unterstützt verschiedene XSLT-Prozessoren        
        TransformerFactory transFact = TransformerFactory.newInstance("net.sf.saxon.TransformerFactoryImpl",null);
        //TransformerFactory transFact = TransformerFactory.newInstance("org.apache.xalan.processor.TransformerFactoryImpl",null);
        //TransformerFactory transFact = TransformerFactory.newInstance("com.jclark.xsl.trax.TransformerFactoryImpl",null);    
        
        //System.setProperty("javax.xml.transform.TransformerFactory", "net.sf.saxon.TransformerFactoryImpl");
        //TransformerFactory transFact = TransformerFactory.newInstance();
        
        try {
        	Transformer transformer = transFact.newTransformer(xsltSource);   
        	transformer.setOutputProperty(OutputKeys.INDENT, "yes");
            transformer.transform(xmlSource, result);
        } catch (Exception e) {  
            e.printStackTrace();  
        }    	
    }
}