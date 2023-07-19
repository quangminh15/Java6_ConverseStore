package com.conversestore.dao;
import org.springframework.data.jpa.repository.JpaRepository;

import com.conversestore.model.Cart;


public interface CartDAO extends JpaRepository<Cart, Integer> {

}
