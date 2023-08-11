package com.conversestore.model;
import java.io.Serializable;
import java.time.LocalDate;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "employees")
public class Employees implements Serializable{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "employee_id")
	private int employeeId; 
	
	@NotBlank(message = "{NotBlank.Employees.employeeName}")
	@Size( max = 50 , message = "{Size.Employees.employeeName}")
	@Column(name = "employee_name")
	private String employeeName; 
	
	@NotNull(message = "{NotNull.Employees.employeeAddress}")
	@Column(name = "employee_address")
	private String employeeAddress; 
	
	@NotNull(message = "{NotNull.Employees.employeePhone}")
	@Column(name = "employee_phone")
	private String employeePhone; 
	
	@NotNull(message = "{NotNull.Employees.employeeYear}")
	@Column(name = "employee_year")
	private int employeeYear;
	
	@NotNull(message = "{NotNull.Employees.employeeMonth}")
	@Column(name = "employee_month")
	private int employeeMonth;
	
	@NotNull(message = "{NotNull.Employees.employeeDay}")
	@Column(name = "employee_day")
	private int employeeDay; 
	
	@NotNull(message = "{NotNull.Employees.employeeRole}")
	@Column(name = "employee_role")
	private Boolean employeeRole; 
	
	@NotNull(message = "{NotNull.Employees.employeeEmail}")
	@Column(name = "employee_email")
	private String employeeEmail; 
	
	@NotNull(message = "{NotNull.Employees.employeePassword}")
	@Column(name = "employee_password")
	private String employeePassword; 
	
	@NotNull(message = "{NotNull.Employees.employeeImage}")
	@Column(name = "employee_image")
	private String employeeImage; 
	
	@NotNull(message = "{NotNull.Employees.employeeStatus}")
	@Column(name = "employee_status")
	private boolean employeeStatus; 
	
//	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "HH:mm dd-MM-yyyy")
	@NotNull(message = "{NotNull.Employees.lastLogin}")
	@Column(name = "last_login")
	private String lastLogin; 
	
//	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "HH:mm dd-MM-yyyy")
	@NotNull(message = "{NotNull.Employees.dateCreated}")
	@Column(name = "date_created")
	private LocalDate dateCreated; 
	
	@JsonIgnore
	@OneToMany(mappedBy = "employees", fetch = FetchType.EAGER)
    List<Comment> comment;
}
