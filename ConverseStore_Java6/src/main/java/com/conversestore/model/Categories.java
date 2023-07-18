package com.conversestore.model;

import java.io.Serializable;
import java.util.List;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
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
@Table(name = "categories")
public class Categories implements Serializable {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "category_id")
	private Integer categoryID;
	
	@NotBlank(message = "{NotBlank.Categories.categoryName}")
	@Size( max = 50 , message = "{Size.Categories.categoryName}")
	@Column(name = "category_name")
	private String categoryName;
	
	@NotBlank(message = "{NotBlank.Categories.categoryImage}")
	@Column(name = "category_image")
	private String categoryImage;
	
	@NotNull(message = "{NotNull.Categories.categoryActivities}")
	@Column(name = "category_activities")
	private Boolean categoryActivities;
	
	@OneToMany(mappedBy = "products")
    List<Products> product;
}
