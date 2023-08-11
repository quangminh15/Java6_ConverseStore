package com.conversestore.service;

import java.util.List;

import com.conversestore.model.Cart;
import com.conversestore.model.CartItem;
import com.conversestore.model.Customer;
import com.conversestore.model.ProductVariants;

public interface ShoppingCartService {
	Cart findCartByCustomer(Customer cus);
	
	void addToCart(Integer size, Integer color, Integer idProd, Integer soluong);
	
	public void addToCartItem(long cartId, long productId, long sizeId, long colorId, int quantity) ;
	
	void updateQtyCartItem(Integer qty, Integer cartItemId);
	
	List<CartItem> getCartItem(Integer customerID);

	void deleteCartItem(Integer id);
}
