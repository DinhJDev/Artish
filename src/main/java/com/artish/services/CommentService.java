package com.artish.services;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.artish.models.Comment;
import com.artish.repositories.CommentRepository;

@Service
public class CommentService {
	@Autowired
	CommentRepository cRepo;
	
	public Comment createComment(Comment comment) {
		return this.cRepo.save(comment);
	}
	
	public List<Comment> findByPost(Long id) {
		return this.cRepo.findByPostIdOrderByIdDesc(id);
	}
	
	public void deletePost(Long id) {
		this.cRepo.deleteById(id);
	}
}
