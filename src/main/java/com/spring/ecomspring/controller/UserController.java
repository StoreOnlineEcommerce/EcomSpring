package com.spring.ecomspring.controller;

import com.spring.ecomspring.entities.User;
import com.spring.ecomspring.repository.UserRepository;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api")
public class UserController {

    private final UserRepository userRepository;


    public UserController(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    @GetMapping("/Users")
    public ResponseEntity<List<User>> findAll(){

        List<User> users = userRepository.findAll();
        return  ResponseEntity.ok(users);
    }
}
