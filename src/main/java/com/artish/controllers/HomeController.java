package com.artish.controllers;

import java.security.Principal;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.artish.models.Login;
import com.artish.models.Post;
import com.artish.models.Profile;
import com.artish.services.LoginService;
import com.artish.services.PostService;
import com.artish.services.StorageService;

@Controller
public class HomeController {
	@Autowired
	LoginService loginService;
	@Autowired
	PostService postService;
	@Autowired
	StorageService storageService;
	
	@GetMapping("/")
    public String registerForm(@Valid @ModelAttribute("login") Login login, @Valid @ModelAttribute("profile") Profile profile) {
        return "welcomePage.jsp";
    }
	@PostMapping("/registration")
    public String registration(@Valid @ModelAttribute("login") Login login, BindingResult result, Model model) {
        if (result.hasErrors()) {
            return "welcomePage.jsp";
        }
        login.getProfile().setProfilePicture("https://merriam-webster.com/assets/mw/images/article/art-wap-article-main/egg-3442-e1f6463624338504cd021bf23aef8441@1x.jpg");
        loginService.saveWithUserRole(login);
        return "redirect:/login";
    }
    
    @GetMapping("/login")
    public String login() {
        return "loginPage.jsp";
    }
    
    
    @PostMapping("/login")
    public String login(@RequestParam(value="error", required=false) String error, @RequestParam(value="logout", required=false) String logout, Model model) {
        if(error != null) {
            model.addAttribute("errorMessage", "Invalid Credentials, Please try again.");
        }
        if(logout != null) {
            model.addAttribute("logoutMessage", "Logout Successful!");
        }
        return "loginPage.jsp";
    }
    @GetMapping(value = {"/home"})
    public String home(Principal principal, Model model, @Valid @ModelAttribute("post") Post post) {
        String username = principal.getName();
        model.addAttribute("currentUser", loginService.findByUsername(username));
        model.addAttribute("recentPosts", postService.AllPosts());
        return "homePage.jsp";
    }
    @PostMapping("/createPost")
    public String createPost(@Valid @ModelAttribute("post") Post post, BindingResult result, Model model, Principal principal, @RequestParam(value = "file") MultipartFile file) {
    	String username = principal.getName();
        Login poster = loginService.findByUsername(username);
    	post.setPoster(poster.getProfile());
    	post.setMediaUrl("https://artish-bucket.s3.us-east-2.amazonaws.com/" + storageService.uploadFile(file));
    	postService.createPost(post);
    	return "redirect:/home";
    }
    @GetMapping("/like/{id}")
    public String likeIdea(@PathVariable("id") Long id, Principal principal) {
    	String username = principal.getName();
        Login liker = loginService.findByUsername(username);
        Post post = postService.getOnePost(id);
        this.postService.addLiker(liker.getProfile(), post);
        return "redirect:/home";
    }
    @GetMapping("/unlike/{id}")
    public String unlikeIdea(@PathVariable("id") Long id, Principal principal) {
    	String username = principal.getName();
        Login liker = loginService.findByUsername(username);
        Post post = postService.getOnePost(id);
        this.postService.removeLiker(liker.getProfile(), post);
        return "redirect:/home";
    }
}