package com.conversestore.model;

import java.io.Serializable;

import javax.persistence.Id;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@Data
@AllArgsConstructor
@NoArgsConstructor
public class ReportCategory {
	@Id
	Serializable group;
	Long sum;
}
