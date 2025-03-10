<%
    response.sendRedirect("ValidateServlet?name=" + request.getParameter("name") +
                          "&email=" + request.getParameter("email") +
                          "&password=" + request.getParameter("password") +
                          "&loginTime=" + request.getParameter("loginTime"));
%>
