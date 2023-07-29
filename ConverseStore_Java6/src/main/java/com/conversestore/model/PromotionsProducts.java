package com.conversestore.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import lombok.Data;


@Data
@Entity
@Table(name="promotions_products")
public class PromotionsProducts implements Serializable {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "promotion_product_id")
	Integer PromotionProductID;
	
	@ManyToOne
	@JoinColumn(name = "promotion_id")
	Promotions promotions;
	
	@ManyToOne
	@JoinColumn(name = "product_id")
	Products products;
}
