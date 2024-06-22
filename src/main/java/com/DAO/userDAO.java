package com.DAO;

import com.entity.User;

public interface userDAO {
	public boolean Register(User us);
	public User login(String email, String password);
	
	public boolean updateProfile(User us);
	
	public boolean checkPassword(int id, String password);
	
	public boolean checkUser(String email);
}
