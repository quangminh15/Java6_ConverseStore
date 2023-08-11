package com.conversestore.rest.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.conversestore.model.CartItem;
import com.conversestore.service.ProductVariantService;
import com.conversestore.service.ShoppingCartService;

@CrossOrigin("*")
@RestController
@RequestMapping("/rest/cart")
public class CartRestController {
	@Autowired
    ShoppingCartService cartService;
	@Autowired
	ProductVariantService prodVS;
    @PostMapping
    public void addToCart(
    		@RequestParam("id") Long productId,
    		@RequestParam("size") Long sizeId,
    		@RequestParam("color") Long colorId,
    		@RequestParam("qty") Integer quantity) {
			// Call the service method to insert or update cart item
	    	long customerId = 2;
	    	// Need Modifying and @Transational to chú thích 
	    	// để đảm bảo tính nhất quán trong quá trình thao tác với dữ liệu trong SQL 
			cartService.addToCartItem(2, productId, sizeId, colorId, quantity);
			}
    @GetMapping
    public ResponseEntity<List<CartItem>> getCartItemsByCustomerId() {
       

        List<CartItem> cartItems = cartService.getCartItem(2);
        return new ResponseEntity<>(cartItems, HttpStatus.OK);
    }
    
    @PostMapping("/update")
    public void updateQtyCartItem(@RequestParam("id")Integer cartId,@RequestBody Map<String, Integer> requestPayload) {
    	int quantity = requestPayload.get("qty");
    	cartService.updateQtyCartItem(quantity, cartId);
    }

	@DeleteMapping("/delete/{cartId}")
	public void delete(@PathVariable("cartId") Integer cartId) {
		cartService.deleteCartItem(cartId);
	}
    
}
