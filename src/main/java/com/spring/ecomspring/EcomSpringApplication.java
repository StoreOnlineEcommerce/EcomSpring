package com.spring.ecomspring;

import com.spring.ecomspring.entities.User;
import com.spring.ecomspring.repository.UserRepository;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ApplicationContext;

import java.util.Date;

@SpringBootApplication
public class EcomSpringApplication {

    public static void main(String[] args) {
        ApplicationContext context =  SpringApplication.run(EcomSpringApplication.class, args);

        UserRepository userRepository = context.getBean(UserRepository.class);


        //User user1 = userRepository.save(new User(null, "Antonio", "Zapata", "123445566", "3245567890", "dd@gmail.com","asddss", new Date(90,6,12), new Date(90,62,0), 1));



    }

}
