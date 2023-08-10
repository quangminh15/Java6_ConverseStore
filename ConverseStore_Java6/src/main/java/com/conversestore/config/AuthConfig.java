package com.conversestore.config;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import com.conversestore.dao.CustomerDAO;
import com.conversestore.dao.EmployeeDAO;
import com.conversestore.model.Customer;
import com.conversestore.model.Employees;
import com.conversestore.service.CustomerService;
import com.conversestore.service.EmployeeService;

@Configuration
@EnableWebSecurity
public class AuthConfig extends WebSecurityConfigurerAdapter{
	
	@Autowired
	BCryptPasswordEncoder pe;
	
	@Autowired
	CustomerDAO customerService;
	
	@Autowired
	EmployeeDAO employeeService;
	
	// Mã hoá pass
    @Bean
    public BCryptPasswordEncoder bCryptPasswordEncoder() {
        return new BCryptPasswordEncoder();
    }
	
	// Quản lý dữ liệu người dùng
	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth.userDetailsService(email ->{
			try {
				Employees emp = employeeService.findByEmail(email);
				String pass = emp.getEmployeePassword();
				String role = "";
				if(emp.getEmployeeRole()) {
					role = "admin";
				}else {
					role = "employee";
				}
				return User.withUsername(email).password(pe.encode(pass)).roles(role).build();
			} catch (Exception e) {
				throw new UsernameNotFoundException("Không tìm thấy: "+email);
			}
		});
		
		auth.userDetailsService(email ->{
			try {
				Customer c = customerService.findByEmail(email);
				String pass = c.getCustomerPassword();
				return User.withUsername(email).password(pe.encode(pass)).roles("customer").build();
			} catch (Exception e) {
				throw new UsernameNotFoundException("Không tìm thấy: "+email);
			}
		});
//		auth.inMemoryAuthentication()
//		.withUser("wesd4444@gmail.com").password(pe.encode("123")).roles("customer")
//		.and()
//		.withUser("user2").password(pe.encode("123")).roles("customer","employee")
//		.and()
//		.withUser("hvn4554@gmail.com").password(pe.encode("123")).roles("customer","employee","admin");
	}
	
	
	// Phân quyền và hình thức đăng nhập
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http.csrf().disable().cors().disable();
		
		// Phân quyền
		http.authorizeRequests()
		  .antMatchers("/yeuthich").hasAnyRole("customer")
		  .antMatchers("/giohang").hasAnyRole("customer","employee","admin")
		  .antMatchers("/admin/**").hasAnyRole("employee","admin")
		  .antMatchers("/admin/thongke").hasAnyRole("admin")
		  .anyRequest().permitAll()
		  .and()
			.exceptionHandling()
		    .accessDeniedPage("/accessdenied");
		
		http.formLogin()
		  .loginPage("/dangnhap")
		  .loginProcessingUrl("/auth/login")
		  .successHandler((request, response, authentication) -> {
		        String targetUrl = determineTargetUrl(authentication);
		        response.sendRedirect(targetUrl);
		    })
		  .failureUrl("/dangnhap/error")
		  .usernameParameter("email")
		  .passwordParameter("pass");
		
		http.rememberMe()
		  .rememberMeParameter("remember");
		
		http.logout()
		  .logoutUrl("/auth/logoff")
		  .logoutSuccessUrl("/dangnhap");
//			.invalidateHttpSession(true) // Xoá phiên người dùng sau khi đăng xuất
//		    .deleteCookies("JSESSIONID") // Xoá các cookie liên quan đến phiên
//		    .addLogoutHandler(new SecurityContextLogoutHandler());System.out.println(444);
		
		
		http.oauth2Login()
        .loginPage("/dangnhap")
        .defaultSuccessUrl("/oauth2/login/success",true)
        .failureUrl("/dangnhap/error")
        .authorizationEndpoint()
            .baseUri("/oauth2/authorization");
	}
	
	private String determineTargetUrl(Authentication authentication) {
	    String role = authentication.getAuthorities().toString();

	    if (role.contains("admin") || role.contains("employee")) {
	        return "/admin_nguoidung";
	    } else {
	        return "/trangchu";
	    }
	}

}
