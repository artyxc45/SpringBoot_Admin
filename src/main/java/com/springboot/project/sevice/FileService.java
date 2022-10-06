package com.springboot.project.sevice;

import java.util.List;

import com.springboot.project.model.FileVO;

public interface FileService {
	
	List<FileVO> getfileList(FileVO filevo);
	
	void fileInsertBoard(FileVO filevo);
	
	FileVO getfileBoard(FileVO filevo);
	
	void updatefileBoard(FileVO filevo);
	
	void fileDeleteBoard(FileVO filevo);
	
}
