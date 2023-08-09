package com.conversestore.rest.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.conversestore.service.RevenueService;

@CrossOrigin("*")
@RestController
@RequestMapping("/rest/revenues")
public class RevenueRestController {
	@Autowired
	RevenueService revenueService;
	
	@GetMapping("/doanhthuDM")
	public List<Object[]> getDoanhThuDM(){
		return  revenueService.getDoanhThu();
	}
}
