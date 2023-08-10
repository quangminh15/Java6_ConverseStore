// package com.conversestore.config;

// import org.springframework.beans.factory.annotation.Autowired;
// import org.springframework.context.annotation.Bean;
// import org.springframework.security.authentication.AuthenticationManager;
// import org.springframework.security.config.annotation.web.builders.HttpSecurity;
// import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
// import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
// import org.springframework.security.web.SecurityFilterChain;
// import org.springframework.stereotype.Component;

// @Component
// @EnableWebSecurity
// public class SecurityConfig extends WebSecurityConfigurerAdapter {

    // @Bean
    // protected void configurer(HttpSecurity http) throws Exception {
    //     http.csrf().disable().cors().disable();
    //     http.authorizeRequests()
    //             .anyRequest().permitAll()
    //             .and()
    //             .httpBasic();
    // }

//}
