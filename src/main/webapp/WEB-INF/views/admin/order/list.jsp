<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


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
            	고객목록</div>
          <div class="card-body">
              <table class="table" style="height: 100%; width: 100%; text-align:center;"  cellspacing="0">
                <thead>
                  <tr>
                  	<th>
                  		<div>
                    		<p>번호</p>
                    	</div>
                  	</th>
                    <th>
                    	<div>
                    		<p>주문자명</p>
                    	</div>
                    </th>
                    <th>
                    	<div>
                    		<p>제목</p>
                    	</div>
                    </th>
                    <th>
                    	<div>
                    		<p>주문상태</p>
                    	</div>
                    </th>
                    <th>
                    	<div>
                    		<p>주문날짜</p>
                    	</div>
                    </th>
                  </tr>
                </thead>
                
                <tbody id="product-tbody">
                <c:forEach items="${orderList}" var="order" varStatus="status">
                  <tr>
                    <td>
	                    <div class="mt-2" style="padding: 5px;">
	                    		<p>${status.count}</p>
	                    </div>
                    </td>
                    <td>
	                    <div class="mt-2" style="padding: 5px;">
	                    	<p>${order.receiver}</p>
	                    </div>
                    </td>
                    <td>
                    	<div class="mt-2" style="padding: 5px;">
	                    	<p>${order.title}</p>
	                    </div>
                    </td>
                    <td>
                    	<div class="mt-2" style="padding: 5px;">
	                    	<p> ${order.orderStatus}</p>
	                    </div>
                    </td>
                    <td>
                    	<div class="mt-2" style="padding: 5px;">
			                <p> ${order.orderDate}</p>
    	                </div>
                    </td>
                  </tr>
                </c:forEach>
                </tbody>
                
                <tfoot>
                 <tr>
                  	<th>
                  		<div>
                    		<p>번호</p>
                    	</div>
                  	</th>
                    <th>
                    	<div>
                    		<p>주문자명</p>
                    	</div>
                    </th>
                    <th>
                    	<div>
                    		<p>제목</p>
                    	</div>
                    </th>
                    <th>
                    	<div>
                    		<p>주문상태</p>
                    	</div>
                    </th>
                    <th>
                    	<div>
                    		<p>주문날짜</p>
                    	</div>
                    </th>
                  </tr>
                </tfoot>
              </table>
          </div>
          
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
