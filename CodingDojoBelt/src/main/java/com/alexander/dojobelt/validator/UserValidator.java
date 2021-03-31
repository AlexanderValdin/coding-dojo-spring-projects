package com.alexander.dojobelt.validator;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.alexander.dojobelt.models.User;
import com.alexander.dojobelt.services.UserService;

@Component
public class UserValidator implements Validator{
	private UserService userService;
	
	public UserValidator(UserService userService) {
		this.userService = userService;
	}
	@Override
	public boolean supports(Class<?>clazz) {
		return User.class.equals(clazz);
	}
	@Override
	public void validate(Object target, Errors errors) {
		User user = (User) target;
		if(!user.getPasswordConf().equals(user.getPassword())) {
			errors.rejectValue("passwordConf", "matched");
		}
		
		if(userService.findByEmail(user.getEmail()) != null) {
			errors.rejectValue("email", "registered");
			
		}
		
		
	}

}
