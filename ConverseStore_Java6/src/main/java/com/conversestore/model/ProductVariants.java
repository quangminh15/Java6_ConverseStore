package com.conversestore.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
//@Entity
//@Table(name = "colors")
public class ProductVariants { //  implements Serializable {
//	@Id
//	@GeneratedValue(strategy = GenerationType.IDENTITY)
//	@Column(name = "product_id")
	private Integer variantID;

//	@Column(name = "quantity")
//	@NotNull(message = "{NotNull.Products.gia}")
//	@Min(value = 0, message = "{Min.Products.gia}")
	private Float quantity;
	
//	@OneToMany(mappedBy = "ordersdetails")
//  List<OrdersDetails> ordersdetails;
	
//	@OneToMany(mappedBy = "carts_items")
//  List<CartsItems> cartsItems;
	
//	@NotNull(message = "{NotNull.Products.sizes}")
//	@ManyToOne
//    @JoinColumn(name = "size_id")
//    Sizes sizes;
	
//	@NotNull(message = "{NotNull.Products.colors}")
//	@ManyToOne
//    @JoinColumn(name = "color_id")
//    Colors colors;
}
