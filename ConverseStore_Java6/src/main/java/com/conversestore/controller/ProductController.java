package com.conversestore.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
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

	@RequestMapping("/trangchu")
	public String index(Model model) {
		model.addAttribute("title", "TRANG CHỦ");
		List<PromotionsProducts> list1 = PromotionsProductsDAO.findAllUser();
		model.addAttribute("PromotionsProducts", list1);
		return "user/trangchu";
	}

	@RequestMapping("/sanpham")
	public String sanpham(Model model, @RequestParam("page") Optional<Integer> page,
			@RequestParam("cid") Optional<Integer> cid, @RequestParam("bid") Optional<Integer> bid,
			@RequestParam("productType") Optional<Boolean> productType,
			@RequestParam("sortType") Optional<String> sortType, @RequestParam("keyword") Optional<String> keyword) {
		int pageSize = 12;
		int currentPage = page.orElse(0);
		Pageable pageable = PageRequest.of(currentPage, pageSize);

		Page<Products> pagedProducts = handleOtherParams(pageable, cid, bid, productType, sortType, keyword);

		model.addAttribute("productitems", pagedProducts);

		// Các thông tin khác cho giao diện
		List<PromotionsProducts> list1 = PromotionsProductsDAO.findAll();
		model.addAttribute("PromotionsProducts", list1);

		// Thêm thông tin về trang trước và trang tiếp theo
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("hasPreviousPage", currentPage > 0);
		model.addAttribute("hasNextPage", pagedProducts.hasNext());
		model.addAttribute("totalPages", pagedProducts.getTotalPages());

		return "user/sanpham";
	}

	private Page<Products> handleOtherParams(Pageable pageable, Optional<Integer> cid, Optional<Integer> bid,
			Optional<Boolean> productType, Optional<String> sortType, Optional<String> keyword) {
		if (cid.isPresent()) {
			return productservice.findByCategoryIDPaged(cid.get(), pageable);
		} else if (bid.isPresent()) {
			return productservice.findByBrandIDPaged(bid.get(), pageable);
		} else if (productType.isPresent()) {
			return productservice.findByProductTypePaged(productType.get(), pageable);
		} else if (sortType.isPresent()) {
			if (sortType.get().equals("asc")) {
				return productservice.sortByPriceAscPaged(pageable);
			} else if (sortType.get().equals("desc")) {
				return productservice.sortByPriceDescPaged(pageable);
			}
		} else if (keyword.isPresent()) {
			return productservice.searchByNamePaged(keyword.get(), pageable);
		}

		return productservice.findAllPaged(pageable);
	}

	@RequestMapping("/sanpham/sort")
	public String sanphamSort(@RequestParam("sortType") String sortType, @RequestParam("page") Optional<Integer> page,
			Model model) {
		int pageSize = 12;
		int currentPage = page.orElse(0);
		Pageable pageable = PageRequest.of(currentPage, pageSize);

		Page<Products> pagedProducts;

		if (sortType.equals("asc")) {
			pagedProducts = productservice.sortByPriceAscPaged(pageable);
		} else if (sortType.equals("desc")) {
			pagedProducts = productservice.sortByPriceDescPaged(pageable);
		} else {
			pagedProducts = productservice.findAllPaged(pageable);
		}

		model.addAttribute("productitems", pagedProducts);

		// Các thông tin khac cho giao diện
		List<PromotionsProducts> list1 = PromotionsProductsDAO.findAll();
		model.addAttribute("PromotionsProducts", list1);

		// Thêm thông tin về trang trước và trang tiếp theo
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("hasPreviousPage", currentPage > 0);
		model.addAttribute("hasNextPage", pagedProducts.hasNext());
		model.addAttribute("totalPages", pagedProducts.getTotalPages());

		return "user/sanpham";
	}

	@RequestMapping("/search")
	public String searchProduct(Model model, @RequestParam("keyword") String keyword,
			@RequestParam(value = "page", defaultValue = "0") int page) {
		int pageSize = 12;
		Pageable pageable = PageRequest.of(page, pageSize);

		Page<Products> searchResultPage = productservice.searchByNamePaged(keyword, pageable);
		List<Products> searchResult = searchResultPage.getContent();

		// Các thông tin khac cho giao diện
		List<PromotionsProducts> list1 = PromotionsProductsDAO.findAll();

		model.addAttribute("productitems", searchResult);
		model.addAttribute("currentPage", page);
		model.addAttribute("totalPages", searchResultPage.getTotalPages());
		model.addAttribute("PromotionsProducts", list1);

		// Thêm thông tin về trang trước và trang tiếp theo
		model.addAttribute("hasPreviousPage", page > 0);
		model.addAttribute("hasNextPage", searchResultPage.hasNext());

		return "user/sanpham";
	}

	@RequestMapping("/sanpham/chitietsp/{productID}")
	public String sanphamchitiet(Model model, @PathVariable("productID") Integer productID) {
		model.addAttribute("title", "CHI TIẾT SẢN PHẨM");
//		List<Comment> comments = cmtservice.findByProductID(productID);
		List<Products> comments = (List<Products>) productservice.findById(productID);
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

	@RequestMapping("/admin")
	public String adminHomeProduct(Model model) {
		model.addAttribute("title", "DANH MỤC SẢN PHẨM");
		return "redirect:/assets/layout_admin.html";
	}
}
