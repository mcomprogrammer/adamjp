<%@ page import="javax.servlet.http.*" %>
<%
    // Invalidate the session
    session.invalidate();

    // Delete cookies by setting their max age to 0
    Cookie[] cookies = request.getCookies();
    if (cookies != null) {
        for (Cookie cookie : cookies) {
            cookie.setMaxAge(0); // Set the cookie's max age to 0 to delete it
            response.addCookie(cookie);
        }
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Logout</title>
</head>
<body>
    <h2>You have been logged out.</h2>
    <a href="index.jsp">Go to Home</a>
</body>
</html>
