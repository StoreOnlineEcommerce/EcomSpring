package com.spring.ecomspring.entities;

import lombok.*;

import javax.persistence.*;
import java.time.LocalDate;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

@Getter
@Setter
@NoArgsConstructor // Genera automáticamente un constructor sin argumentos
@Entity
@Table( name = "user_system")
@PrimaryKeyJoinColumn(name = "oid_user_system")
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column( name = "oid_user_system" )
    private Long userId;

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

    @Column(name="creation_date")
    private LocalDate creationDate;

    @Column(name="birth_date")
    private LocalDate birthDate;

    @ManyToOne(optional = true)
    @JoinColumn( name = "fk_oid_document" )
    private DocumentType documentTypes;


}
