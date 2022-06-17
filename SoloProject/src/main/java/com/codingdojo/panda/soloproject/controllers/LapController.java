package com.codingdojo.panda.soloproject.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;

import com.codingdojo.panda.soloproject.models.Lap;
import com.codingdojo.panda.soloproject.models.User;
import com.codingdojo.panda.soloproject.services.LapService;
import com.codingdojo.panda.soloproject.services.UserService;

@Controller
public class LapController {
	@Autowired
	private UserService userServ;
	@Autowired
	private LapService lapServ;
	
	@GetMapping("/myLaps")
	public String myLaps(Model model, HttpSession session) {
		User user = userServ.findUser((Long)session.getAttribute("newUser"));
		model.addAttribute("track1", lapServ.channelIslands(user));
    	model.addAttribute("track2", lapServ.freedomPark(user));
    	model.addAttribute("track3", lapServ.hotRodHobbies(user));
		
		return "myLaps.jsp";
	}
	
	@GetMapping("/newlap")
	public String add(Lap lap) {
		return "newLap.jsp";
	}
	@PostMapping("/create/lap")
	public String createLap(@Valid @ModelAttribute("lap") Lap lap, BindingResult result, Model model, HttpSession session) {
		if (result.hasErrors()) {
			   
			return "newLap.jsp";
	   }
		User user = userServ.findUser((Long)session.getAttribute("newUser"));
		model.addAttribute("user", new User());
		lap.setUser(user);
		lapServ.createLap(lap);
		return "redirect:/myLaps";
	}
	@DeleteMapping("/lap/{id}/delete")
	public String destroy(@PathVariable("id") Long id) {
		lapServ.deleteLap(id);
		return "redirect:/myLaps";
	}
	@GetMapping("/lap/{id}/edit")
	   public String editPage(Model model, @PathVariable("id") Long id, HttpSession session) {
	   	Lap lap = lapServ.findLapById(id);
	   	model.addAttribute("lap", lap);
	   	return "edit.jsp";
	   }
	@PutMapping("/edit/lap")
	public String edit(@Valid @ModelAttribute("lap") Lap lap, BindingResult result, Model model, HttpSession session) {
		if (result.hasErrors()) {
			return "/edit.jsp";
		}
		else {
			User user = userServ.findUser((Long)session.getAttribute("newUser"));
			model.addAttribute("user", user);
			lap.setUser(user);
			lapServ.createLap(lap);
			return "redirect:/home";
		}
	}
	@GetMapping("/show/track/{id}")
	public String showTrack(Model model, HttpSession session, @PathVariable("id") Long id) {
		Lap lap = lapServ.findLapById(id);
		List <Lap> track = lapServ.findByTrack(lap.getTrack());
		model.addAttribute("track", track);
		model.addAttribute("lap", lap);
		return "showTrack.jsp";
	}
}
