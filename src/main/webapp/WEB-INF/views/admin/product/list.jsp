<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<spring:eval expression="@propertyConfigurer['cdnUrl']" var="cdnUrl" />


<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <html lang="en">
  
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
</head>

<body>

	<c:import url="/WEB-INF/views/admin/includes/navigation.jsp" />
	
    <div class="content-wrapper">
      <div class="container">

        <!-- DataTables Example -->
        <div class="card mb-3">
          <div class="card-header">
            <i class="fas fa-table"></i>
            	상품목록</div>
          <div class="card-body">
              <table class="table" style="height: 100%; width: 100%; text-align:center;"  cellspacing="0">
                <thead>
                  <tr>
                  	<th>
                  		<div>
                    		<p>대표이미지</p>
                    	</div>
                  	</th>
                    <th>
                    	<div>
                    		<p>상품명</p>
                    	</div>
                    </th>
                    <th>
                    	<div>
                    		<p>판매가</p>
                    	</div>
                    </th>
                    <th width="10%">
                    	<div>
                    		<p>진열상태</p>
                    	</div>
                    </th>
                    <th width="10%">
                    	<div>
                    		<p>판매상태</p>
                    	</div>
                    </th>
                    <th>
                    	<div>
                    		<p>상품분류</p>
                    	</div>
                    </th>
                    <th>
                    	<div>
                    		<p>상품등록일</p>
                    	</div>
                    </th>
                    <th></th>
                  </tr>
                </thead>
                
                <tbody id="product-tbody">
                <c:forEach items="${productList}" var="product">
                  <tr>
                  	<td>
	                  	<a href="#">
    	              		<img alt="상품이미지" src="${cdnUrl}/${product.mainImage}" style="width: 100px; height: 120px;">
                  		</a>
                  	</td>
                    	<td>
                    	<div class="mt-5" style="padding: 5px;">
                    		<p>${product.name}</p>
                    	</div>
                    	</td>
                    
                    <td>
	                    <div class="mt-5" style="padding: 5px;">
	                    		<p>${product.consumerPrice}</p>
	                    </div>
                    </td>
                    <td>
                    
	                    <div class="mt-5" style="padding: 5px;">
	                    	<p>${product.displayCheck}</p>
	                    </div>
                    </td>
                    <td>
                    	<div class="mt-5" style="padding: 5px;">
	                    	<p>${product.saleCheck}</p>
	                    </div>
                    </td>
                    <td>
                    	<div class="mt-5" style="padding: 5px;">
	                    	<p> ${product.completeCategory}</p>
	                    </div>
                    </td>
                    <td>
                    	<div class="mt-5" style="padding: 5px;">
	                    	<p>${product.regDate}</p>
	                    </div>
                    </td>
                    <td>
                    	<div class="mt-5" style="padding: 5px;">
			                <a href="${pageContext.request.contextPath}/admin/product/remove?productNo=${product.no}">
	        	            	<button class="btn btn-danger form-control">상품삭제</button>
	    	                </a>
    	                </div>
                    </td>
                  </tr>
                </c:forEach>
                </tbody>
                
                <tfoot>
                 <tr>
                  	<th>
                  		<div">
                    		<p>상품이미지</p>
                    	</div>
                  	</th>
                    <th>
                    	<div>
                    		<p>상품명</p>
                    	</div>
                    </th>
                    <th>
                    	<div>
                    		<p>판매가</p>
                    	</div>
                    </th>
                    <th width="10%">
                    	<div>
                    		<p>진열상태</p>
                    	</div>
                    </th>
                    <th width="10%">
                    	<div>
                    		<p>판매상태</p>
                    	</div>
                    </th>
                    <th>
                    	<div>
                    		<p>상품분류</p>
                    	</div>
                    </th>
                    <th>
                    	<div>
                    		<p>상품등록일</p>
                    	</div>
                    </th>
                    <th></th>
                  </tr>
                </tfoot>
              </table>
          </div>
          
          <div class="row">
          	<div class="col-9 mr-3"></div>
          	<div class="col-1 ml-2 mb-3">
          	<a href="${pageContext.request.contextPath}/admin/product/register">
          		<button class="btn btn-success btn-lg"><strong>상품 추가하기</strong></button>
          	</a>
          	</div>
          	
          </div>
          
          <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
        </div>
		
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

</body>

</html>
