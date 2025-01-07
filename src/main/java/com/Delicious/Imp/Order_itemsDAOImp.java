package com.Delicious.Imp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.Delicious.DbConnection.MyDatabaseConnection;
import com.Delicious.Interface.Order_itemsDAO;
import com.Delicious.Model.Order_items;

public class Order_itemsDAOImp implements Order_itemsDAO {

    private static final String INSERT_ORDER_ITEMS = "INSERT INTO order_items(ORDER_ID,MENU_ID,QUANTITY,ITEM_TOTAL) VALUES(?, ?, ?, ?)";
    private static final String FETCHALLORDERS = "SELECT* FROM ORDER_ITEMS WHERE ORDER_ID = ?";
    private static Connection con;

    static {
        con = MyDatabaseConnection.connect();
    }

    private PreparedStatement pstmt;
	private ResultSet resultSet;

    @Override
    public int insertOrderItems(Order_items order_item) {
        try {
            pstmt = con.prepareStatement(INSERT_ORDER_ITEMS);
            pstmt.setInt(1, order_item.getOrder_id());
            pstmt.setInt(2, order_item.getMenu_id());
            pstmt.setInt(3, order_item.getQuantity());
            pstmt.setFloat(4, order_item.getItems_total());

            int rowsAffected = pstmt.executeUpdate();
            if (rowsAffected > 0) {
                System.out.println("Order_items inserted successfully.");
            }
            return rowsAffected;
        } catch (SQLException e) {
            System.err.println("Error inserting order items: " + e.getMessage());
            e.printStackTrace();
        }
        return 0;
    }

	@Override
	public List<Order_items> fetchAllOrders(int id) {
		List<Order_items> ordereditems = new ArrayList<Order_items>();
		try {
			pstmt = con.prepareStatement(FETCHALLORDERS);
			pstmt.setInt(1,id);
			resultSet = pstmt.executeQuery();
			while(resultSet.next()) {
				Order_items orderitem = new Order_items();
				orderitem.setOrder_id(resultSet.getInt("order_id"));
				orderitem.setMenu_id(resultSet.getInt("menu_id"));
				orderitem.setQuantity(resultSet.getInt("quantity"));
				orderitem.setItems_total(resultSet.getFloat("item_total"));
				ordereditems.add(orderitem);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return ordereditems;
		
	}
}
