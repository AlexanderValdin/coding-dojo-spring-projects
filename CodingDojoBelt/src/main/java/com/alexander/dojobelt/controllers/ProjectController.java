package com.alexander.dojobelt.controllers;

import java.security.Principal;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.alexander.dojobelt.models.Pack;
import com.alexander.dojobelt.models.User;
import com.alexander.dojobelt.services.PackService;
import com.alexander.dojobelt.services.RoleService;
import com.alexander.dojobelt.services.UserService;
import com.alexander.dojobelt.validator.UserValidator;


@Controller
public class ProjectController {
	
	private UserValidator userValidator;
	private UserService userService;
	private RoleService roleService;
	private PackService packService;
	
	public ProjectController(UserService userService, UserValidator userValidator, RoleService roleService, PackService packService) {
		this.userValidator = userValidator;
		this.userService = userService;
		this.roleService = roleService;
		this.packService = packService;
	}
	
	@GetMapping("/")
	public String loginRegister(@ModelAttribute("userRegister")User userRegister,HttpSession session) {
		if(session.isNew()) {
			session.setAttribute("login", false);
		}
		
		return "index.jsp";
	}
	
	@RequestMapping(value="/register", method=RequestMethod.POST)
	public String registration(@Valid @ModelAttribute("userRegister")User userRegister,BindingResult result,RedirectAttributes rA) {
		userValidator.validate(userRegister, result);
		if(result.hasErrors()) {
			return "index.jsp";
		}
		else {
			userService.createUser(userRegister);
			rA.addFlashAttribute("success","Registro válido!");
				if (roleService.findByName("ROLE_ADMIN").getUsers().size() < 1) {
					userService.saveUserWithAdminRole(userRegister);
					return "redirect:/";
				} else {
					userService.saveWithUserRole(userRegister);
					return "redirect:/";
				}
        
		}
	}
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public String login(@Valid @RequestParam("email")String email,@RequestParam("password")String password,HttpSession session, BindingResult result, RedirectAttributes rA) {
			if(result.hasErrors()) {
			
			return"redirect:/";
		}
		else if(userService.checkLogin(email, password) == false) {
			rA.addFlashAttribute("error"," Credenciales inválidas");
			return "redirect:/";
		}
		else  {
			session.setAttribute("login", true);
			session.setAttribute("user",userService.findByEmail(email).getId());
			User user = userService.findByEmail(email);
			if(userService.checkIfAdmin(user)) {
        		return "redirect:/packages";
        		
			} 
			else {
        		return "redirect:/users";
			}
			
		}
	}

		@RequestMapping("/packages")
		public String displayAdmin(Principal principal, Model model, @ModelAttribute("pack") Pack pack) {
        String email = principal.getName();
        model.addAttribute("currentUser", userService.findByEmail(email));
        model.addAttribute("users", userService.findAll());
        model.addAttribute("packs", packService.findAll());
        return "dashboard.jsp";
		}
		
		
		@GetMapping("/users")
		public String displayUser(HttpSession session,Model model) {
			if((boolean)session.getAttribute("login") == true) {
				model.addAttribute("user", userService.findUserById((Long)session.getAttribute("user")));
				model.addAttribute("packs",packService.findAll());
				
				return "welcomeUser.jsp";
			}
			else {
				return"redirect:/";
			}
		}
		
		@PostMapping("/createpack")
		public String createPack(@Valid @ModelAttribute("packs")Pack pack,BindingResult result, HttpSession session) {
		if(result.hasErrors()) {
			
			return"redirect:/packages";
		}
		else {
			packService.createPack(pack);
			return "redirect:/packages";
		}
	}
	@GetMapping("/packages/{id}/edit")
	public String edit(@ModelAttribute("pack")Pack pack,@PathVariable("id")Long id,HttpSession session,Model model) {
		if((boolean)session.getAttribute("login") == true) {
			model.addAttribute("pack", packService.findPackById(id));
			model.addAttribute("userCheck", userService.findUserById((Long)session.getAttribute("user")));
				
			return "editShow.jsp";
		}
		else {
			return"redirect:/";
		}
	}
	
	@PutMapping("/packages/{id}/edit")
	public String editPack(@Valid @ModelAttribute("pack") Pack pack,BindingResult result,@PathVariable("id")Long id, HttpSession session,Model model) {
		if(result.hasErrors()) {
		model.addAttribute("pack",packService.findPackById(id));
			return"editPackage.jsp";
		}
		else {
			pack.setId(id);
			packService.createPack(pack);
			return"redirect:/packages";
		}
	}
	@RequestMapping("/packages/{id}/delete")
	public String deletePack(@PathVariable("id") Long id) {
		packService.deletePack(id);
		return "redirect:/packages";
	}
	
}
