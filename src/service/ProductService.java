package service;

import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import repository.ProductDao;
import vo.Product;
import vo.ProductPage;

@Component
public class ProductService {
	private ProductDao productDao;
	private final static int PRODUCTS_PER_PAGE = 12;

	@Autowired
	public void setProductDao(ProductDao productDao) {
		this.productDao = productDao;
	}

	public boolean addProduct(Product product) {
		if (productDao.insertProduct(product) > 0) {
			return true;
		} else {
			return false;
		}
	}

	public boolean removeProduct(int no) {
		if (productDao.deleteProduct(no) > 0) {
			return true;
		} else {
			return false;
		}
	}

	public Product getProduct(int no) {
		return productDao.selectProduct(no);
	}

	public int getProductCount() {
		return productDao.selectProductCount();
	}

	public int getCategoryProductCount(String category) {
		return productDao.selectCategoryProductCount(category);
	}

	public ProductPage getProductPage(int requestPage, String category) {
		int selectedProducts = 0;
		
		System.out.println("category: " + category);
		
		if ((category == null) || (category.equals("all"))) {
			selectedProducts = productDao.selectProductCount();
		} else {
			selectedProducts = productDao.selectCategoryProductCount(category);
		}
			
		if (selectedProducts == 0) {
			return new ProductPage(Collections.<Product> emptyList(), 0, 0, 0,
					0);
		} else {
			/**
			 * firstRow : DB에서 offset에 해당, 0부터 시작 rowCount : DB에서 row의 개수
			 */
			int firstRow = (requestPage - 1) * PRODUCTS_PER_PAGE;
			int rowCount = PRODUCTS_PER_PAGE;

			List<Product> productList = null;

			/**
			 * 송동휘 : navi에서 'all'버튼 눌렀을 때 모든 물품 조회. if조건문 수정 - category값이 null
			 * 또는 all일 때.
			 */
			if (category == null || category.equals("all")) {
				// category가 all일 때
				productList = productDao.selectProductList(firstRow, rowCount);
			} else {
				// category가 all이 아닐 때
				productList = productDao.selectCategoryProductList(firstRow,
						rowCount, category);
			}

			int totalPages = selectedProducts / PRODUCTS_PER_PAGE;
			if (selectedProducts % PRODUCTS_PER_PAGE != 0) {
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
			
			System.out.println("totalProducts: " + selectedProducts);
			System.out.println("totalPages: " + totalPages);
			System.out.println("requestPage: " + requestPage);
			
			return new ProductPage(productList, requestPage, startPage,
					endPage, totalPages);

		}

	}

}
