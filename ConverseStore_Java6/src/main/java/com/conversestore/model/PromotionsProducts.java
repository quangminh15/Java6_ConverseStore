package com.conversestore.model;

import java.io.Serializable;

import lombok.Data;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

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
