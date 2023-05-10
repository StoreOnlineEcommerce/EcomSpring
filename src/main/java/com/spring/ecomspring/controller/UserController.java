package com.spring.ecomspring.controller;

import com.spring.ecomspring.entities.User;
import com.spring.ecomspring.repository.UserRepository;
import com.spring.ecomspring.services.UserServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/api")
public class UserController {

    private final UserRepository userRepository;

    @Autowired
    private UserServiceImpl userServiceimpl;


    public UserController(UserRepository userRepository) {
        this.userRepository = userRepository;
    }


    @GetMapping("/Holamundo")
    public String returnSaludo(){
        return "Hola Mundo, acceso concendido";
    }

    @GetMapping("/users")
    public ResponseEntity<List<User>> findAll(){

        //List<User> users = userRepository.findAllWithTipoDocumento();
        List<User> users = userServiceimpl.getUserFindAll();
        return  ResponseEntity.ok(users);
    }

    @GetMapping("/users/{id}")
    public ResponseEntity<User> findOneById(@PathVariable Long id){

        Optional<User> UserOpt = userRepository.findById(id);

        if(UserOpt.isPresent())
            return ResponseEntity.ok(UserOpt.get());
        else
            return ResponseEntity.notFound().build();

    }
}
