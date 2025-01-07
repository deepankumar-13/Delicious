package com.Delicious.Controler;

import java.util.HashMap;
import java.util.Map;

import com.Delicious.Model.CartItem;

public class Cart {
	
	public Map<Integer,CartItem> items;
	private CartItem existingItem;
	
	public Cart() {
		items=new HashMap<Integer,CartItem>();
	}
	
	public Map<Integer, CartItem> addItem(CartItem item) {
		if(items.containsKey(item.getItemId())) {
			existingItem = items.get(item.getItemId());
			existingItem.setQuantity((existingItem.getQuantity()+item.getQuantity()));  
			
		}
		else {
			items.put(item.getItemId(), item);
		}
		return items;
		
	}
	
	public void updateItem(int itemId,int quantity) {
		if(items.containsKey(itemId)) {
			if(quantity<=0) {
				items.remove(itemId);
			}
			else {
				items.get(itemId).setQuantity(quantity);
			}
		}
		
	}
	
	
	public void remove(int itemId) {
		items.remove(itemId);
	}
	
	public Map<Integer,CartItem> getItems(){
		return items;
	}
	
	public void clear() {
		items.clear();
	}
}
