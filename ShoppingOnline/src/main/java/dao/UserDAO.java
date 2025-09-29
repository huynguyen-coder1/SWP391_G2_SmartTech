/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import connect.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.sql.Date;
import java.sql.SQLIntegrityConstraintViolationException;
import model.User;

/**
 *
 * @author LaptopTV.vn
 */
public class UserDAO {

    public int getTotalUsers() {
        String sql = "SELECT COUNT(*) FROM [User]";
        try (Connection conn = DBConnection.getConnection(); PreparedStatement ps = conn.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    public List<User> getRecentRegisteredUsers(int limit) {
        List<User> users = new ArrayList<>();
        String sql = "SELECT TOP (?) * FROM [User] ORDER BY CreatedAt DESC";

        try (Connection conn = DBConnection.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, limit);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                User u = new User();
                u.setUserID(rs.getInt("UserID"));
                u.setFullName(rs.getString("FullName"));
                u.setEmail(rs.getString("Email"));
                u.setPhone(rs.getString("Phone"));
                u.setCreatedAt(rs.getTimestamp("CreatedAt"));
                users.add(u);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return users;
    }

    public boolean insertUser(User user) {
        String sql = "INSERT INTO [User] (Email, FullName, Phone, PasswordHash, DateOfBirth, IsActive, CreatedAt, UpdatedAt) "
                + "VALUES (?, ?, ?, ?, ?, ?, GETDATE(), GETDATE())";
        try (Connection conn = DBConnection.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, user.getEmail());
            ps.setString(2, user.getFullName());
            ps.setString(3, user.getPhone());
            ps.setString(4, user.getPasswordHash());
            ps.setDate(5, user.getDateOfBirth() != null ? new java.sql.Date(user.getDateOfBirth().getTime()) : null);
            ps.setBoolean(6, user.isActive());

            return ps.executeUpdate() > 0;

        } catch (SQLIntegrityConstraintViolationException e) {
            System.out.println("❌ Email đã tồn tại trong hệ thống.");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public List<User> getAllUsers() {
        List<User> list = new ArrayList<>();
        String sql = "SELECT * FROM [User]";

        try (Connection conn = DBConnection.getConnection(); PreparedStatement ps = conn.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                User u = new User();
                u.setUserID(rs.getInt("UserID"));
                u.setEmail(rs.getString("Email"));
                u.setFullName(rs.getString("FullName"));
                u.setPhone(rs.getString("Phone"));
                u.setActive(rs.getBoolean("IsActive"));  // chú ý: đúng tên cột
                u.setPasswordHash(rs.getString("PasswordHash")); // đúng tên cột
                u.setDateOfBirth(rs.getDate("DateOfBirth"));
                u.setCreatedAt(rs.getTimestamp("CreatedAt"));

                // KHÔNG GỌI u.setRoles(...)
                list.add(u);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }
}
