package com.conversestore.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
//@Entity
//@Table(name = "cart_items")
public class CartItem {
//	@Id
//	@GeneratedValue(strategy = GenerationType.IDENTITY)
//	@Column(name = "cart_item_id")
	private Integer cartItemId;
	
//	@ManyToOne
//	@JoinColumn(name = "cart_id")
	Cart cart;
	
//	@ManyToOne
//	@JoinColumn(name = "variant_id")
	ProductVariants pv;
	
	private Integer quantity;
	
}
