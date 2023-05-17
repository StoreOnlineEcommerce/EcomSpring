package com.spring.ecomspring.controller;

import com.spring.ecomspring.entities.DocumentType;
import com.spring.ecomspring.entities.User;
import com.spring.ecomspring.repository.DocumentTypeRepository;
import com.spring.ecomspring.repository.UserRepository;
import com.spring.ecomspring.services.UserServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/api/user")
public class UserController {

    private final UserRepository userRepository;

    @Autowired
    private UserServiceImpl userServiceimpl;

    @Autowired
    private DocumentTypeRepository documentTypeRepository;


    public UserController(UserRepository userRepository) {
        this.userRepository = userRepository;
    }


    @GetMapping("/holamundo")
    public String returnSaludo(){
        return "Hola Mundo, acceso concendido";
    }

    @GetMapping
    public ResponseEntity<List<User>> findAll(){

        List<User> users = userServiceimpl.findAll();
        return  ResponseEntity.ok(users);
    }

    @GetMapping("/{id}")
    public ResponseEntity<User> findOneById(@PathVariable Long id){

        Optional<User> userOpt= userServiceimpl.findById(id);

        if(userOpt.isPresent())
            return ResponseEntity.ok(userOpt.get());
        else
            return ResponseEntity.notFound().build();

    }

    @PostMapping
    public ResponseEntity<User> saveId(@RequestBody User user){

        if(user.getUserId() != null){
            return ResponseEntity.badRequest().build();
        }

        user = userServiceimpl.save(user);

        return ResponseEntity.ok(userRepository.save(user));

    }

}
