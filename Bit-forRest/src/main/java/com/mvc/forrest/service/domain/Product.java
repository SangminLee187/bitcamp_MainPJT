package com.mvc.forrest.service.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class Product {
	
	private String prodNo;
	private int width;
	private int length;
	private int height;
	private String userId;
	private String prodCondition;
	private int prodQuantity;
	private String prodName;
	private String prodDetail;
	private int isRental;
	private int rentalCounting;
	private int rentalPrice;
	private String account;
	private String category;
	private String divyAddress;
	private String prodImg;
	private String recentImg;
	private User userProd;
	//주소 따로or jsp에서??
	private int wishlistNo;
	private Date regDate;
	

	
}