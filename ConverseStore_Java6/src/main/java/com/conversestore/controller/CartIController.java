package com.conversestore.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.conversestore.model.ProductVariants;
import com.conversestore.service.ProductVariantService;
import com.conversestore.service.ShoppingCartService;

@Controller
public class CartIController {

	@GetMapping("/cart")
	public String getCart() {
		return "user/giohang";
	}
}
