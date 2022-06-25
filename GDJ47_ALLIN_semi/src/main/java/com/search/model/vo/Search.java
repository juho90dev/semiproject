package com.search.model.vo;


public class Search {
	//getter-setter 기본생성자 만들기
	private String address;
	private int areacode;
	private int sigungucode;
	private String cat1;
	private String cat2;
	private String contentId;
	private String contentTypeId;
	private String firstImage;
	private String mapx;
	private String mapy;
	private String title;

public Search() {
	// TODO Auto-generated constructor stub
}

public Search(String address, int areacode, int sigungucode, String cat1, String cat2, String contentId,
		String contentTypeId, String firstImage, String mapx, String mapy, String title) {
	super();
	this.address = address;
	this.areacode = areacode;
	this.sigungucode = sigungucode;
	this.cat1 = cat1;
	this.cat2 = cat2;
	this.contentId = contentId;
	this.contentTypeId = contentTypeId;
	this.firstImage = firstImage;
	this.mapx = mapx;
	this.mapy = mapy;
	this.title = title;
}

/**
 * @return the address
 */
public String getAddress() {
	return address;
}

/**
 * @param address the address to set
 */
public void setAddress(String address) {
	this.address = address;
}

/**
 * @return the areaCode
 */
public int getAreacode() {
	return areacode;
}

/**
 * @param areaCode the areaCode to set
 */
public void setAreacode(int areacode) {
	this.areacode = areacode;
}

/**
 * @return the sigunguCode
 */
public int getSigungucode() {
	return sigungucode;
}

/**
 * @param sigunguCode the sigunguCode to set
 */
public void setSigungucode(int sigungucode) {
	this.sigungucode = sigungucode;
}

/**
 * @return the cat1
 */
public String getCat1() {
	return cat1;
}

/**
 * @param cat1 the cat1 to set
 */
public void setCat1(String cat1) {
	this.cat1 = cat1;
}

/**
 * @return the cat2
 */
public String getCat2() {
	return cat2;
}

/**
 * @param cat2 the cat2 to set
 */
public void setCat2(String cat2) {
	this.cat2 = cat2;
}

/**
 * @return the contentId
 */
public String getContentId() {
	return contentId;
}

/**
 * @param contentId the contentId to set
 */
public void setContentId(String contentId) {
	this.contentId = contentId;
}

/**
 * @return the contentTypeId
 */
public String getContentTypeId() {
	return contentTypeId;
}

/**
 * @param contentTypeId the contentTypeId to set
 */
public void setContentTypeId(String contentTypeId) {
	this.contentTypeId = contentTypeId;
}

/**
 * @return the firstImage
 */
public String getFirstImage() {
	return firstImage;
}

/**
 * @param firstImage the firstImage to set
 */
public void setFirstImage(String firstImage) {
	this.firstImage = firstImage;
}

/**
 * @return the mapx
 */
public String getMapx() {
	return mapx;
}

/**
 * @param mapx the mapx to set
 */
public void setMapx(String mapx) {
	this.mapx = mapx;
}

/**
 * @return the mapy
 */
public String getMapy() {
	return mapy;
}

/**
 * @param mapy the mapy to set
 */
public void setMapy(String mapy) {
	this.mapy = mapy;
}

/**
 * @return the title
 */
public String getTitle() {
	return title;
}

/**
 * @param title the title to set
 */
public void setTitle(String title) {
	this.title = title;
}

@Override
public String toString() {
	return "Search [address=" + address + ", areacode=" + areacode + ", sigungucode=" + sigungucode + ", cat1=" + cat1
			+ ", cat2=" + cat2 + ", contentId=" + contentId + ", contentTypeId=" + contentTypeId + ", firstImage="
			+ firstImage + ", mapx=" + mapx + ", mapy=" + mapy + ", title=" + title + "]";
}


	
	
}

