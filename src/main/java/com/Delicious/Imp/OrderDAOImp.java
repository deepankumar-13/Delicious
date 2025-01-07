package com.Delicious.Imp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.Delicious.DbConnection.MyDatabaseConnection;
import com.Delicious.Interface.OrderDAO;
import com.Delicious.Model.Order;

public class OrderDAOImp implements OrderDAO {
    private static final String INSERTORDERS = "INSERT INTO ORDERS(user_id,restaurant_id,totalAmount,status,paymentMode) VALUES(?,?,?,?,?)";
    private static final String ALLORDERS ="SELECT ORDER_ID FROM ORDERS WHERE USER_ID=?";
    private static Connection con;
    
    static {
        con = MyDatabaseConnection.connect();
    }

    private PreparedStatement pstmt;
	private ResultSet resultSet;
    
    @Override
    public int insertOrder(Order order) {
        try {
            pstmt = con.prepareStatement(INSERTORDERS);
            pstmt.setInt(1, order.getUserId());
            pstmt.setInt(2, order.getRestaurantId());
            pstmt.setFloat(3, order.getTotalAmount());
            pstmt.setString(4, order.getStatus());
            pstmt.setString(5, order.getPaymentMode());
            int rowsAffected = pstmt.executeUpdate();
            
            if (rowsAffected > 0) {
                System.out.println("Order inserted successfully.");
            }
            return rowsAffected;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }
    List<Order> orderlist = new ArrayList<Order>();
    public List<Order> getOrders(int id) {
    	try {
    		
			pstmt = con.prepareStatement(ALLORDERS);
			pstmt.setInt(1,id);
			resultSet = pstmt.executeQuery();
			while(resultSet.next()) {
				System.out.println(resultSet.getInt("order_id"));
				Order order = new Order();
				order.setOrder_id(resultSet.getInt("order_id"));
				orderlist.add(order);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return orderlist;
    }
}
