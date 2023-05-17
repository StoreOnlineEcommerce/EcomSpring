package com.spring.ecomspring.entities;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

@Getter
@Setter
@NoArgsConstructor // Genera automáticamente un constructor sin argumentos
@ToString
@Entity
@Table(name="document_type")
public class DocumentType {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="oid_document")
    private Long documentId;

    @Column(name="document_name")
    private String name;

}
