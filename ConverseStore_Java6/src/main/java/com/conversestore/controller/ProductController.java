package com.conversestore.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.conversestore.dao.ProductVariantDAO;
import com.conversestore.dao.PromotionsDAO;
import com.conversestore.dao.PromotionsProductsDAO;
import com.conversestore.model.Comment;
import com.conversestore.model.ProductVariants;
import com.conversestore.model.Products;
import com.conversestore.model.Promotions;
import com.conversestore.model.PromotionsProducts;
import com.conversestore.service.CommentService;
import com.conversestore.service.ProductService;
import com.conversestore.service.ProductVariantService;

@Controller
public class ProductController {
	@Autowired
	ProductService productservice;
	
	@Autowired
	CommentService cmtservice;
	
	@Autowired
	ProductVariantService variantservice;
	
	@Autowired
	ProductVariantDAO VariantDAO;
	
	@Autowired
	PromotionsProductsDAO PromotionsProductsDAO;

//	QuangMinh Start
	@RequestMapping("/trangchu")
	public String index(Model model) {
		model.addAttribute("title", "TRANG CHỦ");
		List<PromotionsProducts> list1 = PromotionsProductsDAO.findAll();
		model.addAttribute("PromotionsProducts", list1);
		return "user/trangchu";
	}

	@RequestMapping("/sanpham")
	public String sanpham(Model model, @RequestParam("cid") Optional<Integer> cid,
			@RequestParam("bid") Optional<Integer> bid) {
		model.addAttribute("title", "SẢN PHẨM");
		if (cid.isPresent()) {
			List<Products> list = productservice.findByCategoryID(cid.get());
			model.addAttribute("productitems", list);
		} else if (bid.isPresent()) {
			List<Products> list = productservice.findByBrandID(bid.get());
			model.addAttribute("productitems", list);
		} else {
			List<Products> list = productservice.findAll();
			model.addAttribute("productitems", list);
		}
		List<PromotionsProducts> list1 = PromotionsProductsDAO.findAll();
		model.addAttribute("PromotionsProducts", list1);
		return "user/sanpham";
	}

	@RequestMapping("/sanpham/chitietsp/{productID}")
	public String sanphamchitiet(Model model, @PathVariable("productID") Integer productID) {
	    model.addAttribute("title", "CHI TIẾT SẢN PHẨM");
	    List<Comment> comments = cmtservice.findByProductID(productID);
	    model.addAttribute("comments", comments);

	    Products item = productservice.findById(productID);
	    // Lấy thông tin chương trình khuyến mãi (nếu có)
	    Promotions promotions = item.getPromotions();
	    model.addAttribute("productitem", item);
	    model.addAttribute("promotions", promotions);

	    return "user/sanphamCT";
	}


	@RequestMapping("/gioithieu")
	public String gioithieu(Model model) {
		model.addAttribute("title", "GIỚI THIỆU");
		return "user/gioithieu";
	}
	
//	admin
	
	@RequestMapping({"/admin","/admin/home/index"})
	public String adminHomeProduct(Model model) {
		model.addAttribute("title","DANH MỤC SẢN PHẨM");
		return "redirect:/assets/layout_admin.html";
	}

//QuangMinh End
	
}
