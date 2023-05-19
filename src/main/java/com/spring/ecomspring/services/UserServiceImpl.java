package com.spring.ecomspring.services;

import com.spring.ecomspring.entities.DocumentType;
import com.spring.ecomspring.entities.User;
import com.spring.ecomspring.repository.UserRepository;
import com.spring.ecomspring.util.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import java.util.List;
import java.util.Optional;

@Service
public class UserServiceImpl implements IUserService{

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private DocumentTypeImpl documentTypeImpl;

    @Autowired
    private StringUtil stringUtil;

    /**
     * Filter parameters of the table User
     * @param user Object User
     * @return user filters
     */
    public User filterEmpytySpaces(User user){

        String name_InSpaces = stringUtil.trim(user.getName());
        String lastName_InSpaces = stringUtil.trim(user.getLastName());
        String documentNumber_InSpaces = stringUtil.trim(user.getDocumentNumber());
        String numberPhone_InSpaces = stringUtil.trim(user.getNumberPhobe());
        String email_InSpaces = stringUtil.trim(user.getEmail());
        DocumentType documentType = user.getDocumentTypes();

        user.setName(name_InSpaces);
        user.setLastName(lastName_InSpaces);
        user.setDocumentNumber(documentNumber_InSpaces);
        user.setNumberPhobe(numberPhone_InSpaces);
        user.setEmail(email_InSpaces);

        if(documentType != null){
            user.setDocumentTypes(documentTypeImpl.filterEmptySpaces(documentType));
        }

        return user;
    }


    public List<User> findAll(){

        List<User> users = userRepository.findAllWithDocumentType();

        // Filter data
        for(User user: users){

            user = filterEmpytySpaces(user);
        }

        return users;
    }

    @Override
    public Optional<User> findById(Long id) {

        Optional<User> userOptional = userRepository.findByIdWithDocumentType(id);

        if(userOptional.isPresent()){
            User user = userOptional.get();
            user = filterEmpytySpaces(user);
            //userOptional = Optional.of(user);
        }

        return userOptional;
    }


    @Override
    public User save(User user) {

        user = filterEmpytySpaces(user);

        if(user.getEmail() == null || user.getEmail().isEmpty()){
            throw new IllegalArgumentException("The email of the User is requeried");
        }
        if(user.getPassword() == null || user.getPassword().isEmpty()){
            throw new IllegalArgumentException("The password of the User is requeried");
        }
        if(user.getCreationDate() == null){
            throw new IllegalArgumentException(("The creation date of the user is requeried"));
        }

        return userRepository.save(user);
    }

    @Override
    public User update(User user) {

        user = filterEmpytySpaces(user);

        if(user.getEmail() == null || user.getEmail().isEmpty()){
            throw new IllegalArgumentException("The email of the User is requeried");
        }
        if(user.getPassword() == null || user.getPassword().isEmpty()){
            throw new IllegalArgumentException("The password of the User is requeried");
        }
        if(user.getCreationDate() == null){
            throw new IllegalArgumentException(("The creation date of the user is requeried"));
        }

        return userRepository.save(user);
    }

    @Override
    public void deleteById(Long id) {

        userRepository.deleteById(id);

    }

    @Override
    public void deleteAllById(List<Long> ids) {

        if(CollectionUtils.isEmpty(ids)){
            throw  new IllegalArgumentException("Trying to delete an empty or null ids list");
        }

        for(Long id: ids){
            if(!this.userRepository.existsById(id)){
                throw new IllegalArgumentException("id notfound : " + id);
            }
        }

        this.userRepository.deleteAllById(ids);
    }

    @Override
    public void deleteAll() {

    }

    @Override
    public void deleteAll(List<User> users) {

    }

}
