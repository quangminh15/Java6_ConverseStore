package com.conversestore.controller;

import java.awt.color.CMMException;
import java.time.Duration;
import java.time.LocalDateTime;
import java.util.Random;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.oauth2.client.authentication.OAuth2AuthenticationToken;
import org.springframework.security.oauth2.core.OAuth2AccessToken;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.conversestore.model.Customer;
import com.conversestore.model.Employees;
import com.conversestore.model.VerificationCode;
import com.conversestore.rest.controller.CustomerRestController;
import com.conversestore.service.CustomerService;
import com.conversestore.service.EmployeeService;
import com.conversestore.service.FormSendMailHTML;
import com.conversestore.service.MailerService;
import com.conversestore.service.ParamService;
import com.conversestore.service.SessionService;
import com.conversestore.service.UserService;

@Controller
public class Usercontroller {
	
	@Autowired
	CustomerService customerService;
	
	@Autowired
	EmployeeService employeeService;
	
	@Autowired
	ParamService paramService;
	
	@Autowired
	SessionService sessionService;
	
	@Autowired
	MailerService mail;
	
	VerificationCode vc;
	Customer customer = new Customer(0);
	
	@Autowired
	UserService userService;
	
	
	
	
//	ni start
	@RequestMapping("/dangnhap")
	public String dangnhap(Model model) {
		model.addAttribute("title","ĐĂNG NHẬP");
		return "user/dangnhap";
	}
	
	@RequestMapping("/dangnhap/error")
	public String dangnhapError(Model model) {
		model.addAttribute("title","ĐĂNG NHẬP");
		model.addAttribute("messageLoginFail","Thông tin đăng nhập chưa chính xác");
		return "user/dangnhap";
	}
	
	@RequestMapping("/accessdenied")
	public String AccessDenied(Model model) {
		model.addAttribute("title","Access Denied");
		return "user/AccessDenied";
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
					boolean remember = paramService.getBoolean("remember", false);
					System.out.println("Remember: "+remember);
					if(remember) {
						sessionService.setSessionAttribute("Email", customer.getCustomerEmail());
						sessionService.setSessionAttribute("Pass", customer.getCustomerPassword());
					}else {
						sessionService.removeSessionAttribute("Email");
						sessionService.removeSessionAttribute("Pass");
					}
					sessionService.setSessionAttribute("user", customer);
			        return "redirect:/trangchu";
				}
			}
			if(emp != null) {
				System.out.println("Name of Employee from form: "+emp.getEmployeeName());
				if(emp.getEmployeePassword().equalsIgnoreCase(pass)) {
					if(emp.getEmployeeRole()) { // This is Admin
						boolean remember = paramService.getBoolean("remember", false);
						System.out.println("Remember: "+remember);
						if(remember) {
							sessionService.setSessionAttribute("Email", emp.getEmployeeEmail());
							sessionService.setSessionAttribute("Pass", emp.getEmployeePassword());
						}else {
							sessionService.removeSessionAttribute("Email");
							sessionService.removeSessionAttribute("Pass");
						}
						sessionService.setSessionAttribute("user", emp);
						return "redirect:/admin_nguoidung";
					} // This is Employee
						boolean remember = paramService.getBoolean("remember", false);
						System.out.println("Remember: "+remember);
						if(remember) {
							sessionService.setSessionAttribute("Email", emp.getEmployeeEmail());
							sessionService.setSessionAttribute("Pass", emp.getEmployeePassword());
						}else {
							sessionService.removeSessionAttribute("Email");
							sessionService.removeSessionAttribute("Pass");
						}
						sessionService.setSessionAttribute("user", emp);
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
		model.addAttribute("Customer",new Customer(0));
		return "user/dangky";
	}
	
	@PostMapping("/dangkynguoidung")
	public String validDangNhap(Model model, @ModelAttribute("Customer") Customer c) {System.out.println("Thông tin đk: "+c);
		
		if(c != null) {
//			if(!checkInput(c)) {
//				model.addAttribute("messageConfirmPassWrong", this.messageCheckInputData);
//				model.addAttribute("nguoidung", this.user);
//				return "/nguoidung/dangky";
//			}
			if(NameCheck(c.getCustomerName()) != null) {
				System.out.println("Tên không hợp lệ");
				model.addAttribute("ErrName", NameCheck(c.getCustomerName()));
				model.addAttribute("title","ĐĂNG KÝ");
				model.addAttribute("Customer",new Customer(0));
				return "user/dangky";
			}
			if(EmailCheck(c.getCustomerEmail()) != null) {
				System.out.println("Email định dạng không hợp lệ");
				model.addAttribute("ErrEmail", EmailCheck(c.getCustomerEmail()));
				model.addAttribute("title","ĐĂNG KÝ");
				model.addAttribute("Customer",new Customer(0));
				return "user/dangky";
			}
			if(!checkEmailAlreadyExists(c.getCustomerEmail())) {
				System.out.println("Email đã tồn tại");
				model.addAttribute("ErrEmail", "Email đã tồn tại");
				model.addAttribute("title","ĐĂNG KÝ");
				model.addAttribute("Customer",new Customer(0));
				return "user/dangky";
			}
			if(PassCheck(c.getCustomerPassword()) != null) {
				System.out.println("Pass không hợp lệ");
				model.addAttribute("ErrPass", PassCheck(c.getCustomerPassword()));
				model.addAttribute("title","ĐĂNG KÝ");
				model.addAttribute("Customer",new Customer(0));
				return "user/dangky";
			}
			if(PassCheck(c.getCustomerImage()) != null) {
				System.out.println("Pass2 không hợp lệ");
				model.addAttribute("ErrPass2", PassCheck(c.getCustomerImage()));
				model.addAttribute("title","ĐĂNG KÝ");
				model.addAttribute("Customer",new Customer(0));
				return "user/dangky";
			}
			if(!c.getCustomerPassword().equalsIgnoreCase(c.getCustomerImage())) {
				System.out.println("Không khớp mật khẩu");
				model.addAttribute("message", "Mật khẩu không trùng khớp");
				model.addAttribute("title","ĐĂNG KÝ");
				model.addAttribute("Customer",new Customer(0));
				return "user/dangky";
			}
			if(c.getCustomerPassword().equalsIgnoreCase(c.getCustomerImage())) {
				c.setCustomerImage("");
				// this.customer = new Customer(c);
				return "redirect:/xacnhan";
			}
		}
		
		return "user/dangky";
	}
	
	@RequestMapping("/xacnhan")
	public String xacnhan(Model model) {
		this.vc  = new VerificationCode(generateCode(6));
		System.out.println("Mã code: "+this.vc.getCode());
		System.out.println("Thời gian tạo: "+this.vc.getCreatedTime());
		mail.queue(this.customer.getCustomerEmail(), "ĐĂNG KÝ TÀI KHOẢN CONVERSE", FormSendMailHTML.sendHTMLWhenResignation(vc.getCode(), this.customer.getCustomerName()));
		return "user/confirmCode";
	}
	
	@RequestMapping("/xacnhanB2")
	public String xacnhanB2(Model model, @RequestParam("code") String codeFormUser) {
		System.out.println("Mã code user nhập: "+codeFormUser);
		if(!this.vc.getCode().equals(codeFormUser)) {
			model.addAttribute("messageConfirmPassWrong", "Mã xác thực chưa đúng!");
			return "user/confirmCode";
		}
		if(!countTimeOfCode(this.vc)) {
			model.addAttribute("messageConfirmPassWrong", "Mã xác thực đã hết hiệu lực");
			return "user/confirmCode";
		}System.out.println(123);
		// this.customer  = new Customer(this.customer.getCustomerName(), this.customer.getCustomerEmail(), this.customer.getCustomerPassword());
		customerService.create(customer);
		return "redirect:/dangnhap";
	}
	
	public static String generateCode(int length) {
        StringBuilder sb = new StringBuilder();
        Random random = new Random();
        
        for (int i = 0; i < length; i++) {
            int digit = random.nextInt(10);
            sb.append(digit);
        }
        
        return sb.toString();
    }
	
	public boolean countTimeOfCode(VerificationCode vc) {
		LocalDateTime currentTime = LocalDateTime.now();
		Duration duration = Duration.between(vc.getCreatedTime(), currentTime);
		if (duration.toSeconds() <= 30) {
		    // Mã xác nhận còn hiệu lực
			return true;
		} 
		return false;
	}
	
	public boolean checkEmailAlreadyExists(String email) {
		Customer c = customerService.findByEmail(email);
		if(c == null) {
			return true;
		}
		return false;
	}
	
	public String NameCheck(String name) {
	// Name check
			if(name.equals("")) {
				return "Họ tên phải từ 8-50 ký tự và không chứ ký tự đặc biệt!";
			}
			String regexName = "^[A-Za-z0-9\\p{L}\\s]{8,50}$";
			boolean isValidName = Pattern.matches(regexName, name);
			if(!isValidName) {
				return "Họ tên phải từ 8-50 ký tự và không chứ ký tự đặc biệt!";
			}
			return null;
	}
	
	public String EmailCheck(String email) {
		// Email check
		if(email.equals("")) {
			return "Không được bỏ trống Email!";
		}
		String regexEmail = "^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.(com|net|org|gov|edu|vn|us|uk|au|ca)$";
		Pattern EMAIL_PATTERN = Pattern.compile(regexEmail);
		if(!(EMAIL_PATTERN.matcher(email).matches()) || email.length() > 50) {
			return "Định dạng Email không hợp lệ!";
		}
		return null;
	}
	
	public String PassCheck(String pass) {
		// Pass check
		if(pass.equals("")) {
			return "Mật khẩu phải từ 9-50 ký tự. Có it nhất 1 số , 1 chữ cái viết hoa, 1 ký tự đặc biệt!";
		}
		String regexPass = "^(?=.*[A-Z])(?=.*\\d)(?=.*[@#$%^&+=])(?=.*[a-zA-Z]).{9,50}$";
		boolean isValidPass = Pattern.matches(regexPass, pass);
		if(!isValidPass) {
			return "Mật khẩu phải từ 9-50 ký tự. Có it nhất 1 số , 1 chữ cái viết hoa, 1 ký tự đặc biệt!";
		}	
		return null;
	}

	
	@RequestMapping("/dangxuat")
	public String dangxuat(Model model,HttpServletRequest request, HttpServletResponse response) {
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
	
	@RequestMapping("/oauth2/login/success")
	public String oauthLoginSuccess(OAuth2AuthenticationToken oauth2, Authentication auth) {
		userService.loginFromOAuth2(oauth2);
		
//        // Call API Save in DB
//    	String email = auth.getName();
//        Customer c = customerService.findByEmail(email);
//        c.setCustomerEmail(c.getCustomerEmail());
//        c.setCustomerPassword(c.);
//        c.setCustomerName(oauth2.getPrincipal().getAttribute("name"));
//        customerService.create(c);
		return "redirect:/trangchu";
	}
	
	
//	ni end
}
