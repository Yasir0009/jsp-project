<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin Login</title>
    <link rel="stylesheet" href="style.css" />
    <style>
        /* Import Modern Fonts */
        @import url('https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;700&family=Montserrat:wght@300;600&display=swap');

        /* Reset & Global Styles */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            
            background-color: #f8f8f8;
            color: #111;
            font-family: "Montserrat", sans-serif;
            text-transform: uppercase;
            display: flex;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
        }
        .login-container{
            width: 30%;
            display: flex;
            justify-content: center;
            align-items: center;
            border:1px solid rgba(126, 126, 126, 0.5);
            padding:5vh;
        }
        .login-container h2{
            text-align: center;
        }
        
        

        /* Container Layout */
        .container {
            display: flex;
            width: 100%;
            max-width: 1100px;
            height: 80vh;
            background: #fff;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
            overflow: hidden;
        }

        /* Left Image Section */
        .left-section {
            flex: 1;
            background: #000;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .left-section img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        /* Right Form Section */
        .right-section {
            flex: 1;
            padding: 40px;
            background: #fff;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .form-container {
            width: 100%;
            max-width: 400px;
            text-align: center;
        }

        /* Form Title */
        h2 {
            font-size: 26px;
            font-weight: 700;
            font-family: "Playfair Display", serif;
            margin-bottom: 25px;
            color: #111;
        }

        /* Error Message */
        p {
            color: red;
            font-size: 14px;
            margin-bottom: 15px;
        }

        /* Form Groups */
        .form-group {
            width: 100%;
            margin-bottom: 20px;
        }

        /* Inputs */
        input {
            width: 100%;
            padding: 14px;
            border: none;
            background: #f0f0f0;
            font-size: 14px;
            border-radius: 4px;
            outline: none;
            transition: background 0.3s ease, transform 0.2s ease;
        }

        input:focus {
            background: #e0e0e0;
            transform: scale(1.02);
        }

        /* Button */
        button {
            width: 100%;
            padding: 14px;
            background: #000;
            border: none;
            color: #fff;
            font-size: 16px;
            font-weight: 600;
            border-radius: 4px;
            cursor: pointer;
            transition: background 0.3s ease, transform 0.2s ease;
        }

        button:hover {
            background: #333;
            transform: scale(1.05);
        }
        form{
            width: 100%;
        }
        /* Responsive */
        @media (max-width: 768px) {
            .container {
                flex-direction: column;
                height: auto;
                width: 95%;
            }

            .left-section {
                display: none;
            }

            .right-section {
                width: 100%;
                padding: 20px;
            }
        }


    </style>    
</head>
<body>
    <div class="login-container">
        

        <% String error = (String) request.getAttribute("error"); %>
        <% if (error != null) { %>
            <p class="error"><%= error %></p>
        <% } %>

        <form method="post" action="login" class="login-form">
            <h2>Admin Login</h2>
            <label for="username">Username:</label>
            <input type="text" name="username" id="username" required />

            <label for="password">Password:</label>
            <input type="password" name="password" id="password" required />

            <input type="submit" value="Login" />
        </form>
    </div>
</body>
</html>
