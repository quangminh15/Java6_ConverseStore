package com.conversestore.model;

import java.io.Serializable;

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
