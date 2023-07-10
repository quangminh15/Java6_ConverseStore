package com.conversestore.model;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Products {
	private Integer productID;
	private String productName;
	private Float price;
	private String productImage1;
	private String productImage2;
	private String productImage3;
	private Boolean productType;
	private Boolean productActivities;
	private Date create_date;
	private String productDescription;
}
