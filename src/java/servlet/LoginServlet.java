package servlet;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

public class LoginServlet extends HttpServlet {

    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/admin_panel";
    private static final String JDBC_USER = "root";
    private static final String JDBC_PASS = "1234";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // Temporary output for debugging
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        try {
            // Ensure JDBC driver is loaded
            Class.forName("com.mysql.cj.jdbc.Driver");

            try (Connection conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASS);
                 PreparedStatement ps = conn.prepareStatement("SELECT * FROM admins WHERE username = ? AND password = ?")) {

                ps.setString(1, username);
                ps.setString(2, password);
                ResultSet rs = ps.executeQuery();

                if (rs.next()) {
                    System.out.println("✅ Login successful for: " + username);
                    HttpSession session = request.getSession();
                    session.setAttribute("admin", username);
                    response.sendRedirect("list"); // Redirect to user list
                } else {
                    System.out.println("❌ Login failed for: " + username);
                    request.setAttribute("error", "Invalid username or password");
                    RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
                    rd.forward(request, response);
                }

            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            out.println("<h3>Error: JDBC Driver not found</h3>");
        } catch (SQLException e) {
            e.printStackTrace();
            out.println("<h3>Database Error: " + e.getMessage() + "</h3>");
        }
    }
}
