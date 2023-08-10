package com.conversestore.rest.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.conversestore.dao.CustomerDAO;

@CrossOrigin("*")
@RestController
@RequestMapping("/rest/au")
public class AuthorityRestController {
    @Autowired
    CustomerDAO cusDao;
    @GetMapping
    public Map<String,Object> getAuthorities(){
        Map<String,Object> data = new HashMap<>();
        data.put("au",cusDao.findAll() );
        return data;
    }
}
