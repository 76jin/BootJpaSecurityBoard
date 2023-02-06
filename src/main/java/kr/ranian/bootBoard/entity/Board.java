package kr.ranian.bootBoard.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import lombok.Data;

@Entity	// DB Table
@Data
public class Board {

	@Id		// PK
	@GeneratedValue(strategy = GenerationType.IDENTITY)	// 자동 증가 
	private Long idx;
	private String title;
	
	@Column(length = 2000)
	private String content;
	
	@Column(updatable = false)
	private String writer;
	
	@Column(insertable = false, updatable = false, columnDefinition = "datetime default now()")
	private Date indate;
	@Column(insertable = false, updatable = false, columnDefinition = "int default 0")
	private Long count;
	
}
