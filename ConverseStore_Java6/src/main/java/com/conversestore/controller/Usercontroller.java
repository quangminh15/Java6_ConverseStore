package com.conversestore.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Usercontroller {
	
//	QuangMinh Start
	@RequestMapping("/trangchu")
	public String index() {
		return "user/trangchu";
	}
	
	@RequestMapping("/sanpham")
	public String sanpham() {
		return "user/sanpham";
	}
	
	@RequestMapping("/sanphamCT")
	public String sanphamchitiet() {
		return "user/sanphamCT";
	}
	
	@RequestMapping("/gioithieu")
	public String gioithieu() {
		return "user/gioithieu";
	}
	
	
//QuangMinh End
}
