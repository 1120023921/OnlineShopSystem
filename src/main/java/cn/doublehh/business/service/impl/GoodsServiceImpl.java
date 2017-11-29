package cn.doublehh.business.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import cn.doublehh.business.dao.GoodsMapper;
import cn.doublehh.business.model.Goods;
import cn.doublehh.business.service.GoodsService;
import cn.doublehh.business.utils.WebUtils;

@Service
@Transactional
public class GoodsServiceImpl implements GoodsService {

	@Autowired
	private GoodsMapper goodsMapper;
	
	@Override
	public int add(Goods goods) {

		goods.setId(WebUtils.generateID());
		return goodsMapper.add(goods);
	}

	@Override
	public Goods getGoods(String id) {

		return goodsMapper.getGoods(id);
	}

	@Override
	public double getPrice(String id) {

		return goodsMapper.getPrice(id);
	}

	@Override
	public List<Goods> getAll() {

		return goodsMapper.getAll();
	}

	@Override
	public int updateGoods(Goods goods) {

		return goodsMapper.updateGoods(goods);
	}

	@Override
	public int deleteGoods(String id) {

		return goodsMapper.deleteGoods(id);
	}

	@Override
	public PageInfo<Goods> getAllGoods(int pages,int rows) {

		PageHelper.startPage(pages, rows);
		List<Goods> list = goodsMapper.getAll();
		return new PageInfo<Goods>(list);
	}

	@Override
	public int updateGoodsPic(String id, String pic) {

		return goodsMapper.updateGoodsPic(id, pic);
	}

}
