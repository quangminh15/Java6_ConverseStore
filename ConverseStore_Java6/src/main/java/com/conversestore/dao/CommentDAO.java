package com.conversestore.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.conversestore.model.Comment;

public interface CommentDAO extends JpaRepository<Comment, Integer>{

}