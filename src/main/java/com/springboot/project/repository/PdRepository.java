package com.springboot.project.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.CrudRepository;

import com.springboot.project.model.Pdboard;

public interface PdRepository extends JpaRepository<Pdboard, Long>{
}
