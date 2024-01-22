//pair programmed with megan
package com.Jacob.demoProject.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.Jacob.demoProject.models.Rental;
import com.Jacob.demoProject.services.RentalService;
import com.Jacob.demoProject.services.UserService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class MainController {
	
	@Autowired
	private UserService userServ;
	private final RentalService rentalServ;

	public MainController(RentalService rentalServ) {
		this.rentalServ = rentalServ;
	}

	// Route to create a new book
	@GetMapping("/rentals/new")
	public String createWorkout(@ModelAttribute("rental") Rental rental, Model model, HttpSession session,
			@RequestParam(value = "searchValue", required = false) String searchValue) {
		//checks if a user is logged in, if not redirect back to the login page
		if(session.getAttribute("user_id") == null) {
			return "redirect:/";
		}
		model.addAttribute("oneUser", userServ.getUser((Long) session.getAttribute("user_id")));
		//if no errors renders jsp
		return "rental/create.jsp";
	}

	// Route to process a new book
	@PostMapping("/rentals/process/new")
	public String createWorkoutProcess(@Valid @ModelAttribute("rental") Rental newRental, BindingResult result) {
		//checks if a user is logged in, if not redirect back to the create form
		if (result.hasErrors()) {
			return "rental/create.jsp";
		}
		//if there are no errors, create the new book
		rentalServ.create(newRental);
		return "redirect:/rentals";
	}

//	 Route to show one book by its ID
    @GetMapping("/rentals/show/{id}")
    public String showOneWorkout(@PathVariable("id") Long id, Model model, HttpSession session) {
    		if(session.getAttribute("user_id") == null) {
    			return "redirect:/";
    		}
    	model.addAttribute("oneUser", userServ.getUser((Long) session.getAttribute("user_id")));
        model.addAttribute("oneRental", rentalServ.getOne(id));
        return "rental/showOne.jsp";
    }
    
//	 Route to edit one book by its ID
    @GetMapping("/rentals/edit/{id}")
    public String editWorkout(@PathVariable("id") Long id, Model model,HttpSession session ) {
    	if(session.getAttribute("user_id") == null) {
			return "redirect:/";
		}
        model.addAttribute("rental", rentalServ.getOne(id));
        return "rental/edit.jsp";
    }
    
//	 Route to process an edit for a book by its ID
    @PostMapping("/rentals/process/edit/{id}")
    public String processEditWorkout(@Valid @ModelAttribute("rental") Rental rental, BindingResult result,HttpSession session) {
    	if(session.getAttribute("user_id") == null) {
			return "redirect:/";
		}
        if(result.hasErrors()) {
            return "rental/edit.jsp";
        }
        rentalServ.edit(rental);
            return "redirect:/rentals";
    }
    
//	 Route to delete a book by its ID
    @PostMapping("/rentals/delete/{id}")
    public String deleteWorkout(@PathVariable("id") Long id) {
    	rentalServ.Delete(id);
        return "redirect:/rentals";
    }
    
   
}
