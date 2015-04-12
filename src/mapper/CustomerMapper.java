package mapper;

import java.util.List;
import java.util.Map;

import vo.Customer;

public interface CustomerMapper {
	
	public int insertCustomer(Customer customer) ;
	public int updateCustomer(Customer customer) ;
	public int deleteCustomer(String id) ;
	
	public Customer selectCustomer(String id) ;
	public List<Customer> selectCustomerList() ;
	public int selectCustomerCount();
	public List<Customer> selectCustomerList(Map<String, Integer> map);
	
	public int updateCustomerPW(Map<String, String> map) ;
//	public int pwTempModify(Map<String, String> map) ;
}
