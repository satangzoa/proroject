<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>

</head>
<body>
<%@ include file="inc/header.jsp" %>
<h2>장바구니</h2>

	
   <form action ="tproduct?pnum=${param.pnum}" method="post"> 
   <input type="hidden" value="${ticket.pnum }" name="pnum">
   <table width="75%" border="0" cellspacing="0" cellpadding="20">
            <center>
            <table width="80%" border="0" cellspacing="0" cellpadding="10">
               <tr class="contentbox">
                  <td class="content">
                     <center>
                     <table border="0" cellspacing="0" cellpadding="10">
                        <form action="cartOk" method="post" name="reservation_frm">
                           <tr>
                              <td><span class="content_text01">상품명:</span></td>
                              <td><input class="input_type01" type="text" name="pname" value="${ticket.pname}"></td>
                           </tr>
                           
                              <td><span class="content_text01">가격:</span></td>
                              <td><input class="input_type01" type="text" name="pprice" value="${ticket.pprice}">
                         <select name="pcount">
                                       <!-- <option value="">${i}</option>-->
                                        <option value="1">1</option>
                                        <option value="2">2</option>
                                        <option value="3">3</option>
                                        <option value="4">4</option>
                                        <option value="5">5</option>
                                </select>개 &nbsp&nbsp
									 </td>
									 <td><span class="content_text01">총가격:${pprice * pcount }</span>&nbsp;&nbsp;</td>
                           <tr>
                              <td colspan="2" align="center">

                                 <!-- <input class="button_type01" type="button" value="예매하기"  onclick="location.href='ticketingtest'">&nbsp;&nbsp; -->
                                 <input class="button_type01" type="submit" value="주문하기"  >&nbsp;&nbsp; 
                                 <input class="button_type01" type="button" value="상품목록가기" onclick="script:window.location='index'">
                              </td>
                           </tr>
                        </form>
                     </table>
                     </center>
               
<%@ include file="inc/footer.jsp" %>
</body>
</html>