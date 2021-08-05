package com.artish.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import com.artish.models.Profile;
import org.springframework.stereotype.Service;

import com.artish.models.Post;
import com.artish.repositories.PostRepository;

@Service
public class PostService {
	@Autowired
	PostRepository pRepo;
	
	// Display All
	public List<Post> AllPosts(){
		return this.pRepo.findAllByOrderByIdDesc();
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
	
	// Add & Remove Likers
	public void addLiker(Profile profile, Post post) {
		List<Profile> currentLikers = post.getLikers();
		currentLikers.add(profile);
		this.pRepo.save(post);
	}
	public void removeLiker(Profile profile, Post post) {
		List<Profile> currentLikers = post.getLikers();
		currentLikers.remove(profile);
		this.pRepo.save(post);
	}
	
	// Add & Remove Bookmarkers
	public void addBookmarker(Profile profile, Post post) {
		List<Profile> currentBookmarkers = post.getBookmarkers();
		currentBookmarkers.add(profile);
		this.pRepo.save(post);
	}
	public void removeBookmarker(Profile profile, Post post) {
		List<Profile> currentBookmarkers = post.getBookmarkers();
		currentBookmarkers.remove(profile);
		this.pRepo.save(post);
	}
}
