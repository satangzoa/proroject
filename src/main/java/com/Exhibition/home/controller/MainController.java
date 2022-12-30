package com.Exhibition.home.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.support.DaoSupport;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.Exhibition.home.dao.IDao;
import com.Exhibition.home.dto.*;

@Controller
public class MainController {
	
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping (value ="/")
	public String home () {
		
		return "index";
	}

	@RequestMapping(value = "/index")
	public String index1() {
		
		return "index";
	}
	
	@RequestMapping (value ="join")
	public String join () {
		
		return "join_form";
	}
	
	@RequestMapping (value ="joinOk")
	public String joinOk (HttpServletRequest request, HttpSession session, Model model) {
		String mid = request.getParameter("mid");
		String mpw = request.getParameter("mpw");
		String mname = request.getParameter("mname");
		String memail = request.getParameter("memail");
		
		IDao dao = sqlSession.getMapper(IDao.class);
		int joinFlag = dao.memberJoin(mid, mpw, mname, mid);
		// joinFlag 가 1 이면 회원가입 성공, 아니면 실패
		//System.out.println("가입성공여부"+ joinFlag);
		
		if(joinFlag == 1 ) { //회원가입 성공시 바로 로그인 진행
			session.setAttribute("memberId", mid);
			session.setAttribute("memberName", mname);
		
			model.addAttribute("mid", mid);
			model.addAttribute("mname",mname );
			
			return "joinOk";
		} else { //회원가입 실패
				return "joinFail";
		}
	
	}
	
	
	@RequestMapping (value ="login")
	public String login () {
		
		return "login";
	}
	
	@RequestMapping (value = "logout")
	public String logout(HttpSession session) {
		
		session.invalidate();
		
		return "index";
	}
	
	
	@RequestMapping (value = "loginOk")
	public String loginOk(HttpServletRequest request, Model model, HttpSession session) {
		
		String mid = request.getParameter("mid");
		String mpw = request.getParameter("mpw");
		
		IDao dao = sqlSession.getMapper(IDao.class);
		
		int checkIdFlag = dao.checkId(mid); 
		//로그인하려는 아이디 존재시 1, 로그인하려는 아이디 존재하지 않으면 0이 반환
		int checkIdPwFlag = dao.checkIdAndPW(mid, mpw);
		//로그인하려는 아이디와 비밀번호가 모두 일치하는 데이터가 존재하면 1 아니면 0이 반환
		
		model.addAttribute("checkIdFlag",checkIdFlag);
		model.addAttribute("checkIdPwFlag",checkIdPwFlag);
		
		
		
		if(checkIdPwFlag == 1) {   //로그인실행
			session.setAttribute("memberId", mid);
			MemberDto memberDto = dao.getMemberInfo(mid);
			model.addAttribute("memberDto", memberDto);
			model.addAttribute("mid",mid);
		}

		return "loginOk";
	}
	
//	@RequestMapping (value ="show")
//	public String show () {
//		
//		return "/reservation/showview";
//	}
//	
//	
	
	@RequestMapping(value = "/question")
	public String question(HttpSession session, Model model) {
			
		String sessionId = (String) session.getAttribute("memberId");
		
//		if(sessionId == null) {
//			model.addAttribute("memberId", "GUEST");
//		} else {
//			model.addAttribute("memberId", sessionId);
//		}
		model.addAttribute("memberId", sessionId);
		return "question";
	}
	
	
	
	
	@RequestMapping(value = "questionOk")
	public String writeQuestion(HttpServletRequest request, Model model) {
		
		String qid = request.getParameter("qid");
		String qname = request.getParameter("qname");
		String qcontent = request.getParameter("qcontent");
		String qemail = request.getParameter("qemail");
		
		IDao dao = sqlSession.getMapper(IDao.class);
		dao.writeQuestion(qid, qname, qcontent, qemail);
		
		return "redirect:event";
	}

//	@RequestMapping (value ="event")
//	public String event ( Model model,Criteria cri) {
//		IDao dao = sqlSession.getMapper(IDao.class);
//		
//		List<QBoardDto> qboardDtos = dao.questionList(cri);
//		
//		model.addAttribute("qdtos", qboardDtos);
//		
//		return "questionList";
//	}
	
	@RequestMapping(value = "event")
	public String list( Model model, Criteria cri,HttpServletRequest request) {//페이징해야하므로 Criteria 가져온다
		
		int pageNumInt=0;
		if(request.getParameter("pageNum") == null) {
			 pageNumInt =1;//1페이지부터 시작
			cri.setPageNum(pageNumInt);
		} else {
			 pageNumInt =Integer.parseInt(request.getParameter("pageNum"));
			 cri.setPageNum(pageNumInt);
		}
		IDao dao = sqlSession.getMapper(IDao.class);
		
		int totalRecord = dao.boardAllCount();
		//cri.setPageNum();
		cri.setStartNum(cri.getPageNum()-1 * cri.getAmount()); 
		
		PageDto pageDto = new PageDto(cri, totalRecord); 

		List<QBoardDto> qboardDtos = dao.questionList(cri);
		
		model.addAttribute("pageMaker", pageDto);//pageMaker = pageDto
		model.addAttribute("qdtos", qboardDtos );
		model.addAttribute("currPage", pageNumInt );
		
		return "questionList";
	}
	
	
	@RequestMapping(value = "/questionView")
	public String questionView(HttpServletRequest request, Model model) {
		
		String qnum = request.getParameter("qnum");
		
		IDao dao = sqlSession.getMapper(IDao.class);
		
		QBoardDto qBoardDto = dao.questionView(qnum);
		
		model.addAttribute("qdto", qBoardDto);
		model.addAttribute("qid", qBoardDto.getQid());
		
		return "questionView";
	}
	
	@RequestMapping(value = "questionModify")
	public String questionModify(HttpServletRequest request, Model model) {
		
		String qnum = request.getParameter("qnum");
		IDao dao = sqlSession.getMapper(IDao.class);
		
		QBoardDto qBoardDto = dao.questionView(qnum);
		
		model.addAttribute("qdto", qBoardDto);
		return "questionModify";
	}

	
	@RequestMapping(value = "questionModifyOk")
	public String questionModifyOk(HttpServletRequest request, Model model) {
		
		String qnum = request.getParameter("qnum");
		String qname = request.getParameter("qname");
		String qcontent = request.getParameter("qcontent");
		String qemail = request.getParameter("qemail");
		
		IDao dao = sqlSession.getMapper(IDao.class);
		
		dao.questionModify(qnum, qname, qcontent, qemail);
		
		return "redirect:event";
	}
	
	
	@RequestMapping(value = "questionDelete")
	public String questionDelete(HttpServletRequest request, Model model) {
		
		String qnum = request.getParameter("qnum");
		
		IDao dao = sqlSession.getMapper(IDao.class);
		dao.questionDelete(qnum);
	
		
		return "redirect:event";
	}
	
	@RequestMapping(value = "/mypage")
	public String memberModify(Model model, HttpSession session) {
		
		String sessionId = (String) session.getAttribute("memberId");
		
		IDao dao = sqlSession.getMapper(IDao.class);
		
		MemberDto memberDto = dao.getMemberInfo(sessionId);
		
		model.addAttribute("memberDto", memberDto);
		
		return "memberModify";
	}
	
	@RequestMapping(value = "/memberModifyOk")
	public String memberModifyOk(HttpServletRequest request,  Model model) {
		
		String mid = request.getParameter("mid");
		String mpw = request.getParameter("mpw");
		String mname = request.getParameter("mname");
		String memail = request.getParameter("memail");
		
		IDao dao = sqlSession.getMapper(IDao.class);
		
		dao.memberModify(mid, mpw, mname, memail);
		
		MemberDto memberDto = dao.getMemberInfo(mid);//수정된 회원정보 다시 가져오기
		
		model.addAttribute("memberDto", memberDto);
		
		return "memberModifyOk";
	}
	
	
	@RequestMapping (value ="reservationPage2")
	public String reservationPage () {
		
		return "reservationPage2";
	}
	
	@RequestMapping(value = "/buy")
	public String buy() {
		
		return "buy";
	}
	
	@RequestMapping(value = "/cart_List")
	public String cart_List() {
		
		return "cart_List";
	}
	@RequestMapping(value = "/MainStore")
	public String MainStore() {
		
		return "MainStore";
	}
	
	@RequestMapping(value = "/reservationPage")
	public String reservationPage2() {
		
		return "reservationPage";
	}
	
	@RequestMapping(value = "test")
	public String test(Model model, HttpServletResponse response) throws IOException {
			
		IDao dao = sqlSession.getMapper(IDao.class);		
		
		BuyDto buyDto = dao.joinTest("tiger");
		
		
		System.out.println(buyDto.getMemberDto().getMid());
		
		model.addAttribute("buyInfo", buyDto);
		
		//특정 페이지로 이동전에 자바스크립트 경고창 띄우기
//		response.setContentType("text/html; charset=UTF-8");
//        PrintWriter out = response.getWriter();
//        out.println("<script>alert('로그인 정보를 확인해주세요.'); history.go(-1);</script>");
//        out.flush(); 
		
		return "test";
	}
	
}
