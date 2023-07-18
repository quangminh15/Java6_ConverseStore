package com.conversestore.model;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
//@Entity
//@Table(name = "orders")
public class Order {
//	@Id
//	@GeneratedValue(strategy = GenerationType.IDENTITY)
//	@Column(name = "order_id")
	private Integer orderId;
	
	private String orderDate;
	
	private double total;
	
	private String status;
	
//	@ManyToOne
//	@JoinColumn(name = "receiver_id")
	Receivers rec;
	
//	@OneToMany(mappedBy = "orders")
	List<OrderDetail> orderD;
}
