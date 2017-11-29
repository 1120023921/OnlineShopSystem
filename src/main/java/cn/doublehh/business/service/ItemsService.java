package cn.doublehh.business.service;

import java.util.List;

import cn.doublehh.business.model.Items;

public interface ItemsService {

	int addItems(Items items);
	
	int updateItems(Items items);
	
	int deleteItems(String id);
	
	List<Items> getItems(String orderId);
	
	Items getItemsByOrderIdAndGoodsId(String orderId,String goodsId);
}
