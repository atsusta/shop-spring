package controller;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import service.CustomerService;
import service.OrderInfoService;
import service.ProductService;
import vo.Customer;
import vo.OrderInfo;
import vo.Product;

/**
 * 주문 및 결제에 관한 기능
 * @author 표길우
 *
 */
@Controller
public class CheckoutController {
	private ProductService productService;
	private CustomerService customserService;
	private OrderInfoService orderInfoService;
	
	@Autowired
	public void setProductService(ProductService productService) {
		this.productService = productService;
	}

	@Autowired
	public void setCustomserService(CustomerService customserService) {
		this.customserService = customserService;
	}
	
	@Autowired
	public void setOrderInfoService(OrderInfoService orderInfoService) {
		this.orderInfoService = orderInfoService;
	}

	/**
	 * 주문하기
	 * order.do -> 표 (송, 민)
	 */
	@RequestMapping(value = "/order.do", method = RequestMethod.POST)
	public ModelAndView getOrderSheet(HttpServletRequest request) {
		/**
		 * view가 원하는 정보
		 * 
		 * [주문한 상품]
		 * 제품 이미지
		 * 제품 이름
		 * 제품 가격
		 * 주문 수량
		 * 전체 가격(배송비 제외)
		 * 제품 사이즈
		 * 
		 * [주문자 정보]
		 * 고객 이름
		 * 고객 email
		 * 고객 phone
		 * 
		 * [배송지 정보]
		 * ㄴㄴ
		 */
		
		// 제품 정보 가져오기
		int productNo = Integer.parseInt(request.getParameter("productNo"));
		Product product = productService.getProduct(productNo);
		
		// 고객 정보 가져오기
		String customerId = (String) request.getSession().getAttribute("customerId");
		Customer customer = customserService.getCustomer(customerId);
		
		// container view name
		ModelAndView modelAndView = new ModelAndView("/webapp/views/product/product");
		
		// testing
		System.out.println("customer is ordering the product!");
		System.out.println("productNo: " + productNo);
		System.out.println("customerId: " + customerId);
		System.out.println("orderQuantity: " + (String) request.getParameter("orderQuantity"));
		System.out.println("productSize: " + (String) request.getParameter("productSize"));
		
		// add object to view
		modelAndView.addObject("product", product);
		modelAndView.addObject("orderQuantity", request.getParameter("orderQuantity"));
		modelAndView.addObject("productSize", request.getParameter("productSize"));
		
		if (customerId != null) {
			// when user is logged in
			System.out.println("user is logged in...");
			modelAndView.addObject("customerName", customer.getName());
			modelAndView.addObject("customerEmail", customer.getEmail());
			modelAndView.addObject("customerPhone", customer.getPhone());
		}
		
		// content view name
		modelAndView.addObject("mainContent", "/webapp/views/checkout/order.jsp");
		
		return modelAndView;
	}
	
	/**
	 * 결제하기
	 * payment.do -> 표
	 */
	@RequestMapping(value = "/payment.do", method = RequestMethod.POST)
	public ModelAndView getPaymentSheet(HttpServletRequest request) {
		
		// get order informations from request 
		int orderQuantity = Integer.parseInt(request.getParameter("orderQuantity"));
		String customerId = (String) request.getSession().getAttribute("customerId");
		int productNo = Integer.parseInt(request.getParameter("productNo"));
		Product product = productService.getProduct(productNo);
		String productSize = request.getParameter("productSize");
		String paymentType = request.getParameter("paymentType");
		boolean paymentCheck = false;
		String shippingMessage = request.getParameter("shippingMessage");
		
		int subtotal = Integer.parseInt(request.getParameter("subtotalInput"));
		int shippingPrice = 0;
		if (subtotal < 50000 ) {
			shippingPrice = 2500;
		}
		
		if (customerId == null) {
			// 비회원 구매일 경우
			customerId = request.getParameter("phoneNumber");
		}
		
		// add order informations to DB
		OrderInfo orderInfo = new OrderInfo();
		orderInfo.setOrderDate(new Date());
		orderInfo.setOrderQuantity(orderQuantity);
		orderInfo.setCustomerId(customerId);
		
		if (product != null) {
			orderInfo.setProductNo(product.getNo());
		} else {
			orderInfo.setProductNo(productNo);
		}
		
		orderInfo.setProductSize(productSize);
		orderInfo.setPaymentType(paymentType);
		orderInfo.setPaymentCheck(paymentCheck);
		orderInfo.setShippingMessage(shippingMessage);
		orderInfo.setShippingStatus("no shipping");
		
		orderInfoService.addOrderInfo(orderInfo);
		
		// container view name
		ModelAndView modelAndView = new ModelAndView("/webapp/views/product/product");
		modelAndView.addObject("subtotal", subtotal);
		modelAndView.addObject("shippingPrice", shippingPrice);
		
		// content view name
		modelAndView.addObject("mainContent", "/webapp/views/checkout/payment.jsp");
		
		return modelAndView;
	}
	
	
	/**
	 * 주문 + 결제 결과 보기
	 * result.do -> 표
	 */
	@RequestMapping(value = "/result.do", method = RequestMethod.POST)
	public ModelAndView getResult(HttpServletRequest request) {
		
		// treat card information
		
		// container view name
		ModelAndView modelAndView = new ModelAndView("/webapp/views/product/product");
		
		// content view name
		modelAndView.addObject("mainContent", "/webapp/views/checkout/payment_success.jsp");
		
		return modelAndView;
	}
	
	
}
