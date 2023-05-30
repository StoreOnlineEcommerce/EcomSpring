package com.spring.ecomspring.services;

import com.spring.ecomspring.entities.DocumentType;
import com.spring.ecomspring.entities.User;
import com.spring.ecomspring.repository.UserRepository;
import com.spring.ecomspring.util.SortingCriteria;
import com.spring.ecomspring.util.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import javax.swing.plaf.basic.ComboPopup;
import java.util.*;
import java.util.stream.Collectors;

@Service
public class UserServiceImpl implements IUserService{

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private DocumentTypeImpl documentTypeImpl;

    @Autowired
    private StringUtil stringUtil;

    /**
     * Filter parameters of the table User
     * @param user Object User
     * @return user filters
     */
    public User filterEmptySpaces(User user){

        String name_InSpaces = stringUtil.trim(user.getName());
        String lastName_InSpaces = stringUtil.trim(user.getLastName());
        String documentNumber_InSpaces = stringUtil.trim(user.getDocumentNumber());
        String numberPhone_InSpaces = stringUtil.trim(user.getNumberPhobe());
        String email_InSpaces = stringUtil.trim(user.getEmail());
        DocumentType documentType = user.getDocumentTypes();

        user.setName(name_InSpaces);
        user.setLastName(lastName_InSpaces);
        user.setDocumentNumber(documentNumber_InSpaces);
        user.setNumberPhobe(numberPhone_InSpaces);
        user.setEmail(email_InSpaces);

        if(documentType != null){
            user.setDocumentTypes(documentTypeImpl.filterEmptySpaces(documentType));
        }

        return user;
    }

    /**
     * Filter List of the parameters in User
     * @param users list of users to filter
     * @return List of the User
     */
    public List<User> listFilterEmptySpaces(List<User> users){

        List<User> userList = new ArrayList<>();

        for(User user : users){
            userList.add(filterEmptySpaces(user));
        }

        return userList;
    }

    /**
     * process data of the date
     * @param date to process
     * @return String[] process date
     */
    public String[] processDataDate(String date){

        String[] processDate = new String[3];

        if(!Objects.isNull(date)){

            String[] partsDate = date.split("-");

            processDate[0] = partsDate[2]; // Día
            processDate[1] = partsDate[1]; // Mes
            processDate[2] = partsDate[0]; // Año
        }

        return processDate;
    }


    public List<User> findAll(){

        List<User> users = userRepository.findAllWithDocumentType();

        return listFilterEmptySpaces(users);
    }

    @Override
    public List<User> findAllSortedById() {

        List<User> users = findAll();
        // Ordena la lista de usuarios por el campo "userId"
        users.sort(Comparator.comparingLong(User::getUserId));
        return users;
 }

    @Override
    public List<User> findALlSortedByName() {

        List<User> users = findAll();
        // Ordenar la lista de usuarios por el campo "name" y tratar los valores nulos como mayores que cualquier otro valor
        users.sort(Comparator.comparing(User::getName, Comparator.nullsLast(String::compareTo)));
        return users;
    }

    @Override
    public List<User> findAllSortedByLastName() {

        List<User> users = findAll();
        // Ordenar la lista de usuarios por el campo "lastName" y tratar los valores nulos como mayores que cualquier otro valor
        users.sort(Comparator.comparing(User::getLastName, Comparator.nullsLast(String::compareTo)));

        return users;
    }

    @Override
    public List<User> findAllSortedByDocumentNumber() {
        List<User> users = findAll();
        // Ordenar la lista de usuarios por el campo "DocumentNumber" y tratar los valores nulos como mayores que cualquier otro valor
        users.sort(Comparator.comparing(User::getDocumentNumber, Comparator.nullsLast(String::compareTo)));
        return users;
    }

    @Override
    public List<User> findAllSortedByNumberPhone() {
        List<User> users = findAll();
        // Ordenar la lista de usuarios por el campo "numberphone" y tratar los valores nulos como mayores que cualquier otro valor
        users.sort(Comparator.comparing(User::getNumberPhobe, Comparator.nullsLast((String::compareTo))));
        return users;
    }

    @Override
    public List<User> findAllSortedByEmail() {
        List<User> users = findAll();

        users.sort(Comparator.comparing(User::getEmail, Comparator.nullsLast(String::compareTo)));
        return users;
    }

    @Override
    public List<User> findAllSortedByCreationDate() {

        return null;
    }

    @Override
    public List<User> findAllSortedByBirthDate() {
        return null;
    }

    @Override
    public List<User> findAllSortedByDocumentType() {
        return null;
    }

    public List<User> findAllUserWithSorting(SortingCriteria<User> sortingCriteria){
        //return userRepository.findAllWithSorting(sortingCriteria);
        Sort sort = Sort.by(sortingCriteria.getDirection(), sortingCriteria.getProperty());
        return userRepository.findAll(sort);
    }

    @Override
    public Optional<User> findById(Long id) {

        Optional<User> userOptional = userRepository.findByIdWithDocumentType(id);

        if(userOptional.isPresent()){
            User user = userOptional.get();
            user = filterEmptySpaces(user);
            //userOptional = Optional.of(user);
        }

        return userOptional;
    }


    @Override
    public User save(User user) {

        user = filterEmptySpaces(user);

        if(user.getEmail() == null || user.getEmail().isEmpty()){
            throw new IllegalArgumentException("The email of the User is requeried");
        }
        if(user.getPassword() == null || user.getPassword().isEmpty()){
            throw new IllegalArgumentException("The password of the User is requeried");
        }
        if(user.getCreationDate() == null){
            throw new IllegalArgumentException(("The creation date of the user is requeried"));
        }

        return userRepository.save(user);
    }

    @Override
    public User update(User user) {

        user = filterEmptySpaces(user);

        if(user.getEmail() == null || user.getEmail().isEmpty()){
            throw new IllegalArgumentException("The email of the User is requeried");
        }
        if(user.getPassword() == null || user.getPassword().isEmpty()){
            throw new IllegalArgumentException("The password of the User is requeried");
        }
        if(user.getCreationDate() == null){
            throw new IllegalArgumentException(("The creation date of the user is requeried"));
        }

        return userRepository.save(user);
    }

    @Override
    public void deleteById(Long id) {

        userRepository.deleteById(id);

    }

    @Override
    public void deleteAllById(List<Long> ids) {

        if(CollectionUtils.isEmpty(ids)){
            throw  new IllegalArgumentException("Trying to delete an empty or null ids list");
        }

        for(Long id: ids){
            if(!this.userRepository.existsById(id)){
                throw new IllegalArgumentException("id notfound : " + id);
            }
        }

        this.userRepository.deleteAllById(ids);
    }

    @Override
    public void deleteAll() {

    }

    @Override
    public void deleteAll(List<User> users) {

    }

}
