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
@Table(name = "sizes") 
public class Sizes implements Serializable {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "size_id")
	private Integer sizeID;
	
	@NotBlank(message = "{NotBlank.Sizes.sizeName}")
	@Size( max = 50 , message = "{Size.Sizes.sizeName}")
	@Column(name = "size_number")
	private String sizeNumber;
	
	@NotNull(message = "{NotNull.Sizes.sizeActivities}")
	@Column(name = "size_activities")
	private Boolean sizeActivities;
	
	@OneToMany(mappedBy = "product_variants")
    List<ProductVariants> productVariants;
}
