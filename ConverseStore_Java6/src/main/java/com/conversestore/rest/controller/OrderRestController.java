package com.conversestore.rest.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.conversestore.model.CartItem;
import com.conversestore.model.Order;
import com.conversestore.model.OrderDetail;
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
    @GetMapping()
    public void getOrder(){
        orderService.getOrderByUser(2);
        
    }

    @GetMapping("/admin/{detail}")
    public List <OrderDetail> getOrderdetail(@PathVariable ("detail")Integer id ){
       return orderService.gDetailsByOrder(id);
        
    }

    @GetMapping("/admin")
    public List<Order> getall() {
       return orderService.findAll();
       
    }
}
