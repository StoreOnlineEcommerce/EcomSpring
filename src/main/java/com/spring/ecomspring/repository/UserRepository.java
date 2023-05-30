package com.spring.ecomspring.repository;


import com.spring.ecomspring.entities.User;
import com.spring.ecomspring.util.SortingCriteria;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {

    @Query("SELECT u FROM User u LEFT JOIN u.documentTypes")
    List<User> findAllWithDocumentType();

    @Query("SELECT u FROM User u LEFT JOIN u.documentTypes WHERE u.userId = :userId")
    Optional<User> findByIdWithDocumentType(@Param("userId") Long userId);

//    @Query("SELECT u FROM User u LEFT JOIN u.documentTypes ORDER BY CASE WHEN :#{#sortingCriteria.property} = 'someProperty' THEN u.userId END ASC, CASE WHEN :#{#sortingCriteria.property} = 'anotherProperty' THEN u.anotherProperty END ASC")
//    List<User> findAllWithSorting(@Param("sortingCriteria") SortingCriteria<User> sortingCriteria);

    @Query("SELECT u FROM User u LEFT JOIN u.documentTypes")
    List<User> testMethod( Sort sort);

}
