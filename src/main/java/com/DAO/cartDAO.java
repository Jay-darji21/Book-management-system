package com.DAO;

import java.util.List;

import com.entity.Cart;
import com.entity.bookDtls;

public interface cartDAO {
	public boolean addCart(Cart c);
	
	public List<Cart> getUserBooks(int userId);
	
	public boolean removeBooks(int id,int uid, int cid);
	
	public boolean deletBook(int uid);
}
