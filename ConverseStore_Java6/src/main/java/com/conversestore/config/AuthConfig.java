package com.conversestore.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;

@Configuration
@EnableWebSecurity
public class AuthConfig extends WebSecurityConfigurerAdapter{
	
	@Autowired
	BCryptPasswordEncoder pe;
	
	// Mã hoá pass
    @Bean
    public BCryptPasswordEncoder bCryptPasswordEncoder() {
        return new BCryptPasswordEncoder();
    }
	
	// Quản lý dữ liệu người dùng
	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth.inMemoryAuthentication()
		.withUser("wesd4444@gmail.com").password(pe.encode("123")).roles("customer")
		.and()
		.withUser("user2").password(pe.encode("123")).roles("customer","employee")
		.and()
		.withUser("user3").password(pe.encode("123")).roles("customer","employee","admin");
	}
	
	
	// Phân quyền và hình thức đăng nhập
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http.csrf().disable().cors().disable();
		
		// Phân quyền
		http.authorizeRequests()
		  .antMatchers("/yeuthich").hasAnyRole("customer","employee","admin")
		  .antMatchers("/sanpham").hasAnyRole("customer","employee","admin")
		  .antMatchers("/giohang").hasAnyRole("customer","employee","admin")
		  .anyRequest().permitAll();
		
		http.formLogin()
		  .loginPage("/dangnhap")
		  .loginProcessingUrl("auth/login")
		  .defaultSuccessUrl("/trangchu")
		  .failureUrl("/doimatkhau")
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
