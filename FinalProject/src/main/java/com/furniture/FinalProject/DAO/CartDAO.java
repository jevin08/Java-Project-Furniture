package com.furniture.FinalProject.DAO;


import org.springframework.data.jpa.repository.JpaRepository;

import com.furniture.FinalProject.Model.Cart;

public interface CartDAO extends JpaRepository<Cart, Long>{

}
