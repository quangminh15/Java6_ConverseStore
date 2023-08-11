package com.conversestore.service;




import java.util.List;

import org.springframework.stereotype.Service;

import com.conversestore.model.Order;
import com.conversestore.model.OrderDetail;



public interface OrderService {
    public void addToOrder(Integer customerId, String receiverName, String receiverAddress, String receiverPhone, Float tongTien);

    public List <Order>getOrderByUser(Integer UserID);
    
    List<Order> findAll();

    public List <OrderDetail> gDetailsByOrder(Integer orderID);

    

    Order findById(Integer id);

}
