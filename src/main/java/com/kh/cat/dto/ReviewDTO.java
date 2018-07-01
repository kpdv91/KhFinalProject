package com.kh.cat.dto;

import java.sql.Date;

public class ReviewDTO {
	private int review_idx;
	private int store_idx;
	private String id;
	private String review_star;
	private String review_content;
	private int review_likeCnt;
	private Date review_date;
	private String profile;
	
	public int getReview_idx() {
		return review_idx;
	}
	public void setReview_idx(int review_idx) {
		this.review_idx = review_idx;
	}
	public int getStore_idx() {
		return store_idx;
	}
	public void setStore_idx(int store_idx) {
		this.store_idx = store_idx;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getReview_star() {
		return review_star;
	}
	public void setReview_star(String review_star) {
		this.review_star = review_star;
	}
	public String getReview_content() {
		return review_content;
	}
	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}
	public int getReview_likeCnt() {
		return review_likeCnt;
	}
	public void setReview_likeCnt(int review_likeCnt) {
		this.review_likeCnt = review_likeCnt;
	}
	public Date getReview_date() {
		return review_date;
	}
	public void setReview_date(Date review_date) {
		this.review_date = review_date;
	}
	public String getProfile() {
		return profile;
	}
	public void setProfile(String profile) {
		this.profile = profile;
	}
	
	
}
