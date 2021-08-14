package com.artish.repositories;

import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

import com.artish.models.Login;
import com.artish.models.Profile;

@Repository
public interface ProfileRepository extends PagingAndSortingRepository<Profile, Long> {
	Optional<Profile> findById(Long id);
	Profile findByLogin(Login login);
	
	Page<Profile> findAll(Pageable pageable);
}
