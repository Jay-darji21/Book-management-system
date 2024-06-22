package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.bookDtls;

public class booksImpl implements books {
	private Connection connection;

	public booksImpl(Connection connection) {
		super();
		this.connection = connection;
	}

	@Override
	public boolean addBook(bookDtls b) {

		try {
			String sql = "Insert into book_details (book_name,author,price,bookCategory,status,photo,user_email) values (?,?,?,?,?,?,?)";
			PreparedStatement ps = connection.prepareStatement(sql);
			ps.setString(1, b.getBookName());
			ps.setString(2, b.getAuthor());
			ps.setString(3, b.getPrice());
			ps.setString(4, b.getCategory());
			ps.setString(5, b.getStatus());
			ps.setString(6, b.getPhotoName());
			ps.setString(7, b.getEmail());

			int i = ps.executeUpdate();
			if (i == 1) {
				return true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return false;
	}

	@Override
	public List<bookDtls> allBooks() {
		List<bookDtls> list = new ArrayList<bookDtls>();
		bookDtls b;

		try {

			String sql = "select * from book_details";

			PreparedStatement ps = connection.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				b = new bookDtls();
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				;
				b.setPrice(rs.getString(4));
				b.setCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public bookDtls getBookById(int id) {
		bookDtls b = null;
		try {
			String sql = "select * from book_details where book_id=?";
			PreparedStatement ps = connection.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				b = new bookDtls();

				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return b;
	}

	@Override
	public boolean updateBookks(bookDtls b) {
		try {
			String sql = "update book_details set book_name=?,author=?,price=?,bookCategory=?,status=? where book_id=?";
			PreparedStatement ps = connection.prepareStatement(sql);
			ps.setString(1, b.getBookName());
			ps.setString(2, b.getAuthor());
			ps.setString(3, b.getPrice());
			ps.setString(4, b.getCategory());
			ps.setString(5, b.getStatus());
			ps.setLong(6, b.getBookId());

			int i = ps.executeUpdate();
			if (i == 1) {
				return true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return false;
	}

	@Override
	public boolean deleteBook(int id) {
		try {
			String sql = "delete from  book_details where book_id=?";
			PreparedStatement ps = connection.prepareStatement(sql);
			ps.setInt(1, id);

			int i = ps.executeUpdate();
			if (i == 1) {
				return true;
			} else {
				return false;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public List<bookDtls> getNewBook() {
		List<bookDtls> list = new ArrayList<bookDtls>();

		try {
			String sql = "select * from book_details where bookCategory=? and status=? order by book_id DESC";
			PreparedStatement ps = connection.prepareStatement(sql);
			ps.setString(1, "New");
			ps.setString(2, "Active");

			ResultSet rs = ps.executeQuery();
			bookDtls b;
			int i = 1;
			while (rs.next() && i <= 4) {
				b = new bookDtls();
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));

				list.add(b);
				i++;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public List<bookDtls> recentbooks() {
		List<bookDtls> list = new ArrayList<bookDtls>();

		try {
			String sql = "select * from book_details where status=? order by book_id DESC";
			PreparedStatement ps = connection.prepareStatement(sql);
			ps.setString(1, "Active");

			ResultSet rs = ps.executeQuery();
			bookDtls b;
			int i = 1;
			while (rs.next() && i <= 4) {
				b = new bookDtls();
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));

				list.add(b);
				i++;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<bookDtls> oldBooks() {
		List<bookDtls> list = new ArrayList<bookDtls>();

		try {
			String sql = "select * from book_details where bookCategory=? order by book_id DESC";
			PreparedStatement ps = connection.prepareStatement(sql);
			ps.setString(1, "Old");

			ResultSet rs = ps.executeQuery();
			bookDtls b;
			int i = 1;
			while (rs.next() && i <= 4) {
				b = new bookDtls();
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));

				list.add(b);
				i++;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;

	}

	@Override
	public List<bookDtls> allRecentBooks() {
		List<bookDtls> list = new ArrayList<bookDtls>();

		try {
			String sql = "select * from book_details where status=? order by book_id DESC";
			PreparedStatement ps = connection.prepareStatement(sql);
			ps.setString(1, "Active");

			ResultSet rs = ps.executeQuery();
			bookDtls b;
			while (rs.next()) {
				b = new bookDtls();
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));

				list.add(b);
				
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<bookDtls> allNewBooks() {
		List<bookDtls> list = new ArrayList<bookDtls>();

		try {
			String sql = "select * from book_details where bookCategory=? and status=? order by book_id DESC";
			PreparedStatement ps = connection.prepareStatement(sql);
			ps.setString(1, "New");
			ps.setString(2, "Active");

			ResultSet rs = ps.executeQuery();
			bookDtls b;
			while (rs.next()) {
				b = new bookDtls();
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));

				list.add(b);
			
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public List<bookDtls> allOldBooks() {
		List<bookDtls> list = new ArrayList<bookDtls>();

		try {
			String sql = "select * from book_details where bookCategory=? order by book_id DESC";
			PreparedStatement ps = connection.prepareStatement(sql);
			ps.setString(1, "Old");

			ResultSet rs = ps.executeQuery();
			bookDtls b;
			while (rs.next()) {
				b = new bookDtls();
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));

				list.add(b);
		
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<bookDtls> getUserOldBooks(String email, String category) {
		List<bookDtls> list = new ArrayList<bookDtls>();
		bookDtls b;
		try {
			String sql = "select * from book_details where user_email=? and bookCategory=?";
			PreparedStatement ps = connection.prepareStatement(sql);
			ps.setString(1, email);
			ps.setString(2, category);
			
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				b = new bookDtls();
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));

				list.add(b);
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<bookDtls> getBookSearch(String ch) {
		List<bookDtls> list = new ArrayList<bookDtls>();
		bookDtls b;
		try {
			String sql = "select * from book_details where book_name like ? or author like ? or bookCategory like ? and status = ?";
			PreparedStatement ps = connection.prepareStatement(sql);
			ps.setString(1, "%"+ch+"%");
			ps.setString(2, "%"+ch+"%");
			ps.setString(3, "%"+ch+"%");
			ps.setString(4, "Active");
			
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				b = new bookDtls();
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));

				list.add(b);
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	

}
