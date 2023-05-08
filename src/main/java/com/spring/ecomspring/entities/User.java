package com.spring.ecomspring.entities;

import javax.persistence.*;
import java.util.Set;


@Entity
@Table( name = "user_system")
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column( name = "oid_user_system" )
    private Long userId;

//    @Column( name = "fk_oid_document" )
//    private Set<>

    @Column( name = "user_name" )
    private String name;

    @Column( name = "user_last_name" )
    private String lastName;

    @Column( name = "document_number" )
    private String documentNumber;

    @Column( name = "cell_phone" )
    private String numberPhobe;

    @Column( name = "user_email" )
    private String email;

    @Column( name = "user_password" )
    private String password;


}
