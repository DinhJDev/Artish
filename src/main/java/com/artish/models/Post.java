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
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.validation.constraints.Size;

@Entity
@Table(name="posts")
public class Post {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;
	@Size(max=2200)
	private String content;
	@Column(updatable=false)
	private Date createdAt;
	private Date updatedAt;
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="poster_id")
	private Profile poster;
	@OneToMany(mappedBy="post", fetch = FetchType.LAZY)
	private List<Comment> comments;
	@ManyToMany(fetch = FetchType.LAZY)
	@JoinTable(
		name = "likers_posts",
		joinColumns = @JoinColumn(name = "post_id"),
		inverseJoinColumns = @JoinColumn(name = "liker_id")
	)
	private List<Profile> likers;
	@ManyToMany(fetch = FetchType.LAZY)
	@JoinTable(
	    name = "tags_posts", 
	    joinColumns = @JoinColumn(name = "post_id"), 
	    inverseJoinColumns = @JoinColumn(name = "tag_id")
	)
	@Size(max=5)
	private List<Tag> tags;
	@ManyToMany(fetch = FetchType.LAZY)
	@JoinTable(
		name = "bookmarkers_posts",
		joinColumns = @JoinColumn(name = "post_id"),
		inverseJoinColumns = @JoinColumn(name = "bookmarker_id")
	)
	private List<Profile> bookmarkers;
	
	@PrePersist
	protected void onCreate(){
	    this.createdAt = new Date();
	}
	@PreUpdate
	protected void onUpdate(){
	    this.updatedAt = new Date();
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
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
	public Profile getPoster() {
		return poster;
	}
	public void setPoster(Profile poster) {
		this.poster = poster;
	}
	public List<Comment> getComments() {
		return comments;
	}
	public void setComments(List<Comment> comments) {
		this.comments = comments;
	}
	public List<Profile> getLikers() {
		return likers;
	}
	public void setLikers(List<Profile> likers) {
		this.likers = likers;
	}
	public List<Tag> getTags() {
		return tags;
	}
	public void setTags(List<Tag> tags) {
		this.tags = tags;
	}
	public List<Profile> getBookmarkers() {
		return bookmarkers;
	}
	public void setBookmarkers(List<Profile> bookmarkers) {
		this.bookmarkers = bookmarkers;
	}
}