package com.conversestore.model;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.xml.stream.events.Comment;

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
@Table(name = "products")
public class Products implements Serializable {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "product_id")
	private Integer productID;
	
	@NotBlank(message = "{NotBlank.Products.productName}")
	@Size( max = 50 , message = "{Size.Products.productName}")
	@Column(name = "product_name")
	private String productName;
	
	@Column(name = "gia")
	@NotNull(message = "{NotNull.Products.gia}")
	@Min(value = 0, message = "{Min.Products.gia}")
	private Float price;
	
	@NotBlank(message = "{NotBlank.Products.productImage1}")
	@Column(name = "product_image1")
	private String productImage1;
	
	@NotBlank(message = "{NotBlank.Products.productImage2}")
	@Column(name = "product_image2")
	private String productImage2;
	
	@NotBlank(message = "{NotBlank.Products.productImage3}")
	@Column(name = "product_image3")
	private String productImage3;
	
	@NotNull(message = "{NotNull.Products.productType}")
	@Column(name = "product_type")
	private Boolean productType;
	
	@NotNull(message = "{NotNull.Products.productActivities}")
	@Column(name = "product_activities")
	private Boolean productActivities;
	
	@Column(name = "create_date")
	private Date createDate;
	
	@Column(name = "product_description")
	private String productDescription;
	
	@OneToMany(mappedBy = "products")
  List<PromotionsProducts> promotionsProducts;
	
	@OneToMany(mappedBy = "products")
  List<Comment> comment;
	
	@OneToMany(mappedBy = "products")
  List<Favorites> favorite;
	
	@OneToMany(mappedBy = "products")
  List<ProductVariants> productVariants;
	
	@OneToMany(mappedBy = "products")
  List<SupplierProducts> supplierProducts;
	
	
	@ManyToOne
    @JoinColumn(name = "category_id")
    Categories categories;
	
	
	@ManyToOne
    @JoinColumn(name = "brand_id")
    Brands brands;
}
