package com.artish.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.artish.models.Post;

@Repository
public interface PostRepository extends CrudRepository<Post, Long>  {
	List<Post> findAll();
		
	List<Post> findByPoster(String poster);
}
