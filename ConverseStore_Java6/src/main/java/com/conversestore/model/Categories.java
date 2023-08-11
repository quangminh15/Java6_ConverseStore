package com.conversestore.model;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

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

	@Column(name = "category_name")
	private String categoryName;

	@Column(name = "category_image")
	private String categoryImage;

	@Column(name = "category_activities")
	private Boolean categoryActivities;
	
	@JsonIgnore
	@OneToMany(mappedBy = "categories", fetch = FetchType.EAGER)
    List<Products> product;
}
