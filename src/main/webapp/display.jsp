<%@page import="java.util.ArrayList"%>
<%@ page import="java.util.List" %>
<%@ page import="com.userManagement.User" %>
<%@ page import="com.userManagement.UserDAO" %>

<html>
<head>
    <title>Display Users</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
        }
        table {
            width: 80%;
            margin: 20px auto;
            border-collapse: collapse;
        }
        th, td {
            padding: 10px;
            border: 1px solid #ccc;
            text-align: left;
        }
        th {
            background-color: #007bff; /* Blue color for table header */
            color: #fff;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2; /* Light gray background for even rows */
        }
        tr:hover {
            background-color: #ddd; /* Darker gray background on hover */
        }
    </style>
</head>
<body>
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>Country</th>
            </tr>
        </thead>
        <tbody>
            <%
                List<User> users = new ArrayList<>();
                UserDAO model = new UserDAO();
                users = model.selectAllUser();
                for(User currentUser : users){
                    int id = currentUser.getId();
                    String userName = currentUser.getName();
                    String email = currentUser.getEmail();
                    String country = currentUser.getCountry();
            %>
            <tr>
                <td><%= id %></td>
                <td><%= userName %></td>
                <td><%= email %></td>
                <td><%= country %></td>
            </tr>
            <%
                }
            %>
        </tbody>
    </table>
</body>
</html>