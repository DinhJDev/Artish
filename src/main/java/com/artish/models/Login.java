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
import javax.persistence.OneToOne;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name="logins")
public class Login {
 
 @Id
 @GeneratedValue(strategy=GenerationType.IDENTITY)
 private Long id;
 private String username;
 private String password;
 @Transient
 private String passwordConfirmation;
 @Column(updatable=false)
 private Date createdAt;
 private Date updatedAt;
 @ManyToMany(fetch = FetchType.EAGER)
 @JoinTable(
     name = "logins_roles", 
     joinColumns = @JoinColumn(name = "login_id"), 
     inverseJoinColumns = @JoinColumn(name = "role_id"))
 private List<Role> roles;
 @OneToOne(fetch=FetchType.LAZY)
 @JoinColumn(name="profile_id")
 private Profile profile;
 
 public Login() {
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
 
 @PrePersist
 protected void onCreate(){
     this.createdAt = new Date();
 }
 @PreUpdate
 protected void onUpdate(){
     this.updatedAt = new Date();
 }
}


