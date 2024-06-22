package com.DB;

import java.sql.Connection;
import java.sql.*;
import java.sql.DriverManager;

public class DBconnect {

    private static Connection conn = null; // Initialize to null for clarity

    public static Connection getConn() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ebook", "root", "Jay@2110");
        } catch (Exception e) {
            e.printStackTrace();
        } 
        return conn;
    }
}
