package com.conversestore.model;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
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
@Table(name = "brands")
public class Brands implements Serializable {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "brand_id")
	private Integer brandID;

	@NotBlank(message = "{NotBlank.Brands.brandName}")
	@Size(max = 50, message = "{Size.DanhMuc.brandName}")
	@Column(name = "brand_name")
	private String brandName;

	@NotBlank(message = "{NotBlank.Brands.brandImage}")
	@Column(name = "brand_image")
	private String brandImage;

	@NotNull(message = "{NotNull.Brands.brandActivities}")
	@Column(name = "brand_activities")
	private Boolean brandActivities;
	
	@JsonIgnore
	@OneToMany(mappedBy = "brands")
	List<Products> product;

}
