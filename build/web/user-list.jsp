<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, model.User" %>
<%
    List<User> users = (List<User>) request.getAttribute("userList");
%>
<!DOCTYPE html>
<html>
<head>
    <title>User List</title>
    <link rel="stylesheet" href="css/styles.css?v=3">
    <style>
          /* Import Modern Fonts */
        @import url('https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;700&family=Montserrat:wght@300;600&display=swap');
        .table-container {
            width: 60%;
            max-width: 1100px;
            margin: 40px auto;
            background: #fff;
             border:1px solid rgba(126, 126, 126, 0.5);
           
            overflow: hidden;
            padding: 30px;
        }

        h2 {
            font-family: "Playfair Display", serif;
            font-size: 28px;
            margin-bottom: 20px;
            text-align: center;
        }

        .btn {
            display: inline-block;
           background-color: #1976d2;
            color: #fff;
            padding: 10px 18px;
            border-radius: 4px;
            font-weight: bold;
            text-decoration: none;
            margin-bottom: 20px;
            transition: 0.3s ease;
        }

        .btn:hover {
            background-color: #125aa6;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        table thead {
            background-color: #1976d2;
            color: #fff;
        }

        table th, table td {
            padding: 14px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

       

        .action-link {
            margin-right: 10px;
            text-decoration: none;
            font-weight: 600;
            color: #111;
            transition: 0.3s all linear ;
        }

        .action-link:hover {
            color: rgba(101, 101, 101, 0.5);
           
            
        }

        .no-users {
            text-align: center;
            font-size: 18px;
            color: #666;
        }
        button, input[type="submit"] {
    background-color: #1976d2;
    border: none;
    color: white;
    padding: 10px 16px;
    margin-top: 10px;
    cursor: pointer;
    border-radius: 4px;
    transition: background 0.3s ease;
}

button:hover, input[type="submit"]:hover {
    background-color: #125aa6;
}
    </style>
</head>
<body>
    <div class="table-container">
        <h2>User List</h2>
        <a href="user-form.jsp" class="btn">Add User</a>

        <% if (users != null && !users.isEmpty()) { %>
            <table>
                <thead>
                    <tr><th>ID</th><th>Name</th><th>Email</th><th>Actions</th></tr>
                </thead>
                <tbody>
                    <% for (User user : users) { %>
                    <tr>
                        <td><%= user.getId() %></td>
                        <td><%= user.getName() %></td>
                        <td><%= user.getEmail() %></td>
                        <td>
                            <a class="action-link" href="user-form.jsp?id=<%= user.getId() %>">Edit</a>
                            <a class="action-link" href="delete?id=<%= user.getId() %>">Delete</a>
                        </td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
        <% } else { %>
            <p class="no-users">No users found.</p>
        <% } %>
    </div>
</body>
</html>
