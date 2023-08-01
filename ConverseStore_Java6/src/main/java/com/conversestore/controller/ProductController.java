package com.conversestore.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.conversestore.model.Products;
import com.conversestore.service.ProductService;

@Controller
public class ProductController {
	@Autowired
	ProductService productservice;

//	QuangMinh Start
	@RequestMapping("/trangchu")
	public String index(Model model) {
		model.addAttribute("title", "TRANG CHỦ");
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
		return "user/sanpham";
	}

	@RequestMapping("/sanpham/chitietsp/{productID}")
	public String sanphamchitiet(Model model, @PathVariable("productID") Integer productID) {
		model.addAttribute("title", "CHI TIẾT SẢN PHẨM");
		Products item = productservice.findById(productID);
		model.addAttribute("productitem", item);
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
	
//	@RequestMapping("/admin_danhmuc")
//	public String DanhMucsp(Model model) {
//		model.addAttribute("title","DANH MỤC SẢN PHẨM");
//		return "admin/admin_DanhMuc";
//	}
//	
//	@RequestMapping("/admin_thuonghieu")
//	public String ThuongHieu(Model model) {
//		model.addAttribute("title","THƯƠNG HIỆU SẢN PHẨM");
//		return "admin/admin_ThuongHieu";
//	}
//	
//	@RequestMapping("/admin_sanpham")
//	public String SanPham(Model model) {
//		model.addAttribute("title","SẢN PHẨM SẢN PHẨM");
//		return "admin/admin_SanPham";
//	}
//	
//	@RequestMapping("/admin_sanphamCT")
//	public String sanPhamCT(Model model) {
//		model.addAttribute("title","SẢN PHẨM CHI TIẾT");
//		return "admin/admin_SanPhamCT";
//	}
//	
//	@RequestMapping("/admin_mau")
//	public String mauSP(Model model) {
//		model.addAttribute("title","MÀU SẢN PHẨM");
//		return "admin/admin_Mau";
//	}
//	
//	@RequestMapping("/admin_size")
//	public String SizeSP(Model model) {
//		model.addAttribute("title","SIZE SẢN PHẨM");
//		return "admin/admin_Size";
//	}

//QuangMinh End
}
