package com.artish.models;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.Email;
import javax.validation.constraints.Size;

@Entity
@Table(name="users")
public class User {
 @Id
 @GeneratedValue(strategy=GenerationType.IDENTITY)
 private Long id;
 @Size(min=3, message="Username must be greater than 3 characters")
 private String username;
 @Size(min=8, message="Password must be greater than 8 characters")
 private String password;
 @Transient
 private String passwordConfirmation;
 @Email(message="Please enter a valid email address")
 private String emailAddress;
 private String profilePicture;
 @Column(updatable=false)
 private Date createdAt;
 private Date updatedAt;
 @ManyToMany(fetch = FetchType.EAGER)
 @JoinTable(
     name = "users_roles", 
     joinColumns = @JoinColumn(name = "user_id"), 
     inverseJoinColumns = @JoinColumn(name = "role_id"))
 private List<Role> roles;
 @OneToMany(mappedBy = "poster", fetch = FetchType.LAZY)
 private List<Post> posts;
 
 @PrePersist
 protected void onCreate(){
     this.createdAt = new Date();
 }
 @PreUpdate
 protected void onUpdate(){
     this.updatedAt = new Date();
 }
 public User() {
 }
 public Long getId() {
	 return id;
 }
 public void setId(Long id) {
	 this.id = id;
 }
 public String getUsername() {
	 return username;
 }
 public void setUsername(String username) {
	 this.username = username;
 }
 public String getPassword() {
	 return password;
 }
 public void setPassword(String password) {
	 this.password = password;
 }
 public String getPasswordConfirmation() {
	 return passwordConfirmation;
 }
 public void setPasswordConfirmation(String passwordConfirmation) {
	 this.passwordConfirmation = passwordConfirmation;
 }
 public String getEmailAddress() {
	 return emailAddress;
 }
 public void setEmailAddress(String emailAddress) {
	 this.emailAddress = emailAddress;
 }
 public Date getCreatedAt() {
	 return createdAt;
 }
 public void setCreatedAt(Date createdAt) {
	 this.createdAt = createdAt;
 }
 public Date getUpdatedAt() {
	 return updatedAt;
 }
 public void setUpdatedAt(Date updatedAt) {
	 this.updatedAt = updatedAt;
 }
 public List<Role> getRoles() {
	 return roles;
 }
 public void setRoles(List<Role> roles) {
	 this.roles = roles;
 }
 public List<Post> getPosts() {
	 return posts;
 }
 public void setPosts(List<Post> posts) {
	 this.posts = posts;
 }
public String getProfilePicture() {
	return profilePicture;
}
public void setProfilePicture(String profilePicture) {
	this.profilePicture = profilePicture;
}
 
}


