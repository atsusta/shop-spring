package vo;

import java.util.List;

public class ProductPage {
	private List<Product> productList;
	private int requestPage;
	private int startPage;
	private int endPage;
	private int totalPages;
	
	public ProductPage() {
		// TODO Auto-generated constructor stub
	}

	public ProductPage(List<Product> productList, int requestPage,
			int startPage, int endPage, int totalPages) {
		super();
		this.productList = productList;
		this.requestPage = requestPage;
		this.startPage = startPage;
		this.endPage = endPage;
		this.totalPages = totalPages;
	}

	public List<Product> getProductList() {
		return productList;
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

	public int getTotalPages() {
		return totalPages;
	}

	public void setProductList(List<Product> productList) {
		this.productList = productList;
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

	public void setTotalPages(int totalPages) {
		this.totalPages = totalPages;
	}

	
	
}
