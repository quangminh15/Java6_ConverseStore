package com.conversestore.rest.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.conversestore.model.Promotions;
import com.conversestore.service.PromotionService;

@CrossOrigin("*")
@RestController
@RequestMapping("/admins/promotions")
public class PromotionRestController {
	@Autowired
	PromotionService proService;
	
	@GetMapping()
	public List<Promotions> getAll() {
		return proService.findAll();
	}
	
	@GetMapping("{promotionID}")
	public Promotions getOne(@PathVariable("promotionID") Integer promotionID) {
		return proService.findById(promotionID);
	}
	
	@PostMapping
	public Promotions create(@RequestBody Promotions promotions) {
		proService.saveStatus(promotions);
		return proService.create(promotions);
	}
	
	@PutMapping("{promotionID}")
	public Promotions update(@PathVariable("promotionID") Integer promotionID, @RequestBody Promotions promotion) {
		return proService.update(promotion);
	}
	
	@DeleteMapping("{promotionID}")
	public void delete(@PathVariable("promotionID") Integer promotionID) {
		proService.delete(promotionID);
	}

	@GetMapping("/searchPro")
    public List<Promotions> searchPromotionsByDiscountRange(
            @RequestParam("minDiscount") float minDiscount,
            @RequestParam("maxDiscount") float maxDiscount) {
        return proService.searchPromotionsByDiscountRange(minDiscount, maxDiscount);
    }
}
