package com.Delicious.Model;

import java.sql.Timestamp;

public class Order {
	private int order_id;
    private int userId;
    private int restaurantId;
    private float totalAmount;
    private String status;
    private String paymentMode;

    
	public int getOrder_id() {
		return order_id;
	}
	public void setOrder_id(int order_id) {
		this.order_id = order_id;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public int getRestaurantId() {
		return restaurantId;
	}
	public void setRestaurantId(int restaurantId) {
		this.restaurantId = restaurantId;
	}
	public float getTotalAmount() {
		return totalAmount;
	}
	public void setTotalAmount(float totalAmount) {
		this.totalAmount = totalAmount;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getPaymentMode() {
		return paymentMode;
	}
	public void setPaymentMode(String paymentMode) {
		this.paymentMode = paymentMode;
	}
	
	
	public Order() {
		super();
	}
	
	
	public Order(int orderId, int userId, int restaurantId, Timestamp orderDate, float totalAmount, String status,String paymentMode) {
		super();
		this.userId = userId;
		this.restaurantId = restaurantId;
		this.totalAmount = totalAmount;
		this.status = status;
		this.paymentMode = paymentMode;
	}
	
	
	@Override
	public String toString() {
		return "Order [order_id=" + order_id + ", userId=" + userId + ", restaurantId=" + restaurantId
				+ ", totalAmount=" + totalAmount + ", status=" + status + ", paymentMode=" + paymentMode + "]";
	}
	
	
	
}
