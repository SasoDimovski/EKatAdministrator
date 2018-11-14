package Procedures;


import java.sql.Connection;
import java.sql.DriverManager;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;


public class DBSessionListener implements HttpSessionListener {
    private HttpSession session = null;

    public void sessionCreated(HttpSessionEvent event) {
        System.out.println("");
        System.out.println("Procedures/DBSessionListener.java: --------------");

        session = event.getSession();
        // create connection and put in into session
        try {
            DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());
            String conn_url = ReadDBProperties.getProperty("conn_url");
            String conn_usr = ReadDBProperties.getProperty("conn_uname");
            String conn_pas = ReadDBProperties.getProperty("conn_pass");
            Connection conn = DriverManager.getConnection(conn_url, conn_usr, conn_pas);
            session.setAttribute("CONN", conn);

            System.out.println("DB_url: " + conn_url);
            System.out.println("DB_user: " + conn_usr);
            System.out.println("DB_pass: " + conn_pas);
            System.out.println("Session(CONN): " + conn);
            System.out.println("OTVORENA KONEKCIJA DO BAZA");
            System.out.println("");

        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
        }

    }

    public void sessionDestroyed(HttpSessionEvent event) {
    	System.out.println("");
        System.out.println("Procedures/DBSessionListener.java: --------------");
        session = event.getSession();
        // close connection from session
        try {
            Connection conn = (Connection)session.getAttribute("CONN");
            //System.out.println("destroyed connection:"+ conn);
            conn.close();
            System.out.println("ZATVORENA KONEKCIJA DO BAZA");
            //response.sendRedirect("Index.jsp");
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
        }


    }
}

