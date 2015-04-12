package repository;

import java.util.List;

import mapper.OrderInfoMapper;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import vo.OrderInfo;

@Component
public class OrderInfoDao {
	private SqlSessionTemplate sqlSessionTemplate;

    @Autowired
    public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
        this.sqlSessionTemplate = sqlSessionTemplate;
    }
    
    public int insertOrderInfo(OrderInfo orderInfo) {
    	OrderInfoMapper mapper = sqlSessionTemplate.getMapper(OrderInfoMapper.class);
    	return mapper.insertOrderInfo(orderInfo);
    }
    
    public int updateOrderInfo(OrderInfo orderInfo) {
    	OrderInfoMapper mapper = sqlSessionTemplate.getMapper(OrderInfoMapper.class);
    	return mapper.updateOrderInfo(orderInfo);
    }
    
    public int deleteOrderInfo(int orderNo) {
    	OrderInfoMapper mapper = sqlSessionTemplate.getMapper(OrderInfoMapper.class);
    	return mapper.deleteOrderInfo(orderNo);
    }
    
    public OrderInfo selectOrderInfo(int orderNo) {
    	OrderInfoMapper mapper = sqlSessionTemplate.getMapper(OrderInfoMapper.class);
    	return mapper.selectOrderInfo(orderNo);
    }
    
    public int selectCustomerOrderInfoCount(String customerId) {
    	OrderInfoMapper mapper = sqlSessionTemplate.getMapper(OrderInfoMapper.class);
    	return mapper.selectCustomerOrderInfoCount(customerId);
    }
    
    
    public OrderInfo selectLastestOrderInfo() {
    	OrderInfoMapper mapper = sqlSessionTemplate.getMapper(OrderInfoMapper.class);
    	return mapper.selectLastestOrderInfo();
    }
    
    public List<OrderInfo> selectOrderInfoList() {
    	OrderInfoMapper mapper = sqlSessionTemplate.getMapper(OrderInfoMapper.class);
    	return mapper.selectOrderInfoList();
    }

    public List<OrderInfo> selectCustomerOrderInfoList(String customerId) {
    	OrderInfoMapper mapper = sqlSessionTemplate.getMapper(OrderInfoMapper.class);
    	return mapper.selectCustomerOrderInfoList(customerId);
    }
    
}
