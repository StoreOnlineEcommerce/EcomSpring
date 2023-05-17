package com.spring.ecomspring.repository;


import com.spring.ecomspring.entities.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {

//    @Query("SELECT u FROM User u JOIN FETCH u.documentTypes")
//    List<User> findAllWithDocumentType();

    @Query("SELECT u FROM User u LEFT JOIN u.documentTypes")
    List<User> findAllWithDocumentType();

    @Query("SELECT u FROM User u JOIN FETCH u.documentTypes WHERE u.userId = :userId")
    Optional<User> findByIdWithTipoDocumento(@Param("userId") Long userId);



}
