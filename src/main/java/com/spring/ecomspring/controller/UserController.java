package com.spring.ecomspring.controller;

import com.spring.ecomspring.entities.DocumentType;
import com.spring.ecomspring.entities.User;
import com.spring.ecomspring.repository.DocumentTypeRepository;
import com.spring.ecomspring.repository.UserRepository;
import com.spring.ecomspring.services.UserServiceImpl;
import com.spring.ecomspring.util.SortingCriteria;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
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
    public ResponseEntity<List<User>> findAll(@RequestParam(required = false) String sortBy){

        SortingCriteria<User> sortingCriteria;

        if(sortBy != null && !sortBy.isEmpty()){
            sortingCriteria = new SortingCriteria<>(sortBy,Sort.Direction.ASC);
        }else{
            sortingCriteria = new SortingCriteria<>("userId", Sort.Direction.ASC);
        }

        List<User> users = userServiceimpl.findAllUserWithSorting(sortingCriteria);
        return ResponseEntity.ok(users);

//        List<User> users;
//
//            users = userServiceimpl.findAll();
//        }else{
//            switch (sortBy) {
//                case "id":
//                    users = userServiceimpl.findAllSortedById();
//                    break;
//                case "name":
//                    users = userServiceimpl.findALlSortedByName();
//                    break;
//                case "lastname":
//                    users = userServiceimpl.findAllSortedByLastName();
//                    break;
//                case "documentnumber":
//                    users = userServiceimpl.findAllSortedByDocumentNumber();
//                    break;
//                case "numberphone":
//                    users = userServiceimpl.findAllSortedByNumberPhone();
//                    break;
//                case "email":
//                    users = userServiceimpl.findAllSortedByEmail();
//                    break;
//                default:
//                    users = userServiceimpl.findAll();
//                    break;
//            }
//        }
//
//        return  ResponseEntity.ok(users);
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

        return ResponseEntity.ok(userServiceimpl.save(user));

    }



    @PutMapping
    public ResponseEntity<User> update(@RequestBody User user){

        if(user.getUserId() == null){// verifica si contienen ID
            return ResponseEntity.badRequest().build();
        }

        if(!userRepository.existsById(user.getUserId())){ // verifica si la ID existe
            return ResponseEntity.notFound().build();
        }

        return ResponseEntity.ok(userServiceimpl.update(user));
    }


    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteId(@PathVariable Long id){

        if(!userRepository.existsById(id)){
            return ResponseEntity.notFound().build();
        }

        this.userRepository.deleteById(id);

        return ResponseEntity.noContent().build();
    }


    @DeleteMapping("/deleteMany/{ids}")
    public ResponseEntity<String> deleteMany(@PathVariable List<Long> ids){

        this.userServiceimpl.deleteAllById(ids);

        return ResponseEntity.ok("User deleted successfully");

    }




}
