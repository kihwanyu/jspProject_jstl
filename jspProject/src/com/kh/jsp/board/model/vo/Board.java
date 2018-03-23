package com.kh.jsp.board.model.vo;

import java.sql.Date;

public class Board implements java.io.Serializable{
	private int bid;
	private int bType;
	private int bno;
	private String category;
	private String bTitle;
	private String bContent;
	private String bWriter;
	private int bCount;
	private int refBid;
	private int refRefBid;
	private int reply_level;
	private Date bDate;
	private String status;
	
	public Board(){}

	public Board(int bid, int bType, int bno, String category, String bTitle, String bContent, String bWriter,
			int bCount, int refBid, int refRefBid, int reply_level, Date bDate, String status) {
		super();
		this.bid = bid;
		this.bType = bType;
		this.bno = bno;
		this.category = category;
		this.bTitle = bTitle;
		this.bContent = bContent;
		this.bWriter = bWriter;
		this.bCount = bCount;
		this.refBid = refBid;
		this.refRefBid = refRefBid;
		this.reply_level = reply_level;
		this.bDate = bDate;
		this.status = status;
	}

	public int getBid() {
		return bid;
	}

	public int getbType() {
		return bType;
	}

	public int getBno() {
		return bno;
	}

	public String getCategory() {
		return category;
	}

	public String getbTitle() {
		return bTitle;
	}

	public String getbContent() {
		return bContent;
	}

	public String getbWriter() {
		return bWriter;
	}

	public int getbCount() {
		return bCount;
	}

	public int getRefBid() {
		return refBid;
	}

	public int getRefRefBid() {
		return refRefBid;
	}

	public int getReply_level() {
		return reply_level;
	}

	public Date getbDate() {
		return bDate;
	}

	public String getStatus() {
		return status;
	}

	public void setBid(int bid) {
		this.bid = bid;
	}

	public void setbType(int bType) {
		this.bType = bType;
	}

	public void setBno(int bno) {
		this.bno = bno;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public void setbTitle(String bTitle) {
		this.bTitle = bTitle;
	}

	public void setbContent(String bContent) {
		this.bContent = bContent;
	}

	public void setbWriter(String bWriter) {
		this.bWriter = bWriter;
	}

	public void setbCount(int bCount) {
		this.bCount = bCount;
	}

	public void setRefBid(int refBid) {
		this.refBid = refBid;
	}

	public void setRefRefBid(int refRefBid) {
		this.refRefBid = refRefBid;
	}

	public void setReply_level(int reply_level) {
		this.reply_level = reply_level;
	}

	public void setbDate(Date bDate) {
		this.bDate = bDate;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Board [bid=" + bid + ", bType=" + bType + ", bno=" + bno + ", category=" + category + ", bTitle="
				+ bTitle + ", bContent=" + bContent + ", bWriter=" + bWriter + ", bCount=" + bCount + ", refBid="
				+ refBid + ", refRefBid=" + refRefBid + ", reply_level=" + reply_level + ", bDate=" + bDate
				+ ", status=" + status + "]";
	}
	
	
}



