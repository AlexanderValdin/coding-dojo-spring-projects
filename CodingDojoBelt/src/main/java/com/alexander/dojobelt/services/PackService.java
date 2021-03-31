package com.alexander.dojobelt.services;

import java.util.List;

import org.springframework.stereotype.Service;

import com.alexander.dojobelt.models.Pack;
import com.alexander.dojobelt.repositories.PackRepo;

@Service
public class PackService {
	
	private PackRepo packRepo;
	
	public PackService(PackRepo packRepo) {
		this.packRepo = packRepo;
	}
	
	public List<Pack> findAll(){
		return (List<Pack>) packRepo.findAll();
	}

	public Pack findPackById(Long id) {
		return packRepo.findPackById(id);
	}
	public void createPack(Pack pack) {
		packRepo.save(pack);
	}
	public void updatePak(Pack pack) {
		packRepo.save(pack);
	}
	public void deletePack(Long id) {
		packRepo.deleteById(id);
	}
}
