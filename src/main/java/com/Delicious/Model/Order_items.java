package com.Delicious.Model;

public class Order_items {
	private int order_itemid;
	private int order_id;
	private int menu_id;
	private int quantity;
	private float items_total;
	
	
	public int getOrder_itemid() {
		return order_itemid;
	}
	public void setOrder_itemid(int order_itemid) {
		this.order_itemid = order_itemid;
	}
	public int getOrder_id() {
		return order_id;
	}
	public void setOrder_id(int order_id) {
		this.order_id = order_id;
	}
	public int getMenu_id() {
		return menu_id;
	}
	public void setMenu_id(int menu_id) {
		this.menu_id = menu_id;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public float getItems_total() {
		return items_total;
	}
	public void setItems_total(float items_total) {
		this.items_total = items_total;
	}
	
	public Order_items() {
		super();
	}
	
	
	public Order_items(int order_itemid, int order_id, int menu_id, int quantity, float items_total) {
		super();
		this.order_itemid = order_itemid;
		this.order_id = order_id;
		this.menu_id = menu_id;
		this.quantity = quantity;
		this.items_total = items_total;
	}
	
	
	@Override
	public String toString() {
		return "Order_items [order_itemid=" + order_itemid + ", order_id=" + order_id + ", menu_id=" + menu_id
				+ ", quantity=" + quantity + ", items_total=" + items_total + "]";
	}
	
	
	
}
