package com.spring.ecomspring.security;


import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.web.cors.CorsConfiguration;
import org.springframework.web.cors.CorsConfigurationSource;
import org.springframework.web.cors.UrlBasedCorsConfigurationSource;

import java.util.Arrays;

@Configuration
@EnableWebSecurity
public class securityConfig extends WebSecurityConfigurerAdapter {


    @Bean
    public CorsConfigurationSource corsConfigurationSource() {
        CorsConfiguration configuration = new CorsConfiguration();
        configuration.setAllowedOrigins(Arrays.asList("http://localhost:8080/api/document-type")); // Especifica los orígenes permitidos
        configuration.setAllowedMethods(Arrays.asList("GET", "POST", "PUT", "DELETE")); // Especifica los métodos HTTP permitidos
        configuration.setAllowedHeaders(Arrays.asList("Content-Type", "Authorization")); // Especifica los encabezados permitidos
        UrlBasedCorsConfigurationSource source = new UrlBasedCorsConfigurationSource();
        source.registerCorsConfiguration("/**", configuration);
        return source;
    }


    @Override
    protected void configure(HttpSecurity http) throws Exception{

        http.authorizeRequests()
                .antMatchers("/api", "/api/Holamundo").permitAll()
                .antMatchers("/api/document-type").permitAll()
                .antMatchers(HttpMethod.POST, "/api/document-type").permitAll() // Permitir POST a /api/document-type sin autenticación
                .anyRequest().authenticated()
                .and().formLogin()
                .and().httpBasic();
    }
}
