package com.artish.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;

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
	public List<Post> getAllPostsDesc(Integer pageNo, Integer pageSize, String sortBy) {
		Pageable paging = PageRequest.of(pageNo, pageSize, Sort.by(sortBy).descending());
		Page<Post> pagedResult = pRepo.findAll(paging);
		return pagedResult.getContent();
	}
	public List<Post> getAllPostsAsc(Integer pageNo, Integer pageSize, String sortBy) {
		Pageable paging = PageRequest.of(pageNo, pageSize, Sort.by(sortBy).ascending());
		Page<Post> pagedResult = pRepo.findAll(paging);
		return pagedResult.getContent();
	}
	public List<Post> getFollowingPosts(String username){
		return this.pRepo.findByPosterFollowersLoginUsername(username);
	}
	
	public List<Post> listAll(String keyword) {
		if (keyword != null) {
			return pRepo.findByContentIgnoreCaseContainingOrPosterLoginUsernameIgnoreCaseContainingOrPosterDisplayNameIgnoreCaseContaining(keyword, keyword, keyword);
		}
		return pRepo.findAll();
	}
	
	// Create
	public Post createPost(Post post) {
		return this.pRepo.save(post);
	}
	
	// Read
	public Post getOnePost(Long id) {
		return this.pRepo.findById(id).orElse(null);
	}
	// Find by Poster
	public List<Post> getPostsByPoster(String username) {
		return this.pRepo.findByPosterLoginUsernameOrderByIdDesc(username);
	}
	public List<Post> getArtworkByPoster(String username) {
		return this.pRepo.findByPosterLoginUsernameAndMediaUrlStartingWith(username, "https://artish-bucket.s3.us-east-2.amazonaws.com/");
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
	public List<Post> getPostsByLiker(String username) {
		return this.pRepo.findByLikersLoginUsername(username);
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
	
	public List<Post> getPostsByBookmarker(String username) {
		return this.pRepo.findByBookmarkersLoginUsername(username);
	}
}
