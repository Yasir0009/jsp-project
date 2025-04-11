<h2>Admin Login</h2>
<% String error = (String) request.getAttribute("error"); %>
<% if (error != null) {%><p style="color:red;"><%= error%></p><% }%>
<form method="post" action="login">
    Username: <input type="text" name="username" /><br />
    Password: <input type="password" name="password" /><br />
    <input type="submit" value="Login" />
</form>
