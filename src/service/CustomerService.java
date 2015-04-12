package service;

import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import repository.CustomerDao;
import vo.Customer;
import vo.CustomerPage;

@Component
public class CustomerService {
	private CustomerDao customerDao;
	private static final int CUSTOMER_COUNT_PER_PAGE = 5;
	
	@Autowired
	public void setCustomerDao(CustomerDao customerDao) {
		this.customerDao = customerDao;
	}

	// !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! //

	public Customer getCustomer(String id) {
		// TODO Auto-generated method stub
		return customerDao.selectCustomer(id);
	}

	public int write(Customer customer) {
		int result = customerDao.insert(customer);

		return result;
	}

	public Customer read(String id) {
		Customer customer = null;
		customer = customerDao.selectCustomer(id);

		return customer;
	}

	public String checkId(String id) {
		Customer customer = null;

		customer = customerDao.selectCustomer(id);

		if (customer == null) {
			return "id_ok";
		} else {
			return "id_duplication";
		}
	}

	public int modify(Customer customer) {
		int updateResult = customerDao.update(customer);

		return updateResult;
	}

	public int setPwModify(String id, String modifyPassword) {
		System.out.println("service modifyPassword ---" + modifyPassword);
		return customerDao.updatePW(id, modifyPassword);
	}

	public int delUpdate(String id) {
		return customerDao.delete(id);

	}

	public CustomerPage getCustomerPage(int requestPage) {
		int customerTotalCount = customerDao.selectCustomerCount();
		if (customerTotalCount == 0) {
			return new CustomerPage(Collections.<Customer> emptyList(), 0, 0,
					0, 0);
		} else {

			int startRow = (requestPage - 1) * CUSTOMER_COUNT_PER_PAGE;
			int rowCount = CUSTOMER_COUNT_PER_PAGE;

			List<Customer> customerList = customerDao.selectCustomerList(
					startRow, rowCount);
			
			int totalPage = customerTotalCount / CUSTOMER_COUNT_PER_PAGE;
			if (customerTotalCount % CUSTOMER_COUNT_PER_PAGE > 0) {
				totalPage++;
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
			if (endPage > totalPage) {
				// 마지막 페이지가 총 페이지 수보다 커진 경우
				startPage = totalPage - 4;
				
				// 총 페이지 수보다 마지막 페이지가 더 크면 에러
				endPage = totalPage;
			}
			
			if (startPage < 1) {
				// 최소 페이지는 항상 1 
				startPage = 1;
			}
			
			return new CustomerPage(customerList, requestPage, startPage,
					endPage, totalPage);
		}
	}

	public int selectCustomerCount() {
		int customerTotalCount = customerDao.selectCustomerCount();
		return customerTotalCount;
	}

}
