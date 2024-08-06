/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DAL.DBContext;
import Model.Cart;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public class CartDao extends DBContext {
    
    public void deleteCart(int accountid) {
        String sql = "Delete from [Cart] WHERE accountid = ?";
        try {
            PreparedStatement st = connect.prepareStatement(sql);
            st.setInt(1, accountid);
            st.executeQuery();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    
     public void deleteItemById(int accountid, int productid,int size) {
        String sql = "Delete from [Cart] WHERE accountid = ? and productid = ? and size = ?";
        try {
            PreparedStatement st = connect.prepareStatement(sql);
            st.setInt(1, accountid);
            st.setInt(2, productid);
            st.setInt(3, size);
            st.executeQuery();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    
    public List<Cart> getCartWithUserID(int accountid) {
        List<Cart> list = new ArrayList<>();
        String sql = "select * from Cart where accountid = ?";
        try {
            PreparedStatement st = connect.prepareStatement(sql);
            st.setInt(1, accountid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Cart c = new Cart(rs.getInt("accountid"), rs.getInt("productid"), rs.getInt("quantity"), rs.getInt("size"));
                list.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public Cart checkItemCart(int accountid, int productid) {
        String sql = "Select * from [Cart] WHERE accountid = ? and productid = ?";
        try {
            PreparedStatement pr = connect.prepareStatement(sql);
            pr.setInt(1, accountid);
            pr.setInt(2, productid);
            ResultSet rs = pr.executeQuery();
            if (rs.next()) {
                Cart Cart = new Cart(rs.getInt("accountid"), rs.getInt("productid"), rs.getInt("quantity"), rs.getInt("size"));
                return Cart;
            }
        } catch (SQLException e) {
        }
        return null;
    }
    
    public Cart checkItemCart(int accountid, int productid, int size) {
        String sql = "Select * from [Cart] WHERE accountid = ? and productid = ? and size = ?";
        try {
            PreparedStatement pr = connect.prepareStatement(sql);
            pr.setInt(1, accountid);
            pr.setInt(2, productid);
            pr.setInt(3, size);
            ResultSet rs = pr.executeQuery();
            if (rs.next()) {
                Cart Cart = new Cart(rs.getInt("accountid"), rs.getInt("productid"), rs.getInt("quantity"), rs.getInt("size"));
                return Cart;
            }
        } catch (SQLException e) {
        }
        return null;
    }

    public void insert(int accountid, int productid, int quantity, int size) {
        String sql = "INSERT INTO [dbo].[Cart]\n"
                + "           ([accountid]\n"
                + "           ,[productid]\n"
                + "           ,[quantity]\n"
                + "           ,[size])\n"
                + "     VALUES\n"
                + "           (?,?,?,?)";
        try {
            PreparedStatement st = connect.prepareStatement(sql);
            st.setInt(1, accountid);
            st.setInt(2, productid);
            st.setInt(3, quantity);
            st.setInt(4, size);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void updateCartQuantity(int accountid, int productid, int quantity, int size) {
        String sql = "UPDATE [dbo].[Cart]\n"
                + "   SET [accountid] = ?\n"
                + "      ,[productid] = ?\n"
                + "      ,[quantity] = ?\n"
                + "      ,[size] = ?\n"
                + " WHERE accountid = ? and productid = ?";
        try {
            PreparedStatement ps = connect.prepareStatement(sql);
            ps.setInt(1, accountid);
            ps.setInt(2, productid);
            ps.setInt(3, quantity);
            ps.setInt(4, size);
            ps.setInt(5, accountid);
            ps.setInt(6, productid);

            ps.executeQuery();
        } catch (SQLException e) {
        }
    }

    public static void main(String[] args) {
        CartDao a = new CartDao();
        Cart c = a.checkItemCart(100, 21);
        
    }
}
