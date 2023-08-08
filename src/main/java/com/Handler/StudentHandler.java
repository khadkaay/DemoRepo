package com.Handler;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.dto.StudentDTO;
import com.service.StudentService;

@Controller
public class StudentHandler {
	
	@Autowired
	StudentService studentService;		//This forwards to the service layer
	
	//To Validate the user logins
	@GetMapping({"/login","/"})
	public String loginPage() {
		
		return "login";			//takes us to login.jsp
	}
	
	@PostMapping("/validate")
	public String autorizeUser(@RequestParam String email, @RequestParam String password, Model model) {
		
		StudentDTO sdto = studentService.authenticate(email,password);
		
		if(sdto != null) {
			model.addAttribute("sdto",sdto);
			return "success";
		}else {
			model.addAttribute("fail", "Incorrect Email or Password!! Please Try Again!!");
			return "login";
		}
	}
	//To show all Records
	@GetMapping("/showall")
	public String showAllRecords(HttpServletRequest request, Model model) {
		
		HttpSession session = request.getSession(false);
		
		if(session != null && session.getAttribute("sessionsdto") != null) {
			
			System.out.println("User is logged in!");
		}
		else {
			
			System.out.println("User is logged out! Log in required!");
			return "redirect:/login";
		}
		List<StudentDTO> sdtolist =studentService.showAllStudents();
		model.addAttribute("sdtolist",sdtolist);
		return "allRecords";
	}
	
	//Register a new user
	@GetMapping("/register")
	public String registerUser() {
		
		return "registration";
	}
	
	@PostMapping("/newregister")
	public String addNewRecord(@ModelAttribute StudentDTO sdto, Model model) {
		
		String info = studentService.createRecord(sdto);
		model.addAttribute("info",info);
		return "registration";
	}
	
	//To Delete a Record
	@GetMapping("/deleteUser")
	public String deleteUser(@RequestParam int studentid, Model model) {
		
		studentService.deleteRecord(studentid);
		model.addAttribute("msg","Data deleted Successfully!");
		return "redirect:/showall";
	}
	
	//To Update a Record
	
	//First we are fetching the recrod to present to the client
	@GetMapping("/updateUser")
	public String editRecord(@RequestParam int studentid, Model model) {
		
		StudentDTO sdto = studentService.findRecord(studentid);
		model.addAttribute("sdto",sdto);
		return "update";
	}
	
	//Then we are updateing the record per the client's criteria
	@PostMapping("/updatedUser")
	public String editUserRecord(@ModelAttribute StudentDTO sdto, Model model){
		
		studentService.editRecord(sdto);
		model.addAttribute("updatemessage","Record Updated Successfully!");
		
		return "redirect:/showall";
	}
	
	//Admin Login
	@GetMapping("/admin")
	public String adminLogin() {
		
		return "adminlogin";
	}
	
	@PostMapping("/adminValidate")
	public String adminAuthenticate(@RequestParam String email, @RequestParam String password, HttpServletRequest request, Model model) {
		
		StudentDTO sdto = studentService.authenticateAdmin(email,password);
		HttpSession session = request.getSession();
		
		//First Check to see if the object is null or not
			if(sdto!= null) {
				//session scope varibale sessiondto created
				session.setAttribute("sessionsdto", sdto);
				
				//Once its not null, check credentials
				if (sdto.getEmail().equals("ayush@gmail.com") && sdto.getPassword().equals("ayush123")) {
					model.addAttribute("sdto",sdto);
					return "adminsuccess";
				}
				else {
					model.addAttribute("faillogin","Bad Email or Password!!");
					return "adminlogin";
				}
			}
		
		//if its null, show bad login message and return the admin login page
			else {
				model.addAttribute("faillogin","Bad Email or Password!!");
				return "adminlogin";
			}
		}

	//To logout the user
	@GetMapping("/logoff")
	public String logout(StudentDTO sdto, HttpServletRequest request,Model model) {

		HttpSession session = request.getSession(false);
		
		//if the session exists perform the operation
		if(session != null) {
			session.invalidate();	//kill the session
		}
		
		model.addAttribute("msg","Logout Successful!");
		return "logout";
	}
	
}








