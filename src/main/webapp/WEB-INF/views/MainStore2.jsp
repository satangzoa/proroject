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
<div class="container">
	<h2 class="my-3 border-bottom pb-2">이것저것  판매</h2>
	
<!--  	<form action="" method="post" name="join_frm" >
		<tr>
			<td>번호</td>
			<td>상품명</td>
			<td>상품이름</td>
			<td>가격</td>
			<td>상품소개</td>
		</tr>
		
	</form>
	</div>	-->
	
	<table class="table table-bordered">
  <thead>
    <tr>
      <th scope="col">번호</th>
      <th scope="col">상품이미지</th>
      <th scope="col">상품이름</th>
      <th scope="col">상품가격</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th >${pnum }</th>
      <td><img src="/resources/img/j1.png"  width='150' height='150'></td>
      <td>베게짱구${pname }</td>
      <td>10000원${pprice }</td>
       <td>     <select name="count">
                 <option value="1">1</option>
                 <option value="2">2</option>
                 <option value="3">3</option>
                 <option value="4">4</option>
                 <option value="5">5</option>
                                </select>개 </td>
    <!--  <td>   <input type="submit" value="장바구니 보기" onclick="script:window.location='cartda'" /></td>--> 
 <td>   <input type="button" value="장바구니 보기" onclick="location.href='product?pnum=1'" /></td>
    </tr>
    <button style="width: 124px; height: 58px;"
				class="btn btn-outline-danger" id="insertLike"
				onclick="fn_InsertLike()">
				<font size="5px">♥</font>
			</button>
    <tr>
      <th >${pnum }</th>
      <td><img src="/resources/img/j2.png" width='150' height='150'></td>
      <td>하품짱구${pname }</td>
      <td>20000원${pprice }</td>
      <td>     <select name="count">
                 <option value="1">1</option>
                 <option value="2">2</option>
                 <option value="3">3</option>
                 <option value="4">4</option>
                 <option value="5">5</option>
                                </select>개 </td>
      
 <td>   <input type="submit" value="장바구니 보기"  onclick="script:window.location='cartda'" /></td>
    </tr>
    
    <tr>
      <th >${pnum }</th>
      <td><img src="/resources/img/j3.png" width='150' height='150'></td>
      <td>흰둥이랑짱구${pname }</td>
      <td>30000원${pprice }</td>
      <td>     <select name="count">
                 <option value="1">1</option>
                 <option value="2">2</option>
                 <option value="3">3</option>
                 <option value="4">4</option>
                 <option value="5">5</option>
                                </select>개 </td>
   <td>   <input type="submit" value="장바구니 보기"  onclick="script:window.location='cartda'" /></td>
    </tr>
    
  </tbody>
</table>
</div>
<%@ include file="inc/footer.jsp" %>
</body>
</html>