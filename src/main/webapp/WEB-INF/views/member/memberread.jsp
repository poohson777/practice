<!DOCTYPE HTML>
<!--
    Hielo by TEMPLATED
    templated.co @templatedco
    Released for free under the Creative Commons Attribution 3.0 license (templated.co/license)
-->
<html>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<head>

<meta name="csrf-token" content="{{ csrf_token() }}">

<title>Hielo by TEMPLATED</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" href="/resources/css/main.css?ver=3" />
<style>

.contentbox {
	min-height: 500px;
}

.mytable {
	width: 70%;
	margin-left: auto;
	margin-right: auto;
}

.subpage {
	background: linear-gradient(120deg, #D3959B, #BFE6BA) fixed
}

.outer {
	padding: 5%;
	background-color: #ffffff;
	background-color: rgba(255, 255, 255, 0.6);
}

 .listDiv li {
            list-style-type: none;

        }
        ul {
            display: inline;
            padding: 0;
        }
       

.mailbox-attachment-name{

    text-overflow: ellipsis;
    white-space: nowrap;
    word-wrap: normal;
    max-width: 149px;
    overflow: hidden;
    display: inline-block;

}

a{color:#000;}

.mask
{width:100%; height:100%; position:fixed; left:0; top:0; z-index:10; background:#000; opacity:.5; filter:alpha(opacity=50);}

#modalLayer{display:none; position:relative;}
#modalLayer .modalContent{width:440px; height:200px; padding:20px; border:1px solid #ccc; position:fixed; left:50%; top:50%; z-index:11; background:#fff;}
#modalLayer .modalContent button{position:absolute; right:0; top:0; cursor:pointer;}
  
  
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
				<h2>Member Info</h2>
			</header>
		</div>
	</section>
	<!-- Main -->

	<div id="main" class="container">
		<div class="outer">
			<div class="mytable">
				<div class="table-wrapper">
					<h3>Member Info</h3>
					<table class="alt">

						<tbody>
								<tr>
								<td >USER ID </td>
								<td ><c:out value="${vo.uid}" />
								<input type="hidden" id="uid" value="${vo.uid}">
								</td>
								</tr>
								<tr>
								<td>USER NAME </td>
								<td><c:out value="${vo.uname}" /></td>
								</tr>
								<tr>
								<td>가입일 </td>
								<td> <fmt:formatDate value="${vo.regdate}" pattern="yyyy-MM-dd" /></td>
								</tr>
								<tr>
								<td>활동여부</td>
								<td><c:out value="${vo.useYN}" /></td>
								</tr>
								<tr>
								<td>활동중지기간</td>
								<td><fmt:formatDate value="${vo.ctrdate}" pattern="yyyy-MM-dd"/></td>
								</tr>
						</tbody>
						
														
					</table>
					<button class="modalLink">suspension</button>
					<button class="fbtn">forced exit</button>
					<button class="list">Member list</button>
					<div id="modalLayer">
						<div class="modalContent">
							<ul>
								<li>
								<input type="radio" id="ctnValue1" name="ctnValue" value="1" checked>
								<label for="ctnValue1">1주</label>
								</li>
								<li>
								<input type="radio" id="ctnValue2" name="ctnValue" value="2">
								<label for="ctnValue2">2주</label>
								</li>
								<li>
								<input type="radio" id="ctnValue3" name="ctnValue" value="3">
								<label for="ctnValue3">3주</label>
								</li>
								
							</ul>
					   		<button class="sbtn" style="vertical-align:bottom; position: static;" type="button">확인</button>
						</div>
						
					</div>
										

				</div>
				
			</div>
			
		</div>
	</div>


	<script src="https://code.jquery.com/jquery-3.3.1.min.js"
		integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
		crossorigin="anonymous"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<script id="templateAttach" type="text/x-handlebars-template">

</script>
	
	<script>
		 
		$(document).ready(function(e) {
			var csrfToken = "${_csrf.token}";
			
			 function setCsrf(token){
		        	
		        	$.ajaxSetup({
		                headers:
		                { 'X-CSRF-TOKEN':token }
		            });
		        	
		        }
	
		
		    	/* 목록가기 */
					$(".list").on("click", function(e) {
						
						console.log("찍히나");
						self.location="/member/memberlist${cri.makeSearch(cri.page)}";
					
					});
		    	
				/* 강퇴버튼*/
					
					$(".fbtn").on("click", function(e) {
						
						console.log("강퇴하자요");
						if(confirm("탈퇴 시키겠습니까?")){
							alert("탈퇴되었습니다.");
						}
					
					});
				/* 활동중지 버튼*/
					  	
				
				 
				
					$(".sbtn").on("click", function(e) {

						console.log("활동중지 모달창을 띄우자");
					
						var weeks = $('input[name="ctnValue"]:checked').val();
						var uid = $("#uid").val();
						
						
						var data = {ctrrange: weeks, uid:uid};
						
						
						console.log(data);
						
						 setCsrf(csrfToken);
						$.ajax({
		        			 
		              		 type: 'post',
		              		 url: "/member/suspension",
		             		 headers: {"Content-type": "application/json"},
		               		 dataType: "text",
		               		 data: JSON.stringify(data),
		               		 success: 
		               			function (result) {
		               				alert(weeks+"주 동안 계정이 정지됩니다");
		               				self.location="/member/memberread?uid="+uid;
		               			}
		           		});      		
		        	
															
					});
					
// 					$("input[name='ctnValue']").change(function(e){
// 						var weeks = $('input[name="ctnValue"]:checked').val();
// 						alert(weeks);
// 					});
				
			  var modalLayer = $("#modalLayer");
			  var modalLink = $(".modalLink");
			  var modalCont = $(".modalContent");
			  var marginLeft = modalCont.outerWidth()/2;
			  var marginTop = modalCont.outerHeight()/2; 

			  modalLink.click(function(){
			    modalLayer.fadeIn("slow");
			    modalCont.css({"margin-top" : -marginTop, "margin-left" : -marginLeft});
			    $(this).blur();
			    $(".modalContent > a").focus(); 
			    return false;
			  });

			  $(".modalContent > button").click(function(){
			    modalLayer.fadeOut("slow");
			    modalLink.focus();
			  });		
		});
		
	</script>


<script type="text/javascript" src="/resources/js/pageMaker.js"></script>	

<script type="text/javascript" src="/resources/js/upload.js?ver=3"></script>	

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
		<div class="copyright">Untitled. All rights reserved.</div>
	</footer>
	<!-- Scripts -->
	<script src="/resources/js/jquery.min.js"></script>
	<script src="/resources/js/jquery.scrollex.min.js"></script>
	<script src="/resources/js/skel.min.js"></script>
	<script src="/resources/js/util.js"></script>
	<script src="/resources/js/main.js"></script>
</body>
</html>