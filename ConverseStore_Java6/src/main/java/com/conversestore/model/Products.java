package com.conversestore.model;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.Min;
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
@Table(name = "products")
public class Products implements Serializable {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "product_id")
	private Integer productID;

	@NotBlank(message = "{NotBlank.Products.productName}")
	@Size(max = 50, message = "{Size.Products.productName}")
	@Column(name = "product_name")
	private String productName;

	@Column(name = "price")
	@NotNull(message = "{NotNull.Products.price}")
	@Min(value = 0, message = "{Min.Products.price}")
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

	@Temporal(TemporalType.DATE)
	@Column(name = "create_date")
	private Date createDate = new Date();

	@Column(name = "product_description")
	private String productDescription;

	@JsonIgnore
	@OneToMany(fetch = FetchType.EAGER,mappedBy = "products")
	List<PromotionsProducts> promotionsProducts;

	@JsonIgnore
	@OneToMany(mappedBy = "products")
	List<Comment> comment;

	@JsonIgnore
	@OneToMany(mappedBy = "products")
	List<Favorites> favorite;

	@JsonIgnore
	@OneToMany(mappedBy = "products")
	List<ProductVariants> productVariants;

	@JsonIgnore
	@OneToMany(mappedBy = "products")
	List<SupplierProducts> supplierProducts;

	@ManyToOne
	@JoinColumn(name = "category_id")
	Categories categories;

	@ManyToOne
	@JoinColumn(name = "brand_id")
	Brands brands;
	
	public Promotions getPromotions() {
        if (promotionsProducts != null && !promotionsProducts.isEmpty()) {
            return promotionsProducts.get(0).getPromotions();
        }
        return null;
    }
}
