package com.tut.Servlet;
import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.DB.DatabaseConnection;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        try {
            // Establishing the database connection
            Connection con = DatabaseConnection.initializeDatabase();
            
            // SQL query to check username and password
            String query = "SELECT role FROM users WHERE username = ? AND password = ?";
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setString(1, username);
            stmt.setString(2, password);

            // Executing the query
            ResultSet rs = stmt.executeQuery();
            
            if (rs.next()) {
                // If user is found, get their role
                String role = rs.getString("role");
                
                // Create a session and store user information
                HttpSession session = request.getSession();
                session.setAttribute("userobj", username);
                session.setAttribute("role", role);

                // Redirect based on the role
                switch (role) {
                    case "Employee":
                        response.sendRedirect("requestAccess.jsp");
                        break;
                    case "Manager":
                        response.sendRedirect("pendingRequests.jsp");
                        break;
                    case "Admin":
                        response.sendRedirect("createSoftware.jsp");
                        break;
                    default:
                        response.sendRedirect("login.jsp?error=true");
                        break;
                }
            } else {
                // If username or password is incorrect, redirect to login with error
                response.sendRedirect("login.jsp?error=true");
            }
            
            // Closing the resources
            stmt.close();
            con.close();
            
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("login.jsp?error=true"); // Redirect in case of exception
        }
    }
}
