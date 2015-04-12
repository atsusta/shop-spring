package service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import repository.OrderInfoDao;
import repository.ProductDao;
import vo.OrderInfo;
import vo.OrderInfoPage;
import vo.Product;

@Component
public class OrderInfoService {
	private OrderInfoDao orderInfoDao;
	private ProductDao productDao;
	private final static int ORDER_INFOS_PER_PAGE = 5;

	@Autowired
	public void setOrderInfoDao(OrderInfoDao orderInfoDao) {
		this.orderInfoDao = orderInfoDao;
	}
	
	@Autowired
	public void setProductDao(ProductDao productDao) {
		this.productDao = productDao;
	}

	public boolean addOrderInfo(OrderInfo orderInfo) {
		if (orderInfoDao.insertOrderInfo(orderInfo) > 0) {
			return true;
		} else {
			return false;
		}
	}
	
	public boolean modifyOrderInfo(OrderInfo orderInfo) {
		if (orderInfoDao.updateOrderInfo(orderInfo) > 0 ) {
			return true;
		} else {
			return false;
		}
	}
	
	public boolean removeOrderInfo(int orderNo) {
		if (orderInfoDao.deleteOrderInfo(orderNo) > 0) {
			return true;
		} else {
			return false;
		}
	}
	
	public OrderInfo getOrderInfo(int orderNo) {
		return orderInfoDao.selectOrderInfo(orderNo);
	}
	
	
	public OrderInfo getLastestOrderInfo() {
		return orderInfoDao.selectLastestOrderInfo();
	}
	
	public List<OrderInfo> getOrderInfoList() {
		return orderInfoDao.selectOrderInfoList();
	}
	
	public OrderInfoPage getCustomerOrderInfoPage(int requestPage, 
			String customerId) {
		int selectedOrderInfos = orderInfoDao.selectCustomerOrderInfoCount(
				customerId);
		
		
		if (selectedOrderInfos == 0) {
			return new OrderInfoPage(Collections.<OrderInfo> emptyList(), 
					Collections.<Product> emptyList(), 0, 0, 0, 0);
		} else {
			// order information list for customer
			List<OrderInfo> customerOrderInfoList = 
				orderInfoDao.selectCustomerOrderInfoList(customerId);
			
			// product list for order informations
			List<Product> orderedProductList = new ArrayList<Product>();
			for (OrderInfo anOrderInfo : customerOrderInfoList) {
				orderedProductList.add(productDao.selectProduct(
						anOrderInfo.getProductNo()));
			}
			
			int totalPages = selectedOrderInfos / ORDER_INFOS_PER_PAGE;
			if (selectedOrderInfos % ORDER_INFOS_PER_PAGE != 0) {
				totalPages++;
			}
			
			/**
			 *  가정 : 
			 *  이동 가능한 페이지는 현재 화면에서 총 다섯 개
			 */
			// 첫 페이지는 현재 페이지에서 앞으로 2만큼
			int startPage = requestPage - 2;
			if (startPage < 1) {
				// 최소 페이지는 항상 1 
				startPage = 1;
			}
			
			// 마지막 페이지는 처음 페이지에서 뒤로 4만큼
			int endPage = startPage + 4;
			if (endPage > totalPages) {
				// 마지막 페이지가 총 페이지 수보다 커진 경우
				startPage = totalPages - 4;
				// 총 페이지 수보다 마지막 페이지가 더 크면 에러
				endPage = totalPages;
			}

			if (startPage < 1) {
				// 최소 페이지는 항상 1 
				startPage = 1;
			}
			
			return new OrderInfoPage(customerOrderInfoList, orderedProductList, 
					requestPage, startPage, endPage, totalPages);
		}
	}
	
}
