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
@Table(name="supplier_products")
public class SupplierProducts implements Serializable {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "supplier_product_id")
	Integer SupplierProductID;
	
	@ManyToOne
	@JoinColumn(name = "supplier_id")
	Suppliers suppliers;
	
	@ManyToOne
	@JoinColumn(name = "product_id")
	Products products;
}
