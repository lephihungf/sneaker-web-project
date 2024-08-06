/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DAL.DBContext;
import Model.Account;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Admin
 */
public class AccountDao extends DBContext {
    
    public void deleteAccount(int id) {
        try {
            String sql = "DELETE FROM [dbo].[Account]\n"
                    + "      WHERE accountid = ?";
            PreparedStatement stm = connect.prepareStatement(sql);
            stm.setInt(1, id);
            stm.executeUpdate();
        } catch (SQLException e) {
            Logger.getLogger(AccountDao.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    public void UpdaterRole(int id) {
        String sql = "UPDATE [dbo].[Account]\n"
                + "   SET [role] = 1     \n"
                + " WHERE accountid = ?";
        
        try {
            PreparedStatement stm = connect.prepareStatement(sql);
            stm.setInt(1, id);
            stm.executeUpdate();
            
            
        } catch (Exception e) {
        }
        
    }

    public Account getAccountById(int id) {
        String sql = "select * from Account where accountid = ?";
        Account account = new Account();
        try {
            PreparedStatement stm = connect.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                account = new Account(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(7),
                        rs.getString(8),
                        rs.getInt(9),
                        rs.getString(10)
                );
                return account;
            }
        } catch (Exception e) {
        }
        return null;
    }

    public List<Account> paging(int page) {
        List<Account> list = new ArrayList<>();
        String sql = "select * from [Account] order by accountid asc offset ? rows fetch next 7 rows only";
        try {
            PreparedStatement ps = connect.prepareStatement(sql);
            ps.setInt(1, (page - 1) * 7);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Account account = new Account(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(7),
                        rs.getString(8),
                        rs.getInt(9),
                        rs.getString(10)
                );
                list.add(account);
            }
        } catch (Exception e) {
        }
        return list;
    }

    public int getTotalAccount() {
        String sql = "Select count(*) from [Account]";
        try {
            PreparedStatement pr = connect.prepareStatement(sql);
            ResultSet rs = pr.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
        }
        return 0;
    }

    public void updateAccount(Account account) {
        try {
            String sql = "UPDATE [dbo].[Account]\n"
                    + "   SET [username] = ?\n"
                    + "      ,[password] =? \n"
                    + "      ,[fullname] = ?\n"
                    + "      ,[phone] = ?\n"
                    + "      ,[address] =? \n"
                    + "      ,[gender] = ?\n"
                    + "      ,[email] = ?\n"
                    + "      ,[role] = ?\n"
                    + "      ,[avatar] = ?\n"
                    + " WHERE accountid = ?";
            PreparedStatement stm = connect.prepareStatement(sql);
            stm.setString(1, account.getUsername());
            stm.setString(2, account.getPassword());
            stm.setString(3, account.getFullname());
            stm.setString(4, account.getPhone());
            stm.setString(5, account.getAddress());
            stm.setInt(6, account.getGender());
            stm.setString(7, account.getEmail());
            stm.setInt(8, account.getRole());
            stm.setString(9, account.getAvatar());
            stm.setInt(10, account.getAccountId());
            stm.executeUpdate();
        } catch (SQLException e) {
            Logger.getLogger(AccountDao.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    public void insertAccount(String username, String password, String fullname, String phone, String address, int gender, String email, int role, String image) {
        try {
            String sql = "INSERT INTO [dbo].[Account]\n"
                    + "           ([username]\n"
                    + "           ,[password]\n"
                    + "           ,[fullname]\n"
                    + "           ,[phone]\n"
                    + "           ,[address]\n"
                    + "           ,[gender]\n"
                    + "           ,[email]\n"
                    + "           ,[role]\n"
                    + "           ,[avatar])\n"
                    + "     VALUES\n"
                    + "           (?,?,?,?,?,?,?,?,?)";
            PreparedStatement st = connect.prepareStatement(sql);
            st.setString(1, username);
            st.setString(2, password);
            st.setString(3, fullname);
            st.setString(4, phone);
            st.setString(5, address);
            st.setInt(6, gender);
            st.setString(7, email);
            st.setInt(8, role);
            st.setString(9, image);
            st.executeUpdate();
        } catch (SQLException e) {
            System.err.println(e);
        }
    }

    public Account checkAccountExist(String email) {
        String sql = "select * from [Account]\n"
                + "where email = ?\n";

        try {
            PreparedStatement st = connect.prepareStatement(sql);
            st.setString(1, email);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return new Account(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(7),
                        rs.getString(8),
                        rs.getInt(9),
                        rs.getString(10)
                );
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public Account checkLogin(String email, String password) {
        String sql = "select * from Account where email = ? and password = ?";
        try {
            PreparedStatement st = connect.prepareStatement(sql);
            st.setString(1, email);
            st.setString(2, password);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {

                Account account = new Account(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(7),
                        rs.getString(8),
                        rs.getInt(9),
                        rs.getString(10)
                );
                return account;
            }
        } catch (SQLException e) {
            System.err.println(e);
        }
        return null;
    }
    public static void main(String[] args) {
        AccountDao dao = new AccountDao();
        dao.UpdaterRole(10);
    }
}
