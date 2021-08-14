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
			<a class="navbar-brand" href="/home">Artish.</a>
			<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
		      <span class="navbar-toggler-icon"></span>
		    </button>
		    <div class="collapse navbar-collapse " id="navbarText">
		      <ul class="navbar-nav me-auto ms-auto mb-2 mb-lg-0">
		        <li class="nav-item">
		          <a class="nav-link active" aria-current="page" href="#">Home</a>
		        </li>
		        <li class="nav-item">
		          <a class="nav-link" href="#">Challenges</a>
		        </li>
		        <li class="nav-item">
		          <a class="nav-link" href="#">Explore</a>
		        </li>
		        <li class="nav-item">
		          <a class="nav-link" href="#">Bookmarks</a>
		        </li>
		      </ul>
			</div>
			<div class="dropdown">
				<a class="nav-link dropdown-toggle" href="#" id="navbarDarkDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
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
		   			<div class="card">
		   				<div class="card-body">
		   					
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
		   			</div>
		   			<!-- Posts -->
		   			<c:forEach items="${userPosts}" var="post">
			   			<div class="card mt-3">
			   				<div class="card-body">
				   				<div class="row">
				   					<div class="col-1">
							   			<a href="/u/<c:out value='${post.poster.login.username}'/>"><img class="icon" src=<c:out value="${post.poster.profilePicture}"/>></a>
							   		</div>
							   		<div class="col"><a href="/u/<c:out value='${post.poster.login.username}'/>"><strong><c:out value="${post.poster.displayName}"/></strong> @<c:out value="${post.poster.login.username}"/></a> - <fmt:formatDate pattern="MMM, dd" value="${post.createdAt}"/></div>
						   		</div>
						   		<img class="postMedia mt-3" src="${post.mediaUrl}">
			   					<div>
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
			   						<i class="far fa-comment-alt"></i>
			   					</div>
			   					<p><strong><c:out value="${post.likers.size()}"/> likes</strong></p>
			   					<p><strong><c:out value="${post.poster.login.username}"/></strong> <c:out value = "${post.content}"/></p>
			   					<c:choose>
			   						<c:when test="${post.comments.size()>2}">
				   						<p>View all <c:out value="${post.comments.size()}"/> comments</p>
				   						<c:forEach begin="${post.comments.size()-2}" end="${post.comments.size()}" var="i">
				   							<p><strong><c:out value="${post.comments[i].commenter.login.username}"/></strong> <c:out value="${post.comments[i].content}"/></p>
				   						</c:forEach>
				   					</c:when>
				   					<c:otherwise>
				   						<c:forEach items="${post.comments}" var="comments">
				   							<p><strong><c:out value="${comments.commenter.login.username}"/></strong> <c:out value="${comments.content}"/></p>
				   						</c:forEach>
				   					</c:otherwise>
				   				</c:choose>
				   				<form:form method="POST" action="/createComment/${post.id}" modelAttribute="comment">
				   					<form:input path="content" class="form-control" placeholder="Add a comment..."/>
				   					<button class="btn btn-secondary">Post</button>
				   				</form:form>
			   				</div>
			   			</div>
			   		</c:forEach>
		   		</div>
		   		<div class="col">
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