package com.furniture.FinalProject.DAO;


import org.springframework.data.jpa.repository.JpaRepository;

import com.furniture.FinalProject.Model.Item;

public interface ItemDAO extends JpaRepository<Item, Long>{

}
