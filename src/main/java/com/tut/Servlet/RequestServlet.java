package com.tut.Servlet;
import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.DB.DatabaseConnection;

@WebServlet("/RequestServlet")
public class RequestServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("userobj");
        
        if (username == null) {
            response.sendRedirect("login.jsp"); // Redirect if the user is not logged in
            return;
        }

        int softwareId = Integer.parseInt(request.getParameter("software_id"));
        String accessType = request.getParameter("access_type");
        String reason = request.getParameter("reason");

        Connection con = null;
        PreparedStatement userStmt = null;
        PreparedStatement requestStmt = null;
        ResultSet userRs = null;

        try {
            con = DatabaseConnection.initializeDatabase();
            
            String userQuery = "SELECT id FROM users WHERE username = ?";
            userStmt = con.prepareStatement(userQuery);
            userStmt.setString(1, username);
            userRs = userStmt.executeQuery();

            if (userRs.next()) {
                int userId = userRs.getInt("id");

                String insertQuery = "INSERT INTO requests (user_id, software_id, access_type, reason, status) VALUES (?, ?, ?, ?, 'Pending')";
                requestStmt = con.prepareStatement(insertQuery);
                requestStmt.setInt(1, userId);
                requestStmt.setInt(2, softwareId);
                requestStmt.setString(3, accessType);
                requestStmt.setString(4, reason);

                int rowsAffected = requestStmt.executeUpdate();
                if (rowsAffected > 0) {
                    request.setAttribute("status", "success"); // Set status attribute
                } else {
                    request.setAttribute("status", "error"); // Handle no rows affected
                }
            } else {
                request.setAttribute("status", "userNotFound"); // User not found
            }
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("status", "error"); // Redirect on error
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("status", "error"); // Redirect on error
        } finally {
            // Close resources
            try {
                if (userRs != null) userRs.close();
                if (userStmt != null) userStmt.close();
                if (requestStmt != null) requestStmt.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        
        request.getRequestDispatcher("requestAccess.jsp").forward(request, response); // Forward back to JSP
    }
}
