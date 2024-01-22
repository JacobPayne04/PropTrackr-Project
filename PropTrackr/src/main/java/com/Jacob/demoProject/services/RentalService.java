package com.Jacob.demoProject.services;


import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.Jacob.demoProject.models.Rental;
import com.Jacob.demoProject.repositories.RentalRepository;

@Service
public class RentalService {
    
	// CONNECTS SERVERS TO THE REPOSITORY
    private final RentalRepository rentalRepo;

    public RentalService(RentalRepository rentalRepo) {
        this.rentalRepo = rentalRepo;
    }
    
    // get all
    public List<Rental> getAll(){
        return (List<Rental>)rentalRepo.findAll();
    }
    
    // create one
    public Rental create(Rental rental) {
        return rentalRepo.save(rental);
    }
    
    // get one by id
    public Rental getOne(Long id) {
        Optional<Rental> optionalRental = rentalRepo.findById(id);
        return optionalRental.isPresent() ? optionalRental.get() : null;
    }

    
    // edit
    public Rental edit(Rental rental) {
        return rentalRepo.save(rental);
    }
    
    // delete by id
    public void Delete(Long id) {
    	rentalRepo.deleteById(id);
    }
}