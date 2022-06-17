package com.codingdojo.panda.soloproject.controllers;


import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.codingdojo.panda.soloproject.models.Lap;
import com.codingdojo.panda.soloproject.models.LoginUser;
import com.codingdojo.panda.soloproject.models.User;
import com.codingdojo.panda.soloproject.services.LapService;
import com.codingdojo.panda.soloproject.services.UserService;

@Controller
public class MainController {
	@Autowired
	private UserService userServ;
	@Autowired
	private LapService lapServ;
	@GetMapping("/")
    public String index(Model model) {
        model.addAttribute("newUser", new User());
        model.addAttribute("newLogin", new LoginUser());
        return "index.jsp";
    }
	@GetMapping("/home")
    public String home(Model model, HttpSession session) {
		User user = userServ.findUser((Long)session.getAttribute("newUser"));
    	List <Lap> channel = lapServ.findByTrack("Channel Islands Raceway");
    	List <Lap> freedom = lapServ.findByTrack("Freedom Park");
    	List <Lap> hotRod = lapServ.findByTrack("Hot Rod Hobbies");
    	model.addAttribute("user", user);
    	model.addAttribute("track1", channel.get(0));
    	model.addAttribute("track2", freedom.get(0));
    	model.addAttribute("track3", hotRod.get(0));
    	return "dashboard.jsp";
    }
	@PostMapping("/register")
    public String register(@Valid @ModelAttribute("newUser") User newUser, 
            BindingResult result, Model model, HttpSession session) {
        userServ.register(newUser, result);
        if(result.hasErrors()) {
            model.addAttribute("newLogin", new LoginUser());
            return "index.jsp";
        }
        session.setAttribute("newUser", newUser.getId());
        return "redirect:/home";
    }
	@PostMapping("/login")
    public String login(@Valid @ModelAttribute("newLogin") LoginUser newLogin, 
            BindingResult result, Model model, HttpSession session) {
        User user = userServ.login(newLogin, result);
        if(result.hasErrors()) {
        model.addAttribute("newUser", new User());    
            return "index.jsp";
        }
        
        session.setAttribute("newUser", user.getId());
        return "redirect:/home";
    }
	@GetMapping("/logout")
    public String logout(HttpSession session) {
    	session.invalidate();
    	return "redirect:/";
    }
}
