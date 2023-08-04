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
	@Autowired
	ProductVariantService prodVS;
	@Autowired
	ShoppingCartService cartService;
	
	@PostMapping("/addtocart/{id}")
	public String name(@Param("size") Integer size,@Param("color") Integer color, @PathVariable("id")Integer idProd) {
		ProductVariants prodv = prodVS.findBySizeAndolor(size, color,idProd);
		System.out.println(""+size+""+ color);
		System.out.println(prodv.getVariantID());
		
		cartService.addToCart(prodv,1);
		return "redirect:/trangchu";
	}
}
