package com.springboot.project.sevice;

import java.util.List;

import com.springboot.project.model.Pdboard;


public interface PdService {
	
	 List<Pdboard> getpdBoardList(Pdboard pdboard);

	    void insertpdBoard(Pdboard pdboard);

	    Pdboard getpdBoard(Pdboard pdboard);

	    void updatepdBoard(Pdboard pdboard);

	    void deletepdBoard(Pdboard pdboard);
	    
}

	


