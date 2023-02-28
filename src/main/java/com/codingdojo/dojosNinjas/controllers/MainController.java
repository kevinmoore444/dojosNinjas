package com.codingdojo.dojosNinjas.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.codingdojo.dojosNinjas.models.Dojo;
import com.codingdojo.dojosNinjas.models.Ninja;
import com.codingdojo.dojosNinjas.services.DojoService;
import com.codingdojo.dojosNinjas.services.NinjaService;

@Controller
public class MainController {

	@Autowired
	private DojoService dojoService;
	
	@Autowired
	private NinjaService ninjaService;
		
	
	//Create Dojo
	//Display Dojo Form
	@GetMapping("/dojos/new")
	public String newDojoForm(@ModelAttribute("newDojo") Dojo newDojo, Model model){
		List<Dojo> dojoList = dojoService.allDojos();
		model.addAttribute("dojoList", dojoList);
		return "createDojoForm.jsp";
		}
	
	//Process User Form
	@PostMapping("/dojos/new")
	public String processDojoForm(
		@Valid @ModelAttribute("newDojo") Dojo newDojo, BindingResult result){
		if(result.hasErrors()) {
			return "createDojoForm.jsp";
		}
		else {
			dojoService.createDojo(newDojo);
			return "redirect:/dojos/new";
		}
	}
	
	
	
	//Create Ninja
	//Display Form
	@GetMapping("/ninjas/new")
	public String newNinjaForm(@ModelAttribute("newNinja") Ninja newNinja, Model model ) {
		List<Dojo> dojoList = dojoService.allDojos();
		model.addAttribute("dojoList", dojoList);
		
		return "createNinjaForm.jsp";
	}
	
	
	//Process Form
	@PostMapping("/ninjas/new")
	public String processNinjaForm(@Valid @ModelAttribute("newNinja") Ninja newNinja, BindingResult result, Model model) {
		if(result.hasErrors()) {
			List<Ninja> ninjaList = ninjaService.allNinjas();
			model.addAttribute("ninjaList", ninjaList);
			return "createNinjaForm.jsp";
		}
		else {
			ninjaService.createNinja(newNinja);
			return "redirect:/ninjas/new";
		}
	}
	
	
	
	//View One Dojo
	//display one user
	@GetMapping("/dojos/{id}")
	public String oneDojo(@PathVariable("id") Long id, Model model) {
		model.addAttribute("dojo", dojoService.oneDojo(id));
		return "dojoDetails.jsp";
	}
	
	
	
	
}
