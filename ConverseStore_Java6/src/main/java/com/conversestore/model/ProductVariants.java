package com.conversestore.model;

import java.io.Serializable;
import java.util.List;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotNull;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "product_variants")
public class ProductVariants implements Serializable {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "product_id")
	private Integer variantID;

	@Column(name = "quantity")
	@NotNull(message = "{NotNull.Products.quantity}")
	@Min(value = 0, message = "{Min.Products.quantity}")
	private Float quantity;
	
	@OneToMany(mappedBy = "product_variants")
    List<OrderDetail> ordersdetails;
	
	@OneToMany(mappedBy = "product_variants")
    List<CartItem> cartsItems;
	
	@NotNull(message = "{NotNull.Products.sizes}")
	@ManyToOne
    @JoinColumn(name = "size_id")
    Sizes sizes;
	
	@NotNull(message = "{NotNull.Products.colors}")
	@ManyToOne
    @JoinColumn(name = "color_id")
    Colors colors;
}
