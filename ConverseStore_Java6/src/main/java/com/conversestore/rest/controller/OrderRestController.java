package com.conversestore.rest.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.conversestore.service.OrderService;

@CrossOrigin("*")
@RestController
@RequestMapping("/rest/order")
public class OrderRestController {

    @Autowired
    OrderService orderService;

    @PostMapping
    public void createOrder(@RequestParam("name") String name, 
                            @RequestParam("address") String address,
                            @RequestParam("phone") String phone,
                            @RequestParam("tongtien")Float tongtien) {

        orderService.addToOrder(2, name, address, phone, tongtien);

    }
    @GetMapping
    public String getOrder(){
        orderService.getOrderByUser(2);
        return "user/danhsachdonhang";
    }
}
