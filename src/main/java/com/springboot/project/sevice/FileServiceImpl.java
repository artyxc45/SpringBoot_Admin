package com.springboot.project.sevice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springboot.project.model.FileVO;
import com.springboot.project.repository.FileRepository;

@Service
public class FileServiceImpl implements FileService {
	
	@Autowired
	private FileRepository fileboardRepository;
	
	@Override
	public List<FileVO> getfileList(FileVO file) {
		return (List<FileVO>) fileboardRepository.findAll();
	}

	@Override
	public void fileInsertBoard(FileVO file){
		fileboardRepository.save(file);
	}
	
	@Override
	public void fileDeleteBoard(FileVO file){
		fileboardRepository.deleteById(file.getPdcode());
	}
	
	
	@Override
	public FileVO getfileBoard(FileVO filevo) {
		FileVO findfileBoard = fileboardRepository.findById(filevo.getPdcode()).get();
		fileboardRepository.save(findfileBoard);
    	return findfileBoard;
	}
	
	@Override
	public void updatefileBoard(FileVO filevo) {
		FileVO findfileBoard = fileboardRepository.findById(filevo.getPdcode()).get();
		
		findfileBoard.setFileOriName(filevo.getFileOriName());
		findfileBoard.setFileFullName(filevo.getFileFullName());
		findfileBoard.setUploadPath(filevo.getUploadPath());
		findfileBoard.setFileName(filevo.getFileName());
		
		fileboardRepository.save(findfileBoard);
		
	}
	
	
}
