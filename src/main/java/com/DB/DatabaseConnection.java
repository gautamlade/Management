package com.DB;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {
    public static Connection initializeDatabase() throws SQLException, ClassNotFoundException {
        String jdbcURL = "jdbc:postgresql://localhost:5432/access_management";
        String jdbcUsername = "postgres";
        String jdbcPassword = "Gaut@2002";

        Class.forName("org.postgresql.Driver");
        return DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
    }
}
