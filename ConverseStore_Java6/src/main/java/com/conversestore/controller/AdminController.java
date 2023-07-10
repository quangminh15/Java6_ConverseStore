package com.conversestore.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {
	
//	QuangMinh Start
	@RequestMapping("/admin_danhmuc")
	public String DanhMucsp() {
		return "admin/admin_DanhMuc";
	}
	
	@RequestMapping("/admin_thuonghieu")
	public String ThuongHieu() {
		return "admin/admin_ThuongHieu";
	}
	
	@RequestMapping("/admin_sanpham")
	public String SanPham() {
		return "admin/admin_SanPham";
	}
	
	@RequestMapping("/admin_sanphamCT")
	public String sanPhamCT() {
		return "admin/admin_SanPhamCT";
	}
	
	@RequestMapping("/admin_mau")
	public String mauSP() {
		return "admin/admin_Mau";
	}
	
	@RequestMapping("/admin_size")
	public String SizeSP() {
		return "admin/admin_Size";
	}
	
//	QuangMinh End
	
	@RequestMapping("/admin_ncc")
	public String ncc() {
		return "admin/admin_NhaCungCap";
	}
	
	@RequestMapping("/admin_khuyenmai")
	public String khuyenmai() {
		return "admin/admin_KhuyenMai";
	}
//LongHai Start
	@RequestMapping("/admin_donhang")
	public String donHang() {
		return "admin/admin_DonHang";
	}
//LOngHai End
}
