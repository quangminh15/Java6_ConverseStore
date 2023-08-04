package com.conversestore.service.impl;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.conversestore.dao.CartDAO;
import com.conversestore.dao.CartItemDAO;
import com.conversestore.dao.CustomerDAO;
import com.conversestore.dao.ProductVariantDAO;
import com.conversestore.model.Cart;
import com.conversestore.model.CartItem;
import com.conversestore.model.Customer;
import com.conversestore.model.ProductVariants;

import com.conversestore.service.ShoppingCartService;




@Service
public class ShoppingCartServiceImpl implements ShoppingCartService {
	@Autowired
	ProductVariantDAO prodDao;
	@Autowired
	CartItemDAO cartItemDao;
	@Autowired
	CartDAO cartDao;
	@Autowired
	CustomerDAO cusDao;
	@Override
	public void addToCart(ProductVariants prodV, Integer soluong) {
		Integer addQty = soluong;

		Customer cus =  cusDao.findById(2).get();

		Cart cartC = cartDao.findByCustomers(cus);
		
		CartItem cartI = cartItemDao.findByProductVariant(prodV);
		
		if (cartI != null) {
			addQty = cartI.getQuantity()+soluong;
			cartI.setQuantity(addQty);
		}else {
			cartI = new CartItem();
			cartI.setCart(cartC);;
			cartI.setProductVariant(prodV);;
			cartI.setQuantity(addQty);;
		}
		
		cartItemDao.save(cartI);

		
	}

	@Override
	public Cart findCartByCustomer(Customer cus) {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public void addToCart1(Integer prodVId, Integer soluong, Customer cus, Cart cart) {
		// TODO Auto-generated method stub
		
	}

}
