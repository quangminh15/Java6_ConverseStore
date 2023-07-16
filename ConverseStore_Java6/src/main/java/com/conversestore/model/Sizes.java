package com.conversestore.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
//@Entity
//@Table(name = "sizes") 
public class Sizes { //  implements Serializable {
//	@Id
//	@GeneratedValue(strategy = GenerationType.IDENTITY)
//	@Column(name = "size_id")
	private Integer sizeID;
	
//	@NotBlank(message = "{NotBlank.Sizes.sizeName}")
//	@Size( max = 50 , message = "{Size.Sizes.sizeName}")
//	@Column(name = "size_number")
	private String sizeNumber;
	
//	@NotNull(message = "{NotNull.Sizes.sizeActivities}")
//	@Column(name = "size_activities")
	private Boolean sizeActivities;
	
//	@OneToMany(mappedBy = "product_variants")
//  List<ProductVariants> productVariants;
}
