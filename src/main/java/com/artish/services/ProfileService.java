package com.artish.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.artish.models.Login;
import com.artish.models.Profile;
import com.artish.repositories.ProfileRepository;

@Service
public class ProfileService {
	@Autowired
	ProfileRepository pRepo;
	
	// Create
	public Profile createProfile(Profile profile) {
		return this.pRepo.save(profile);
	}
	
	// Read
	public Profile getOneProfile(Login login) {
		return this.pRepo.findByLogin(login);
	}
	
	// Update
	public Profile updateProfile(Profile profile) {
		return this.pRepo.save(profile);
	}
	
	// Delete
	public void deletePost(Long id) {
		this.pRepo.deleteById(id);
	}
}
