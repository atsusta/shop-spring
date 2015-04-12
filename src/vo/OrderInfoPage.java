package vo;

import java.util.List;

public class OrderInfoPage {
	private List<OrderInfo> orderInfoList;
	private List<Product> productList;
	private int requestPage;
	private int startPage;
	private int endPage;
	private int totalPages;
	
	public OrderInfoPage() {
		// TODO Auto-generated constructor stub
	}

	public OrderInfoPage(List<OrderInfo> orderInfoList,
			List<Product> productList, int requestPage, int startPage,
			int endPage, int totalPages) {
		super();
		this.orderInfoList = orderInfoList;
		this.productList = productList;
		this.requestPage = requestPage;
		this.startPage = startPage;
		this.endPage = endPage;
		this.totalPages = totalPages;
	}

	public List<OrderInfo> getOrderInfoList() {
		return orderInfoList;
	}

	public void setOrderInfoList(List<OrderInfo> orderInfoList) {
		this.orderInfoList = orderInfoList;
	}

	public List<Product> getProductList() {
		return productList;
	}

	public void setProductList(List<Product> productList) {
		this.productList = productList;
	}

	public int getRequestPage() {
		return requestPage;
	}

	public void setRequestPage(int requestPage) {
		this.requestPage = requestPage;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public int getTotalPages() {
		return totalPages;
	}

	public void setTotalPages(int totalPages) {
		this.totalPages = totalPages;
	}

	
}
