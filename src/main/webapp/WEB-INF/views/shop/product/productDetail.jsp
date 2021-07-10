<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../inc/top.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style type="text/css">   
   #info, #desc{
      width:700px;      
   }   
   #viewImg{
      float:left;
      padding:10px 30px 30px 30px;
      width:30%;            
   }
   #viewPd{
      float:left;
      padding:0 10px 30px 20px;      
   }
   #desc{
      clear:both;
      padding:10px 0 5px 0;      
   }
   
   .line2{
      border-bottom:solid silver 2px;
      padding:0 0 10px 7px;
   }
   .line
   {
      border-bottom:solid 1px silver;
   }
   .boldF{
      font-size:1.2em;
      font-weight:bold;

   }
   .center{
      text-align:center;
   }
   span{
      font-size:0.9em;
   }
   .sp1{
      width:50%;
      float:left;      
   }
   
   form{
      width:350px;
   }
   
      
   p{
      padding:8px;
      font-size:1.0em;
   }
   
   input[type="text"]{
      width:20%;
   }
</style>
<script type="text/javascript">
   $(function(){
      $('.buttons').click(function(){
         if($('#qty').val().length<1){
            alert('수량을 입력하세요.');
            $('#qty').focus;
            event.preventDefault();
            return false;
         }
         
         var type="";
         if($(this).attr('id')=='btOrder'){
            type = "order";
         }else if($(this).attr('id')=='btCart'){
            type = "cart";
         }
         
         $('form[name=frmPd]').prop('action',
               "<c:url value='/shop/cart/cartAdd?mode="+type+"'/>");
         $('form[name=frmPd]').submit();
      });
      
      
      $('.link').click(function(){
          window.open('<c:url value="/shop/product/productImage?imageUrl=${vo.imageUrl}"/>','이미지',"top=300, left=500, width=500, height=500, location=yes, resizable=yes");
       });

      
   });
   
</script>
<h2>상품 상세 보기</h2>

<div id="info">
   <div id="viewImg">
      <!-- 상품 이미지 -->
      <p class="center">
      <a class="link">
         <img src="${pageContext.request.contextPath }/pd_images/${vo.imageUrl }" 
            alt="${vo.productName }" border="0" width="150">
      </a>   
      </p>
      <p class="center">
      <a class="link">
            큰 이미지 보기</a></p>
   </div>

   
   <div id="viewPd">
      <form name="frmPd" method="post">         
         <!-- 상품명 -->
         <p class="line2">
            <span class="boldF">
               ${vo.productName }
            </span>
         </p>
         <p class="line"><span class="sp1"><img src="<c:url value='/resources/images/dot2.JPG'/>"> 판매가격</span>            
            <span><fmt:formatNumber value="${vo.sellPrice }" pattern="#,###"/>원 </span>
         </p>
         <p class="line"><span class="sp1"><img src="<c:url value='/resources/images/dot2.JPG'/>"> 적립금</span>
            <span>${vo.mileage}</span>
         </p>
         <p class="line"><span class="sp1"><img src="<c:url value='/resources/images/dot2.JPG'/>"> 제조사</span>
            <span>${vo.company }</span>
         </p>
      
         <p class="line"><span class="sp1"><img src="<c:url value='/resources/images/dot2.JPG'/>"> 구매수량</span>
            <label for="qty">
            <input type="text" name="qty" id="qty" value="1" ></label>
         </p>
         <p class="center">
            <input type="button" value="바로구매" class="buttons" id="btOrder">
            <input type="button" value="장바구니담기" class="buttons" id="btCart">
         </p>
      </form>
   </div>
</div>
<div id="desc">
   <img src="<c:url value='/resources/images/dot6.JPG'/>">
   <span style="font-size:12pt;font-weight:bold">
      상품상세정보</span>
   <br><br>
   <p>${vo.explains }</p>
   <p>${vo.description }</p>   
</div>


<%@ include file="../../inc/bottom.jsp"%>




