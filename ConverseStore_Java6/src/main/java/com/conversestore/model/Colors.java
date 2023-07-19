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
@Table(name = "colors")
public class Colors implements Serializable {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "color_id")
	private Integer colorID;
	
	@NotBlank(message = "{NotBlank.Colors.colorName}")
	@Size( max = 50 , message = "{Size.Colors.colorName}")
	@Column(name = "color_name")
	private String colorName;
	
	@NotNull(message = "{NotNull.Colors.colorActivities}")
	@Column(name = "color_activities")
	private Boolean colorActivities;
	
	@OneToMany(mappedBy = "colors")
    List<ProductVariants> productVariants;
}
