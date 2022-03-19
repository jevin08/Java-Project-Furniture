package com.furniture.FinalProject.DAO;


import org.springframework.data.jpa.repository.JpaRepository;

import com.furniture.FinalProject.Model.Property;

public interface PropertyDAO extends JpaRepository<Property, Long>{

}
