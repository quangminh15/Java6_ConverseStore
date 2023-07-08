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
}
