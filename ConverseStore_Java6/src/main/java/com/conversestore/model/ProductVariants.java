package com.conversestore.model;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

import com.fasterxml.jackson.annotation.JsonIgnore;

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
	@Column(name = "variant_id")
	private Integer variantID;

	@Column(name = "quantity")
	private Float quantity;
	
	@JsonIgnore
	@OneToMany(mappedBy = "productVariants")
    List<OrderDetail> ordersdetails;
	
	@JsonIgnore
	@OneToMany(mappedBy = "productVariant")
    List<CartItem> cartsItems;
	
	@NotNull(message = "{NotNull.Products.sizes}")
	@ManyToOne
    @JoinColumn(name = "size_id")
    Sizes sizes;
	
	@NotNull(message = "{NotNull.Products.colors}")
	@ManyToOne
    @JoinColumn(name = "color_id")
    Colors colors;
	
	@NotNull(message = "{NotNull.Products.colors}")
	@ManyToOne
    @JoinColumn(name = "product_id")
    Products products;
}
