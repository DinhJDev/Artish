package com.artish.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.artish.models.Login;

@Repository
public interface LoginRepository extends CrudRepository<Login, Long> {
    Login findByUsername(String username);
}