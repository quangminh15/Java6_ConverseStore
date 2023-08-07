package com.conversestore.rest.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.conversestore.model.Comment;
import com.conversestore.service.CommentService;

@CrossOrigin("*")
@RestController
@RequestMapping("/rest/comments")
public class CommentRestController {
	@Autowired
	CommentService commentService;
	
	@GetMapping("{commentID}")
	public Comment getOne(@PathVariable("commentID") Integer commentID) {
		return commentService.findById(commentID);
	}
	
	@GetMapping()
	public List<Comment> getAll(){
		return commentService.findAll();
	}
	@PutMapping("{commentID}")
	public Comment update(@PathVariable("commentID") Integer commentID, @RequestBody Comment cmt) {
		return commentService.update(cmt);
	}
	
	@DeleteMapping("{commentID}")
	public void delete(@PathVariable("commentID") Integer commentID) {
		commentService.delete(commentID);
	}
}
