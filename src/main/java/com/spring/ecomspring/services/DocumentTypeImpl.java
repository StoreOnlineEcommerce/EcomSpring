package com.spring.ecomspring.services;

import com.spring.ecomspring.entities.DocumentType;
import com.spring.ecomspring.repository.DocumentTypeRepository;
import com.spring.ecomspring.util.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class DocumentTypeImpl {

    @Autowired
    private DocumentTypeRepository documentTypeRepository;

    @Autowired
    private StringUtil stringUtil;

    public List<DocumentType> getfindAll(){

        List<DocumentType> documentTypes = documentTypeRepository.findAll();

        for(DocumentType document : documentTypes){

            String name_InSpaces = stringUtil.trim(document.getName());
            document.setName(name_InSpaces);
        }

        return documentTypes;
    }



}
