package com.conversestore.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {
	
//	QuangMinh Start
	@RequestMapping("/admin_danhmuc")
	public String DanhMucsp(Model model) {
		model.addAttribute("title","DANH MỤC SẢN PHẨM");
		return "admin/admin_DanhMuc";
	}
	
	@RequestMapping("/admin_thuonghieu")
	public String ThuongHieu(Model model) {
		model.addAttribute("title","THƯƠNG HIỆU SẢN PHẨM");
		return "admin/admin_ThuongHieu";
	}
	
	@RequestMapping("/admin_sanpham")
	public String SanPham(Model model) {
		model.addAttribute("title","SẢN PHẨM SẢN PHẨM");
		return "admin/admin_SanPham";
	}
	
	@RequestMapping("/admin_sanphamCT")
	public String sanPhamCT(Model model) {
		model.addAttribute("title","SẢN PHẨM CHI TIẾT");
		return "admin/admin_SanPhamCT";
	}
	
	@RequestMapping("/admin_mau")
	public String mauSP(Model model) {
		model.addAttribute("title","MÀU SẢN PHẨM");
		return "admin/admin_Mau";
	}
	
	@RequestMapping("/admin_size")
	public String SizeSP(Model model) {
		model.addAttribute("title","SIZE SẢN PHẨM");
		return "admin/admin_Size";
	}
	
	
	
//	QuangMinh End
	
	@RequestMapping("/admin_ncc")
	public String ncc(Model model) {
		model.addAttribute("title","NHÀ CUNG CẤP");
		return "admin/admin_NhaCungCap";
	}
	
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
	

	
	//Linh start
	@RequestMapping("/admin_binhluan")
	public String binhluan() {
		return "admin/admin_BinhLuan";
	}
	//Linh end

}
