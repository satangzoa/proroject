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
<table>
	<tr>
		<td colspan="4">장바구니 확인</td>
	</tr>
	<tr>
		<th>상품명</th>
		<th>가격</th>
		<th>수량</th>
		<th>합계</th>
	</tr>
	<c:set var="tot" value="${0}" />
	<c:forEach items="${cart.itemSetList}" var="itemSet" varStatus="stat">
		<tr>
			<td>${itemSet.item.name}</td>
			<td>${itemSet.item.price}</td>
			<td>${itemSet.quantity}</td>
			<td>
				${itemSet.quantity * itemSet.item.price}
				<c:set var="tot" value="${tot + (itemSet.quantity * itemSet.item.price)}" />
				<a href="cartDelete?index=${stat.index}">ⓧ</a>
			</td>
		</tr>
	</c:forEach>
	<tr>
		<td colspan="4" align="right">총 구입 금액 : ${tot}원</td>
	</tr>
</table>
<br>
${message}
<br>
<input type="button" value="상품목록 " onclick="script:window.location='MainStore'" />
<input type="button" value="주문하기"  onclick="script:window.location='checkout'" />
<%@ include file="inc/footer.jsp" %>
</body>
</html>