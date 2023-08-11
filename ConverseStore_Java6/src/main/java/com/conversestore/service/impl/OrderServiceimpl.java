package com.conversestore.service.impl;

import java.text.SimpleDateFormat;
import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.conversestore.dao.CartDAO;
import com.conversestore.dao.CartItemDAO;
import com.conversestore.dao.CustomerDAO;
import com.conversestore.dao.OderDAO;
import com.conversestore.dao.OderDetailDAO;
import com.conversestore.dao.ProductVariantDAO;
import com.conversestore.model.Cart;
import com.conversestore.model.CartItem;
import com.conversestore.model.Customer;
import com.conversestore.model.Order;
import com.conversestore.model.OrderDetail;
import com.conversestore.model.ProductVariants;

import com.conversestore.service.OrderService;

@Service
public class OrderServiceimpl implements OrderService {
    @Autowired
    CustomerDAO cusS;
    @Autowired
    CartDAO cartDao;
    @Autowired
    CartItemDAO cartItemDao;
    @Autowired
    OderDAO orderDao;
    @Autowired
    OderDetailDAO orderDDao;
    @Autowired
    ProductVariantDAO pVaDao;

    @Override
    public void addToOrder(Integer customerId, String receiverName, String receiverAddress, String receiverPhone,
            Float tongTien) {
        Customer cus = cusS.findById(customerId).get();
        Cart cart = cartDao.findByCustomers(cus);
        List<CartItem> listCartItems = cartItemDao.findByCart(cart);

        SimpleDateFormat formatter = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
        java.util.Date date = new java.util.Date();
        var order = Order.builder()
                .customer(cus)
                .receivername(receiverName)
                .receiveraddress(receiverAddress)
                .receiverphone(receiverPhone)
                .status("Đang chờ xác nhận")
                .orderdate(formatter.format(date))
                .total(tongTien)
                .build();

        orderDao.save(order);

        for (CartItem cartitem : listCartItems) {
           
            ProductVariants pVa = pVaDao.findById(cartitem.getProductVariant().getVariantID()).get();

            var orderdetail = OrderDetail.builder()
            .orders(order)
            .productVariants(pVa)
            .quantity(cartitem.getQuantity())
            .build();
            

            orderDDao.save(orderdetail);

            cartItemDao.delete(cartitem);

            pVa.setQuantity(pVa.getQuantity() - orderdetail.getQuantity());

            pVaDao.save(pVa);
        }
    }

    @Override
    public List<Order> getOrderByUser(Integer UserID) {
        Customer cus = cusS.findById(UserID).get();
        List<Order> list = orderDao.findByCustomer(cus);
        return list;
    }

    @Override
    public List<OrderDetail> gDetailsByOrder(Integer orderID) {
        Order order = orderDao.findById(orderID).orElse(null);

    if (order != null) {
        List<OrderDetail> list = orderDDao.findByOrders(order);
        return list;
    }
    
    return Collections.emptyList();
        
    }

    @Override
    public Order findById(Integer id) {
       return orderDao.findById(id).get();
    }

}
