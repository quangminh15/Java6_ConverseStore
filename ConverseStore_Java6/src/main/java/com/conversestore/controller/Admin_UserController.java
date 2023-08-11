package com.conversestore.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.conversestore.service.CustomerService;
import com.conversestore.service.EmployeeService;

@Controller
public class Admin_UserController {

	
	@Autowired
	CustomerService customerService;
	
	@Autowired
	EmployeeService employeeService;
	
	@RequestMapping("/admin/adminUserManagement")
	public String nguoiDung(Model model) {
		model.addAttribute("title","Người dùng");
		customerService.findAll();
		return "admin/admin_NguoiDung";
	}
 

}
