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
 * �ֹ� �� ������ ���� ���
 * @author ǥ���
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
	 * �ֹ��ϱ�
	 * order.do -> ǥ (��, ��)
	 */
	@RequestMapping(value = "/order.do", method = RequestMethod.POST)
	public ModelAndView getOrderSheet(HttpServletRequest request) {
		/**
		 * view�� ���ϴ� ����
		 * 
		 * [�ֹ��� ��ǰ]
		 * ��ǰ �̹���
		 * ��ǰ �̸�
		 * ��ǰ ����
		 * �ֹ� ����
		 * ��ü ����(��ۺ� ����)
		 * ��ǰ ������
		 * 
		 * [�ֹ��� ����]
		 * �� �̸�
		 * �� email
		 * �� phone
		 * 
		 * [����� ����]
		 * ����
		 */
		
		// ��ǰ ���� ��������
		int productNo = Integer.parseInt(request.getParameter("productNo"));
		Product product = productService.getProduct(productNo);
		
		// �� ���� ��������
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
	 * �����ϱ�
	 * payment.do -> ǥ
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
			// ��ȸ�� ������ ���
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
	 * �ֹ� + ���� ��� ����
	 * result.do -> ǥ
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
