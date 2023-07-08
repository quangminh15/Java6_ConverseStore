package com.fpoly.converseStore.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Sizes {
	private Integer sizeID;
	private String sizeName;
	private Boolean sizeActivities;
}
