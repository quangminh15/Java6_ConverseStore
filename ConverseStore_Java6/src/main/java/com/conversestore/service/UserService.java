package com.conversestore.service;

import org.springframework.beans.factory.annotation.Autowired;
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

import com.conversestore.model.Customer;
import com.conversestore.model.Employees;

@Service
public class UserService {
	
	@Autowired
	EmployeeService empService;
	
	@Autowired
	CustomerService cusService;

    public void loginFromOAuth2(OAuth2AuthenticationToken oauth2) {
        String email = oauth2.getPrincipal().getAttribute("email");
        String pass = Long.toHexString(System.currentTimeMillis());
        
        UserDetails u = User.withUsername(email).password(pass).roles("customer").build();
        Authentication auth = new UsernamePasswordAuthenticationToken(u, null, u.getAuthorities());
        SecurityContextHolder.getContext().setAuthentication(auth);
        
        // Call API Save in DB
        Customer c = new Customer(0);
        c.setCustomerEmail(email);
        c.setCustomerPassword(pass);
        c.setCustomerName(oauth2.getPrincipal().getAttribute("name"));
        cusService.create(c);
    }

    // Replace this with your actual user loading logic
    public Object loadUserByAuth(Authentication  auth) {
    	String email = auth.getName();
        Customer c = cusService.findByEmail(email);
        Employees e = empService.findByEmail(email);
        if(c != null) {
        	return c;
        }
//        else if(e != null) {
//        	return e;
//        }
        
        return null;
    }
    
    public int loadUserIdByAuth(Authentication  auth) {
    	String email = auth.getName();
        Customer c = cusService.findByEmail(email);
        Employees e = empService.findByEmail(email);
        if(c != null) {
        	return c.getCustomerId();
        }
        
//        else if(e != null) {
//        	return e.getEmployeeId();
//        }
        return 0;
    }
    
}
