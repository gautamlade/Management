package com.tut.Servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DB.DatabaseConnection;

@WebServlet("/ApprovalServlet")
public class ApprovalServlets extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Connection con = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        HttpSession session = request.getSession();

        try {
            // Get request parameters
            int requestId = Integer.parseInt(request.getParameter("request_id"));
            String action = request.getParameter("action");

            // Initialize database connection
            con = DatabaseConnection.initializeDatabase();

            // Retrieve the access_type of the request for dynamic messaging
            String accessType = null;
            String fetchQuery = "SELECT access_type FROM requests WHERE id = ?";
            stmt = con.prepareStatement(fetchQuery);
            stmt.setInt(1, requestId);
            rs = stmt.executeQuery();
            
            if (rs.next()) {
                accessType = rs.getString("access_type");
            }

            if (accessType == null) {
                session.setAttribute("actionMessage", "Invalid request or access type not found.");
                response.sendRedirect("pendingRequests.jsp");
                return;
            }

            // Determine the new status and the message based on the action and access type
            String newStatus = action.equals("approve") ? "Approved" : "Rejected";
            String message;
            
            if (action.equals("approve")) {
                message = "Access to " + accessType + " privileges for this software has been approved.";
            } else {
                message = "Request for " + accessType + " privileges for this software has been rejected.";
            }

            // Prepare SQL query to update the status
            String updateQuery = "UPDATE requests SET status = ? WHERE id = ?";
            stmt = con.prepareStatement(updateQuery);
            stmt.setString(1, newStatus);
            stmt.setInt(2, requestId);

            // Execute update
            int rowsUpdated = stmt.executeUpdate();

            // Set the message only if update was successful
            if (rowsUpdated > 0) {
                session.setAttribute("actionMessage", message);
                System.out.println("Request ID " + requestId + " updated to " + newStatus);
            } else {
                session.setAttribute("actionMessage", "No request found with ID " + requestId);
                System.out.println("No request found with ID " + requestId);
            }

            // Redirect to pending requests page
            response.sendRedirect("pendingRequests.jsp");

        } catch (NumberFormatException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid request ID");
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database error");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } finally {
            // Close resources
            try {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
