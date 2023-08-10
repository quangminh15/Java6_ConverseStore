package com.conversestore.service;




import java.util.List;

import org.springframework.stereotype.Service;

import com.conversestore.model.Order;
import com.conversestore.model.OrderDetail;



@Service
public interface OrderService {
    public void addToOrder(Integer customerId, String receiverName, String receiverAddress, String receiverPhone, Float tongTien);

    public List<Order>getOrderByUser(Integer UserID);

    public List <OrderDetail> gDetailsByOrder(Integer orderID);

    Order findById(Integer id);
}
