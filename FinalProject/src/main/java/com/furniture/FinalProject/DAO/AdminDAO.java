package com.furniture.FinalProject.DAO;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.furniture.FinalProject.Model.Admin;

public interface AdminDAO extends JpaRepository<Admin, Long>{
	List<Admin> findByUserNameAndPassword(String username, String password);
	List<Admin> findByUserName(String username);
}
