//package com.conversestore.controller;
//
//import java.util.ArrayList;
//import java.util.List;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.GetMapping;
//
//import com.conversestore.model.ReportCategory;
//import com.conversestore.service.CommentService;
//
//
//@Controller
//public class ReportCategoryController {
//	@Autowired
//	CommentService commentService;
//	
//    @GetMapping("/assets/admin/reportcates")
//    public String getCategoryRevenue(Model model) {
//        List<ReportCategory> reportCategories = commentService.getCategoryRevenue();
//
//        List<String> categories = new ArrayList<>();
//        List<Double> revenues = new ArrayList<>();
//
//        for (ReportCategory reportCategory : reportCategories) {
//            categories.add(reportCategory.getGroup());
//            revenues.add(reportCategory.getSum());
//        }
//
//        model.addAttribute("categories", categories);
//        model.addAttribute("revenues", revenues);
//        return "assets/admin/reportcates";
//    }
//}
