package com.artish.models;

import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
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
import javax.persistence.OneToOne;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.validation.constraints.Size;

@Entity
@Table(name="profiles")
public class Profile {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;
	@Size(max=50)
	private String displayName;
	private String profilePicture;
	@Size(max=30)
	private String Location;
	@Size(max=160)
	private String About;
	@Column(updatable=false)
	private Date created_at;
	private Date updated_at;
	@OneToOne(mappedBy="profile", cascade=CascadeType.ALL, fetch=FetchType.LAZY)
	private Login login;
	@ManyToMany(fetch = FetchType.LAZY)
	@JoinTable(
		name="pronouns_profiles",
		joinColumns = @JoinColumn(name = "profile_id"),
		inverseJoinColumns = @ JoinColumn(name = "pronoun_id")
	)
	private List<Pronoun> pronouns;
	
	@OneToMany(mappedBy = "poster", fetch = FetchType.LAZY)
	private List<Post> posts;
	@OneToMany(mappedBy="commenter", fetch = FetchType.LAZY)
	private List<Comment> comments;
	@ManyToMany(fetch=FetchType.LAZY)
	@JoinTable(
		name = "likers_posts",
		joinColumns = @JoinColumn(name = "liker_id"),
		inverseJoinColumns = @JoinColumn(name = "post_id")
	)
	private List<Post> postsLiked;
	@ManyToMany(fetch=FetchType.LAZY)
	@JoinTable(
		name = "bookmarkers_posts",
		joinColumns = @JoinColumn(name = "bookmarker_id"),
		inverseJoinColumns = @JoinColumn(name = "post_id")
	)
	private List<Post> postsBookmarked;
	@ManyToMany(fetch = FetchType.LAZY)
	@JoinTable(
		name = "followers_followee",
		joinColumns = @JoinColumn(name = "follower_id"),
		inverseJoinColumns = @JoinColumn(name = "followee_id")
	)
	private List<Profile> following;
	@ManyToMany(fetch = FetchType.LAZY)
	@JoinTable(
		name = "followers_followee",
		joinColumns = @JoinColumn(name = "followee_id"),
		inverseJoinColumns = @JoinColumn(name = "follower_id")
	)
	private List<Profile> followers;
	
	@PrePersist
    protected void onCreate() {
    	this.created_at = new Date();
    }
    @PreUpdate
    protected void onUpdate() {
    	this.updated_at = new Date();
    }
    
    public Profile() {
    	
    }
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getDisplayName() {
		return displayName;
	}
	public void setDisplayName(String displayName) {
		this.displayName = displayName;
	}
	public String getLocation() {
		return Location;
	}
	public void setLocation(String location) {
		Location = location;
	}
	public String getAbout() {
		return About;
	}
	public void setAbout(String about) {
		About = about;
	}
	public Date getCreated_at() {
		return created_at;
	}
	public void setCreated_at(Date created_at) {
		this.created_at = created_at;
	}
	public Date getUpdated_at() {
		return updated_at;
	}
	public void setUpdated_at(Date updated_at) {
		this.updated_at = updated_at;
	}
	public Login getLogin() {
		return login;
	}
	public void setLogin(Login login) {
		this.login = login;
	}
	public List<Pronoun> getPronouns() {
		return pronouns;
	}
	public void setPronouns(List<Pronoun> pronouns) {
		this.pronouns = pronouns;
	}
	public List<Post> getPosts() {
		return posts;
	}
	public void setPosts(List<Post> posts) {
		this.posts = posts;
	}
	public List<Comment> getComments() {
		return comments;
	}
	public void setComments(List<Comment> comments) {
		this.comments = comments;
	}
	public List<Post> getPostsLiked() {
		return postsLiked;
	}
	public void setPostsLiked(List<Post> postsLiked) {
		this.postsLiked = postsLiked;
	}
	public List<Post> getPostsBookmarked() {
		return postsBookmarked;
	}
	public void setPostsBookmarked(List<Post> postsBookmarked) {
		this.postsBookmarked = postsBookmarked;
	}
	public List<Profile> getFollowing() {
		return following;
	}
	public void setFollowing(List<Profile> following) {
		this.following = following;
	}
	public List<Profile> getFollowers() {
		return followers;
	}
	public void setFollowers(List<Profile> followers) {
		this.followers = followers;
	}
	public String getProfilePicture() {
		return profilePicture;
	}
	public void setProfilePicture(String profilePicture) {
		this.profilePicture = profilePicture;
	}
	
}
