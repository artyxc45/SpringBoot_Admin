package com.springboot.project.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.springboot.project.model.FileVO;

public interface FileRepository extends JpaRepository<FileVO, Long>{

}
