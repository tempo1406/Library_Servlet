package fu.edu.library.DAOs;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Statement;

import fu.edu.library.Models.User;

public class UserDAO {

    Connection conn = null;
    Statement st = null;
    PreparedStatement preSt = null;

    public User getUser(String username, String password) throws ClassNotFoundException, SQLException {
        if (conn == null) {
            conn = ConnectDatabase.getMySQLConnection();
        }
        String sql = "SELECT * FROM User WHERE username=? AND password=?";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, username);
        pstm.setString(2, password);
        ResultSet rs = pstm.executeQuery();
        User user = null;
        if (rs.next()) {
            user = new User();
            user.setUsername(rs.getString("username"));
            user.setPassword(rs.getString("password"));
            user.setEmail(rs.getString("email"));
        }
        return user;
    }

    public User findUser(String username) throws ClassNotFoundException, SQLException {
        if (conn == null) {
            conn = ConnectDatabase.getMySQLConnection();
        }
        String sql = "Select * from User where username=?";

        PreparedStatement pstm = (PreparedStatement) conn.prepareStatement(sql);
        pstm.setString(1, username);
        ResultSet rs = pstm.executeQuery();

        while (rs.next()) {
            String id = rs.getString("id");
            String password = rs.getString("password");
            User user = new User();
            user.setId(id);
            user.setUsername(username);
            user.setPassword(password);
            return user;
        }
        return null;
    }

    public boolean addUser(User user) throws ClassNotFoundException, SQLException {
        if (conn == null) {
            conn = ConnectDatabase.getMySQLConnection();
        }

        String email = user.getEmail();
        if (email == null || email.trim().isEmpty()) {
            throw new IllegalArgumentException("Email không thể trống.");
        }

        String sql = "INSERT INTO User (username, password, email) VALUES (?, ?, ?)";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, user.getUsername());
        pstm.setString(2, user.getPassword());
        pstm.setString(3, email);
        int rows = pstm.executeUpdate();
        return rows > 0;
    }

    public boolean isUserExists(String username) throws ClassNotFoundException, SQLException {
        if (conn == null) {
            conn = ConnectDatabase.getMySQLConnection();
        }
        String sql = "SELECT COUNT(*) FROM User WHERE username=?";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, username);
        ResultSet rs = pstm.executeQuery();

        if (rs.next()) {
            return rs.getInt(1) > 0;
        }
        return false;
    }

    public boolean isEmailExists(String email) throws ClassNotFoundException, SQLException {
        if (conn == null) {
            conn = ConnectDatabase.getMySQLConnection();
        }
        String sql = "SELECT COUNT(*) FROM User WHERE email=?";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, email);
        ResultSet rs = pstm.executeQuery();

        if (rs.next()) {
            return rs.getInt(1) > 0;
        }
        return false;
    }

    public boolean saveOTP(String email, String otp, long expiryTime) throws ClassNotFoundException, SQLException {
        if (conn == null) {
            conn = ConnectDatabase.getMySQLConnection();
        }
        String sql = "UPDATE User SET otp=?, otp_expiry=? WHERE email=?";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, otp);
        pstm.setLong(2, expiryTime);
        pstm.setString(3, email);
        int rows = pstm.executeUpdate();
        return rows > 0;
    }

    public long getOTPExpiry(String email) throws ClassNotFoundException, SQLException {
        if (conn == null) {
            conn = ConnectDatabase.getMySQLConnection();
        }
        String sql = "SELECT otp_expiry FROM User WHERE email=?";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, email);
        ResultSet rs = pstm.executeQuery();
        if (rs.next()) {
            return rs.getLong("otp_expiry");
        }
        return 0;
    }

    public String getOTP(String email) throws ClassNotFoundException, SQLException {
        if (conn == null) {
            conn = ConnectDatabase.getMySQLConnection();
        }
        String sql = "SELECT otp FROM User WHERE email=?";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, email);
        ResultSet rs = pstm.executeQuery();
        if (rs.next()) {
            return rs.getString("otp");
        }
        return null;
    }

    public boolean updatePassword(String email, String newPassword) throws ClassNotFoundException, SQLException {
        if (conn == null) {
            conn = ConnectDatabase.getMySQLConnection();
        }
        String sql = "UPDATE User SET password=? WHERE email=?";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, newPassword);
        pstm.setString(2, email);

        int rows = pstm.executeUpdate();

        return rows > 0;
    }

}
