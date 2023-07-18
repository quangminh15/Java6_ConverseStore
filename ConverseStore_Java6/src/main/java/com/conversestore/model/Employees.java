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
public class Employees {
	private int employeeId; 
	private String employeeName; 
	private String employeeAddress; 
	private String employeePhone; 
	private int year;
	private int month;
	private int day; 
	private Boolean employeeRole; 
	private String employeeEmail; 
	private String employeePassword; 
	private String employeeImage; 
	private boolean employeeStatus; 
	private LocalDate lastLogin; 
	private LocalDate dateCreated; 
}
