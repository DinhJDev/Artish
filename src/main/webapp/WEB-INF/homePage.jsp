<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Welcome // Artish</title>
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
		<script src="https://code.jquery.com/jquery-3.6.0.slim.js" integrity="sha256-HwWONEZrpuoh951cQD1ov2HUK5zA5DwJ1DNUXaM6FsY=" crossorigin="anonymous"></script>
		<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.3/css/all.css" integrity="sha384-SZXxX4whJ79/gErwcOYf+zWLeJdY/qpuqC4cAa9rOGUstPomtqpuNWT9wdPEn2fk" crossorigin="anonymous">
		<link href="/css/styles.css" rel="stylesheet">
		<style>@import url('https://fonts.googleapis.com/css2?family=Montserrat:wght@500;600;700&display=swap');</style>
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
	<main>
	   	<div class="container">
	   		<div class="row">
		   		<div class="col">
		   			<div class="card">
		   				<div class="card-body">
		   					
		   				</div>
		   			</div>
		   		</div>
		   		<div class="col-6">
			   		<div class="card">
			   			<div class="card-body">
			   				<div class="row">
			   					<div class="col-1">
						   			<img class="icon" src=<c:out value="${currentUser.profile.profilePicture}"/>>
						   		</div>
						   		<div class="col">
							   		<form:form method="POST" enctype="multipart/form-data" action="/createPost" modelAttribute="post">
										<div class="input-group">
											<form:input path="content" class="form-control" placeholder="Create post..."/>
											<label class="input-group-text">
												<i class="far fa-image"></i>
												<input type="file" name="file" accept=".jpg, .jpeg, .png, .gif" class="form-control" hidden/>
											</label>
										</div>
											<div class="mt-1 d-md-flex justify-content-md-end">
												<button class="btn btn-primary">Post</button>
											</div>
							   		</form:form>
							   	</div>
					   		</div>
				   		</div>
			   		</div>
			   		<c:forEach items="${recentPosts}" var="post">
			   			<div class="card mt-3 post">
			   				<div class="card-body">
				   				<div class="row">
				   					<div class="col-1">
							   			<a href="/u/<c:out value='${post.poster.login.username}'/>"><img class="icon" src=<c:out value="${post.poster.profilePicture}"/>></a>
							   		</div>
							   		<div class="col">
							   			<div class="post-header">
							   				<p><a href="/u/<c:out value='${post.poster.login.username}'/>"><strong><c:out value="${post.poster.displayName}"/></strong> @<c:out value="${post.poster.login.username}"/></a> - <fmt:formatDate pattern="MMM, dd" value="${post.createdAt}"/></p>
							   			</div>
						   				<div>
						   					<p><c:out value = "${post.content}"/></p>
						   				</div>
						   			</div>
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
		   			<div class="card new-artists">
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
						   				<p class="display-name"><c:out value="${user.displayName}"/></p>
						   				<p class="username">@<c:out value="${user.login.username}"/></p>
							   		</div>
							   		<div class="col follow-col">
							  		<c:choose>
										<c:when test="${user.followers.contains(currentUser.profile)}">
											<form method="get" action="/unfollow/+<c:out value='${user.id}'/>">
												<button class="circle">
										   			<i class="fas fa-check"></i>
												</button>
											</form>
										</c:when>
										<c:otherwise>
											<form method="get" action="/unfollow/+<c:out value='${user.id}'/>">
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
</body>
</html>