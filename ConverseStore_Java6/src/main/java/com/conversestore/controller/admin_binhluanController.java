package com.conversestore.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.conversestore.model.Comment;
import com.conversestore.service.CommentService;

@Controller
public class admin_binhluanController {
	@Autowired
	CommentService commentService;
	
	@RequestMapping("/admin_binhluan")
	public String list(Model model, @RequestParam("cid") Optional<Integer> cid) {
		if(cid.isPresent()) {
			List<Comment> list = commentService.findByProductID(cid.get());
			model.addAttribute("comments",list);
		} else {
			List<Comment> cmt = commentService.findAll();
			model.addAttribute("comments",cmt);
		}
		return "admin/admin_BinhLuan";
	}
}
