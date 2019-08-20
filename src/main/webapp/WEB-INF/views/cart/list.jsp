<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<spring:eval expression="@propertyConfigurer['cdnUrl']" var="cdnUrl" />


<!DOCTYPE html>
<html>

<head>

  <meta charset="utf-8">
  
  <title>SB Admin - Tables</title>

  <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <!-- Favicons -->
    <link href="${pageContext.request.contextPath}/assets/img/favicon.png" rel="icon">
    <link href="${pageContext.request.contextPath}/assets/img/apple-touch-icon.png" rel="apple-touch-icon">

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" rel="stylesheet">

    <!-- Bootstrap CSS File -->
    <link href="${pageContext.request.contextPath}/assets/lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Libraries CSS Files -->
    <link href="${pageContext.request.contextPath}/assets/lib/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/lib/animate/animate.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/lib/ionicons/css/ionicons.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <!-- Main Stylesheet File -->
    <link href="${pageContext.request.contextPath}/assets/css/style.css" rel="stylesheet">
	
	<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

	<style type="text/css">
	#modal-background {
    display: none;
    position: fixed;
    top: 0; left: 0;
    width: 100%; height: 100%;
    background: rgba(0,0,0,.3);
    z-index: 1;
	}
	
	.content-wrapper{
		margin-top: 180px;
	}
	
	th{
		border-left: 0.8px ridge;
		border-bottom: solid 0.8px;
	}
	
	td{
		border-left: 0.8px ridge;
		border-bottom: solid 0.8px;
	}
	
	</style>
	
	<script type="text/javascript">

	var totalPrice =0;
	$(function () {
		
		$('.order-price').each(function() {
			totalPrice+=parseInt($(this).text());
		});
		
		$('#total-price').text('TOTAL: '+totalPrice+"원");
		
		
		$('#order-btn').click(function () {
			/* $('#product-tbody tr').each(function() {
				if($(this).children('.select-item-cbx').is(":checked")){
					var orderProduct = new Object();
					
					var displayedProductNo = $(this).children('.select-item-cbx').val();
					var amount = $(this).children('#quantity').val();
					
					orderProduct.displayedProductNo = displayedProductNo;
					orderProduct.amount = amount;
				}
				
			}); */
			var displayedProductNos = [];
			$('.select-item-cbx').each(function () {
				if($(this).is(":checked")){
					var displayedProductNo = $(this).val();
					displayedProductNos.push(displayedProductNo);
				}
			});
			console.log(displayedProductNos);
		});
		
	});
	
	var upQuantity = function (cartNo) {order-btn
		
		var quantity = parseInt($('#quantity'+cartNo).val()) +1 ;
		if(quantity >20){
			alert('최대수량은 20개 입니다.');
			return;
		}
		$('#quantity'+cartNo).val(quantity);
		setTotalPrice(++productCount);
	};
	
	var downQuantity = function (cartNo) {
		var quantity = parseInt($('#quantity'+cartNo).val())-1 ;
		if(quantity <1){
			return;
		}
		$('#quantity'+cartNo).val(quantity);
		setTotalPrice(--productCount);
		
		
		
		
	};
	
	</script>
</head>

<body>

	<c:import url="/WEB-INF/views/includes/navigation.jsp" />
	
    <div class="content-wrapper">
      <div class="container">

        <!-- DataTables Example -->
        <form action="${pageContext.request.contextPath}/order" method="get">
        <div class="card mb-3">
          <div class="card-header">
            <i class="fas fa-table"></i>
            	장바구니 목록</div>
            	
          <div class="card-body">
              <table class="table" style="height: 100%; width: 100%; text-align:center;"  cellspacing="0">
                <thead>
                  <tr>
                  	<th width="10%">
                    	<div>
                    		<p>번호</p>
                    	</div>
                    </th>
                    <th width="40%">
                    	<div>
                    		<p>상품명(옵션)</p>
                    	</div>
                    </th>
                    <th width="10%">
                    	<div >
                    		<p>판매가</p>
                    	</div>
                    </th>
                    <th width="20%">
                    	<div>
                    		<p>수량</p>
                    	</div>
                    </th>
                    <th width="10%">
                    	<div>
                    		<p>주문금액</p>
                    	</div>
                    </th>
                    <th width="10%">
                    	<div>
                    		<p>주문관리</p>
                    	</div>
                    </th>
                    <th></th>
                  </tr>
                </thead>
                
                <tbody id="product-tbody">
                <c:forEach items="${cartList}" var="cart" varStatus="status">
                  <tr>
                  	<td>
                    	<div class="mt-5" style="padding: 5px;">
                    		<p>${status.count}</p>
                    	</div>
                    </td>
                    <td>
                    	<div class="row ml-2" style="vertical-align: center;">
                    	<input class="select-item-cbx form-control mt-5 mr-1" type="checkbox" name="cartNo" value="${cart.no}" style="width: 20px;" height="20px;">
                    	<a href="${pageContext.request.contextPath}/product/detail?productNo=${cart.displayedProduct.productNo}">
    	              		<img alt="상품이미지" src="${cdnUrl}/${cart.displayedProduct.mainImagePath}" style="width: 100px; height: 120px;">
                  		</a>
                    	<div class="mt-5 ml-4" style="padding: 5px;">
                    		<p>${cart.displayedProduct.name}(${cart.displayedProduct.option})</p>
                    	</div>
                    	</div>
                    </td>
                    
                    <td>
	                    <div class="mt-5" style="padding: 5px;">
	                    		<p>${cart.displayedProduct.price}원</p>
	                    </div>
                    </td>
                    <td>
	                    <div class="row mt-5" style="padding: 1px;">
	                    	<div class="product-detail col-4">
	                    		<input id="quantity${cart.no}" readonly="readonly" class="form-control" id="quantity" value="${cart.amount}" type="text"/>	                    	
	                    	</div>
	                    	<div class="product-detail qtt-up-down col-3">
	                    		<img src="//img.echosting.cafe24.com/design/skin/default/product/btn_count_up.gif" alt="수량증가" onclick="upQuantity(${cart.no},)" class="QuantityUp-up" />
	                    		<img src="//img.echosting.cafe24.com/design/skin/default/product/btn_count_down.gif" alt="수량감소" onclick="downQuantity(${cart.no})" class="QuantityDown-down mb-4"  />
	                    	</div>
	                    	<div class="col-4">
	        	            		<button class="btn btn-warning" id="modify-btn">수정</button>
	                    	</div>
	                    </div>
                    </td>
                    <td>
                    	<div class="row mt-5" style="padding: 5px;">
	                    	<p class="order-price" id="order-price">${cart.displayedProduct.price*cart.amount}</p>
	                    	<p>원</p>
	                    </div>
                    </td>
                    <td>
                    	<div class="mt-5" style="padding: 5px;">
			                <a href="${pageContext.request.contextPath}/cart/remove?cartNo=${cart.no}">
	        	            	<button class="btn btn-danger form-control">삭제</button>
	    	                </a>
    	                </div>
                    </td>
                  </tr>
                </c:forEach>
                </tbody>
                
                <tfoot>
                  <tr>
                  	<th colspan="6">
                    	<div class="row text-right">
                    		<div class="col-9"></div>
                    		<p id="total-price" style="font-size: 20px;"></p>
                    	</div>
                    </th>
                  </tr>
                </tfoot>
              </table>
          </div>
          
          <div class="row">
          	<div class="col-9 mr-3"></div>
          	<div class="col-1 ml-2 mb-3">
          		<button class="btn btn-success btn-lg" type="submit" id="order-btn"><strong>주문하기</strong></button>
          	</div>
          	
          </div>
          
          <div class="card-footer small text-muted">장바구니 목록</div>
        </div>
		</form>
        <p class="small text-center text-muted my-5">
          <em>More table examples coming soon...</em>
        </p>
		
      </div>
      <!-- /.container-fluid -->

    </div>
    <!-- /.content-wrapper -->

  </div>
  <!-- /#wrapper -->

  <!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>
	
<button id="btn-open-dialog">창 열기</button>

<div class="container-fluid" id="modal-background" style="overflow: scroll; margin-top: 110px;">
	<c:import url="/WEB-INF/views/includes/order-modal.jsp"/>
</div>
</body>

