package com.servletpkg;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Cookie;

@WebServlet("/ValidateServlet")
public class ValidateServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String loginTime = request.getParameter("loginTime");

        // Validate form data
        if (name == null || name.isEmpty() || email == null || email.isEmpty() || password == null || password.isEmpty()) {
            response.sendRedirect("register.jsp?error=1");
            return;
        }

        // Store data in session
        HttpSession session = request.getSession();
        session.setAttribute("username", name);
        session.setAttribute("email", email);
        session.setAttribute("loginTime", loginTime);

        // Create cookies
        Cookie nameCookie = new Cookie("username", name);
        Cookie emailCookie = new Cookie("email", email);

        // Set expiration time (1 hour)
        nameCookie.setMaxAge(60 * 60);
        emailCookie.setMaxAge(60 * 60);

        // Add cookies to response
        response.addCookie(nameCookie);
        response.addCookie(emailCookie);

        // Redirect to dashboard after successful validation
        response.sendRedirect("dashboard.jsp");
    }
}

