package com.conversestore.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.conversestore.model.Customer;
import com.conversestore.model.Employees;
import com.conversestore.rest.controller.CustomerRestController;
import com.conversestore.service.CustomerService;
import com.conversestore.service.EmployeeService;

@Controller
public class Usercontroller {
	
	@Autowired
	CustomerService customerService;
	
	@Autowired
	EmployeeService employeeService;

	
	@RequestMapping("/yeuthich")
	public String yeuthich() {
		return "user/yeuthich";
	}
//LongHai Start
	@RequestMapping("/giohang")
	public String cart(Model model) {
		model.addAttribute("title","GIỎ HÀNG");
		return "user/giohang";
	}
	
	@RequestMapping("/danhsachdonhang")
	public String listDonHang(Model model) {
		model.addAttribute("title","ĐƠN HÀNG");
		return "user/danhsachdonhang";
	}
	
	@RequestMapping("/donhang")
	public String donHang(Model model) {
		model.addAttribute("title","ĐƠN HÀNG");
		return "user/donhang";
	}
//LongHai End
	
//	ni start
	@RequestMapping("/dangnhap")
	public String dangnhap(Model model) {
		model.addAttribute("title","ĐĂNG NHẬP");
		model.addAttribute("Customer", new Customer());
		return "user/dangnhap";
	}
	
	@RequestMapping("/loginConfirm")
	public String DangNhap1(Model model, @ModelAttribute("Customer") Customer c, @RequestParam("pass") String pass) {
//		model.addAttribute("nguoidung", new NguoiDung());
		System.out.println("Customer from form: "+c);
		System.out.println("Pass from form: "+pass);
//		if(u.getEmail().equals("")) {
//			model.addAttribute("messageLoginFail", "Lỗi để trống Email!");
//	        return "/nguoidung/dangnhap";
//		}else if(pass.equals("")) {
//			NguoiDung ndTemp = new NguoiDung();
//			ndTemp.setEmail(u.getEmail());
//			model.addAttribute("nguoidung", ndTemp);
//			model.addAttribute("messageLoginFail", "Lỗi để trống Mật khẩu!");
//	        return "/nguoidung/dangnhap";
//		}else {
			// Lấy user đầy đủ
			Customer customer = customerService.findByEmail(c.getCustomerEmail());
			Employees emp = employeeService.findByEmail(c.getCustomerEmail());
			
			if(customer == null && emp == null) {
//				NguoiDung ndTemp = new NguoiDung();
				model.addAttribute("title","ĐĂNG NHẬP");
				model.addAttribute("Customer", new Customer());
				model.addAttribute("messageLoginFail", "Thông tin đăng nhập chưa chính xác");
		        return "user/dangnhap";
			}
			if(customer != null) {
				System.out.println("Name of Customer from form: "+customer.getCustomerName());
				if(customer.getCustomerPassword().equalsIgnoreCase(pass)) {
			        return "redirect:/trangchu";
				}
			}
			if(emp != null) {
				System.out.println("Name of Employee from form: "+emp.getEmployeeName());
				if(emp.getEmployeePassword().equalsIgnoreCase(pass)) {
					if(emp.getEmployeeRole()) {
						return "redirect:/admin_nguoidung";
					}
						return "redirect:/admin_nguoidung";
				}
			}
			
			
//			// Xác thực đăng nhập và kiểm tra thông tin người dùng
//		    if (authenticate(user.getEmail(), pass)) {
//		        // Lưu thông tin người dùng vào session
//		    	System.out.println("Mã: "+user.getMand());
//		    	System.out.println("Email: "+user.getEmail());
//		    	System.out.println("Vai trò: "+user.isVaitro());
//		    	user.setMatkhau(pass);
//		    	sessionService.setSessionAttribute("user", user);
//		    	System.out.println("--------Đã lưu session từ đăng nhập---------" );
//		    	
//		    	// Lưu thông tin vào Cookie
//		    	boolean remember = paramService.getBoolean("remember", false);System.out.println("Remember: "+remember);
//		    	if(remember) {
//		    		System.out.println("Đã tick remember");
//		    		cookieService.addCookie("email", u.getEmail(), 2);
//		    		cookieService.addCookie("pass", pass, 2);
//		    	}else {
//		    		System.out.println("Không tick remember");
//		    		cookieService.removeCookie("email");
//		    		cookieService.removeCookie("pass");
//		    	}
//		    	   	
//		        // Đăng nhập thành công, chuyển hướng đến trang chính
//		    	if(user.isVaitro()) {
//		    		return "redirect:/admin/admin_nguoidung";
//		    	}else {
//		    		return "redirect:/trangchu";
//		    	}
//		    } else {
//		        // Đăng nhập không thành công, xử lý lỗi hoặc hiển thị thông báo
//		    	model.addAttribute("messageLoginFail", "Thông tin đăng nhập chưa chính xác");
			model.addAttribute("title","ĐĂNG NHẬP");
			model.addAttribute("Customer", new Customer());
			model.addAttribute("messageLoginFail", "Thông tin đăng nhập chưa chính xác");
	        return "user/dangnhap";
//		    }
//		}
		
	}
	
	@RequestMapping("/dangky")
	public String dangky(Model model) {
		model.addAttribute("title","ĐĂNG KÝ");
		return "user/dangky";
	}
	
	@RequestMapping("/dangxuat")
	public String dangxuat(Model model) {
		model.addAttribute("title","ĐĂNG NHẬP");
		
		return "user/dangnhap";
	}
	
	@RequestMapping("/quenmatkhau")
	public String quenmatkhau(Model model) {
		model.addAttribute("title","QUÊN MẬT KHẨU");
		return "user/quenmatkhau";
	}
	
	@RequestMapping("/doimatkhau")
	public String doimatkhau(Model model) {
		model.addAttribute("title","ĐỔI MẬT KHẨU");
		return "user/doimatkhau";
	}
	
	@RequestMapping("/thongtincanhan")
	public String thongtincanhan(Model model) {
		model.addAttribute("title","THÔNG TIN CÁ NHÂN");
		return "user/thongtincanhan";
	}
//	ni end
}
