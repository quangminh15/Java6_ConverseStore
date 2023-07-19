package com.conversestore.model;

import java.io.Serializable;
import java.util.Date;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name="comments")
public class Comment implements Serializable{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "comment_id")
	private Integer commentID;
	
	private String comment;
	
	@Column(name = "create_date")
	private Date createDate;
	
	private boolean status;
	
	@Column(name = "admin_reply")
	private String adminReply;
	
	@Column(name = "date_reply")
	private Date dateReply;
	
	private boolean hidden;
	
	@ManyToOne
	@JoinColumn(name ="product_id")
	Products products;
	
	@ManyToOne
	@JoinColumn(name ="employee_id")
	Employees employees;
	
	@ManyToOne
	@JoinColumn(name ="customer_id")
	Customer customers;
}
