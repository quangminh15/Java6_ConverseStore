package com.conversestore.model;
import java.io.Serializable;
import java.time.LocalDate;
import java.util.List;


import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
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
	
	@OneToMany(mappedBy = "customers")
    List<Comment> comment;

	@OneToMany(mappedBy = "customers")
    List<Favorites> favorite;
	
	@OneToMany(mappedBy = "customers")
    List<Receivers> receiver;
	
	@OneToMany(mappedBy = "customers")
    List<Cart> cart;
}
