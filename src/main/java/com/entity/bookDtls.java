package com.entity;

public class bookDtls {
	private int bookId;
	private String bookName;
	private String author;
	private String price;
	private String category;
	private String status;
	private String photoName;
	private String email;

	public bookDtls() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	

	public bookDtls(String bookName, String author, String price, String category, String status, 
			String photoName, String email) {
		super();
		this.bookName = bookName;
		this.author = author;
		this.price = price;
		this.category = category;
		this.status = status;
		this.photoName = photoName;
		this.email = email;
	}



	public int getBookId() {
		return bookId;
	}

	public void setBookId(int i) {
		this.bookId = i;
	}

	public String getBookName() {
		return bookName;
	}

	public void setBookName(String bookName) {
		this.bookName = bookName;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	

	public String getPhotoName() {
		return photoName;
	}

	public void setPhotoName(String photoName) {
		this.photoName = photoName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Override
	public String toString() {
		return "bookDtls [bookId=" + bookId + ", bookName=" + bookName + ", author=" + author + ", price=" + price
				+ ", category=" + category + ", status=" + status + ", photoName=" + photoName
				+ ", email=" + email + "]";
	}

}
