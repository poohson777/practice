<!DOCTYPE HTML>
<html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<head>
<title>Hielo by TEMPLATED</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" href="/resources/css/main.css?ver=3" />
<style>
.count{
font-size: 70%;
color: #04B486 ;
font-weight: bold;
}
.search1 {
	text-align: center;
	/* display: flex;
    flex-wrap: wrap; 
    justify-content: center; 
    align-items: center; */
}

.outer {
	padding: 5%;
	background-color: #ffffff;
	background-color: rgba(255, 255, 255, 0.6);
}

.subpage {
	background: linear-gradient(120deg, #D3959B, #BFE6BA) fixed
}

.center {
	text-align: center;
}

.pagination {
	display: inline-block;
}

.pagination a {
	color: black;
	float: left;
	padding: 8px 5px;
	text-decoration: none;
}

.pagination a.active {
	background-color: pink;
	color: white;
}

.pagination a:hover:not (.active ){
	background-color: pink;
}

.tdStyle{
	text-align: right;
}

.search {
	width: 33%;
	margin-left: 33%;
}

.bno {
	font-size: 70%
}

.box {
	display: block;
	background-color: transparent;
	overflow: hidden;
	padding-right: 50px;
	white-space: nowrap;
	margin-bottom: 0;
	cursor: pointer;
}

.title {
	display: inline-block;
	overflow: hidden;
	max-width: 100%;
	text-decoration: none;
	text-overflow: ellipsis;
	vertical-align: middle;
}

.ico {
	display: inline-block;
	vertical-align: middle;
}

#selectbox {
	display: inline-block;
	width: 80%;
}
#header .logo .loginbtn{
float: right;
display: inline-block;
text-align: right;
}
#header .logo .loginbtn .logOutbtn .btnlogOut1{
float: left;
margin-right: 10px;
}
#header .logo .loginbtn .logOutbtn .btnlogOut2{
display: inline-block;
text-align: left;
}
</style>
</head>
<body class="subpage">

	<!-- Header -->
	<header id="header">
		<div class="logo">
			
		<div class="loginbtn">

<sec:authorize access="isAnonymous()">
	<form action="/myLogin">
	<button>login</button>
	
	</form>	
</sec:authorize>

<div class="logOutbtn">
<sec:authorize access="isAuthenticated()">
	<form action="/logout" method="post" >
	<sec:authentication property="principal" var="user"/>
	<div class="btnlogOut1">
	<strong>${user.username}</strong>님 환영합니다.
	</div>
	<div class="btnlogOut2">
	<button class="lOutbtn">logout</button>
	</div>
<%-- 	<input type="hidden" name = "${_csrf.parameterName}" value ="${_csrf.token}"> --%>
	</form>
</sec:authorize>
</div>

		 </div>
		</div>
		<a href="#menu">Menu</a>
	</header>
	<!-- Nav -->
	<nav id="menu">
		<ul class="links">
			<li><a href="/home">Home</a></li>
			<li><a href="/up/ajax">Best Food Truck</a></li>
			<li><a href="/freeboard/list">Free Board</a></li>
			<li><a href="/member/memberlist">Management Board</a></li>
		</ul>
	</nav>


	<!-- One -->
	<section id="One" class="wrapper style3">
		<div class="inner">
			<header class="align-center">
				<p>Sed amet nulla</p>
				<h2>Elements</h2>
			</header>
		</div>
	</section>
	<!-- Main -->
	<div id="main" class="container">

		<div class="outer">
			<!-- Table -->
			<h3><b>Member Management</b></h3>
			<div class="table-wrapper">
				<table style="table-layout: fixed;">
					<colgroup>
	  					<col style="width: 15%;" />
	  					<col style="width: 15%;" />
	 					<col style="width: 30%;" />
	    				<col style="width: 20%;" />
	    				<col style="width: 20%;" />
					</colgroup>

					<thead> 
					<tr>
						<th>ID</th>
						<th>Name</th>
						<th style="text-align: center;">RegDate</th>
						<th class="tdStyle">Role</th>
						<th class="tdStyle">Use Y/N</th>
					</tr>
					</thead>
					<tbody>
					<!-- 검색결과가 없거나 보여줄 데이터가 없는 경우 내용없음 출력 -->
						<c:if test="${fn:length(list)==0 }">
							<tr>
								<td colspan="5" style="text-align: center">내용없음</td>
							</tr>
						</c:if>

						<c:forEach items="${list}" var="vo" >
							
							<tr  >
								<td data-uid="${vo.uid}"><c:out value="${vo.uid}" />
<%-- 								<input type="hidden" id="uid" value="${vo.uid }"> --%>
								</td>	
								<td class="uname"><c:out value="${vo.uname}" /></td>	
								<td class="tdStyle"><c:out value="${vo.regdate}" /></td>	
								<td class="tdStyle"><c:out value="${vo.role}" /></td>
								<td class="tdStyle"><c:out value="${vo.useYN}" /></td>															
							</tr>
							
						</c:forEach>
					</tbody>
					<tfoot>
						<tr>
							<td colspan="5"></td>

						</tr>
					</tfoot>
				</table>
			</div>
			<div class="center">
				<div class="pagination">
					<c:if test="${pm.prev}">
						<a href="/freeboard/list${cri.makeSearch(pm.start -1)}"><< </a>
					</c:if>
					<c:forEach begin="${pm.start}" end="${pm.end}" var="idx">
						<a href="/freeboard/list${cri.makeSearch(idx)}"
							class="<c:if test="${pm.cri.page==idx}">active</c:if>">${idx}</a>
					</c:forEach>
					<c:if test="${pm.next}">
						<a href="/freeboard/list${cri.makeSearch(pm.end+1)}">>></a>
					</c:if>
				</div>
			</div>



			<!--@@@검색@@@  -->
			<div class="search1">
				<div class="row uniform" id="selectbox">
					<div class="3u 12u$(small)">
						<div class="select-wrapper">
							<select name="type" id="category">
								<option value="u"
									<c:out value="${cri.type eq 'u' ? 'selected' : '' }"/>>id</option>
								<option value="n"
									<c:out value="${cri.type eq 'n' ? 'selected' : '' }"/>>name</option>
								<option value="r"
									<c:out value="${cri.type eq 'r' ? 'selected' : '' }"/>>regdate</option>

							</select>
						</div>
					</div>

					<div class="6u 12u$(small)">
						<input type="text" name="keyword" id="query"
							value="${cri.keyword}" placeholder="search" />
					</div>

					<div class="3u 12u$(small)">
						<button id="search" value="Search"
							class="button special icon fa-search">Search</button>
					</div>
				</div>
				<!-- 검색end -->


			</div>
		</div>
	</div>
	


	<script src="https://code.jquery.com/jquery-3.3.1.min.js"
		integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
		crossorigin="anonymous"></script>
	<script>
		$(document).ready(function() {
			
			$("tbody tr td").on("click",function(e){
				
				var uid = $(this).attr("data-uid");
				
				if(uid !=null){
				
					console.log("td... 클릭......");

					console.log("uid....",uid);

 					self.location = "/member/memberread"+"?uid="+uid; 
				} else {
					alert("id 값을 클릭시 상세페이지로 넘어갑니다.");
				}
				 
			});
			
			$("#search").on("click",function(e) {
				console.log("clicked...............................");
				console.log(encodeURIComponent($('#keywordInput').val()));
				var type = $("#category")[0].value;
				var keyword = $('#query').val();

				if (keyword === '') {
					return;
				};
				self.location = "/member/memberlist"+'${pm.makeQuery(1)}'+"&type="
								+ $("select option:selected").val()
								+ "&keyword="+ encodeURIComponent(keyword);
			});
	
			$(".lOutbtn").on("click", function(e) {
				
				alert("로그아웃 되었습니다.");				
			});
		});
	</script>

	<!--@@@검색@@@ -->

	<!-- Footer -->
	<footer id="footer">
		<div class="container">
			<ul class="icons">
				<li><a href="#" class="icon fa-twitter"><span class="label">Twitter</span></a></li>
				<li><a href="#" class="icon fa-facebook"><span
						class="label">Facebook</span></a></li>
				<li><a href="#" class="icon fa-instagram"><span
						class="label">Instagram</span></a></li>
				<li><a href="#" class="icon fa-envelope-o"><span
						class="label">Email</span></a></li>
			</ul>
		</div>
		<div class="copyright">&copy; Untitled. All rights reserved.</div>
	</footer>
	<!-- Scripts -->
	<script src="/resources/js/jquery.min.js"></script>
	<script src="/resources/js/jquery.scrollex.min.js"></script>
	<script src="/resources/js/skel.min.js"></script>
	<script src="/resources/js/util.js"></script>
	<script src="/resources/js/main.js"></script>
</body>
</html>