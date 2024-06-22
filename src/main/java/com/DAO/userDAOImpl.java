package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.entity.User;
import com.mysql.cj.xdevapi.PreparableStatement;

public class userDAOImpl implements userDAO{
	private Connection connection;

	public userDAOImpl(Connection connection) {
		super();
		this.connection = connection;
	}

	// Registration method
	@Override
	public boolean Register(User us) {
		
		try {
			String q = "insert into user(name,email,phno,password) values (?,?,?,?)";
			
			PreparedStatement ps =  connection.prepareStatement(q);
			ps.setString(1, us.getName());
			ps.setString(2, us.getEmail());
			ps.setString(3, us.getPhno());
			ps.setString(4, us.getPassword());
			
			int i = ps.executeUpdate();
			if(i==1) return true;
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return false;
	}

	
	// Login method
	@Override
	public User login(String email, String password) {
		User us = null;
		
		try {
			
			String sql = "select * from user where email=? and password = ?";
			PreparedStatement ps = connection.prepareStatement(sql);
			ps.setString(1, email);
			ps.setString(2, password);
			
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				us = new User();
				us.setId(rs.getInt(1));
				us.setName(rs.getString(2));
				us.setEmail(rs.getString(3));
				us.setPhno(rs.getString(4));
				us.setPassword(rs.getString(5));
				us.setAddress(rs.getString(6));
				us.setLandmark(rs.getString(7));
				us.setCity(rs.getString(8));
				us.setState(rs.getString(9));
				us.setZip(rs.getString(10));
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return us;
	}

	@Override
	public boolean updateProfile(User us) {
		try {
			String sql = "update user set name=?, email=? , phno=? where id=?";
			PreparedStatement ps = connection.prepareStatement(sql);
			ps.setString(1, us.getName());
			ps.setString(2, us.getEmail());
			ps.setString(3, us.getPhno());
			ps.setInt(4, us.getId());
			
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
	public boolean checkPassword(int id, String password) {
		try {
			String sql = "select * from user where id=? and password=?";
			PreparedStatement ps = connection.prepareStatement(sql);
			ps.setInt(1, id);
			ps.setString(2, password);
			
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				return true;
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return false;
	}

	@Override
	public boolean checkUser(String email) {
		boolean f=true;
		try {
			String sql = "select * from user where email=?";
			PreparedStatement ps = connection.prepareStatement(sql);
			ps.setString(1, email);
			
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				f = false;
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}
	
	
}
