package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.DB.DBconnect;
import com.entity.Cart;
import com.entity.bookDtls;

public class cartDAOImpl implements cartDAO{
	
	private Connection connection;
	
	public cartDAOImpl(Connection connection){
		this.connection = connection;
	}

	@Override
	public boolean addCart(Cart c) {
		
		try {
			String sql = "insert into cart(book_id,user_id,book_name,author_name,price,total_price) values (?,?,?,?,?,?)";
			PreparedStatement ps = connection.prepareStatement(sql);
			ps.setInt(1, c.getBookId());
			ps.setInt(2, c.getUserId());
			ps.setString(3, c.getBookName());
			ps.setString(4, c.getAuthorName());
			ps.setDouble(5, c.getPrice());
			ps.setDouble(6, c.getTotal_price());
			
			int i = ps.executeUpdate();
			if(i==1) {
				return true;
			}
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		return false;
	}

	@Override
	public List<Cart> getUserBooks(int userId) {
		List<Cart> list = new ArrayList<Cart>();
		Cart b;
		
		try {
			String sql = "select * from cart where user_id = ?";
			PreparedStatement ps = connection.prepareStatement(sql);
			ps.setInt(1, userId);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				b = new Cart();
				b.setBookName(rs.getString(4));
				b.setAuthorName(rs.getString(5));
				b.setPrice(rs.getDouble(6));
				b.setBookId(rs.getInt(2));
				b.setUserId(rs.getInt(3));
				b.setCartId(rs.getInt(1));
				list.add(b);
			}
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return list;
	}

	@Override
	public boolean removeBooks(int id, int uid , int cid) {
		try {
			String sql = "delete from cart where book_id=? && user_id=? && cart_id=?";
			PreparedStatement ps = connection.prepareStatement(sql);
			ps.setInt(1, id);
			ps.setInt(2, uid);
			ps.setInt(3, cid);
			
			int i = ps.executeUpdate();
			if(i==1) {
				return true;
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return false;
	}

	@Override
	public boolean deletBook(int uid) {
		try {
			String sql = "delete from cart where user_id=?";
			PreparedStatement ps = connection.prepareStatement(sql);
			ps.setInt(1, uid);
			
			int i = ps.executeUpdate();
			if(i==1) {
				return true;
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

}
