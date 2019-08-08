<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
            <%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
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
                            .ion-ios-arrow-forward .product-des-span {
                                color: white;
                            }
                        </style>
                    </head>

                    <body>
                    	<c:import url="/WEB-INF/views/includes/searchform.jsp" />
                        <c:import url="/WEB-INF/views/includes/navigation.jsp" />
                        
                        <!--/ Carousel Star /-->
                        <div class="intro intro-carousel">

                            <div id="carousel" class="owl-carousel owl-theme">
                                <div class="carousel-item-a intro-item bg-image" style="background-image: url(${pageContext.request.contextPath}/assets/img/main1.jpg)">
                                    <div class="overlay overlay-a"></div>
                                    <div class="intro-content display-table">
                                        <div class="table-cell">
                                            <div class="container">
                                                <div class="row">
                                                    <div class="col-lg-8">
                                                        <div class="intro-body">
                                                            <p class="intro-title-top">
                                                                Doral, Florida
                                                                <br> 78345
                                                            </p>
                                                            <h1 class="intro-title mb-4">
											<span class="color-b">204 </span> Mount <br> Olive Road
											Two
											</h1>
                                                            <p class="intro-subtitle intro-price">
                                                                <a href="#"><span class="price-a">rent | $ 12.000</span></a>
                                                            </p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="carousel-item-a intro-item bg-image" style="background-image: url(${pageContext.request.contextPath}/assets/img/main2.jpg)">
                                    <div class="overlay overlay-a"></div>
                                    <div class="intro-content display-table">
                                        <div class="table-cell">
                                            <div class="container">
                                                <div class="row">
                                                    <div class="col-lg-8">
                                                        <div class="intro-body">
                                                            <p class="intro-title-top">
                                                                Doral, Florida
                                                                <br> 78345
                                                            </p>
                                                            <h1 class="intro-title mb-4">
											<span class="color-b">204 </span> Rino <br> Venda Road
											Five
										</h1>
                                                            <p class="intro-subtitle intro-price">
                                                                <a href="#"><span class="price-a">rent | $ 12.000</span></a>
                                                            </p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="carousel-item-a intro-item bg-image" style="background-image: url(${pageContext.request.contextPath}/assets/img/main1.jpg)">
                                    <div class="overlay overlay-a"></div>
                                    <div class="intro-content display-table">
                                        <div class="table-cell">
                                            <div class="container">
                                                <div class="row">
                                                    <div class="col-lg-8">
                                                        <div class="intro-body">
                                                            <p class="intro-title-top">
                                                                Doral, Florida
                                                                <br> 78345
                                                            </p>
                                                            <h1 class="intro-title mb-4">
											<span class="color-b">204 </span> Mount <br> Olive Road
											Two
										</h1>
                                                            <p class="intro-subtitle intro-price">
                                                                <a href="#"><span class="price-a">rent | $ 12.000</span></a>
                                                            </p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="carousel-item-a intro-item bg-image" style="background-image: url(${pageContext.request.contextPath}/assets/img/main3.jpg)">
                                    <div class="overlay overlay-a"></div>
                                    <div class="intro-content display-table">
                                        <div class="table-cell">
                                            <div class="container">
                                                <div class="row">
                                                    <div class="col-lg-8">
                                                        <div class="intro-body">
                                                            <p class="intro-title-top">
                                                                Doral, Florida
                                                                <br> 78345
                                                            </p>
                                                            <h1 class="intro-title mb-4">
											<span class="color-b">204 </span> Alira <br> Roan Road
											One
										</h1>
                                                            <p class="intro-subtitle intro-price">
                                                                <a href="#"><span class="price-a">rent | $ 12.000</span></a>
                                                            </p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--/ Carousel end /-->

                        <!--/ Property Star /-->
                        <section class="section-property section-t8">
                            <div class="container">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="title-wrap d-flex justify-content-between">
                                            <div class="title-box">
                                                <h2 class="title-a">이달의 상품</h2>
                                            </div>
                                            <div class="title-link">
                                                <a href="property-grid.html">모두 보기 <span
								class="ion-ios-arrow-forward"></span>
							</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div id="property-carousel" class="owl-carousel owl-theme main-product-image">

                                    <c:forEach items="${productList}" var="product">
                                    <a href="${pageContext.request.contextPath}/product/detail?productNo=${product.no}" class="link-a">
                                    <div>
                                        <div class="carousel-item-b ">

                                            <div class="card-box-a card-shadow">
												
                                                	<div class="img-box-a">
                                                        <img src="${cdnUrl}/${product.mainImage}" class="img-a img-fluid">
                                                	</div>
												
                                                <div class="card-overlay">
                                                    <div class="card-overlay-a-content">
                                                        <div class="card-header-a">
                                                            <h2 class="card-title-a">
												${product.name}
											</h2>
                                                        </div>
                                                        <div class="card-body-a">
                                                            <div class="price-box d-flex">
                                                                <span class="price-a">${product.consumerPrice}원</span>
                                                            </div>

                                                            <span class="ion-ios-arrow-forward product-des-span">${product.description}</span>

                                                        </div>
                                                        <div class="card-footer-a">
                                                            <ul class="card-info d-flex justify-content-around">
                                                                <li>
                                                                    <h4 class="card-info-title">Area</h4> <span>340m <sup>2</sup>
												</span>
                                                                </li>
                                                                <li>
                                                                    <h4 class="card-info-title">Beds</h4> <span>2</span>
                                                                </li>
                                                                <li>
                                                                    <h4 class="card-info-title">Baths</h4> <span>4</span>
                                                                </li>
                                                                <li>
                                                                    <h4 class="card-info-title">Garages</h4> <span>1</span>
                                                                </li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                        </div>
                                        </div>
                                        </a>
                                    </c:forEach>
                                </div>

                            </div>
                        </section>
                        <!--/ Property End /-->

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
                                                <p class="w-text-a color-text-a">Enim minim veniam quis nostrud exercitation ullamco laboris nisi ut aliquip exea commodo consequat duis sed aute irure.</p>
                                            </div>
                                            <div class="w-footer-a">
                                                <ul class="list-unstyled">
                                                    <li class="color-a"><span class="color-text-a">Phone
										.</span> contact@example.com</li>
                                                    <li class="color-a"><span class="color-text-a">Email
										.</span> +54 356 945234</li>
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
                                                        <li class="item-list-a"><i class="fa fa-angle-right"></i>
                                                            <a href="#">Site Map</a></li>
                                                        <li class="item-list-a"><i class="fa fa-angle-right"></i>
                                                            <a href="#">Legal</a></li>
                                                        <li class="item-list-a"><i class="fa fa-angle-right"></i>
                                                            <a href="#">Agent Admin</a></li>
                                                        <li class="item-list-a"><i class="fa fa-angle-right"></i>
                                                            <a href="#">Careers</a></li>
                                                        <li class="item-list-a"><i class="fa fa-angle-right"></i>
                                                            <a href="#">Affiliate</a></li>
                                                        <li class="item-list-a"><i class="fa fa-angle-right"></i>
                                                            <a href="#">Privacy Policy</a></li>
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
                                                    <li class="item-list-a"><i class="fa fa-angle-right"></i> <a href="#">Venezuela</a></li>
                                                    <li class="item-list-a"><i class="fa fa-angle-right"></i> <a href="#">China</a></li>
                                                    <li class="item-list-a"><i class="fa fa-angle-right"></i> <a href="#">Hong Kong</a></li>
                                                    <li class="item-list-a"><i class="fa fa-angle-right"></i> <a href="#">Argentina</a></li>
                                                    <li class="item-list-a"><i class="fa fa-angle-right"></i> <a href="#">Singapore</a></li>
                                                    <li class="item-list-a"><i class="fa fa-angle-right"></i> <a href="#">Philippines</a></li>
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
                                                <li class="list-inline-item"><a href="#">Home</a></li>
                                                <li class="list-inline-item"><a href="#">About</a></li>
                                                <li class="list-inline-item"><a href="#">Property</a></li>
                                                <li class="list-inline-item"><a href="#">Blog</a></li>
                                                <li class="list-inline-item"><a href="#">Contact</a></li>
                                            </ul>
                                        </nav>
                                        <div class="socials-a">
                                            <ul class="list-inline">
                                                <li class="list-inline-item">
                                                    <a href="#"> <i class="fa fa-facebook" aria-hidden="true"></i>
                                                    </a>
                                                </li>
                                                <li class="list-inline-item">
                                                    <a href="#"> <i class="fa fa-twitter" aria-hidden="true"></i>
                                                    </a>
                                                </li>
                                                <li class="list-inline-item">
                                                    <a href="#"> <i class="fa fa-instagram" aria-hidden="true"></i>
                                                    </a>
                                                </li>
                                                <li class="list-inline-item">
                                                    <a href="#"> <i class="fa fa-pinterest-p" aria-hidden="true"></i>
                                                    </a>
                                                </li>
                                                <li class="list-inline-item">
                                                    <a href="#"> <i class="fa fa-dribbble" aria-hidden="true"></i>
                                                    </a>
                                                </li>
                                            </ul>
                                        </div>
                                        <div class="copyright-footer">
                                            <p class="copyright color-text-a">
                                                &copy; Copyright <span class="color-a">EstateAgency</span> All Rights Reserved.
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

                        <!-- Contact Form JavaScript File -->
                        <script src="${pageContext.request.contextPath}/assets/js/contactform.js"></script>

                        <!-- Template Main Javascript File -->
                        <script src="${pageContext.request.contextPath}/assets/js/main.js"></script>

                    </body>

                    </html>