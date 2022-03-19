package com.furniture.FinalProject;

import static org.assertj.core.api.Assertions.assertThat;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase.Replace;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.boot.test.autoconfigure.orm.jpa.TestEntityManager;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.annotation.Rollback;

import com.furniture.FinalProject.DAO.CustomerDAO;
import com.furniture.FinalProject.Model.Customer;

@SpringBootTest
@DataJpaTest
@AutoConfigureTestDatabase(replace = Replace.NONE)
@Rollback(false)
class FinalProjectApplicationTests {

	@Autowired
    private TestEntityManager entityManager;
     
    @Autowired
    private CustomerDAO repo;
	
	@Test
	void contextLoads() {
	}
	
	@Test
	public void testCreateUser() {
	    Customer cust = new Customer();
	    cust.setEmail("ravikumar@gmail.com");
	    cust.setPassword("ravi2020");
	    cust.setFirstName("Ravi");
	    cust.setLastName("Kumar");
	     
	    Customer savedcust = repo.save(cust);
	     
	    Customer existCust = entityManager.find(Customer.class, savedcust.getId());
	     
	    assertThat(cust.getEmail()).isEqualTo(existCust.getEmail());
	     
	}

}
