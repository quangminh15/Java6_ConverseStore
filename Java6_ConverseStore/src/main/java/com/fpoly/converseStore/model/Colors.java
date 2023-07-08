package com.fpoly.converseStore.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Colors {
	private Integer colorID;
	private String colorName;
	private Boolean colorActivities;
}
