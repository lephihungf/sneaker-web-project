/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DAL.DBContext;
import Model.OrderDetail;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public class OrderDetailDao extends DBContext {
    
    public List<OrderDetail> getAllWithOrderID(int order_id) {
        String sql = "SELECT * FROM [dbo].[order_detail] where [orderid] = ?";
        List<OrderDetail> list = new ArrayList<>();
        try {
            PreparedStatement ps = connect.prepareStatement(sql);
            ps.setInt(1, order_id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                OrderDetail orderDetail = new OrderDetail(rs.getInt("orderdetailid"), rs.getInt("orderid"), rs.getInt("productid"), rs.getInt("quantity"), rs.getInt("size"));
                list.add(orderDetail);
            }
        } catch (Exception e) {
        }
        return list;
    }

    public void addToOrderDetail(int order_id, int flower_id, int quantity,int size) {
        String sql = "INSERT INTO [dbo].[Order_Detail]\n"
                + "           ([orderid]\n"
                + "           ,[productid]\n"
                + "           ,[quantity]\n"
                + "           ,[size])\n"
                + "     VALUES\n"
                + "           (?,?,?,?)";

        try {
            PreparedStatement ps = connect.prepareStatement(sql);
            ps.setInt(1, order_id);
            ps.setInt(2, flower_id);
            ps.setInt(3, quantity);
            ps.setInt(4, size);
            ps.executeUpdate();
        } catch (SQLException e) {
        }
    }
}
