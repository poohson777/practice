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
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

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
	padding-top: 5%;
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

#ModalLayer {
            display: none;
            position: relative;
            background-color: white;
        }

#modalLayer .modalContent {
            width: 440px;
            height: 200px;
            padding: 20px;
            border: 1px solid #ccc;
            position: fixed;
            left: 50%;
            top: 50%;
            z-index: 11;
            background: #fff;
        }
        
       
</style>

</head>

<body class="subpage">

	<!-- Header -->
	<header id="header">
		<div class="logo">
	<div class="loginbtn">

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
							
								<td>USER ID </td>
								<td ><strong><c:out value="${vo.uid}" /></strong></td>
								<tr></tr>
								
								<td>USER NAME </td>
								<td><c:out value="${vo.uname}" /></td>
								<tr></tr>
								
								<td> 가입일 </td>
								<td> <fmt:formatDate value="${vo.regdate}" pattern="yyyy-MM-dd" /></td>
								<tr></tr>
								
								<td>활동여부</td>
								<td><c:out value="${vo.useYN}" /></td>
								<tr></tr>
						</tbody>
						
					</table>
					<button class="sbtn">suspension</button>
					<button class="fbtn">forced exit</button>
					<button class="list">Member list</button>
					<div class="wrapper"></div>
					
					<div id="ModalLayer"> 
					 <div class="modalContent">
						<h3>Test Modal</h3>
   						<p>이 창은 모달창입니다.</p>
    					<button id="mokbtn">확인</button>
    					<button id="mcbtn">닫기</button>
					
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
			
			var ModalLayer = $("#ModalLayer");
			var modalCont = $(".modalContent");
		    var marginLeft = modalCont.outerWidth() / 2;
		    var marginTop = modalCont.outerHeight() / 2;
		
		    	/* 목록가기 */
					$(".list").on("click", function(e) {
						
						console.log("찍히나");
						self.location="/member/memberlist${cri.makeSearch(cri.page)}";
					
					});
		    	
				/* 강퇴버튼*/
					
					$(".fbtn").on("click", function(e) {
						
						console.log("강퇴하자요");
						alert("탈퇴 시키겠습니까?");
					
					});
				/* 활동중지 버튼*/
					
					$(".sbtn").on("click", function(e) {
						
						console.log("활동중지 모달창을 띄우자요");
						ModalLayer.fadeIn("slow");
						modalCont.css({"margin-top": -marginTop, "margin-left": -marginLeft});
						 $(this).blur();
				            $(".modalContent > a").focus();
						
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