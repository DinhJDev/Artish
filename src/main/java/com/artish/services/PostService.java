package com.artish.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.artish.models.Post;
import com.artish.repositories.PostRepository;

@Service
public class PostService {
	@Autowired
	PostRepository pRepo;
	
	// Display All
	public List<Post> AllPosts(){
		return this.pRepo.findAll();
	}
	
	// Create
	public Post createPost(Post post) {
		return this.pRepo.save(post);
	}
	
	
	public Post getOnePost(Long id) {
		return this.pRepo.findById(id).orElse(null);
	}
	
	public Post updatePost(Post post) {
		return this.pRepo.save(post);
	}
	
	public void deletePost(Long id) {
		this.pRepo.deleteById(id);
	}
}
