package com.spring.ecomspring.controller;

import com.spring.ecomspring.entities.DocumentType;
import com.spring.ecomspring.repository.DocumentTypeRepository;
import com.spring.ecomspring.services.DocumentTypeImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;


@RestController
@RequestMapping("/api/document-type")
public class DocumentTypeController {

    @Autowired
    private DocumentTypeRepository documentTypeRepository;

    @Autowired
    private DocumentTypeImpl documentTypeImpl;

    @GetMapping
    public ResponseEntity<List<DocumentType>> findAll(){

        List<DocumentType> documentTypes = documentTypeImpl.getfindAll();
        return  ResponseEntity.ok(documentTypes);
    }

    @GetMapping("/{id}")
    public ResponseEntity<DocumentType> findById(@PathVariable Long id){

        Optional<DocumentType> documentOpt = documentTypeImpl.getById(id);

        if(documentOpt.isPresent())
            return ResponseEntity.ok(documentOpt.get());

        return ResponseEntity.notFound().build();
    }

    @PostMapping
    public ResponseEntity<DocumentType> create(@RequestBody DocumentType documentType){


        if(documentType.getDocumentId() != null){
            return ResponseEntity.badRequest().build();
        }
        return ResponseEntity.ok(documentTypeImpl.saveId(documentType));
    }

    @PutMapping("/{id}")
    public ResponseEntity<DocumentType> updateById(@PathVariable Long id, @RequestBody DocumentType documentType){

        if(documentTypeRepository.findById(id).isEmpty()){
            return ResponseEntity.notFound().build();
        }
        return ResponseEntity.ok(documentTypeImpl.updateId(id,documentType));
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteId(@PathVariable Long id){

        if(documentTypeRepository.findById(id).isEmpty()){
            return ResponseEntity.notFound().build();
        }
        documentTypeImpl.deleteId(id);
        return ResponseEntity.noContent().build();
    }
}
