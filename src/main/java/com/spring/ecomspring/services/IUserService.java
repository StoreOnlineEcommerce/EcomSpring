package com.spring.ecomspring.services;


import com.spring.ecomspring.entities.User;

import java.util.List;
import java.util.Optional;

public interface IUserService {

    // spring repository methods

    List<User> findAll();

    List<User> findAllSortedById();
    List<User> findALlSortedByName();
    List<User> findAllSortedByLastName();
    List<User> findAllSortedByDocumentNumber();
    List<User> findAllSortedByNumberPhone();
    List<User> findAllSortedByEmail();
    List<User> findAllSortedByCreationDate();
    List<User> findAllSortedByBirthDate();
    List<User> findAllSortedByDocumentType();

    Optional<User> findById(Long id);

    User save(User user);

    User update(User user);

    void deleteById(Long id);

    void deleteAllById(List<Long> ids);

    void deleteAll();

    void deleteAll(List<User> users);





}
