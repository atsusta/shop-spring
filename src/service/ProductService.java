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
			 * firstRow : DB���� offset�� �ش�, 0���� ���� rowCount : DB���� row�� ����
			 */
			int firstRow = (requestPage - 1) * PRODUCTS_PER_PAGE;
			int rowCount = PRODUCTS_PER_PAGE;

			List<Product> productList = null;

			/**
			 * �۵��� : navi���� 'all'��ư ������ �� ��� ��ǰ ��ȸ. if���ǹ� ���� - category���� null
			 * �Ǵ� all�� ��.
			 */
			if (category == null || category.equals("all")) {
				// category�� all�� ��
				productList = productDao.selectProductList(firstRow, rowCount);
			} else {
				// category�� all�� �ƴ� ��
				productList = productDao.selectCategoryProductList(firstRow,
						rowCount, category);
			}

			int totalPages = selectedProducts / PRODUCTS_PER_PAGE;
			if (selectedProducts % PRODUCTS_PER_PAGE != 0) {
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
			
			System.out.println("totalProducts: " + selectedProducts);
			System.out.println("totalPages: " + totalPages);
			System.out.println("requestPage: " + requestPage);
			
			return new ProductPage(productList, requestPage, startPage,
					endPage, totalPages);

		}

	}

}
