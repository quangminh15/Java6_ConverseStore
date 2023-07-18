package com.conversestore.model;

import java.io.Serializable;

import lombok.Data;

@Data
//@Entity
//@Table(name="suppliers")
public class Suppliers implements Serializable {
//	@Id
//	@GeneratedValue(strategy = GenerationType.IDENTITY)
//	@Column(name = "supplier_id")
	Integer SupplierID;
	
//	@Column(name = "supplier_name")
	String SupplierName;
	
//	@Column(name = "addresss")
	String Addresss;
	
//	@Column(name = "phone")
	String Phone;
	
//	@Column(name = "email")
	String Email;
	
//	@Column(name = "statuss")
	Boolean Statuss;
	
//	@OneToMany(mappedBy = "suppliers")
//  List<Products> products;
	
}
