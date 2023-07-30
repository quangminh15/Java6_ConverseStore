package com.conversestore.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.conversestore.service.BrandService;
import com.conversestore.service.CategoryService;
import com.conversestore.service.ColorService;
import com.conversestore.service.ProductService;
import com.conversestore.service.ProductVariantService;
import com.conversestore.service.SizeService;

@Component
public class GlobalInterceptor implements HandlerInterceptor {
	@Autowired
	BrandService BrandService;
	
	@Autowired
	SizeService sizeService;
	
	@Autowired
	CategoryService categoryService;
	
	@Autowired
	ColorService colorService;
	
	@Autowired
	ProductService productservice;
	
	@Autowired
	ProductVariantService ProductVariantservice;
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		request.setAttribute("brans", BrandService.findAll());
		request.setAttribute("sizs", sizeService.findAll());
		request.setAttribute("cates", categoryService.findAll());
		request.setAttribute("cols", colorService.findAll());
		request.setAttribute("prods", productservice.findAll());
		request.setAttribute("varias", ProductVariantservice.findAll());
	}
}
