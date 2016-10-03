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
	<body ng-controller="myPlanCtrl">

		<!-- Page Wrapper -->
			<div id="page-wrapper">

				<!-- Header -->
					<header id="header">
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
								<li><a href="/homepage">Home</a></li>
								<li><a href="">Profile</a></li>
								<li><a href="">Plan Center</a></li>
								<li><a href="">Timeline</a></li>
								<li><a ng-click="Logout()">Logout</a></li>
							</ul>
							<a href="#" class="close">Close</a>
						</div>
					</nav>

				<!-- Wrapper -->
					<section id="wrapper">
						<header>
							<div class="inner">
								<h2>My plans</h2>
								<p>You have {{planNum}} plans</p>
							</div>
						</header>

						<!-- Content -->
						<div class="wrapper">
						<div class="inner">
						<!-- One -->
						<section>
										<h3 class="major">Table</h3>
										<div class="table-wrapper">
											<table>
												<thead>
													<tr>
														<th>Name</th>
														<th>Sport Type</th>
														<th>Create Date</th>
														<th>Complete</th>
													</tr>
												</thead>
												<tbody>
													<tr ng-repeat="x in myPlans">
														<td><a href="/webapp/plan/{{x.id}}">{{x.name}}</a></td>
														<td>{{x.sport}}</td>
														<td>{{x.createDate | date:'MM/dd/yyyy'}}</td>
														<td>{{CompleteStatus(x.complete)}}</td>
													</tr>
												</tbody>
											</table>
										</div>
						</section>

						<!-- Two -->
						<section id="two">
							<div class="inner">
								<a href="#" class="image"><img src="images/pic02.jpg" alt="" /></a>
								<div class="content">
									<h2 class="major">plans for others</h2>
									<p>This is description</p>
									<a href="#" class="special">Add new plan</a>
								</div>
							</div>
						</section>

						<!-- Three -->
						<section id="three">
							<div class="inner">
								<a href="#" class="image"><img src="images/pic03.jpg" alt="" /></a>
								<div class="content">
									<h2 class="major">Achievements</h2>
									<p>This is description</p>
									<a href="#" class="special">Learn more</a>
								</div>
							</div>
						</section>



							<!--
							<div class="wrapper">
								<div class="inner">

									<h3 class="major">Lorem ipsum dolor</h3>
									<p>Morbi mattis mi consectetur tortor elementum, varius pellentesque velit convallis. Aenean tincidunt lectus auctor mauris maximus, ac scelerisque ipsum tempor. Duis vulputate ex et ex tincidunt, quis lacinia velit aliquet. Duis non efficitur nisi, id malesuada justo. Maecenas sagittis felis ac sagittis semper. Curabitur purus leo donec vel dolor at arcu tincidunt bibendum. Interdum et malesuada fames ac ante ipsum primis in faucibus. Fusce ut aliquet justo. Donec id neque ipsum. Integer eget ultricies odio. Nam vel ex a orci fringilla tincidunt. Aliquam eleifend ligula non velit accumsan cursus. Etiam ut gravida sapien.</p>

									<p>Vestibulum ultrices risus velit, sit amet blandit massa auctor sit amet. Sed eu lectus sem. Phasellus in odio at ipsum porttitor mollis id vel diam. Praesent sit amet posuere risus, eu faucibus lectus. Vivamus ex ligula, tempus pulvinar ipsum in, auctor porta quam. Proin nec commodo, vel scelerisque nisi scelerisque. Suspendisse id quam vel tortor tincidunt suscipit. Nullam auctor orci eu dolor consectetur, interdum ullamcorper ante tincidunt. Mauris felis nec felis elementum varius.</p>

									<h3 class="major">Vitae phasellus</h3>
									<p>Cras mattis ante fermentum, malesuada neque vitae, eleifend erat. Phasellus non pulvinar erat. Fusce tincidunt, nisl eget mattis egestas, purus ipsum consequat orci, sit amet lobortis lorem lacus in tellus. Sed ac elementum arcu. Quisque placerat auctor laoreet.</p>

									<section class="features">
										<article>
											<a href="#" class="image"><img src="images/pic04.jpg" alt="" /></a>
											<h3 class="major">Sed feugiat lorem</h3>
											<p>Lorem ipsum dolor sit amet, consectetur adipiscing vehicula id nulla dignissim dapibus ultrices.</p>
											<a href="#" class="special">Learn more</a>
										</article>
										<article>
											<a href="#" class="image"><img src="images/pic05.jpg" alt="" /></a>
											<h3 class="major">Nisl placerat</h3>
											<p>Lorem ipsum dolor sit amet, consectetur adipiscing vehicula id nulla dignissim dapibus ultrices.</p>
											<a href="#" class="special">Learn more</a>
										</article>
									</section>

								</div>
							</div>
						-->
						</div>
					</div>

					</section>

				<!-- Footer -->
					<section id="footer">
						<div class="inner">
							<h2 class="major">Get in touch</h2>
							<p>Cras mattis ante fermentum, malesuada neque vitae, eleifend erat. Phasellus non pulvinar erat. Fusce tincidunt, nisl eget mattis egestas, purus ipsum consequat orci, sit amet lobortis lorem lacus in tellus. Sed ac elementum arcu. Quisque placerat auctor laoreet.</p>
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
				var app = angular.module('App', []);
				app.controller('myPlanCtrl', function($scope, $http, $filter, $window){
					var errorMsg;

					$scope.Logout = function(){
						$http.get("/webapp/webservice/common/logout").then(
								function success(data, status, headers, config){
									$window.location.href = "/webapp";
								}, function error(data, status, headers, config){
									alert(data);
								});
					}

					$scope.MyPlanFormValidatoin = function(){
						return ($scope.myPlanName == null || $scope.myPlanSportType == null) ? true : false;
					}

					$scope.AddMyPlan = function(){
						var config = {
			                headers : {
			                    'Content-Type': 'application/json',
			                    'Accept': 'application/json'
			               	}
		                }
					   	$http({
						    method: 'POST',
						    url: '/webapp/webservice/plan/createmyplan',
						    data: {'name': $scope.myPlanName, 'description': $scope.myPlanDescription,'sport': $scope.myPlanSportType, 'expireDate': $scope.myPlanExpiredDate},
						    headers: config.headers
						})
			            .success(function (data, status, headers, config) {
			            	//$scope.hello = data;
			            	//$window.location.href = "profile.html"
			            	$scope.PlanStatus = data;
			            })
			            .error(function (data, status, headers, config) {
			                errorMsg = errorMsg+"Data: " + data +
			                    "<hr />status: " + status +
			                    "<hr />headers: " + headers +
			                    "<hr />config: " + config;
			            });
					}

					$scope.CompleteStatus = function(complete){
						if(complete == 1){
							return "Completed";
						}else{
							return "Umcompleted";
						}
					}

					var getUserProfile = function(){
						var config = {
			                headers : {
			                    'Content-Type': 'application/json',
			                    'Accept': 'application/json'
			               	}
		                }
					   	$http({
						    method: 'GET',
						    url: '/webapp/webservice/profile',
						    headers: config.headers
						})
			            .success(function (data, status, headers, config) {
			            	profile = data;
							initWelcomeUsername();
			            })
			            .error(function (data, status, headers, config) {
			                errorMsg = errorMsg+"Data: " + data +
			                    "<hr />status: " + status +
			                    "<hr />headers: " + headers +
			                    "<hr />config: " + config;
			            });
					}
					var initWelcomeTime = function(){
						var hr = $filter('date')(new Date(), 'HH');
						if(hr >= 0 && hr < 12){
							$scope.welcome = 'Good Morning';
						}else if(hr >12 && hr < 18){
							$scope.welcome = 'Good Afternoon';
						}else{
							$scope.welcome = 'Good Evening';
						}
					}

					var initWelcomeUsername = function(){
						if (profile.nickanme) {
							$scope.userName = profile.nickanme;
						}else if(profile.username){
							$scope.userName = profile.username;
						}else{
							$scope.userName = profile.email;
						}
					}

					var getMyPlan = function(){
						var config = {
			                headers : {
			                    'Content-Type': 'application/json',
			                    'Accept': 'application/json'
			               	}
		                }
					   	$http({
						    method: 'GET',
						    url: '/webapp/webservice/plan/getmyplans',
						    headers: config.headers
						})
			            .success(function (data, status, headers, config) {
			            	//alert("data: "+data+", status: "+status+", headers: "+headers+", config: "+config);
			            	$scope.myPlans = data;
			            	$scope.plans = data[0];
			            })
			            .error(function (data, status, headers, config) {
			            	alert("data: "+data+", status: "+status+", headers: "+headers+", config: "+config);
			            });
					}

					var initPage = function(){
						//initWelcomeTime();
						//getUserProfile();
						getMyPlan();
					}


					initPage();
				});
			</script>
	</body>
</html>