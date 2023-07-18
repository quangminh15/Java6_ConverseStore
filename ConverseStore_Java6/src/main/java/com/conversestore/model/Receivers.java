package com.conversestore.model;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
//@Entity
//@Table(name = "receivers")
public class Receivers {
//	@Id
//	@GeneratedValue(strategy = GenerationType.IDENTITY)
//	@Column(name = "receiver_id")
	Integer receiver_id;
	
	String name;
	String address;
	String phone;
	
//	@ManyToOne
//	@JoinColumn(name = "customer_id")
//	Customer cus;
	
//	@OneToMany(mappedBy = "orders")
	List<Order> order;
}
