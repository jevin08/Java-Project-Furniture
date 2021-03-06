package com.furniture.Project;

import java.sql.Date;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import entities.Customer;
import services.AdminServices;
import services.CustomerServices;

@Controller
public class AppController {
	@RequestMapping("")
	public String home() {
		return "home";
	}
	@RequestMapping("admin")
	public String adminHome() {
		return "admin/home";
	}
	@RequestMapping("admin/product/add")
	public String addProduct(){
		return "admin/addProduct";
	}
	@RequestMapping("login")
	public String login(Model model){
		return "login";
	}
	
	@RequestMapping("signin")
	public String signIn(){
		return "signin";
	}
	
	@RequestMapping("logout")
	public String logout(HttpSession session){
		session.setAttribute("adminLoggedIn", null);
		session.setAttribute("loggedIn", null);
		session.setAttribute("uname", null);
		return "home";
	}
	
	@GetMapping("validateLogin")
	public String validateLogin(Model model) {
		return "login";
	}
	
	@PostMapping("validateLogin")
	public String validateLogin(@RequestParam("uname") String name, @RequestParam("password") String pass, HttpSession session) {
		if(AdminServices.isAdmin(name, pass)) {
			session.setAttribute("adminLoggedIn", "true");
			session.setAttribute("uname", name);
			return "./admin/home";
		}else if(CustomerServices.isCustomer(name, pass)) {
			session.setAttribute("loggedIn", "true");
			session.setAttribute("uname", name);
			return "home";
		}else {
			session.setAttribute("error-message", "Username or password not matching.");
			return "login";
		}
	}
	
	@GetMapping("validateSignin")
	public String validateSignin() {
		return "signin";
	}
	
	@PostMapping("validateSignin")
	public String validateSignin(String uname, String email, String password, @RequestParam("confirm-password") String confirmPass, String fname, String lname, String phone, @RequestParam("sec-phone") String secPhone, String bdate, HttpSession session) {
		if(password.equals(confirmPass) && !password.equals("")){
			if(AdminServices.isAdmin(uname, password) || CustomerServices.isCustomer(uname, password)) {
				session.setAttribute("error-message", "Username and password already exists.");
				return "signin";
			}
			Date birthDate = Date.valueOf(bdate);
			Customer customer = new Customer(fname, lname, uname, email, password, phone, secPhone, birthDate, secPhone);
			CustomerServices.addCustomer(customer);
			return "login";
		}else {
			session.setAttribute("error-message", "Password not matched or empty.");
			return "signin";
		}
	}
	@RequestMapping("profile")
	public ModelAndView profile(HttpSession session) {
		ModelAndView m = new ModelAndView();
		if("true"==session.getAttribute("loggedIn")) {
			long id = (Long) session.getAttribute("uid");
			Customer customer = CustomerServices.getCustomer(id);
			m.addObject("email", customer.getEmail());
			m.addObject("photo", customer.getPhoto());
			m.addObject("bdate", customer.getBirthDate());
			m.addObject("fname", customer.getFirstName());
			m.addObject("lname", customer.getLastName());
			m.addObject("phone", customer.getPhone());
			m.addObject("secPhone", customer.getSecondaryPhone());
			m.setViewName("profile");
			return m;
		}
		session.setAttribute("info-message", "Please Login First!");
		m.setViewName("login");
		return m;
	}
	
}
