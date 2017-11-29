package cn.doublehh.business.model.vo;

import java.util.Map;

import cn.doublehh.business.model.Items;
import cn.doublehh.business.model.Orders;

public class OrderVo extends Orders{

	private static final long serialVersionUID = 1L;
	
	private Map<String, Items> map;


	public Map<String, Items> getMap() {
		return map;
	}


	public void setMap(Map<String, Items> map) {
		this.map = map;
	}


	@Override
	public Double getPrice() {

		double sum=0;
		for (Map.Entry<String, Items> entry : map.entrySet()) {
			sum+=entry.getValue().getPrice();
		}
		return sum;
	}
	
	
}
