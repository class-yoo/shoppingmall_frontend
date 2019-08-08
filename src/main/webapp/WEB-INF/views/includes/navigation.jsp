<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript" src="${pageContext.servletContext.contextPath}/assets/js/jquery/jquery-1.9.0.js"></script>

<!--/ Nav Star /-->
  <nav class="navbar navbar-default navbar-trans navbar-expand-lg fixed-top">
    <div class="container">
      <button class="navbar-toggler collapsed" type="button" data-toggle="collapse" data-target="#navbarDefault"
        aria-controls="navbarDefault" aria-expanded="false" aria-label="Toggle navigation">
        <span></span>
        <span></span>
        <span></span>
      </button>
      <a class="navbar-brand text-brand" href="${pageContext.request.contextPath}">efaC<span class="color-b">Shop</span></a>
      <button type="button" class="btn btn-link nav-search navbar-toggle-box-collapse d-md-none" data-toggle="collapse"
        data-target="#navbarTogglerDemo01" aria-expanded="false">
        <span class="fa fa-search" aria-hidden="true"></span>
      </button>
      <div class="navbar-collapse collapse justify-content-center" id="navbarDefault">
        <ul class="navbar-nav">
          <li class="nav-item">
            <a class="nav-link" href="index.html">세일</a>
          </li>
          
          <li class="nav-item">
            <a class="nav-link" href="about.html">인기상품</a>
          </li>
          
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown"
              aria-haspopup="true" aria-expanded="false">
              	탑
            </a>
            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
              <a class="dropdown-item" href="property-single.html">반팔티</a>
              <a class="dropdown-item" href="blog-single.html">프린팅티</a>
              <a class="dropdown-item" href="agents-grid.html">나시</a>
              <a class="dropdown-item" href="agent-single.html">맨투맨 & 후드티</a>
              <a class="dropdown-item" href="agent-single.html">긴발티</a>
              <a class="dropdown-item" href="agent-single.html">니트</a>
            </div>
          </li>
          
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown"
              aria-haspopup="true" aria-expanded="false">
              	팬츠
            </a>
            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
              <a class="dropdown-item" href="property-single.html">반바지</a>
              <a class="dropdown-item" href="blog-single.html">슬랙스</a>
              <a class="dropdown-item" href="agents-grid.html">면바지</a>
              <a class="dropdown-item" href="agent-single.html">청바지</a>
            </div>
          </li>
          
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown"
              aria-haspopup="true" aria-expanded="false">
              	셔츠
            </a>
            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
              <a class="dropdown-item" href="property-single.html">스트라이프</a>
              <a class="dropdown-item" href="blog-single.html">베이직</a>
              <a class="dropdown-item" href="agents-grid.html">헨리넥 & 차이나</a>
              <a class="dropdown-item" href="agent-single.html">청남방</a>
              <a class="dropdown-item" href="agent-single.html">체크 & 패턴</a>
            </div>
          </li>
			
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown"
              aria-haspopup="true" aria-expanded="false">
              	아우터
            </a>
            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
              <a class="dropdown-item" href="property-single.html">자켓</a>
              <a class="dropdown-item" href="blog-single.html">수트</a>
              <a class="dropdown-item" href="agents-grid.html">블루종 & MA-1</a>
              <a class="dropdown-item" href="agent-single.html">가디건 & 조끼</a>
              <a class="dropdown-item" href="agent-single.html">후드 & 집업</a>
            </div>
          </li>
          
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown"
              aria-haspopup="true" aria-expanded="false">
              	신발
            </a>
            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
              <a class="dropdown-item" href="property-single.html">스니커즈</a>
              <a class="dropdown-item" href="agent-single.html">운동화</a>
              <a class="dropdown-item" href="blog-single.html">슬리퍼</a>
              <a class="dropdown-item" href="agents-grid.html">구두</a>
              
            </div>
          </li>
          
        </ul>
        
      </div>
     	
      <c:import url="/WEB-INF/views/includes/header.jsp" />
      
      <button type="button" class="btn btn-b-n navbar-toggle-box-collapse d-none d-md-block" data-toggle="collapse"
        data-target="#navbarTogglerDemo01" aria-expanded="false" style="margin-left: 20px;">
        <span class="fa fa-search" aria-hidden="true"></span>
      </button>
    </div>
  </nav>