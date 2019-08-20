<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<spring:eval expression="@propertyConfigurer['cdnUrl']" var="cdnUrl" />

<!DOCTYPE html>
<html>

<meta charset="utf-8">
<head>
    <!-- Bootstrap -->
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
    <!------ Include the above in your HEAD tag ---------->

    <style type="text/css">
		body{
			margin-top: 180px;
		}
		
        .complete-option-tr td {
            border: solid 0.8px;
        }

        #mainImage {
            height: 250px;
            width: 350px;
        }
        
        .product-img{
        	height:130px;
            width: 150px;
        }
        .image-div img {
        	position : relative;
            margin-left: 3px;
        }
        .product-tb th{
        	width: 10%;
        }
        .image-del-btn{
        	padding: 2px;
        }
        
		input.upload_text {/*읽기전용 인풋텍스트*/
			float:left;
			width:230px;/* 버튼 포함 전체 가로 길이*/
			height:19px;
			line-height:19px;
			padding:0 3px;
			border:1px solid #bbb;
		}
        	
       	/*라벨은 원하는대로 커스텀하고*/

		.fileRegiBtn label {
			display: inline-block; 
			padding: .5em .75em; 
			color: #ffffff; 
			font-size: inherit; 
			line-height: normal; 
			vertical-align: middle; 
			background-color: #28A745; 
			cursor: pointer; 
			border: 1px solid #ebebeb; 
			border-bottom-color: #e2e2e2; 
			border-radius: .25em;
		}

		/*파일선택시 선택된 파일명이 붙는것을 가려준다*/
		.fileRegiBtn input[type="file"]{
			position: absolute; 
			width: 1px; 
			height: 1px; 
			padding: 0; 	
			margin: -1px; 
			overflow: hidden; 
			clip:rect(0,0,0,0); 
			border: 0;
		}
		
    </style>

    <script>
    var totalPrice =0;
    
    var title = [];
    var count = 0;
    <c:forEach items="${cartList}" var="cart">
		title.push("${cart.displayedProduct.name}");
		count++;
	</c:forEach>
	
	$(function () {
		
		$('.order-price').each(function() {
			totalPrice+=parseInt($(this).text());
		});
		
		$('#total-price').text('TOTAL: '+totalPrice+"원");
		$('#totalPrice').val(totalPrice);
		
		
		var joinTitle = title.join(',');
		$('#title').val(joinTitle);
		$('#description').val(title+'....... 총'+count+'건');
		console.log(joinTitle);
	});
	
    </script>
    
    
</head>

<body>

    <c:import url="/WEB-INF/views/includes/navigation.jsp" />
	<!-- DataTables Example -->
        <form action="${pageContext.request.contextPath}/order" method="post">
        <div class="container card mb-3" style="border: none;">
          <div class="card-header">
            <i class="fas fa-table"></i>
            	주문상품 목록</div>
            	
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
                    	<a href="${pageContext.request.contextPath}/product/detail?productNo=${cart.displayedProduct.productNo}">
    	              		<img alt="상품이미지" src="${cdnUrl}/${cart.displayedProduct.mainImagePath}" style="width: 100px; height: 120px;">
                  		</a>
                  		
                  		<input type="hidden" name="orderProducts[${status.count-1}].displayedProductNo" value="${cart.displayedProduct.no}">
                  		<input type="hidden" id="title" name="title" value="">
                  		<input type="hidden" id="description" name="description" value="">
                  		
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
	                    <div class="row mt-5 text-center" style="padding: 1px;">
	                    	<div class="col-4"></div>
	                    	<div class="product-detail col-4">
	                    		<input id="quantity${cart.no}" readonly="readonly" class="form-control" id="quantity" name="quantity" value="${cart.amount}" type="text"/>
	                    		<input type="hidden" name="orderProducts[${status.count-1}].amount" value="${cart.amount}">	                    	
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
                    		<input type="hidden" id=totalPrice name="totalPrice" >
                    	</div>
                    </th>
                  </tr>
                </tfoot>
              </table>
          </div>
          
        </div>
		
	
	
    <div class="container root-container">
        <div class="row-fluid">
            <div class="span3" id="sidebar"></div>

            <!--/span-->
            <div class="span9" id="content">
                <div>
                	<div class="card-header">
            <i class="fas fa-table"></i>
            	배송정보 입력</div>
                        <div class="table-responsive">
                            <table class="table product-tb">
                                <tr>
                                    <th>수령인</th>
                                    <td><input class="form-control col-7" type="text" name="receiver" id="receiver"></td>
                                    <th>연락처</th>
                                    
                                    	<td colspan="3">
                                    	<div class="row">
                                    	<input class="form-control col-3" type="text" name="contact" id="contact1"> -
                                    	<input class="form-control col-3" type="text" name="contact" id="contact2"> -
                                    	<input class="form-control col-3" type="text" name="contact" id="contact3">
                                    	</div>
                                    	</td>
                                    
                                </tr>

                                <tr>
                                    <th>기본 주소</th>
                                    <td colspan="2"><input class="form-control col-12" type="text" name="destination" id="destination"
                                    placeholder="ex) 서울시 강서구 화곡동 13-7"></td>
                                    <th>상세주소</th>
                                    <td colspan="1"><input class="form-control col-12" type="text" name="detailAddress" id="detailAddress"
                                    placeholder="ex) 그린오피스텔 1207호"></td>
                                    <td colspan="1"><input class="form-control col-10 btn btn-info" type="button" value="주소찾기"></td>
                                </tr>
                                
                                <tr>
                                    <th>요청사항</th>
                                    <td colspan="5"><textarea class="form-control" style="width: 98%; height: 80px;" id="requirement" name="requirement"></textarea>
                                    </td>
                                </tr>


                            </table>

                        </div>

                </div>

            </div>
            
            <div>
                	<div class="card-header">
            <i class="fas fa-table"></i>
            	결제정보 입력</div>
                        <div class="table-responsive">
                            <table class="table product-tb">
                                <tr>
                                    <th>결제수단</th>
                                    <td colspan="2"><select class="form-control col-12" name="means" id="means">
                                            <option value="카드">카드</option>
                                            <option value="입금" selected>무통장(신한 110-999-999999)</option>
                                        </select></td>
                                </tr>

                                <tr>
                                    <th>환불 은행</th>
                                    <td colspan="1"><input class="form-control col-6" type="text" name="refundBank" id="refundBank"></td>
                                    <th>환불 계좌</th>
                                    <td colspan="1"><input class="form-control col-10" type="text" name="refundAccount" id="refundAccount"></td>
                                </tr>
                            </table>
                            
                        </div>
                        <div class="text-center mt-5">
                            <input type="submit" id="order-btn" value="주문" class="btn btn-success btn-lg mr-5">
                            <a href="${pageContext.request.contextPath}/cart/list">
                            <input type="reset" id="cancel-btn" value="취소" class="btn btn-danger btn-lg">
                            </a>
                        </div>

                </div>
        </div>

    </div>
    </form>
    <hr>
</body>

</html>