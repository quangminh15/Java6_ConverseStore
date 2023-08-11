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

	@Column(name = "product_name")
	private String productName;

	@Column(name = "price")
	private Float price;

	@Column(name = "product_image1")
	private String productImage1;

	@Column(name = "product_image2")
	private String productImage2;

	@Column(name = "product_image3")
	private String productImage3;

	@Column(name = "product_type")
	private Boolean productType;

	@Column(name = "product_activities")
	private Boolean productActivities;

	@Temporal(TemporalType.DATE)
	@Column(name = "create_date")
	private Date createDate = new Date();

	@Column(name = "product_description")
	private String productDescription;

	@JsonIgnore
	@OneToMany(mappedBy = "products", fetch = FetchType.EAGER)
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
