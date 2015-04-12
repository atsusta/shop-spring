package controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import service.CustomerService;
import service.OrderInfoService;
import service.ProductService;
import vo.CustomerPage;
import vo.OrderInfo;
import vo.Product;

/**
 * 관리자가 사용하는 모든 기능
 * 
 * @author 표길우
 *
 */
@Controller
public class ManagementController {
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
	 * 관리자 기능 접속
	 * admin.do
	 */
	@RequestMapping(value = "/admin.do", method = RequestMethod.GET)
	public ModelAndView getAdminView() {
		ModelAndView modelAndView = new ModelAndView("admin_index");
		return modelAndView;
	}
	
	/**
	 * 손님들 주문 정보 전체 보기
	 * orders.do -> 김, 최
	 */
	@RequestMapping(value = "/orders.do", method = RequestMethod.GET)
	public ModelAndView OrderInfoList() {
		List<OrderInfo> orderInfoList = orderInfoService.getOrderInfoList();
		
		ModelAndView modelAndView = new ModelAndView("admin_index");
		modelAndView.addObject("mainContent", "admin_order_list.jsp");
		modelAndView.addObject("orderInfoList", orderInfoList);
		modelAndView.addObject("menu", "orders");
		
		return modelAndView;
	}
	
	/**
	 * 관리자 회원리스트 전체 보기
	 * customerList.do -> 김, 최
	 */
	@RequestMapping(value = "/customerList.do", method = RequestMethod.GET)
	public ModelAndView getPageView(String page, HttpSession session) {
		int requestPage = 1;
		if ((page != null) && (page.length() > 0)) {
			requestPage = Integer.parseInt(page);
		}
		
		CustomerPage customerPage = customerService.getCustomerPage(requestPage); 
		session.setAttribute("totalCustomer", customerService.selectCustomerCount());

		ModelAndView mv = new ModelAndView("admin_index");
		mv.addObject("mainContent", "customer_list.jsp");
		mv.addObject("customerPage", customerPage);
		mv.addObject("menu", "customerList");
		
		return mv;
	}
	
	
	/**
	 * 손님 한 명 주문 정보 보기
	 * orderDetail.do -> 김, 최
	 */

	/**
	 * 상품 추가 기능 시작
	 * addNewProductForm.do
	 */
	@RequestMapping(value = "/addNewProductForm.do", method = RequestMethod.GET)
	public ModelAndView getAddNewProductForm() {
		
		ModelAndView modelAndView = new ModelAndView("admin_index");
		modelAndView.addObject("mainContent", "admin_new_product.jsp");
		modelAndView.addObject("menu", "addNewProduct");
		
		return modelAndView;
	}
	
	/**
	 * 상품 추가 실행
	 * addNewProduct.do -> 최
	 */
	@RequestMapping(value = "/addNewProduct.do", method = RequestMethod.POST)
	public ModelAndView addNewProduct(Product product) {
		
		ModelAndView modelAndView = new ModelAndView("admin_index");
		if (productService.addProduct(product)) {
			modelAndView.addObject("mainContent", "admin_product_success.jsp");
		} else {
			modelAndView.addObject("mainContent", "admin_product_fail.jsp");
		}
		modelAndView.addObject("menu", "addNewProduct");
		
		return modelAndView;
	}
	
	

}
