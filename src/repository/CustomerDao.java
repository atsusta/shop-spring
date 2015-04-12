package repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import mapper.CustomerMapper;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import vo.Customer;

@Component
public class CustomerDao {
	private SqlSessionTemplate sqlSessionTemplate;

	@Autowired
	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
	
	// !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! //
	
	public int insert(Customer customer) {
		CustomerMapper mapper = sqlSessionTemplate.getMapper(CustomerMapper.class);
		
		return mapper.insertCustomer(customer);
	}
	
	public int update(Customer customer){
		CustomerMapper mapper = sqlSessionTemplate.getMapper(CustomerMapper.class);
		return mapper.updateCustomer(customer);
	}
	public int updatePW(String id, String modifyPassword) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("modifyPassword", modifyPassword);
		
		CustomerMapper mapper = sqlSessionTemplate.getMapper(CustomerMapper.class);
		return mapper.updateCustomerPW(map);
		
	}
	public int delete(String id) {
		CustomerMapper mapper = sqlSessionTemplate.getMapper(CustomerMapper.class);
		return mapper.deleteCustomer(id);
	}
	public Customer selectCustomer(String id) {
		CustomerMapper mapper = sqlSessionTemplate.getMapper(CustomerMapper.class);
		return mapper.selectCustomer(id);
	}
	
	public int selectCustomerCount() {
		CustomerMapper mapper = sqlSessionTemplate.getMapper(CustomerMapper.class);
		return mapper.selectCustomerCount();
	}
	
//	public int selectTotalCount() throws Exception {
//		CustomerMapper mapper = sqlSessionTemplate.getMapper(CustomerMapper.class);
//		return mapper.selectArticleTotalCount();
//	}
	
	public List<Customer> selectCustomerList(int firstRow, int rowCount) {
		CustomerMapper mapper = sqlSessionTemplate.getMapper(CustomerMapper.class);
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("firstRow", firstRow);
		map.put("rowCount", rowCount);
		
		return mapper.selectCustomerList(map);
	}
	
}
