<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<spring:eval expression="@propertyConfigurer['cdnUrl']" var="cdnUrl" />


<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>EstateAgency Bootstrap Template</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">
	
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

    <!-- =======================================================
    Theme Name: EstateAgency
    Theme URL: https://bootstrapmade.com/real-estate-agency-bootstrap-template/
    Author: BootstrapMade.com
    License: https://bootstrapmade.com/license/
  ======================================================= -->
	<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <style type="text/css">
        strong {
            font-size: 20px;
        }
        
        .color-text-a {
            font-size: 18px;
        }
        
        .span-price {
            margin-left: 40px;
        }
        
        .row .product-div .col-6{
        	max-width: 20%;
        }
			
			
		.row .product-div .product-detail{
			padding: 1px;
		}
		#quantity{
			   margin-top: 5px;
			   padding: 1px;
			   padding-left: 5px;
		}	        
		
        .row .product-div .del-btn{
			   margin-top: 11px;
		}	 
		
		.cart-buy-btn button{
			font-family: Helvetica, Arial, sans-serif;
			font-weight: 700;
			width: 100%;
		}
        img:hover{
        	cursor: pointer;
        }
        
    </style>
    
    <script type="text/javascript">
    	var completeOptionNo=0;
    	var displayedProducts = new Array();
    	
    	<c:forEach items="${product.displayedProducts}" var="displayedProduct">
    		var displayedProduct = new Object();
    		displayedProduct.no = "${displayedProduct.no}";
    		displayedProduct.code = "${displayedProduct.code}";
    		displayedProduct.name = "${displayedProduct.name}";
    		displayedProduct.option = "${displayedProduct.option}";
    		displayedProduct.amount = "${displayedProduct.amount}";
    		displayedProduct.additionalFee = "${displayedProduct.additionalFee}";
    		displayedProduct.productNo = "${displayedProduct.productNo}";
    		
    		displayedProducts.push(displayedProduct);
    	</c:forEach>
    	
    	$(function () {
    		
    		console.log(displayedProducts);
    		
    		var optionCount = $('.option-select').length;
    		
    		for(var i=0; i<optionCount-1; i++){
    			$('.option-select:eq('+i+')').change(function () {
    				for(var j=i; j<optionCount; j++){
    					$('.option-select:eq('+j+')').val('default');	
    				}
				});
		    }
    		
    		$('.option-select:eq('+(optionCount-1)+')').change(function () {
    				var completeOption = [];
    				if($(this).val()=='default'){
    					return;
					}
    				$('.option-select').each(function() {
    					completeOption.push($(this).val());
    				});
    				
    				if($('#'+completeOption.join("")).length > 0){
    					alert('이미 존재하는 옵션입니다!');
    					return;
    				}
    				
    				completeOptionNo ++;
    				
    				$tr = $('<tr class="completeOptionTr" id="completeOption'+completeOptionNo+'" style="border: none;"></tr>');
    				$td1 = $('<td width="30%" class="completeOptionTd" id="'+completeOption.join("")+'">'+completeOption.join("/")+'</td>');
    				$td2 = $('<td width="40%"></td>')
    				$td2_div = $('<div class="row product-div"></div>');
    				$td2_div_div1 = $('<div class="col-1"></div>');
    				$td2_div_div2 = $('<div class="col-3 product-detail"></div>');
    				$td2_div_div2_input = $('<input id="quantity'+completeOptionNo+'" readonly="readonly" class="form-control" name="quantity_name" value="1" type="text"/>');
    				$td2_div_div3 = $('<div class="col-3 product-detail qtt-up-down">');
    				$td2_div_div3_img1 = $('<img src="//img.echosting.cafe24.com/design/skin/default/product/btn_count_up.gif" alt="수량증가" onclick="upQuantity('+completeOptionNo+')" class="QuantityUp up" />');
    				$td2_div_div3_img2 = $('<img src="//img.echosting.cafe24.com/design/skin/default/product/btn_count_down.gif" alt="수량감소" onclick="downQuantity('+completeOptionNo+')" class="QuantityDown down" />');
    				$td2_div_div4 = $('<div class="col-3 product-detail del-btn"></div>');
    				$td2_div_div4_a = $('<a href="#none" onclick="removeOptionTr('+completeOptionNo+')"><img src="https://img.echosting.cafe24.com/skin/base_ko_KR/product/btn_price_delete.gif" alt="삭제" class="option_box_del" /></a>'); 
    				
    				$tr.append($td1);
    				$tr.append($td2);
    				$td2.append($td2_div);
    				$td2_div.append($td2_div_div1);
    				$td2_div.append($td2_div_div2);
    				$td2_div_div2.append($td2_div_div2_input);
    				$td2_div.append($td2_div_div3);
    				$td2_div_div3.append($td2_div_div3_img1);
    				$td2_div_div3.append($td2_div_div3_img2);
    				$td2_div.append($td2_div_div4);
    				$td2_div_div4.append($td2_div_div4_a);
    				
    				$('#added-option').append($tr);
    				
    				setTotalPrice(++productCount);
				});
    		var cartList = [];
    		$('#cart-btn').click(function () {
    			console.log($('.completeOptionTd'));
    			if($('.completeOptionTr').length == 0){
    				return;
    			}
    			
				$('.completeOptionTr').each(function () {
					
					var tempOption = $(this).children('td:eq(0)').text();
					var amount = $(this).children('td:eq(1)').children('div').children('div:eq(1)').children('input').val();
					
					for(var i = 0; i<displayedProducts.length; i++){
						if(displayedProducts[i].option == tempOption){
							var cart = new Object();
							cart.amount= amount;
							cart.displayedProductNo = displayedProducts[i].no;
							cartList.push(cart);
						}
					}
				});
				
				$.ajax({
					 url:"${pageContext.servletContext.contextPath}/cart/add",
		  	         type:"post",
		  	         dataType:"json",
		  	       	 contentType: "application/json",
		  	         data: {"cartList": cartList},
		  	         success:function(response){
		  	            if(response.result == "success"){
		  	               window.location.href = "${pageContext.servletContext.contextPath}/cart/list";
		  	               return ;
		  	            }
		  	         },
		  	         error:function(xhr, error){
		  	            console.error("error:" + error);
		  	         }
				});	
    			
			});
    			
		});
    	
    	var removeOptionTr = function (completeOptionNo) {
			$('#completeOption'+completeOptionNo).remove();
		};
    	var upQuantity = function (completeOptionNo) {
    		var quantity = parseInt($('#quantity'+completeOptionNo).val()) +1 ;
    		if(quantity >20){
    			alert('최대수량은 20개 입니다.');
    			return;
    		}
    		$('#quantity'+completeOptionNo).val(quantity);
    		setTotalPrice(++productCount);
		};
    	
		var downQuantity = function (completeOptionNo) {
			var quantity = parseInt($('#quantity'+completeOptionNo).val())-1 ;
    		if(quantity <1){
    			return;
    		}
    		$('#quantity'+completeOptionNo).val(quantity);
    		setTotalPrice(--productCount);
		};
		
		var setTotalPrice = function(count){
			$('#totalPrice').val(parseInt(${product.consumerPrice}) * count);
		}
		
		var productCount = 0;
    </script>
</head>

<body>

    <div class="click-closed"></div>
    <!--/ Form Search Star /-->
    <div class="box-collapse">
        <div class="title-box-d">
            <h3 class="title-d">Search Property</h3>
        </div>
        <span class="close-box-collapse right-boxed ion-ios-close"></span>
        <div class="box-collapse-wrap form">
            <form class="form-a">
                <div class="row">
                    <div class="col-md-12 mb-2">
                        <div class="form-group">
                            <label for="Type">Keyword</label>
                            <input type="text" class="form-control form-control-lg form-control-a" placeholder="Keyword">
                        </div>
                    </div>
                    <div class="col-md-12">
                        <button type="submit" class="btn btn-b">Search Property</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <!--/ Form Search End /-->

    <c:import url="/WEB-INF/views/includes/navigation.jsp" />
    <!--/ Intro Single star /-->
    <section class="intro-single">
        <div class="container">
            <div class="row">
                <div class="col-md-12 col-lg-8">
                    <div class="title-single-box">
                        <h1 class="title-single">${product.name}</h1>
                        <span class="color-text-a">code : ${product.code}</span>
                    </div>
                </div>
                <div class="col-md-12 col-lg-4">
                    <nav aria-label="breadcrumb" class="breadcrumb-box d-flex justify-content-lg-end">
                        <span>
                            ${product.completeCategory}
                        </span>
                    </nav>
                </div>
            </div>
        </div>
    </section>
    <!--/ Intro Single End /-->

    <!--/ Agent Single Star /-->
        <div class="container">
            <div class="row">
                <div class="col-sm-12">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="agent-avatar-box" style="height:85%;">
           
                                <img src="${cdnUrl}/${product.productImages[0].imagePath}" alt="" class="agent-avatar img-fluid" style="width:100%; height:100%;">
                            </div>
                        </div>
                        <div class="col-md-5 section-md-t3">
                            <div class="agent-info-box">
                                <div class="agent-title">
                                    <div class="title-box-d">
                                        <h3 class="title-d ml-3" >${product.name}</h3>
                                    </div>
                                </div>
                                <div class="mb-3">
                                    <p class="content-d color-text-a ml-3">
                                        ${product.description}
                                    </p>
                                        <div class="row mt-3 ml-3">
                                            <strong>Price: </strong>
                                            <span class="color-text-a span-price ml-5" id="price">${product.consumerPrice}원</span>
                                        </div>
                                        <div class="row mt-3 ml-3">
                                            <strong>Code: </strong>
                                            <span class="color-text-a span-code ml-5"> ${product.code}</span>
                                        </div>
                                        <c:forEach items="${product.options}" var="option" varStatus="index">
                                        <div class="row mt-3 ml-3">
                                            <strong>${option.optionKey}: </strong>
                                            <select class="form-control option-select">
                                            	<option value="default">${option.optionKey}선택</option>
                                            <c:forEach items="${fn:split(option.optionValues,'/')}" var="optionValue">
                                                <option value="${optionValue}">${optionValue}</option>
                                            </c:forEach>
                                            </select>
                                        </div>
                                        </c:forEach>
                                </div>
                                <div>
                                    <hr class="three">
                                    <div id="totalProducts" >
                                        <table border="1" summary="" class="table mt-2" style="text-align: center; border: none;">
                                            <tbody class="added-option" id="added-option" style="border: none;">
                                            </tbody>
                                            <tfoot>
                                                <tr>
                                                    <td colspan="3">
                                                    <div class="row">
                                                    	
                                                        <span class="ml-2 col-3"><strong>TOTAL : </strong></span>
                                                        <div class="col-4"></div>
                                                        <input class="form-control text-center col-3 ml-2" value="0" id="totalPrice" readonly="readonly" type="text"/>
                                                        <span>원</span>
                                                    </div>
                                                    </td>
                                                </tr>
                                            </tfoot>
                                        </table>
                                    </div>
                                </div>
                            </div>
                            <div class="row cart-buy-btn" >
                            <div class="col-6">
                            	<button class="btn btn-warning btn-lg cart-btn" id="cart-btn" name="cart-btn">장바구니담기</button>
                            </div>
                            <div class="col-6">
                            	<button class="btn btn-success btn-lg buy-btn" id="buy-btn">바로구매</button>
                           	</div>
                            </div>
                            
                        </div>
                    </div>
                </div>
                <div class="col-md-12 section-t8">
                    <div class="title-box-d">
                        <h3 class="title-d">상품 이미지</h3>
                    </div>
                </div>
                <div class="row property-grid grid">
                    <div class="col-sm-12">
                        <div class="grid-option">
                            <form>
                                <select class="custom-select">
                                    <option selected>All</option>
                                    <option value="1">New to Old</option>
                                    <option value="2">For Rent</option>
                                    <option value="3">For Sale</option>
                                </select>
                            </form>
                        </div>
                    </div>
                    <c:forEach items="${product.productImages}" var="productImage">
					<c:choose>
					<c:when test="${productImage.mainImageCheck!='Y'}">
                    <div class="container">
                        <div class="img-box-a">
                            <img src="${cdnUrl}/${productImage.imagePath}" alt="" class="img-a img-fluid w-100">
                        </div>
                    </div>
                    </c:when>
                    </c:choose>
                    </c:forEach>
                    
                </div>
            </div>
        </div>

    <!--/ footer Star /-->
    <section class="section-footer">
        <div class="container">
            <div class="row">
                <div class="col-sm-12 col-md-4">
                    <div class="widget-a">
                        <div class="w-header-a">
                            <h3 class="w-title-a text-brand">EstateAgency</h3>
                        </div>
                        <div class="w-body-a">
                            <p class="w-text-a color-text-a">
                                Enim minim veniam quis nostrud exercitation ullamco laboris nisi ut aliquip exea commodo consequat duis
                                sed aute irure.
                            </p>
                        </div>
                        <div class="w-footer-a">
                            <ul class="list-unstyled">
                                <li class="color-a">
                                    <span class="color-text-a">Phone .</span> contact@example.com</li>
                                <li class="color-a">
                                    <span class="color-text-a">Email .</span> +54 356 945234</li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-sm-12 col-md-4 section-md-t3">
                    <div class="widget-a">
                        <div class="w-header-a">
                            <h3 class="w-title-a text-brand">The Company</h3>
                        </div>
                        <div class="w-body-a">
                            <div class="w-body-a">
                                <ul class="list-unstyled">
                                    <li class="item-list-a">
                                        <i class="fa fa-angle-right"></i> <a href="#">Site Map</a>
                                    </li>
                                    <li class="item-list-a">
                                        <i class="fa fa-angle-right"></i> <a href="#">Legal</a>
                                    </li>
                                    <li class="item-list-a">
                                        <i class="fa fa-angle-right"></i> <a href="#">Agent Admin</a>
                                    </li>
                                    <li class="item-list-a">
                                        <i class="fa fa-angle-right"></i> <a href="#">Careers</a>
                                    </li>
                                    <li class="item-list-a">
                                        <i class="fa fa-angle-right"></i> <a href="#">Affiliate</a>
                                    </li>
                                    <li class="item-list-a">
                                        <i class="fa fa-angle-right"></i> <a href="#">Privacy Policy</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-12 col-md-4 section-md-t3">
                    <div class="widget-a">
                        <div class="w-header-a">
                            <h3 class="w-title-a text-brand">International sites</h3>
                        </div>
                        <div class="w-body-a">
                            <ul class="list-unstyled">
                                <li class="item-list-a">
                                    <i class="fa fa-angle-right"></i> <a href="#">Venezuela</a>
                                </li>
                                <li class="item-list-a">
                                    <i class="fa fa-angle-right"></i> <a href="#">China</a>
                                </li>
                                <li class="item-list-a">
                                    <i class="fa fa-angle-right"></i> <a href="#">Hong Kong</a>
                                </li>
                                <li class="item-list-a">
                                    <i class="fa fa-angle-right"></i> <a href="#">Argentina</a>
                                </li>
                                <li class="item-list-a">
                                    <i class="fa fa-angle-right"></i> <a href="#">Singapore</a>
                                </li>
                                <li class="item-list-a">
                                    <i class="fa fa-angle-right"></i> <a href="#">Philippines</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <footer>
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <nav class="nav-footer">
                        <ul class="list-inline">
                            <li class="list-inline-item">
                                <a href="#">Home</a>
                            </li>
                            <li class="list-inline-item">
                                <a href="#">About</a>
                            </li>
                            <li class="list-inline-item">
                                <a href="#">Property</a>
                            </li>
                            <li class="list-inline-item">
                                <a href="#">Blog</a>
                            </li>
                            <li class="list-inline-item">
                                <a href="#">Contact</a>
                            </li>
                        </ul>
                    </nav>
                    <div class="socials-a">
                        <ul class="list-inline">
                            <li class="list-inline-item">
                                <a href="#">
                                    <i class="fa fa-facebook" aria-hidden="true"></i>
                                </a>
                            </li>
                            <li class="list-inline-item">
                                <a href="#">
                                    <i class="fa fa-twitter" aria-hidden="true"></i>
                                </a>
                            </li>
                            <li class="list-inline-item">
                                <a href="#">
                                    <i class="fa fa-instagram" aria-hidden="true"></i>
                                </a>
                            </li>
                            <li class="list-inline-item">
                                <a href="#">
                                    <i class="fa fa-pinterest-p" aria-hidden="true"></i>
                                </a>
                            </li>
                            <li class="list-inline-item">
                                <a href="#">
                                    <i class="fa fa-dribbble" aria-hidden="true"></i>
                                </a>
                            </li>
                        </ul>
                    </div>
                    <div class="copyright-footer">
                        <p class="copyright color-text-a">
                            &copy; Copyright
                            <span class="color-a">EstateAgency</span> All Rights Reserved.
                        </p>
                    </div>
                    <div class="credits">
                        <!--
              All the links in the footer should remain intact.
              You can delete the links only if you purchased the pro version.
              Licensing information: https://bootstrapmade.com/license/
              Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/buy/?theme=EstateAgency
            -->
                        Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
                    </div>
                </div>
            </div>
        </div>
    </footer>
    <!--/ Footer End /-->

    <a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>
    <div id="preloader"></div>
	
    <!-- JavaScript Libraries -->
    <script src="${pageContext.request.contextPath}/assets/lib/jquery/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/lib/jquery/jquery-migrate.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/lib/popper/popper.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/lib/easing/easing.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/lib/owlcarousel/owl.carousel.min.js"></script>
    <!-- Template Main Javascript File -->
    <script src="${pageContext.request.contextPath}/assets/js/main.js"></script>

</body>

</html>