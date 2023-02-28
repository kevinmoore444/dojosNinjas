package com.codingdojo.dojosNinjas.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.codingdojo.dojosNinjas.models.Ninja;
import com.codingdojo.dojosNinjas.repositories.NinjaRepository;

@Service
public class NinjaService {

	@Autowired
	private NinjaRepository ninjaRepo;
	
	
	//Create Ninja
	public Ninja createNinja(Ninja ninja) {
		return ninjaRepo.save(ninja);
		
	}
	
	//find all
	public List<Ninja> allNinjas(){
		return ninjaRepo.findAll();
	}
		
	//find One
	public Ninja oneNinja(Long id) {
		Optional<Ninja> optionalNinja = ninjaRepo.findById(id);
		if(optionalNinja.isPresent()) {
			return optionalNinja.get();
		}
		else {
			return null;
		}
	}
	
	
	
	//edit
	public Ninja editNinja(Ninja ninja) {
		return ninjaRepo.save(ninja);
	}
	
	
	
	//delete
	public void deleteNinja(Long id) {
		ninjaRepo.deleteById(id);
	}
	
	
	
	
}
