package com.conversestore.dao;
import org.springframework.data.jpa.repository.JpaRepository;

import com.conversestore.model.Cart;
import com.conversestore.model.CartItem;


public interface CartItemDAO extends JpaRepository<CartItem, Integer> {

}
