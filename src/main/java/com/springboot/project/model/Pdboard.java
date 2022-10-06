package com.springboot.project.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.data.annotation.CreatedDate;

import lombok.Data;

@Data
@Table(name = "PD_REGIST")
@Entity
public class Pdboard {

	@Id	// PK 설정
	@GeneratedValue(strategy=GenerationType.SEQUENCE)
	@Column(name="PD_CODE", unique = true, nullable = false)
	private Long pdcode;
	
	@Column(name = "PD_TITLE")
	private String title;
	
	@Column(name = "ADMIN")
	private String admin;

	@Column(name = "PD_CONTENT")
	private String content;
	
	@Column(insertable = false, updatable = false, columnDefinition = "date default sysdate")
	private Date regdate;
	
	@Column(name = "PRICE")
	private Long price;
	
	@Column(name = "FILENAME")
	private String filename;

	@Column(name = "amount")
	private String amount;
	

}
