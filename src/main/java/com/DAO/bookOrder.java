package com.DAO;

import java.util.List;

import com.entity.orders;

public interface bookOrder {
	public int getOrderNumber();
	
	public boolean saveOrder(List<orders> b);
	
	public List<orders> getOrders(String email);
	
	public List<orders> allOrders();
}
