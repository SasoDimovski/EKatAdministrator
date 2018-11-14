package Procedures;

import java.io.IOException;


public class ReadDBProperties {

    public static String getProperty(String key) {
        // Datotekata properties.properties mora da se najavi WEB-INF/classes
    	
        java.util.Properties properties = new java.util.Properties();
        try {
            ClassLoader cl = Thread.currentThread().getContextClassLoader();
            properties.load(cl.getResourceAsStream("properties.properties"));
            //System.out.println("Procedures/ReadDBProperties.java: --------------");

        } catch (IOException e) {
            e.printStackTrace();
            System.out.println("Otvaranjeto na 'properties.properties' datotekata ne e uspesno !");
        }

        String value = properties.getProperty(key);
        if (value == null)
            value = "";

        return value;
    }
}
