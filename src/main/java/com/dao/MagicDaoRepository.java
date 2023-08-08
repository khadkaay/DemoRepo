package com.dao;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.entity.StudentEntity;

@Repository
public interface MagicDaoRepository extends JpaRepository<StudentEntity,Integer>{

	Optional<StudentEntity> findByEmailAndPassword(String email, String password); 

}
