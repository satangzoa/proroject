package com.Exhibition.home.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.Exhibition.home.dao.IDao;
import com.Exhibition.home.dto.*;

@Controller
public class ShoppingController {

	@Autowired
	private SqlSession sqlSession;

	
	@RequestMapping(value="ShopMallMain")
	public String ShopMallMain() {
		
		
		return "ShopMallMain";
	}

	@RequestMapping(value="CartProcess")
	public String CartProcess() {
		
		
		return "CartProcess";
	}

	@RequestMapping(value="CartView")
	public String CartView() {
		
		
		return "CartView";
	}
	
	@RequestMapping(value="CartView2")
	public String CartView2() {
		
		
		return "CartView2";
	}
	
	@RequestMapping(value="CartClear")
	public String CartClear() {
		
		
		return "CartClear";
	}
	
	@RequestMapping(value="cart_List")
	public String cart_List() {
		
		
		return "cart_List";
	}

	
	@RequestMapping(value="CartVieww")
	public String CartVieww() {
		
		
		return "CartVieww";
	}
//	@RequestMapping (value ="showview")
//	public String showview (HttpServletRequest request, Model model, HttpSession session) {
//		String sessionId = (String) session.getAttribute("memberId");
//		String snum = request.getParameter("snum");
//		
//		IDao dao = sqlSession.getMapper(IDao.class);
//
//		FileDto fileDto = dao.getFileInfo(snum);
//		ShowDto showdto = dao.showView(snum);
//		
//		model.addAttribute("showView",showdto);
//		model.addAttribute("fileDto", fileDto);
//		
//		
//		return "showview";
//	}
	@RequestMapping(value="MainStore")
	public String MainStore(HttpServletRequest request, Model model,HttpSession session) {
		String sessionId = (String) session.getAttribute("memberId");
		String pnum = request.getParameter("pnum");
		String pname = request.getParameter("pname");
		String pprice = request.getParameter("pprice");
		
		IDao dao = sqlSession.getMapper(IDao.class);
		
		ProductDto pDto = dao.productInfo(pnum);
		
		model.addAttribute("pDto", pDto);
		model.addAttribute("pname", pname);
		model.addAttribute("pprice", pprice);
		
		return "MainStore";
	}
	
	@RequestMapping(value="cart")
	public String cart() {
		
		
		return "cart";
	}
	
	@RequestMapping(value="cartda")
	public String cartda() {
		
		
		return "cartda";
	}
}
