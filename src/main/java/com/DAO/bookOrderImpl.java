package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.orders;

public class bookOrderImpl implements bookOrder{
	
	private Connection connection;
	
	public bookOrderImpl(Connection connection) {
		this.connection = connection;
	}

	@Override
	public int getOrderNumber() {
		int i=1;
		try {
			String sql = "select * from orders";
			PreparedStatement ps = connection.prepareStatement(sql);
			
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				i++;
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return i;
	}

	@Override
	public boolean saveOrder(List<orders> blist) {
		boolean flag=false;
		try {
			String sql = "insert into orders(order_id,user_name,email,address,Phone,book_name,Author,price,Payment_mode) values (?,?,?,?,?,?,?,?,?)";
			
			connection.setAutoCommit(false);
			PreparedStatement ps = connection.prepareStatement(sql);
			
			for(orders b : blist) {
				ps.setString(1, b.getOrderId());
				ps.setString(2, b.getUserName());
				ps.setString(3, b.getEmail());
				ps.setString(4, b.getAddress());
				ps.setString(5, b.getPhone());
				ps.setString(6, b.getBook_name());
				ps.setString(7, b.getAuthor());
				ps.setString(8, b.getPrice());
				ps.setString(9, b.getPayment());
				ps.addBatch();
			}
		
			
			int[] count = ps.executeBatch();
			connection.commit();
			flag = true;
			connection.setAutoCommit(true);
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return flag;
	}

	@Override
	public List<orders> getOrders(String email) {
		List<orders> list = new ArrayList<orders>();
		orders o;
		
		try {
			String sql = "select * from orders where email=?";
			PreparedStatement ps = connection.prepareStatement(sql);
			ps.setString(1, email);
			
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				o = new orders();
				o.setOrderId(rs.getString(2));
				o.setUserName(rs.getString(3));
				o.setBook_name(rs.getString(7));
				o.setAuthor(rs.getString(8));
				o.setPrice(rs.getString(9));
				o.setPayment(rs.getString(10));
				list.add(o);
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return list;
	}

	@Override
	public List<orders> allOrders() {
		List<orders> list = new ArrayList<orders>();
		orders o;
		
		try {
			String sql = "select * from orders";
			PreparedStatement ps = connection.prepareStatement(sql);
			
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				o = new orders();
				o.setOrderId(rs.getString(2));
				o.setUserName(rs.getString(3));
				o.setEmail(rs.getString(4));
				o.setAddress(rs.getString(5));
				o.setPhone(rs.getString(6));
				o.setBook_name(rs.getString(7));
				o.setAuthor(rs.getString(8));
				o.setPrice(rs.getString(9));
				o.setPayment(rs.getString(10));
				
				list.add(o);
				
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

}
