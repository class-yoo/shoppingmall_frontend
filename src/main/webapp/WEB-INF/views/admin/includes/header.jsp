<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	<c:choose>
		<c:when test='${empty authUser}'>
			<li style="list-style: none;" class="header-li"><a href="${pageContext.servletContext.contextPath}/user/login">로그인</a></li>
			<li style="list-style: none; margin-left: 20px;" class="header-li"><a href="${pageContext.servletContext.contextPath}/user/join">회원가입</a></li>
		</c:when>
		<c:otherwise>
			<li style="list-style: none;" class="header-li"><a href="${pageContext.servletContext.contextPath}/user/logout">로그아웃</a></li>
			<li style="list-style: none; margin-left: 20px;" class="header-li"><a href="${pageContext.servletContext.contextPath}/cart/list">장바구니</a></li>
		</c:otherwise>
	</c:choose>
