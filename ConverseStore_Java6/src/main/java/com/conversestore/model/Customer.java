package com.conversestore.model;
import java.time.LocalDate;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
//@Entity
//@Table(name = "")
public class Customer {
	private int customerId; 
	private String customerName; 
	private String customerAddress; 
	private String customerPhone; 
	private LocalDate customerBirthday; 
	private String customerEmail; 
	private String customerPassword; 
	private String customerImage; 
	private boolean customerStatus; 
	private LocalDate lastLogin; 
	private LocalDate dateCreated; 
}
