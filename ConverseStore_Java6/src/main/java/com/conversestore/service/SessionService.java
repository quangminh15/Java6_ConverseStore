package com.conversestore.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;



@Service
public class SessionService {
	@Autowired
	HttpSession session;

	@SuppressWarnings("unchecked")
	public <T> T getSessionAttribute(String name) {
	    return  (T) session.getAttribute(name);
	}

	public void setSessionAttribute(String name, Object value) {
	    session.setAttribute(name, value);
	}

	public void removeSessionAttribute(String name) {
		session.invalidate();
	}
}
