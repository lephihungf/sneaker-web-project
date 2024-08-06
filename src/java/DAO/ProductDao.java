/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DAL.DBContext;
import Model.Category;
import Model.Product;
import Model.Size;
import java.sql.Date;
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
public class ProductDao extends DBContext {
    public void updateSQuantity(int quantity, int flower_id) {
        String sql = "UPDATE [dbo].[Product]\n"
                + "   SET [sold_quantity] = ?\n"
                + " WHERE productid = ?";
        try {
            PreparedStatement ps = connect.prepareStatement(sql);
            ps.setInt(1, quantity);          
            ps.setInt(2, flower_id);
            ps.executeQuery();
        } catch (SQLException e) {
        }
    }

    public void updateProduct(String productname, int cid, Double price, String image, String descrip,int sq,Date date, int id) {
        try {
            String sql = "UPDATE [dbo].[Product]\n"
                    + "   SET [productname] = ?\n"
                    + "      ,[categoryid] = ?\n"
                    + "      ,[price] = ?\n"
                    + "      ,[image] = ?\n"
                    + "      ,[description] = ?\n"
                    + "      ,[sold_quantity] = ?\n"
                    + "      ,[releaseDate] = ?\n"
                    + " WHERE productid = ?";
            PreparedStatement stm = connect.prepareStatement(sql);
            stm.setString(1, productname);
            stm.setInt(2, cid);
            stm.setDouble(3, price);
            stm.setString(4, image);
            stm.setString(5, descrip);
            stm.setInt(6, sq);
            stm.setDate(7, date);
            stm.setInt(8, id);

            stm.executeUpdate();
        } catch (SQLException e) {
            Logger.getLogger(AccountDao.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    public void deleteProduct(int id) {
        try {
            String sql = "DELETE FROM [dbo].[Product]\n"
                    + "      WHERE productid = ?";
            PreparedStatement stm = connect.prepareStatement(sql);
            stm.setInt(1, id);
            stm.executeUpdate();
        } catch (SQLException e) {
            Logger.getLogger(AccountDao.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    public Product getProductLate() {
        String sql = "SELECT TOP 1 * FROM Product ORDER BY productid DESC";

        try {
            PreparedStatement st = connect.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setProductId(rs.getInt("productid"));
                p.setProductName(rs.getString("productname"));
                p.setPrice(rs.getDouble("price"));
                p.setReleaseDate(rs.getDate("releaseDate"));
                p.setDescription(rs.getString("description"));
                p.setSold_quantity(rs.getInt("sold_quantity"));
                p.setImage(rs.getString("image"));
                CategoryDao cDao = new CategoryDao();
                Category c = cDao.getCategoryById(rs.getInt("categoryid"));
                p.setCategory(c);
                return p;

            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public void insertProduct(String productname, int categoryid, double price, String image, String description, int sold_quantity, Date date) {
        try {
            String sql = "INSERT INTO [dbo].[Product]\n"
                    + "           ([productname]\n"
                    + "           ,[categoryid]\n"
                    + "           ,[price]\n"
                    + "           ,[image]\n"
                    + "           ,[description]\n"
                    + "           ,[sold_quantity]\n"
                    + "           ,[releaseDate])\n"
                    + "     VALUES\n"
                    + "           (?,?,?,?,?,?,?)";
            PreparedStatement stm = connect.prepareStatement(sql);
            stm.setString(1, productname);
            stm.setInt(2, categoryid);
            stm.setDouble(3, price);
            stm.setString(4, image);
            stm.setString(5, description);
            stm.setInt(6, sold_quantity);
            stm.setDate(7, date);
            stm.executeUpdate();
        } catch (SQLException e) {
            System.err.println(e);
        }
    }

    public int getTotalProduct() {
        String sql = "Select count(*) from [dbo].[Product]";

        try {
            PreparedStatement st = connect.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
        }
        return 0;
    }

    public int getTotalProductS(String key, int cid) {
        List<Product> list = new ArrayList<>();
        String sql = "select count(*) from Product where 1=1";
        if (key != null && !key.equals("")) {
            sql += " and productname like '%" + key + "%' ";
        }

        if (cid != 0) {
            sql += " and categoryid=" + cid;
        }
        try {
            PreparedStatement st = connect.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
        }
        return 0;
    }

    public List<Product> getProductsTop4() {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT TOP 4 * \n"
                + "FROM Product\n"
                + "ORDER BY sold_quantity DESC";

        try {
            PreparedStatement st = connect.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setProductId(rs.getInt("productid"));
                p.setProductName(rs.getString("productname"));
                p.setPrice(rs.getDouble("price"));
                p.setReleaseDate(rs.getDate("releaseDate"));
                p.setDescription(rs.getString("description"));
                p.setSold_quantity(rs.getInt("sold_quantity"));
                p.setImage(rs.getString("image"));
                CategoryDao cDao = new CategoryDao();
                Category c = cDao.getCategoryById(rs.getInt("categoryid"));
                p.setCategory(c);
                list.add(p);

            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public Product getProductsByCId(int id) {

        String sql = "SELECT [productid]\n"
                + "      ,[productname]\n"
                + "      ,[categoryid]\n"
                + "      ,[price]\n"
                + "      ,[image]\n"
                + "      ,[description]\n"
                + "      ,[sold_quantity]\n"
                + "      ,[releaseDate]\n"
                + "  FROM [dbo].[Product]"
                + " where categoryid = " + id;

        try {
            PreparedStatement st = connect.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setProductId(rs.getInt("productid"));
                p.setProductName(rs.getString("productname"));
                p.setPrice(rs.getDouble("price"));
                p.setReleaseDate(rs.getDate("releaseDate"));
                p.setDescription(rs.getString("description"));
                p.setSold_quantity(rs.getInt("sold_quantity"));
                p.setImage(rs.getString("image"));
                CategoryDao cDao = new CategoryDao();
                Category c = cDao.getCategoryById(rs.getInt("categoryid"));
                p.setCategory(c);
                return p;

            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public Product getProductsById(int id) {

        String sql = "SELECT [productid]\n"
                + "      ,[productname]\n"
                + "      ,[categoryid]\n"
                + "      ,[price]\n"
                + "      ,[image]\n"
                + "      ,[description]\n"
                + "      ,[sold_quantity]\n"
                + "      ,[releaseDate]\n"
                + "  FROM [dbo].[Product]"
                + " where productid = " + id;

        try {
            PreparedStatement st = connect.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setProductId(rs.getInt("productid"));
                p.setProductName(rs.getString("productname"));
                p.setPrice(rs.getDouble("price"));
                p.setReleaseDate(rs.getDate("releaseDate"));
                p.setDescription(rs.getString("description"));
                p.setSold_quantity(rs.getInt("sold_quantity"));
                p.setImage(rs.getString("image"));
                CategoryDao cDao = new CategoryDao();
                Category c = cDao.getCategoryById(rs.getInt("categoryid"));
                p.setCategory(c);
                return p;

            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public List<Product> searchArrange(String key, int cid, String arange, int index) {
        List<Product> list = new ArrayList<>();
        String sql = "select * from Product where 1=1";
        if (key != null && !key.equals("")) {
            sql += " and productname like '%" + key + "%' ";
        }

        if (cid != 0) {
            sql += " and categoryid=" + cid;
        }
        if (arange.equals("latest")) {
            sql += " ORDER BY [releaseDate] DESC";
        }
        if (arange.equals("cheapest")) {
            sql += " ORDER BY [price] ";
        }
        if (arange.equals("expensive")) {
            sql += " ORDER BY [price] DESC";
        }
        sql += " offset ? rows fetch next 6 rows only";
        try {
            PreparedStatement st = connect.prepareStatement(sql);
            st.setInt(1, (index - 1) * 6);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setProductId(rs.getInt("productid"));
                p.setProductName(rs.getString("productname"));
                p.setPrice(rs.getDouble("price"));
                p.setReleaseDate(rs.getDate("releaseDate"));
                p.setImage(rs.getString("image"));
                p.setDescription(rs.getString("description"));
                p.setSold_quantity(rs.getInt("sold_quantity"));
                CategoryDao CDao = new CategoryDao();
                Category c = CDao.getCategoryById(rs.getInt("categoryid"));
                p.setCategory(c);
                list.add(p);
            }
        } catch (SQLException e) {
        }

        return list;
    }

    public List<Product> search(String key, int cid, int index) {
        List<Product> list = new ArrayList<>();
        String sql = "select * from Product where 1=1";
        if (key != null && !key.equals("")) {
            sql += " and productname like '%" + key + "%' ";
        }

        if (cid != 0) {
            sql += " and categoryid=" + cid;
        }
if (index != 0) {
        sql += " order by productid asc offset ? rows fetch next 6 rows only";
}
        try {
            PreparedStatement st = connect.prepareStatement(sql);
            if (index != 0) {
            st.setInt(1, (index - 1) * 6);
            }
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setProductId(rs.getInt("productid"));
                p.setProductName(rs.getString("productname"));
                p.setPrice(rs.getDouble("price"));
                p.setReleaseDate(rs.getDate("releaseDate"));
                p.setImage(rs.getString("image"));
                p.setDescription(rs.getString("description"));
                p.setSold_quantity(rs.getInt("sold_quantity"));
                CategoryDao CDao = new CategoryDao();
                Category c = CDao.getCategoryById(rs.getInt("categoryid"));
                p.setCategory(c);
                list.add(p);
            }
        } catch (SQLException e) {
        }

        return list;
    }

    public List<Product> paging(int page) {
        List<Product> list = new ArrayList<>();
        String sql = "select * from [Product] order by productid asc offset ? rows fetch next 6 rows only";

        try {
            PreparedStatement ps = connect.prepareStatement(sql);
            ps.setInt(1, (page - 1) * 6);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setProductId(rs.getInt("productid"));
                p.setProductName(rs.getString("productname"));
                p.setPrice(rs.getDouble("price"));
                p.setReleaseDate(rs.getDate("releaseDate"));
                p.setImage(rs.getString("image"));
                p.setDescription(rs.getString("description"));
                p.setSold_quantity(rs.getInt("sold_quantity"));
                CategoryDao CDao = new CategoryDao();
                Category c = CDao.getCategoryById(rs.getInt("categoryid"));
                p.setCategory(c);
                list.add(p);
            }
        } catch (Exception e) {
        }
        return list;
    }

    public static void main(String[] args) {
        ProductDao dao = new ProductDao();

        String arange = "latest";
        List<Product> p = dao.search("", 0, 0);
        for (Product product : p) {
            System.out.println(product);
        }

    }
}
