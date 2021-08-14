package com.artish.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.artish.models.Post;

@Repository
public interface PostRepository extends JpaRepository<Post, Long>  {
	// Newest First
	List<Post> findAllByOrderByIdDesc();
		
	List<Post> findByPosterLoginUsernameOrderByIdDesc(String username);
}
