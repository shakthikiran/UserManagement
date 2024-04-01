<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f0f0f0;
    }
    h1 {
        text-align: center;
    }
    form {
        width: 300px;
        margin: 0 auto;
        background-color: #fff;
        padding: 20px;
        border-radius: 5px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }
    label {
        display: block;
        margin-bottom: 10px;
    }
    input[type="text"],
    input[type="password"],
    button {
        width: 100%;
        padding: 10px;
        margin-bottom: 15px;
        border: 1px solid #ccc;
        border-radius: 3px;
    }
    button {
        background-color: #007bff;
        color: #fff;
        border: none;
        cursor: pointer;
    }
    button:hover {
        background-color: #0056b3;
    }
</style>
</head>
<body>
    <h1>Welcome to User Management</h1>
    <form method="post" action="login">
        <label>User Name :</label>
        <input type="text" name="uname"><br>
        <label>Password :</label>
        <input type="password" name="pass"><br>
        <button type="submit">Submit</button>
    </form>
</body>
</html>
