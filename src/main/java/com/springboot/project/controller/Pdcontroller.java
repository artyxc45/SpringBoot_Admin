package com.springboot.project.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.springboot.project.model.FileVO;
import com.springboot.project.model.Pdboard;
import com.springboot.project.sevice.FileService;
import com.springboot.project.sevice.PdService;

//아래 기본 시큐리티 적용안되게하는구문 시큐리티 구현시 삭제 
//@SpringBootApplication(exclude = SecurityAutoConfiguration.class)
@Controller
public class Pdcontroller {

    @Autowired
    private PdService pdService;
    
    @Autowired
    private FileService mFileService;
    
    @GetMapping(value = "/getAttachList", produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
	@ResponseBody  // @ResponseBody를 적용해서 JSON 데이터를 반환하도록 처리합니다.
	public ResponseEntity<List<FileVO>> getfileList(FileVO filevo){
		return new ResponseEntity<>(mFileService.getfileList(filevo), HttpStatus.OK);
	}
        
    @RequestMapping("pdboard/getBoardList")
    public String getpdBoardList(Model model, Pdboard pdboard,FileVO filevo){
    	List<Pdboard> pdlist = pdService.getpdBoardList(pdboard);
    	List<FileVO> filelist = mFileService.getfileList(filevo);
    	model.addAttribute("filelist", filelist);
		model.addAttribute("pdlist", pdlist); 
        return "pdboard/getBoardList";
    }
    
    /**
     * 글쓰기 화면
     * @return
     */
    @RequestMapping("pdboard/insertBoardView")
    public String insertBoardView() {
        return "pdboard/insertpdBoard";
    }
    
	@ResponseBody
	@GetMapping("pdboard/display")
	public ResponseEntity<byte[]> getFile(String fileName){
		
		File file = new File("C:\\SPRINGBOOT_STUDY\\Final_Boot2-master\\src\\main\\resources\\static\\Upload\\Upload" + fileName);

		ResponseEntity<byte[]> result = null;
		
		try {
			HttpHeaders header = new HttpHeaders();
			header.add("Content-Type", Files.probeContentType(file.toPath()));
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return result;
	}

    /**
     * 글쓰기 처리
     * @param Pdboard
     * @return
     */
    @RequestMapping("pdboard/insertBoard")
    public String insertBoard(HttpServletRequest request,Pdboard pdboard,@RequestPart MultipartFile files) throws Exception{
       
    	FileVO file = new FileVO();
    	
    	if (files.isEmpty()) {				// 업로드할 파일이 없을시 
    		pdService.insertpdBoard(pdboard);		// 물품을 등록한다.
		}else {
			String fileName = files.getOriginalFilename();
			String fileNameExtension = FilenameUtils.getExtension(fileName).toLowerCase();
			File destinationFile;
			String destinationFileName;
			String FileFullName;
			String fileUrl = "C:\\Users\\hi-guro\\git\\Final_Boot2\\src\\main\\resources\\static\\Upload\\Upload";
        do {
        	destinationFileName = RandomStringUtils.randomAlphanumeric(32) + "." + fileNameExtension;
        	destinationFile = new File(fileUrl + destinationFileName);
        } while(destinationFile.exists());
        
        pdboard.setFilename(destinationFileName);
        pdService.insertpdBoard(pdboard);
        destinationFile.getParentFile().mkdir();
        files.transferTo(destinationFile);
        
        file.setPdcode(pdboard.getPdcode());
        file.setFileName(destinationFileName);
        file.setFileOriName(fileName);
        file.setUploadPath(fileUrl);
        file.setFileFullName(FileFullName = file.getUploadPath().replace("\\", "/")  + file.getFileName() + "_" + file.getFileOriName());
        
        mFileService.fileInsertBoard(file);		//물품 이미지 등록
		}
    	return "redirect:getBoardList";
    }
    
    /**
            상세 글 보기
     */
    @RequestMapping("pdboard/getBoard")
    public String getpdBoard(Pdboard pdboard, Model model,FileVO filevo){
    	model.addAttribute("filelist", mFileService.getfileBoard(filevo));
    	model.addAttribute("pdread", pdService.getpdBoard(pdboard));
        return "pdboard/getBoard";
    }
    
    /**
     * 글 수정 처리 후 목록으로 이동
     */
    
    @RequestMapping("pdboard/updateBoard")
	public String updateBoard(Pdboard pdboard) {
        pdService.updatepdBoard(pdboard);
        return "forward:getBoardList";
    }
    
    /**
     * 글 삭제 처리 후 목록으로 이동
     * @param Pdboard
     */
    @RequestMapping("pdboard/deleteBoard")
    public String deletepdBoard(Pdboard pdboard,FileVO filevo){
    	pdService.deletepdBoard(pdboard);
    	mFileService.fileDeleteBoard(filevo);
        return "forward:getBoardList";
    }
    
    @PostMapping("pdboard/deleteFile")
	@ResponseBody
	// Page548 deleteFile()은 브라우저에서 전송하는 파일 이름과 종류를 파라미터로 받아서
	// 파일의 종류에 따라 다르게 동작합니다. 
	public ResponseEntity<String> deleteFile(String fileName, String type){
		
    	File file;
		
		try {
			// 브라우저에서 전송되는 파일 이름은 '경로  + UUID + _ + 파일 이름'으로
			// 구성되어 있으므로, 일반 파일의 경우에는 파일만을
			// 삭제 처리 합니다.
			file = new File("C:\\SPRINGBOOT_STUDY\\Final_Boot2-master\\src\\main\\resources\\static\\Upload\\Upload" + URLDecoder.decode(fileName, "UTF-8"));
			file.delete();
			
			// 만약, 이미지의 경우 섬네일이 존재하므로, 파일 이름의 중간에 's_'가 들어가
			// 있습니다. 일반 이미지 파일의 경우 's_'가 없도록 되어 있으므로, 이 부분을
			// 고려해서 원본 이미지 파일도 같이 삭제하도록 처리 합니다.
			if(type.equals("image")) {
				String largeFileName = file.getAbsolutePath().replace("s_", "");
				file = new File(largeFileName);
				file.delete();
			}
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
		return new ResponseEntity<String>("deleted", HttpStatus.OK);
	}
}