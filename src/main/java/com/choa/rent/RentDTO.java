package com.choa.rent;

import java.sql.Date;

public class RentDTO {
	
	private int num;
	private String product_name;
	private String product_info;
	private int price;
	private int quantity;
	private String list_img;
	private String detail_img;
	private String contents;
	private Date start_date;
	private String category;
	private Date end_date;
	private String id;
	
	
	
	
	
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public String getProduct_info() {
		return product_info;
	}
	public void setProduct_info(String product_info) {
		this.product_info = product_info;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public String getList_img() {
		return list_img;
	}
	public void setList_img(String list_img) {
		this.list_img = list_img;
	}
	public String getDetail_img() {
		return detail_img;
	}
	public void setDetail_img(String detail_img) {
		this.detail_img = detail_img;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public Date getStart_date() {
		return start_date;
	}
	public void setStart_date(Date start_date) {
		this.start_date = start_date;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public Date getEnd_date() {
		return end_date;
	}
	public void setEnd_date(Date end_date) {
		this.end_date = end_date;
	}
	
	
	
	

}
