<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update User</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f0f0f0;
    }
    form {
        width: 50%;
        margin: 50px auto;
        padding: 20px;
        background-color: #fff;
        border-radius: 5px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }
    label {
        display: block;
        margin-bottom: 10px;
    }
    input[type="text"] {
        width: 100%;
        padding: 8px;
        margin-bottom: 20px;
        border: 1px solid #ccc;
        border-radius: 5px;
        box-sizing: border-box;
    }
    button[type="submit"] {
        padding: 10px 20px;
        background-color: #007bff;
        color: #fff;
        border: none;
        border-radius: 5px;
        cursor: pointer;
    }
    button[type="submit"]:hover {
        background-color: #0056b3;
    }
</style>
</head>
<body>
    <%
            String name = (String) session.getAttribute("name");
            if (name == null) {
                response.sendRedirect("login.jsp");
            }
    %>
    <form action="controller" method="post">
        <input type="hidden" name="action" value="update">
        <label for="id">ID:</label>
        <input type="text" id="id" name="id">
        <label for="updateName">Update Name:</label>
        <input type="text" id="updateName" name="updateName">
        <label for="updateEmail">Update Email ID:</label>
        <input type="text" id="updateEmail" name="updateEmail">
        <label for="updateCountry">Update Country:</label>
        <input type="text" id="updateCountry" name="updateCountry">
        <button type="submit">Submit</button>
    </form>
</body>
</html>
