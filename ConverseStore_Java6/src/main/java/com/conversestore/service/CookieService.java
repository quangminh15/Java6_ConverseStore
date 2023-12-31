package com.conversestore.service;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

 

@Service
public class CookieService {
	@Autowired
	HttpServletRequest request;

	@Autowired
	HttpServletResponse response;
	public Cookie getCookie(String name) {
	    Cookie[] cookies = request.getCookies();
	    if (cookies != null) {
	        for (Cookie cookie : cookies) {
	            if (cookie.getName().equals(name)) {
	                return cookie;
	            }
	        }
	    }
	    return null;
	}

	public String getCookieValue(String name) {
	    Cookie cookie = getCookie(name);
	    if (cookie != null) {
	        return cookie.getValue();
	    }
	    return "";
	}

	public Cookie addCookie(String name, String value, int hours) {
	    Cookie cookie = new Cookie(name, value);
	    cookie.setMaxAge(hours * 3600); // giay
	    cookie.setPath("/");
	    response.addCookie(cookie);
	    return cookie;
	}

	public void removeCookie(String name) {
	    Cookie cookie = getCookie(name);
	    if (cookie != null) {
	        cookie.setMaxAge(0);
	        cookie.setPath("/");
	        response.addCookie(cookie);
	    }
	}
}
