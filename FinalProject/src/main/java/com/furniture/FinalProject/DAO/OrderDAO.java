package com.furniture.FinalProject.DAO;


import org.springframework.data.jpa.repository.JpaRepository;

import com.furniture.FinalProject.Model.Order;

public interface OrderDAO extends JpaRepository<Order, Long>{

}
