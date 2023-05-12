package com.spring.ecomspring.services;


import com.spring.ecomspring.entities.User;

import java.util.List;
import java.util.Optional;

public interface IUserService {

    // spring repository methods

    List<User> findAll();

    Optional<User> findById(Long id);

    User save(User user);

    User update(User user);

    void deleteById(Long id);

    void deleteById(List<Long> ids);

    void deleteAll();

    void deleteAll(List<User> users);





}
