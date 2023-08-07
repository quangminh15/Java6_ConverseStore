package com.conversestore.controller;

import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.apache.tomcat.util.net.openssl.ciphers.Authentication;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.conversestore.model.Comment;
import com.conversestore.model.Products;
import com.conversestore.service.CommentService;
import com.conversestore.service.ProductService;

@Controller
public class admin_binhluanController {
	@Autowired
	CommentService commentService;
	
	@Autowired
	ProductService productService;
	
	
	@RequestMapping("/admin_binhluan")
	public String list(Model model, @RequestParam("pid") Optional<Integer> pid, @RequestParam("cusid") Optional<Integer> cusid, @RequestParam("eid") Optional<Integer> eid) {
		if(pid.isPresent()) {
			List<Comment> list = commentService.findByProductID(pid.get());
			model.addAttribute("comments",list);
			model.addAttribute("pid", pid.get());
			
		}if(cusid.isPresent()) {
			List<Comment> list = commentService.findByCustomerID(cusid.get());
			model.addAttribute("comments",list);
			model.addAttribute("cusid", cusid.get());
		}if(eid.isPresent()) {
			List<Comment> list = commentService.findByEmployeeID(eid.get());
			model.addAttribute("comments",list);
		} else {
			List<Comment> cmt = commentService.findAll();
			model.addAttribute("comments",cmt);
		}
		return "admin/admin_BinhLuan";
	}
	
	 @GetMapping("/sanpham/chitietsp/{productId}")
	    public String getChiTietSanPham(@PathVariable Integer productId, Model model) {
	        // Lấy sản phẩm và danh sách bình luận từ database
	        Products product = productService.findById(productId);
	        List<Comment> comments = commentService.findByProductID(productId);

	        model.addAttribute("productitem", product);
	        model.addAttribute("comments", comments);
	        model.addAttribute("newComment", new Comment()); // Để thêm bình luận mới

	        return "user/sanphamCT";
	    }

//	    @PostMapping("/addComment")
//	    public String addComment(@ModelAttribute("newComment") Comment comment) {
//	        // Lưu bình luận vào database
//	        commentService.saveComment(comment);
//
//	        // Chuyển hướng về trang chi tiết sản phẩm sau khi thêm bình luận
//	        return "redirect:/sanpham/chitietsp/" + comment.getProducts();
//	    }
	 @PostMapping("/addComment")
	    public String submitComment(@RequestParam("productID") Integer productID,
	                                 @RequestParam("customerID") Integer customerID,
	                                 @RequestParam("comment") String commentText) {
	        commentService.createComment(productID, customerID, commentText);
	        return "redirect:/sanpham/chitietsp/" + productID;
	    }
}
