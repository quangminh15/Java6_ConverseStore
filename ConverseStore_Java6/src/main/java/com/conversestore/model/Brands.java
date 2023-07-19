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
@Table(name = "brands")
public class Brands implements Serializable {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "brand_id")
	private Integer brandID;
	
	@NotBlank(message = "{NotBlank.Brands.brandName}")
	@Size( max = 50 , message = "{Size.DanhMuc.brandName}")
	@Column(name = "brand_name")
	private String brandName;
	
	@NotBlank(message = "{NotBlank.Brands.brandImage}")
	@Column(name = "brand_image")
	private String brandImage;
	
	@NotNull(message = "{NotNull.Brands.brandActivities}")
	@Column(name = "brand_activities")
	private Boolean brandActivities;
	
	@OneToMany(mappedBy = "brands")
    List<Products> product;
	
}
