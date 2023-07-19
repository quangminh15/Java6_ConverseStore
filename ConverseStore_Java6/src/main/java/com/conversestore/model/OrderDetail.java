package com.conversestore.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "orderdetails")
public class OrderDetail {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "orderdetail_id")
	private Integer orderDetailId;
	
	private Integer quantity;
	
	@ManyToOne
	@JoinColumn(name = "variant_id")
	ProductVariants pv;
	@ManyToOne
	@JoinColumn(name = "order_id")
	Order order;
}
