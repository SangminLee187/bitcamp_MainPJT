<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<title>Kim review</title>
<head>

 <meta charset="UTF-8">
	

	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	<meta name="viewport" content="width=device-width, initial-scale=1">

 <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"> 
  <link rel="stylesheet" href="/resources/demos/style.css">
  <link href="/css/style.css" rel="stylesheet">  
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  
  <!-- include summernote css/js-->
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.js"></script>
<!-- include summernote-ko-KR -->
<script src="/resources/js/summernote-ko-KR.js"></script>
<title>�ı⾲��</title>



  
  <script>
  $(function() {
		$("#datepicker").datepicker({
			dateFormat : 'yy-mm-dd'
		});
	});
  
  </script>

<link rel="stylesheet" href="/css/admin.css" type="text/css">

<script type="text/javascript" src="../javascript/calendar.js"></script>

<script type="text/javascript">
//============= "����"  Event ���� =============
$(function() {
	//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
	$( ".btn:contains('��')" ).on("click" , function() {
		fncUpdateOld();
	});
});	
//============= "���"  Event ó�� ��  ���� =============
$(function() {
	//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
	$("a[href='#' ]").on("click" , function() {
		$("form")[0].reset();
	});
});	
function fncUpdateOld(){
	//Form ��ȿ�� ����
 	//var name = document.detailForm.prodName.value;
	var title= $('input[name="reviewTitle"]').val();
	
	var content=$('textarea[name="reviewContent"]').val();
	
	
	/* var detail = document.detailForm.prodDetail.value;
	var manuDate = document.detailForm.manuDate.value;
	var price = document.detailForm.price.value; */
	//var target = document.getElementById("cate");
	//var cateName = target.options[target.selectedIndex].text;
	//var cateName = $("#cate option:checked").text();
	//console.log('name : ' + cateName)
	//document.getElementById("cateName").value = cateName;
	
	
	$("form").attr("method" , "POST").attr("action" , "/old/updateOld").submit();
}
</script>

<body>

	
   	</br></br></br>
   	
   	<div class="container">
	
		<div class="page-header text-default"> 
		
		<h3 style="text-align:center;">�ı��ۼ�</h3> 
		</div>
	<br/><br/>
	�п��ڵ� : ${academyName }
	�п��ڵ� : ${ academyCode}
	Ŀ��Ʈ���� : ${connectState }

	<div class="container-fluid">
	<form class="form-horizontal">
	<input type="hidden" name="cateName" id="cateName" value="" />
		
	 	<div id="reviewTitle" class="form-group">
		    <label for="boardTitle" class="col-sm-offset-1 col-sm-1 control-label">����</label>
		    <div class="col-sm-8">
		      <input type="text" class="form-control" id="reviewTitle" name="reviewTitle" placeholder="����">
		    </div>
		</div>
		
		<div id="academyCode" class="form-group">
		    <label for="academyCode" class="col-sm-offset-1 col-sm-1 control-label">�п��ڵ�</label>
		    <div class="col-sm-8">
		      <input type="text" class="form-control" id="academyCode" name="academyCode" value="${academyCode}" readonly>
		    </div>
		</div>

		
	 	<div class="form-group">
		    <label for="reviewContent" height=100px class="col-sm-offset-1 col-sm-1 control-label">����</label>
		    <div class="col-sm-8" height=100px>
		      <textarea class="form-control col-sm-12" rows="5" name="reviewContent"
						placeholder="����" style="resize: none"></textarea>
		    </div>
		</div>
		
</form>
		
		</div>	
				
		</div>
		
	 	
		
		<div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      &nbsp;&nbsp;<button type="button" class="btn btn-default"  >��&nbsp;��</button>
			  &nbsp;<a class="btn btn-default" href="#" role="button">��&nbsp;��</a>
		    </div>
		
		</div>
		
	</div>
		


</head>


</body>
</html>