package com.conversestore.model;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.Data;


@Data
@Entity
@Table(name="suppliers")
public class Suppliers implements Serializable {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "supplier_id")
	Integer supplierID;
	
	@Column(name = "supplier_name")
	String supplierName;
	
	@Column(name = "addresss")
	String addresss;
	
	@Column(name = "phone")
	String phone;
	
	@Column(name = "email")
	String email;
	
	@Column(name = "statuss")
	Boolean statuss;
	
	@JsonIgnore
	@OneToMany(mappedBy = "suppliers")
	List<SupplierProducts> supplierproducts;
	
}
