package cn.doublehh.business.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import cn.doublehh.business.model.Items;
import tk.mybatis.mapper.common.Mapper;

public interface ItemsMapper extends Mapper<Items> {
	
	int addItems(Items items);
	
	int updateItems(Items items);
	
	int deleteItems(String id);
	
	List<Items> getItems(String order_id);
	
	Items getItemsByOrderIdAndGoodsId(String order_id,String goods_id);
}