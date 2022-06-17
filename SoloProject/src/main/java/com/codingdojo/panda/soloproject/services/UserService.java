package com.codingdojo.panda.soloproject.services;

import java.util.Optional;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.codingdojo.panda.soloproject.models.LoginUser;
import com.codingdojo.panda.soloproject.models.User;
import com.codingdojo.panda.soloproject.repositories.UserRepository;


@Service
public class UserService {
	@Autowired
	private UserRepository userRepo;
    public User register(User newUser, BindingResult result) {
    	
    	Optional<User> foundUser = userRepo.findByEmail(newUser.getEmail());
    	String hashed = BCrypt.hashpw(newUser.getPassword(), BCrypt.gensalt());
    	if(foundUser.isPresent()) {
    		return foundUser.get();
    	}
    	if(!newUser.getPassword().equals(newUser.getConfirm())) {
    	    result.rejectValue("confirm", "Matches", "The Confirm Password must match Password!");
    	}
    	if(result.hasErrors()) return null;
    	newUser.setPassword(hashed);
    	this.userRepo.save(newUser);
    	
        return null;
    }
    public User login(LoginUser newLoginObject, BindingResult result) {
    	Optional<User> existingUser = userRepo.findByEmail(newLoginObject.getEmail());
    	if(existingUser.isEmpty()) {
    		return null;
    	}
    	if(!BCrypt.checkpw(newLoginObject.getPassword(), existingUser.get().getPassword())) {
    	    result.rejectValue("password", "Matches", "Invalid Password!");
    	}

        return existingUser.get();
    }
    public User findUser(Long id) {
        Optional<User> optionalUser = userRepo.findById(id);
        if(optionalUser.isPresent()) {
            return optionalUser.get();
        } else {
            return null;
        }
    }
}

