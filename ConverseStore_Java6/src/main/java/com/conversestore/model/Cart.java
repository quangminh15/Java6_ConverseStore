package com.conversestore.model;

//import jakarta.persistence.JoinColumn;
//import jakarta.persistence.ManyToOne;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
//@Entity
//@Table(name = "carts")
public class Cart {
//	@Id
//	@GeneratedValue(strategy = GenerationType.IDENTITY)
//	@Column(name = "cart_id")
	private Integer carItd;
	
//	@ManyToOne
//	@JoinColumn(name = "customer_id")
//	Customer customer
	
}
