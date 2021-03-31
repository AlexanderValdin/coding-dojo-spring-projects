package com.alexander.dojobelt.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.alexander.dojobelt.models.Role;

@Repository
public interface RoleRepo extends CrudRepository<Role,Long> {
	Role findByName(String string);
}
