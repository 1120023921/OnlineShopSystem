package cn.doublehh.business.service;

import java.util.List;

import com.github.pagehelper.PageInfo;

import cn.doublehh.business.model.Goods;

public interface GoodsService {

	int add(Goods goods);
	
	Goods getGoods(String id);
	
	double getPrice(String id);
	
	List<Goods> getAll();
	
	/**
	 * 更新水果信息
	 * @param goods
	 * @return
	 */
	int updateGoods(Goods goods);
	
	/**
	 * 删除商品信息
	 * @param id
	 * @return
	 */
	int deleteGoods(String id);
	
	/**
	 * 管理员获取所有商品
	 * @return
	 */
	PageInfo<Goods> getAllGoods(int pages,int rows);
	
	/**
	 * 更新商品图片
	 * @param id
	 * @param pic
	 * @return
	 */
	int updateGoodsPic(String id,String pic);
}
