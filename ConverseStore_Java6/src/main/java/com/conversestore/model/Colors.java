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
	
	@JsonIgnore
	@OneToMany(mappedBy = "colors")
    List<ProductVariants> productVariants;
}
