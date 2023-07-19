package com.conversestore.model;

import java.io.Serializable;
import java.util.List;

import lombok.Data;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

@Data
@Entity
@Table(name="suppliers")
public class Suppliers implements Serializable {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "supplier_id")
	Integer SupplierID;
	
	@Column(name = "supplier_name")
	String SupplierName;
	
	@Column(name = "addresss")
	String Addresss;
	
	@Column(name = "phone")
	String Phone;
	
	@Column(name = "email")
	String Email;
	
	@Column(name = "statuss")
	Boolean Statuss;
	
	@OneToMany(mappedBy = "suppliers")
	List<SupplierProducts> supplierproducts;
	
}
