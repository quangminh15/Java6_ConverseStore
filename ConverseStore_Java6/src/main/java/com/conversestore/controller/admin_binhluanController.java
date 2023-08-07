package com.conversestore.controller;

import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.conversestore.model.Comment;
import com.conversestore.service.CommentService;

@Controller
public class admin_binhluanController {
	@Autowired
	CommentService commentService;
	
	
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
	
//	@PostMapping("/api/comments")
//    public ResponseEntity<String> submitComment(@RequestBody Comment comment) {
//        // Lưu bình luận vào cơ sở dữ liệu
//        commentService.saveComment(comment);
//        
//        return ResponseEntity.ok("Bình luận đã được gửi thành công!");
//    } // Đảm bảo rằng bạn có một CommentRepository đã được tạo

	    @PostMapping("/submit-comment")
	    public String submitComment(@RequestParam String commentText) {
	        Comment comment = new Comment();
	        comment.setComment(commentText);
	        comment.setCreateDate(new Date()); // Ngày hiện tại
	        comment.setStatus(false); // Trạng thái chờ duyệt
	        commentService.saveComment(comment);	        
	        // Thực hiện chuyển hướng hoặc trả về một trang thành công
	        return "redirect:/sanpham/chitietsp/" + 1;
	    }
}
