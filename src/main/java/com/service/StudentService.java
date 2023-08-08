package com.service;

import java.util.List;

import com.dto.StudentDTO;

public interface StudentService {

	StudentDTO authenticate(String email, String password);

	List<StudentDTO> showAllStudents();

	String createRecord(StudentDTO sdto);

	void deleteRecord(int studentid);

	StudentDTO findRecord(int studentid);

	void editRecord(StudentDTO sdto);

	StudentDTO authenticateAdmin(String email, String password);
	
}
