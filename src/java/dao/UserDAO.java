package dao;

import model.User;
import java.sql.*;
import java.util.*;

public class UserDAO {

    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/admin_panel";
    private static final String JDBC_USER = "root";
    private static final String JDBC_PASS = "1234";

    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver"); // Ensure JDBC driver is loaded
            System.out.println("✅ JDBC Driver loaded successfully");
        } catch (ClassNotFoundException e) {
            System.err.println("❌ JDBC Driver not found");
            e.printStackTrace();
        }
    }

    // ✅ Get all users
    public static List<User> getAllUsers() {
        List<User> users = new ArrayList<>();
        String query = "SELECT * FROM users";

        try (
            Connection conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASS);
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(query)
        ) {
            while (rs.next()) {
                User user = new User(
                    rs.getInt("id"),
                    rs.getString("name"),
                    rs.getString("email")
                );
                users.add(user);
            }
            System.out.println("📦 Users retrieved: " + users.size());
        } catch (SQLException e) {
            System.err.println("❌ Error in getAllUsers()");
            e.printStackTrace();
        }

        return users;
    }

    // ✅ Get user by ID
    public static User getUser(int id) {
        String query = "SELECT * FROM users WHERE id = ?";
        try (
            Connection conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASS);
            PreparedStatement ps = conn.prepareStatement(query)
        ) {
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                return new User(
                    rs.getInt("id"),
                    rs.getString("name"),
                    rs.getString("email")
                );
            }
        } catch (SQLException e) {
            System.err.println("❌ Error in getUser()");
            e.printStackTrace();
        }
        return null;
    }

    // ✅ Add user
    public static void addUser(User user) {
        String query = "INSERT INTO users (name, email) VALUES (?, ?)";
        try (
            Connection conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASS);
            PreparedStatement ps = conn.prepareStatement(query)
        ) {
            ps.setString(1, user.getName());
            ps.setString(2, user.getEmail());
            ps.executeUpdate();
            System.out.println("✅ User added: " + user.getName());
        } catch (SQLException e) {
            System.err.println("❌ Error in addUser()");
            e.printStackTrace();
        }
    }

    // ✅ Update user
    public static void updateUser(User user) {
        String query = "UPDATE users SET name = ?, email = ? WHERE id = ?";
        try (
            Connection conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASS);
            PreparedStatement ps = conn.prepareStatement(query)
        ) {
            ps.setString(1, user.getName());
            ps.setString(2, user.getEmail());
            ps.setInt(3, user.getId());
            ps.executeUpdate();
            System.out.println("✏️ User updated: ID = " + user.getId());
        } catch (SQLException e) {
            System.err.println("❌ Error in updateUser()");
            e.printStackTrace();
        }
    }

    // ✅ Delete user
    public static void deleteUser(int id) {
        String query = "DELETE FROM users WHERE id = ?";
        try (
            Connection conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASS);
            PreparedStatement ps = conn.prepareStatement(query)
        ) {
            ps.setInt(1, id);
            ps.executeUpdate();
            System.out.println("🗑️ User deleted: ID = " + id);
        } catch (SQLException e) {
            System.err.println("❌ Error in deleteUser()");
            e.printStackTrace();
        }
    }
}
