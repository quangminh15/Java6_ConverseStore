package com.conversestore.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.conversestore.model.Order;
import com.conversestore.model.OrderDetail;
import com.conversestore.service.OrderService;
//import com.conversestore.service.SecurityRestTemplate;


@Controller
public class CartIController {

	@Autowired
	OrderService orderService;

	@GetMapping("/cart")
	public String getCart() {
		return "user/giohang";
	}

	@GetMapping("/order/create")
	public String getOrder() {
		return "user/thongtinmuahang";
	}

	@GetMapping("/order/getOrder")
	public String restOrder(Model model){
		model.addAttribute("orders", orderService.getOrderByUser(2));
		return "user/danhsachdonhang";
	}

	@GetMapping("/order/orderdetail/{id}")
	public String restOrder(@PathVariable("id") Integer id ,Model model){
		Order order = orderService.findById(id);
		List<OrderDetail> list = orderService.gDetailsByOrder(id);

		model.addAttribute("orderdetails", list);

		model.addAttribute("name",order.getCustomer().getCustomerName());
		model.addAttribute("idOrder",order.getOrderId());
		model.addAttribute("receiver",order.getReceivername());
		model.addAttribute("phone",order.getReceiverphone());
		model.addAttribute("address",order.getReceiveraddress());
		model.addAttribute("total",order.getTotal());
		return "user/receipt";
	}
}
