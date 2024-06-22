package com.DAO;

import java.util.List;

import com.entity.bookDtls;

public interface books {
	public boolean addBook(bookDtls b);
	
	public List<bookDtls> allBooks();
	
	public bookDtls getBookById(int id);
	
	public boolean updateBookks(bookDtls b);
	
	public boolean deleteBook(int id);
	
	public List<bookDtls> getNewBook();
	
	public List<bookDtls> recentbooks();
	
	public List<bookDtls> oldBooks();
	
	public List<bookDtls> allRecentBooks();
	
	public List<bookDtls> allNewBooks();
	
	public List<bookDtls> allOldBooks();
	
	public List<bookDtls> getUserOldBooks(String email,String category);
	
	public List<bookDtls> getBookSearch(String ch);


}
