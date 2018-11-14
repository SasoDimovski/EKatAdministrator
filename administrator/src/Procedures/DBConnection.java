package Procedures;

import java.sql.Connection;

import javax.servlet.http.HttpSession;


public class DBConnection {

    public static Connection getConnection() {
        try {
            return null;
        } catch (Exception ex) {
            ex.printStackTrace();
            return null;
        } finally {
        }

    }

    public static Connection getConnection(HttpSession session) {
        try {
            Connection conn = (Connection)session.getAttribute("CONN");
            return conn;

        } catch (Exception e) {
            e.printStackTrace();

            return null;
        }


    }

}
