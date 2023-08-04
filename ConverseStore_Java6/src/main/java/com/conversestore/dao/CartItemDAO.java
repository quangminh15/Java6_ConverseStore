package com.conversestore.dao;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.conversestore.model.Cart;
import com.conversestore.model.CartItem;
import com.conversestore.model.ProductVariants;


public interface CartItemDAO extends JpaRepository<CartItem, Integer> {
	CartItem findByCart(Cart cart);
	
	CartItem findByProductVariant(ProductVariants prod);
}
