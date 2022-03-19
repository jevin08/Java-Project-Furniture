package com.furniture.FinalProject.DAO;

import java.sql.Date;
//import java.sql.Timestamp;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.furniture.FinalProject.Model.Customer;


public interface CustomerDAO extends JpaRepository<Customer, Long>{
	
	List<Customer> findByUserName(String userName);
	List<Customer> findByUserNameAndPassword(String username, String password);
	List<Customer> findByBirthDate(Date birthDate);	
}

//List<Customer> findByCart(String cartId);

///*	Order based search Properties	*/
//List<Customer> findByOrders(String orderId);
//List<Customer> findByItems(String itemId);
//List<Customer> findByTransictionTimeGreterThanEqual(Timestamp time);
//List<Customer> findByTransictionTimeLessThanEqual(Timestamp time);
//List<Customer> findByTransictionTimeGreterThanEqualLessThanEqual(Timestamp timeFrom, Timestamp to);
//
///*	Item based search Properties	*/
//List<Customer> findByProduct(String productId);
//List<Customer> findByProductName(String productName);
//List<Customer> findByPriceGreaterThanEqual(double price);
//List<Customer> findByPriceLessThanEqual(double price);
//List<Customer> findByPriceGreaterThanEqualLessThanEqual(double minPrice, double maxPrice);
//
///*	Address based search Properties	*/
//List<Customer> findByCity(String cityId);
//List<Customer> findByContry(String country);
//List<Customer> findByState(String state);
//List<Customer> findByDistrict(String district);