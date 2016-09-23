<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<!--
	Solid State by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html ng-app="App">
	<head>
		<title>Sporthub</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
		<link rel="stylesheet" href="assets/css/main.css" />
		<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
		<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
	</head>
	<body>
		<!-- Page Wrapper -->
			<div id="page-wrapper">

				<!-- Header -->
					<header id="header" class="alt">
						<h1><a href="index.html">Sporthub</a></h1>
						<nav>
							<a href="#menu">Menu</a>
						</nav>
					</header>

				<!-- Menu -->
					<nav id="menu">
						<div class="inner">
							<h2>Menu</h2>
							<ul class="links">
								<li><a href="#">Home</a></li>
								<li><a href="profile.html">Generic</a></li>
								<li><a href="elements.html">Elements</a></li>
								<li><a href="#">Log In</a></li>
								<li><a href="#four">Sign Up</a></li>
							</ul>
							<a href="#" class="close">Close</a>
						</div>
					</nav>

				<!-- Banner -->
					<section id="banner">
						<div class="inner">
							<div class="logo"><span class="icon fa-diamond"></span></div>
							<h2>Find out your sport potential</h2>
							<p>Track your exercise plan</p>
							<p>Enterprise level sport management</p>
						</div>
					</section>

				<!-- Wrapper -->
					<section id="wrapper">

						<!-- One -->
							<section id="one" class="wrapper spotlight style1">
								<div class="inner">
									<a href="#" class="image"><img src="images/pic01.jpg" alt="" /></a>
									<div class="content">
										<h2 class="major">Set up a sport goal</h2>
										<p>This is description</p>
										<a href="#" class="special">Learn more</a>
									</div>
								</div>
							</section>

						<!-- Two -->
							<section id="two" class="wrapper alt spotlight style2">
								<div class="inner">
									<a href="#" class="image"><img src="images/pic02.jpg" alt="" /></a>
									<div class="content">
										<h2 class="major">Track your plans</h2>
										<p>This is description</p>
										<a href="#" class="special">Learn more</a>
									</div>
								</div>
							</section>

						<!-- Three -->
							<section id="three" class="wrapper spotlight style3">
								<div class="inner">
									<a href="#" class="image"><img src="images/pic03.jpg" alt="" /></a>
									<div class="content">
										<h2 class="major">Manage goals for others</h2>
										<p>This is description</p>
										<a href="#" class="special">Learn more</a>
									</div>
								</div>
							</section>

						<!-- Four -->
							<section id="four" class="wrapper alt style1"  ng-controller="signupCtrl">
								<div class="inner">
									<h2 class="major">Sign Up</h2>
									<p>This is description</p>
									<form>
										<div class="field">
											<label for="email">Email</label>
											<input type="email" name="email" id="email" ng-model="email" ng-blur="CheckEmail()" required />
										</div>
										<div class="field">
											<label for="password">Password</label>
											<input type="password" name="password" id="password" ng-model="password" required />
										</div>
										<div class="field">
											<label for="confpass">Confirm Password</label>
											<input type="password" name="confpass" id="confpass" ng-model="confpass" required />
										</div>
										<ul class="actions">
											<li><input type="submit" value="Sign Up Now" ng-disabled="FormValidatoin()" ng-click="Signup()"/></li>
										</ul>
									</form>
									<!--
									<section class="features">
										<article>
											<a href="#" class="image"><img src="images/pic04.jpg" alt="" /></a>
											<h3 class="major">Feature one</h3>
											<p>This is description.</p>
											<a href="#" class="special">Learn more</a>
										</article>
										<article>
											<a href="#" class="image"><img src="images/pic05.jpg" alt="" /></a>
											<h3 class="major">Feature two</h3>
											<p>This is description.</p>
											<a href="#" class="special">Learn more</a>
										</article>
										<article>
											<a href="#" class="image"><img src="images/pic06.jpg" alt="" /></a>
											<h3 class="major">Feature Three</h3>
											<p>This is description.</p>
											<a href="#" class="special">Learn more</a>
										</article>
										<article>
											<a href="#" class="image"><img src="images/pic07.jpg" alt="" /></a>
											<h3 class="major">Feature four</h3>
											<p>This is description.</p>
											<a href="#" class="special">Learn more</a>
										</article>
									
									</section>
									-->
									</div>
							</section>
					</section>

				<!-- Footer -->
					<section id="footer">
						<div class="inner">
							<h2 class="major">CONTACT US</h2>
							<p>If there is any suggestion, Please contact us via one of below contact method.</p>
							<!--
							<form method="post" action="#">
								<div class="field">
									<label for="name">Name</label>
									<input type="text" name="name" id="name" />
								</div>
								<div class="field">
									<label for="email">Email</label>
									<input type="email" name="email" id="email" />
								</div>
								<div class="field">
									<label for="message">Message</label>
									<textarea name="message" id="message" rows="4"></textarea>
								</div>
								<ul class="actions">
									<li><input type="submit" value="Send Message" /></li>
								</ul>
							</form>
							-->
							<ul class="contact">
								<li class="fa-home">
									Untitled Inc<br />
									1234 Somewhere Road Suite #2894<br />
									Nashville, TN 00000-0000
								</li>
								<li class="fa-phone">(000) 000-0000</li>
								<li class="fa-envelope"><a href="#">information@untitled.tld</a></li>
								<li class="fa-twitter"><a href="#">twitter.com/untitled-tld</a></li>
								<li class="fa-facebook"><a href="#">facebook.com/untitled-tld</a></li>
								<li class="fa-instagram"><a href="#">instagram.com/untitled-tld</a></li>
							</ul>
							<ul class="copyright">
								<li>&copy; Sporthub All rights reserved.</li>
							</ul>
						</div>
					</section>

			</div>

		<!-- Scripts -->
			<script src="assets/js/skel.min.js"></script>
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/jquery.scrollex.min.js"></script>
			<script src="assets/js/util.js"></script>
			<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
			<script src="assets/js/main.js"></script>
			<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.6/angular.min.js"></script>
			
			<script>
				var app = angular.module('App',[]);
				app.controller('signupCtrl', function($scope, $http, $window){
					var emailAvailable;
					var errorMsg;
					$scope.CheckEmail = function(){
						var data = $scope.email;
						var config = {
			                headers : {
			                    'Content-Type': 'application/json',
			                    'Accept': 'application/json'
			               	}
		                }
					   	$http({
						    method: 'POST',
						    url: '/webapp/webservice/createuser/emailcheck',
						    data: {'email': $scope.email},
						    headers: config.headers
						})
			            .success(function (data, status, headers, config) {
			                emailAvailable = data.available;
			            })
			            .error(function (data, status, header, config) {
			                errorMsg = errorMsg + "Data: " + data +
			                    "<hr />status: " + status +
			                    "<hr />headers: " + header +
			                    "<hr />config: " + config;
			            });
					}
					$scope.Signup = function(){
						//$scope.CheckEmail;
						//if($scope.FormValidatoin) return;
						var config = {
			                headers : {
			                    'Content-Type': 'application/json',
			                    'Accept': 'application/json'
			               	}
		                }
					   	$http({
						    method: 'POST',
						    url: '/webapp/webservice/createuser',
						    data: {'email': $scope.email, 'password': $scope.password, 'username': $scope.email},
						    headers: config.headers
						})
			            .success(function (data, status, headers, config) {
			            	//$scope.hello = data;
			            	//$window.location.href = "profile.html"
			            	$http.get('/webapp/webservice/profile').then(function(response){
			            		//$scope.hello = response.data;
			            		$window.location.href = "/webapp/profile";
			            	});
			            })
			            .error(function (data, status, header, config) {
			                errorMsg = errorMsg+"Data: " + data +
			                    "<hr />status: " + status +
			                    "<hr />headers: " + header +
			                    "<hr />config: " + config;
			            });
					}
					$scope.FormValidatoin = function(){
						return ($scope.email == null || $scope.password == null || $scope.confpass == null || $scope.password !== $scope.confpass || $scope.email.$valid ===false || !emailAvailable) ? true : false;
					}
				});
			</script>
	</body>
</html>