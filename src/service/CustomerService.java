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
			if (endPage > totalPage) {
				// ������ �������� �� ������ ������ Ŀ�� ���
				startPage = totalPage - 4;
				
				// �� ������ ������ ������ �������� �� ũ�� ����
				endPage = totalPage;
			}
			
			if (startPage < 1) {
				// �ּ� �������� �׻� 1 
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
