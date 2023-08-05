package com.conversestore.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

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
	
	@Temporal(TemporalType.DATE)
	@Column(name = "create_date")
	private Date createDate = new Date();
	
	private boolean status = false;
	
	@Column(name = "admin_reply")
	private String adminReply;
	
	@Temporal(TemporalType.DATE)
	@Column(name = "date_reply")
	private Date dateReply = new Date();
	
	private boolean hidden = true;
	
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
