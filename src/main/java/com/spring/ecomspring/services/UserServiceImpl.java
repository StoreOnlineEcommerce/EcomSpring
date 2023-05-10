package com.spring.ecomspring.services;

import com.spring.ecomspring.entities.User;
import com.spring.ecomspring.repository.UserRepository;
import com.spring.ecomspring.util.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private StringUtil stringUtil;

    public List<User> getUserFindAll(){

        List<User> users = userRepository.findAllWithTipoDocumento();


        for(User user: users){

            String name_InSpaces = stringUtil.trim(user.getName());
            String lastName_InSpaces = stringUtil.trim(user.getLastName());
            String documentNumber_InSpaces = stringUtil.trim(user.getDocumentNumber());
            String numberPhone_InSpaces = stringUtil.trim(user.getNumberPhobe());
            String email_InSpaces = stringUtil.trim(user.getEmail());

            user.setName(name_InSpaces);
            user.setLastName(lastName_InSpaces);
            user.setDocumentNumber(documentNumber_InSpaces);
            user.setNumberPhobe(numberPhone_InSpaces);
            user.setEmail(email_InSpaces);
        }

        return users;
    }

}
