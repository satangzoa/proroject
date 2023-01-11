<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<title>상품장바구니 목록</title>
<script type="text/javascript">


function fnClear(){
	if(confirm("장바구니를 비우시겠습니까?")) {
		location.href = "CartClear";	
	}
}

function fnGo(){
	location.href = "ShopMallMain";
}

</script>
</head>
<body>
    <div class="container">
    <h2 class="my-3 border-bottom pb-2">장바구니 확인</h2>
         
        <form name="" id="" method="post" action="">
            <table class="table table-bordered" >
                <tr>
                    <th scope="col">번호</th>
                    <th scope="col">짱구이름</th>
                    <th scope="col">주문 수량</th>
                    <th scope="col">총금액</th>
                    <th scope="col">취소</th>
                </tr>
                <tr>
                    <td>
                       짱구베게
                    </td>
                    <td style="width: 80px" align="right">
                        <fmt:formatNumber pattern="###,###,###" value=""/>
                    </td>
                    <td>
                        <input type="number" style="width: 40px" name="amount" value="" min="1">
                        <input type="hidden" name="productId" value="">
                    </td>
                    <td style="width: 100px" align="right">
                        <fmt:formatNumber pattern="###,###,###" value=""/>
                    </td>
                    <td>
                        <input type='button' value='장바구니 비우기' onclick='fnClear()' />"
                    </td>
                </tr>
                <tr>
                    <td colspan="5" align="right">
                        장바구니 금액 합계 : <fmt:formatNumber pattern="###,###,###" value=""/><br>
                        배송료 :<br>
                        전체 주문금액  :<fmt:formatNumber pattern="###,###,###" value=""/>
                    </td>
                </tr>
            </table>
            <input type="hidden" name="count" value="">
            <input type='button' value='결제하기' onclick='fnPay()' >
            <button type="submit" id="" class="btn btn-primary my-2">수정</button>
        </form>
  	<input type='button' value='쇼핑 계속하기' onclick='fnGo()' />
</body>
</html>