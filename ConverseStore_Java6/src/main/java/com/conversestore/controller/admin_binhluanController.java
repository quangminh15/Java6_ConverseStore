package com.conversestore.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.conversestore.dao.CommentDAO;
import com.conversestore.model.Comment;

@RestController
public class admin_binhluanController {
	@Autowired
	CommentDAO dao;
	
	@GetMapping("/admin/binhluan")
	public String index(Model model) {
		List<Comment> cmt = dao.findAll();
		model.addAttribute("form",cmt);
		return "admin/admin_BinhLuan";
	}
}
