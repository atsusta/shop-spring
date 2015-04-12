package mapper;

import java.util.List;

import vo.OrderInfo;

public interface OrderInfoMapper {
	public int insertOrderInfo(OrderInfo orderInfo);
	public int updateOrderInfo(OrderInfo orderInfo);
	public int deleteOrderInfo(int orderNo);
	public OrderInfo selectOrderInfo(int orderNo);
	public int selectCustomerOrderInfoCount(String customerId);
	public OrderInfo selectLastestOrderInfo();
	public List<OrderInfo> selectOrderInfoList();
	public List<OrderInfo> selectCustomerOrderInfoList(String customerId);
}
