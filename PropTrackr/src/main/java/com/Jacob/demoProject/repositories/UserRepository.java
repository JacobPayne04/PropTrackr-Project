// Pair Programmed with megan

package com.Jacob.demoProject.repositories;

import java.util.Optional;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.Jacob.demoProject.models.User;

@Repository
//creates a find by email for users
public interface UserRepository extends CrudRepository<User, Long> {
	Optional<User> findByEmail(String email);
}
