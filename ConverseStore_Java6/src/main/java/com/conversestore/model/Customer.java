package com.conversestore.model;
import java.io.Serializable;
import java.time.LocalDate;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "customers")
public class Customer implements Serializable{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "customer_id")
	private int customerId; 
	
	@NotBlank(message = "{NotBlank.Customer.customerName}")
	@Size( max = 50 , message = "{Size.Customer.customerName}")
	@Column(name = "customer_name")
	private String customerName;
	
	@NotNull(message = "{NotNull.Customer.customerAddress}")
	@Column(name = "customer_address")
	private String customerAddress; 
	
	@NotNull(message = "{NotNull.Customer.customerPhone}")
	@Column(name = "customer_phone")
	private String customerPhone; 
	
	@NotNull(message = "{NotNull.Customer.customerYear}")
	@Column(name = "customer_year")
	private int customerYear;
	
	@NotNull(message = "{NotNull.Customer.customerMonth}")
	@Column(name = "customer_month")
	private int customerMonth;
	
	@NotNull(message = "{NotNull.Customer.customerDay}")
	@Column(name = "customer_day")
	private int customerDay;
	
	@NotNull(message = "{NotNull.Customer.customerEmail}")
	@Column(name = "customer_email")
	private String customerEmail; 
	
	@NotNull(message = "{NotNull.Customer.customerPassword}")
	@Column(name = "customer_password")
	private String customerPassword; 
	
	@NotNull(message = "{NotNull.Customer.customerImage}")
	@Column(name = "customer_image")
	private String customerImage; 
	
	@NotNull(message = "{NotNull.Customer.customerStatus}")
	@Column(name = "customer_status")
	private boolean customerStatus; 
	
	@NotNull(message = "{NotNull.Customer.lastLogin}")
	@Column(name = "last_login")
	private LocalDate lastLogin; 
	
	@NotNull(message = "{NotNull.Customer.dateCreated}")
	@Column(name = "date_created")
	private LocalDate dateCreated; 
	
	@JsonIgnore
	@OneToMany(mappedBy = "customers")
    List<Comment> comment;
	
	@JsonIgnore
	@OneToMany(mappedBy = "customers")
    List<Cart> cart;
	
	@JsonIgnore
	@OneToMany(mappedBy = "customers")
    List<Favorites> favorite;
	
	@JsonIgnore	
	@OneToMany(mappedBy = "customers")
    List<Receiver> receiver;
	
	
}
