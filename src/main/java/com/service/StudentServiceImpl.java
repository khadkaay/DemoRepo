package com.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dao.MagicDaoRepository;
import com.dto.StudentDTO;
import com.entity.StudentEntity;

@Service
@Transactional
public class StudentServiceImpl implements StudentService {
	
	@Autowired
	MagicDaoRepository magicDaoRepository;

	@Override
	public StudentDTO authenticate(String email, String password) {
		
		Optional<StudentEntity> optional = magicDaoRepository.findByEmailAndPassword(email,password);
		StudentDTO sdto = null;
		
		//runs if there is data and is not null
		if(optional.isPresent()) {
			
			StudentEntity sten = optional.get();		//fetches the data
			sdto = new StudentDTO();
			BeanUtils.copyProperties(sten,sdto);		//copies the data from student enityt to dto object
			return sdto;								//returns the dto object
		}
		//if optional is null
		else {
			return sdto;
		}
	}

	@Override
	public List<StudentDTO> showAllStudents() {
		
		List<StudentEntity> sten= magicDaoRepository.findAll();		//getting data using the findAll method
																//we can add this to the dao reporsitory but its already included so its optional
		
		List<StudentDTO> sdtolist = new ArrayList<>();		//creating an empty arrayList
		
		if(sten.size() > 0) {								//checking to see if student entity object has data
			
			for(StudentEntity temp: sten) {					//iterating through each object
				
				StudentDTO sdto = new StudentDTO();			//creating an object of StudentDTO to copy each iteration of sten	
				BeanUtils.copyProperties(temp, sdto);		//copying the student entity object
				sdtolist.add(sdto);							//finally adding  to the student dto list
			}
		}
		return sdtolist;									//returning the list
	}

	@Override
	public String createRecord(StudentDTO sdto) {
			
		StudentEntity sten = new StudentEntity();			//To copy the StudentDTO object to StudentEntity since Student Entity works with DB
		BeanUtils.copyProperties(sdto, sten);				//copying
		magicDaoRepository.save(sten);						//Then saving the new data in the data base
		return "Successful Registration";					//Just forwarding the Message to the controller class to be used when called
	}
	
	//Deleting a Record
	@Override
	public void deleteRecord(int studentid) {
		
		magicDaoRepository.deleteById(studentid);		//passing it to the DB to perform the delete Operation. Return Type void
	}

	//Updating a Record
	//Fetching the record first using optional.get
	@Override
	public StudentDTO findRecord(int studentid) {
		
		Optional<StudentEntity> optional = magicDaoRepository.findById(studentid);	//to find a particular record using studentid
		StudentDTO sdto = null;
		
		//if record is present and the method returns true
		if(optional.isPresent()) {
			
			StudentEntity sten = optional.get();
			sdto = new StudentDTO();
			BeanUtils.copyProperties(sten, sdto);
			return sdto;
		}
		//if optional is null
		else {
			return sdto;
		}
	}
	
	//saving the record using in built save() method
	@Override
	public void editRecord(StudentDTO sdto) {
		
		StudentEntity sten = new StudentEntity();
		BeanUtils.copyProperties(sdto, sten);
		magicDaoRepository.save(sten);
	}
	
	//Admin authentication
	@Override
	public StudentDTO authenticateAdmin(String email, String password) {
		
		Optional<StudentEntity> optional = magicDaoRepository.findByEmailAndPassword(email,password);
		
		StudentDTO sdto = null;
		
		if(optional.isPresent()) {
			
			StudentEntity sten = optional.get();
			sdto = new StudentDTO();
			BeanUtils.copyProperties(sten, sdto);
			return sdto;
		}
		
		return sdto;
	}

}
