<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title><c:out value="${profile.displayName}"/> (@<c:out value="${profile.login.username}"/>)</title>
	<link
		href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
		rel="stylesheet"
		integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
		crossorigin="anonymous">
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous">
	</script>
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.3/css/all.css" integrity="sha384-SZXxX4whJ79/gErwcOYf+zWLeJdY/qpuqC4cAa9rOGUstPomtqpuNWT9wdPEn2fk" crossorigin="anonymous">
	<link href="/css/styles.css" rel="stylesheet">
	<script src="/js/imgPreview.js"></script>
</head>
<header>
	<nav class="navbar navbar-expand-lg fixed-top navbar-dark bg-dark">
		<div class="container">
			<a class="navbar-brand" href="/home">ARTISH.</a>
			<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
		      <span class="navbar-toggler-icon"></span>
		    </button>
		    <div class="collapse navbar-collapse " id="navbarText">
		      <ul class="navbar-nav me-auto ms-auto mb-2 mb-lg-0">
		        <li class="nav-item">
		          <a class="nav-link active" aria-current="page" href="/home">Home</a>
		        </li>
		        <!--
		        <li class="nav-item">
		          <a class="nav-link" href="#">Challenges</a>
		        </li>
		        -->
		        <li class="nav-item">
		          <a class="nav-link" href="/bookmarks">Bookmarks</a>
		        </li>
		      </ul>
			</div>
			<div class="dropdown">
				<a class="nav-link dropdown-toggle username" href="#" id="navbarDarkDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
				<c:out value="${currentUser.username}"/>
				<img class="icon" src=<c:out value="${currentUser.profile.profilePicture}"/>>
				</a>
				<ul class="dropdown-menu">
					<li class="dropdown-item">
						<a href="/u/<c:out value="${currentUser.username}"/>">Profile</a>
					</li>
					<li>
					<form id="logoutForm" method="POST" action="/logout">
					        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
					        <a href="javascript:{}" onclick="document.getElementById('logoutForm').submit();" class="dropdown-item">Logout</a>
					</form>
					</li>
				</ul>
			</div>
		</div>
	</nav>
</header>
<body>
	<main class="bg-dark">
	   	<div class="container">
	   		<div class="row">
		   		<div class="col">
		   			<div class="card explore">
		   				<div class="card-header">
		   					<p>EXPLORE</p>
		   				</div>
		   				<div class="card-body">
							<form method="get" action="/home/following">
								<button class="btn btn-primary">
						   			<i class="fas fa-user-friends"></i>Following
								</button>
							</form>
							<form method="get" action="/home/latest">
								<button class="btn btn-primary">
						   			<i class="far fa-clock"></i>Latest
								</button>
							</form>
		   				</div>
		   			</div>
		   		</div>
		   		<div class="col-6">
		   			<div class="card profile">
		   				<div class="card-body">
		   					<!-- Banner -->
		   					<div class="row">
		   						<img class="icon" src=<c:out value="${profile.profilePicture}"/>>
		   					</div>
		   					<div class="row displayName">
				   				<p><c:out value="${profile.displayName}"/></p>
				   			</div>
				   			<div class="row username">
				   				<p>@<c:out value="${profile.login.username}"/></p>
				   			</div>
				   			<div class="row about">
				   				<p><c:out value="${profile.about}"/></p>
				   			</div>
				   			<div class="row location">
				   				<p><i class="fas fa-map-marker-alt"></i> <c:out value="${profile.location}"/></p>
				   			</div>
				   			<button class="btn btn-outline-secondary" type="button" id="editProfileButton" data-bs-toggle="modal" data-bs-target="#editModal">Edit profile</button>
				   			<hr>
				   			<div class="row">
				   				<div class="col border-line">
				   					<h2><c:out value="${profile.posts.size()}"/></h2>
				   					<p>Post</p>
				   				</div>
				   				<div class="col border-line">
				   					<h2><c:out value="${profile.followers.size()}"/></h2>
				   					<p>Followers</p>
				   				</div>
				   				<div class="col">
				   					<h2><c:out value="${profile.following.size()}"/></h2>
				   					<p>Following</p>
				   				</div>
				   			</div>
		   				</div>
		   				<div class="card-footer">
		   					<div class="row profile-pages">
				   				<div class="col"><p><a class="nav-link" href="/u/${profile.login.username}">Posts</a></p></div>
				   				<div class="col"><p><a class="nav-link" href="/u/${profile.login.username}/artwork">Artwork</a></p></div>
				   				<div class="col"><p><a class="nav-link active" href="/u/${profile.login.username}/likes">Likes</a></p></div>
				   			</div>
		   				</div>
		   			</div>
		   			<!-- Posts -->
		   			<c:forEach items="${userPosts}" var="post">
			   			<div class="card mt-3 post">
			   				<div class="card-body">
				   				<div class="row">
				   					<div class="col-1">
							   			<a href="/u/<c:out value='${post.poster.login.username}'/>"><img class="icon" src=<c:out value="${post.poster.profilePicture}"/>></a>
							   		</div>
							   		<div class="col">
							   			<div class="post-header">
							   				<p class="text-muted"><a class="display-name" href="/u/<c:out value='${post.poster.login.username}'/>"><c:out value="${post.poster.displayName}"/></a> <a class="username" href="/u/<c:out value='${post.poster.login.username}'/>">@<c:out value="${post.poster.login.username}"/></a><a class="username" href="/u/${post.poster.login.username}/status/${post.id}"> - <fmt:formatDate pattern="MMM, dd" value="${post.createdAt}"/></a></p>
							   				<p class="post-caption"><c:out value="${post.content}"/></p>
							   				<c:choose>
											<c:when test="${post.bookmarkers.contains(currentUser.profile)}">
												<a href="/unbookmark/+<c:out value='${post.id}'/>">
													<i class="fas fa-bookmark"></i>
												</a>
											</c:when>
											<c:otherwise>
												<a href="/bookmark/+<c:out value='${post.id}'/>">
													<i class="far fa-bookmark"></i>
												</a>
											</c:otherwise>
										</c:choose>
							   			</div>
						   			</div>
						   		</div>
						   		<a href="/u/${post.poster.login.username}/status/${post.id}">
						   		<div class="row media">
						   			<img class="postMedia mt-3" src="${post.mediaUrl}">
						   		</div>
						   		</a>
			   				</div>
			   				<div class="card-footer">
			   					<div class="row">
			   					<div class="col">
				   					<p class="statistics">
				   						<c:choose>
											<c:when test="${post.likers.contains(currentUser.profile)}">
												<a href="/unlike/+<c:out value='${post.id}'/>">
													<i class="fas fa-heart"></i>
												</a>
											</c:when>
											<c:otherwise>
												<a href="/like/+<c:out value='${post.id}'/>">
													<i class="far fa-heart"></i>
												</a>
											</c:otherwise>
										</c:choose>
										<c:out value="${post.likers.size()}"/>
										<a href="/u/${post.poster.login.username}/status/${post.id}">
				   						<i class="far fa-comment-alt"></i><c:out value="${post.comments.size()}"/>
				   						</a>
			   						</p>
			   						</div>
			   						<div class="btn-group dropup col-md-2 ml-auto">
										<button type="button" class="btn btn-secondary dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
									    	<i class="fas fa-ellipsis-h"></i>
									  	</button>
									  	<ul class="dropdown-menu">
									  		<li>
									  			<c:choose>
									  				<c:when test="${post.poster == currentUser.profile}">
												    	<form id="logoutForm" method="GET" action="/deletePost/<c:out value='${post.id}'/>">
													        <button class="dropdown-item text-danger">
																<i class="far fa-trash-alt text-danger"></i> Delete
															</button>
														</form>
													</c:when>
													<c:otherwise>
														<c:choose>
															<c:when test="${post.poster.followers.contains(currentUser.profile)}">
																<form method="get" action="/unfollow/<c:out value='${post.poster.id}'/>">
																	<button class="dropdown-item text-white">
															   			<i class="fas fa-user-minus"></i> Unfollow
																	</button>
																</form>
															</c:when>
															<c:otherwise>
																<form method="get" action="/follow/<c:out value='${post.poster.id}'/>">
																	<button class="dropdown-item text-white">
																		<i class="fas fa-user"></i> Follow
																	</button>
																</form>
															</c:otherwise>
														</c:choose>
													</c:otherwise>
												</c:choose>
											</li>
									  	</ul>
									</div>
			   					</div>
			   				</div>
			   			</div>
			   		</c:forEach>
		   		</div>
		   		<div class="col">
		   		<form method="get" action="/search/${search}" id="searchBar">
		   				<div class="input-group rounded">
						  <input class="form-control" name="search" id="search" placeholder="Search" aria-label="Search"aria-describedby="search-addon" />
						  <span class="input-group-text " id="search-addon">
						    <i class="fas fa-search"></i>
						  </span>
						</div>
		   			</form>
		   			<div class="card new-artists mt-3">
		   				<div class="card-header">
		   					<p>NEW ARTISTS</p>
		   				</div>
		   				<div class="card-body">
		   					<c:forEach items="${newestUsers}" var="user">
		   						<div class="row">
		   							<div class="col icon-col">
							   			<a href="/u/<c:out value='${user.login.username}'/>"><img class="icon" src=<c:out value="${user.profilePicture}"/>></a>
							   		</div>
							   		<div class="col">
							   		<a href="/u/<c:out value='${user.login.username}'/>">
						   				<p class="display-name"><c:out value="${user.displayName}"/></p>
						   				<p class="username">@<c:out value="${user.login.username}"/></p>
						   			</a>
							   		</div>
							   		<div class="col follow-col">
							  		<c:choose>
										<c:when test="${user.followers.contains(currentUser.profile)}">
											<form method="get" action="/unfollow/<c:out value='${user.id}'/>">
												<button class="circle">
										   			<i class="fas fa-check"></i>
												</button>
											</form>
										</c:when>
										<c:otherwise>
											<form method="get" action="/follow/<c:out value='${user.id}'/>">
												<button class="circle">
													<i class="fas fa-plus"></i>
												</button>
											</form>
										</c:otherwise>
									</c:choose>
							   		</div>
		   						</div>
		   					</c:forEach>
		   				</div>
		   				<div class="card-footer">
		   					<p class="see-more"><a href="">See more...</a></p>
		   				</div>
		   			</div>
		   		</div>
		   	</div>
		</div>
	</main>
	<div class="modal" id="editModal" tabindex="-1">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<p>Edit profile</p>
				</div>
				<div class="modal-body">
					<p><form:errors path="user.*"/></p>
					<form:form class="form" action="/editProfile/${username}" method="POST" enctype="multipart/form-data" modelAttribute="profile">
						<label class="row icon-upload" id="choose-file">
							<i class="far fa-plus-square"></i>
							<img class="icon" id="img-preview" src=<c:out value="${profile.profilePicture}"/>>
							<input type="file" name="file" accept=".jpg, .jpeg, .png, .gif" class="form-control" hidden/>
						</label>
						<div class="form-floating mb-3">
							<form:input path="displayName" class="form-control"/>
							<form:label path="displayName" class="floatingInput">Display Name</form:label>
						</div>
						<div class="form-floating mb-3">
							<form:input path="about" class="form-control"/>
							<form:label path="about" class="floatingInput">Bio</form:label>
						</div>
						<div class="form-floating mb-3">
							<form:input path="location" class="form-control"/>
							<form:label path="location" class="floatingInput">Location</form:label>
						</div>
						
						<button class="btn btn-primary">Save</button>
					</form:form>
				</div>
				<div class="modal-footer">
				</div>
			</div>
		</div>
	</div>
</body>
</html>