package com.furniture.FinalProject.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.furniture.FinalProject.DAO.AdminDAO;
import com.furniture.FinalProject.DAO.CustomerDAO;
import com.furniture.FinalProject.DAO.ProductDAO;
import com.furniture.FinalProject.Model.Admin;
import com.furniture.FinalProject.Model.Customer;

@Controller
public class AppController {
	
	@Autowired
    private CustomerDAO custRepo;
	@Autowired
	private AdminDAO adminRepo;
	@Autowired
	private ProductDAO productRepo;
	
	@RequestMapping("")
	public ModelAndView home() {
		ModelAndView mv = new ModelAndView("home");
		mv.addObject("products",productRepo.findAll());
		return mv;
	}
	
	@GetMapping("login")
	public String loginGet() {
		return "login";
	}
	
	@PostMapping("login")
	public String loginProcess(String userName, String password, HttpSession session) {
		List<Admin> admin = adminRepo.findByUserNameAndPassword(userName, password);
		if(1==admin.size()) {
			session.setAttribute("adminLoggedIn", "true");
			session.setAttribute("username", userName);
			session.setAttribute("userid", admin.get(0).getId());
			return "redirect:admin";
		}else {
			List<Customer> cust = custRepo.findByUserNameAndPassword(userName, password); 
			if(1==cust.size()) {
				session.setAttribute("loggedIn", "true");
				session.setAttribute("username", userName);
				session.setAttribute("userid", admin.get(0).getId());
				return "redirect:home";
			}else {
				session.setAttribute("error", "Username or password not matching.");
				return "redirect:login";
			}
		}
	}
	
	@GetMapping("signup")
	public String signupGet() {
		return "signup";
	}
	@PostMapping("signup")
	public ModelAndView signupPost(Customer customer, @RequestParam("confirm-password") String confirmPass, HttpSession session) {
		customer.setId((long) 0);
		ModelAndView mv = new ModelAndView();
		customer.setPhoto("default.jpg");
		System.out.println(customer +" \t "+ confirmPass);
		if(confirmPass.equals(customer.getPassword()) && confirmPass!=null && confirmPass!="") {
			if(adminRepo.findByUserName(customer.getUserName()).isEmpty()) {
				if(custRepo.findByUserName(customer.getUserName()).isEmpty()) {
					customer = custRepo.save(customer);
					session.setAttribute("loggedIn", "true");
					session.setAttribute("username", customer.getUserName());
					session.setAttribute("userid", customer.getId());
					mv.setViewName("redirect:home");
					return mv;
				}
			}
			mv.setViewName("redirect:signup");
			mv.addObject(customer);
			session.setAttribute("error", "Someone already exists with this username please try with diffrent username!");
			return mv;
		}
		mv.setViewName("redirect:signup");
		mv.addObject(customer);
		session.setAttribute("error", "Password not matched or empty!");		
		return mv;
	}
	@RequestMapping("profile/{id}")
	public ModelAndView profile(@PathVariable String id, HttpSession session) {
		ModelAndView mv = new ModelAndView("redirect:profile");
		Long customerId = Long.getLong(id);
		if(session.getAttribute("loggedIn")!=null && customerId!=(long)0) {
			Customer customer = custRepo.getById(customerId);
			if(customer!=null) {
				mv.addObject(customer);
				return mv;
			}
		}
		session.setAttribute("error", "Something went wrong!");
		mv.setViewName("redirect:login");
		return mv;
	}
	
	@RequestMapping("cart/{id}")
	public ModelAndView cart(@PathVariable String id, HttpSession session) {
		ModelAndView mv = new ModelAndView("redirect:cart");
		Long customerId = Long.getLong(id);
		if(session.getAttribute("loggedIn")!=null && customerId!=(long)0) {
			Customer customer = custRepo.getById(customerId);
			if(customer!=null) {
				mv.addObject(customer);
				return mv;
			}
		}
		session.setAttribute("error", "Something went wrong!");
		mv.setViewName("redirect:login");
		return mv;
	}
}
