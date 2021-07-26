package com.artish.controllers;

import java.security.Principal;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.artish.models.Post;
import com.artish.models.User;
import com.artish.services.PostService;
import com.artish.services.UserService;

@Controller
public class HomeController {
	@Autowired
	UserService userService;
	@Autowired
	PostService postService;
	
	@GetMapping("/")
    public String registerForm(@Valid @ModelAttribute("user") User user) {
        return "welcomePage.jsp";
    }
	@PostMapping("/registration")
    public String registration(@Valid @ModelAttribute("user") User user, BindingResult result, Model model) {
        if (result.hasErrors()) {
            return "welcomePage.jsp";
        }
        userService.saveWithUserRole(user);
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
    
    @GetMapping("/home")
    public String home(Principal principal, Model model, @Valid @ModelAttribute("post") Post post) {
        String username = principal.getName();
        model.addAttribute("currentUser", userService.findByUsername(username));
        model.addAttribute("recentPosts", postService.AllPosts());
        return "homePage.jsp";
    }
    @PostMapping("/createPost")
    public String createPost(@Valid @ModelAttribute("post") Post post, BindingResult result, Model model, Principal principal) {
    	String username = principal.getName();
        User poster = userService.findByUsername(username);
    	post.setPoster(poster);
    	postService.createPost(post);
    	return "redirect:/home";
    }
}