package com.spring.ecomspring.services;

import com.spring.ecomspring.entities.DocumentType;
import com.spring.ecomspring.entities.User;
import com.spring.ecomspring.repository.UserRepository;
import com.spring.ecomspring.util.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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

    public List<User> findAll(){

        List<User> users = userRepository.findAllWithTipoDocumento();

        // Filter data
        for(User user: users){

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
            user.setDocumentTypes(documentTypeImpl.filterEmptySpaces(documentType));
        }

        return users;
    }

    @Override
    public Optional<User> finById() {
        return Optional.empty();
    }

    @Override
    public User save(User user) {
        return null;
    }

    @Override
    public User update(User user) {
        return null;
    }

    @Override
    public void deleteById(Long id) {

    }

    @Override
    public void deleteById(List<Long> ids) {

    }

    @Override
    public void deleteAll() {

    }

    @Override
    public void deleteAll(List<User> users) {

    }

}
