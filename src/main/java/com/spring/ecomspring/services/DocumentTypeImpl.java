package com.spring.ecomspring.services;

import com.spring.ecomspring.entities.DocumentType;
import com.spring.ecomspring.repository.DocumentTypeRepository;
import com.spring.ecomspring.util.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
public class DocumentTypeImpl {

    @Autowired
    private DocumentTypeRepository documentTypeRepository;

    @Autowired
    private StringUtil stringUtil;

    /**
     * Obtiene la lista de los tipos de documentos
     * @return List<DocumentType> lista de documentos sin espacios vacios al inicio y final
     */
    public List<DocumentType> getfindAll(){

        List<DocumentType> documentTypes = documentTypeRepository.findAll();

        for(DocumentType document : documentTypes){

            String name_InSpaces = stringUtil.trim(document.getName());
            document.setName(name_InSpaces);
        }

        return documentTypes;
    }

    /**
     * Obtiene tipo de documento por ID
     * @param id numero id a obtener
     * @return Optional<DocumentType> tipo de documento correpsondiente al id
     */
    public Optional<DocumentType> getById(Long id){

        Optional<DocumentType> documentOptional = documentTypeRepository.findById(id);

        if(documentOptional.isPresent()){
            DocumentType document = documentOptional.get();
            String document_InSpaces = stringUtil.trim(document.getName());
            document.setName(document_InSpaces);
        }

        return documentOptional;
    }






}
