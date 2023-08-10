package com.conversestore.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.conversestore.dao.RevenueDAO;
import com.conversestore.service.RevenueService;

@Service
public class RevenueServiceImpl implements RevenueService{

	@Autowired
	RevenueDAO dao;
	
	@Override
	public List<Object[]> getDoanhThu() {
		return dao.getDoanhThuDanhMuc();
	}

}
