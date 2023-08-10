package com.conversestore.service;

import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.oauth2.client.authentication.OAuth2AuthenticationToken;
import org.springframework.security.oauth2.client.authentication.OAuth2AuthorizationCodeAuthenticationToken;
import org.springframework.security.oauth2.core.OAuth2AccessToken;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Service;

@Service
public class UserService {

    public void loginFromOAuth2(OAuth2AuthenticationToken oauth2) {
        String email = oauth2.getPrincipal().getAttribute("email");
        String pass = Long.toHexString(System.currentTimeMillis());
        
        UserDetails u = User.withUsername(email).password(pass).roles("customer").build();
        Authentication auth = new UsernamePasswordAuthenticationToken(u, null, u.getAuthorities());
        SecurityContextHolder.getContext().setAuthentication(auth);
    }

    // Replace this with your actual user loading logic
    private UserDetails loadUserByEmail(String email) {
        // Implement this method to load UserDetails by email
        // For example, you can use your UserDetailsService or UserRepository
        // Return null if the user doesn't exist
        return null;
    }
}
