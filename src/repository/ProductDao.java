package repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import mapper.ProductMapper;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import vo.Product;

@Component
public class ProductDao {
	private SqlSessionTemplate sqlSessionTemplate;

	@Autowired
	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
	
	public int insertProduct(Product product) {
		ProductMapper mapper = sqlSessionTemplate.getMapper(ProductMapper.class);
		return mapper.insertProduct(product);
	}
	
	public int deleteProduct(int no) {
		ProductMapper mapper = sqlSessionTemplate.getMapper(ProductMapper.class);
		return mapper.deleteProduct(no);
	}
	
	public Product selectProduct(int no) {
		ProductMapper mapper = sqlSessionTemplate.getMapper(ProductMapper.class);
		return mapper.selectProduct(no);
	}
	
	public int selectProductCount() {
		ProductMapper mapper = sqlSessionTemplate.getMapper(ProductMapper.class);
		return mapper.selectProductCount();
	}
	
	public int selectCategoryProductCount(String category) {
		ProductMapper mapper = sqlSessionTemplate.getMapper(ProductMapper.class);
		return mapper.selectCategoryProductCount(category);
	}
	
	public List<Product> selectProductList(int firstRow, int rowCount) {
		ProductMapper mapper = sqlSessionTemplate.getMapper(ProductMapper.class);
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("firstRow", firstRow);
		map.put("rowCount", rowCount);
		
		return mapper.selectProductList(map);
	}
	
	public List<Product> selectCategoryProductList(int firstRow, int rowCount, String category) {
		ProductMapper mapper = sqlSessionTemplate.getMapper(ProductMapper.class);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("firstRow", firstRow);
		map.put("rowCount", rowCount);
		map.put("category", category);
		
		return mapper.selectCategoryProductList(map);
	}
	
}
