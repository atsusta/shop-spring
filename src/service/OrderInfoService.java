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
			 *  ���� : 
			 *  �̵� ������ �������� ���� ȭ�鿡�� �� �ټ� ��
			 */
			// ù �������� ���� ���������� ������ 2��ŭ
			int startPage = requestPage - 2;
			if (startPage < 1) {
				// �ּ� �������� �׻� 1 
				startPage = 1;
			}
			
			// ������ �������� ó�� ���������� �ڷ� 4��ŭ
			int endPage = startPage + 4;
			if (endPage > totalPages) {
				// ������ �������� �� ������ ������ Ŀ�� ���
				startPage = totalPages - 4;
				// �� ������ ������ ������ �������� �� ũ�� ����
				endPage = totalPages;
			}

			if (startPage < 1) {
				// �ּ� �������� �׻� 1 
				startPage = 1;
			}
			
			return new OrderInfoPage(customerOrderInfoList, orderedProductList, 
					requestPage, startPage, endPage, totalPages);
		}
	}
	
}
