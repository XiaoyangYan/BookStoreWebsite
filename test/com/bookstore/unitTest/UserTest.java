package com.bookstore.unitTest;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import com.bookstore.entity.Users;

public class UserTest {
		
	public static void main(String[] args){
		Users user1 = new Users();
		user1.setEmail("helloworld@163.com");
		user1.setFullName("Xiaoyang Yan");
		user1.setPassword("1234567");
		EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("BookStoreWebsite");
		EntityManager entityManager = entityManagerFactory.createEntityManager();
		
		entityManager.getTransaction().begin();
		entityManager.persist(user1);
		entityManager.getTransaction().commit();
		entityManager.close();
		entityManagerFactory.close();
	}
		
	
	
	
}
