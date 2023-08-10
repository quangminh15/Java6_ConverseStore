package com.conversestore.dao;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;


import com.conversestore.model.Order;
import com.conversestore.model.OrderDetail;

public interface OderDetailDAO extends JpaRepository<OrderDetail, Integer> {
    List <OrderDetail> findByOrders(Order order);
}
