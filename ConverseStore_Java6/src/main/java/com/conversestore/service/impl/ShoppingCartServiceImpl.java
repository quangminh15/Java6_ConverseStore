package com.conversestore.service.impl;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.PathVariable;

import com.conversestore.dao.CartDAO;
import com.conversestore.dao.CartItemDAO;
import com.conversestore.dao.CustomerDAO;
import com.conversestore.dao.ProductVariantDAO;
import com.conversestore.model.Cart;
import com.conversestore.model.CartItem;
import com.conversestore.model.Customer;
import com.conversestore.model.ProductVariants;
import com.conversestore.service.ProductVariantService;
import com.conversestore.service.ShoppingCartService;




@Service
public class ShoppingCartServiceImpl implements ShoppingCartService {
	@Autowired
	ProductVariantDAO prodDao;
	@Autowired
	ProductVariantService prodVS;
	@Autowired
	CartItemDAO cartItemDao;
	@Autowired
	CartDAO cartDao;
	@Autowired
	CustomerDAO cusDao;
	@Override
	public void addToCart(Integer size, Integer color,Integer idProd, Integer soluong) {
		Integer addQty = soluong;
		
		ProductVariants prodV = prodVS.findBySizeAndolor(size, color, idProd);
		
		Customer cus =  cusDao.findById(2).get();

		Cart cartC = cartDao.findByCustomers(cus);
		
		CartItem cartI = cartItemDao.findByProductVariant(prodV);
		
		if (cartI != null) {
			addQty = cartI.getQuantity()+soluong;
			cartI.setQuantity(addQty);		
		}else {
			cartI = new CartItem();
			cartI.setCart(cartC);
			cartI.setProductVariant(prodV);
			cartI.setQuantity(addQty);
		}
		
		cartItemDao.save(cartI);

		
	}

	@Override
	public Cart findCartByCustomer(Customer cus) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void addToCartItem(long cartId, long productId, long sizeId, long colorId, int quantity) {
		 cartItemDao.insertCartItem(cartId, productId, sizeId, colorId, quantity);
		
	}

	@Override
	public List<CartItem> getCartItem(Integer customerID) {
		
		return cartItemDao.findCartItemsByCustomerId(customerID);
	}

	@Override
	public void updateQtyCartItem(Integer qty, Integer cartItemId) {
		cartItemDao.updateCartItemQuantity(qty, cartItemId);
		
	}

	@Override
	public void deleteCartItem(Integer id) {
		cartItemDao.deleteById(id);
	}


	

}
