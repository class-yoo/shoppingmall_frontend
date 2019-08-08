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
        
    </style>
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
    <section class="agent-single">
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
                                        <h3 class="title-d" ml-3>${product.name}
                                    </div>
                                </div>
                                <div class="agent-content mb-3">
                                    <p class="content-d color-text-a ml-3">
                                        ${product.description}
                                    </p>
                                    <div class="info-agents color-a mt-1">
                                        <div class="row mt-3 ml-3">
                                            <strong>Price: </strong>
                                            <span class="color-text-a span-price ml-5">${product.consumerPrice}원 </span>
                                        </div>
                                        <div class="row mt-3 ml-3">
                                            <strong>Code: </strong>
                                            <span class="color-text-a span-code ml-5"> ${product.code}</span>
                                        </div>
                                        <c:forEach items="${product.options}" var="option" varStatus="">
                                        <div class="row mt-3 ml-3">
                                            <strong>${option.optionKey}: </strong>
                                            <select class="form-control" name="option">
                                            	<option selected>${option.optionKey}선택</option>
                                            <c:forEach items="${fn:split(option.optionValues,'/')}" var="optionValue">
                                                <option value="${code}">${optionValue}</option>
                                            </c:forEach>
                                            </select>
                                        </div>
                                        </c:forEach>
                                    </div>
                                </div>
                                <div class="socials-footer">
                                    <hr class="three">
                                    <div id="totalProducts" >
                                        <table border="1" summary="" class="table mt-2" style="text-align: center; border: none;">
                                            <tbody class="displaynone" style="border: none;">
                                                <tr style="border: none;">
                                                    <td width="30%">댄디자켓 <br> 블랙/M</td>
                                                    <td width="40%">
                                                    <div class="row product-div" style="">
		                                                    <div class="col-1">
		                                                    </div>
	                                                    	<div class="col-3 product-detail">
                                                            <input id="quantity" class="form-control" name="quantity_name" value="0" type="text" />
                                                            </div>
                                                            <div class="col-3 product-detail qtt-up-down">
                                                            <img src="//img.echosting.cafe24.com/design/skin/default/product/btn_count_up.gif" alt="수량증가" class="QuantityUp up" />
                                                            <img src="//img.echosting.cafe24.com/design/skin/default/product/btn_count_down.gif" alt="수량감소" class="QuantityDown down" />
                                                            </div>
                                                            <div class="col-3 product-detail del-btn">
                                                    <a href="#none"><img src="https://img.echosting.cafe24.com/skin/base_ko_KR/product/btn_price_delete.gif" alt="삭제" class="option_box_del" /></a>
                                                    </div>
                                                    </div>
                                                    
                                                    </td>
                                                    <td class="right">
                                                        <span class="quantity_price">${product.consumerPrice}원</span></span>
                                                    </td>
                                                </tr>
                                            </tbody>
                                            <tfoot>
                                                <tr>
                                                    <td colspan="3">
                                                        <strong>TOTAL </strong>(QUANTITY) : <span class="total"><strong><em>0</em></strong> (0개)</span>
                                                    </td>
                                                </tr>
                                            </tfoot>
                                        </table>
                                    </div>
                                </div>
                            </div>
                            <div class="row cart-buy-btn" >
                            <div class="col-6">
                            	<button class="btn btn-warning btn-lg cart-btn" id="cart-btn">장바구니담기</button>
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
                        <div class="card-overlay">
                        </div>
                    </div>
                    </c:when>
                    </c:choose>
                    </c:forEach>
                    
                </div>
            </div>
        </div>
        </div>
    </section>
    <!--/ Agent Single End /-->

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
    <script src="${pageContext.request.contextPath}/assets/lib/bootstrap/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/lib/easing/easing.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/lib/scrollreveal/scrollreveal.min.js"></script>
    <!-- Template Main Javascript File -->
    <script src="${pageContext.request.contextPath}/assets/js/main.js"></script>

</body>

</html>