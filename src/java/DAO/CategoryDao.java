/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DAL.DBContext;
import Model.Category;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public class CategoryDao extends DBContext{
    
     public void deleteCategory(int id) {
        try {
            String sql = "DELETE FROM [dbo].[Category]\n"
                    + "      WHERE categoryid = ?";
            PreparedStatement stm = connect.prepareStatement(sql);
            stm.setInt(1, id);
            stm.executeQuery();
        } catch (SQLException e) {
        }
    }
    
    public void insertCategory(String categoryName) {
        try {
            String sql = "INSERT INTO [dbo].[Category]\n"
                    + "           ([categoryname])\n"
                    + "     VALUES\n"
                    + "           (?)";
            PreparedStatement stm = connect.prepareStatement(sql);
            stm.setString(1, categoryName);
            stm.executeUpdate();
        } catch (SQLException e) {
            System.err.println(e);
        }
    }
    
    public List<Category> paging(int page) {
        List<Category> list = new ArrayList<>();
        String sql = "select * from [Category] order by categoryid asc offset ? rows fetch next 7 rows only";
        try {
            PreparedStatement ps = connect.prepareStatement(sql);
            ps.setInt(1, (page - 1) * 7);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Category category = new Category(rs.getInt(1),
                        rs.getString(2)
                );
                list.add(category);
            }
        } catch (Exception e) {
        }
        return list;
    }
    
    public int getTotalCategory() {
        String sql = "Select count(*) from [Category]";
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
    
    public Category getCategoryByName(String name) {
        String sql = "select * from Category where categoryname=?";
        try {
            PreparedStatement statement = connect.prepareStatement(sql);
            statement.setString(1, name);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Category c = new Category(rs.getInt("categoryid"), rs.getString("categoryname"));
                return c;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }
    
     public Category getCategoryById(int id) {
        String sql = "select * from Category where categoryid=?";
        try {
            PreparedStatement statement = connect.prepareStatement(sql);
            statement.setInt(1, id);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Category c = new Category(rs.getInt("categoryid"), rs.getString("categoryname"));
                return c;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }
     public List<Category> getAll(){
        List<Category> list = new ArrayList<>();
        String sql = "select * from Category";
        try {
            PreparedStatement statement = connect.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {                
                Category c = new Category(rs.getInt("categoryid"), rs.getString("categoryname"));
                list.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
     public static void main(String[] args) {
        CategoryDao dao = new CategoryDao();
        Category test = dao.getCategoryById(3);
         System.out.println(test);
    }
}
