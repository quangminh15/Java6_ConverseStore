package com.conversestore.model;

import java.io.Serializable;
import java.util.Date;

import lombok.Data;

@Data
//@Entity
//@Table(name="promotions")
public class Promotions implements Serializable {
//	@Id
//	@GeneratedValue(strategy = GenerationType.IDENTITY)
//	@Column(name = "promotion_id")
	Integer promotionID;
	
//	@Column(name = "promotion_name")
	String promotionName;
	
//	@Column(name = "start_date")
	String startDate;
	
//	@Column(name = "end_date")
	String endDate;
	
//	@Column(name = "statuss")
	String status;
	
//	@Column(name = "discount")
	Float discount;
	
//	@Column(name = "describe")
	String describe;
	
//	@OneToMany(mappedBy = "promotions")
//  List<Products> products;
	
}
