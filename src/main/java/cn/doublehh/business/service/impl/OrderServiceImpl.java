package cn.doublehh.business.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import cn.doublehh.business.dao.OrdersMapper;
import cn.doublehh.business.model.Orders;
import cn.doublehh.business.service.OrderService;

@Service
@Transactional
public class OrderServiceImpl implements OrderService {

	@Autowired
	private OrdersMapper ordersMapper;
	
	@Override
	public int addOrder(Orders orders) {

		return ordersMapper.addOrder(orders);
	}

	@Override
	public int updateOrder(Orders orders) {

		return ordersMapper.updateOrder(orders);
	}

	@Override
	public PageInfo<Orders> getAllBackOrders(int pages,int rows) {

		PageHelper.startPage(pages, rows);
		List<Orders> list = ordersMapper.getAllBackOrders();
		return new PageInfo<Orders>(list);
	}

	@Override
	public String getUidByOrderId(String id) {

		return ordersMapper.getUidByOrderId(id);
	}

	@Override
	public Orders getOrderById(String id) {

		return ordersMapper.getOrderById(id);
	}

	@Override
	public PageInfo<Orders> getAllSendOrders(int pages,int rows) {
		
		PageHelper.startPage(pages, rows);
		List<Orders> list = ordersMapper.getAllSendOrders();
		return new PageInfo<Orders>(list);
	}

	@Override
	public PageInfo<Orders> getAllCompleteOrders(int pages,int rows) {
		
		PageHelper.startPage(pages, rows);
		List<Orders> list = ordersMapper.getAllCompleteOrders();
		return new PageInfo<Orders>(list);
	}

	@Override
	public PageInfo<Orders> getAllUserOrders(String uid,int pages,int rows) {

		PageHelper.startPage(pages, rows);
		List<Orders> list = ordersMapper.getAllUserOrders(uid);
		return new PageInfo<Orders>(list);
	}

}
