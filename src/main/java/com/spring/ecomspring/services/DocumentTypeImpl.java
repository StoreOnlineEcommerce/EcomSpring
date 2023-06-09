package com.spring.ecomspring.services;

import com.spring.ecomspring.entities.DocumentType;
import com.spring.ecomspring.repository.DocumentTypeRepository;
import com.spring.ecomspring.util.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
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
     * Filter name documetType
     * @param documentType type of document to filter
     * @return DocumentType filter
     */
    public DocumentType filterEmptySpaces(DocumentType documentType){

        String name_InSpaces = stringUtil.trim(documentType.getName());
        documentType.setName(name_InSpaces);

        return documentType;
    }


    /**
     * Obtiene la lista de los tipos de documentos
     * @return List<DocumentType> lista de documentos sin espacios vacios al inicio y final
     */
    public List<DocumentType> getfindAll(){

        // Variable encargada de ordenar los datos por su ID de manera ascendente
        Sort sortDocumentType = Sort.by(Sort.Direction.ASC, "documentId");
        List<DocumentType> documentTypes = documentTypeRepository.findAll(sortDocumentType);

        for(DocumentType document : documentTypes){

              document = filterEmptySpaces(document);
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
            document = filterEmptySpaces(document);
        }
        return documentOptional;
    }

    public DocumentType saveId(DocumentType documentType){

        if(documentType.getName()  == null || documentType.getName().trim().isEmpty()){
            throw new IllegalArgumentException("the name of the document type is requerid");
        }
        return documentTypeRepository.save(documentType);
    }

    public DocumentType updateId(Long id, DocumentType documentType){

        Optional<DocumentType> documentTypeOptional = documentTypeRepository.findById(id);

        if(documentTypeOptional.isPresent()){

            if(documentType.getName()  == null || documentType.getName().trim().isEmpty()){
                throw new IllegalArgumentException("the name of the document type is requerid");
            }

            DocumentType documentType1 = documentTypeOptional.get();
            documentType1.setName(documentType.getName());

            return documentTypeRepository.save(documentType1);

        }else{
            throw new IllegalArgumentException("Id not existing, please check the id");
        }
    }

    public void deleteId(Long id){

        if(documentTypeRepository.findById(id).isPresent()){
            documentTypeRepository.deleteById(id);
        }

    }






}
