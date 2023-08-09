package com.conversestore.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.conversestore.dao.ProductVariantDAO;
import com.conversestore.dao.PromotionsProductsDAO;
import com.conversestore.model.Comment;
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
			@RequestParam("bid") Optional<Integer> bid, @RequestParam("productType") Optional<Boolean> productType) {
		model.addAttribute("title", "SẢN PHẨM");
		if (productType.isPresent()) {
			List<Products> list = productservice.findByProductType(productType.get());
			model.addAttribute("productitems", list);
		} else if (cid.isPresent()) {
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

//	@RequestMapping("/sanpham")
//	public String sanpham(Model model, @RequestParam("cid") Optional<Integer> cid,
//			@RequestParam("bid") Optional<Integer> bid, @RequestParam("productType") Optional<Boolean> productType,
//			@RequestParam(name = "page", defaultValue = "0") int page,
//			@RequestParam(name = "size", defaultValue = "10") int size) {
//		model.addAttribute("title", "SẢN PHẨM");
//
//		Page<Products> productPage = null;
//		PageRequest pageRequest = PageRequest.of(page, size); // Tạo đối tượng PageRequest
//
//		if (productType.isPresent()) {
//			productPage = productservice.findByProductType(productType.get(), pageRequest);
//		} else if (cid.isPresent()) {
//			productPage = productservice.findByCategoryID(cid.get(), pageRequest);
//		} else if (bid.isPresent()) {
//			productPage = productservice.findByBrandID(bid.get(), pageRequest);
//		} else {
//			productPage = productservice.findAll(pageRequest); // Sử dụng pageRequest ở đây
//		}
//
//		model.addAttribute("productitems", productPage.getContent());
//		model.addAttribute("currentPage", page);
//		model.addAttribute("totalPages", productPage.getTotalPages());
//
//		List<PromotionsProducts> list1 = PromotionsProductsDAO.findAll();
//		model.addAttribute("PromotionsProducts", list1);
//		return "user/sanpham";
//	}

	@RequestMapping("/sanpham/sort")
	public String sanphamSort(@RequestParam("sortType") String sortType, Model model) {
		List<Products> list;
		if (sortType.equals("asc")) {
			list = productservice.sortByPriceAsc();
		} else if (sortType.equals("desc")) {
			list = productservice.sortByPriceDesc();
		} else {
			list = productservice.findAll();
		}
		model.addAttribute("productitems", list);
		return "user/sanpham";
	} 

//	@RequestMapping("/sanpham/sort")
//	public String sanphamSort(@RequestParam("sortType") String sortType,
//			@RequestParam(name = "page", defaultValue = "0") int page,
//			@RequestParam(name = "size", defaultValue = "10") int size, Model model) {
//		PageRequest pageRequest = PageRequest.of(page, size);
//
//		Page<Products> productPage = null;
//		if (sortType.equals("asc")) {
//			productPage = productservice.sortByPriceAsc(pageRequest);
//		} else if (sortType.equals("desc")) {
//			productPage = productservice.sortByPriceDesc(pageRequest);
//		} else {
//			productPage = productservice.findAll(pageRequest);
//		}
//
//		model.addAttribute("productitems", productPage.getContent());
//		model.addAttribute("currentPage", page);
//		model.addAttribute("totalPages", productPage.getTotalPages());
//
//		List<PromotionsProducts> list1 = PromotionsProductsDAO.findAll();
//		model.addAttribute("PromotionsProducts", list1);
//		return "user/sanpham";
//	}

	@RequestMapping("/search")
	public String searchProduct(Model model, @RequestParam("keyword") String keyword) {
		List<Products> searchResult = productservice.searchByName(keyword);
		model.addAttribute("productitems", searchResult);
		return "user/sanpham";
	}

	@RequestMapping("/sanpham/chitietsp/{productID}")
	public String sanphamchitiet(Model model, @PathVariable("productID") Integer productID) {
		model.addAttribute("title", "CHI TIẾT SẢN PHẨM");
		List<Comment> comments = cmtservice.findByProductID(productID);
		model.addAttribute("comments", comments);

		Products item = productservice.findById(productID);

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

	@RequestMapping({ "/admin", "/admin/home/index" })
	public String adminHomeProduct(Model model) {
		model.addAttribute("title", "DANH MỤC SẢN PHẨM");
		return "redirect:/assets/layout_admin.html";
	}

//QuangMinh End

}
