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
    <!------ Include the above in your HEAD tag ---------->

    <style type="text/css">
        .root-container {
            margin-top: 180px;
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
        	
       	/*라벨은 원하는대로 커스텀하고*/

		.fileRegiBtn label {
			display: inline-block; 
			padding: .5em .75em; 
			color: #ffffff; 
			font-size: inherit; 
			line-height: normal; 
			vertical-align: middle; 
			background-color: #28A745; 
			cursor: pointer; 
			border: 1px solid #ebebeb; 
			border-bottom-color: #e2e2e2; 
			border-radius: .25em;
		}

		/*파일선택시 선택된 파일명이 붙는것을 가려준다*/
		.fileRegiBtn input[type="file"]{
			position: absolute; 
			width: 1px; 
			height: 1px; 
			padding: 0; 	
			margin: -1px; 
			overflow: hidden; 
			clip:rect(0,0,0,0); 
			border: 0;
		}
		
    </style>


    <script>
    	
    var options = [];
    var displayedProducts = [];
    var productImages = [];
    
    var imageNo=0;
   	var imageIndexArr = [];
    
        $(function() {
            $('#mainImageUpload').change(function() {
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
                    crossDomain: true,
                    processData: false,
                    success: function(response) {
                        $("#mainImage").attr('src', "${cdnUrl}/" + response.data);
                        $("#mainImage").attr('name', response.data);
                    },
                    error:function(xhr, error){
                    	alert("이미지 업로드를 다시 시도해주세요!");
                    	console.error(error);
                    }
                });
            });

            $('#multipleImageUpload').change(function() {
                //이미지 개수 세서 10개이상이면 return 시키는 코드 추가예정

                var multipleFileData = $('#multipleImageUpload').prop('files');

                for (var i = 0; i < multipleFileData.length; i++) {
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
                        crossDomain: true,
                        processData: false,
                        success: function(response) {
                        	imageNo++;
                        	imageIndexArr.push(imageNo);
                        	
                        	$div = $('<div class="row" id="img'+imageNo+'"></div>'	);
                            $img = $('<img class="product-img ml-2 mb-2 col-9" name="'+response.data+'" alt="이미지" src="' +
                                '${cdnUrl}' + '/' + response.data + '">');
                            console.log(response.data);
                            $btn = $('<button class="btn btn-danger form-control image-del-btn col-1"'+ 
                            		'value="'+imageNo+'" onclick="deleteImage(this)">x</button>');
                            
                            $div.append($img);
                            $div.append($btn);
                            
                            $("#image-div").append($div);
                        }
                    });
                }
		
            });
            
          	//옵션추가및 옵션값 추가 버튼의 관계를 어떻게 정해줄지 알고리즘 생각해야함..
            $("#option-add-btn").click(function() {
            	optionNo++;
            	optionIndexArr.push(optionNo);
            	
            	// 옵션 tr 생성 및 자식요소 생성
            	$tr = $('<tr style="border-bottom: solid 0.8px black;" class="option-tr" id="'+optionNo+'"></tr>');
            	$td1 = $('<td id="option-td"></td>');
            	$td1_div = $('<div class="row"></div>');
            	// 클래스 명이 optionKey인 input객체들 불러와서 옵션명 뽑기
            	$td1_div_input = $('<input class="form-control col-8 ml-3 mb-2 optionKey" placeholder="예 : 색상" type="text" id="optionKey'+optionNo+'">');
            	$td1_div_btn = $('<button class="btn btn-danger form-control ml-3 mb-2 col-2" value="'+optionNo+'"  onclick="deleteOption(this)">-</button>');
            	
            	$td2 = $('<td id="option-value-td"></td>');
            	$td2_div = $('<div class="row ml-3 option-value-div"></div>');
            	$td2_div_btn = $('<button class="btn btn-success form-control ml-3 mb-2 col-2" value="1" onclick="addOptionValue(this)">+</button>');
            	
            	// option table에 자식요소 추가
            	$("#option-table").append($tr);
            	$tr.append($td1);
            	$td1.append($td1_div);
            	$td1_div.append($td1_div_input);
            	$td1_div.append($td1_div_btn);
            	
            	$tr.append($td2);
            	$td2.append($td2_div);
            	$td2_div.append($td2_div_btn);
			});
            
			$("#option-reg-btn").click(function() {
				//example = example.join("/");
				var optionValueArrList= [];
					$('#option-table .option-tr').each(function() {
						var option= new Object();
						option.optionKey = $(this).children('#option-td').children('div').children('input').val();
						var optionValueArr=[];
						$(this).children("#option-value-td").children('div').children('div').children('input').each(function() {
							optionValueArr.push($(this).val());
						})
						option.code = "tempOption"
						optionValueArrList.push(optionValueArr);
						option.optionValues=optionValueArr.join("/");
						options.push(option);
					});
					
					var completeOptionArr = [];
					for(var i = 0; i<optionValueArrList[0].length; i++){
						var firstOption = optionValueArrList[0][i];
						for(var j = 0; j < optionValueArrList[1].length; j++){
							var secondOption = optionValueArrList[1][j]
							completeOptionArr.push(firstOption+"/"+secondOption);
						}
					}
					for(var i = 0; i<completeOptionArr.length; i++){
						makeCompleteOptionTr(completeOptionNo++, completeOptionArr[i]);
					}
                    
			});
          	
			$('#completeOption-add-btn').click(function() {
				makeCompleteOptionTr(completeOptionNo++, '');
			});
			
          	//상품등록하기 동작
            $("#register-btn").click(function() {
            	
            	var topCategoryText =$("#topCategory option:selected").text();
            	var midCategoryText =$("#midCategory option:selected").text();
            	var lowCategoryText =$("#lowCategory option:selected").text();
            	var lowCategoryNo =$("#lowCategory option:selected").val();
            	var name = $("#name").val();
            	var code = $("#code").val();
            	var supplyPrice = parseInt($("#supplyPrice").val());
            	var consumerPrice = parseInt($("#consumerPrice").val());
            	var description = $("#description").val();
            	var detailDescription = $("#detailDescription").val();
            	//var material =  $("#material").val();
            	//var manufacturer = $("#manufacturer").val();
            	//var supplier = $("#supplier").val();
            	//var home = $("#home").val();
            	//var manufactureDate = $("#manufactureDate").val();
            	//var restockCheck = $("#restockCheck").val();
            	var displayCheck = 'Y';
				if ($("input:checkbox[id='displayCheck']").is(":checked") == false){
            		displayCheck = 'N';
            	}            	
            	var saleCheck = 'Y';
				if ($("input:checkbox[id='saleCheck']").is(":checked") == false){
					saleCheck = 'N';
            	}
				var image= new Object();
				var imagePath = $('#mainImage').attr('name');
				image.imagePath = imagePath;
				image.mainImageCheck = 'Y';
				productImages.push(image);
				
				
				$("#complete-option-table tbody tr").each(function(){
					
					var displayedProduct = new Object();
					var option = $(this).children('td:eq(0)').children('div').children('input').val();
					var additionalFee = parseInt($(this).children('td:eq(1)').children('#additional-fee').val());
					var price = parseInt(parseInt($("#consumerPrice").val())) + additionalFee;
					
					var stockCheck = "Y";
					if ($(this).children('td:eq(2)').children("input:checkbox[id='manage-stock']").is(":checked") == false){
						stockCheck = 'N';
	            	}
					var amount = $(this).children('td:eq(3)').children('#amount').val();
					
					displayedProduct.name = name;
					displayedProduct.code = "tempcode"
					displayedProduct.option = option;
					displayedProduct.additionalFee = additionalFee;
					displayedProduct.price = price;
					displayedProduct.stockCheck = stockCheck;
					displayedProduct.mainImagePath = imagePath;
					
					displayedProducts.push(displayedProduct);
					
				});
				
				$('#image-div div').each(function(){
					var image= new Object();
					var imagePath = $(this).children(".product-img").attr('name');
					image.imagePath = imagePath;
					image.mainImageCheck = 'N';
					productImages.push(image);
				});
				
				var product= new Object();
	            product.categoryNo = lowCategoryNo;
	            product.code = code
	            product.name = name
	            product.material = '면100%';
	            product.completeCategory = topCategoryText+'/'+midCategoryText+'/'+lowCategoryText;
	            product.supplyPrice = supplyPrice;
	            product.consumerPrice = consumerPrice;
	            product.manufacturer = 'efaCShop';
	            product.supplier = 'efaCShop';
	            product.home = '한국'
	            product.manufactureDate = '2019-07-21';
	            product.restockCheck = 'N';
	            product.displayCheck = displayCheck;
	            product.saleCheck = saleCheck;
	            product.description = description;
	            product.detailDescription = detailDescription;
	            product.options = options;
	            product.displayedProducts = displayedProducts;
	            product.productImages = productImages;
	  	      	 $.ajax({ 
	  	         url:"${pageContext.servletContext.contextPath}/admin/product/register",
	  	         type:"post",
	  	         dataType:"json",
	  	       	 contentType: "application/json",
	  	         data:JSON.stringify({"categoryNo": product.categoryNo , "code": product.code , "name": product.name, "completeCategory" : product.completeCategory,
	  	        	"material":product.material ,"supplyPrice": product.supplyPrice , "consumerPrice":product.consumerPrice, "manufacturer": product.manufacturer, "supplier": product.supplier,
	  	        	"home" : product.home, "manufactureDate" : product.manufactureDate, "restockCheck": product.restockCheck, "displayCheck": product.displayCheck,
	  	        	"saleCheck": product.saleCheck, "description": product.description, "detailDescription": product.detailDescription, "options": product.options, 
	  	        	"displayedProducts": product.displayedProducts, "productImages" : product.productImages}),
	  	         success:function(response){
	  	            if(response.result == "success"){
	  	            	window.location.href = "${pageContext.servletContext.contextPath}/admin/product/list";
	  	               return ;
	  	            }
	  	         },
	  	         error:function(xhr, error){  
	  	            console.error("error:" + error) 
	  	         }
	  	      }); 
	  	      
        	});
        });  	
        // 옵션(품목코드) TR 추가하기 메소드
        var makeCompleteOptionTr = function(completeOptionNo, completeOption){
        	
        	$tr = $('<tr id="completeOption'+completeOptionNo+'"></tr>'); 
			$td1 = $('<td></td>');
			$td1_div = $('<div></div>');
			if(completeOption != ""){
				$td1_div_input = $('<input class="form-control" id="complete-category" readonly="readonly" type="text" value="'+completeOption+'">');
			}else{
			$td1_div_input = $('<input class="form-control" id="complete-category" type="text" value="'+completeOption+'">');
        	}
			$td2 = $('<td></td>');
			$td2_input = $('<input class="form-control col-12" id="additional-fee" type="text">');
			$td3 = $('<td></td>');
			$td3_input = $('<input class="form-control col-12" id="manage-stock" type="checkbox">');
			$td4 = $('<td></td>');
			$td4_input = $('<input class="form-control col-12" id="amount" type="text">');
			$td5 = $('<td></td>');
			$td5_input = $('<button class="btn form-control btn-danger ml-3 col-2 option-del-btn" value="'+completeOptionNo+'" onclick="deleteCompleteOption(this)">-</button>');
			
			$tr.append($td1);
			$td1.append($td1_div);
			$td1_div.append($td1_div_input)
			$tr.append($td2);
			$td2.append($td2_input);
			$tr.append($td3);
			$td3.append($td3_input);
			$tr.append($td4);
			$td4.append($td4_input);
			$tr.append($td5);
			$td5.append($td5_input);
			$('#complete-option-table').append($tr);
			
        }
        
        var optionNo=0;
       	var optionIndexArr = [];
        
        var deleteOption = function (optionTr) {
        	optionTrId = optionTr.value;
        	optionIndexArr.splice(optionIndexArr.indexOf(optionTrId),1);
			$("#"+optionTrId).remove();
		}
        
        var optionValueNo=0;
       	var optionValueArr = [];
       	
        var addOptionValue = function(optionValueAddBtn){
        	optionValueNo++;
        	optionValueArr.push("optionValue"+optionValueNo);
        	
            $div = $('<div class="row col-4 ml-2" id="optionValue'+optionValueNo+'"></div>');
        	$option_value_input = $('<input class="form-control col-8 optionValue1" placeholder="예 : 블랙" type="text">');
        	$delBtn = $('<button class="btn btn-danger form-control col-3 ml-1 mb-2" value="'+optionValueNo+'" onclick="deleteOptionValue(this)">-</button>');
        	
        	$div.append($option_value_input);
        	$div.append($delBtn);
        	$(optionValueAddBtn).before($div);
        }
        
        var deleteOptionValue = function (optionValueDelBtn) {
        	optionValueNo = $(optionValueDelBtn).val();
        	optionIndexArr.splice(optionIndexArr.indexOf("optionValue"+optionValueNo),1);
        	$('#optionValue'+optionValueNo).remove();
		}
        
        var completeOptionNo = 0;
        var completeOptionArr = [];
        
        var deleteCompleteOption = function (completeOptionDelBtn) {
        	completeOptionNo = $(completeOptionDelBtn).val();
        	completeOptionArr.splice(completeOptionArr.indexOf("completeOption"+completeOptionNo),1);
        	$('#completeOption'+completeOptionNo).remove();
		}
        
        var deleteImage = function (delImageBtn) {
        	imageNo = $(delImageBtn).val();
        	$('#img'+imageNo).remove();
        	imageIndexArr.splice(imageIndexArr.indexOf(imageNo),1);
		}
        
    </script>
</head>

<body>

    <c:import url="/WEB-INF/views/admin/includes/navigation.jsp" />

    <div class="container root-container">
        <div class="row-fluid">
            <div class="span3" id="sidebar"></div>

            <!--/span-->
            <div class="span9" id="content">
                <div class="row-fluid">
                    <div class="alert alert-success">
                        <h4>상품 등록</h4>
                    </div>
                </div>

                <div>
                        <div class="table-responsive">
                            <table class="table product-tb">
                                <tr>
                                    <th>상품 분류<br>(상위)</th>
                                    <td><select class="span6 m-wrap form-control col-7" name="topCategory" id="topCategory">
                                            <option selected>선택</option>
                                            <option value="1">상의</option>
                                            <option value="2">하의</option>
                                            <option value=7>신발</option>
                                        </select></td>

                                    <th>상품 분류<br>(중위)</th>
                                    <td><select class="span6 m-wrap form-control col-7" name="midCategory" id="midCategory">
                                            <option selected>선택</option>
                                            <option value="3">자켓</option>
                                            <option value="8">셔츠</option>
                                            <option value="9">티셔츠</option>
                                        </select></td>

                                    <th>상품 분류<br>(하위)</th>
                                    <td><select class="span6 m-wrap form-control col-7" name="lowCategory" id="lowCategory">
                                            <option selected>선택</option>
                                            <option value="4">블레이저</option>
                                            <option value="5">청자켓</option>
                                            <option value="6">MA-1</option>
                                    </select></td>

                                </tr>

                                <tr>
                                    <th>상품코드</th>
                                    <td><input class="form-control col-7" type="text" name="code" id="code"></td>
                                    <th>상품명</th>
                                    <td><input class="form-control col-7" type="text" name="name" id="name"></td>
                                    <th></th>
                                    <td></td>
                                </tr>

                                <tr>
                                    <th>원가</th>
                                    <td><input class="form-control col-7" type="text" name="supplyPrice" id="supplyPrice" min="1000"></td>
                                    <th>판매가</th>
                                    <td><input class="form-control col-7" type="text" name="consumerPrice" id="consumerPrice" onblur="go_ab()" min="1000"></td>
                                    <th>마진</th>
                                    <td><input class="form-control col-7" type="text" name="price3" id="price3" readonly="readonly"></td>
                                </tr>
                                
                                <tr>
                                    <th>전시여부</th>
                                    <td>
                                        <input class="form-control col-7" type="checkbox" id="displayCheck" name="displayCheck" />
                                    </td>
                                    <th>판매여부</th>
                                    <td>
                                        <input class="form-control col-7" type="checkbox" id="saleCheck" name="saleCheck" />
                                    </td>
                                    <th></th>
                                    <td></td>
                                </tr>

                                <tr>
                                    <th>옵션</th>
                                    <td colspan="5">
                                        <div>
                                            <table class="table" id="option-table" style="border: solid 1px; text-align: center;">
                                                <thead>
                                                    <tr>
                                                        <td width="40%" style="border: solid 0.8px;">옵션명</td>
                                                        <td width="60%" style="border: solid 0.8px;">옵션값</td>

                                                    </tr>
                                                </thead>
                                                <tfoot>
                                                	<tr>
                                                		<td colspan="1">
                                                			<button class="btn btn-success form-control ml-3 option-add-btn col-6 mt-3" 
                                                			id="option-add-btn">옵션추가하기</button>
                                                		</td>
                                                		<td colspan="1">
                                                			<button class="btn btn-primary form-control ml-3 option-add-btn col-6 mt-3" 
                                                			id="option-reg-btn">옵션(품목코드)등록하기</button>
                                                		</td>
                                                	</tr>
                                                </tfoot> 
                                                
                                            </table>
                                        </div>

                                        <div>
                                            <table class="table" id="complete-option-table" style="border: solid 1px; text-align: center;">
                                                <thead>
                                                    <tr class="complete-option-tr">
                                                        <td width="40%">옵션(품목코드)</td>
                                                        <td width="15%">추가금액</td>
                                                        <td width="15%">재고관리</td>
                                                        <td width="15%">재고수량</td>
                                                        <td width="15%"></td>
                                                    </tr>
                                                </thead>

                                                <tfoot>
                                                	<tr>
	                                                    <td></td>
	                                                    <td></td>
	                                                    <td></td>
	                                                    <td></td>
	                                                    <td>
	                                                        <button class="btn btn-success ml-3 completeOption-add-btn" id="completeOption-add-btn" class="form-control">+</button>
	                                                    </td>
                                                    </tr>
                                                </tfoot>
                                            </table>
                                        </div>
                                    </td>
                                </tr>
                                
                                <tr>
                                    <th>상품설명</th>
                                    <td colspan="5"><textarea class="form-control" style="width: 98%; height: 80px;" id="description" name="description"></textarea>
                                    </td>
                                </tr>

                                <tr>
                                    <th>상세설명</th>
                                    <td colspan="5"><textarea class="form-control" style="width: 98%; height: 200px;" id="detailDescription" name="detailDescription"></textarea>
                                    </td>
                                </tr>

                                <tr>
                                    	<th>
                                    	대표이미지
                                    	</th>
                                    	<td colspan="5">
	                                        
	                                        <div class="mainImage-div">
	                                            <img id=mainImage name="mainImage" alt="대표이미지" src="">
	                                        </div>
	                                        <div class="mainImage-upload-div">
	                                        	<div class="form-group" style="margin: 8px 0 8px;">
													<div class="fileRegiBtn">
													<label for="mainImageUpload"><strong>대표 이미지등록</strong></label>
													<input id="mainImageUpload" type="file" name="mainImageUpload" />
													</div>
												</div>
	                                            
	                                        </div>
	                                    </td>
                                 </tr>
                                 <tr>
                                 		<th>
	                                    	상품이미지 <br> 
	                                    	(최대 10개)
	                                    </th>
	                                    <td colspan="5">
		                                    <div class="row image-div" id="image-div"></div>
		                                    <div class="form-group" style="margin: 8px 0 8px;">
													<div class="fileRegiBtn">
													<label for="multipleImageUpload"><strong>추가 이미지등록</strong></label>
													<input class="input_file" multiple="multiple" id="multipleImageUpload" name="multipleImageUpload" type="file" />
													</div>
											</div>
		                                   
		                                <td>
                                 </tr>
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