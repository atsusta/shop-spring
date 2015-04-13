package controller;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import service.CustomerService;
import service.OrderInfoService;
import service.ProductService;
import vo.Customer;
import vo.CustomerPage;
import vo.OrderInfo;
import vo.OrderInfoPage;

/**
 * 회원으로서 사용하는 기능 (관리자는 아이디 admin으로 고정)
 * 
 * @author 표길우
 *
 */
@Controller
public class MemberController {
	private CustomerService customerService;
	private ProductService productService;
	private OrderInfoService orderInfoService;

	@Autowired
	public void setCustomerService(CustomerService customerService) {
		this.customerService = customerService;
	}
	
	@Autowired
	public void setProductService(ProductService productService) {
		this.productService = productService;
	}

	@Autowired
	public void setOrderInfoService(OrderInfoService orderInfoService) {
		this.orderInfoService = orderInfoService;
	}

	/**
	 * 로그인하기
	 * login.do -> 표
	 */
	@RequestMapping(value = "/login.do", method = RequestMethod.POST, produces = { "application/json" })
	public @ResponseBody Customer login(Customer submitCustomer,
			HttpServletRequest request) {
		System.out.println("id: " + submitCustomer.getId() + "\npassword: "
				+ submitCustomer.getPassword());

		Customer customer = customerService.getCustomer(submitCustomer.getId());
		HttpSession session = null;

		// 패스워드를 확인하여 DB 내용과 일치할 경우 session에 기록
		if (customer != null
				&& submitCustomer.getPassword().equals(customer.getPassword())) {
			System.out.println("customer logged in!\n" + "id: "
					+ customer.getId() + "\n" + "password: "
					+ customer.getPassword() + "\n" + "name: "
					+ customer.getName() + "\n" + "email: "
					+ customer.getEmail() + "\n" + "phone: "
					+ customer.getPhone() + "\n" + "address: "
					+ customer.getAddress() + "\n");

			session = request.getSession();
			System.out.println("세션 기록중......");

			session.setAttribute("customerId", customer.getId());
			System.out.println("session: " + session.getAttribute("customerId"));
			
			return customer;
		} else {
			System.out.println("password is not valid");
			return null;
		}
	}

	/**
	 * 로그 아웃하기
	 * logout.do -> 표
	 */
	@RequestMapping(value = "/logout.do", method = RequestMethod.GET)
	public @ResponseBody void logout(HttpServletRequest request) {
		request.getSession().invalidate();
		System.out.println("logout: session invalidated");
	}

	/**
	 * 회원가입 - 약관동의
	 * join.do -> 김, 최
	 */
	@RequestMapping(value = "/join.do")
	public String registYackguan() {

		return "/webapp/views/customer/customer_yackguan";
	}

	/**
	 * 회원가입 페이지 가기
	 * registForm.do -> 김, 최 
	 */
	@RequestMapping(value = "/registForm.do", method = RequestMethod.GET)
	public String registForm() {
		return "/webapp/views/customer/register_form";
	}

	/**
	 * 회원가입
	 * regist.do -> 김, 최 
	 */
	@RequestMapping(value = "/regist.do", method = RequestMethod.POST)
	public ModelAndView regist(String id, String password, String name,
			String email, String phone, String addr1, String addr2,
			HttpSession session) {
		Customer customer = new Customer();
		customer.setId(id);
		customer.setPassword(password);
		customer.setName(name);
		customer.setEmail(email);
		customer.setPhone(phone);
		customer.setAddress(addr1 + " " + addr2);

		ModelAndView mv = new ModelAndView();

		int result = customerService.write(customer);
		System.out.println("result---" + result);

		if (result > 0) {
			mv.addObject("customer", customer);
			session.setAttribute("customerId", customer.getId());
		}
		
		mv.setViewName("/webapp/views/customer/register_result");
		return mv;
	}

	/**
	 * 아이디 중복체크
	 * idCheckAjax.do -> 김, 최 
	 */
	@RequestMapping(value = "/idCheckAjax.do", method = RequestMethod.GET)
	@ResponseBody
	public void idCheck(HttpServletRequest request,
			HttpServletResponse response, String check_id) throws Exception {

		PrintWriter writer = response.getWriter();

		String customerId = check_id;
		String checkedId = customerService.checkId(customerId);

		writer.write(checkedId);
	}
	
	/**
	 * 로그인 후 개인정보 보기
	 * customerDetail.do -> 김, 최 
	 */
	@RequestMapping(value = "/customerDetail.do", method = RequestMethod.GET)
	public ModelAndView customerInfo(String id, HttpServletRequest request) {
		Customer customer = null;

		if (request.getSession().getAttribute(
				"customerId").equals("admin") && id != null) {
			// 관리자로 로그인하고 회원 개인정보 열람
			System.out.println("if admin != null && id != null " + 
					"  id --- " + id);
			customer = customerService.read(id);
		} else {
			System.out.println("admin && id = null");	// 일반회원 개인정보 열람
			id = (String) request.getSession().getAttribute("customerId");
			customer = customerService.read(id);
		}

		ModelAndView mv = new ModelAndView();
		mv.setViewName("/webapp/views/customer/customer_info");
		mv.addObject("customer", customer);
		
		return mv;
	}
	
	/**
	 * 로그인 후 자신의 주문 정보 보기
	 * myOrders.do
	 */
	@RequestMapping(value = "myOrders.do", method = RequestMethod.GET)
	public ModelAndView getMyOrdersView(String page, HttpServletRequest request) {
		int requestPage = 1;
		if ((page != null) && (page.length() > 0)) {
			requestPage = Integer.parseInt(page);
		}
		
		// 특정 회원 id에 따른 주문 정보 목록 가져오기
		String customerId = (String) request.getSession().getAttribute(
				"customerId");
		OrderInfoPage customerOrderInfoPage = orderInfoService.
				getCustomerOrderInfoPage(requestPage, customerId);
		
		// container view name
		ModelAndView modelAndView = new ModelAndView("/webapp/views/product/product");
		
		// content view name
		modelAndView.addObject("mainContent", "/webapp/views/customer/my_orders.jsp");
		modelAndView.addObject("category", "myOrders");
		modelAndView.addObject("customerOrderInfoPage", customerOrderInfoPage);
		
		return modelAndView;
	}
	
	/**
	 * 개인정보 변경페이지 가기
	 * customerUpdateForm.do -> 김, 최 
	 */
	@RequestMapping(value = "/customerUpdateForm.do", method = RequestMethod.GET)
	public ModelAndView updateForm(String id, HttpServletRequest request) {
		Customer customer = customerService.read(id);

		ModelAndView mv = new ModelAndView();
		mv.setViewName("/webapp/views/customer/customer_update_form");
		mv.addObject("customer", customer);
		return mv;
	}
	
	/**
	 * 개인정보 변경
	 * customerUpdate.do -> 김, 최 
	 */
	@RequestMapping(value = "/customerUpdate.do", method = RequestMethod.POST)
	public String Update(Customer customer, HttpServletRequest request) {

		int result = customerService.modify(customer);

		if (result > 0) {
			request.setAttribute("id", customer.getId());
		}
		
		return "/webapp/views/customer/customer_update_result";
	}
	
	/**
	 * 개인정보-패스워드 변경페이지 가기
	 * customerPwModifyForm.do -> 김, 최 
	 */
	@RequestMapping(value = "/customerPwModifyForm.do", method = RequestMethod.GET)
	public String pwModifyForm(String id, HttpServletRequest request)
			throws Exception {
		
		return "/webapp/views/customer/customer_pw_modify_form";
	}
	
	/**
	 * 개인정보-패스워드 변경
	 * customerPwModify.do -> 김, 최 
	 */
	@RequestMapping(value = "/customerPwModify.do", method = RequestMethod.POST)
	public String pwModify(String id, String comparePassword,
			String modifyPassword, HttpSession session) {

		String inputedPassword = customerService.read(id).getPassword();

		if (comparePassword.equals(inputedPassword)) {
			customerService.setPwModify(id, modifyPassword);
		}
		
		return "/webapp/views/customer/customer_pw_modify_result";
	}
	/**
	 * 회원 탈퇴하러가기
	 * customerDeleteForm.do -> 김, 최 
	 */
	@RequestMapping(value = "/customerDeleteForm.do")
	public String delUpdateForm(String id, HttpSession session) {

		return "/webapp/views/customer/customer_delete_form";
	}
	/**
	 * 회원 탈퇴
	 * customerDelete.do -> 김, 최 
	 */
	@RequestMapping(value = "/customerDelete.do", method = RequestMethod.POST)
	public String delUpdate(String id, String withdrawPassword,
			HttpSession session, HttpServletRequest request) {
		
		String sessionId = (String) session.getAttribute("customerId");
		String inputedPassword = customerService.read(sessionId).getPassword();
		if (inputedPassword.equals(withdrawPassword)) {
			int result = customerService.delUpdate(sessionId);
			session.invalidate();

			request.setAttribute("result", result);
			request.setAttribute("id", sessionId);
		}
		
		return "/webapp/views/customer/customer_delete_result";
	}
	
}
