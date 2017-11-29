package cn.doublehh.business.controller;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import cn.doublehh.business.model.Goods;
import cn.doublehh.business.service.GoodsService;

@Controller
@RequestMapping("/upload")
public class UploadController {

	@Autowired
	private GoodsService goodsService;
	
	/**
	 * 图片上传
	 * @param goods
	 * @param imgfile
	 * @param request
	 * @param model
	 * @return
	 * @throws IllegalStateException
	 * @throws IOException
	 */
	@RequestMapping("/addPhoto")
	public void addInfo(Goods goods,MultipartFile imgfile,HttpServletRequest request,Model model,HttpServletResponse response) throws IllegalStateException, IOException{
       	String id = goods.getId();
		
		String originalFilename = imgfile.getOriginalFilename();
		if(imgfile!=null && originalFilename!=null && originalFilename.length()>0){
			//得到保存路径
			String savepath = request.getServletContext().getRealPath("/static/upload");
			//得到新的图片名称
			String filename = UUID.randomUUID()+originalFilename.substring(originalFilename.lastIndexOf("."));
			File newfile = new File(savepath+File.separator+filename);
			//将图片存到硬盘里
			imgfile.transferTo(newfile);
			//将图片名称存到数据库
//			perfectInfo.setHeadimg(filename);
			
			int res = goodsService.updateGoodsPic(id, filename);
			
			if(res<=0){
				response.sendRedirect(request.getContextPath()+"/goodsUploadFail.do");
			}else {
				response.sendRedirect(request.getContextPath()+"/goodsUploadSuccess.do");
			}
		}
	}
}
