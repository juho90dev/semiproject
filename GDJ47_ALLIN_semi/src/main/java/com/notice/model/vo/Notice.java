package com.notice.model.vo;

import java.sql.Date;

import lombok.Builder;
import lombok.Data;


@Data//기본생성자, setter,getter, toString, hashcode, equals생성
@Builder
public class Notice {
	private int noticeNo;
	private String noticeTitle;
	private String noticeWriter;
	private String noticeContent;
	private String filePath;
	private Date noticeDate;
}
