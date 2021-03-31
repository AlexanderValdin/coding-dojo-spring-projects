package com.alexander.dojobelt.services;

import java.util.Arrays;
import java.util.Date;
import java.util.List;

import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.alexander.dojobelt.models.Role;
import com.alexander.dojobelt.models.User;
import com.alexander.dojobelt.repositories.RoleRepo;
import com.alexander.dojobelt.repositories.UserRepo;

@Service
public class UserService {
	
	private UserRepo userRepo;
    private RoleRepo roleRepo;
    private BCryptPasswordEncoder bCryptPasswordEncoder;
    
    public UserService(UserRepo userRepo, RoleRepo roleRepo, BCryptPasswordEncoder bCryptPasswordEncoder)     {
        this.userRepo = userRepo;
        this.roleRepo = roleRepo;
        this.bCryptPasswordEncoder = bCryptPasswordEncoder;
    } 
    
    public void saveWithUserRole(User user) {
        user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
        user.setRoles(Arrays.asList(roleRepo.findByName("ROLE_USER")));
        userRepo.save(user);
    }
     
    public void saveUserWithAdminRole(User user) {
        user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
        user.setRoles(Arrays.asList(roleRepo.findByName("ROLE_ADMIN")));
        userRepo.save(user);
    }    
    
    public User findByEmail(String email) {
        return userRepo.findByEmail(email);
    }
    
    public void updateUser(User user){ 
    		user.setUpdatedAt(new Date());
    		userRepo.save(user);
    }
    
    public void createUser(User user) {
    		userRepo.save(user);
    }
    
    public User findUserById(Long id) {
    		return userRepo.findUserById(id);
    }
    
    
    public boolean checkIfAdmin(User user) {
    		List<Role> roles = user.getRoles();
    		for( int i = 0; i < roles.size(); i++) {
    			if(roles.get(i).getName().equals("ROLE_ADMIN")) {
    				return true;
    			}
    		}
    		return false; 			
    }
    
    public List<User> findAll(){
    		return (List<User>) userRepo.findAll();
    }
    public boolean checkLogin(String email,String password) {
		User user = userRepo.findByEmail(email);
		if(user == null) {
			return false;
		}
		else {
			if(BCrypt.checkpw(password, user.getPassword())) {
				return true;
			}
			else {
				return false;
			}
		}
	}
   
}
