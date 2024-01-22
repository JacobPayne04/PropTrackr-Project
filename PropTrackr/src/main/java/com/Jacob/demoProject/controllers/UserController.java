// pair programmed with megan

package com.Jacob.demoProject.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.Jacob.demoProject.models.LoginUser;
import com.Jacob.demoProject.models.User;
import com.Jacob.demoProject.services.RentalService;
import com.Jacob.demoProject.services.UserService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class UserController {

	@Autowired
	private UserService userServ;
	private final RentalService rentalServ;

	// manually brining in the BookService
	public UserController(RentalService rentalServ) {
		this.rentalServ = rentalServ;
	}

	@GetMapping("")
	public String loginRegUser(@ModelAttribute("user") User user, @ModelAttribute("loginUser") LoginUser loginUser,
			HttpSession session) {

		return "users/loginreg.jsp";
	}

	@PostMapping("/user/process/register")
	public String processRegister(@Valid @ModelAttribute("user") User user, BindingResult result, Model model,
			HttpSession session) {
		// Validation if statements
		if (userServ.getUser(user.getEmail()) != null) {
			result.rejectValue("email", "Unique", "Email already in use!");
		}

		if (!user.getPassword().equals(user.getConfirm())) {
			result.rejectValue("password", "Match", "passwords dont match");
		}

		if (result.hasErrors()) {
			model.addAttribute("loginUser", new LoginUser());
			return "users/loginreg.jsp";
		}
		User newUser = userServ.registerUser(user);
		session.setAttribute("user_id", newUser.getId());

		return "redirect:/rentals";
	}

	// login route
	@PostMapping("/user/process/login")
	public String processLoginUser(@Valid @ModelAttribute("loginUser") LoginUser loginUser, BindingResult result,
			Model model, HttpSession session) {

		User loggingUser = userServ.login(loginUser, result);
		if (result.hasErrors()) {
			model.addAttribute("user", new User());
			return "users/loginreg.jsp";
		}
		session.setAttribute("user_id", loggingUser.getId());
		return "redirect:/rentals";
	}

	// logout route
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}

	// home page route
	@GetMapping("/rentals")
	public String welcome(Model model, HttpSession session) {
		if (session.getAttribute("user_id") == null) {
			//Don't forget to add the "/" will result in mapping error for seeing routes while being out of session
			return "redirect:/";
		}
		model.addAttribute("oneUser", userServ.getUser((Long) session.getAttribute("user_id")));
		model.addAttribute("AllRental", rentalServ.getAll());
		return "rental/welcome.jsp";
	}

}
