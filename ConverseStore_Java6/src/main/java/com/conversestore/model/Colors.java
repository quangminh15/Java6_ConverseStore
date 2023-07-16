package com.conversestore.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
//@Entity
//@Table(name = "colors")
public class Colors { //  implements Serializable {
//	@Id
//	@GeneratedValue(strategy = GenerationType.IDENTITY)
//	@Column(name = "color_id")
	private Integer colorID;
	
//	@NotBlank(message = "{NotBlank.Colors.colorName}")
//	@Size( max = 50 , message = "{Size.Colors.colorName}")
//	@Column(name = "color_name")
	private String colorName;
	
//	@NotNull(message = "{NotNull.Colors.colorActivities}")
//	@Column(name = "color_activities")
	private Boolean colorActivities;
	
//	@OneToMany(mappedBy = "product_variants")
//  List<ProductVariants> productVariants;
}
