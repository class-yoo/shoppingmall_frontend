<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<html lang="en">

<head>

	<meta charset="utf-8">
	
    <style type="text/css">
    
        .root-container {
        	background-color:#F8F8F8;
        	margin-top: 5px;
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
        	
    </style>

</head>

<body style="margin-top: 180px;">
    <div class="container root-container">
        <div class="row-fluid">
            <div class="span3" id="sidebar"></div>

            <!--/span-->
            <div class="span9" id="content">
                <div class="row-fluid">
                    <div class="alert alert-success">
                        <h4>주문하기</h4>
                    </div>
                </div>

                <div>
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
                    	<input class="select-item-cbx form-control mt-5 mr-1" type="checkbox" value="${cart.displayedProduct.no}" style="width: 20px;" height="20px;">
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
                        <div class="text-center mt-5">
                            <input type="button" id="register-btn" value="등록" class="btn btn-success btn-lg mr-5">
                            <input type="reset" id="cancel-btn" value="취소" class="btn btn-danger btn-lg">
                        </div>

                </div>

            </div>
        </div>

    </div>
    <hr>
</body>

</html>