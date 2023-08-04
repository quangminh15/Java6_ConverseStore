package com.conversestore.service;

import com.conversestore.model.Cart;
import com.conversestore.model.Customer;
import com.conversestore.model.ProductVariants;

public interface ShoppingCartService {
	Cart findCartByCustomer(Customer cus);
	void addToCart1(Integer prodVId, Integer soluong, Customer cus, Cart cart);
	void addToCart(ProductVariants prod, Integer soluong);
}
