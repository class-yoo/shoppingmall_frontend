<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<spring:eval expression="@propertyConfigurer['cdnUrl']" var="cdnUrl" />


<!DOCTYPE html>
<html lang="en">

<head>
<!-- Bootstrap -->
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<!-- Favicons -->
<link href="${pageContext.request.contextPath}/assets/img/favicon.png"
	rel="icon">
<link
	href="${pageContext.request.contextPath}/assets/img/apple-touch-icon.png"
	rel="apple-touch-icon">

<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700"
	rel="stylesheet">

<!-- Bootstrap CSS File -->
<link
	href="${pageContext.request.contextPath}/assets/lib/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Libraries CSS Files -->
<link
	href="${pageContext.request.contextPath}/assets/lib/font-awesome/css/font-awesome.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/assets/lib/animate/animate.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/assets/lib/ionicons/css/ionicons.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/assets/lib/owlcarousel/assets/owl.carousel.min.css"
	rel="stylesheet">
<!-- Main Stylesheet File -->
<link href="${pageContext.request.contextPath}/assets/css/style.css"
	rel="stylesheet">

<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <!------ Include the above in your HEAD tag ---------->

<style type="text/css">
.root-container {
	margin-top: 180px;
}

.complete-option-tr td {
	border: solid 0.8px;
}
.product-tb th{
	width: 10%;
}

#mainImage{
	height: 250px;
	width: 350px;
}

.image-div img{
	height: 80px;
	width: 100px;
}

</style>


<script type="text/javascript">

$(function() {
    $('#mainImageUpload').change(function(){
        var file_data = $('#mainImageUpload').prop('files')[0];
        var form_data = new FormData();
        form_data.append('imageFile', file_data); 
        
        $.ajax({
            url: "${cdnUrl}/image/save",
            type: "post",
            data: form_data,
            dataType: 'json',
            enctype: 'multipart/form-data',
            contentType: false,
            processData:false,
            success: function(response){ 
            	$("#mainImage").attr('src', "${cdnUrl}/"+response.data)
            }
        });
    });
    
    $('#multipleImageUpload').change(function(){
    	//이미지 개수 세서 10개이상이면 return 시키는 코드 추가예정
    	
    	var multipleFileData = $('#multipleImageUpload').prop('files');
    	
    	for(var i=0 ; i<multipleFileData.length; i++){
    		var file_data = multipleFileData[i];
    		var form_data = new FormData();
    		form_data.append('imageFile', file_data);
    		$.ajax({
                url: "${cdnUrl}/image/save",
                type: "post",
                data: form_data,
                dataType: 'json',
                enctype: 'multipart/form-data',
                contentType: false,
                processData:false,
                success: function(response){
                	var $img = $('<img class="product-img ml-2 mb-2" id=image name="image" alt="이미지" src="'+
                			'${cdnUrl}'+'/'+response.data+'">' );
                	console.log(response.data);
                	$("#image-div").append($img);
                }
            });
    	}
        
    });
    
    
    
});
</script>
</head>

<body>


	<c:import url="/WEB-INF/views/includes/navigation.jsp" />

	<div class="container root-container">
		<div class="row-fluid">
			<div class="span3" id="sidebar"></div>

			<!--/span-->
			<div class="span9" id="content">
				<div class="row-fluid">
					<div class="alert alert-success">
						<button type="button" class="close" data-dismiss="alert">&times;</button>
						<h4>상품 등록</h4>
					</div>
				</div>

				<div>
					<form action="MacaronicsServlet?command=admin_product_write"
						method="post" enctype="multipart/form-data" name="form1">
						<div class="table-responsive">
							<table class="table product-tb">
								<tr>
									<th class="success">상품 분류(상위)</th>
									<td><select class="span6 m-wrap form-control" name="topCategory" id="topCategory">
											<%-- <c:forEach items="${kindList}" var="kind" varStatus="status"> --%>
												<option selected>선택</option>
												<option value="상의">상의</option>
												<option value="하의">하의</option>
												<option value="신발">신발</option>
											<%-- </c:forEach> --%>
									</select></td>
									<th class="success">상품 분류(중위)</th>
									<td><select class="span6 m-wrap form-control" name="midCategory" id="midCategory">
											<%-- <c:forEach items="${kindList}" var="kind" varStatus="status"> --%>
												<option selected>선택</option>
												<option value="자켓">자켓</option>
												<option value="셔츠">셔츠</option>
												<option value="티셔츠">티셔츠</option>
											<%-- </c:forEach> --%>
									</select></td>
									<th class="success">상품 분류(하위)</th>
									<td><select class="span6 m-wrap form-control" name="lowCategory" id="lowCategory">
											<%-- <c:forEach items="${kindList}" var="kind" varStatus="status"> --%>
												<option selected>선택</option>
												<option value="블레이저">블레이저</option>
												<option value="청자켓">청자켓</option>
												<option value="MA-1">MA-1</option>
											<%-- </c:forEach> --%>
									</select></td>								
								</tr>

								<tr>
									<th class="success" >상품코드</th>
									<td><input class="form-control" type="text" name="name"
										id="name"></td>
									<th class="success">상품명</th>
									<td><input class="form-control" type="text" name="code"
										id="code"></td>
										<th></th>
										<td></td>
								</tr>

								<tr>
									<th class="success">원가</th>
									<td><input class="form-control col-8" type="text"
										name="supplyPrice" id="supplyPrice" min="1000"></td>
									<th class="success">판매가</th>
									<td class="success"><input class="form-control col-8" type="text"
										name="consumerPrice" id="consumerPrice" onblur="go_ab()"
										min="1000"></td>
									<th class="success">마진</th>
									<td><input class="form-control col-8" type="text"
										name="price3" id="price3" readonly="readonly"></td>
								</tr>

								<tr>
									<th>전시여부</th>
									<td>
									<input class="form-control col-3" type="checkbox" id="displayCheck" name="displayCheck" />
									</td>
									<th>판매여부</th>
									<td>
									<input class="form-control col-3" type="checkbox" id="saleCheck" name="saleCheck" />
									</td>
								</tr>

								<tr>
									<th>옵션</th>
									<td colspan="5">
										<div>
											<table class="table"
												style="border: solid 1px; text-align: center;">
												<thead>
													<tr>
														<td width="40%" style="border: solid 0.8px;">옵션명</td>
														<td width="60%" style="border: solid 0.8px;">옵션값</td>

													</tr>
												</thead>
												<tr style="border-bottom: solid 0.8px;">
													<td>
														<div class="row">
															<input class="form-control col-8 ml-3 mb-2" type="text">
															<button
																class="btn btn-danger ml-3 mb-2 option-del-btn col-2"
																class="form-control">-</button>

															<button
																class="btn btn-success ml-3 option-add-btn col-2 mt-3"
																class="form-control">+</button>
														</div>
													</td>
													<td>
														<div class="row ml-3 option-value-div">
															<div class="row">
																<input class="form-control col-2 ml-3 mb-2" type="text">
																<button
																	class="btn btn-danger ml-3 mb-2 optionvalue-del-btn"
																	class="form-control">-</button>
																<input class="form-control col-2 ml-3 mb-2" type="text">
																<button
																	class="btn btn-danger ml-3 mb-2 optionvalue-del-btn"
																	class="form-control">-</button>
																<input class="form-control col-2 ml-3 mb-2" type="text">
																<button
																	class="btn btn-danger ml-3 mb-2 optionvalue-del-btn"
																	class="form-control">-</button>
																<button
																	class="btn btn-success ml-3 mb-2 optionvalue-add-btn"
																	class="form-control">+</button>
															</div>
														</div>
													</td>
												</tr>
												<tr>

												</tr>

											</table>
										</div>

										<div>
											<table class="table"
												style="border: solid 1px; text-align: center;">
												<thead>
													<tr class="complete-option-tr">
														<td width="40%">옵션(품목코드)</td>
														<td width="15%">추가금액</td>
														<td width="15%">재고관리</td>
														<td width="15%">재고수량</td>
														<td width="15%"></td>
													</tr>
												</thead>
												<tr>
													<td>
														<div>
															<input class="form-control" readonly="readonly"
																type="text">
														</div>
													</td>
													<td><input id=additional-fee-btn
														class="form-control col-12" type="text"></td>
													<td><input id="manage-stock-btn"
														class="form-control col-12 " type="checkbox"></td>
													<td><input class="form-control col-12 amount-text"
														type="text"></td>
													<td>
														<button class="btn btn-danger ml-3 option-add-btn"
															class="form-control">-</button>
													</td>
												</tr>

												<tr>
													<td>
														<div>
															<input class="form-control" readonly="readonly"
																type="text">
														</div>
													</td>
													<td><input id=additional-fee-btn
														class="form-control col-12" type="text"></td>
													<td><input id="manage-stock-btn"
														class="form-control col-12 " type="checkbox"></td>
													<td><input class="form-control col-12 amount-text"
														type="text"></td>
													<td>
														<button class="btn btn-danger ml-3 option-add-btn"
															class="form-control">-</button>
													</td>
												</tr>

												<tr>
													<td>
														<div>
															<input class="form-control" readonly="readonly"
																type="text">
														</div>
													</td>
													<td><input id=additional-fee-btn
														class="form-control col-12" type="text"></td>
													<td><input id="manage-stock-btn"
														class="form-control col-12 " type="checkbox"></td>
													<td><input class="form-control col-12 amount-text"
														type="text"></td>
													<td>
														<button class="btn btn-danger ml-3 option-add-btn"
															class="form-control">-</button>
													</td>
												</tr>

												<tr>
													<td>
														<div></div>
													</td>
													<td></td>
													<td></td>
													<td></td>
													<td>
														<button class="btn btn-success ml-3 option-add-btn"
															class="form-control">+</button>
													</td>
												</tr>
											</table>
										</div>
									</td>
								</tr>

								<tr>
									<th>상세설명</th>
									<td colspan="5"><textarea id="bootstrap-editor"
											style="width: 98%; height: 200px;" name="content"></textarea>
									</td>
								</tr>

								<tr>
									<th>상품 이미지</th>
									<td>
										<div col-12>
																		
										</div>
									</td>
									<td>
										<p>대표이미지</p>
										<div class="mainImage-div">
											<img id=mainImage name="mainImage" alt="대표이미지" src="">
										</div>
										<div class="mainImage-upload-div">
											<input id="mainImageUpload" type="file" name="mainImageUpload"/>
										</div>
									</td>
									<td style="border-left: solid;">
										<p>이미지 최대 10개</p>
										<div class="row image-div" id="image-div">
										</div>
										<input multiple="multiple"  id="multipleImageUpload" name="multipleImageUpload" type="file"/>
									</td>
								</tr>
							</table>
							
						</div>
						<div class="text-center mt-5">
							<input type="button" value="등록"
								class="btn btn-success btn-lg mr-5" onclick="productSubmit()">
							<input type="reset" value="취소" class="btn btn-danger btn-lg">
						</div>
					</form>

				</div>

			</div>
		</div>

	</div>
	<hr>


	<div style="margin-bottom: 150px;">&nbsp;</div>
	<!-- FOOTER -->
	<nav class="avbar navbar-inverse navbar-fixed-bottom"
		style="height: 50px; background-color: #000;">
		<div class="container text-center" style="color: #fff;">
			<p>&nbsp;</p>
			<p>
				<a href="http://macaronics.net/" style="color: #fff;">Macaronics.net</a>
			</p>
			<p>&nbsp;</p>
			<p>&nbsp;</p>
		</div>
	</nav>


	<!--/.fluid-container-->

	<script type="text/javascript">

		function go_ab() {

			var price1 = $("#price1").val();
			var price2 = $("#price2").val();
			if ($.trim(price2) <= $.trim(price1)) {
				alert("판매가는 원가 보다 작을 수 없습니다.");
				$("#price1").val("");
				$("#price2").val("");
				$("#price1").focus();

				return;
			}
			$("#price3").val(price2 - price1);

		}

		function productSubmit() {
			var name = $("#name").val();
			var price1 = $("#price1").val();
			var price2 = $("#price2").val();
			var content = $("content").val();

			if (name == "") {
				alert("상품명을 입력해 주세요.");
				$("#name").focus();
				return;
			}

			if (price1 == "") {
				alert("원가를 입력해 주세요.");
				$("#price1").focus();
				return;
			}

			if (price2 == "") {
				alert("판매가를 입력해 주세요.");
				$("#price2").focus();
				return;
			}
			
			if ($("#image").val() != "") {

				var ext = $('#image').val().split('.').pop().toLowerCase();
				if ($.inArray(ext, [ 'gif', 'png', 'jpg', 'jpeg' ]) == -1) {

					alert('gif,png,jpg,jpeg 파일만 업로드 할수 있습니다.');

					return;
				}

				document.form1.submit();
			} else {
				alert('이미지를 선택해 주세요');
				return;
			}

		}
	</script>


</body>

</html>