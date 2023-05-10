package com.spring.ecomspring.controller;

import com.spring.ecomspring.entities.DocumentType;
import com.spring.ecomspring.repository.DocumentTypeRepository;
import com.spring.ecomspring.services.DocumentTypeImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class DocumentTypeController {

    @Autowired
    private DocumentTypeRepository documentTypeRepository;

    @Autowired
    private DocumentTypeImpl documentTypeImpl;

    @GetMapping("/DocumentType")
    public ResponseEntity<List<DocumentType>> findAll(){

        List<DocumentType> documentTypes = documentTypeImpl.getfindAll();
        return  ResponseEntity.ok(documentTypes);
    }
}
