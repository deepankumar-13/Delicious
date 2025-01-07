package com.Delicious.Interface;

import java.util.List;

import com.Delicious.Model.Order_items;

public interface Order_itemsDAO {
public int insertOrderItems(Order_items order_item);
public List<Order_items> fetchAllOrders(int id);
}
