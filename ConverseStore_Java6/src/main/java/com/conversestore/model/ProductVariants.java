package com.conversestore.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ProductVariants {
	private Integer variantID;
	private Integer productID;
	private Integer sizeID;
	private Integer colorID;
	private Integer quantity;
}
