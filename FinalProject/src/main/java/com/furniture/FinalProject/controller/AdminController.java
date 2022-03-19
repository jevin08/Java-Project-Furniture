package com.furniture.FinalProject.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.furniture.FinalProject.DAO.AdminDAO;
import com.furniture.FinalProject.DAO.FilterDAO;
import com.furniture.FinalProject.DAO.ImgColorDAO;
import com.furniture.FinalProject.DAO.ProductDAO;
import com.furniture.FinalProject.DAO.ProductPictureDAO;
import com.furniture.FinalProject.Model.Description;
import com.furniture.FinalProject.Model.ImgColor;
import com.furniture.FinalProject.Model.Product;
import com.furniture.FinalProject.Model.ProductPicture;
import com.furniture.FinalProject.ModelWrapper.FilterList;

@Controller
@RequestMapping("/admin")
public class AdminController {
	@Autowired
	private AdminDAO adminRepo;
	@Autowired
	private ProductDAO productRepo;
	@Autowired
	private ImgColorDAO imgRepo;
	@Autowired
	private ProductPictureDAO pictureRepo; 
	@Autowired
	private FilterDAO filterRepo;
	
	@RequestMapping("home")
	public String home() {
		return "home";
	}
	@RequestMapping("")
	public String Dashboard() {
		return "admin/dashboard";
	}
	@GetMapping("product/add")
	public String addProduct(Model model) {
		model.addAttribute("colors", (imgRepo.findAll()));
		FilterList filterListWrapper = new FilterList();
		filterListWrapper.setFilterList(filterRepo.findAll());
		model.addAttribute("filterListWrapper", filterListWrapper);
		return "admin/addProduct";
	}
	@PostMapping("product/add")
	public String addProductProcess(Product product, ProductPicture picture, Description description,FilterList filterList) {
		
		// Updateing picture and add into list
		picture.setUrl(true);
		List<ProductPicture> pics = new ArrayList<>();
		pics.add(picture);
		
		// Updating product by adding description and pics filters
		product.setDescription(description);
		product.setPicture(pics);
		product.setFilters(filterList.getFilterList());
		
		// saveing and retriving product object
		Product _product = productRepo.save(product);
		
		// updateing and saving picturs into database
		for (int i=0; i<pics.size(); i++) {
			pics.get(i).setProduct(_product);
		}
		pictureRepo.saveAll(pics);
		
		return "redirect:add";
	}
	
	@GetMapping("product/addColor")
	public String addColorGet() {
		return "redirect:add";
	}	
	
	@PostMapping("product/addColor")
	public String addColorPost(ImgColor color) {
		imgRepo.save(color);
		return "redirect:add";
	}
	
	
	@RequestMapping("product/")
	public String show_or_update_product() {
		return "admin/show_updateProduct";
	}
	private boolean isLogin(HttpSession session) {
		if(null!=(String)session.getAttribute("adminLoggedIn")) {
			return true;
		}
		return false;
	}
}
