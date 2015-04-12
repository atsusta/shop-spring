package vo;

import java.util.List;

public class CustomerPage {
	private List<Customer> customerList;
	private int requestPage;
	private int startPage;
	private int endPage;
	private int totalPage;
	
	public CustomerPage() {
		// TODO Auto-generated constructor stub
	}

	public CustomerPage(List<Customer> customerList, int requestPage,
			int startPage, int endPage, int totalPage) {
		super();
		this.customerList = customerList;
		this.requestPage = requestPage;
		this.startPage = startPage;
		this.endPage = endPage;
		this.totalPage = totalPage;
	}

	public List<Customer> getCustomerList() {
		return customerList;
	}

	public int getRequestPage() {
		return requestPage;
	}

	public int getStartPage() {
		return startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setCustomerList(List<Customer> customerList) {
		this.customerList = customerList;
	}

	public void setRequestPage(int requestPage) {
		this.requestPage = requestPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	
}
