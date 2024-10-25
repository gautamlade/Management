<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.tut.model.Software"%>
<%@ page import="com.DB.DatabaseConnection"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Access Request</title>
<%@ include file="all_component/allCss.jsp"%>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
	<%@ include file="all_component/navbar3.jsp"%>

	<div class="container">
		<h2 class="text-center">Request Access</h2>

		<c:if test="${not empty status}">
			<div
				class="alert alert-${status == 'success' ? 'success' : (status == 'error' ? 'danger' : 'warning')}"
				role="alert" style="margin-top: 20px;">
				<c:choose>
					<c:when test="${status == 'success'}">
					 Access request submitted successfully!
            </c:when>
					<c:when test="${status == 'error'}">
						<strong>Error!</strong> An error occurred while submitting your request.
            </c:when>
					<c:when test="${status == 'userNotFound'}">
						<strong>Warning!</strong> User not found. Please log in again.
            </c:when>
				</c:choose>
			</div>
		</c:if>


		<%
		List<Software> softwareList = new ArrayList<>();
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;

		try {
			// Initialize your database connection
			con = DatabaseConnection.initializeDatabase();
			String query = "SELECT id, name, description, access_levels FROM software";
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);

			while (rs.next()) {
				Software software = new Software();
				software.setId(rs.getInt("id"));
				software.setName(rs.getString("name"));
				software.setDescription(rs.getString("description"));
				software.setAccessLevels(rs.getString("access_levels"));
				softwareList.add(software);
			}
			request.setAttribute("softwareList", softwareList); // Set softwareList as a request attribute
		} catch (Exception e) {
			e.printStackTrace(); // Consider using logging in production
		} finally {
			// Close resources
			if (rs != null)
				try {
			rs.close();
				} catch (SQLException e) {
			e.printStackTrace();
				}
			if (stmt != null)
				try {
			stmt.close();
				} catch (SQLException e) {
			e.printStackTrace();
				}
			if (con != null)
				try {
			con.close();
				} catch (SQLException e) {
			e.printStackTrace();
				}
		}
		%>

		<form action="RequestServlet" method="post">
			<div class="form-group">
				<label for="softwareSelect">Select Software</label> <select
					id="softwareSelect" name="software_id" class="form-control"
					required>
					<c:forEach var="software" items="${softwareList}">
						<option value="${software.id}">${software.name}</option>
					</c:forEach>
				</select>
			</div>
			<div class="form-group">
				<label for="accessTypeSelect">Select Access Type</label> <select
					id="accessTypeSelect" name="access_type" class="form-control"
					required>
					<option value="">Select Access Type</option>
					<option value="Read">Read</option>
					<option value="Write">Write</option>
					<option value="Admin">Admin</option>
				</select>
			</div>
			<div class="form-group">
				<label for="reasonTextarea">Reason for Request</label>
				<textarea id="reasonTextarea" name="reason" class="form-control"
					placeholder="Reason for request" required></textarea>
			</div>
			<div class="form-group text-center">
				<button type="submit" class="btn btn-primary">Request
					Access</button>
			</div>

		</form>
	</div>

	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
