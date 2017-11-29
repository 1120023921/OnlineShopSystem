package cn.doublehh.business.service;

import java.util.List;

import com.github.pagehelper.PageInfo;

import cn.doublehh.business.model.Orders;

public interface OrderService {

	int addOrder(Orders orders);
	
	int updateOrder(Orders orders);
	
	String getUidByOrderId(String id);
	
	/**
	 * 所有代发货订单
	 * @return
	 */
	PageInfo<Orders> getAllBackOrders(int pages,int rows);
	
	/**
	 * 获取所有已发货订单
	 * @return
	 */
	PageInfo<Orders> getAllSendOrders(int pages,int rows);
	
	/**
	 * 获取所有已完成订单
	 * @return
	 */
	PageInfo<Orders> getAllCompleteOrders(int pages,int rows);
	
	/**
	 * 根据id获取订单信息
	 * @param id
	 * @return
	 */
	Orders getOrderById(String id);
	
	/**
	 * 获取用户所有订单
	 * @param uid
	 * @return
	 */
	PageInfo<Orders> getAllUserOrders(String uid,int pages,int rows);
	
}
