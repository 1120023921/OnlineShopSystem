package cn.doublehh.business.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.doublehh.business.dao.ItemsMapper;
import cn.doublehh.business.model.Items;
import cn.doublehh.business.service.ItemsService;

@Service
@Transactional
public class ItemsServiceImpl implements ItemsService {

	@Autowired
	private ItemsMapper itemsMapper;
	
	@Override
	public int addItems(Items items) {

		return itemsMapper.addItems(items);
	}

	@Override
	public int updateItems(Items items) {

		return itemsMapper.updateItems(items);
	}

	@Override
	public int deleteItems(String id) {

		return itemsMapper.deleteItems(id);
	}

	@Override
	public List<Items> getItems(String orderId) {

		return itemsMapper.getItems(orderId);
	}

	@Override
	public Items getItemsByOrderIdAndGoodsId(String orderId, String goodsId) {

		return itemsMapper.getItemsByOrderIdAndGoodsId(orderId, goodsId);
	}

}
