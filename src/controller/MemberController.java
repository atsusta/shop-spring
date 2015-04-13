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
 * ȸ�����μ� ����ϴ� ��� (�����ڴ� ���̵� admin���� ����)
 * 
 * @author ǥ���
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
	 * �α����ϱ�
	 * login.do -> ǥ
	 */
	@RequestMapping(value = "/login.do", method = RequestMethod.POST, produces = { "application/json" })
	public @ResponseBody Customer login(Customer submitCustomer,
			HttpServletRequest request) {
		System.out.println("id: " + submitCustomer.getId() + "\npassword: "
				+ submitCustomer.getPassword());

		Customer customer = customerService.getCustomer(submitCustomer.getId());
		HttpSession session = null;

		// �н����带 Ȯ���Ͽ� DB ����� ��ġ�� ��� session�� ���
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
			System.out.println("���� �����......");

			session.setAttribute("customerId", customer.getId());
			System.out.println("session: " + session.getAttribute("customerId"));
			
			return customer;
		} else {
			System.out.println("password is not valid");
			return null;
		}
	}

	/**
	 * �α� �ƿ��ϱ�
	 * logout.do -> ǥ
	 */
	@RequestMapping(value = "/logout.do", method = RequestMethod.GET)
	public @ResponseBody void logout(HttpServletRequest request) {
		request.getSession().invalidate();
		System.out.println("logout: session invalidated");
	}

	/**
	 * ȸ������ - �������
	 * join.do -> ��, ��
	 */
	@RequestMapping(value = "/join.do")
	public String registYackguan() {

		return "/webapp/views/customer/customer_yackguan";
	}

	/**
	 * ȸ������ ������ ����
	 * registForm.do -> ��, �� 
	 */
	@RequestMapping(value = "/registForm.do", method = RequestMethod.GET)
	public String registForm() {
		return "/webapp/views/customer/register_form";
	}

	/**
	 * ȸ������
	 * regist.do -> ��, �� 
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
	 * ���̵� �ߺ�üũ
	 * idCheckAjax.do -> ��, �� 
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
	 * �α��� �� �������� ����
	 * customerDetail.do -> ��, �� 
	 */
	@RequestMapping(value = "/customerDetail.do", method = RequestMethod.GET)
	public ModelAndView customerInfo(String id, HttpServletRequest request) {
		Customer customer = null;

		if (request.getSession().getAttribute(
				"customerId").equals("admin") && id != null) {
			// �����ڷ� �α����ϰ� ȸ�� �������� ����
			System.out.println("if admin != null && id != null " + 
					"  id --- " + id);
			customer = customerService.read(id);
		} else {
			System.out.println("admin && id = null");	// �Ϲ�ȸ�� �������� ����
			id = (String) request.getSession().getAttribute("customerId");
			customer = customerService.read(id);
		}

		ModelAndView mv = new ModelAndView();
		mv.setViewName("/webapp/views/customer/customer_info");
		mv.addObject("customer", customer);
		
		return mv;
	}
	
	/**
	 * �α��� �� �ڽ��� �ֹ� ���� ����
	 * myOrders.do
	 */
	@RequestMapping(value = "myOrders.do", method = RequestMethod.GET)
	public ModelAndView getMyOrdersView(String page, HttpServletRequest request) {
		int requestPage = 1;
		if ((page != null) && (page.length() > 0)) {
			requestPage = Integer.parseInt(page);
		}
		
		// Ư�� ȸ�� id�� ���� �ֹ� ���� ��� ��������
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
	 * �������� ���������� ����
	 * customerUpdateForm.do -> ��, �� 
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
	 * �������� ����
	 * customerUpdate.do -> ��, �� 
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
	 * ��������-�н����� ���������� ����
	 * customerPwModifyForm.do -> ��, �� 
	 */
	@RequestMapping(value = "/customerPwModifyForm.do", method = RequestMethod.GET)
	public String pwModifyForm(String id, HttpServletRequest request)
			throws Exception {
		
		return "/webapp/views/customer/customer_pw_modify_form";
	}
	
	/**
	 * ��������-�н����� ����
	 * customerPwModify.do -> ��, �� 
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
	 * ȸ�� Ż���Ϸ�����
	 * customerDeleteForm.do -> ��, �� 
	 */
	@RequestMapping(value = "/customerDeleteForm.do")
	public String delUpdateForm(String id, HttpSession session) {

		return "/webapp/views/customer/customer_delete_form";
	}
	/**
	 * ȸ�� Ż��
	 * customerDelete.do -> ��, �� 
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
