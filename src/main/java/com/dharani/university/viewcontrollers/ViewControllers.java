package com.dharani.university.viewcontrollers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.dharani.university.pojo.UserDetails;
import com.dharani.university.repositories.UserDetailsRepository;

@Controller
public class ViewControllers {

	@Autowired
	private UserDetailsRepository userDetailsRepository;

	@RequestMapping(value = "/")
	public String getIndexPage(ModelAndView mv) {
		return "welcome";
	}

	@RequestMapping(value = "/login")
	public String getLandingPage(@RequestParam(name = "username") String username,
			@RequestParam(name = "password") String password, ModelAndView mv) {
		UserDetails userDetails = userDetailsRepository.findByUsernameAndPassword(username, password);
		if (userDetails == null) {
			mv.addObject("username_error", "No such user exists");
			return "welcome";
		}
		if (userDetails.getUsername().equals("admin")) {
			return "admin";
		}
		return "student";
	}
}
