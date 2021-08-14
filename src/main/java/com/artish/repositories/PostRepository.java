package com.artish.repositories;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.artish.models.Post;

@Repository
public interface PostRepository extends JpaRepository<Post, Long>  {
	// Newest First
	List<Post> findAllByOrderByIdDesc();
		
	List<Post> findByPosterLoginUsernameOrderByIdDesc(String username);
	List<Post> findByBookmarkersLoginUsername(String username);
	List<Post> findByLikersLoginUsername(String username);
	List<Post> findByPosterFollowersLoginUsername(String username);
	Page<Post> findAll(Pageable pageable); 
	
	List<Post>findByPosterLoginUsernameAndMediaUrlStartingWith(String username, String url);
    List<Post> findByContentIgnoreCaseContainingOrPosterLoginUsernameIgnoreCaseContainingOrPosterDisplayNameIgnoreCaseContaining(String content, String username, String displayName);
}
