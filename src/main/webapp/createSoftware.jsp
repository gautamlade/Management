<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Panel</title>
    <%@include file="all_component/allCss.jsp"%>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
</head>
<body>
    <%@include file="all_component/navbar2.jsp"%>
    <div class="container mt-5">
        <h2 class="text-center mb-4">Create New Software</h2>

        <% 
            // Display success message if it exists
            String successMessage = (String) session.getAttribute("successMessage");
            if (successMessage != null) { 
        %>
            <div class="alert alert-success">
                <%= successMessage %>
            </div>
        <%
            // Remove the message after displaying it
            session.removeAttribute("successMessage");
            }
        %>

        <form action="SoftwareServlet" method="post" class="border p-4 rounded shadow-sm">
            <div class="form-group">
                <label for="softwareName">Software Name</label>
                <input type="text" id="softwareName" name="name" class="form-control" placeholder="Software Name" required>
            </div>
            <div class="form-group">
                <label for="softwareDescription">Software Description</label>
                <textarea id="softwareDescription" name="description" class="form-control" placeholder="Software Description"></textarea>
            </div>
            <div class="form-group">
                <label>Access Levels</label><br>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="checkbox" name="access_levels" value="Read" id="readAccess">
                    <label class="form-check-label" for="readAccess">Read</label>
                </div>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="checkbox" name="access_levels" value="Write" id="writeAccess">
                    <label class="form-check-label" for="writeAccess">Write</label>
                </div>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="checkbox" name="access_levels" value="Admin" id="adminAccess">
                    <label class="form-check-label" for="adminAccess">Admin</label>
                </div>
            </div>
            <button type="submit" class="btn btn-primary btn-block">Add Software</button>
        </form>
    </div>
</body>
</html>
