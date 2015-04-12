package mapper;

import java.util.List;
import java.util.Map;

import vo.Product;

/**
 * when: 15.04.04
 * what: List<Product> selectCategoryProductList(int firstRow, int count, String category) 
 * -> List<Product> selectCategoryProductList(Map<String, Integer> map)
 * String category�� ��� �Ұ� -> int category�� �ϱ�
 * who: ǥ���
 * 
 * @param firstRow
 * @param count
 * @param category
 * @return
 */
public interface ProductMapper {
	public int insertProduct(Product product);
	public int deleteProduct(int no);
	public Product selectProduct(int no);
	public int selectProductCount();
	public int selectCategoryProductCount(String category);
	public List<Product> selectProductList(Map<String, Integer> map);
	public List<Product> selectCategoryProductList(Map<String, Object> map);
	
}
