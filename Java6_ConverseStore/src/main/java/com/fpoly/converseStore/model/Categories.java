package com.fpoly.converseStore.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Categories {
	private Integer categoryID;
	private String categoryName;
	private String categoryImage;
	private Boolean categoryActivities;
}
