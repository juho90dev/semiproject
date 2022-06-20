package com.login.model.vo;

import java.sql.Date;

public class Member {
	private String userId;//아이디
	private String email; //이메일
	private String password; //비밀번호
	private String phone; //휴대폰
	private String city; //대도시
	private String country; //소도시
	private String image; //이미지
	private int avgscore; //평점
	private String grade; // 등급
	private String introduce; //자기소개
	private Date enrollDate; //가입일
	private String pay;//결제 
	
	public Member() {
		// TODO Auto-generated constructor stub
	}

	public Member(String userId, String email, String password, String phone, String city, String country, String image,
			int avgscore, String grade, String introduce, Date enrollDate, String pay) {
		super();
		this.userId = userId;
		this.email = email;
		this.password = password;
		this.phone = phone;
		this.city = city;
		this.country = country;
		this.image = image;
		this.avgscore = avgscore;
		this.grade = grade;
		this.introduce = introduce;
		this.enrollDate = enrollDate;
		this.pay = pay;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public int getAvgscore() {
		return avgscore;
	}

	public void setAvgscore(int avgscore) {
		this.avgscore = avgscore;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public String getIntroduce() {
		return introduce;
	}

	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	public String getPay() {
		return pay;
	}

	public void setPay(String pay) {
		this.pay = pay;
	}

	@Override
	public String toString() {
		return "Member [userId=" + userId + ", email=" + email + ", password=" + password + ", phone=" + phone
				+ ", city=" + city + ", country=" + country + ", image=" + image + ", avgscore=" + avgscore + ", grade="
				+ grade + ", introduce=" + introduce + ", enrollDate=" + enrollDate + ", pay=" + pay + "]";
	}
	
	
	

	
}