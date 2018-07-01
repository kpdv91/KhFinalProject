package com.kh.cat.dto;

import java.sql.Date;

public class RevReplyDTO {
	private int rev_reply_idx;
	private int review_idx;
	private String id;
	private String rev_reply_content;
	private Date rev_reply_date;
	private String profile;
	
	public int getRev_reply_idx() {
		return rev_reply_idx;
	}
	public void setRev_reply_idx(int rev_reply_idx) {
		this.rev_reply_idx = rev_reply_idx;
	}
	public int getReview_idx() {
		return review_idx;
	}
	public void setReview_idx(int review_idx) {
		this.review_idx = review_idx;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getRev_reply_content() {
		return rev_reply_content;
	}
	public void setRev_reply_content(String rev_reply_content) {
		this.rev_reply_content = rev_reply_content;
	}
	public Date getRev_reply_date() {
		return rev_reply_date;
	}
	public void setRev_reply_date(Date rev_reply_date) {
		this.rev_reply_date = rev_reply_date;
	}
	public String getProfile() {
		return profile;
	}
	public void setProfile(String profile) {
		this.profile = profile;
	}
	
	
}
