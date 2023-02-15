<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="ko">
<head>
  <title>Spring Boot Web MVC</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
 
<!-- <div class="container"> -->
  <div class="card">
    <div class="card-header">
		<div class="jumbotron jumbotron-fluid">
		  <div class="container">
		    <h1>Spring Boot Web MVC</h1> 
		    <p>Spring Boot, JPA, JSP, BS4</p> 
		  </div>
		</div>
    </div>
    <div class="card-body">
    	<h4 class="card-title">Spring Boot</h4>
    	<div class="row">
    		<div class="col-lg-2">
    			<div class="card" style="min-height: 500px; max-height: 1000px">
    				<div class="card-body">
    					<h4 class="card-title"><sec:authentication property="principal.member.name" /></h4>
    					<p class="card-text">회원님 환영합니다!</p>
    					<form action="${contextPath}/member/logout">
    						<button type="submit" class="btn btn-sm btn-primary form-control">로그아웃</button>
    					</form>
    					<br />
    					<sec:authorize access="hasRole('ROLE_ADMIN')">
    						<div><sec:authentication property="principal.member.role" /> Menu</div>
    						- 메뉴 목록 -
    					</sec:authorize>
    					<sec:authorize access="hasRole('ROLE_MANAGER')">
    						<div><sec:authentication property="principal.member.role" /> Menu</div>
    						- 메뉴 목록 -
    					</sec:authorize>
    					<sec:authorize access="hasRole('ROLE_MEMBER')">
    						<div><sec:authentication property="principal.member.role" /> Menu</div>
    						- 메뉴 목록 -
    					</sec:authorize>
    				</div>
    			</div>
    		</div>
    		<div class="col-lg-5">
    			<div class="card" style="min-height: 500px; max-height: 1000px">
    				<div class="card-body">
    					<table class="table table-hover">
    						<thead>
    							<th>번호</th>
    							<th>제목</th>
    							<th>작성일</th>
    						</thead>
    						<tbody>
   							<c:forEach var="vo" items="${list}">
    							<tr>
    								<td>${vo.idx}</td>
    								<td><a href="${vo.idx}">${vo.title}</a></td>
    								<td><fmt:formatDate pattern="yyyy-MM-dd" value="${vo.indate}" /></td>
    							</tr>
	    					</c:forEach>
    						</tbody>
    					</table>
    				</div>
    			</div>
    		</div>
    		<div class="col-lg-5">
    			<div class="card" style="min-height: 500px; max-height: 1000px">
    				<div class="card-body">
    					<form id="regForm" action="${contextPath}/board/register" method="post">
    					
    						<input type="hidden" id="idx" name="idx" value = "${vo.idx}" />
    					
    						<div class="form-group">
    							<label for="title">제목:</label>
    							<input type="text" class="form-control" id="title" name="title" placeholder="제목을 입력하세요." />
    						</div>
    						<div class="form-group">
    							<label for="content">내용:</label>
    							<textarea class="form-control" rows="9" id="content" name="content"></textarea>
    						</div>
    						<div class="form-group">
    							<label for="writer">작성자:</label>
    							<input type="text" class="form-control" id="writer" name="writer" 
    									readonly="readonly"
    									value='<sec:authentication property="principal.username"/>' />
    						</div>
    						<div id="regBtns">
    							<button type="button" data-oper="register" class="btn btn-sm btn-primary">등록</button>
    							<button type="button" data-oper="reset" class="btn btn-sm btn-warning">취소</button>
    						</div>
    						<div id="detailBtns" style="display: none;">
    							<button type="button" data-oper="list" class="btn btn-sm btn-primary">목록</button>
    							<span id="update">
    								<button type="button" data-oper="updateForm" class="btn btn-sm btn-warning">수정</button>
    							</span>
    							<button type="button" data-oper="remove" class="btn btn-sm btn-success">삭제</button>
    						</div>
    					</form>
    				</div>
    			</div>
    		</div>
    	</div>
    </div> 
    <div class="card-footer">Footer</div>
  </div>
<!-- </div> -->

<script type="text/javascript">
	$(document).ready(function() {
		var regForm = $("#regForm");
		$("button").on('click', function() {
			var oper = $(this).data("oper");
			if (oper === 'register') {
				regForm.submit();
			} else if (oper === 'reset') {
				regForm[0].reset();
			} else if (oper === 'list') {
				location.href = "${contextPath}/board/list";
			} else if (oper === 'remove') {
				var idx = regForm.find("#idx").val();
				location.href = "${contextPath}/board/remove?idx=" + idx;
			} else if (oper === 'updateForm') {
				regForm.find("#title").attr("readonly", false);
				regForm.find("#content").attr("readonly", false);
				
				var updateBtn = '<button type="button" onclick="goUpdate()" class="btn btn-sm btn-info">수정완료</button>';
				$("#update").html(updateBtn);
			}
		});
		
		// 제목 클릭 시, 상세보기
		$("a").on('click', function(e) {
			e.preventDefault();	// a 태그 기능 막기 
			var idx = $(this).attr('href');
			
			$.ajax({
				url : '${contextPath}/board/get',
				type: 'get',
				data : { 'idx': idx },
				dataType : 'json',
				success: detailBoard,
				error: function () {
					alert('error');
				}
			});
		});
		
	});
	
	function detailBoard(vo) {
		var regForm = $("#regForm");
		regForm.find("#title").val(vo.title);
		regForm.find("#content").val(vo.content);
		regForm.find("#writer").val(vo.writer);
		regForm.find("#idx").val(vo.idx);
		
		regForm.find("input").attr("readonly", true);
		regForm.find("textarea").attr("readonly", true);
		
		$("#regBtns").css("display", "none");
		$("#detailBtns").css("display", "block");
	}
	
	function goUpdate() {
		var regForm = $("#regForm");
		regForm.attr("action", "${contextPath}/board/modify");
		regForm.submit();
	}
</script>

</body>
</html>
