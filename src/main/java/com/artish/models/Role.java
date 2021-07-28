package com.artish.models;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

@Entity
@Table(name="roles")
public class Role {
 @Id
 @GeneratedValue(strategy=GenerationType.IDENTITY)
 private Long id;
 private String name;
 @ManyToMany(fetch = FetchType.EAGER)
 @JoinTable(
	     name = "logins_roles", 
	     joinColumns = @JoinColumn(name = "role_id"), 
	     inverseJoinColumns = @JoinColumn(name = "login_id"))
 private List<Login> logins;
 
 public Role() {
 }
 
 public Long getId() {
     return id;
 }
 public void setId(Long id) {
     this.id = id;
 }
 public String getName() {
     return name;
 }
 public void setName(String name) {
     this.name = name;
 }

	public List<Login> getLogins() {
		return logins;
	}
	
	public void setLogins(List<Login> logins) {
		this.logins = logins;
	}
}

