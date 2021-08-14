package com.artish.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.artish.models.Login;
import com.artish.models.Profile;

@Repository
public interface ProfileRepository extends CrudRepository<Profile, Long> {
	Profile findByLogin(Login login);
}
