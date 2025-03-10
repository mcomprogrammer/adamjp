<%@ page import="javax.servlet.http.*, java.util.*" %>
<%
    String username = (String) session.getAttribute("username");
    String email = (String) session.getAttribute("email");
    String loginTime = (String) session.getAttribute("loginTime");

    if (username == null || email == null) {
        // Redirect to the registration page if the session data is missing
        response.sendRedirect("register.jsp");
        return; // End further execution
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Dashboard</title>
</head>
<body>
    <h2>Welcome, <%= username %>!</h2>
    <p>Email: <%= email %></p>
    <p>Login Time: <%= loginTime %></p>

    <h3>Your Stored Cookies:</h3>
    <ul>
    <%
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                out.println("<li>" + cookie.getName() + " = " + cookie.getValue() + "</li>");
            }
        }
    %>
    </ul>

    <a href="logout.jsp">Logout</a>
</body>
</html>
