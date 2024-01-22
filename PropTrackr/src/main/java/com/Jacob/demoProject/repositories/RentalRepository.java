package com.Jacob.demoProject.repositories;


import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.Jacob.demoProject.models.Rental;

@Repository
//creats a find all method for books
public interface RentalRepository extends CrudRepository<Rental, Long> {
	List<Rental> findAll();
	

}
