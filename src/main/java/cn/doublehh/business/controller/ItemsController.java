package cn.doublehh.business.controller;

import java.util.Date;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.doublehh.business.model.Items;
import cn.doublehh.business.model.Orders;
import cn.doublehh.business.model.vo.OrderVo;
import cn.doublehh.business.service.GoodsService;
import cn.doublehh.business.service.ItemsService;
import cn.doublehh.business.service.OrderService;
import cn.doublehh.business.utils.WebUtils;

/**
 * 购物项操作
 * @author 11200
 *
 */
@Controller
@RequestMapping("/items")
public class ItemsController {

	
	@Autowired
	private GoodsService goodsService;
	
	
	@RequestMapping("/add")
	@ResponseBody
	public int add(String id,HttpSession session){
		
		OrderVo orderVo = (OrderVo) session.getAttribute("orderVo");
		
		if(orderVo==null){
			orderVo = new OrderVo();
			orderVo.setStatus("0");
			orderVo.setTime(new Date());
			orderVo.setId(WebUtils.generateID());
			Map<String, Items> map = new LinkedHashMap<String, Items>();
			orderVo.setMap(map);
			session.setAttribute("orderVo", orderVo);
		}
		
		Items items = orderVo.getMap().get(id);
		
		
		if(items==null){
			items = new Items();
			items.setId(WebUtils.generateID());
			items.setGoods_id(id);
			items.setOrder_id(orderVo.getId());
			items.setGoods_name(goodsService.getGoods(id).getFruit());
			items.setNum(1);
			items.setEachprice(goodsService.getPrice(id));
			items.setPrice(items.getEachprice());
			orderVo.getMap().put(id, items);
		}else {
			items.setNum(items.getNum()+1);
			items.setPrice(items.getNum()*items.getEachprice());
		}
		
		
		return items.getNum();
	}
	
	@RequestMapping("/subtract")
	@ResponseBody
	public int subtract(String id,HttpSession session){
		
		OrderVo orderVo = (OrderVo) session.getAttribute("orderVo");
		
		if(orderVo==null){
			orderVo = new OrderVo();
			orderVo.setId(WebUtils.generateID());
			Map<String, Items> map = new LinkedHashMap<String, Items>();
			orderVo.setMap(map);
			session.setAttribute("orderVo", orderVo);
		}
		
		Items items = orderVo.getMap().get(id);
		
		
		if(items!=null){
			items.setNum(items.getNum()-1);
			if(items.getNum()<=0){
				orderVo.getMap().remove(id);
				return 0;
			}
			items.setPrice(items.getEachprice()*items.getNum());
			return items.getNum();
		}
		return 0;
	}
}
