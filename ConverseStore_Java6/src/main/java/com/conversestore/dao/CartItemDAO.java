package com.conversestore.dao;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.conversestore.model.Cart;
import com.conversestore.model.CartItem;
import com.conversestore.model.ProductVariants;


public interface CartItemDAO extends JpaRepository<CartItem, Integer> {
	
	
	CartItem findByProductVariant(ProductVariants prod);
	
	@Transactional
	@Modifying
	@Query(nativeQuery = true, value = "EXEC SP_InsertCartItem  :cartId, :productId, :sizeId, :colorId, :quantity")
    void insertCartItem(
        @Param("cartId") long cartId,
        @Param("productId") long productId,
        @Param("sizeId") long sizeId,
        @Param("colorId") long colorId,
        @Param("quantity") int quantity
    );
	@Transactional
	@Modifying
    @Query("UPDATE CartItem c SET c.quantity = ?1 WHERE c.cartItemId = ?2")
    void updateCartItemQuantity(@Param("cartItemId") Integer cartItemId, @Param("quantity") int quantity);
	
	@Query("SELECT ci FROM CartItem ci WHERE ci.cart.customers.customerId=?1")
    List<CartItem> findCartItemsByCustomerId(Integer customerId);

    List<CartItem> findByCart(Cart cart);
}
