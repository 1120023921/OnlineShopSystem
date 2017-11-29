package cn.doublehh.business.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;

import cn.doublehh.business.model.Items;
import cn.doublehh.business.model.Orders;
import cn.doublehh.business.model.vo.OrderVo;
import cn.doublehh.business.service.ItemsService;
import cn.doublehh.business.service.OrderService;
import cn.doublehh.business.utils.ApacheMailUtil;
import cn.doublehh.system.model.User;
import cn.doublehh.system.service.UserService;

@Controller
@RequestMapping("/orders")
public class OrdersController {

	@Autowired
	private ItemsService itemsService;
	@Autowired
	private OrderService orderService;
	@Autowired
	private UserService userService;
	
	@RequestMapping("/list")
	@ResponseBody
	public OrderVo listOrder(HttpSession session){
		
		return (OrderVo) session.getAttribute("orderVo");
	}
	
	@RequestMapping("/submit")
	public String submit(HttpSession session,String remark,HttpServletResponse response,HttpServletRequest request,Model model){
		
		//Linux下注释手动转码
//		byte remarkCode[];
//		try {
//			remarkCode = remark.getBytes("ISO-8859-1");
//			remark = new String(remarkCode,"UTF-8");
//		} catch (UnsupportedEncodingException e) {
//			e.printStackTrace();
//		}
		User user = (User) session.getAttribute("user");
		if(user==null){
//			try {
//				response.sendRedirect(request.getContextPath()+"/nologin.do");
//				return "";
//			} catch (IOException e) {
//				e.printStackTrace();
//			}
			model.addAttribute("remark", remark);
			return "cart/nologin";
		}
		
		OrderVo orderVo = (OrderVo) session.getAttribute("orderVo");
		orderVo.setUid(user.getUid());
		orderVo.setRemark(remark);
		Map<String, Items> map = orderVo.getMap();
		for(Map.Entry<String, Items> entry : map.entrySet()){
			itemsService.addItems(entry.getValue());
		}
		orderService.addOrder(orderVo);
		new Thread(){
			public void run() {
				String content = "您有新的订单，订单号："+orderVo.getId()+" 客户："+user.getName()+" 联系方式："+user.getTel();
				ApacheMailUtil.sendEmail("LA LUNA", content, "1120023921@qq.com");
				ApacheMailUtil.sendEmail("LA LUNA", content, "437654842@qq.com");
//				ApacheMailUtil.sendEmail("叔果联盟", content, "1362697485@qq.com");
//				ApacheMailUtil.sendEmail("叔果联盟", content, "386933334@qq.com");
			};
		}.start();
//		String content = "您有新的订单，订单号："+orderVo.getId()+" 客户："+user.getName()+" 联系方式："+user.getTel();
//		ApacheMailUtil.sendEmail("叔果联盟", content, "1120023921@qq.com");
		session.removeAttribute("orderVo");
		return "cart/paySuccess";
	}
	
	/**
	 * 获取所有代发货订单
	 * @param pages
	 * @param rows
	 * @return
	 */
	@RequestMapping("/getAllBackOrders")
	@ResponseBody
	public PageInfo<Orders> getAllBackOrders(int pages,int rows){
		
		return orderService.getAllBackOrders(pages,rows);
	}
	
	/**
	 * 获取所有已发货订单
	 * @param pages
	 * @param rows
	 * @return
	 */
	@RequestMapping("/getAllSendOrders")
	@ResponseBody
	public PageInfo<Orders> getAllSendOrders(int pages,int rows){
		
		return orderService.getAllSendOrders(pages, rows);
	}
	
	/**
	 * 获取所有已完成订单
	 * @param pages
	 * @param rows
	 * @return
	 */
	@RequestMapping("/getAllCompleteOrders")
	@ResponseBody
	public PageInfo<Orders> getAllCompleteOrders(int pages,int rows){
		
		return orderService.getAllCompleteOrders(pages, rows);
	}
	
	/**
	 * 发货
	 */
	@RequestMapping("/sendGoods")
	public String sendGoods(String id){
		
		Orders orders = orderService.getOrderById(id);
		orders.setStatus("1");
		orderService.updateOrder(orders);
		return "redirect:/backOrders.do";
	}
	
	/**
	 * 结单
	 */
	@RequestMapping("/completeOrders")
	public String completeOrders(String id){
		
		Orders orders = orderService.getOrderById(id);
		orders.setStatus("2");
		orderService.updateOrder(orders);
		return "redirect:/sendOrders.do";
	}
	
	/**
	 * 用户获取自己订单
	 * @param pages
	 * @param rows
	 * @param session
	 * @return
	 */
	@RequestMapping("/getAllUserOrders")
	@ResponseBody
	public PageInfo<Orders> getAllUserOrders(int pages,int rows,HttpSession session){
		
		User user = (User) session.getAttribute("user");
		String uid = user.getUid();
		return orderService.getAllUserOrders(uid, pages, rows);
	}
}
