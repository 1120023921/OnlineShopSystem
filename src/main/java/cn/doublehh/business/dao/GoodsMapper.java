package cn.doublehh.business.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.doublehh.business.model.Goods;
import tk.mybatis.mapper.common.Mapper;

public interface GoodsMapper extends Mapper<Goods> {
	
	int add(Goods goods);
	
	Goods getGoods(String id);
	
	double getPrice(String id);
	
	/**
	 * 获取所有商品信息
	 * @return
	 */
	List<Goods> getAll();
	
	/**
	 * 更新水果信息
	 * @param goods
	 * @return
	 */
	int updateGoods(Goods goods);
	
	/**
	 * 更新商品图片
	 * @param id
	 * @param pic
	 * @return
	 */
	int updateGoodsPic(@Param("id")String id,@Param("pic")String pic);
	
	/**
	 * 删除商品信息
	 * @param id
	 * @return
	 */
	int deleteGoods(String id);
}