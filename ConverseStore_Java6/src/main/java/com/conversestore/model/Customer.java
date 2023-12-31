package com.conversestore.model;

import java.io.Serializable;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.datatype.jsr310.deser.LocalDateDeserializer;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "customers")
public class Customer implements Serializable {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "customer_id")
	private int customerId;

	@NotBlank(message = "{NotBlank.Customer.customerName}")
	@Size(max = 50, message = "{Size.Customer.customerName}")
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
	
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "HH:mm dd-MM-yyyy")
	@NotNull(message = "{NotNull.Customer.lastLogin}")
	@Column(name = "last_login")
	private LocalDateTime lastLogin; 
	
	
	@NotNull(message = "{NotNull.Customer.dateCreated}")
	@Column(name = "date_created")
	private LocalDateTime dateCreated;

	@JsonIgnore
	@OneToMany(mappedBy = "customers", fetch = FetchType.EAGER)
	List<Comment> comment;

	@JsonIgnore
	@OneToMany(mappedBy = "customers")
	List<Cart> cart;

	@JsonIgnore
	@OneToMany(mappedBy = "customers")
    List<Favorites> favorite;
	
	@JsonIgnore	
	@OneToMany(mappedBy = "customer")
    List<Order> order;
	
	public Customer(int x) {
		if (x == 0) {
			this.setCustomerAddress("");
			this.setCustomerDay(0);
this.setCustomerEmail("");
			this.setCustomerImage("");
			this.setCustomerMonth(0);
			this.setCustomerName("");
			this.setCustomerPassword("");
			this.setCustomerPhone("");
			this.setCustomerStatus(true);
			this.setCustomerYear(0);
			this.setLastLogin(LocalDateTime.now());
			this.setDateCreated(LocalDateTime.now());
		}
	}
	
	public Customer(Customer c) {
			this.setCustomerId(c.getCustomerId());
			this.setCustomerAddress(c.getCustomerAddress());
			this.setCustomerDay(c.getCustomerDay());
			this.setCustomerEmail(c.getCustomerEmail());
			this.setCustomerImage(c.getCustomerImage());
			this.setCustomerMonth(c.getCustomerMonth());
			this.setCustomerName(c.getCustomerName());
			this.setCustomerPassword(c.getCustomerPassword());
			this.setCustomerPhone(c.getCustomerPhone());
			this.setCustomerStatus(c.isCustomerStatus());
			this.setCustomerYear(c.getCustomerYear());
			this.setLastLogin(c.getLastLogin());
			this.setDateCreated(c.getDateCreated());
	}
	
	public Customer(String name, String email, String pass) {
		 
			this.setCustomerAddress("");
			this.setCustomerDay(0);
			this.setCustomerEmail(email);
			this.setCustomerImage("");
			this.setCustomerMonth(0);
			this.setCustomerName(name);
			this.setCustomerPassword(pass);
			this.setCustomerPhone("");
			this.setCustomerStatus(true);
			this.setCustomerYear(0);
			this.setLastLogin(LocalDateTime.now());
			this.setDateCreated(LocalDateTime.now());
		
	}
}