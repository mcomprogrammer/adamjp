<!DOCTYPE html>
<html>
<head>
    <title>Registration</title>
</head>
<body>
    <h2>Register for Event</h2>

    <form name="regForm" action="ValidateServlet" method="get">  <!-- Updated action -->
        Name: <input type="text" name="name" required><br><br>
        Email: <input type="email" name="email" required><br><br>
        Password: <input type="password" name="password" required><br><br>
        <input type="hidden" name="loginTime" value="<%= new java.util.Date().toString() %>">
        <input type="submit" value="Register">
    </form>

    <%
        String error = request.getParameter("error");
        if ("1".equals(error)) {
            out.println("<p style='color:red;'>Error: All fields are required!</p>");
        }
    %>
</body>
</html>
