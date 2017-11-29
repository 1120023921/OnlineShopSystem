package cn.doublehh.business.controller;

import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.doublehh.business.model.Goods;
import cn.doublehh.business.model.Items;
import cn.doublehh.business.model.Orders;
import cn.doublehh.business.model.vo.OrderVo;
import cn.doublehh.business.service.ItemsService;
import cn.doublehh.business.service.OrderService;
import cn.doublehh.business.utils.WebUtils;
import cn.doublehh.system.model.User;
import cn.doublehh.system.service.UserService;

@Controller
public class PageController {

	@Autowired
	private ItemsService itemsService;
	@Autowired
	private OrderService orderService;
	@Autowired
	private UserService userService;
	
	@RequestMapping("/cart")
	public String index(HttpSession session){
		
		OrderVo orderVo = (OrderVo) session.getAttribute("orderVo");
		if(orderVo!=null){
			session.removeAttribute("orderVo");
		}
		orderVo = new OrderVo();
		orderVo.setStatus("0");
		orderVo.setTime(new Date());
		orderVo.setId(WebUtils.generateID());
		Map<String, Items> map = new LinkedHashMap<String, Items>();
		orderVo.setMap(map);
		session.setAttribute("orderVo", orderVo);
		return "cart/cart";
	}
	
	/**
	 * 未登录跳转
	 * @return
	 */
	@RequestMapping("/nologin")
	public String nologin(){
		
		return "cart/nologin";
	}
	
	/**
	 * 跳转未发货订单
	 * @return
	 */
	@RequestMapping("/backOrders")
	public String backOrders(){
		
		return "admin/backOrders";
	}
	
	/**
	 * 跳转已发货订单
	 * @return
	 */
	@RequestMapping("/sendOrders")
	public String sendOrders(){
		
		return "admin/sendOrders";
	}
	
	/**
	 * 跳转已完成订单
	 * @return
	 */
	@RequestMapping("/completeOrders")
	public String userOrderDetail(){
		
		return "admin/completeOrders";
	}
	
	/**
	 * 跳转已发货订单信息页面
	 * @return
	 */
	@RequestMapping("/completeOrderDetail")
	public String completeOrderDetail(String order_id,Model model){
		
		List<Items> items = itemsService.getItems(order_id);
		String uid = orderService.getUidByOrderId(order_id);
		User user = userService.getUserByUid(uid);
		Orders orders = orderService.getOrderById(order_id);
		model.addAttribute("user", user);
		model.addAttribute("items", items);
		model.addAttribute("orders", orders);
		return "admin/completeOrderDetail";
	}
	
	/**
	 * 获取订单详细信息
	 * @param order_id
	 * @param model
	 * @return
	 */
	@RequestMapping("/orderDetail")
	public String orderDetail(String order_id,Model model){
		
		List<Items> items = itemsService.getItems(order_id);
		String uid = orderService.getUidByOrderId(order_id);
		User user = userService.getUserByUid(uid);
		Orders orders = orderService.getOrderById(order_id);
		model.addAttribute("user", user);
		model.addAttribute("items", items);
		model.addAttribute("orders", orders);
		return "admin/orderDetail";
	}
	
	/**
	 * 获取已完成订单详细信息
	 * @param order_id
	 * @param model
	 * @return
	 */
	@RequestMapping("/adminOrderDetail")
	public String userOrderDetail(String order_id,Model model){
		
		List<Items> items = itemsService.getItems(order_id);
		String uid = orderService.getUidByOrderId(order_id);
		User user = userService.getUserByUid(uid);
		Orders orders = orderService.getOrderById(order_id);
		model.addAttribute("user", user);
		model.addAttribute("items", items);
		model.addAttribute("orders", orders);
		return "admin/adminOrderDetail";
	}
	
	/**
	 * 跳转个人中心送货信息页面
	 * @return
	 */
	@RequestMapping("/receiveInfo")
	public String personInfo(){
		
		return "cart/receiveInfo";
	}
	
	/**
	 * 用户中心
	 * @return
	 */
	@RequestMapping("/personCenter")
	public String personCenter(){
		
		return "cart/personCenter";
	}
	
	/**
	 * 安全中心页面
	 * @return
	 */
	@RequestMapping("/safeCenter")
	public String safeCenter(){
		
		return "cart/safeCenter";
	}
	
	/**
	 * 用户订单列表
	 * @return
	 */
	@RequestMapping("/userOrdersList")
	public String userOrdersList(){
		
		return "cart/userOrdersList";
	}
	
	/**
	 * 用户个人订单详细信息页面
	 * @return
	 */
	@RequestMapping("/userOrdersDetail")
	public String userOrdersDetail(Model model,String id,HttpSession session){
		
		Orders orders = orderService.getOrderById(id);
		List<Items> items = itemsService.getItems(id);
		model.addAttribute("orders", orders);
		model.addAttribute("items", items);
		return "cart/userOrdersDetail";
	}
	
	/**
	 * 管理员获取所有商品信息
	 * @return
	 */
	@RequestMapping("/goodsList")
	public String goodsList(){
		
		return "admin/goodsList";
	}
	
	/**
	 * 管理员新增商品页面
	 * @return
	 */
	@RequestMapping("/goodsAdd")
	public String goodsAdd(){
		
		return "admin/goodsAdd";
	}
	
	/**
	 * 管理员修改商品信息页面
	 * @return
	 */
	@RequestMapping("/goodsUpdate")
	public String goodsUpdate(String id,Model model){
		
		model.addAttribute("goodId", id);
		return "admin/goodsUpdate";
	}
	
	/**
	 * 商品信息修改失败页面
	 * @return
	 */
	@RequestMapping("/goodsUploadFail")
	public String goodsUploadFail(){
		
		return "admin/goodsUploadFail";
	}
	
	/**
	 * 商品信息修改失败页面
	 * @return
	 */
	@RequestMapping("/goodsUploadSuccess")
	public String goodsUploadSuccess(){
		
		return "admin/goodsUploadSuccess";
	}
	
	/**
	 * 用户订单确认
	 * @return
	 */
	@RequestMapping("/confirm")
	public String confirm(){
		
		return "cart/confirm";
	}
}
