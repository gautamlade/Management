package com.tut.Servlet;
import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.DB.DatabaseConnection;

@WebServlet("/SoftwareServlet")
public class SoftwareServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        String[] accessLevels = request.getParameterValues("access_levels");

        String accessLevelString = String.join(",", accessLevels);

        try {
            Connection con = DatabaseConnection.initializeDatabase();
            String query = "INSERT INTO software (name, description, access_levels) VALUES (?, ?, ?)";
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setString(1, name);
            stmt.setString(2, description);
            stmt.setString(3, accessLevelString);

            stmt.executeUpdate();

            // Set a session attribute for success message
            HttpSession session = request.getSession();
            session.setAttribute("successMessage", "Software details saved successfully!");

            response.sendRedirect("createSoftware.jsp");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
