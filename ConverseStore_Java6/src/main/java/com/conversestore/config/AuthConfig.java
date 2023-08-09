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
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

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
	CustomerService customerService;
	
	@Autowired
	EmployeeService employeeService;
	
	// Mã hoá pass
    @Bean
    public BCryptPasswordEncoder bCryptPasswordEncoder() {
        return new BCryptPasswordEncoder();
    }
	
	// Quản lý dữ liệu người dùng
	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		List<Customer> cusList = new ArrayList<>();
		List<Employees> empList = new ArrayList<>();
		cusList = customerService.findAll();
		empList = employeeService.findAll();
		for(Customer x : cusList) {
			auth.inMemoryAuthentication()
			.withUser(x.getCustomerEmail()).password(pe.encode(x.getCustomerPassword())).roles("customer");
		}
		for(Employees x : empList) {
			if(x.getEmployeeRole()) {
				auth.inMemoryAuthentication()
				.withUser(x.getEmployeeEmail()).password(pe.encode(x.getEmployeePassword())).roles("customer","employee","admin");
			}
			if(!x.getEmployeeRole()) {
				auth.inMemoryAuthentication()
				.withUser(x.getEmployeeEmail()).password(pe.encode(x.getEmployeePassword())).roles("customer","employee");
			}
		}
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
		  .antMatchers("/yeuthich").hasAnyRole("employee","admin")
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
		  .defaultSuccessUrl("/trangchu",false)
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
	}
}
