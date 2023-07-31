package com.conversestore.model;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import lombok.Data;


@Data
@Entity
@Table(name="promotions")
public class Promotions implements Serializable {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "promotion_id")
	Integer promotionID;
	
	@Column(name = "promotion_name")
	String promotionName;
	
	@Column(name = "start_date")
	String startDate;
	
	@Column(name = "end_date")
	String endDate;
	
	@Column(name = "statuss")
	String status;
	
	@Column(name = "discount")
	Float discount;
	
	@Column(name = "describe")
	String describe;
	
	@OneToMany(mappedBy = "promotions", fetch = FetchType.EAGER)
	List<PromotionsProducts> promotionsproducts;
	
}
