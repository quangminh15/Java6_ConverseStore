package com.conversestore.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.conversestore.model.Promotions;

public interface PromotionsDAO extends JpaRepository<Promotions, Integer> {
    @Query(nativeQuery = true, value = "EXEC SearchPromotionsByDiscountRange :minDiscount, :maxDiscount")
    List<Promotions> searchPromotionsByDiscountRange(@Param("minDiscount") Float minDiscount, @Param("maxDiscount") Float maxDiscount);
}
