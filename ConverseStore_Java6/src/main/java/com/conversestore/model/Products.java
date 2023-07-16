package com.conversestore.model;

import java.util.Date;

import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotNull;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
//@Entity
//@Table(name = "colors")
public class Products { //  implements Serializable {
//	@Id
//	@GeneratedValue(strategy = GenerationType.IDENTITY)
//	@Column(name = "product_id")
	private Integer productID;
	
//	@NotBlank(message = "{NotBlank.Products.productName}")
//	@Size( max = 50 , message = "{Size.Products.productName}")
//	@Column(name = "product_name")
	private String productName;
	
//	@Column(name = "gia")
//	@NotNull(message = "{NotNull.Products.gia}")
//	@Min(value = 0, message = "{Min.Products.gia}")
	private Float price;
	
//	@NotBlank(message = "{NotBlank.Products.productImage1}")
//	@Column(name = "product_image1")
	private String productImage1;
	
//	@NotBlank(message = "{NotBlank.Products.productImage2}")
//	@Column(name = "product_image2")
	private String productImage2;
	
//	@NotBlank(message = "{NotBlank.Products.productImage3}")
//	@Column(name = "product_image3")
	private String productImage3;
	
//	@NotNull(message = "{NotNull.Products.productType}")
//	@Column(name = "product_type")
	private Boolean productType;
	
//	@NotNull(message = "{NotNull.Products.productActivities}")
//	@Column(name = "product_activities")
	private Boolean productActivities;
	
//	@Column(name = "create_date")
	private Date createDate;
	
//	@Column(name = "product_description")
	private String productDescription;
	
//	@OneToMany(mappedBy = "promotions_products")
//  List<PromotionsProducts> promotionsProducts;
	
//	@OneToMany(mappedBy = "comments")
//  List<Comment> comment;
	
//	@OneToMany(mappedBy = "favorites")
//  List<Favorites> favorite;
	
//	@OneToMany(mappedBy = "product_variants")
//  List<ProductVariants> productVariants;
	
//	@OneToMany(mappedBy = "supplier_products")
//  List<SupplierProducts> supplierProducts;
	
//	@NotNull(message = "{NotNull.Products.categories}")
//	@ManyToOne
//    @JoinColumn(name = "category_id")
//    Categories categories;
	
//	@NotNull(message = "{NotNull.Products.brands}")
//	@ManyToOne
//    @JoinColumn(name = "brand_id")
//    Brands brands;
}
