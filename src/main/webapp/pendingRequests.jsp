<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.sql.*, com.DB.DatabaseConnection" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.tut.model.*" %>
<%@ page import="com.tut.Servlet.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Pending Requests</title>
    <%@include file="all_component/allCss.jsp"%>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
    <%@include file="all_component/navbar4.jsp"%>
    
  <div class="container mt-4">
    <h2 class="text-center mb-4">Pending Requests</h2>

  <!-- Display success or error message -->
    <c:if test="${not empty sessionScope.actionMessage}">
        <div class="alert alert-success alert-dismissible fade show" role="alert">
            ${sessionScope.actionMessage}
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
        </div>
        <c:remove var="actionMessage" scope="session"/>
    </c:if>

 <%
            // Initialize requestList
            List<Request> requestList = new ArrayList<>();
            
            // Database connection logic
            Connection conn = null;
            PreparedStatement pstmt = null;
            ResultSet rs = null;

            try {
                // Get connection from DatabaseConnection class
                conn = DatabaseConnection.initializeDatabase();
                
                // Prepare SQL query to join users and software tables
                String sql = "SELECT r.id, u.username, s.name AS softwareName, r.access_type, r.status, r.reason " +
                             "FROM requests r " +
                             "JOIN users u ON r.user_id = u.id " +
                             "JOIN software s ON r.software_id = s.id " +
                             "WHERE r.status = 'Pending'";
                pstmt = conn.prepareStatement(sql);
                rs = pstmt.executeQuery();

                // Populate the requestList
                while (rs.next()) {
                    Request re = new Request();
                    re.setId(rs.getInt("id"));
                    re.setUsername(rs.getString("username"));
                    re.setSoftwareName(rs.getString("softwareName"));
                    re.setAccessType(rs.getString("access_type"));
                    re.setStatus(rs.getString("status"));
                    re.setReason(rs.getString("reason"));
                    requestList.add(re);
                }

                // Set requestList as an attribute in the request scope
                request.setAttribute("requestList", requestList);
                
             
            } catch (SQLException e) {
                e.printStackTrace(); // Handle SQL exceptions
            } finally {
                // Close resources
                if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
                if (pstmt != null) try { pstmt.close(); } catch (SQLException e) { e.printStackTrace(); }
                if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
            }
        %>

        <table class="table table-striped table-bordered">
            <thead class="thead-dark">
                <tr>
                    <th>Employee Name</th>
                    <th>Software Name</th>
                    <th>Access Type</th>
                    <th>Status</th>
                    <th>Reason for Request</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="request" items="${requestList}">
                    <tr>
                        <td>${request.username}</td>
                        <td>${request.softwareName}</td>
                        <td>${request.accessType}</td>
                        <td>${request.status}</td>
                        <td>${request.reason}</td>
                        <td>
                            <form action="ApprovalServlet" method="post" class="d-inline">
                                <input type="hidden" name="request_id" value="${request.id}">
                                <button type="submit" name="action" value="approve" class="btn btn-success btn-sm">Approve</button>
                                <button type="submit" name="action" value="reject" class="btn btn-danger btn-sm">Reject</button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
                <c:if test="${empty requestList}">
                    <tr>
                        <td colspan="6" class="text-center">No pending requests found.</td>
                    </tr>
                </c:if>
            </tbody>
        </table>
</div>
  
    
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
