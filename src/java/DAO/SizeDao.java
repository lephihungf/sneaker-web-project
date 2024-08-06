/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DAL.DBContext;
import Model.Category;
import Model.Size;
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
public class SizeDao extends DBContext {
    
    public void updateQuantitySize(int quantity, int size, int flower_id) {
        String sql = "UPDATE [dbo].[Size]\n"
                    + "   SET ,[quantity] = ?\n"
                    + " WHERE productid = ? and size = ?";
        try {
            PreparedStatement ps = connect.prepareStatement(sql);
            ps.setInt(1, quantity);
            ps.setInt(2, flower_id);
            ps.setInt(3, size);
            ps.executeQuery();
        } catch (SQLException e) {
        }
    }
    
    

    public void updateSize( int pid, int q , int s) {
        try {
            String sql = "UPDATE [dbo].[Size]\n"
                    + "   SET [productid] = ?\n"
                    + "      ,[quantity] = ?\n"
                    + "      ,[size] = ?\n"
                    + " WHERE productid = ? and size = ?";
            PreparedStatement stm = connect.prepareStatement(sql);
            stm.setInt(1, pid);
            stm.setInt(2, q);
            stm.setInt(3, s);
            stm.setInt(4, pid);
            stm.setInt(5, s);
            

            stm.executeUpdate();
        } catch (SQLException e) {
            Logger.getLogger(AccountDao.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    public void deleteSize(int id) {
        try {
            String sql = "DELETE FROM [dbo].[Size]\n"
                    + "      WHERE productid = ?";
            PreparedStatement stm = connect.prepareStatement(sql);
            stm.setInt(1, id);
            stm.executeUpdate();
        } catch (SQLException e) {
            Logger.getLogger(AccountDao.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    public void insertSize(int productid, int quantity, int size) {
        try {
            String sql = "INSERT INTO [dbo].[Size]\n"
                    + "           ([productid]\n"
                    + "           ,[quantity]\n"
                    + "           ,[size])\n"
                    + "     VALUES\n"
                    + "           (?,?,?)";
            PreparedStatement stm = connect.prepareStatement(sql);
            stm.setInt(1, productid);
            stm.setInt(2, quantity);
            stm.setInt(3, size);
            stm.executeUpdate();
        } catch (SQLException e) {
            System.err.println(e);
        }
    }

    public List<Size> getSizes() {
        List<Size> list = new ArrayList<>();
        String sql = "select * from Size ";
        try {
            PreparedStatement st = connect.prepareStatement(sql);

            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Size z = new Size();
                z.setSizeid(rs.getInt("sizeid"));
                z.setSize(rs.getInt("size"));
                z.setProductid(rs.getInt("productid"));
                z.setQuantity(rs.getInt("quantity"));
                list.add(z);

            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Size> getSumQuantity() {
        List<Size> list = new ArrayList<>();
        String sql = "select SUM( quantity) as quantitysum,  productid  from Size group by productid";
        try {
            PreparedStatement st = connect.prepareStatement(sql);

            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Size z = new Size();
                z.setProductid(rs.getInt("productid"));
                z.setQuantity(rs.getInt("quantitysum"));
                list.add(z);

            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
    
    public List<Size> getSizeByPid(int zid) {
        List<Size> list = new ArrayList<>();
        String sql = "select * from Size where productid = ?";
        try {
            PreparedStatement st = connect.prepareStatement(sql);
            st.setInt(1, zid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Size z = new Size();
                z.setSizeid(rs.getInt("sizeid"));
                z.setSize(rs.getInt("size"));
                z.setProductid(rs.getInt("productid"));
                z.setQuantity(rs.getInt("quantity"));
                list.add(z);

            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public Size getSize(int pid, int size) {
        
        String sql = "select * from Size where productid = ? and size = ?";
        try {
            PreparedStatement st = connect.prepareStatement(sql);
            st.setInt(1, pid);
            st.setInt(2, size);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Size z = new Size();
                z.setSizeid(rs.getInt("sizeid"));
                z.setSize(rs.getInt("size"));
                z.setProductid(rs.getInt("productid"));
                z.setQuantity(rs.getInt("quantity"));
                return z;

            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public static void main(String[] args) {
        SizeDao dao = new SizeDao();
        List<Size> list = dao.getSumQuantity();
        for (Size size : list) {
            System.out.println(size);
        }

    }
}
