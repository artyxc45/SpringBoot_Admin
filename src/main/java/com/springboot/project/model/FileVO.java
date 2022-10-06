package com.springboot.project.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import lombok.Data;

@Data
@Table(name = "pd_image")
@Entity
public class FileVO {
	
	@Id
	@Column(name="PD_CODE", unique = true, nullable = false)
	private Long pdcode;
	
	@Column(name = "FILENAME")
	private String fileName;
	
	@Column(name = "FILEORINAME")
	private String fileOriName;
	
	@Column(name = "UPLOADPATH")
	private String uploadPath;

	@Column(name = "FILEFULLNAME")
	private String FileFullName;
	
}
