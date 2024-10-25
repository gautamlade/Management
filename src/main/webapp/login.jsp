<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Login Page</title>
    <%@ include file="all_component/allCss.jsp"%>
    <style>
        .footer {
            position: absolute;
            bottom: 0;
            width: 100%;
            background-color: #f1f1f1;
            text-align: center;
        }

    </style>
</head>
<body>
    <%@ include file="all_component/navbar.jsp"%>
    
    <div class="container-fluid">
        <div class="row p-5">
            <div class="col-md-4 offset-md-4">
                <div class="card">
                    <div class="card-body">
                        <div class="text-center">
                            <i class="fa fa-user-plus fa-2x" aria-hidden="true"></i>
                            <h5>Login Page</h5>
                        </div>

                        <!-- Display error message if login failed -->
                        
                        <c:if test="${param.error eq 'true' }">
                            <h4 class="text-center text-danger">Invalid Username or Password</h4>
                           
                        </c:if>

                        <!-- Login form -->
                        <form action="LoginServlet" method="post">
                            <div class="form-group">
                                <label for="exampleInputEmail">Enter Username</label> 
                                <input type="email" required class="form-control" id="exampleInputEmail" 
                                       name="username" aria-describedby="emailHelp">
                            </div>
                            <div class="form-group">
                                <label for="exampleInputPassword">Enter Password</label> 
                                <input type="password" required class="form-control" 
                                       id="exampleInputPassword" name="password">
                            </div>
                            <button type="submit" class="btn btn-primary btn-block">Login</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="footer">
        <%@ include file="all_component/footer.jsp"%>
    </div>
</body>
</html>
