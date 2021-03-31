package com.alexander.dojobelt.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.alexander.dojobelt.models.User;

@Repository
public interface UserRepo extends CrudRepository<User,Long>{
	User findByEmail(String email);
	User findUserById(Long id);
}
