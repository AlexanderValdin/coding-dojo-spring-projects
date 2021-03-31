package com.alexander.dojobelt.services;

import java.util.List;

import org.springframework.stereotype.Service;

import com.alexander.dojobelt.models.Role;
import com.alexander.dojobelt.repositories.RoleRepo;

@Service
public class RoleService {
	public RoleRepo roleRepo;
	
	public RoleService(RoleRepo roleRepo) {
		this.roleRepo = roleRepo;
	}
	
	public List<Role> all(){
		return (List<Role>) roleRepo.findAll();
	}
	
	public Role findByName(String name){
		return (Role) roleRepo.findByName(name);
	}
}
