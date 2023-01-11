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
<center>
   <table width="75%" border="0" cellspacing="0" cellpadding="20">
      <tr>
         <td class="titlebox">
            <span class="title01">상품목록</span>
         </td>
      </tr>
      <tr>
         <td>
            <center>
          
                       <form action="cartda" method="get" >
                       <c:forEach items="${productInfo}" var="pDto">
                              <td><span class="content_text01">상품번호  :</span></td>
                              <td colspan="2"><textarea class="textarea_text01" rows="5" cols="30" name="pnum">${pDto.pnum }</textarea></td>
                           </tr>
                            <tr>
                              <td><span class="content_text01">상품이름  :</span></td>
                              <td colspan="2"><textarea class="textarea_text01" rows="5" cols="30" name="pname">${pDto.pname  }</textarea></td>
                           </tr>
                              <tr>
                                <td><span class="content_text01">가격:</span></td>
                              <td><input class="input_type01" type="text" name="pprice" value="${pDto.pprice}">
                         <select name="pcount">
                                        <option value="1">1</option>
                                        <option value="2">2</option>
                                        <option value="3">3</option>
                                        <option value="4">4</option>
                                        <option value="5">5</option>
                                </select>장 &nbsp&nbsp
									 </td>
                          
                           <tr>
                                 <td colspan="2" align="center">
                                   <input class="button_type01" type="button" value="장바구니" onclick="script:window.location='cartda?pnum=${ pDto.pnum}'">
                                   <input class="button_type01" type="button" value="처음으로" onclick="script:window.location='index'">
                               </td>
            
                           </tr>
                           </c:forEach>
                          
                     </center>
                  </td>
               </tr>
            </table>
            </center>
         </td>
      </tr>
   </table>
   </center>
<%@ include file="inc/footer.jsp" %>
</body>
</html>