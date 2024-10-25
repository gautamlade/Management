<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>

<nav class="navbar navbar-expand-lg navbar-light bg-custom shadow-sm">
    <div class="container">
        <a class="navbar-brand" href="#">Admin Panel</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <button class="navbar-toggler" type="button" data-toggle="collapse"
            data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false"
            aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <a href="createSoftware.jsp" class="btn btn-outline-danger ml-2">
                <i class="fas fa-plus-circle"></i> Create Software
            </a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <a href="pendingRequests.jsp" class="btn btn-outline-warning ml-2">
                <i class="fas fa-clock"></i> Pending Requests
            </a>
        </div>
        
    </div>
     <a href="logout" class="btn btn-light mr-1"><i class="fas fa-sign-in-alt"></i> Logout</a>
</nav>

<style>
    .bg-custom {
        background-color: #f8f9fa; /* Light background for the navbar */
    }
    .navbar-brand {
        font-weight: bold; /* Make the brand name bold */
        color: #007bff; /* Bootstrap primary color */
    }
    .navbar-toggler {
        border-color: #007bff; /* Custom border color for toggler */
    }
    .navbar-toggler-icon {
        background-color: #007bff; /* Custom color for the toggler icon */
    }
    .btn {
        transition: background-color 0.3s, color 0.3s; /* Transition for button hover effects */
    }
    .btn:hover {
        background-color: #007bff; /* Change background color on hover */
        color: white; /* Change text color on hover */
    }
    /* Change icon color on button hover */
    .btn:hover i {
        color: white; /* Change icon color to white on hover */
    }
</style>
