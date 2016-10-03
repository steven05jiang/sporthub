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
		<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		<link rel="stylesheet" href="assets/css/main.css" />
		<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
		<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->

	</head>
	<body ng-controller="indexCtrl">
		<!-- Page Wrapper -->
			<div id="page-wrapper">

				<!-- Header -->
					<header id="header" class="alt">
						<h1><a href="#">Sporthub</a></h1>
						<div ng-switch="isLogin">
						<form id="loginForm" ng-switch-when="false">
							<div>
								<div class="logElement">
									<input type="text" name="loginusername" id="loginusername" value="" ng-model="$parent.loginusername" required  placeholder="Username" />
								</div>
								<div class="logElement">
									<input type="password" name="loginpassword" id="loginpassword" value="" ng-model="$parent.loginpassword" required placeholder="Password" />
								</div>
								<div class="logElement">
									<button type="submit"  ng-click="Login()"><span class="glyphicon glyphicon-log-in"></span></button>
								</div>
							</div>
						</form>
						<form id="logoutForm" ng-switch-when="true">
							<div class="logElement">
								<p>Hi {{userName}}!</p> 
							</div>
							<div class="logElement">
								<button type="submit"  ng-click="Logout()"><span class="glyphicon glyphicon-log-out"></span></button>
							</div>
						</form>
						</div>
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
								<li><a href="/webapp/profile" ng-show="isLogin">Profile</a></li>
								<li><a href="/webapp/myplans" ng-show="isLogin">Plan Center</a></li>
								<li><a id="MenuLogin" ng-hide="isLogin">Login</a></li>
								<li><a id="MenuLogout" ng-show="isLogin" ng-click="Logout()">Logout</a></li>
								<li><a id="MenuSignUp" ng-hide="isLogin" href="#four">Sign Up</a></li>
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
							<section id="four" class="wrapper alt style1" ng-hide="isLogin">
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

									</div>
							</section>
					</section>

				<!-- Footer -->
					<section id="footer">
						<div class="inner">
							<h2 class="major">CONTACT US</h2>
							<p>If there is any suggestion, Please contact us via one of below contact method.</p>
							<ul class="contact">
								<li class="fa-home">
									Sporthub Inc<br />
									36 Dartmouth St.<br />
									Malden, MA 02148
								</li>
								<li class="fa-phone">(000) 000-0000</li>
								<li class="fa-envelope"><a href="#">steven05jiang@gmail.com</a></li>
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
				app.controller('indexCtrl', function($scope, $http, $window){
					var emailAvailable;
					var errorMsg;
					var profile;
					$scope.CheckEmail = function(){
						var data = $scope.email;
						var config = {
			                headers : {
			                    //'Content-Type': 'application/json',
			                    //'Accept': 'application/json'
			                    'Content-Type': 'application/x-www-form-urlencoded'
			               	}
		                }
					   	$http({
						    method: 'GET',
						    url: '/webapp/webservice/createuser/emailcheck',
						    params: {'email': $scope.email},
						    headers: config.headers
						})
			            .success(function (data, status, headers, config) {
			                emailAvailable = data.available;
			            })
			            .error(function (data, status, headers, config) {
			                errorMsg = errorMsg + "Data: " + data +
			                    "<hr />status: " + status +
			                    "<hr />headers: " + headers +
			                    "<hr />config: " + config;
			                $scope.hello = errorMsg;
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
			            .error(function (data, status, headers, config) {
			                errorMsg = errorMsg+"Data: " + data +
			                    "<hr />status: " + status +
			                    "<hr />headers: " + headers +
			                    "<hr />config: " + config;
			            });
					}
					$scope.FormValidatoin = function(){
						return ($scope.email == null || $scope.password == null || $scope.confpass == null || $scope.password !== $scope.confpass || $scope.email.$valid ===false || !emailAvailable) ? true : false;
					}

					$scope.Logout = function(){
						$http.get("/webapp/webservice/common/logout").then(
								function success(data, status, headers, config){
									$window.location.href = "/webapp";
								}, function error(data, status, headers, config){
									alert(data);
								});
					}

					$scope.Login = function(){
						var config = {
			                headers : {
			                    'Content-Type': 'application/json',
			                    'Accept': 'application/json'
			               	}
		                }
					   	$http({
						    method: 'POST',
						    url: '/webapp/webservice/common/login',
						    params: {'username': $scope.loginusername, 'password': $scope.loginpassword},
						    headers: config.headers
						})
			            .success(function (data, status, headers, config) {
			            	CheckLoginStatus();
			            })
			            .error(function (data, status, headers, config) {
			                errorMsg = "Data: " + data +
			                    "<hr />status: " + status +
			                    "<hr />headers: " + headers +
			                    "<hr />config: " + config;
			            });
					}

					var initWelcomeUsername = function(){
						if (profile.nickanme) {
							$scope.userName = profile.nickanme;
						}else if(profile.username){
							$scope.userName = profile.username;
						}
					}

					var CheckLoginStatus = function(){
						$http.get('/webapp/webservice/common/islogin').then(function(response){
								if(response.data.isLogin == true){
									$scope.isLogin = true;
									$http.get('/webapp/webservice/profile').then(function(response){
										profile = response.data;
										initWelcomeUsername();
			            	});
								}else{
									$scope.isLogin = false;
								}
			            	}, function(response){
			            			$scope.isLogin = false;
			            	});
					}

					CheckLoginStatus();
				});
			</script>
	</body>
</html>