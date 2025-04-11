<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="dao.UserDAO, model.User" %>
<%
    String idParam = request.getParameter("id");
    User user = new User();
    String action = "add";

    if (idParam != null) {
        int id = Integer.parseInt(idParam);
        user = UserDAO.getUser(id);
        action = "edit";
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title><%= action.equals("add") ? "Add" : "Edit" %> User</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;700&family=Montserrat:wght@300;600&display=swap">
    <link rel="stylesheet" href="css/styles.css?v=3">
    <style>
          /* Import Modern Fonts */
        @import url('https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;700&family=Montserrat:wght@300;600&display=swap');
        body {
            margin: 0;
            padding: 0;
            font-family: 'Montserrat', sans-serif;
            background-color: #f8f8f8;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        .form-wrapper {
            background: #fff;
            padding: 40px 30px;
            border-radius: 10px;
            border:1px solid rgba(126, 126, 126, 0.5);
            width: 100%;
            width: 30%;
            text-align: center;
        }

        .form-wrapper h2 {
            font-family: "Playfair Display", serif;
            font-size: 26px;
            color: #111;
            margin-bottom: 25px;
        }

        .form-group {
            margin-bottom: 20px;
            text-align: left;
        }

        .form-group input[type="text"],
        .form-group input[type="email"] {
            width: 93%;
            padding: 14px;
            font-size: 14px;
            border: none;
            background: #f5f5f5;
            border-radius: 4px;
            transition: background 0.3s ease;
        }

        .form-group input:focus {
            background-color: #e6e6e6;
            outline: none;
        }

        .submit-btn {
            width: 100%;
            background-color: #1976d2;
            color: #fff;
            border: none;
            padding: 14px;
            font-size: 15px;
            border-radius: 4px;
            cursor: pointer;
            font-weight: bold;
            transition: 0.3s ease;
        }

        .submit-btn:hover {
           background-color: #125aa6;
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
    <div class="form-wrapper">
        <h2><%= action.equals("add") ? "Add" : "Edit" %> User</h2>
        <form action="<%= action %>" method="post">
            <% if (action.equals("edit")) { %>
                <input type="hidden" name="id" value="<%= user.getId() %>">
            <% } %>

            <div class="form-group">
                <input type="text" name="name" value="<%= user.getName() %>" placeholder="Name" required />
            </div>

            <div class="form-group">
                <input type="email" name="email" value="<%= user.getEmail() %>" placeholder="Email" required />
            </div>

            <button type="submit" class="submit-btn">
                <%= action.equals("add") ? "Add" : "Update" %>
            </button>
        </form>
    </div>
</body>
</html>
