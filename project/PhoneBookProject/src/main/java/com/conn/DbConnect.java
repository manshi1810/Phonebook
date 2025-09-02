package com.conn;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DbConnect {

    private static Connection conn = null;

    public static Connection getConn() {
        if (conn == null) {
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                
                conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/phonebook", "root", "Manshi@10");
            } catch (ClassNotFoundException e) {
            	
                
                System.out.println("MySQL JDBC Driver not found. Include it in your library path.");
                e.printStackTrace();
            } catch (SQLException e) {
               
                System.out.println("Connection failed! Check output console.");
                e.printStackTrace();
            }
        }
        return conn;
    }
}
