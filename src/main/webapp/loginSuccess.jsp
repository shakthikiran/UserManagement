<%@page import="java.security.PublicKey"%>
<%@page import="java.util.function.Function"%>
<%@page import="com.userManagement.LoginBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Expires" content="0">


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Success</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f0f0f0;
    }
    .container {
        margin: auto;
        width: 50%;
        text-align: center;
    }
    .welcome-message {
        font-size: 24px;
        color: #007bff; /* Blue color for welcome message */
    }
    .button-container {
        margin-top: 20px;
    }
    .button-container button {
        margin: 5px;
        padding: 10px 20px;
        font-size: 16px;
        background-color: #007bff;
        color: #fff;
        border: none;
        cursor: pointer;
    }
    .button-container button:hover {
        background-color: #0056b3; /* Darker blue color on hover */
    }
    /* Add styles for navigation bar */
    .navbar {
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 10px;
        background-color: #333;
        color: #fff;
    }
    .logout-btn {
        background-color: #dc3545; /* Red color for logout button */
    }
</style>
</head>
<body>
    <%
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        response.setHeader("Pragma", "no-cache");
        response.setHeader("Expires", "0");
        String name = (String) session.getAttribute("name");
        if (name == null) {
            response.sendRedirect("index.jsp");
        }
    %>
    <div class="container">
        <div class="navbar">
            <p class="welcome-message">Welcome to User Management <%= session.getAttribute("name") %></p>
            <form action="logout" method="get">
                <button class="logout-btn" type="submit">Logout</button>
            </form>
        </div>
        <div class="button-container">
            <form>
                <button formaction="addUser.jsp">Add an user</button>
                <button formaction="updateUser.jsp">Update an user</button>
                <button formaction="deleteUser.jsp">Delete an user</button>
            </form>
        </div>
    </div>
    <%@ include file="display.jsp" %>
</body>
</html>
