package com.tut.Servlet;
import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.DB.DatabaseConnection;

@WebServlet("/SignUpServlet")
public class SignUpServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        try {
            Connection con = DatabaseConnection.initializeDatabase();
            String query = "INSERT INTO users (username, password, role) VALUES (?, ?, 'Employee')";
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setString(1, username);
            stmt.setString(2, password);

            stmt.executeUpdate();
            response.sendRedirect("login.jsp");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
