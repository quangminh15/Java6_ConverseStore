package com.conversestore.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Usercontroller {
	
//	QuangMinh Start
	@RequestMapping("/trangchu")
	public String index(Model model) {
		model.addAttribute("title","TRANG CHỦ");
		return "user/trangchu";
	}
	
	@RequestMapping("/sanpham")
	public String sanpham(Model model) {
		model.addAttribute("title","SẢN PHẨM");
		return "user/sanpham";
	}
	
	@RequestMapping("/sanphamCT")
	public String sanphamchitiet(Model model) {
		model.addAttribute("title","CHI TIẾT SẢN PHẨM");
		return "user/sanphamCT";
	}
	
	@RequestMapping("/gioithieu")
	public String gioithieu(Model model) {
		model.addAttribute("title","GIỚI THIỆU");
		return "user/gioithieu";
	}
	
	
	
	
//QuangMinh End
	
//LongHai Start
	@RequestMapping("/giohang")
	public String cart(Model model) {
		model.addAttribute("title","GIỎ HÀNG");
		return "user/giohang";
	}
	
	@RequestMapping("/danhsachdonhang")
	public String listDonHang(Model model) {
		model.addAttribute("title","ĐƠN HÀNG");
		return "user/danhsachdonhang";
	}
	
	@RequestMapping("/donhang")
	public String donHang(Model model) {
		model.addAttribute("title","ĐƠN HÀNG");
		return "user/donhang";
	}
//LongHai End
}