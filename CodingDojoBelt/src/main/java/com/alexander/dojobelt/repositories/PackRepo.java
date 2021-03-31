package com.alexander.dojobelt.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.alexander.dojobelt.models.Pack;

@Repository
public interface PackRepo extends CrudRepository<Pack,Long>{
	public Pack findPackById(Long id);
}
