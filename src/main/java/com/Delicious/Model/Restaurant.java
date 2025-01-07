package com.Delicious.Model;

public class Restaurant {
	
	private int restaurant_id;
	private String restaurant_name;
	private String cusinetype;
	private String delivarytime;
	private String address;
	private float ratings;
	public int getRestaurant_id() {
		return restaurant_id;
	}
	public void setRestaurant_id(int restaurant_id) {
		this.restaurant_id = restaurant_id;
	}
	public String getRestaurant_name() {
		return restaurant_name;
	}
	public void setRestaurant_name(String restaurant_name) {
		this.restaurant_name = restaurant_name;
	}
	public String getCusinetype() {
		return cusinetype;
	}
	public void setCusinetype(String cusinetype) {
		this.cusinetype = cusinetype;
	}
	public String getDelivarytime() {
		return delivarytime;
	}
	public void setDelivarytime(String delivarytime) {
		this.delivarytime = delivarytime;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public float getRatings() {
		return ratings;
	}
	public void setRatings(float ratings) {
		this.ratings = ratings;
	}
	
	public Restaurant() {
		super();
	}
	
	public Restaurant(int restaurant_id, String restaurant_name, String cusinetype, String delivarytime, String address,
			float ratings) {
		super();
		this.restaurant_id = restaurant_id;
		this.restaurant_name = restaurant_name;
		this.cusinetype = cusinetype;
		this.delivarytime = delivarytime;
		this.address = address;
		this.ratings = ratings;
	}
	
	@Override
	public String toString() {
		return "Restaurant [restaurant_id=" + restaurant_id + ", restaurant_name=" + restaurant_name + ", cusinetype="
				+ cusinetype + ", delivarytime=" + delivarytime + ", address=" + address + ", ratings=" + ratings + "]";
	}
	
	
}
