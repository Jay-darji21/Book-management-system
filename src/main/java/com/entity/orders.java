package com.entity;

public class orders {
	private int id;
	private String orderId;
	private String userName;
	private String email;
	private String address;
	private String phone;
	private String book_name;
	private String author;
	private String price;
	private String payment;
	
	public orders() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getOrderId() {
		return orderId;
	}
	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getBook_name() {
		return book_name;
	}
	public void setBook_name(String book_name) {
		this.book_name = book_name;
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

	public String getPayment() {
		return payment;
	}
	public void setPayment(String payment) {
		this.payment = payment;
	}

	@Override
	public String toString() {
		return "orders [id=" + id + ", orderId=" + orderId + ", userName=" + userName + ", email=" + email + ", phone="
				+ phone + ", book_name=" + book_name + ", author=" + author + ", address=" + address + ", price="+price+", payment="
				+ payment + "]";
	}
	
	
	
	
}
