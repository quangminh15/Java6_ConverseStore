package com.conversestore.dao;
import org.springframework.data.jpa.repository.JpaRepository;

import com.conversestore.model.Receiver;

public interface ReceiverDAO extends JpaRepository<Receiver, Integer> {

}
