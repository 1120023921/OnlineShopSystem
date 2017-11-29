package cn.doublehh.business.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;

import cn.doublehh.business.model.Goods;
import cn.doublehh.business.service.GoodsService;

/**
 * 商品信息
 * @author 11200
 *
 */
@Controller
@RequestMapping("/goods")
public class GoodsController {

	@Autowired
	private GoodsService goodsService;
	
	/**
	 * 用户获取所有商品
	 * @return
	 */
	@RequestMapping("/getAll")
	@ResponseBody
	public List<Goods> getAll(){
		
		return goodsService.getAll();
	}
	
	/**
	 * 管理员获取所有商品信息
	 * @param pages
	 * @param rows
	 * @return
	 */
	@RequestMapping("/getAllGoods")
	@ResponseBody
	public PageInfo<Goods> getAllGoods(int pages,int rows){
		
		return goodsService.getAllGoods(pages, rows);
	}
	
	/**
	 * 根据id获取商品
	 * @param id
	 * @return
	 */
	@RequestMapping("/getGoodsById")
	@ResponseBody
	public Goods getGoodsById(String id){
		
		return goodsService.getGoods(id);
	}
	
	/**
	 * 修改商品信息
	 * @param goods
	 * @return
	 */
	@RequestMapping("/updateGoods")
	@ResponseBody
	public int updateGoods(Goods goods){
		
		return goodsService.updateGoods(goods);
	}
	
	/**
	 * 删除商品信息
	 * @param id
	 * @return
	 */
	@RequestMapping("/deleteGoods")
	public String deleteGoods(String id){
		
		if(goodsService.deleteGoods(id)>0){
			return "admin/goodsUploadSuccess";
		}else {
			return "admin/goodsUploadFail";
		}
	}
	
	/**
	 * 新增商品
	 * @param goods
	 * @return
	 */
	@RequestMapping("/addGoods")
	@ResponseBody
	public int addGoods(Goods goods){
		
		return goodsService.add(goods);
	}
}
