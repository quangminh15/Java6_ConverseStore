package com.conversestore.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.conversestore.dao.PromotionsDAO;
import com.conversestore.model.Promotions;
import com.conversestore.service.PromotionService;

@Service
public class PromotionServiceImpl implements PromotionService {
	@Autowired
	PromotionsDAO proDao;

	@Override
	public List<Promotions> findAll() {
		return proDao.findAll();
	}

	@Override
	public Promotions create(Promotions promotions) {
		return proDao.save(promotions);
	}

	@Override
	public Promotions update(Promotions promotion) {
		return proDao.save(promotion);
	}

	@Override
	public Promotions findById(Integer id) {
		return proDao.findById(id).get();
	}

	@Override
	public void delete(Integer id) {
		proDao.deleteById(id);

	}

	@Override
	public List<Promotions> searchPromotionsByDiscountRange(float minDiscount, float maxDiscount) {
		return proDao.searchPromotionsByDiscountRange(minDiscount, maxDiscount);
	}

	@Override
	public void saveStatus(Promotions promotions) {
		Date currentDate = new Date();

		if (promotions.getStartDate().after(currentDate)) {
			promotions.setStatus("Chưa diễn ra");
		} else if (promotions.getEndDate().before(currentDate)) {
			promotions.setStatus("Đã tết khúc");
		} else {
			promotions.setStatus("Đang diễn ra");
		}
	}

}
