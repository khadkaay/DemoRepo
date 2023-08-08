package com.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
//import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="records_table")
public class StudentEntity {
	
	private int studentid;
	private String firstname;
	private String lastname;
	private int age;
	private String email;
	private String password;
	
	public StudentEntity() {
		super();
	}

	public StudentEntity(int studentid, String firstname, String lastname, int age, String email, String password) {
		super();
		this.studentid = studentid;
		this.firstname = firstname;
		this.lastname = lastname;
		this.age = age;
		this.email = email;
		this.password = password;
	}

	@Id
	@GeneratedValue
	public int getStudentid() {
		return studentid;
	}

	public void setStudentid(int studentid) {
		this.studentid = studentid;
	}

	public String getFirstname() {
		return firstname;
	}

	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}

	public String getLastname() {
		return lastname;
	}

	public void setLastname(String lastname) {
		this.lastname = lastname;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Override
	public String toString() {
		return "StudentEntity [studentid=" + studentid + ", firstname=" + firstname + ", lastname=" + lastname
				+ ", age=" + age + ", email=" + email + ", password=" + password + "]";
	}
	
}
