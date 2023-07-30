package com.conversestore.model;

import java.io.Serializable;
import java.util.Date;

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
