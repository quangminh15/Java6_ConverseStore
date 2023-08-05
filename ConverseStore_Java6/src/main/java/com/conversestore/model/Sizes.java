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
@Table(name = "sizes") 
public class Sizes implements Serializable {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "size_id")
	private Integer sizeID;
	
	@NotNull(message = "{NotBlank.Sizes.sizeName}")
//	@Size( max = 50 , message = "{Size.Sizes.sizeName}")
	@Column(name = "size_number")
	private Float sizeNumber;
	
	@NotNull(message = "{NotNull.Sizes.sizeActivities}")
	@Column(name = "size_activities")
	private Boolean sizeActivities;
	
	@JsonIgnore
	@OneToMany(mappedBy = "sizes")
    List<ProductVariants> productVariants;
}
