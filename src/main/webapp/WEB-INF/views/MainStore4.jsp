<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<title>상품 판매</title>
</head>
<body>
<%@ include file="inc/header.jsp" %>
<form action ="cartda?pnum=${param.pnum}" method="get">  
   <input type="hidden" value="${pDto.pnum }" name="pnum">
   <table width="75%" border="0" cellspacing="0" cellpadding="20">
      <tr>
         <td class="titlebox">
		
				 	
            <span class="title01">상품 페이지</span>
         </td>
      </tr>
      <tr>
         <td>
            <center>
            <table width="80%" border="0" cellspacing="0" cellpadding="10">
               <tr class="contentbox">
                  <td class="content">
                     <center>
                     <table border="0" cellspacing="0" cellpadding="10">
                        <form action="cartda" method="post" name="reservation_frm">
                           
                           <tr>
                              <td><span class="content_text01">상품번호:</span></td>
                              <td><input class="input_type01" type="text" name="pnum" value="${pDto.pnum}"></td>
                           </tr>
                           <tr>
                              <td><span class="content_text01">상품이름:</span></td>
                              <td><input class="input_type01" type="text" name="slocation" value="${pDto.pname}"></td>
                           </tr>
                              <td><span class="content_text01">상품가격:</span></td>
                              <td><input class="input_type01" type="text" name="pprice" value="${pDto.pprice}">
                         <select name="pcount">
                                        <option value="1">1</option>
                                        <option value="2">2</option>
                                        <option value="3">3</option>
                                        <option value="4">4</option>
                                        <option value="5">5</option>
                                </select>개 &nbsp&nbsp
									 </td>
									 
<%@ include file="inc/footer.jsp" %>
</body>
</html>