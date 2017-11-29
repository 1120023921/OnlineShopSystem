package cn.doublehh.business.dao;

import java.util.List;

import cn.doublehh.business.model.Orders;
import tk.mybatis.mapper.common.Mapper;

public interface OrdersMapper extends Mapper<Orders> {
	
	int addOrder(Orders orders);
	
	int updateOrder(Orders orders);
	
	/**
	 * 获取所有代发货订单
	 * @return
	 */
	List<Orders> getAllBackOrders();
	
	/**
	 * 获取所有已发货订单
	 * @return
	 */
	List<Orders> getAllSendOrders();
	
	/**
	 * 获取所有已完成订单
	 * @return
	 */
	List<Orders> getAllCompleteOrders();
	
	/**
	 * 获取用户所有订单
	 * @param uid
	 * @return
	 */
	List<Orders> getAllUserOrders(String uid);
	
	String getUidByOrderId(String id);
	
	Orders getOrderById(String id);
}