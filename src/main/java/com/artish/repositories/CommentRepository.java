package com.artish.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.artish.models.Comment;

public interface CommentRepository extends JpaRepository<Comment, Long> {
	List<Comment> findByPostIdOrderByIdDesc(Long id);
}
