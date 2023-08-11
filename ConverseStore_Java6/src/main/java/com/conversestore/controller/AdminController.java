package com.conversestore.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {
	
	@RequestMapping("/admin_khuyenmai")
	public String khuyenmai(Model model) {
		model.addAttribute("title","KHUYẾN MÃI");
		return "admin/admin_KhuyenMai";
	}
//LongHai Start
	@RequestMapping("/admin_donhang")
	public String donHang(Model model) {
		model.addAttribute("title","ĐƠN HÀNG");
		return "admin/admin_DonHang";
	}
	@RequestMapping("/admin_donhangchitiet")
	public String chiTitetdonHang(Model model) {
		model.addAttribute("title","CHI TIẾT ĐƠN HÀNG");
		return "admin/admin_ChiTietDonHang";
	}
//LOngHai End
	


}
