<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Signup Page</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <!-- Include Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    
    <style>
        body {
            background-color: #f0f1f2;
            font-family: 'Arial', sans-serif;
        }
        .signup-container {
            margin-top: 50px;
            max-width: 400px;
            background-color: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.1);
        }
        .signup-title {
            text-align: center;
            font-weight: bold;
            color: #333;
            margin-bottom: 20px;
        }
        .form-control {
            margin-bottom: 20px;
            border-radius: 5px;
        }
        .btn-custom {
            background-color: #007bff;
            color: white;
            width: 100%;
            padding: 10px;
            font-size: 16px;
            border-radius: 5px;
        }
        .btn-custom:hover {
            background-color: #0056b3;
        }
        .signup-footer {
            text-align: center;
            margin-top: 20px;
        }
        .signup-footer a {
            color: #007bff;
        }
    </style>
</head>
<body>

    <div class="container">
        <div class="row justify-content-center">
            <div class="signup-container col-12 col-md-8 col-lg-6">
                <h2 class="signup-title">Sign Up</h2>
                <form action="SignUpServlet" method="post">
                    <input type="text" class="form-control" name="username" placeholder="Username" required>
                    <input type="password" class="form-control" name="password" placeholder="Password" required>
                    <button type="submit" class="btn btn-custom">Sign Up</button>
                </form>
                <div class="signup-footer">
                    <p>Already have an account? <a href="login.jsp">Login here</a>.</p>
                </div>
            </div>
        </div>
    </div>

    <!-- Include Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
