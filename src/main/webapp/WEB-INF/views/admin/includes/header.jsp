<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	<c:choose>
		<c:when test='${empty authAdmin}'>
			<li style="list-style: none;" class="header-li"><a href="${pageContext.servletContext.contextPath}/admin/user/login">로그인</a></li>
		</c:when>
		<c:otherwise>
			<li style="list-style: none;" class="header-li"><a href="${pageContext.servletContext.contextPath}/admin/user/logout">로그아웃</a></li>
		</c:otherwise>
	</c:choose>
