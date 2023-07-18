package com.conversestore.model;

import java.io.Serializable;
import java.util.Date;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.Data;

@Data
@Entity
@Table(name="favorites")
public class Favorites implements Serializable {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "favorite_id")
	Integer favoriteID;
	
	@Column(name = "date_like")
	Date dateLike = new Date();
	
	@ManyToOne
    @JoinColumn(name = "customer_id")
    Customer customers;
	
	@ManyToOne
    @JoinColumn(name = "product_id")
    Products products;
}
