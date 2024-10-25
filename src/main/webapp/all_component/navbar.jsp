<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>

<!-- Include Font Awesome CSS -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

<nav class="navbar navbar-expand-lg navbar-light bg-custom">
   &nbsp;&nbsp;&nbsp; <h3 style="color:white;">User Access Management</h3>
    
    <button class="navbar-toggler" type="button" data-toggle="collapse"
        data-target="#navbarSupportedContent"
        aria-controls="navbarSupportedContent" aria-expanded="false"
        aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <div class="ml-auto d-flex align-items-center">
            <div class="dropdown">
                <button type="button" class="btn btn-light dropdown-toggle"
                    data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <i class="fas fa-sign-in-alt"></i> Login <!-- Added login icon -->
                </button>
                <div class="dropdown-menu dropdown-menu-right">
                    <a class="dropdown-item" href="login.jsp">User</a>
                    <a class="dropdown-item" href="login.jsp">Manager</a>
                    <a class="dropdown-item" href="login.jsp">Admin</a>
                </div>
            </div>
            <a href="signup.jsp" class="btn btn-light ml-2"> 
                <i class="fas fa-user"></i> Sign Up
            </a>
        </div>
    </div>
</nav>
